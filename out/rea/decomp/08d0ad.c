
void __cdecl16far FUN_8c81_089d(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar3 = DAT_3c04_0181;
  while (iVar4 = iVar3 + -1, iVar3 != 0) {
    iVar3 = iVar4;
    if ((*(char *)(iVar4 * 0x16 + -0x777b) == DAT_3c04_0110) &&
       (*(int *)(iVar4 * 0x16 + -0x7774) != 0)) {
      iVar2 = thunk_FUN_824f_044a(*(undefined2 *)(iVar4 * 0x16 + -0x7780),
                                  *(undefined2 *)(iVar4 * 0x16 + -0x777e));
      if (-1 < iVar2) {
        puVar1 = (uint *)(iVar4 * 0x16 + -0x7774);
        *puVar1 = *puVar1 & 0xefff;
      }
    }
  }
  return;
}

