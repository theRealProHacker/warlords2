
int __cdecl16far FUN_63da_07d0(int param_1)

{
  int iVar1;
  int iVar2;
  undefined1 local_44 [30];
  uint local_26;
  int local_6;
  int local_4;
  
  iVar2 = 0;
  local_4 = thunk_FUN_705a_094f(param_1);
  if (local_4 < 2) {
    iVar2 = 0;
  }
  else {
    for (iVar1 = 1; iVar1 < local_4; iVar1 = iVar1 + 1) {
      thunk_FUN_705a_14ac(0x4058,(int)*(char *)(param_1 * 0x41 + iVar1 + 0x1593),local_44);
      local_6 = (local_26 ^ (int)local_26 >> 0xf) - ((int)local_26 >> 0xf);
      iVar2 = iVar2 + local_6 / 2;
    }
  }
  return iVar2;
}

