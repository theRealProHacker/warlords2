
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_67a7_0000(int param_1,int param_2)

{
  byte *pbVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 *puVar4;
  uint uVar5;
  undefined2 uVar6;
  undefined4 uVar7;
  undefined1 auStack_e [2];
  int iStack_c;
  int iStack_a;
  uint uStack_8;
  undefined2 uStack_6;
  undefined2 uStack_4;
  
  DAT_451b_01fe = param_1;
  DAT_451b_01fc = param_2;
  if (DAT_451b_1f02 == (undefined2 *)0x0) {
    return;
  }
  uStack_8 = (uint)*(byte *)(param_2 * 0xe0 + param_1 * 2);
  if (((DAT_451b_1e9c != 2) && (*(int *)(*(char *)(uStack_8 + 0x710) * 2 + 0x1274) < 1)) &&
     ((*(byte *)(param_2 * 0x70 + param_1) & 0x1f) == 0)) {
    thunk_FUN_7d9f_0b5f();
    return;
  }
  iVar2 = thunk_FUN_824f_044a(param_1,param_2);
  uVar5 = *(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0xf;
  if (((DAT_3c04_011c != 0) && (uVar5 != 0xf)) &&
     (((*(byte *)(DAT_3c04_0110 * 8 + uVar5 + 0x153b) & 3) == 0 ||
      ((0 < iVar2 && ((*(byte *)(DAT_3c04_0110 * 8 + uVar5 + 0x153b) & 3) == 1)))))) {
    uVar6 = thunk_FUN_7e8f_04f0(0x4008c,0x6b,0x4024,0x70,0x4024);
    uVar6 = thunk_FUN_7e8f_04f0(0x3008c,uVar6,uVar5);
    uVar6 = thunk_FUN_7e8f_04f0(0x2008c,uVar6,uVar5);
    uVar6 = thunk_FUN_7e8f_04f0(0x1008c,uVar6,uVar5);
    uVar6 = thunk_FUN_7e8f_04f0(0x8c,uVar6,uVar5);
    thunk_FUN_7b13_0088(uVar6,uVar5);
    return;
  }
  thunk_FUN_824f_0af3();
  uVar6 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
  uStack_4 = *DAT_451b_1f02;
  uStack_6 = ((undefined2 *)DAT_451b_1f02)[1];
  if (((DAT_4125_2bda != 0) && (DAT_451b_1ea0 < 1)) ||
     ((DAT_4125_2bda == 0 && (*(char *)((int)(undefined2 *)DAT_451b_1f02 + 7) < '\x01')))) {
    FUN_1b62_08b3();
    thunk_FUN_899d_0356();
    return;
  }
  uStack_8 = (uint)*(byte *)(param_2 * 0xe0 + param_1 * 2);
  if (*(int *)(*(char *)(uStack_8 + 0x710) * 2 + 0x1274) < 2) {
    DAT_451b_0200 = 2;
  }
  else {
    DAT_451b_0200 = *(undefined2 *)(*(char *)(uStack_8 + 0x710) * 2 + 0x1274);
  }
  uVar6 = 0x3c04;
  if ((*(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0xf) == DAT_3c04_0110) {
    return;
  }
  if ((*(char *)(uStack_8 + 0x710) != '\n') &&
     ((*(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0x10) == 0)) {
    return;
  }
  FUN_67a7_1836();
  FUN_67a7_0522(param_1,param_2,uStack_4,uStack_6);
  thunk_FUN_6a62_008b(param_1,param_2);
  if (_DAT_451b_027d != 0) {
    pbVar1 = (byte *)((int)_DAT_451b_027d + 0x30);
    *pbVar1 = *pbVar1 | *(byte *)(DAT_3c04_0110 * 2 + 0xcbe);
  }
  iStack_a = FUN_67a7_08a6();
  thunk_FUN_5d9f_09d7(param_1,param_2,(undefined2 *)&DAT_451b_0386,0x4125,
                      (undefined4 *)&DAT_451b_0366,0x4125);
  FUN_22bf_07a5();
  thunk_FUN_6a0f_0160();
  thunk_FUN_6a0f_0094(0,iStack_a);
  FUN_22bf_0757();
  thunk_FUN_824f_0000();
  if (iStack_a == 1) {
    if (*(char *)(uStack_8 + 0x710) == '\n') {
      if (DAT_451b_0252 != 0) {
        uVar3 = thunk_FUN_7e8f_04f0(0xffff008d);
        thunk_FUN_6a0f_04c5(uVar3,uVar6);
      }
      if (DAT_451b_1efe == 0) {
        iVar2 = DAT_451b_029a * 0x14;
      }
      else {
        iVar2 = *(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223;
      }
      uVar6 = 0x3c04;
      FUN_1000_4a70(0x4148,0x4125,iVar2,0x3c04);
      iVar2 = thunk_FUN_824f_044a(param_1,param_2);
      FUN_1000_4a70(0x4134,0x4125,iVar2 * 0x41 + 0x1581,0x3c04);
      if (DAT_451b_1efe != 0) {
        uVar3 = thunk_FUN_7e8f_04f0(0x8e,*(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223,0x3c04);
        FUN_1000_4944(0x4162,0x4125,uVar3,uVar6);
        uVar7 = 0x41254162;
        goto LAB_67a7_042d;
      }
      uVar7 = 0x8f;
    }
    else if (DAT_451b_1efe == 0) {
      uVar7 = 0x91;
    }
    else {
      uVar3 = thunk_FUN_7e8f_04f0(0x90,*(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223,0x3c04);
      FUN_1000_4944(0x4162,0x4125,uVar3,uVar6);
      thunk_FUN_6a0f_04c5(0x4162,0x4125);
      uVar7 = 0x10090;
    }
  }
  else {
    uVar7 = 0x92;
  }
  uVar3 = thunk_FUN_7e8f_04f0(uVar7);
  uVar7 = CONCAT22(uVar6,uVar3);
LAB_67a7_042d:
  thunk_FUN_6a0f_04c5(uVar7);
  iStack_c = FUN_67a7_0a6b();
  thunk_FUN_6a0f_04f6();
  thunk_FUN_830b_0000(0x10001,0);
  if (iStack_a == 1) {
    pbVar1 = (byte *)(param_2 * 0xe0 + param_1 * 2 + 1);
    *pbVar1 = *pbVar1 | 0x10;
    puVar4 = (undefined2 *)FUN_1b62_007d(param_1,param_2,auStack_e);
    DAT_451b_1f02 = (undefined2 *)CONCAT22(uVar6,puVar4);
    thunk_FUN_8bc3_06eb(puVar4,uVar6);
  }
  FUN_67a7_2274();
  thunk_FUN_8027_011f();
  if (iStack_c == 0x21) {
    iVar2 = thunk_FUN_4974_1ded();
    if (iVar2 == 0) {
      FUN_67a7_04f7();
    }
  }
  else {
    iVar2 = thunk_FUN_4974_1ded();
    if (iVar2 == 0) {
      thunk_FUN_899d_0356();
      thunk_FUN_8027_0174();
    }
  }
  return;
}

