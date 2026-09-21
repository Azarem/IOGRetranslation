/**
 * Static ROM package generator
 * 
 * Reads engine metadata from @gaialabs/iog-baserom, base ROM files from
 * the baserom package, project module files from ./modules/, and the
 * manifest from ./modules/manifest.json. Outputs two static JSON files
 * to site/public/data/ for the GitHub Pages ROM builder site.
 * 
 * Usage: node scripts/generate-package.ts
 */

import { readFileSync, writeFileSync, mkdirSync, readdirSync, statSync, existsSync } from 'fs';
import { join, extname, resolve } from 'path';
import { createHash } from 'crypto';
import { db } from '@gaialabs/iog-baserom';
import { listDirectory, readFileAsText, readFileAsBinary, encodeBase64 } from '@gaialabs/core';
import type { DbFileType } from '@gaialabs/core';
import type { PackageSummary, PackageFileEntry } from '@gaialabs/core';

const RELEASE_ROM_CRC = 0x1C3848C0;
const PROJECT_NAME = 'Illusion of Gaia: Retranslated';

const BASEROM_PATH = join(process.cwd(), 'node_modules/@gaialabs/iog-baserom/baserom');
const MODULES_PATH = join(process.cwd(), 'modules');
const MANIFEST_PATH = join(MODULES_PATH, 'manifest.json');
const OUTPUT_DIR = join(process.cwd(), 'site/public/data');

const fileTypes = db.fileTypes as Record<string, Partial<DbFileType>>;

async function collectBaseRomFiles(): Promise<PackageFileEntry[]> {
  const entries: PackageFileEntry[] = [];
  const items = await listDirectory(BASEROM_PATH, { recursive: true });

  for (const item of items) {
    if (!item.isFile || !item.extension) continue;

    const typeEntry = Object.entries(fileTypes).find(([, v]) => v.extension === item.extension);
    if (!typeEntry) continue;

    const [typeName, typeDef] = typeEntry;

    if (typeDef.isBlock || typeDef.isPatch || typeDef.struct) {
      const text = await readFileAsText(item.path);
      entries.push({
        name: item.name,
        type: typeName,
        text,
      });
    } else {
      const binary = await readFileAsBinary(item.path);
      entries.push({
        name: item.name,
        type: typeName,
        data: encodeBase64(binary),
      });
    }
  }

  return entries;
}

async function collectProjectFiles(): Promise<PackageFileEntry[]> {
  const entries: PackageFileEntry[] = [];
  const modules = (await listDirectory(MODULES_PATH)).filter(item => item.isDirectory);

  for (const mod of modules) {
    const moduleFiles = (await listDirectory(mod.path, { recursive: true })).filter(item => item.isFile);

    for (const file of moduleFiles) {
      if (!file.extension) continue;

      const typeEntry = Object.entries(fileTypes).find(([, v]) => v.extension === file.extension);
      if (!typeEntry) continue;

      const [typeName, typeDef] = typeEntry;

      if (typeDef.isBlock || typeDef.isPatch || typeDef.struct) {
        const text = await readFileAsText(file.path);
        entries.push({
          name: file.name,
          type: typeName,
          text,
          module: mod.name,
        });
      } else {
        const binary = await readFileAsBinary(file.path);
        entries.push({
          name: file.name,
          type: typeName,
          data: encodeBase64(binary),
          module: mod.name,
        });
      }
    }
  }

  return entries;
}

const IMAGES_DIR = join(process.cwd(), 'site/public/images');

/**
 * Walk the manifest modules tree and collect every `image` reference.
 * Returns a flat array of image filenames.
 */
function collectImageReferences(modules: any[]): string[] {
  const images: string[] = [];

  for (const category of modules) {
    if (!category.groups || !Array.isArray(category.groups)) continue;
    for (const group of category.groups) {
      if (!group.options || !Array.isArray(group.options)) continue;
      for (const option of group.options) {
        if (option.image) {
          images.push(option.image);
        }
      }
    }
  }

  return images;
}

/**
 * Validate that every image referenced in the manifest exists on disk.
 * Logs a summary and returns false if any are missing.
 */
