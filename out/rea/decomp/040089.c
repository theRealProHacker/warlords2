
int __cdecl16far thunk_FUN_63da_07d0(int param_1)

{
  int iVar1;
  int iVar2;
  undefined1 auStack_44 [30];
  uint uStack_26;
  int iStack_6;
  int iStack_4;
  
  iVar2 = 0;
  iStack_4 = thunk_FUN_705a_094f(param_1);
  if (iStack_4 < 2) {
    iVar2 = 0;
  }
  else {
    for (iVar1 = 1; iVar1 < iStack_4; iVar1 = iVar1 + 1) {
      thunk_FUN_705a_14ac(0x4058,(int)*(char *)(param_1 * 0x41 + iVar1 + 0x1593),auStack_44);
      iStack_6 = (uStack_26 ^ (int)uStack_26 >> 0xf) - ((int)uStack_26 >> 0xf);
      iVar2 = iVar2 + iStack_6 / 2;
    }
  }
  return iVar2;
}

