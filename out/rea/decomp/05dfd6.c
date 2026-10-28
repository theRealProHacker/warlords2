
void __cdecl16far FUN_5d9f_05e6(void)

{
  int iVar1;
  int in_DX;
  
  if (DAT_4125_0834 == 0) {
    iVar1 = FUN_1d28_011f(0x4b0,0,0);
    DAT_451b_0166 = CONCAT22(in_DX,iVar1);
    if (iVar1 == 0 && in_DX == 0) {
      thunk_FUN_79a9_0000(0x91b,0x4125);
    }
    DAT_4125_0834 = 1;
  }
  if (DAT_4125_0836 == 0) {
    DAT_451b_018a = FUN_1d28_069a(DAT_451b_0166);
    DAT_451b_018c = in_DX;
  }
  return;
}

