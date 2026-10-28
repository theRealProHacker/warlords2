
void __cdecl16far FUN_6d27_0a21(int param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  undefined4 local_e;
  undefined1 local_a [8];
  
  FUN_22bf_07a5();
  if (param_1 != 0) {
    if (DAT_4125_166a == 0) {
      DAT_4125_166a = 1;
      thunk_FUN_54e4_0000();
      thunk_FUN_7875_06ae(0xf0001,0x30000);
      uVar1 = thunk_FUN_7e8f_04f0(0x50);
      thunk_FUN_7e8f_00d6(0x400140,uVar1,in_DX);
    }
    else {
      thunk_FUN_54e4_070b(0x750040,0xa80170);
    }
  }
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    FUN_216d_002e(local_a);
    FUN_216d_000e(&local_e);
    FUN_1000_1e79(local_e);
    FUN_1997_0129();
    FUN_216d_002e(local_a);
    FUN_216d_000e(&local_e);
    FUN_1000_1e79();
    FUN_1997_027e();
  }
  thunk_FUN_85d0_08be(4,DAT_451b_04c2,0x342a,0x4125,0x68,0xa8,0,0x10000,0);
  thunk_FUN_85d0_08be(0x19,DAT_451b_04c2,0x342a,0x4125,0x68,0xcb,0,0x10000,0);
  thunk_FUN_85d0_08be(0x1c,DAT_451b_04c2,0x342a,0x4125,0x68,0xee,0,0x10000,0);
  thunk_FUN_85d0_08be(5,DAT_451b_04c2,0x342a,0x4125,0x68,0x111,0,0x10000,0);
  thunk_FUN_85d0_08be(0x1d,DAT_451b_04c2,0x342a,0x4125,0x68,0x134,0,0x10000,0);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  for (iVar2 = 0; iVar2 < 5; iVar2 = iVar2 + 1) {
    if (0 < *(int *)(DAT_3c04_0110 * 0x50 + DAT_451b_04c2 * 10 + iVar2 * 2 + 0x1163)) {
      thunk_FUN_7e8f_04f0();
      FUN_1000_4944();
      thunk_FUN_7e8f_00bf(0x90,iVar2 * 0x23 + 0xb1,&stack0xff9e);
    }
  }
  FUN_22bf_0757();
  return;
}

