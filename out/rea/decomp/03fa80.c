
void __cdecl16far thunk_FUN_54ad_0000(int param_1)

{
  int iVar1;
  int iVar2;
  int iStack_72;
  int iStack_70;
  undefined1 auStack_6e [100];
  undefined1 auStack_a [4];
  int iStack_6;
  int iStack_4;
  
  iStack_6 = 0;
  if (DAT_4125_1174 == 0) {
    iVar1 = FUN_170b_0006(0x5c6,0x4125,2);
    if (iVar1 < 0) {
      FUN_1000_43ac(0x5d8,0x4125);
    }
    else {
      FUN_170b_006d(iVar1,&iStack_4);
      iVar2 = 0;
      do {
        FUN_170b_006d(iVar1,&iStack_72);
        iVar2 = iVar2 + 1;
        if (iStack_72 == param_1) {
          iStack_6 = 1;
          break;
        }
      } while (iVar2 < iStack_4);
      FUN_170b_003a(iVar1);
      if (iStack_6 != 0) {
        if (iStack_70 == 0) {
          FUN_22bf_0af4(auStack_a);
          thunk_FUN_73de_1201(auStack_a._0_2_,auStack_a._2_2_,0);
          thunk_FUN_73de_1158(auStack_6e);
          DAT_4125_1174 = 1;
        }
        else {
          FUN_22bf_0af4(auStack_a);
          FUN_54ad_00df(iStack_70,auStack_a._0_2_,auStack_a._2_2_);
        }
      }
    }
  }
  return;
}

