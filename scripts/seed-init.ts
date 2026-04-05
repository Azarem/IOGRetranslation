import 'dotenv/config';
import { PrismaClient } from '@gaialabs/core/prisma';
import { crc32_buffer, readFileAsBinary, crc32_text_utf8, readFileAsText, listDirectory, DbFileType } from '@gaialabs/core';
import { createId } from '@paralleldrive/cuid2';
import { PrismaPg } from '@prisma/adapter-pg';

const prisma = new PrismaClient({
  adapter: new PrismaPg({ connectionString: process.env.DATABASE_URL }),
});

// --- Database Path Configuration ---
const RXLT_PATH = './modules';

// --- Game and Release Master Data ---
const GAME_TITLE = 'Illusion of Gaia';
const BASE_ROM_NAME = 'GaiaLabs BaseROM';

const PROJECT_NAME = 'Illusion of Gaia: Retranslated';



async function main() {
  try {
        
    console.log('Starting seed process...');


    console.log('Clearing existing game data...');
      
    await prisma.projectBranchFile.deleteMany({});
    await prisma.projectBranch.deleteMany({});
    await prisma.projectFile.deleteMany({});
    await prisma.project.deleteMany({});
    // await prisma.baseRomBranchFile.deleteMany({});
    // await prisma.baseRomFile.deleteMany({});
    // await prisma.baseRomBranch.deleteMany({});
    // await prisma.baseRom.deleteMany({});
    // await prisma.gameRomBranchArtifact.deleteMany({});
    // await prisma.gameRomBranch.deleteMany({});
    // await prisma.gameRomArtifact.deleteMany({});
    // await prisma.gameRom.deleteMany({});
    // await prisma.game.deleteMany({});
    // await prisma.developer.deleteMany({});
    // await prisma.region.deleteMany({});
    // await prisma.platformBranch.deleteMany({});
    // await prisma.platform.deleteMany({});
    
    console.log('Game data cleared.');

    const game = await prisma.game.findFirst({
      where: {
        name: GAME_TITLE
      }
    });

    const baseRom = await prisma.baseRom.findFirst({
      where: {
        name: BASE_ROM_NAME,
        gameId: game!.id
      }
    });

    const baseRomBranch = await prisma.baseRomBranch.findFirst({
      where: {
        baseRomId: baseRom!.id,
        isActive: true
      }
    });
    
    const gameRomBranch = await prisma.gameRomBranch.findFirst({
      where: {
        id: baseRomBranch!.gameRomBranchId
      }
    });

    await createProject(game!.id, baseRom!.id, baseRomBranch!.id, gameRomBranch!.fileTypes);

    console.log('Seed process finished successfully.');
  } finally {
    await prisma.$disconnect();
  }
}

