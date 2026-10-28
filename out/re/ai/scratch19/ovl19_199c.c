// ovl19:199c ent 57c3c

void __cdecl16far FUN_562a_199c(int param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = thunk_FUN_63da_07d0();
  if (iVar2 == 0) {
    FUN_562a_1a2a();
  }
  else {
    FUN_1000_4944(&DAT_451b_1d28,0x4125,0x79b,0x4125,param_1 * 0x41 + 0x1581,0x3c04);
    thunk_FUN_67a7_16b3(&DAT_451b_1d28,0x4125);
    thunk_FUN_63da_0941();
    iVar3 = thunk_FUN_7e8f_02bf(1,10);
    piVar1 = (DAT_3c04_0110 * 2 + 0x10e3);
    *piVar1 = *piVar1 + iVar3 + 5;
    piVar1 = (DAT_3c04_0110 * 0x14 + 0x185);
    *piVar1 = *piVar1 + iVar2;
  }
  return;
}

