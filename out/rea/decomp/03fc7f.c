
void __cdecl16far thunk_FUN_59a9_0c1c(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  undefined1 auStack_a [6];
  uint uStack_4;
  
  FUN_59a9_0b55();
  iVar1 = DAT_3c04_157b;
LAB_59a9_0c87:
  do {
    do {
      iVar2 = iVar1 + -1;
      if (iVar1 == 0) {
        return;
      }
      iVar1 = iVar2;
    } while (*(char *)((int)DAT_451b_018e + iVar2 + 0x56) != '\x02');
    thunk_FUN_57d5_01f6(iVar2,auStack_a);
    iVar3 = 6;
    do {
      iVar4 = iVar3 + -1;
      if (iVar3 == 0) goto LAB_59a9_0c87;
      uStack_4 = (uint)(byte)(&stack0xfff5)[iVar3];
      iVar3 = iVar4;
    } while ((uStack_4 == 0xff) ||
            (uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10),
            (*(byte *)((int)DAT_451b_018e + uStack_4 + 0x11e) & 1) != 0));
    *(undefined1 *)((int)DAT_451b_018e + iVar2 + 0x56) = 3;
  } while( true );
}

