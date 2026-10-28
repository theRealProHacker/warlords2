
void __cdecl16far FUN_64b0_0576(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  char local_6;
  char local_5;
  char local_4;
  
  if (param_1 == 0) {
    FUN_255e_0782();
    FUN_255e_0775();
    DAT_4125_0bee = (uint)(DAT_4125_0bee == 0);
    if (DAT_4125_0bee != 0) {
      thunk_FUN_7d9f_0000();
    }
  }
  else if (param_1 == 2) {
    DAT_4125_26c8 = (uint)(DAT_4125_26c8 == 0);
  }
  else {
    DAT_4125_0bec = (uint)(DAT_4125_0bec == 0);
  }
  FUN_64b0_0137(0xfffe);
  FUN_64b0_0067();
  uVar1 = thunk_FUN_7e8f_0505(0x44,0x90000);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (-1 < iVar2) {
    local_6 = (char)DAT_4125_0bee + '0';
    local_5 = (char)DAT_4125_0bec + '0';
    local_4 = '1' - (DAT_4125_26c8 != 0);
    FUN_170b_004e(iVar2,&local_6);
    FUN_170b_003a();
  }
  return;
}

