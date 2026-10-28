
int __cdecl16far FUN_5304_03c3(undefined4 param_1)

{
  char *pcVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined2 uVar10;
  char *local_8;
  int local_6;
  int local_4;
  
  local_4 = -1;
  local_6 = -1;
  uVar10 = (undefined2)((ulong)param_1 >> 0x10);
  iVar3 = (int)param_1;
  if (*(int *)(iVar3 + 400) == -1) {
    iVar8 = 0x32;
    while (iVar7 = iVar8 + -1, iVar8 != 0) {
      local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
      iVar8 = iVar7;
      iVar2 = DAT_3c04_157b;
      if (*(int *)(iVar3 + iVar7 * 2) != -1) {
        while (iVar9 = iVar2 + -1, iVar2 != 0) {
          puVar5 = (undefined2 *)(iVar3 + iVar7 * 2);
          pcVar1 = (char *)FUN_1a8b_0acc(*puVar5,puVar5[0x32],*(undefined2 *)(iVar9 * 0x41 + 0x157d)
                                         ,*(undefined2 *)(iVar9 * 0x41 + 0x157f));
          iVar2 = iVar9;
          if ((int)pcVar1 < (int)local_8) {
            local_8 = pcVar1;
          }
        }
        *(undefined2 *)(iVar3 + iVar7 * 2 + 400) = local_8;
      }
    }
  }
  iVar8 = 0x32;
  while (iVar7 = iVar8 + -1, iVar8 != 0) {
    local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
    piVar4 = (int *)(iVar3 + iVar7 * 2);
    iVar8 = iVar7;
    if ((piVar4[0x96] == 0) && (*piVar4 != -1)) {
      iVar2 = 0x32;
      while (iVar9 = iVar2 + -1, iVar2 != 0) {
        iVar2 = iVar9;
        if ((*(int *)(iVar3 + iVar9 * 2 + 300) != 0) &&
           (puVar5 = (undefined2 *)(iVar3 + iVar9 * 2), puVar6 = (undefined2 *)(iVar3 + iVar7 * 2),
           pcVar1 = (char *)FUN_1a8b_0acc(*puVar6,puVar6[0x32],*puVar5,puVar5[0x32]),
           (int)pcVar1 < (int)local_8)) {
          local_8 = pcVar1;
        }
      }
      *(undefined2 *)(iVar3 + iVar7 * 2 + 500) = local_8;
    }
  }
  iVar8 = 0x32;
  while (iVar7 = iVar8 + -1, iVar8 != 0) {
    piVar4 = (int *)(iVar3 + iVar7 * 2);
    iVar8 = iVar7;
    if ((piVar4[0x96] == 0) && (*piVar4 != -1)) {
      iVar2 = thunk_FUN_7e8f_02bf(1);
      if (*(int *)(iVar3 + iVar7 * 2 + 400) < 0x1f) {
        iVar9 = 0x1e - *(int *)(iVar3 + iVar7 * 2 + 400);
      }
      else {
        iVar9 = 0;
      }
      if (local_6 < iVar9 + iVar2) {
        local_6 = iVar9 + iVar2;
        local_4 = iVar7;
      }
    }
  }
  return local_4;
}

