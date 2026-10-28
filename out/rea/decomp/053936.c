
int __cdecl16far FUN_5304_08f6(undefined4 param_1,int param_2)

{
  char *pcVar1;
  int iVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined2 uVar9;
  char *local_8;
  int local_6;
  int local_4;
  
  local_4 = -1;
  local_6 = -1;
  uVar9 = (undefined2)((ulong)param_1 >> 0x10);
  iVar2 = (int)param_1;
  iVar7 = param_2;
  iVar6 = param_2;
  if (*(int *)(iVar2 + 400) == -1) {
    while (iVar5 = iVar6 + -1, iVar6 != 0) {
      local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
      iVar6 = DAT_3c04_157b;
      while (iVar8 = iVar6 + -1, iVar6 != 0) {
        puVar3 = (undefined2 *)(iVar2 + iVar5 * 2);
        pcVar1 = (char *)FUN_1a8b_0acc(*puVar3,puVar3[0x32],*(undefined2 *)(iVar8 * 0x41 + 0x157d),
                                       *(undefined2 *)(iVar8 * 0x41 + 0x157f));
        iVar6 = iVar8;
        if ((int)pcVar1 < (int)local_8) {
          local_8 = pcVar1;
        }
      }
      *(undefined2 *)(iVar2 + iVar5 * 2 + 400) = local_8;
      iVar6 = iVar5;
    }
  }
  while (iVar6 = iVar7 + -1, iVar7 != 0) {
    local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
    iVar7 = iVar6;
    iVar5 = param_2;
    if (*(int *)(iVar2 + iVar6 * 2 + 300) == 0) {
      while (iVar8 = iVar5 + -1, iVar5 != 0) {
        iVar5 = iVar8;
        if ((*(int *)(iVar2 + iVar8 * 2 + 300) != 0) &&
           (puVar3 = (undefined2 *)(iVar2 + iVar8 * 2), puVar4 = (undefined2 *)(iVar2 + iVar6 * 2),
           pcVar1 = (char *)FUN_1a8b_0acc(*puVar4,puVar4[0x32],*puVar3,puVar3[0x32]),
           (int)pcVar1 < (int)local_8)) {
          local_8 = pcVar1;
        }
      }
      *(undefined2 *)(iVar2 + iVar6 * 2 + 500) = local_8;
    }
  }
  while (iVar7 = param_2 + -1, param_2 != 0) {
    iVar6 = iVar2 + iVar7 * 2;
    param_2 = iVar7;
    if ((*(int *)(iVar6 + 300) == 0) && (9 < *(int *)(iVar6 + 500))) {
      iVar6 = thunk_FUN_7e8f_02bf(1);
      if (*(int *)(iVar2 + iVar7 * 2 + 400) < 0x1f) {
        iVar5 = 0x1e - *(int *)(iVar2 + iVar7 * 2 + 400);
      }
      else {
        iVar5 = 0;
      }
      if (local_6 < iVar5 + iVar6) {
        local_6 = iVar5 + iVar6;
        local_4 = iVar7;
      }
    }
  }
  return local_4;
}

