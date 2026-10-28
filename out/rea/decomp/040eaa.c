
void __cdecl16far thunk_FUN_824f_03f9(void)

{
  int iVar1;
  
  for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
    ((undefined2 *)&DAT_451b_1e8a)[iVar1] = 0;
  }
  for (iVar1 = 0; iVar1 < DAT_3c04_157b; iVar1 = iVar1 + 1) {
    if (*(char *)(iVar1 * 0x41 + 0x1592) < '\b') {
      ((undefined2 *)&DAT_451b_1e8a)[*(char *)(iVar1 * 0x41 + 0x1592)] =
           ((undefined2 *)&DAT_451b_1e8a)[*(char *)(iVar1 * 0x41 + 0x1592)] + 1;
    }
  }
  return;
}

