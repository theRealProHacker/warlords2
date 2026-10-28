
void __cdecl16far FUN_5d9f_085f(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int local_4;
  
  iVar4 = *(int *)((int)DAT_451b_018e + 0x24a);
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar3 = (int)DAT_451b_018e;
    iVar4 = iVar5;
    if (((*(int *)(iVar3 + iVar5 * 0x5c + 0x24c) != 0) &&
        (iVar1 = *(int *)(iVar3 + iVar5 * 0x5c + 0x250), iVar1 != -1)) &&
       (*(char *)(iVar1 * 0x41 + 0x1592) == DAT_3c04_0110)) {
      *(undefined1 *)(iVar3 + iVar1 + 0x56) = 7;
      local_4 = 4;
      while (iVar3 = local_4 + -1, local_4 != 0) {
        uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        iVar2 = *(int *)((int)DAT_451b_018e + iVar5 * 0x5c + iVar3 * 2 + 0x252);
        local_4 = iVar3;
        if ((iVar2 != -1) && (*(char *)((int)DAT_451b_018e + iVar2 + 0x56) == '\x06')) {
          thunk_FUN_621e_0f10(iVar2,iVar1);
        }
      }
    }
  }
  return;
}

