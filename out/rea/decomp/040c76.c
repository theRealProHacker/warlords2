
void __cdecl16far thunk_FUN_7e8f_03a0(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  
  iVar1 = FUN_170b_0006((char *)s_FDATA_STRING_DAT_4125_2693 + 1,0x4125,2);
  if (-1 < iVar1) {
    iVar1 = FUN_170b_00a9();
    uVar2 = FUN_1d28_011f((long)iVar1,0,0xa6);
    DAT_451b_1cd4 = CONCAT22(in_DX,uVar2);
    FUN_1d28_069a(uVar2,in_DX);
    FUN_170b_006d();
    FUN_1d28_07a9(DAT_451b_1cd4);
    FUN_170b_003a();
    iVar1 = FUN_170b_0006((char *)s_DATA_ERROR_DAT_4125_26a4,0x4125,2);
    if (-1 < iVar1) {
      iVar1 = FUN_170b_00a9();
      uVar2 = FUN_1d28_011f((long)iVar1,0,0xa7);
      DAT_451b_1ccc = CONCAT22(in_DX,uVar2);
      FUN_1d28_069a(uVar2,in_DX);
      FUN_170b_006d();
      FUN_1d28_07a9(DAT_451b_1ccc);
      FUN_170b_003a();
      iVar1 = FUN_170b_0006((char *)s_DATA_FILE_DAT_4125_26b3,0x4125,2);
      if (-1 < iVar1) {
        iVar1 = FUN_170b_00a9();
        uVar2 = FUN_1d28_011f((long)iVar1,0,0xa8);
        DAT_451b_1cd0 = CONCAT22(in_DX,uVar2);
        FUN_1d28_069a(uVar2,in_DX);
        FUN_170b_006d();
        FUN_1d28_07a9(DAT_451b_1cd0);
        FUN_170b_003a();
      }
    }
  }
  return;
}

