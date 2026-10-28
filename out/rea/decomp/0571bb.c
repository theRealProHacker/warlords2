
undefined2 __cdecl16far FUN_562a_0f1b(int param_1,int *param_2,int param_3)

{
  char cVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int local_c;
  int local_a;
  
  if ((*param_2 != -1) &&
     (*(char *)(*(byte *)(*(int *)(param_3 * 0x41 + 0x157f) * 0xe0 +
                         *(int *)(param_3 * 0x41 + 0x157d) * 2) + 0x710) != '\n')) {
    local_a = 1000;
    local_c = -1;
    for (iVar4 = 0; iVar4 < 6; iVar4 = iVar4 + 1) {
      iVar5 = *(int *)((int)DAT_451b_018e + param_1 * 0x5c + iVar4 * 2 + 0x25a);
      if (((iVar5 != -1) && (iVar3 = FUN_1a8b_0acc(), iVar3 < local_a)) &&
         (*(char *)(*(byte *)(*(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 +
                             *(int *)(iVar5 * 0x41 + 0x157d) * 2) + 0x710) == '\n')) {
        local_c = iVar5;
        local_a = iVar3;
      }
    }
    if (local_c != -1) {
      param_3 = local_c;
    }
  }
  while( true ) {
    iVar4 = 0;
    for (iVar5 = 0; iVar5 < 6; iVar5 = iVar5 + 1) {
      if (*(int *)((int)DAT_451b_018e + param_1 * 0x5c + iVar5 * 2 + 0x25a) != -1) {
        iVar4 = iVar4 + 1;
      }
    }
    for (iVar5 = 0; iVar5 < 8; iVar5 = iVar5 + 1) {
      uVar6 = (undefined2)((ulong)param_2 >> 0x10);
      iVar3 = ((int *)param_2)[iVar5];
      if ((iVar3 != -1) && (*(char *)(iVar3 * 0x16 + -0x777b) != DAT_3c04_0110)) {
        ((int *)param_2)[iVar5] = -1;
      }
    }
    cVar1 = *(char *)(param_3 * 0x41 + 0x1592);
    thunk_FUN_621e_0ae7(param_2,1,param_3,0);
    uVar6 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    iVar5 = FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                          *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
    if (iVar5 == 1) {
      thunk_FUN_5c8e_0000(1);
      FUN_562a_1251(param_1);
      return 3;
    }
    FUN_562a_1251(param_1);
    if (*(char *)(param_3 * 0x41 + 0x1592) != DAT_3c04_0110) {
      return 3;
    }
    if (DAT_3c04_0110 == cVar1) break;
    if ((*(int *)(param_3 * 0x41 + 0x157d) == *(int *)(DAT_3c04_0110 * 0x14 + 0x193)) &&
       (*(int *)(param_3 * 0x41 + 0x157f) == *(int *)(DAT_3c04_0110 * 0x14 + 0x195))) {
      bVar2 = true;
    }
    else {
      bVar2 = false;
    }
    iVar5 = (int)DAT_451b_018e;
    uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (((bVar2) || (iVar4 < 2)) || ((*(uint *)(iVar5 + param_1 * 0x5c + 0x2a6) & 1) == 0)) {
      if ((bVar2) || ((*(uint *)(iVar5 + param_1 * 0x5c + 0x2a6) & 2) == 0)) {
        if ((!bVar2) && ((*(uint *)(iVar5 + param_1 * 0x5c + 0x2a6) & 4) != 0)) {
          FUN_562a_1a2a(param_3);
        }
      }
      else {
        FUN_562a_199c(param_3);
      }
      FUN_562a_134c(param_1,param_3);
      return 1;
    }
    param_3 = FUN_562a_1864(param_3,0);
    if (param_3 == -1) {
      return 1;
    }
  }
  return 3;
}

