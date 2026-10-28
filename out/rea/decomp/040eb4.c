
void __cdecl16far thunk_FUN_824f_0372(void)

{
  int iVar1;
  int iVar2;
  
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_1e6a)[iVar2] = 0;
  }
  for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
    if (*(char *)(iVar2 * 0x41 + 0x1592) < '\b') {
      ((undefined2 *)&DAT_451b_1e6a)[*(char *)(iVar2 * 0x41 + 0x1592)] =
           ((undefined2 *)&DAT_451b_1e6a)[*(char *)(iVar2 * 0x41 + 0x1592)] +
           *(int *)(iVar2 * 0x41 + 0x15a7);
    }
  }
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    iVar1 = thunk_FUN_66b0_07cf(iVar2);
    ((undefined2 *)&DAT_451b_1e6a)[iVar2] =
         ((undefined2 *)&DAT_451b_1e6a)[iVar2] + ((undefined2 *)&DAT_451b_1e8a)[iVar2] * iVar1;
  }
  return;
}

