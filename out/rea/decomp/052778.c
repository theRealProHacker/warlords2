
void __cdecl16far FUN_5131_1468(int param_1)

{
  int iVar1;
  undefined1 local_18 [20];
  int local_4;
  
  iVar1 = thunk_FUN_7e8f_02bf(1,10);
  if (iVar1 < 7) {
    local_4 = 3;
  }
  else {
    local_4 = 2;
  }
  FUN_1000_4a70(local_18);
  thunk_FUN_7e8f_02bf(1,0x14,0xffff);
  FUN_1000_4a70(local_18);
  if (local_4 == 3) {
    thunk_FUN_7e8f_02bf(1,0x14,0xffff);
    FUN_1000_4a01(local_18);
  }
  iVar1 = thunk_FUN_7e8f_02bf(1,10);
  if (iVar1 < 7) {
    if (DAT_4125_02de != 0) {
      thunk_FUN_7e8f_02bf(1,10,0xffff);
      goto LAB_5131_15ed;
    }
    if (DAT_4125_02d8 != 0) {
      thunk_FUN_7e8f_02bf(1,10,0xffff);
      goto LAB_5131_15ed;
    }
    if (DAT_4125_02d6 != 0) {
      thunk_FUN_7e8f_02bf(1,10,0xffff);
      goto LAB_5131_15ed;
    }
    if (DAT_4125_02dc != 0) {
      thunk_FUN_7e8f_02bf(1,10,0xffff);
      goto LAB_5131_15ed;
    }
    iVar1 = thunk_FUN_7e8f_02bf(1,10);
    if (iVar1 < 5) {
      thunk_FUN_7e8f_02bf(1,10,0xffff);
      goto LAB_5131_15ed;
    }
  }
  thunk_FUN_7e8f_02bf(1,0x14,0xffff);
LAB_5131_15ed:
  FUN_1000_4a01(local_18);
  FUN_1000_4a70(param_1 * 0x41 + 0x1581,0x3c04,local_18);
  return;
}

