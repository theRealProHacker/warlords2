
void __cdecl16far FUN_63da_029f(void)

{
  int *piVar1;
  int iVar2;
  undefined1 local_52 [80];
  
  FUN_1000_4944(local_52);
  thunk_FUN_8027_10fb(local_52);
  thunk_FUN_85d0_006c();
  thunk_FUN_647b_016b();
  thunk_FUN_54e4_069c();
  thunk_FUN_8027_011f();
  DAT_4125_0a3e = 0;
  iVar2 = thunk_FUN_7e8f_02bf();
  piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
  *piVar1 = *piVar1 + iVar2 + 10;
  thunk_FUN_4974_1ded(2,0,0);
  return;
}

