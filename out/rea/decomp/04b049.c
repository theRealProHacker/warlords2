
undefined2 __cdecl16far FUN_4974_1909(int *param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  char *pcVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  undefined2 uVar9;
  int local_a;
  char *local_8;
  int local_6;
  
  if (((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < 10) &&
     (iVar1 = thunk_FUN_8027_225b(), 0xf < iVar1)) {
    uVar9 = 5;
LAB_4974_1930:
    iVar1 = thunk_FUN_7e8f_02bf(1,3,uVar9);
    *param_1 = iVar1;
    uVar9 = 3;
  }
  else {
    if (99 < *(int *)(DAT_3c04_0110 * 0x14 + 0x185)) {
      iVar1 = 0;
      for (iVar7 = 0; iVar7 < 0x16; iVar7 = iVar7 + 1) {
        if (*(char *)(iVar7 * 0x1d + 0xcff) == '\0') {
          FUN_1000_1e79();
          iVar8 = thunk_FUN_66b0_08f4();
          if ((iVar8 != 0) && ((7 < iVar7 || (DAT_3c04_0110 == iVar7)))) {
            iVar1 = iVar1 + 1;
          }
        }
      }
      local_6 = 0;
      for (iVar7 = 0; iVar7 < DAT_3c04_080f; iVar7 = iVar7 + 1) {
        if (((*(int *)(iVar7 * 0x1f + 0x82c) != 0) &&
            ((*(uint *)(iVar7 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) == 0)) &&
           (*(char *)(iVar7 * 0x1f + 0x829) != '\0')) {
          local_6 = local_6 + 1;
        }
      }
      if ((0 < iVar1) && (iVar7 = thunk_FUN_7e8f_02bf(1,3,0), iVar7 == 1)) {
        iVar1 = thunk_FUN_7e8f_02bf(1,iVar1,0);
        iVar7 = 0;
        for (iVar8 = 0; iVar8 < 0x16; iVar8 = iVar8 + 1) {
          if (*(char *)(iVar8 * 0x1d + 0xcff) == '\0') {
            FUN_1000_1e79();
            iVar2 = thunk_FUN_66b0_08f4();
            if (((iVar2 != 0) && ((7 < iVar8 || (DAT_3c04_0110 == iVar8)))) &&
               (iVar7 = iVar7 + 1, iVar7 == iVar1)) break;
          }
        }
        *param_1 = iVar8;
        return 0;
      }
      if (((iVar1 < 1) && (0 < local_6)) && (iVar1 = thunk_FUN_7e8f_02bf(1,3,0), iVar1 < 3)) {
        local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
        local_a = 0;
        for (iVar1 = 0; iVar1 < DAT_3c04_080f; iVar1 = iVar1 + 1) {
          if (((*(int *)(iVar1 * 0x1f + 0x82c) != 0) &&
              ((*(uint *)(iVar1 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) == 0)) &&
             (*(char *)(iVar1 * 0x1f + 0x829) != '\0')) {
            uVar3 = *(int *)(iVar1 * 0x1f + 0x811) -
                    *(int *)(*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) *
                             0x16 + -0x7780);
            uVar6 = (int)uVar3 >> 0xf;
            pcVar4 = (char *)((uVar3 ^ uVar6) - uVar6);
            uVar3 = *(int *)(iVar1 * 0x1f + 0x813) -
                    *(int *)(*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) *
                             0x16 + -0x777e);
            uVar6 = (int)uVar3 >> 0xf;
            pcVar5 = (char *)((uVar3 ^ uVar6) - uVar6);
            if ((int)pcVar5 < (int)pcVar4) {
              pcVar5 = pcVar4;
            }
            if ((int)pcVar5 < (int)local_8) {
              local_a = iVar1;
              local_8 = pcVar5;
            }
          }
        }
        *param_1 = local_a;
        return 1;
      }
      iVar1 = thunk_FUN_7e8f_02bf(1,2,0);
      if (iVar1 == 1) {
        uVar9 = 2;
        goto LAB_4974_1930;
      }
    }
    iVar1 = thunk_FUN_7e8f_02bf(2,1000,1000);
    *param_1 = iVar1;
    uVar9 = 2;
  }
  return uVar9;
}

