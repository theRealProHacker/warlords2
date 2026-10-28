
void __cdecl16far thunk_FUN_57d5_0000(void)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_SS;
  char acStack_66 [100];
  
  iVar2 = 100;
  while (iVar1 = DAT_3c04_0181, iVar2 != 0) {
    acStack_66[iVar2 + -1] = '\0';
    iVar2 = iVar2 + -1;
  }
  while (iVar2 = iVar1 + -1, iVar1 != 0) {
    iVar1 = iVar2;
    if (((*(char *)(iVar2 * 0x16 + -0x777b) == DAT_3c04_0110) &&
        ((*(byte *)(iVar2 * 0x16 + -0x7772) & 0xf) == 1)) &&
       (*(byte *)(iVar2 * 0x16 + -0x7771) >> 1 < DAT_3c04_157b)) {
      acStack_66[*(byte *)(iVar2 * 0x16 + -0x7771) >> 1] =
           acStack_66[*(byte *)(iVar2 * 0x16 + -0x7771) >> 1] + '\x01';
    }
  }
  iVar2 = 0;
  while ((iVar2 < 10 && (iVar1 = FUN_57d5_00b5(iVar2,acStack_66), iVar1 != 0))) {
    iVar2 = iVar2 + 1;
  }
  return;
}

