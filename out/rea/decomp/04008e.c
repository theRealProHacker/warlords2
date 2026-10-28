
int __cdecl16far thunk_FUN_63da_0834(int param_1)

{
  int iVar1;
  undefined1 auStack_44 [30];
  uint uStack_26;
  
  iVar1 = thunk_FUN_705a_094f(param_1);
  if (iVar1 < 1) {
    iVar1 = 0;
  }
  else {
    thunk_FUN_705a_14ac(0x4058,(int)*(char *)(param_1 * 0x41 + iVar1 + 0x1592),auStack_44);
    iVar1 = (int)((uStack_26 ^ (int)uStack_26 >> 0xf) - ((int)uStack_26 >> 0xf)) / 2;
  }
  return iVar1;
}

