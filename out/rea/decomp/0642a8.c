
void __cdecl16far FUN_63da_0508(undefined2 param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  undefined1 local_98 [2];
  undefined1 local_96 [60];
  undefined1 local_5a [80];
  undefined1 local_a [8];
  
  thunk_FUN_54e4_0000(0xc);
  thunk_FUN_7875_06ae(1,0xf,0,3);
  uVar1 = thunk_FUN_7e8f_04f0(0x44,param_1);
  thunk_FUN_7e8f_00d6(0x140,0x40,uVar1,in_DX);
  thunk_FUN_7875_06ae(2,0xf,0,3);
  thunk_FUN_7e8f_04f0(0x45,param_1,DAT_4125_0a3c * 0x41 + 0x1581,0x3c04);
  FUN_1000_4944(local_5a);
  thunk_FUN_7e8f_00d6(0x140,0x73,local_5a);
  thunk_FUN_7e8f_04f0(0x46,0,DAT_451b_01b4);
  FUN_1000_4944();
  thunk_FUN_7e8f_00d6(0x140,0x87,local_5a);
  thunk_FUN_7e8f_04f0(0x47,DAT_451b_01b8 != 1,DAT_451b_01b8);
  FUN_1000_4944();
  thunk_FUN_7e8f_00d6(0x140,0xa5,local_5a);
  thunk_FUN_7e8f_04f0(0x48,DAT_451b_01b6 != 1,DAT_451b_01b6);
  FUN_1000_4944();
  thunk_FUN_7e8f_00d6(0x140,0xb9,local_5a);
  uVar3 = 4;
  uVar4 = 2;
  uVar1 = FUN_216d_002e(local_a);
  FUN_24d0_02e5(uVar1,in_DX,uVar3,uVar4);
  uVar3 = 2;
  uVar4 = 4;
  uVar1 = FUN_216d_002e(local_a);
  FUN_24d0_02e5(uVar1,in_DX,uVar3,uVar4);
  uVar1 = thunk_FUN_7e8f_04f0(0x44,2);
  thunk_FUN_7e8f_00bf(0xc0,0xe6,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x44,3);
  thunk_FUN_7e8f_00bf(0x170,0xe6,uVar1,in_DX);
  for (iVar2 = 0; iVar2 < DAT_451b_01b8; iVar2 = iVar2 + 1) {
    thunk_FUN_85d0_08be(((undefined2 *)&DAT_451b_01ba)[iVar2],DAT_3c04_0110,0x342a,0x4125,0xd0,
                        iVar2 * 0x1e + 0xfa,0,0,0,1,0,0);
    thunk_FUN_705a_14ac(0x40f9,((undefined2 *)&DAT_451b_01ba)[iVar2],local_98);
    thunk_FUN_7e8f_00bf(0xf8,iVar2 * 0x1e + 0x100,local_96);
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf(0x170,iVar2 * 0x1e + 0x100,local_5a);
  }
  for (; iVar2 < 3; iVar2 = iVar2 + 1) {
    thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,0xd0,iVar2 * 0x1e + 0xfa,0,0,0,1,0,0);
  }
  thunk_FUN_8027_10fb(0,0);
  thunk_FUN_54e4_069c();
  thunk_FUN_54e4_069c();
  return;
}

