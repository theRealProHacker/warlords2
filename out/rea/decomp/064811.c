
void __cdecl16far FUN_647b_0061(void)

{
  int *piVar1;
  int iVar2;
  
  iVar2 = thunk_FUN_7e8f_02bf(1,0x19);
  piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
  *piVar1 = *piVar1 + iVar2 + 0x19;
  FUN_647b_00fe(DAT_451b_01c2,DAT_451b_01c0,10);
  thunk_FUN_824f_03f9();
  thunk_FUN_824f_02bf();
  thunk_FUN_824f_0372();
  if (DAT_451b_01c4 == 0) {
    thunk_FUN_71d6_0000(0,DAT_4125_0e9a,DAT_4125_0e9c);
  }
  else {
    thunk_FUN_8027_0000(0);
  }
  return;
}

