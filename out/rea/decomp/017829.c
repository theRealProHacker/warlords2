
void __cdecl16far FUN_177b_0079(void)

{
  int iVar1;
  int iVar2;
  
  if (DAT_4125_1258 != 0) {
    DAT_4125_1258 = 0;
    iVar1 = 0x15;
    while (iVar2 = iVar1 + -1, iVar1 != 0) {
      *(undefined2 *)(iVar2 * 2 + 0x44f2) = 0;
      *(undefined2 *)(iVar2 * 2 + 0x451c) = 0;
      *(undefined2 *)(iVar2 * 2 + 0x4546) = 0;
      *(undefined2 *)(iVar2 * 2 + 0x4570) = 0;
      *(undefined2 *)(iVar2 * 2 + 0x459a) = 0;
      iVar1 = iVar2;
    }
  }
  return;
}

