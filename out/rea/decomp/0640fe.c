
void __cdecl16far FUN_63da_035e(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = FUN_63da_07d0();
  FUN_63da_0941();
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 + iVar2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    FUN_63da_0508();
    thunk_FUN_8027_011f(0,0x10000);
    DAT_4125_0a3e = 0;
  }
  iVar3 = thunk_FUN_7e8f_02bf(1,10);
  piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
  *piVar1 = *piVar1 + iVar3 + 5;
  thunk_FUN_4974_1ded(1,iVar2,0);
  return;
}

