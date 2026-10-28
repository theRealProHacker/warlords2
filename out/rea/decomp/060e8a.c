
undefined2 __cdecl16far FUN_606a_07ea(int param_1,int param_2,undefined4 param_3)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  undefined2 unaff_SS;
  int local_20 [8];
  int local_10;
  int local_e;
  undefined2 local_c;
  int local_a;
  undefined2 local_8;
  int local_6;
  uint local_4;
  
  local_8 = 0;
  uVar7 = (undefined2)((ulong)param_3 >> 0x10);
  iVar4 = (int)param_3;
  iVar5 = *(int *)(iVar4 + param_1 * 2);
  if (param_2 == 3) {
    uVar1 = *(undefined2 *)(*(int *)(iVar4 + 0x34) * 0x1f + 0x811);
    local_c = *(undefined2 *)(*(int *)(iVar4 + 0x34) * 0x1f + 0x813);
    iVar6 = *(int *)(iVar4 + 0x34);
  }
  else {
    uVar1 = *(undefined2 *)(*(int *)(iVar4 + 0x3c) * 0x1d + 0xd02);
    local_c = *(undefined2 *)(*(int *)(iVar4 + 0x3c) * 0x1d + 0xd04);
    iVar6 = *(int *)(iVar4 + 0x3c) + 1000;
  }
  local_e = FUN_1a8b_0acc(uVar1,local_c,*(undefined2 *)(iVar5 * 0x16 + -0x7780),
                          *(undefined2 *)(iVar5 * 0x16 + -0x777e));
  local_4 = thunk_FUN_621e_13b2(*(undefined2 *)(iVar5 * 0x16 + -0x7780),
                                *(undefined2 *)(iVar5 * 0x16 + -0x777e),local_20);
  if (local_4 == 0) {
    return local_8;
  }
  local_a = *(int *)(iVar4 + param_1 * 2 + 0xc);
  if (local_a == -1) {
    local_6 = 100;
  }
  else {
    local_6 = thunk_FUN_57d5_0a3e(*(undefined2 *)(iVar5 * 0x16 + -0x7780),
                                  *(undefined2 *)(iVar5 * 0x16 + -0x777e),0xffff);
  }
  if (local_a != -1) {
    iVar4 = -1;
    iVar3 = 8;
    while (iVar2 = iVar3 + -1, iVar3 != 0) {
      local_10 = local_20[iVar2];
      iVar3 = iVar2;
      if ((local_10 != -1) &&
         (((undefined1 *)&DAT_451b_0664)[*(char *)(local_10 * 0x16 + -0x777c) * 6] != '\0')) {
        iVar4 = local_10;
      }
    }
    if (iVar4 == -1) {
      if (local_6 < 0xf) goto LAB_606a_0a0c;
      iVar4 = 8;
      while (iVar4 != 0) {
        local_20[iVar4 + -1] = -1;
        iVar4 = iVar4 + -1;
      }
      local_4 = 1;
    }
    else {
      iVar3 = 8;
      while (iVar3 != 0) {
        local_20[iVar3 + -1] = -1;
        iVar3 = iVar3 + -1;
      }
      local_4 = 2;
      local_20[1] = iVar4;
    }
    local_20[0] = iVar5;
    thunk_FUN_621e_14d3(local_20);
  }
LAB_606a_0a0c:
  if ((((local_a == -1) || (*(byte *)((int)DAT_451b_018e + local_a + 0x182) != local_4)) ||
      (2 < (int)local_4)) || (0xe < local_6)) {
    if ((local_a != -1) && (local_4 == 3)) {
      iVar4 = 8;
      while (iVar4 != 0) {
        local_20[iVar4 + -1] = -1;
        iVar4 = iVar4 + -1;
      }
      local_20[0] = iVar5;
      thunk_FUN_621e_14d3(local_20);
    }
    FUN_1c8c_0529();
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x960,0x4125,local_e + 10,DAT_451b_1e9c,
                  DAT_451b_1e9a);
    thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,*(undefined2 *)(iVar5 * 0x16 + -0x7780),
                        *(undefined2 *)(iVar5 * 0x16 + -0x777e));
    if (iVar6 != -1) {
      FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x981,0x4125,iVar6);
      if (iVar6 < 1000) {
        thunk_FUN_621e_0ae7(local_20);
        uVar7 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        iVar5 = FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                              *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
      }
      else {
        thunk_FUN_621e_0ae7(local_20);
        *(undefined2 *)((int)DAT_451b_1f02 + 0x12) = *(undefined2 *)(iVar6 * 0x1d + -0x6446);
        uVar7 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        iVar5 = (int)DAT_451b_1f02;
        *(undefined2 *)(iVar5 + 0x14) = *(undefined2 *)(iVar6 * 0x1d + -0x6444);
        iVar5 = FUN_1a8b_0001(*(undefined2 *)(iVar5 + 0x12),*(undefined2 *)(iVar5 + 0x14),0);
      }
      if (iVar5 == 4) {
        local_8 = 1;
      }
    }
  }
  return local_8;
}

