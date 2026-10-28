
void __cdecl16far FUN_6d27_1009(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined4 local_6;
  
  uVar1 = thunk_FUN_7e8f_0505(6,0,2);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (-1 < iVar2) {
    FUN_170b_008c();
    FUN_170b_006d();
    DAT_451b_04d8._0_2_ = FUN_1d28_011f(local_6 + -4,0,0x4d2,0);
    DAT_451b_04d8._2_2_ = in_DX;
    uVar1 = FUN_1d28_069a((undefined2)DAT_451b_04d8,in_DX);
    DAT_451b_04d4 = CONCAT22(in_DX,uVar1);
    FUN_170b_008c();
    FUN_170b_006d();
    FUN_170b_003a(iVar2);
    DAT_451b_04d0._0_2_ = FUN_1d28_01d5(DAT_4125_0dcc + 10);
    DAT_451b_04d0._2_2_ = in_DX;
  }
  return;
}

