
void __cdecl16far thunk_FUN_8027_137e(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iStack_6;
  int iStack_4;
  
  DAT_4125_2adc = thunk_FUN_54e4_08bf();
  if (DAT_4125_2adc == 0) {
    thunk_FUN_54e4_0000();
  }
  else {
    thunk_FUN_54e4_08f6(&iStack_4);
    thunk_FUN_54e4_070b(200 - iStack_4,0xaf - iStack_6,0x6900f8);
  }
  uVar1 = thunk_FUN_7e8f_04f0(0x6008a);
  uVar1 = thunk_FUN_7e8f_04f0(0x5008a,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x4008a,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x3008a,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x2008a,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x1008a,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x8a,uVar1,in_DX);
  FUN_8027_1471(uVar1,in_DX);
  thunk_FUN_4bea_01b5();
  thunk_FUN_4bea_01ff();
  return;
}

