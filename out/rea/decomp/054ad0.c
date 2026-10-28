
void __cdecl16far FUN_54ad_0000(int param_1)

{
  int iVar1;
  int iVar2;
  int local_72;
  int local_70;
  undefined1 local_6e [100];
  undefined1 local_a [4];
  int local_6;
  int local_4;
  
  local_6 = 0;
  if (DAT_4125_1174 == 0) {
    iVar1 = FUN_170b_0006(0x5c6,0x4125,2);
    if (iVar1 < 0) {
      FUN_1000_43ac(0x5d8,0x4125);
    }
    else {
      FUN_170b_006d(iVar1,&local_4);
      iVar2 = 0;
      do {
        FUN_170b_006d(iVar1,&local_72);
        iVar2 = iVar2 + 1;
        if (local_72 == param_1) {
          local_6 = 1;
          break;
        }
      } while (iVar2 < local_4);
      FUN_170b_003a(iVar1);
      if (local_6 != 0) {
        if (local_70 == 0) {
          FUN_22bf_0af4(local_a);
          thunk_FUN_73de_1201(local_a._0_2_,local_a._2_2_,0);
          thunk_FUN_73de_1158(local_6e);
          DAT_4125_1174 = 1;
        }
        else {
          FUN_22bf_0af4(local_a);
          FUN_54ad_00df(local_70,local_a._0_2_,local_a._2_2_);
        }
      }
    }
  }
  return;
}

