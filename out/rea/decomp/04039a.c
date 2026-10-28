
void __cdecl16far thunk_FUN_6bb0_025a(void)

{
  char *pcVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iStack_4;
  
  iVar3 = DAT_3c04_157b;
  if (1 < DAT_3c04_011a) {
    while (iVar4 = iVar3 + -1, iVar3 != 0) {
      iVar3 = iVar4;
      if (((*(char *)(iVar4 * 0x41 + 0x1592) == '\x0f') &&
          (*(char *)(*(byte *)(*(int *)(iVar4 * 0x41 + 0x157f) * 0xe0 +
                              *(int *)(iVar4 * 0x41 + 0x157d) * 2) + 0x710) == '\n')) &&
         (*(char *)(iVar4 * 0x41 + 0x15ad) != '\0')) {
        if ((*(char *)(iVar4 * 0x41 + 0x15aa) != '\0') &&
           (pcVar1 = (char *)(iVar4 * 0x41 + 0x15aa), *pcVar1 = *pcVar1 + -1,
           *(char *)(iVar4 * 0x41 + 0x15aa) == '\0')) {
          FUN_6bb0_0381();
        }
        iVar2 = thunk_FUN_621e_0fd5();
        if ((iVar2 == 0) &&
           (FUN_1b62_007d(*(undefined2 *)(iVar4 * 0x41 + 0x157d),
                          *(undefined2 *)(iVar4 * 0x41 + 0x157f),&iStack_4), iStack_4 < 4)) {
          thunk_FUN_621e_103d(iVar4,2,0xffff);
        }
      }
    }
  }
  return;
}

