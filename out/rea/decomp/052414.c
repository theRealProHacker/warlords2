
int __cdecl16far FUN_5131_1104(int param_1)

{
  int iVar1;
  
  if (*(char *)(param_1 * 0x41 + 0x1592) == '\x0f') {
    iVar1 = thunk_FUN_7e8f_02bf(1,0xffff0004);
    if (DAT_4125_02d6 != 0) {
      iVar1 = iVar1 + 4;
    }
    if (DAT_4125_02da != 0) {
      iVar1 = iVar1 + 2;
    }
    if (DAT_4125_02d8 != 0) {
      iVar1 = iVar1 + -1;
    }
    if (DAT_4125_02de != 0) {
      iVar1 = iVar1 + -2;
    }
    if (8 < iVar1) {
      iVar1 = 9;
    }
    if (iVar1 < 1) {
      iVar1 = 0;
    }
  }
  else {
    iVar1 = 9;
  }
  return iVar1;
}

