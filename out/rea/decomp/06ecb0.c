
/* WARNING: Instruction at (ram,0x00068b27) overlaps instruction at (ram,0x00068b26)
    */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint __cdecl16far FUN_6ec8_0030(undefined4 param_1)

{
  byte *pbVar1;
  bool bVar2;
  int iVar3;
  undefined2 uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int unaff_DI;
  undefined2 uVar10;
  undefined2 unaff_SS;
  int aiStack_c0 [8];
  int aiStack_b0 [38];
  undefined2 uStack_64;
  undefined2 uStack_62;
  int iStack_60;
  int aiStack_30 [8];
  int iStack_20;
  int iStack_1e;
  int iStack_e;
  uint uStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  if ((int)param_1 != 0) {
    if (DAT_4125_166a == 0) {
      DAT_4125_166a = 1;
      thunk_FUN_54e4_0000();
    }
    else {
      iStack_60 = -0x132e;
      thunk_FUN_54e4_07e4();
      iStack_60 = -0x131a;
      thunk_FUN_54e4_07e4();
    }
  }
  iStack_60 = -0x12f6;
  thunk_FUN_7875_06ae();
  thunk_FUN_7e8f_04f0();
  iStack_60 = -0x12d9;
  thunk_FUN_7e8f_00d6();
  iStack_60 = -0x12c5;
  thunk_FUN_7875_06ae();
  thunk_FUN_7e8f_04f0();
  iStack_60 = -0x12a8;
  thunk_FUN_7e8f_00d6();
  iVar3 = FUN_6ec8_02fb();
  FUN_6ec8_05ff();
  uVar4 = 0x3c04;
  iStack_60 = -0x1264;
  thunk_FUN_7875_06ae();
  iStack_60 = -0x1253;
  iVar5 = FUN_1000_4a70();
  if (4 < DAT_4125_0df6) {
    iStack_60 = -0x1124;
    uVar6 = thunk_FUN_7e8f_00d6();
    return uVar6;
  }
  iVar8 = DAT_4125_0df6 * 2;
  uVar10 = 0x6000;
  switch(DAT_4125_0df6) {
  case 0:
    uRam00044889 = 0;
    do {
      if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar3 * 0x41) != 0) &&
          (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar3 * 0x41) == *_DAT_451b_027d)) &&
         (*(int *)(iVar3 * 0x41 + 0x15b2) == ((int *)_DAT_451b_027d)[1])) {
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar3 * 0x41) = 0;
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar3 * 0x41) = 0;
        *(undefined1 *)(iVar3 * 0x41 + 0x15aa) = 0;
        *(undefined2 *)(iVar3 * 0x41 + 0x15b2) = 0;
        *(undefined1 *)(iVar3 * 0x41 + 0x15a9) = 0xff;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < DAT_3c04_157b);
    thunk_FUN_824f_03f9();
    thunk_FUN_824f_02bf();
    thunk_FUN_824f_0372();
    return 0x21;
  case 1:
    iVar5 = thunk_FUN_824f_044a();
    return (uint)(*(char *)(iVar5 * 0x41 + 0x1592) == DAT_3c04_0110);
  case 2:
    thunk_FUN_7938_03d9();
    iVar3 = 0;
    for (iVar5 = 0; iVar5 < DAT_451b_08ce; iVar5 = iVar5 + 1) {
      if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar5] * 0x1d + 0xcfd) == '\x01') {
        iVar3 = iVar3 + *(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar5] * 0x1d + 0xcfe);
      }
    }
    iVar8 = 0;
    iVar5 = DAT_3c04_0181;
    while (iVar7 = iVar5 + -1, iVar5 != 0) {
      iVar5 = iVar7;
      if ((*(int *)(iVar7 * 0x16 + -0x7780) == *DAT_451b_1efe) &&
         (*(int *)(iVar7 * 0x16 + -0x777e) == ((int *)DAT_451b_1efe)[1])) {
        iVar8 = iVar8 + 1;
      }
    }
    iVar5 = thunk_FUN_7e8f_02bf();
    return (uint)(iVar8 * 3 +
                  (((char)((int *)DAT_451b_1efe)[4] + iVar3) -
                  *(int *)((char *)s_Rename_City_4125_1003 + 4 + *(char *)((int)param_1 + 0x1a) * 2)
                  ) * 5 + 0x5a < iVar5);
  case 3:
    iVar5 = iVar5 + 1;
    while( true ) {
      iStack_1e = *(int *)(iVar8 + iVar5 + 0x3dc) + *(int *)(iVar8 + iVar5 + 0x3fc);
      if (DAT_3c04_0128 == 0) {
        iStack_20 = 8;
      }
      else {
        iStack_20 = 4;
      }
      iVar5 = thunk_FUN_557a_0a6e();
      if (iVar5 != 0) {
        aiStack_c0[unaff_DI] = 0;
      }
      if ((iVar3 != 0) && ((*(byte *)(DAT_3c04_0110 * 8 + unaff_DI + 0x153b) & 0xc) == 0)) {
        aiStack_c0[unaff_DI] = 0;
      }
      if ((iStack_8 == 0) && ((&iStack_60)[unaff_DI] == 0)) {
        aiStack_c0[unaff_DI] = 0;
      }
      iVar5 = thunk_FUN_8027_225b();
      if ((iVar5 < iStack_20) && (iStack_1e == 0)) {
        aiStack_c0[unaff_DI] = 0;
      }
      if ((1 < iStack_a) && (aiStack_30[unaff_DI] / 4 < aiStack_b0[unaff_DI])) {
        aiStack_c0[unaff_DI] = 0;
      }
      iVar8 = (int)DAT_451b_018e;
      uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (unaff_DI == 0) break;
      iVar5 = (unaff_DI + -1) * 2;
      unaff_DI = unaff_DI + -1;
    }
    aiStack_c0[DAT_3c04_0110] = 0;
    iVar5 = 0;
    uVar6 = 8;
    while (uVar9 = uVar6 - 1, uVar6 != 0) {
      uVar6 = uVar9;
      if ((aiStack_30[uVar9] != 0) && (iVar5 < aiStack_c0[uVar9])) {
        iVar5 = aiStack_c0[uVar9];
        uStack_c = uVar9;
      }
    }
    if ((*(char *)(iStack_e * 0x41 + 0x1592) != '\x0f') &&
       (*(char *)(iStack_e * 0x41 + 0x1592) != DAT_3c04_0110)) {
      bVar2 = false;
      iVar5 = *(int *)(iVar8 + 0x24a);
      while (iVar3 = iVar5 + -1, iVar5 != 0) {
        iVar5 = iVar3;
        if ((int)*(char *)(iStack_e * 0x41 + 0x1592) == aiStack_b0[iVar3]) {
          bVar2 = true;
        }
      }
      if (!bVar2) {
        uStack_c = (int)*(char *)(iStack_e * 0x41 + 0x1592);
      }
    }
    if ((uStack_c != 0xffff) && ((&iStack_60)[uStack_c] == 0)) {
      uStack_c = 0xffff;
    }
    return uStack_c;
  case 4:
    iStack_a = 0;
    iStack_8 = 0;
    uStack_c = iVar5;
    if (_DAT_451b_027d != (int *)0x0) {
      if (DAT_3c04_011c != 0) {
        uVar4 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
        if ((*(char *)((int)(int *)_DAT_451b_027d + 0x15) != '\x0f') &&
           ((*(byte *)(DAT_3c04_0110 * 8 + (int)*(char *)((int)(int *)_DAT_451b_027d + 0x15) +
                      0x153b) & 3) != 2)) {
          FUN_67a7_20a8();
        }
      }
      *(byte *)((int *)_DAT_451b_027d + 0x18) =
           *(byte *)((int *)_DAT_451b_027d + 0x18) | *(byte *)(DAT_3c04_0110 * 2 + 0xcbe);
    }
    if ((iStack_8 != 0) && ((iStack_e == 0 || (DAT_3c04_0124 == 0)))) {
      FUN_67a7_1836();
    }
    iStack_60 = -0x7127;
    FUN_67a7_0522();
    if (iStack_8 != 0) {
      uVar10 = 0x4108;
      thunk_FUN_891f_0227();
    }
    if ((iStack_8 == 0) && (uStack_c == 0)) {
      DAT_4125_0cf8 = 0;
    }
    else {
      if (iStack_6 < 8) {
        iStack_60 = -0x70ea;
        thunk_FUN_7e8f_04f0();
        iStack_60 = 0x4162;
        uStack_62 = 0x40c1;
        uStack_64 = 0x8f24;
        FUN_1000_4944();
      }
      else {
        thunk_FUN_7e8f_04f0();
        iStack_60 = -0x70be;
        FUN_1000_4944();
      }
      uVar10 = 0x40d7;
      thunk_FUN_8027_11d1();
      DAT_4125_0cf8 = 1;
    }
    iStack_4 = FUN_67a7_08a6();
    uStack_64 = 0x8f77;
    uStack_62 = uVar10;
    iStack_60 = iVar3;
    thunk_FUN_5d9f_09d7();
    if ((iStack_a != 0) || (uStack_c != 0)) {
      FUN_22bf_07a5();
      thunk_FUN_6a0f_0160();
      thunk_FUN_7e8f_0000();
      thunk_FUN_6a0f_0094();
      FUN_22bf_0757();
    }
    FUN_67a7_0a6b();
    if (iStack_4 == 1) {
      pbVar1 = (byte *)(unaff_DI * 0xe0 + iVar3 * 2 + 1);
      *pbVar1 = *pbVar1 | 0x10;
    }
    if (((iStack_a != 0) || (uStack_c != 0)) || (iStack_8 != 0)) {
      iStack_60 = -0x6fb3;
      thunk_FUN_7e8f_04f0();
      iStack_60 = 0x4162;
      uStack_62 = 0x40c1;
      uStack_64 = 0x905b;
      FUN_1000_4944();
      if ((iStack_a == 0) && (uStack_c == 0)) {
        FUN_67a7_16b3();
      }
      else {
        FUN_67a7_16b3();
        thunk_FUN_6a0f_04c5();
        thunk_FUN_7e8f_0000();
        thunk_FUN_6a0f_04f6();
      }
    }
    if ((iStack_8 != 0) && ((iStack_e == 0 || (DAT_3c04_0124 == 0)))) {
      FUN_67a7_1836();
      thunk_FUN_824f_0af3();
      if ((DAT_4125_3254 != 0) && (DAT_3c04_0124 != 0)) {
        thunk_FUN_891f_05ec();
      }
      iStack_60 = -0x6f12;
      thunk_FUN_830b_0000();
    }
    FUN_67a7_2274();
    thunk_FUN_824f_0000();
    iStack_60 = 0x40e8;
    uStack_62 = 0x910c;
    thunk_FUN_4974_1ded();
    thunk_FUN_5e7c_038d();
    return 0;
  }
}

