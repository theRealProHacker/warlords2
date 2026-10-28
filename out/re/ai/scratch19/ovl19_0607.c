// ovl19:0607 ent 568a7

void __cdecl16far FUN_562a_0607(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  
  iVar5 = -1;
  uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar4 = DAT_451b_018e;
  iVar1 = -1;
  iVar2 = *(iVar4 + 0x24a);
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    iVar2 = iVar3;
    if ((*(iVar4 + iVar3 * 0x5c + 0x24c) != 0) &&
       (iVar5 < *(iVar4 + iVar3 * 0x5c + 0x24c))) {
      iVar5 = *(iVar4 + iVar3 * 0x5c + 0x24c);
      iVar1 = iVar3;
    }
  }
  if (iVar1 != -1) {
    FUN_562a_066d(iVar1,2);
  }
  return;
}

