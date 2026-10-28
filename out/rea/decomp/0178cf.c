
void __cdecl16far FUN_177b_011f(void)

{
  int iVar1;
  long local_6;
  
  iVar1 = thunk_FUN_7e8f_0a7c();
  if (iVar1 == 0) {
    FUN_1000_1bcf(0,&local_6);
    if (local_6 != DAT_4125_1248) {
      DAT_4125_1248 = local_6;
      DAT_4125_125a = DAT_4125_125a + 1 & 7;
      FUN_177b_0161(DAT_4125_125a);
    }
  }
  return;
}

