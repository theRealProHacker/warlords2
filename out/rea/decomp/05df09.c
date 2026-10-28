
void __cdecl16far FUN_5d9f_0519(void)

{
  undefined2 in_DX;
  int iVar1;
  int iVar2;
  
  if (DAT_4125_0832 == 0) {
    FUN_5d9f_04c5();
  }
  iVar1 = 8;
  while (iVar2 = iVar1 + -1, iVar1 != 0) {
    DAT_451b_018e._0_2_ = FUN_1d28_069a(*(undefined4 *)(iVar2 * 4 + 0x40ca));
    DAT_451b_018e._2_2_ = in_DX;
    thunk_FUN_59a9_084d();
    FUN_1d28_07a9(*(undefined4 *)(iVar2 * 4 + 0x40ca));
    iVar1 = iVar2;
  }
  return;
}

