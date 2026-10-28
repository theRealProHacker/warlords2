
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 * __cdecl16far FUN_67a7_124a(int param_1,int param_2,int param_3)

{
  char *pcVar1;
  byte *pbVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  bool bVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  undefined2 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  
  uVar8 = *(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0xf;
  DAT_451b_01fe = param_1;
  DAT_451b_01fc = param_2;
  if ((DAT_3c04_0159 == 0) && ((7 < uVar8 || (*(int *)(uVar8 * 2 + 0xd0) != 0)))) {
    bVar5 = false;
  }
  else {
    bVar5 = true;
  }
  if (((DAT_3c04_0159 == 0) || (7 < uVar8)) && ((7 < uVar8 || (*(int *)(uVar8 * 2 + 0xd0) != 0)))) {
    bVar7 = false;
  }
  else {
    bVar7 = true;
  }
  if ((DAT_4125_3254 != 0) && (-1 < *(char *)(param_2 * 0x70 + param_1))) {
    bVar7 = false;
    bVar5 = false;
  }
  thunk_FUN_6a62_008b(param_1,param_2);
  if (param_3 == 0) {
    DAT_451b_01cc = (int)DAT_451b_0365;
    DAT_451b_01ce = 0;
    DAT_451b_01d0 = (int)DAT_451b_0364;
    DAT_451b_01d2 = 0;
    FUN_67a7_08a6();
    iVar9 = (int)DAT_451b_0364;
    while (iVar10 = iVar9 + -1, iVar9 != 0) {
      pcVar1 = (char *)(iVar9 + 0x4223);
      iVar9 = iVar10;
      if (*pcVar1 != '\0') {
        DAT_451b_01d2 = DAT_451b_01d2 + 1;
      }
    }
    iVar9 = (int)DAT_451b_0365;
    while (iVar10 = iVar9 + -1, iVar9 != 0) {
      pcVar1 = (char *)(iVar9 + 0x422b);
      iVar9 = iVar10;
      if (*pcVar1 != '\0') {
        DAT_451b_01ce = DAT_451b_01ce + 1;
      }
    }
    return (undefined2 *)&DAT_451b_01cc;
  }
  iVar10 = 0;
  for (iVar9 = 0; iVar9 < 8; iVar9 = iVar9 + 1) {
    if ((*(int *)(iVar9 * 2 + 0x137) != 0) && (*(int *)(iVar9 * 2 + 0xd0) == 0)) {
      iVar10 = iVar10 + 1;
    }
  }
  bVar3 = 1 < iVar10;
  bVar4 = bVar5;
  bVar6 = false;
  if ((bVar3) && (DAT_3c04_0124 != 0)) {
    bVar7 = false;
    bVar4 = false;
    bVar6 = bVar5;
  }
  if (_DAT_451b_027d != 0) {
    if (DAT_3c04_011c != 0) {
      uVar11 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
      if ((*(char *)((int)_DAT_451b_027d + 0x15) != '\x0f') &&
         (iVar9 = 0x3c04,
         (*(byte *)(DAT_3c04_0110 * 8 + (int)*(char *)((int)_DAT_451b_027d + 0x15) + 0x153b) & 3) !=
         2)) {
        FUN_67a7_20a8();
      }
    }
    pbVar2 = (byte *)((int)_DAT_451b_027d + 0x30);
    *pbVar2 = *pbVar2 | *(byte *)(DAT_3c04_0110 * 2 + 0xcbe);
  }
  if ((bVar4) && ((!bVar3 || (DAT_3c04_0124 == 0)))) {
    FUN_67a7_1836();
  }
  FUN_67a7_0522(param_1,param_2,0xffffffff);
  if (bVar4) {
    thunk_FUN_891f_0227(param_1,param_2);
  }
  else if (!bVar6) {
    DAT_4125_0cf8 = 0;
    goto LAB_67a7_14f1;
  }
  if (uVar8 < 8) {
    uVar11 = thunk_FUN_7e8f_04f0(0x94,uVar8 * 0x14,0x3c04);
    FUN_1000_4944(0x4162,0x4125,uVar11,iVar9);
  }
  else {
    uVar11 = thunk_FUN_7e8f_04f0(0x95);
    FUN_1000_4944(0x4162,0x4125,uVar11,iVar9);
  }
  thunk_FUN_8027_11d1();
  DAT_4125_0cf8 = 1;
LAB_67a7_14f1:
  iVar10 = FUN_67a7_08a6();
  thunk_FUN_5d9f_09d7(param_1,param_2,(undefined2 *)&DAT_451b_0386,0x4125,
                      (undefined4 *)&DAT_451b_0366,0x4125);
  if ((bVar7) || (bVar6)) {
    FUN_22bf_07a5();
    thunk_FUN_6a0f_0160();
    thunk_FUN_7e8f_0000();
    thunk_FUN_6a0f_0094(0,iVar10);
    FUN_22bf_0757();
  }
  FUN_67a7_0a6b();
  if (iVar10 == 1) {
    pbVar2 = (byte *)(param_2 * 0xe0 + param_1 * 2 + 1);
    *pbVar2 = *pbVar2 | 0x10;
  }
  if (((bVar7) || (bVar6)) || (bVar4)) {
    if (iVar10 == 0) {
      uVar13 = CONCAT22(0x3c04,DAT_3c04_0110 * 0x14);
      uVar12 = 0x98;
    }
    else if (DAT_451b_1efe == 0) {
      uVar13 = CONCAT22(0x3c04,DAT_3c04_0110 * 0x14);
      uVar12 = 0x96;
    }
    else {
      uVar13 = CONCAT22(0x3c04,*(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223);
      uVar12 = 0x8e;
    }
    uVar11 = thunk_FUN_7e8f_04f0(uVar12,uVar13);
    FUN_1000_4944(0x4162,0x4125,uVar11,iVar9);
    if ((bVar7) || (bVar6)) {
      FUN_67a7_16b3(0x4162,0x4125);
      thunk_FUN_6a0f_04c5(0x4162,0x4125);
      thunk_FUN_7e8f_0000();
      thunk_FUN_6a0f_04f6();
    }
    else {
      FUN_67a7_16b3(0x4162,0x4125);
    }
  }
  if ((bVar4) && ((!bVar3 || (DAT_3c04_0124 == 0)))) {
    FUN_67a7_1836();
    thunk_FUN_824f_0af3();
    if ((DAT_4125_3254 != 0) && (DAT_3c04_0124 != 0)) {
      thunk_FUN_891f_05ec();
    }
    thunk_FUN_830b_0000(0x10001,0);
  }
  FUN_67a7_2274();
  thunk_FUN_824f_0000();
  thunk_FUN_4974_1ded(0,0,0);
  thunk_FUN_5e7c_038d(param_1,param_2);
  return (undefined2 *)0x0;
}

