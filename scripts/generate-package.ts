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

import { readFileSync, writeFileSync, mkdirSync, readdirSync, statSync } from 'fs';
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

async function main() {
  console.log('Generating static ROM package...');

  const manifest = JSON.parse(readFileSync(MANIFEST_PATH, 'utf-8'));

  console.log('Collecting base ROM files...');
  const baseRomFiles = await collectBaseRomFiles();
  console.log(`  Found ${baseRomFiles.length} base ROM files`);

  console.log('Collecting project module files...');
  const projectFiles = await collectProjectFiles();
  console.log(`  Found ${projectFiles.length} project files`);

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
