
undefined2 __cdecl16far FUN_606a_1637(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar1 = *(int *)(param_1 * 0x1f + 0x811);
  iVar2 = *(int *)(param_1 * 0x1f + 0x813);
  iVar3 = FUN_1a8b_0acc(iVar1,iVar2,*(undefined2 *)(param_2 * 0x16 + -0x7780),
                        *(undefined2 *)(param_2 * 0x16 + -0x777e));
  iVar4 = thunk_FUN_8027_225b();
  iVar5 = iVar4 * 2 + 3;
  if (*(int *)(param_1 * 0x1f + 0x82c) != 0) {
    iVar5 = iVar4 * 2 + 0xf;
  }
  if ((((iVar3 < iVar5) && (iVar3 = thunk_FUN_621e_16ae(iVar1,iVar2), iVar3 != 0)) &&
      (*(char *)(*(byte *)(iVar2 * 0xe0 + iVar1 * 2) + 0x710) == '\v')) &&
     ((*(char *)(param_1 * 0x1f + 0x829) == '\x01' ||
      ((*(byte *)(iVar2 * 0xe0 + iVar1 * 2 + 1) & 0x40) == 0)))) {
    return 1;
  }
  return 0;
}

