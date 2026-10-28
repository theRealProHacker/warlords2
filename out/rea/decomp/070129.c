
void __cdecl16far FUN_6f60_0b29(void)

{
  int iVar1;
  
  FUN_7f3a_09cd((undefined1 *)&DAT_451b_3000);
  iVar1 = (int)*(char *)((int)DAT_451b_0504 + 800);
  FUN_7f3a_0a33();
  DAT_451b_0500 = DAT_451b_0500 + -5;
  for (DAT_451b_0502 = DAT_451b_0502 + -5; DAT_451b_0502 < 0; DAT_451b_0502 = DAT_451b_0502 + 1) {
    DAT_451b_0500 = DAT_451b_0500 + 1;
  }
  if (iVar1 + -1 <= DAT_451b_0500) {
    DAT_451b_0500 = iVar1 + -1;
  }
  DAT_4125_0e52 = (DAT_451b_0500 - DAT_451b_0502) + 1;
  FUN_22bf_07a5();
  FUN_7f3a_0ace(1);
  thunk_FUN_6ec8_026c();
  FUN_22bf_0757();
  return;
}

