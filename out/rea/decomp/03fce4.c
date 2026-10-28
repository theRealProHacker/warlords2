
void __cdecl16far thunk_FUN_5ab9_10e3(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined1 auStack_12 [16];
  
  iVar2 = DAT_3c04_157b;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    iVar2 = iVar3;
    if (*(char *)(iVar3 * 0x41 + 0x1592) == (char)DAT_3c04_0110) {
      uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (((((*(byte *)((int)DAT_451b_018e + iVar3 + 0x11e) & 0x20) != 0) &&
           (*(char *)((int)DAT_451b_018e + iVar3 + 0x56) != '\a')) &&
          (iVar1 = thunk_FUN_621e_13b2(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                       *(undefined2 *)(iVar3 * 0x41 + 0x157f),auStack_12),
          iVar1 != 0)) &&
         ((iVar1 = FUN_5ab9_11a6(auStack_12), iVar1 == 1 &&
          (iVar1 = thunk_FUN_621e_0fd5(), iVar1 == 0)))) {
        *(undefined1 *)((int)DAT_451b_018e + iVar3 + 0x56) = 0xd;
      }
    }
  }
  return;
}

