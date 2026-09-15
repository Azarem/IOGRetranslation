import { extract as extractInternal, rebuild as rebuildInternal } from '@gaialabs/iog-baserom';

// import config from '../us/config.json' with { type: 'json' };
// import blocks from '../us/blocks.json' with { type: 'json' };
// import copdef from '../us/copdef.json' with { type: 'json' };
// import files from '../us/files.json' with { type: 'json' };
// import groups from '../us/groups.json' with { type: 'json' };
// import labels from '../us/labels.json' with { type: 'json' };
// import mnemonics from '../us/mnemonics.json' with { type: 'json' };
// import overrides from '../us/overrides.json' with { type: 'json' };
// import rewrites from '../us/rewrites.json' with { type: 'json' };
// import strings from '../us/stringTypes.json' with { type: 'json' };
// import structs from '../us/structs.json' with { type: 'json' };
// import transforms from '../us/transforms.json' with { type: 'json' };
// import fileTypes from '../us/fileTypes.json' with { type: 'json' };

// export const db : DbGameRomModule = {
//     mnemonics,
//     overrides: overrides as unknown as Record<string, Record<string, number>>,
//     rewrites: rewrites as unknown as Record<number, number>,
//     blocks: blocks as unknown as Record<string, Record<string, Partial<DbBlock>>>,
//     copdef: copdef as unknown as Record<string, Partial<CopDef>>,
//     files: files as unknown as Record<string, Record<string, Record<string, Partial<DbFile>>>>,
//     groups: groups as unknown as Record<string, Partial<DbGroup>>,
//     labels: labels as unknown as Record<number, string>,
//     strings: strings as unknown as Record<string, Partial<DbStringType>>,
//     structs: structs as unknown as Record<string, DbStruct>,
//     transforms: transforms as unknown as Record<string, Partial<DbTransform>[]>,
//     config: config as unknown as DbConfig,
//     fileTypes: fileTypes as unknown as Record<string, Partial<DbFileType>>,
//     addrModes: snes.addressingModes as unknown as Record<string, Partial<DbAddressingMode>>,
//     headers: snes.headers
// };

export async function extract(romPath: string, outPath: string) {
    await extractInternal(romPath, outPath);
}

export async function rebuild(inPath: string, outPath: string) {  
    const modules = [ 
        './modules/base',
        './modules/title-enhanced',
        './modules/thankful-flower',
        './modules/red-fountain',
        './modules/pyramid-elevator-speed',
        './modules/pyramid-portal-exit',
        './modules/kress-shortcut',
        './modules/jp-wall-dunes',
        './modules/jp-prologue-palettes',
        './modules/jp-itory-mountains',
        './modules/jp-edward-mountains',
        './modules/jp-church-cross',
        './modules/freejia-shortcut',
        './modules/freejia-slave-return',
        './modules/enhanced-adrift-text',
        './modules/enhanced-epilogue-text',
        './modules/enhanced-prologue-text',
        './modules/angkor-shortcut',
        './modules/blue-journal',
        './modules/crystal-ring-palette',
        //'./modules/widescreen'
    ];
    await rebuildInternal(inPath, outPath, null, modules);
}

// CLI handler - only execute when run directly (not when imported as a module)
// Check if this module is being run directly
const isMainModule = process.argv[1]?.includes('index.ts') || process.argv[1]?.includes('index.js');

if (isMainModule) {
    const command = process.argv[2];
    const args = process.argv.slice(3);

    (async () => {
        try {
            switch (command) {
                case 'extract':
                    await extract(args[0], args[1]);
                    break;
                case 'rebuild':
                    await rebuild(args[0], args[1]);
                    break;
                default:
                    console.error('Unknown command:', command);
                    console.log('Available commands: extractRom, rebuildRom');
                    process.exit(1);
            }
        } catch (error) {
            console.error('Error:', error);
            process.exit(1);
        }
    })();
}
