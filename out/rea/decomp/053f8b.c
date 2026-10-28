
void __cdecl16far FUN_5304_0f4b(undefined4 param_1,undefined2 param_2,undefined2 param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = DAT_3c04_157b;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    iVar1 = FUN_1a8b_0acc(param_2,param_3,*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                          *(undefined2 *)(iVar3 * 0x41 + 0x157f));
    iVar2 = iVar3;
    if (iVar1 < 10) {
      *(undefined1 *)((int)param_1 + iVar3 + 600) = 1;
    }
  }
  return;
}

