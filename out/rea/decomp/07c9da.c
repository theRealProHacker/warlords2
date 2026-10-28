
void __cdecl16far FUN_7b71_12ca(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  int iVar3;
  undefined1 local_1a [8];
  int local_12;
  int local_10;
  uint local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  local_e = (uint)(param_1 < 6);
  FUN_22bf_07a5();
  local_4 = param_1;
  iVar3 = param_1;
  if (param_1 == -1) {
    local_4 = 9;
    iVar3 = 0;
    if (DAT_4125_166a == 0) {
      thunk_FUN_7875_06ae(0xf0001,0x30000);
      uVar2 = thunk_FUN_7e8f_04f0(8);
      thunk_FUN_7e8f_00d6(0x370140,uVar2,in_DX);
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      FUN_24d0_0002();
      FUN_2133_02fe();
      FUN_2133_02fe();
      FUN_24d0_0002();
      FUN_2133_02fe();
      FUN_2133_02fe();
      uVar2 = thunk_FUN_7e8f_04f0(9);
      local_10 = FUN_21e2_0a8e(uVar2,in_DX);
      uVar2 = thunk_FUN_7e8f_04f0(10);
      local_12 = FUN_21e2_0a8e(uVar2,in_DX);
      FUN_24d0_0002();
      iVar1 = 0x13c - local_10 / 2;
      uVar2 = FUN_216d_002e(local_1a);
      FUN_216d_0288(uVar2,iVar1);
      iVar1 = 0x13c - local_12 / 2;
      uVar2 = FUN_216d_002e(local_1a);
      FUN_216d_0288(uVar2,iVar1);
      uVar2 = thunk_FUN_7e8f_04f0();
      thunk_FUN_7e8f_00d6(0x680140,uVar2,iVar1);
      thunk_FUN_7e8f_04f0(10);
      thunk_FUN_7e8f_00d6(0xf30140);
    }
  }
  do {
    if (local_4 < iVar3) {
      if ((param_1 == -1) || (local_e != 0)) {
        FUN_7b71_0bab();
      }
      FUN_22bf_0757();
      return;
    }
    if (iVar3 < 6) {
      local_8 = (iVar3 / 2) * 0x1e + 0x83;
      iVar1 = iVar3 / 2;
      if (iVar1 == (iVar3 + 1) / 2) goto LAB_7b71_14a5;
LAB_7b71_14dc:
      local_6 = 0x140;
    }
    else {
      local_8 = ((iVar3 + -6) / 2) * 0x1e + 0x10e;
      iVar1 = (iVar3 + -6) / 2;
      if (iVar1 != (iVar3 + -5) / 2) goto LAB_7b71_14dc;
LAB_7b71_14a5:
      local_6 = 0x80;
    }
    local_a = local_6 + 0x80;
    local_c = local_8;
    if (param_1 == -1) {
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      uVar2 = thunk_FUN_7e8f_04f0(4,iVar3);
      thunk_FUN_7e8f_00bf(local_6,local_8,uVar2,iVar1);
    }
    thunk_FUN_54e4_070b(local_a + -0x78,local_c + -0x32,0x140038);
    thunk_FUN_7875_06ae(0x70002,0x30000);
    if (iVar3 == 0) {
      thunk_FUN_7e8f_04f0(5);
    }
    thunk_FUN_7e8f_00bf();
    iVar3 = iVar3 + 1;
  } while( true );
}

