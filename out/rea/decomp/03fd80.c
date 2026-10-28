
void __cdecl16far thunk_FUN_5c8e_01f1(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_3c04_157b;
  while (iVar2 = iVar1 + -1, iVar1 != 0) {
    iVar1 = iVar2;
    if ((*(char *)(iVar2 * 0x41 + 0x1592) == (char)DAT_3c04_0110) &&
       ((*(byte *)((int)DAT_451b_018e + iVar2 + 0x11e) & 4) == 0)) {
      FUN_5c8e_023f(iVar2,0);
    }
  }
  return;
}

