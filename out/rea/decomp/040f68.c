
void __cdecl16far thunk_FUN_830b_1817(int *param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  undefined2 unaff_SS;
  int aiStack_fa [100];
  int iStack_32;
  uint uStack_30;
  int iStack_2e;
  int aiStack_2c [4];
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined1 auStack_1c [8];
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_32 = 0;
  if (param_1 == (int *)0x0) {
    FUN_1000_1d02(0x2a88,0x4125,&uStack_24,unaff_SS);
    FUN_216d_002e(auStack_1c);
  }
  else {
    FUN_1000_1d02(param_1,auStack_1c,unaff_SS);
    uVar6 = (undefined2)((ulong)param_1 >> 0x10);
    piVar1 = (int *)param_1;
    uStack_24 = CONCAT22(piVar1[1] << 1,*param_1 << 1);
    uStack_20 = CONCAT22(piVar1[3] << 1,piVar1[2] << 1);
  }
  FUN_1997_034a();
  FUN_1997_060a();
  if (DAT_3c04_0124 == 0) {
    (*DAT_451b_2a74)();
  }
  else {
    FUN_24d0_0497();
    (*DAT_451b_2a68)(0x24d0,0x581d,0x4125,uStack_24,uStack_20,0x6795,0x4125,uStack_24,0x54e3,0x4125,
                     uStack_24);
  }
  FUN_1997_06bb();
  for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
    aiStack_fa[iVar2] = 0;
  }
  for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
    if ((*(char *)(iVar2 * 0x41 + 0x1592) == DAT_3c04_0110) && (aiStack_fa[iVar2] == 0)) {
      aiStack_fa[iVar2] = 1;
      thunk_FUN_705a_0410();
      if (*(char *)(iVar2 * 0x41 + 0x15aa) < '\x01') {
        iStack_6 = 3;
      }
      else {
        iStack_6 = 0;
      }
      if (*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar2 * 0x41) != 0) {
        iStack_6 = 2;
      }
      if (0 < iStack_2e) {
        if (*(char *)(iVar2 * 0x41 + 0x15aa) < '\x01') {
          iStack_6 = 5;
        }
        else {
          iStack_6 = 1;
        }
      }
      iStack_8 = *(int *)(iVar2 * 0x41 + 0x157d) * 2;
      uVar3 = iStack_8 - 2;
      iStack_a = *(int *)(iVar2 * 0x41 + 0x157f) * 2;
      iStack_4 = iStack_a + -1;
      iStack_8 = iStack_8 + 2;
      iStack_a = iStack_a + 2;
      uStack_30 = uVar3 & 7;
      if (uStack_30 == 7) {
        uStack_30 = 6;
      }
      FUN_1997_034a();
      (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iStack_6 * 8 + 0x2c76),
                       *(int *)(iStack_6 * 8 + 0x2c78) + uStack_30 * *(int *)(iStack_6 * 8 + 0x2c7c)
                       ,*(undefined2 *)(iStack_6 * 8 + 0x2c7a),
                       *(undefined2 *)(iStack_6 * 8 + 0x2c7c),0x6795,0x4125,((int)uVar3 >> 3) << 3,
                       iStack_4,0x576c,0x4125,*(undefined2 *)(iStack_6 * 8 + 0x2c76),
                       *(int *)(iStack_6 * 8 + 0x2c78) + uStack_30 * *(int *)(iStack_6 * 8 + 0x2c7c)
                      );
      if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar2 * 0x41) != 0) &&
         (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar2 * 0x41) == -2)) {
        iStack_32 = 2;
      }
      if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar2 * 0x41) != 0) &&
         (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar2 * 0x41) != -2)) {
        iVar5 = thunk_FUN_824f_044a(*(undefined2 *)
                                     ((int)(undefined2 *)&DAT_4125_15b0 + iVar2 * 0x41),
                                    *(undefined2 *)(iVar2 * 0x41 + 0x15b2));
        aiStack_fa[iVar5] = 1;
        iVar4 = *(int *)(iVar5 * 0x41 + 0x157d) * 2;
        iStack_e = *(int *)(iVar5 * 0x41 + 0x157f) * 2;
        iStack_4 = iStack_e + -1;
        iStack_c = iVar4 + 2;
        iStack_e = iStack_e + 2;
        if (*(char *)(iVar5 * 0x41 + 0x15aa) < '\x01') {
          iStack_6 = 5;
        }
        else {
          iStack_6 = 1;
        }
        uStack_30 = iVar4 - 2U & 7;
        if (uStack_30 == 7) {
          uStack_30 = 6;
        }
        FUN_1997_034a();
        (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iStack_6 * 8 + 0x2c76),
                         *(int *)(iStack_6 * 8 + 0x2c78) +
                         uStack_30 * *(int *)(iStack_6 * 8 + 0x2c7c),
                         *(undefined2 *)(iStack_6 * 8 + 0x2c7a));
        FUN_24d0_0002();
        FUN_2133_00b8(0x6795,0x4125,iStack_c,iStack_e,iStack_8,iStack_a,0);
      }
      for (iStack_10 = 0; iStack_10 < iStack_2e; iStack_10 = iStack_10 + 1) {
        aiStack_fa[aiStack_2c[iStack_10]] = 1;
        iVar5 = *(int *)(aiStack_2c[iStack_10] * 0x41 + 0x157d) * 2;
        iStack_e = *(int *)(aiStack_2c[iStack_10] * 0x41 + 0x157f) * 2;
        iStack_4 = iStack_e + -1;
        iStack_c = iVar5 + 2;
        iStack_e = iStack_e + 2;
        iStack_6 = 2;
        uStack_30 = iVar5 - 2U & 7;
        if (uStack_30 == 7) {
          uStack_30 = 6;
        }
        FUN_1997_034a();
        (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iStack_6 * 8 + 0x2c76),
                         *(int *)(iStack_6 * 8 + 0x2c78) +
                         uStack_30 * *(int *)(iStack_6 * 8 + 0x2c7c),
                         *(undefined2 *)(iStack_6 * 8 + 0x2c7a));
        FUN_24d0_0002();
        FUN_2133_00b8(0x6795,0x4125,iStack_c,iStack_e,iStack_8,iStack_a,0);
      }
    }
  }
  iVar2 = thunk_FUN_7533_0b47();
  if ((iVar2 != 0) && (iStack_32 == 0)) {
    iStack_32 = 1;
  }
  if ((iVar2 != 0) && (FUN_830b_1f5f(), iStack_32 == 2)) {
    for (iVar2 = 0; iVar2 < 100; iVar2 = iVar2 + 1) {
      if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar2 * 0x41) != 0) &&
          (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar2 * 0x41) == -2)) &&
         (*(char *)(iVar2 * 0x41 + 0x1592) == DAT_3c04_0110)) {
        iStack_a = *(int *)(iVar2 * 0x41 + 0x157f) * 2;
        iStack_4 = iStack_a + -1;
        iStack_8 = *(int *)(iVar2 * 0x41 + 0x157d) * 2 + 2;
        iStack_a = iStack_a + 2;
        iStack_c = iStack_12 << 1;
        iStack_e = iStack_14 << 1;
        FUN_24d0_0002();
        FUN_2133_00b8(0x6795,0x4125,iStack_8,iStack_a,iStack_c,iStack_e,0);
      }
    }
  }
  if (-1 < param_2) {
    iVar5 = *(int *)(param_2 * 0x41 + 0x157d) * 2;
    iVar2 = *(int *)(param_2 * 0x41 + 0x157f) * 2;
    iStack_4 = iVar2 + -1;
    FUN_2012_0bb7(0x6795,0x4125,iVar5 + -3,iVar2 + -2,0xf000b);
    FUN_2012_0bb7(0x6795,0x4125,iVar5 + -3,iStack_4 + 10,0xf000b);
    FUN_2012_0f08(0x6795,0x4125,iVar5 + -3,iStack_4 + -1,0xf000b);
    FUN_2012_0f08(0x6795,0x4125,iVar5 + 8,iStack_4 + -1,0xf000b);
  }
  return;
}

