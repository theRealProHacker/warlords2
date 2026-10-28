
char * __cdecl16far thunk_FUN_57d5_0981(undefined2 param_1,undefined2 param_2,int param_3)

{
  char *pcVar1;
  int iVar2;
  int iVar3;
  char *pcStack_4;
  
  pcStack_4 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
  iVar2 = DAT_3c04_157b;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    iVar2 = iVar3;
    if ((*(char *)(*(byte *)(*(int *)(iVar3 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)(iVar3 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
       ((param_3 == -1 || (*(char *)(iVar3 * 0x41 + 0x1592) == param_3)))) {
      pcVar1 = (char *)FUN_1a8b_0acc(param_1,param_2,*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(undefined2 *)(iVar3 * 0x41 + 0x157f));
      if ((int)pcVar1 < (int)pcStack_4) {
        pcStack_4 = pcVar1;
      }
    }
  }
  return pcStack_4;
}

