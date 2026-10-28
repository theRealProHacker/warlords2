
void __cdecl16far FUN_562a_1a2a(int param_1)

{
  int *piVar1;
  int iVar2;
  
  iVar2 = thunk_FUN_63da_0834();
  if (iVar2 != 0) {
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x7af,0x4125,param_1 * 0x41 + 0x1581,0x3c04);
    thunk_FUN_67a7_16b3((undefined1 *)&DAT_451b_1d28,0x4125);
    piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
    *piVar1 = *piVar1 + iVar2;
    thunk_FUN_63da_0886();
    iVar2 = thunk_FUN_7e8f_02bf(1,5);
    piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
    *piVar1 = *piVar1 + iVar2;
  }
  return;
}

