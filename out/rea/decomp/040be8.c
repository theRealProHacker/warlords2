
void __cdecl16far thunk_FUN_7d9f_0bc5(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  char cStack_6;
  char cStack_5;
  char cStack_4;
  
  uVar1 = thunk_FUN_7e8f_0505(0x44,0x20000);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  FUN_1000_4a70(&cStack_6);
  if (-1 < iVar2) {
    FUN_170b_006d(iVar2,&cStack_6);
    FUN_170b_003a();
  }
  DAT_4125_0bee = cStack_6 + -0x30;
  DAT_4125_0bec = cStack_5 + -0x30;
  if (DAT_4125_37a3 == '\0') {
    DAT_4125_0bee = 0;
  }
  if (DAT_4125_37a2 == '\0') {
    DAT_4125_0bec = 0;
  }
  if (DAT_4125_26c8 == 0) {
    DAT_4125_26c8 = (uint)(cStack_4 == '0');
  }
  else {
    DAT_4125_26c8 = 1;
  }
  if (DAT_4125_37a2 != '\0') {
    uVar1 = thunk_FUN_7e8f_0505(0x40);
    DAT_451b_1a14 = FUN_255e_04e9(uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_0505(0x10040);
    DAT_451b_1a16 = FUN_255e_04e9(uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_0505(0x20040);
    DAT_451b_1a18 = FUN_255e_04e9(uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_0505(0x50040);
    DAT_451b_1a1e = FUN_255e_04e9(uVar1,in_DX);
  }
  return;
}