async function createProject(gameId: string, baseRomId: string, baseRomBranchId: string, fileTypes: any){
  console.log('Creating project');
  const projectId = createId();
  await prisma.project.create({
    data: {
      id: projectId,
      name: PROJECT_NAME,
      gameId: gameId,
      baseRomId: baseRomId,
      meta: { },
    },
  });

  // Create project branch
  const projectBranchId = createId();
  await prisma.projectBranch.create({
    data: {
      id: projectBranchId,
      projectId: projectId,
      baseRomBranchId: baseRomBranchId,
      name: '1.44',
      version: 3,
      isActive: true,
      notes: [
        'Added: Brazilian Portuguese retranslation by Igor Chagas'
      ],
      modules: [ {
        name: '🔤 Language', groups: [
          { name: null, options: [
            { name: 'English', module: null, description: 'English retranslation by LThammy and ViewtifulSlayer', default: true },
            { name: 'Portuguese', module: 'ichagas', description: 'Brazilian Portuguese retranslation by Igor Chagas' },
          ] }
        ] },
        { name: '🎨 Title Screen', groups: [
          { name: null, options: [
            { name: 'NA Original', module: null, description: 'The original North American title screen' },
            { name: 'Enhanced', module: 'title-enhanced', description: 'Enhanced NA title screen with JP comet background', default: true },
            { name: 'Hybrid', module: 'title-alternate', description: 'Hybrid JP title screen with NA title text' },
            { name: 'Demo', module: 'title-demo', description: 'Demo title screen with JP comet background' }
          ] }
        ] },
        { name: '🏯 JP Content', groups: [
          { name: 'Edward Castle Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-edward-mountains', default: true },
          ] },
          { name: 'Itory Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-itory-mountains', default: true },
          ] },
          { name: 'Great Wall Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-wall-dunes', default: true },
          ] },
          { name: 'Fountain Color', options: [
            { name: 'NA (Brown)', module: null },
            { name: 'JP (Red)', module: 'red-fountain', default: true },
          ] },
          { name: 'Viper Boss', options: [
            { name: 'NA', module: null, default: true },
            { name: 'JP', module: 'jp-viper' },
          ] },
          { name: 'Church Cross/Statue', options: [
            { name: 'NA (Statue)', module: null },
            { name: 'JP (Cross)', module: 'jp-church-cross', default: true },
          ] },
          { name: 'Diamond Mines', options: [
            { name: 'NA (Brown)', module: null, default: true },
            { name: 'JP (Purple)', module: 'jp-mines' }
          ] },
          { name: 'Prologue Palettes', options: [
            { name: 'NA (Light)', module: null },
            { name: 'JP (Dark)', module: 'jp-prologue-palettes', default: true }
          ] }
        ] },
        { name: '⚡ Quality of Life', groups: [
          { name: 'Prologue / Overworld Text', options: [
            { name: 'Enhanced', module: 'enhanced-prologue-text', default: true },
          ] },
          { name: 'Epilogue Text (Comet scene)', options: [
            { name: 'Original (Boxed)', module: null },
            { name: 'No dialog box/borders', module: 'enhanced-epilogue-text', default: true },
          ] },
          { name: 'Herb Heals', options: [
            { name: '+8 HP', module: null },
            { name: 'Full HP', module: 'full-health-herb', default: true },
          ] },
          { name: 'Pyramid Elevator Speed', options: [
            { name: '1x', module: null },
            { name: '2x', module: 'pyramid-elevator-speed', default: true },
          ] },
          { name: 'Pyramid Portal Exit', options: [
            { name: 'Original', module: null },
            { name: 'Altered', module: 'pyramid-portal-exit', description: 'Portals will take you to the lower main area. Lower portal brings you to the top.', default: true },
          ] },
          { name: 'Shortcut from Mines to Freejia', options: [
            { name: 'No', module: null },
            { name: 'Yes', module: 'freejia-shortcut', description: 'Sam will offer to take you to Freejia, skipping the return trip.', default: true },
          ] },
        ] },
        { name: '📚 Cut Content', groups: [
          { name: 'Sky Delivery Man', options: [
            { name: 'Enable', module: null, description: 'The Sky Deliveryman will appear in Watermia, South Cape, and Freejia.', default: true },
          ] },
          { name: 'Blue Journal', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'blue-journal', default: true },
          ] },
        ] },
        { name: '✨ Extras', groups: [
          { name: 'Thankful Flower', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'thankful-flower', default: true },
          ] },
          { name: 'South Cape Return', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'south-cape-return', default: true },
          ] },
          { name: 'Crystal Ring Palette', options: [
            { name: 'Original', module: null },
            { name: 'New', module: 'crystal-ring-palette', default: true },
          ] },
          { name: 'Border Graphics', options: [
            { name: 'Enhanced', module: null, default: true },
            { name: 'Plain', module: 'plain-borders' },
          ] },
          { name: 'No Shira Spotlight', options: [
            { name: 'Disable', module: null, default: true },
            { name: 'Enable', module: 'no-shira-spotlight' },
          ] }
        ] }
      ]
    },
  });

  // Create project files
  const fileIds = await createAllProjectFiles(projectId, fileTypes);

  // Create project branch files
  await prisma.projectBranchFile.createMany({
    data: fileIds.map(fileId => ({
      id: createId(),
      branchId: projectBranchId,
      fileId: fileId
    }))
  });
}

async function createAllProjectFiles(projectId: string, fileTypes: Record<string, any>){

  const fileIds: string[] = [];
  const modules = (await listDirectory(RXLT_PATH)).filter(item => item.isDirectory);

  for(const module of modules){
    const moduleFiles = (await listDirectory(module.path, { recursive: true })).filter(item => item.isFile);
    for(const moduleFile of moduleFiles){
      const fileId = await createProjectFile(projectId, moduleFile, fileTypes, module.name);
      if(fileId) fileIds.push(fileId);
    }
  }

  return fileIds;
}

async function createProjectFile(projectId: string, file: any, fileTypes: Record<string, Partial<DbFileType>>, module?: string) : Promise<string | null>{

  let crc: number | undefined;
  let text: string | undefined;
  let data: Uint8Array | undefined;
  let isText: boolean = false;

  let typeEntry = Object.entries(fileTypes).find((value) => value[1].extension === file.extension);
  if(!typeEntry) return null;

  if(typeEntry[1].isBlock || typeEntry[1].isPatch) {
    text = await readFileAsText(file.path);
    crc = crc32_text_utf8(text);
    isText = true;
  } else {
    data = await readFileAsBinary(file.path);
    crc = crc32_buffer(data);
  }

  console.log('Creating project file for ' + file.name + ' with crc ' + crc);
  const id = createId();
  await prisma.projectFile.create({
    data: {
      id,
      projectId,
      name: file.name,
      type: typeEntry[0],
      crc,
      data: data as Uint8Array<ArrayBuffer>,
      isText,
      text,
      module,
    },
  });
  return id;
}


main()
  .catch((e) => {
    console.error('An error occurred during the seed process:');
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  }); 

//export default main;