import { extract as extractInternal, rebuild as rebuildInternal } from '@gaialabs/iog-baserom';


export async function extract(romPath: string, outPath: string) {
    await extractInternal(romPath, outPath);
}

export async function rebuild(inPath: string, outPath: string) {  
    const modules = [ 
        './modules/base',
        //'./modules/ichagas',
        './modules/title-enhanced',
        './modules/red-fountain',
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
        './modules/angkor-shortcut',
        './modules/blue-journal',
        './modules/crystal-ring-palette',
        './modules/south-cape-return',
        './modules/full-health-herb',
        //'./modules/plain-borders',
        './modules/debug-menu',
        './modules/dungeon-map',
        //'./modules/minimap-v2',
        './modules/walkable-world-map',
        './modules/apocalypse-gaia',
        //'./modules/widescreen'
    ];
    await rebuildInternal(inPath, outPath, null, modules, ["artifacts"]);
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
