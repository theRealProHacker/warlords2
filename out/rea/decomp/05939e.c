
bool __cdecl16far FUN_57d5_164e(int param_1,int *param_2,int *param_3)

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int local_a;
  char *local_8;
  
  uVar1 = *(undefined2 *)(param_1 * 0x16 + -0x7780);
  uVar2 = *(undefined2 *)(param_1 * 0x16 + -0x777e);
  local_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
  local_a = -1;
  iVar5 = DAT_3c04_157b;
  while (iVar6 = iVar5 + -1, iVar5 != 0) {
    iVar5 = iVar6;
    if ((*(char *)(*(byte *)(*(int *)(iVar6 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)(iVar6 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
       ((*(byte *)((int)DAT_451b_018e + iVar6 + 0x11e) & 1) != 0)) {
      iVar3 = FUN_1a8b_0acc(*(undefined2 *)(iVar6 * 0x41 + 0x157d),
                            *(undefined2 *)(iVar6 * 0x41 + 0x157f),uVar1,uVar2);
      iVar4 = thunk_FUN_7e8f_02bf(1);
      if (iVar3 + iVar4 < (int)local_8) {
        local_a = iVar6;
        local_8 = (char *)(iVar3 + iVar4);
      }
    }
  }
  if (local_a != -1) {
    *param_2 = *(int *)(local_a * 0x41 + 0x157d) + -1;
    *param_3 = *(int *)(local_a * 0x41 + 0x157f) + -1;
  }
  return local_a != -1;
}

