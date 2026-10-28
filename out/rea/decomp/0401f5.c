
int __cdecl16far thunk_FUN_66b0_07cf(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 0;
  iVar1 = DAT_3c04_0181;
  while (iVar2 = iVar1 + -1, iVar1 != 0) {
    iVar1 = iVar2;
    if ((*(char *)(iVar2 * 0x16 + -0x777b) == param_1) &&
       (*(char *)(iVar2 * 0x16 + -0x777c) == '\x1c')) {
      thunk_FUN_7938_03d9(2,0,iVar2 * 0x16 + -0x7780,0x2e1d);
      for (iVar2 = 0; iVar2 < DAT_451b_08ce; iVar2 = iVar2 + 1) {
        if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar2] * 0x1d + 0xcfd) == '\a') {
          iVar3 = iVar3 + *(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar2] * 0x1d + 0xcfe);
        }
      }
    }
  }
  return iVar3;
}

