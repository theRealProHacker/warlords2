// ovl27:083e ent 5f80e

void __cdecl16far FUN_5efd_083e(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  
  iVar3 = *(DAT_451b_018e + 0x24a);
  while (iVar4 = iVar3 + -1, iVar3 != 0) {
    iVar3 = iVar4;
    if (*(DAT_451b_018e + iVar4 * 0x5c + 0x24c) != 0) {
      iVar1 = 4;
      while (iVar2 = iVar1 + -1, iVar1 != 0) {
        uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        iVar1 = iVar2;
        if (*(DAT_451b_018e + iVar4 * 0x5c + iVar2 * 2 + 0x252) == param_1) {
          *(DAT_451b_018e + iVar4 * 0x5c + iVar2 * 2 + 0x252) = 0xffff;
          *(&DAT_4125_15ae + param_1 * 0x41) = 0;
        }
      }
    }
  }
  return;
}

