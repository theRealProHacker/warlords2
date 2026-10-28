
void __cdecl16far thunk_FUN_6f60_0805(void)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_6f60_076d();
  uVar2 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
  iVar1 = (int)DAT_451b_0504;
  if (*(char *)(iVar1 + 800) < '\x05') {
    DAT_4125_0e52 = (int)*(char *)(iVar1 + 800);
  }
  else {
    DAT_4125_0e52 = 5;
  }
  DAT_451b_0502 = 0;
  if (*(char *)(iVar1 + 800) + -1 < 4) {
    DAT_451b_0500 = *(char *)(iVar1 + 800) + -1;
  }
  else {
    DAT_451b_0500 = 4;
  }
  DAT_4125_0e50 = 0;
  FUN_6f60_07d3();
  FUN_22bf_07a5();
  FUN_6f60_086e(0x22bf,1);
  thunk_FUN_6ec8_026c();
  FUN_22bf_0757();
  return;
}

