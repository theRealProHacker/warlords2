
void __cdecl16far FUN_59a9_0b55(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_3c04_157b;
  if (DAT_3c04_0124 != 0) {
    while (iVar2 = iVar1 + -1, iVar1 != 0) {
      iVar1 = iVar2;
      if ((*(byte *)((int)DAT_451b_018e + iVar2 + 0x11e) & 1) != 0) {
        FUN_59a9_0b95(iVar2);
      }
    }
  }
  return;
}

