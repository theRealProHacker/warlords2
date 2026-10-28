
void __cdecl16far FUN_6a62_0e4a(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 in_DX;
  int iVar4;
  undefined1 local_52 [80];
  
  FUN_22bf_07a5();
  if (param_1 == 0) {
    thunk_FUN_7875_06ae(1,0xf,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0x7f);
    thunk_FUN_7e8f_00d6(0x140,0x40,uVar1,in_DX);
    thunk_FUN_85d0_0bf7();
    thunk_FUN_85d0_0bf7();
    thunk_FUN_7875_06ae(2,0xf,0x30000);
    thunk_FUN_7e8f_04f0(0x7f,1,DAT_3c04_0110 * 0x14,0x3c04);
    FUN_1000_4944();
    thunk_FUN_7e8f_00d6(0x140,0x68,local_52);
    uVar1 = thunk_FUN_7e8f_04f0(0x2007f);
    thunk_FUN_7e8f_00d6(0x140,0x15c,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x3007f);
    thunk_FUN_7e8f_00d6(0x140,0x170,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x4007f);
    thunk_FUN_7e8f_00d6(0x140,0x184,uVar1,in_DX);
  }
  thunk_FUN_7875_06ae(2,0xf,0x30000);
  for (iVar4 = 0; iVar4 < 0x1b; iVar4 = iVar4 + 1) {
    iVar3 = 0;
    while ((iVar3 < 0x1d && (*(char *)(DAT_3c04_0110 * 0x1d + iVar3 + 0x60b) != iVar4))) {
      iVar3 = iVar3 + 1;
    }
    if (DAT_4125_0d56 == iVar4) {
      iVar2 = DAT_3c04_0110 + 2;
    }
    else {
      iVar2 = 1;
    }
    thunk_FUN_85d0_08be(iVar3,DAT_3c04_0110,0x342a,0x4125,(iVar4 % 4) * 0x78 + 0x58,
                        (iVar4 / 4) * 0x1f + 0x80,0,0,0,iVar2,0);
    if (param_1 == 0) {
      FUN_1000_4944(local_52);
      thunk_FUN_7e8f_00bf((iVar4 % 4) * 0x78 + 0x80,(iVar4 / 4) * 0x1f + 0x86,local_52);
    }
  }
  FUN_22bf_0757();
  return;
}

