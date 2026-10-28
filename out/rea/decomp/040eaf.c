
void __cdecl16far thunk_FUN_824f_02bf(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  for (iVar2 = 0; iVar3 = DAT_3c04_0181, iVar2 < 8; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_1e7a)[iVar2] = 0;
  }
  while (iVar2 = iVar3 + -1, iVar3 != 0) {
    iVar3 = iVar2;
    if (((*(char *)(iVar2 * 0x16 + -0x777b) < '\b') && (-1 < *(int *)(iVar2 * 0x16 + -0x7780))) &&
       (-1 < *(int *)(iVar2 * 0x16 + -0x777e))) {
      iVar1 = (int)*(char *)(iVar2 * 0x16 + -0x7775);
      if (((*(uint *)(iVar2 * 0x16 + -0x7774) & 0x1000) != 0) && (iVar1 < 5)) {
        iVar1 = 4;
      }
      ((undefined2 *)&DAT_451b_1e7a)[*(char *)(iVar2 * 0x16 + -0x777b)] =
           ((undefined2 *)&DAT_451b_1e7a)[*(char *)(iVar2 * 0x16 + -0x777b)] + iVar1;
    }
  }
  return;
}

