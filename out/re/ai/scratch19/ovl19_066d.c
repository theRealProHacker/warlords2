// ovl19:066d ent 5690d

void __cdecl16far FUN_562a_066d(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  
  uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  *(DAT_451b_018e + *(DAT_451b_018e + param_1 * 0x5c + 0x250) + 0x56)
       = 8;
  iVar2 = 4;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar1 = DAT_451b_018e;
    iVar2 = iVar3;
    if (*(iVar1 + param_1 * 0x5c + iVar3 * 2 + 0x252) != -1) {
      *(iVar1 + *(iVar1 + param_1 * 0x5c + iVar3 * 2 + 0x252) + 0x56) = 8;
    }
  }
  thunk_FUN_5efd_08ba(param_1);
  return;
}

