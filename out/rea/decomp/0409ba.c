
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_79c4_02cd(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  byte bStack_38;
  uint uStack_14;
  uint uStack_8;
  int iStack_6;
  int iStack_4;
  
  thunk_FUN_7e8f_0a1b();
  iVar1 = FUN_170b_0006((char *)s_DATA_AREA_DAT_4125_16a8,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Area_file_not_found_4125_16b6,0x4125);
  }
  uStack_8 = 0;
  for (iStack_4 = 0; iStack_4 < 7; iStack_4 = iStack_4 + 1) {
    FUN_170b_006d();
    if (uStack_8 < uStack_14) {
      uStack_8 = uStack_14;
    }
    for (iStack_6 = 0; iStack_6 < (int)uStack_14; iStack_6 = iStack_6 + 1) {
      FUN_170b_006d();
    }
  }
  FUN_170b_003a();
  DAT_4125_168e = FUN_1d28_01d5();
  _DAT_4125_1690 = in_DX;
  iVar1 = FUN_170b_0006((char *)s_DATA_BUTTON_DAT_4125_16ca,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Button_file_not_found_4125_16da,0x4125);
  }
  for (iStack_4 = 0; iStack_4 < 0x24; iStack_4 = iStack_4 + 1) {
    FUN_170b_006d();
    if ((int)uStack_8 < (int)(uint)bStack_38) {
      uStack_8 = (uint)bStack_38;
    }
    for (iStack_6 = 0; iStack_6 < (int)(uint)bStack_38; iStack_6 = iStack_6 + 1) {
      FUN_170b_006d();
    }
  }
  FUN_170b_003a();
  DAT_4125_168a = FUN_1d28_01d5();
  _DAT_4125_168c = in_DX;
  thunk_FUN_7e8f_0a1b();
  iVar1 = FUN_170b_0006((char *)s_DATA_AREA_DAT_4125_16f0,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Area_file_not_found_4125_16fe,0x4125);
  }
  iVar1 = FUN_170b_00a9();
  uVar2 = FUN_1d28_011f((long)iVar1,0,0x85);
  DAT_451b_0ce8 = CONCAT22(in_DX,uVar2);
  FUN_1d28_069a(uVar2,in_DX);
  FUN_170b_006d();
  FUN_1d28_07a9(DAT_451b_0ce8);
  FUN_170b_003a();
  iVar1 = FUN_170b_0006((char *)s_DATA_JOIN_DAT_4125_1712,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Join_file_not_found_4125_1720,0x4125);
  }
  iVar1 = FUN_170b_00a9();
  uVar2 = FUN_1d28_011f((long)iVar1,0,0x86);
  DAT_451b_0cec = CONCAT22(in_DX,uVar2);
  FUN_1d28_069a(uVar2,in_DX);
  FUN_170b_006d();
  FUN_1d28_07a9(DAT_451b_0cec);
  FUN_170b_003a();
  iVar1 = FUN_170b_0006((char *)s_DATA_BUTTON_DAT_4125_1734,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Button_file_not_found_4125_1744,0x4125);
  }
  iVar1 = FUN_170b_00a9();
  uVar2 = FUN_1d28_011f((long)iVar1,0,0x87);
  DAT_451b_0ce4 = CONCAT22(in_DX,uVar2);
  FUN_1d28_069a(uVar2,in_DX);
  FUN_170b_006d();
  FUN_1d28_07a9(DAT_451b_0ce4);
  FUN_170b_003a();
  thunk_FUN_7e8f_0a1b();
  return;
}