function validateImages(modules: any[]): boolean {
  const referenced = collectImageReferences(modules);
  const unique = [...new Set(referenced)];

  if (unique.length === 0) {
    console.log('  No image references found in manifest');
    return true;
  }

  const missing: string[] = [];
  const found: string[] = [];

  for (const image of unique) {
    const imagePath = join(IMAGES_DIR, image);
    if (existsSync(imagePath)) {
      const size = (statSync(imagePath).size / 1024).toFixed(1);
      found.push(`${image} (${size} KB)`);
    } else {
      missing.push(image);
    }
  }

  console.log(`  Referenced images: ${unique.length}`);
  for (const f of found) {
    console.log(`    ✅ ${f}`);
  }

  if (missing.length > 0) {
    console.warn(`  ⚠️  Missing images (${missing.length}):`);
    for (const m of missing) {
      console.warn(`    ❌ ${m}`);
    }
    return false;
  }

  // Check for unreferenced images in the images directory
  if (existsSync(IMAGES_DIR)) {
    const onDisk = readdirSync(IMAGES_DIR).filter(f => /\.(png|jpe?g|gif|webp)$/i.test(f));
    const unreferenced = onDisk.filter(f => !unique.includes(f));
    if (unreferenced.length > 0) {
      console.log(`  📎 Unreferenced images on disk (${unreferenced.length}):`);
      for (const u of unreferenced) {
        console.log(`    ▪ ${u}`);
      }
    }
  }

  return true;
}

async function main() {
  console.log('Generating static ROM package...');

  const manifest = JSON.parse(readFileSync(MANIFEST_PATH, 'utf-8'));

  console.log('Collecting base ROM files...');
  const baseRomFiles = await collectBaseRomFiles();
  console.log(`  Found ${baseRomFiles.length} base ROM files`);

  console.log('Collecting project module files...');
  const projectFiles = await collectProjectFiles();
  console.log(`  Found ${projectFiles.length} project files`);

  console.log('Validating manifest images...');
  const imagesValid = validateImages(manifest.modules);
  if (!imagesValid) {
    console.warn('⚠️  Some referenced images are missing — the site will show broken thumbnails for those options');
  }

  // Build summary.json (packageHash is set after rom-package.json is written)
  const summary: PackageSummary = {
    projectName: PROJECT_NAME,
    version: manifest.name,
    notes: manifest.notes,
    modules: manifest.modules,
    crc: RELEASE_ROM_CRC,
    fileTypes: db.fileTypes,
    packageHash: '',
  };

  // Build rom-package.json (DbGameRomModule-compatible)
  const romPackage = {
    baseRomFiles,
    projectFiles,
    mnemonics: db.mnemonics,
    overrides: db.overrides,
    rewrites: db.rewrites,
    blocks: db.blocks,
    files: db.files,
    config: db.config,
    labels: db.labels,
    structs: db.structs,
    copdef: db.copdef,
    strings: db.strings,
    transforms: db.transforms,
    groups: db.groups,
    fileTypes: db.fileTypes,
    addrModes: db.addrModes,
    headers: db.headers,
    names: db.names,
    types: db.types,
  };

  // Write output
  mkdirSync(OUTPUT_DIR, { recursive: true });

  // Write rom-package.json first so we can hash it
  const packagePath = join(OUTPUT_DIR, 'rom-package.json');
  const packageContent = JSON.stringify(romPackage);
  writeFileSync(packagePath, packageContent);
  const packageSize = (statSync(packagePath).size / 1024).toFixed(1);

  // Compute content hash for cache-busting
  const packageHash = createHash('sha256').update(packageContent).digest('hex').slice(0, 12);
  summary.packageHash = packageHash;

  const summaryPath = join(OUTPUT_DIR, 'summary.json');
  writeFileSync(summaryPath, JSON.stringify(summary));
  const summarySize = (statSync(summaryPath).size / 1024).toFixed(1);

  console.log(`Wrote ${summaryPath} (${summarySize} KB)`);
  console.log(`Wrote ${packagePath} (${packageSize} KB, hash: ${packageHash})`);

  console.log('Static ROM package generation complete.');
}

main().catch((e) => {
  console.error('Package generation failed:', e);
  process.exit(1);
});
