
void __cdecl16far FUN_6d27_0096(int param_1,int param_2)

{
  undefined2 uVar1;
  int *piVar2;
  int iVar3;
  int in_DX;
  undefined1 local_58 [80];
  int local_8;
  undefined4 local_6;
  
  FUN_22bf_07a5();
  if (param_1 != 0) {
    if (DAT_4125_166a == 0) {
      DAT_4125_166a = 1;
      thunk_FUN_54e4_0000();
      FUN_6d27_1009();
    }
    else {
      thunk_FUN_54e4_07e4(0,0x10f0000);
      if (DAT_4125_0dc4 != 1) {
        thunk_FUN_54e4_07e4(0x540000,0x1e0000);
      }
    }
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0x5b,DAT_4125_0dc4);
    thunk_FUN_7e8f_00d6(0x4001b0,uVar1,in_DX);
  }
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  if ((param_2 != 0) || (param_1 != 0)) {
    thunk_FUN_54e4_070b(0x1220010,0x140050);
    FUN_1000_4944();
    thunk_FUN_7e8f_00d6(0x15e0138,local_58);
  }
  if (param_1 != 0) {
    if (DAT_4125_0dc4 == 1) {
      FUN_6d27_18da();
    }
    else {
      FUN_6d27_034a();
    }
  }
  if ((((param_1 != 0) || (param_2 != 0)) && (DAT_4125_0dc4 == 1)) &&
     (FUN_6d27_16ba(), param_1 == 0)) {
    FUN_6d27_18da();
  }
  if (((param_1 != 0) || (param_2 != 0)) && (DAT_4125_0dc4 != 1)) {
    in_DX = DAT_4125_0dc6 +
            (int)(((long)DAT_451b_04de * (long)DAT_4125_0dca) / (long)(DAT_451b_04dc + -1));
    DAT_451b_04c8 = CONCAT22(DAT_4125_0dc8 + -2,in_DX);
    DAT_451b_04cc = CONCAT22(DAT_4125_0dc8 + DAT_4125_0dcc + 6,in_DX);
    FUN_24d0_0002();
    FUN_2133_0095(DAT_451b_04c8,DAT_451b_04cc,DAT_451b_04d0);
    if (DAT_4125_0dc4 == 3) {
      piVar2 = (int *)FUN_6d27_1161();
      local_6 = (int *)CONCAT22(in_DX,piVar2);
      iVar3 = 0;
      local_8 = 0;
      for (in_DX = 0; in_DX < 8; in_DX = in_DX + 1) {
        if (iVar3 < *local_6) {
          iVar3 = *local_6;
          local_8 = in_DX;
        }
        local_6 = (int *)CONCAT22((int)((ulong)local_6 >> 0x10),(int *)local_6 + 1);
      }
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944(local_58);
    }
    else {
      iVar3 = (*DAT_451b_04c4)(0x2133,DAT_451b_04de);
      piVar2 = (int *)(iVar3 + DAT_3c04_0110 * 2);
      local_6 = (int *)CONCAT22(in_DX,piVar2);
      thunk_FUN_7e8f_04f0(0x5c,DAT_4125_0dc4,DAT_451b_04de,*piVar2);
      FUN_1000_4944(local_58);
    }
    thunk_FUN_54e4_070b(0x1020000,0x140150);
    thunk_FUN_7e8f_00d6(0x13e01b0,local_58);
  }
  if (param_1 != 0) {
    thunk_FUN_830b_0000(0,0);
  }
  if ((param_2 != 0) || (param_1 != 0)) {
    uVar1 = FUN_6d27_1126();
    thunk_FUN_830b_12d3(0,uVar1,in_DX);
    thunk_FUN_830b_04d3(0);
  }
  FUN_22bf_0757();
  return;
}

