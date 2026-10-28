
void __cdecl16far FUN_6513_146f(undefined2 param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000(2);
  thunk_FUN_7875_06ae(1,0xf,0,3);
  thunk_FUN_7e8f_00d6(0x1b0,0x3e,0xc7c,0x4125);
  thunk_FUN_7875_06ae(2,0xf,0,3);
  uVar1 = thunk_FUN_7e8f_04f0(0x3f,0);
  thunk_FUN_7e8f_00d6(0x1b0,0x78,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x3f,1);
  thunk_FUN_7e8f_00d6(0x1b0,0x8c,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x3f,2);
  thunk_FUN_7e8f_00d6(0x1b0,0xa0,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x3f,3);
  thunk_FUN_7e8f_00d6(0x1b0,0xb4,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x3f,4);
  thunk_FUN_7e8f_00d6(0x1b0,200,uVar1,in_DX);
  DAT_451b_01c6 = 0xf0;
  thunk_FUN_79c4_056a(10);
  DAT_4125_166a = 1;
  FUN_18a9_03b3(0x11a);
  if (DAT_451b_08ce < 1) {
    uVar1 = 2;
  }
  else {
    uVar1 = 1;
  }
  FUN_18a9_066e(0x117,uVar1);
  FUN_18a9_066e(0x118,1);
  FUN_18a9_0839(0xf);
  if (DAT_3c04_0124 == 0) {
    uVar1 = 2;
  }
  else {
    uVar1 = 1;
  }
  FUN_18a9_066e(0x119,uVar1);
  thunk_FUN_830b_05e4(0,0,param_1);
  thunk_FUN_830b_04d3(0,0);
  FUN_22bf_0757();
  return;
}

