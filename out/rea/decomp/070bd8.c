
void __cdecl16far FUN_705a_0638(int param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  undefined4 uVar2;
  
  if (param_1 == 0) {
    thunk_FUN_54e4_070b(0xa10040,0x2800bc);
    if (DAT_4125_0e94 == 1) {
      uVar1 = thunk_FUN_7e8f_04f0(0x2009b);
      thunk_FUN_7e8f_00bf(0xdd0170,uVar1,in_DX);
      uVar1 = 3;
    }
    else {
      uVar1 = thunk_FUN_7e8f_04f0(0x9b);
      thunk_FUN_7e8f_00bf(0xdd0170,uVar1,in_DX);
      uVar1 = 1;
    }
    uVar1 = thunk_FUN_7e8f_04f0(0x9b,uVar1);
    uVar2 = CONCAT22(in_DX,uVar1);
    uVar1 = 0xf1;
  }
  else {
    thunk_FUN_54e4_070b(0xd40040,0x2800bc);
    if (DAT_4125_0e94 == 2) {
      uVar1 = thunk_FUN_7e8f_04f0(0x2009c);
      thunk_FUN_7e8f_00bf(0x1100170,uVar1,in_DX);
      uVar1 = 3;
    }
    else {
      uVar1 = thunk_FUN_7e8f_04f0(0x9c);
      thunk_FUN_7e8f_00bf(0x1100170,uVar1,in_DX);
      uVar1 = 1;
    }
    uVar1 = thunk_FUN_7e8f_04f0(0x9c,uVar1);
    uVar2 = CONCAT22(in_DX,uVar1);
    uVar1 = 0x124;
  }
  thunk_FUN_7e8f_00bf(0x170,uVar1,uVar2);
  return;
}

