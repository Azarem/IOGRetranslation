import { describe, expect, it } from 'vitest';
import { readFileAsBinary, saveFileAsBinary } from '@gaialabs/core';
import { RomGenerator } from '@gaialabs/core';
import { db } from '../../../gaia-iog-baserom'

const OUT_PATH = './generated';
const MODULE_PATH = './modules';
const BASE_ROM_PATH = '../../gaia-iog-baserom/baserom';
const projectName = 'Illusion of Gaia: Retranslated';
const CRC = 0x1C3848C0;

describe('RomGenerator', async () => {
  const data = await readFileAsBinary('C:/Games/SNES/Illusion of Gaia.smc');
  const modules = [
    "base",
    "ichagas",
    "title-enhanced",
    "jp-edward-mountains",
    "jp-itory-mountains",
    "jp-wall-dunes",
    "red-fountain",
    "jp-church-cross",
    "jp-prologue-palettes",
    "enhanced-prologue-text",
    "enhanced-epilogue-text",
    "full-health-herb",
    "pyramid-elevator-speed",
    "pyramid-portal-exit",
    "freejia-shortcut",
    "blue-journal",
    "thankful-flower",
    "south-cape-return",
    "crystal-ring-palette"
];
  let romGenerator: RomGenerator;
  
  describe('Constructor', () => {
    it('should create a rom generator which downloads project summary', () => {
      romGenerator = new RomGenerator(projectName, CRC);
      expect(romGenerator).toBeDefined();
    });

    // it('should be able to initialize', async () => {
    //   await romGenerator.initialize();
    //   expect(romGenerator.branchId).toBeDefined();
    //   expect(romGenerator.crc).toBeDefined();
    // });
  });

  describe('ValidateAndDownload', () => {
    it('should validate and download the project database', async () => {
      const database = db;
      const isValid = await romGenerator.validateAndLoad(data, database, BASE_ROM_PATH, MODULE_PATH);
      expect(isValid).toBe(true);
      expect(romGenerator.dbRoot).toBeDefined();
      expect(romGenerator.dbRoot.baseRomFiles?.length).toBeGreaterThan(0);
      expect(romGenerator.dbRoot.projectFiles?.length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.opCodes ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.opLookup ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.addrLookup ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.stringTypes ?? {}).length).toBeGreaterThan(0);
    });
  });

  describe('GenerateProject', () => {
    it('should generate a rom from project parameters', async () => {
      const outRom = await romGenerator.generateProject(modules);
      await saveFileAsBinary(`${OUT_PATH}/Illusion of Gaia_ Retranslated.smc`, outRom);
    });
  }, 30000);
}); 