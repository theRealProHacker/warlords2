
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_79c4_02cd(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  byte local_38;
  uint local_14;
  uint local_8;
  int local_6;
  int local_4;
  
  thunk_FUN_7e8f_0a1b();
  iVar1 = FUN_170b_0006((char *)s_DATA_AREA_DAT_4125_16a8,0x4125,2);
  if (iVar1 < 0) {
    thunk_FUN_79a9_0000((char *)s_Area_file_not_found_4125_16b6,0x4125);
  }
  local_8 = 0;
  for (local_4 = 0; local_4 < 7; local_4 = local_4 + 1) {
    FUN_170b_006d();
    if (local_8 < local_14) {
      local_8 = local_14;
    }
    for (local_6 = 0; local_6 < (int)local_14; local_6 = local_6 + 1) {
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
  for (local_4 = 0; local_4 < 0x24; local_4 = local_4 + 1) {
    FUN_170b_006d();
    if ((int)local_8 < (int)(uint)local_38) {
      local_8 = (uint)local_38;
    }
    for (local_6 = 0; local_6 < (int)(uint)local_38; local_6 = local_6 + 1) {
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

