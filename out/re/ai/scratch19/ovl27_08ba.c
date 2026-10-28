// ovl27:08ba ent 5f88a

void __cdecl16far FUN_5efd_08ba(int param_1)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  
  uVar3 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  *(DAT_451b_018e + param_1 * 0x5c + 0x24c) = 0;
  *(DAT_451b_018e + param_1 * 0x5c + 0x24e) = 0xffff;
  *(DAT_451b_018e + param_1 * 0x5c + 0x250) = 0xffff;
  *(DAT_451b_018e + param_1 * 0x5c + 0x2a6) = 0;
  *(DAT_451b_018e + param_1 * 0x5c + 0x2a4) = 0;
  iVar2 = 4;
  while (iVar2 != 0) {
    *(DAT_451b_018e + param_1 * 0x5c + (iVar2 + -1) * 2 + 0x252) = 0xffff;
    iVar2 = iVar2 + -1;
  }
  iVar2 = 6;
  while (iVar1 = iVar2 + -1, iVar2 != 0) {
    uVar3 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x27e) = 0xffff;
    *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x272) = 0xffff;
    *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x292) = 0xffff;
    *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x25a) = 0xffff;
    iVar2 = iVar1;
  }
  iVar2 = 4;
  while (iVar2 != 0) {
    *(DAT_451b_018e + param_1 * 0x5c + (iVar2 + -1) * 2 + 0x28a) = 0xffff;
    iVar2 = iVar2 + -1;
  }
  return;
}

