
void __cdecl16far FUN_7533_12f9(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined1 local_34 [50];
  
  DAT_451b_0570 = param_1;
  FUN_22bf_07a5();
  if (DAT_451b_0570 == 0) {
    FUN_1000_1e79(DAT_4125_111a);
    uVar2 = 0x21;
  }
  else {
    FUN_1000_1e79(DAT_4125_111a);
    uVar2 = 0x22;
  }
  FUN_1997_0129(uVar2);
  iVar1 = thunk_FUN_8027_225b();
  if (iVar1 == 1) {
    if (DAT_451b_0570 == 0) {
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944(&stack0xff36);
    }
    else {
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944(&stack0xff36);
    }
  }
  else {
    if (DAT_451b_0570 == 0) {
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944(local_34);
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
    }
    else {
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944(local_34);
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
    }
    thunk_FUN_7e8f_04f0();
    FUN_1000_4944();
  }
  thunk_FUN_7875_06ae();
  thunk_FUN_7e8f_00d6();
  thunk_FUN_7e8f_00d6();
  thunk_FUN_7e8f_00d6();
  thunk_FUN_7e8f_00d6();
  FUN_1000_1e79();
  FUN_1997_0129();
  FUN_1000_1e79();
  FUN_1997_0129();
  FUN_7533_120c();
  FUN_22bf_0757();
  return;
}

