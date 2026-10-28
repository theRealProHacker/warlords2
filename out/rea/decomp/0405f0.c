
void __cdecl16far thunk_FUN_705a_1128(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  
  if (DAT_4125_0e88 == 0) {
    uVar1 = thunk_FUN_7e8f_0505(0x15,DAT_4125_26c4,DAT_3c04_0161);
    FUN_1000_4944(0x5c38,0x4125,uVar1,in_DX);
    FUN_170b_0006(0x5c38,0x4125,2);
    iVar2 = FUN_170b_00a9();
    uVar1 = FUN_1d28_011f((long)iVar2,0,0xde);
    DAT_4125_0e88 = CONCAT22(in_DX,uVar1);
    DAT_451b_051c._0_2_ = FUN_1d28_069a(uVar1,in_DX);
    DAT_451b_051c._2_2_ = in_DX;
    FUN_170b_006d();
    FUN_170b_003a();
    FUN_1d28_07a9(DAT_4125_0e88);
  }
  DAT_451b_051c._0_2_ = FUN_1d28_069a(DAT_4125_0e88);
  DAT_451b_051c._2_2_ = in_DX;
  return;
}

