
void __cdecl16far thunk_FUN_4fc0_0029(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  int iStack_6;
  int iStack_4;
  
  iStack_4 = thunk_FUN_7e8f_02bf(1,5,3);
  for (iVar3 = 0; iVar3 < iStack_4; iVar3 = iVar3 + 1) {
    iVar1 = thunk_FUN_7e8f_02bf(1,3,0);
    iVar2 = thunk_FUN_7e8f_02bf(1,8,0xffff);
    iStack_6 = param_1 + iVar1 * *(int *)((int)DAT_451b_002a + iVar2 * 4 + 0xbc);
    iVar1 = thunk_FUN_7e8f_02bf(1,3,0);
    iVar2 = thunk_FUN_7e8f_02bf(1,8,0xffff);
    iVar1 = param_2 + iVar1 * *(int *)((int)DAT_451b_002a + iVar2 * 4 + 0xbe);
    thunk_FUN_4bea_0470(&iStack_6);
    uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    if (*(char *)((int)DAT_451b_002a + iVar1 * 0x70 + iStack_6 + 0x6120) == '\a') {
      *(undefined1 *)((int)DAT_451b_002a + iVar1 * 0x70 + iStack_6 + 0x6120) = 8;
      thunk_FUN_4bea_03aa(iStack_6,iVar1);
    }
  }
  return;
}

