
void __cdecl16far thunk_FUN_4bea_01ff(int param_1)

{
  int iVar1;
  uint unaff_SI;
  ulong uVar2;
  undefined4 uStack_16;
  undefined4 auStack_12 [2];
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  int iStack_4;
  
  uVar2 = (ulong)unaff_SI;
  uStack_6 = 0x15;
  iStack_4 = ((param_1 + 10) / 10) * 0x10 + 0x10;
  FUN_216d_002e(auStack_12);
  thunk_FUN_54e4_093a(uVar2);
  FUN_216d_000e(&uStack_16);
  FUN_1000_1e79(uStack_16);
  FUN_1997_027e();
  FUN_24d0_0002();
  thunk_FUN_54e4_08f6(auStack_8);
  iVar1 = thunk_FUN_54e4_093a();
  if (iVar1 == 0x17) {
    FUN_216d_002e(auStack_12);
    thunk_FUN_54e4_070b(auStack_12[0]);
    thunk_FUN_7875_06ae(2);
    FUN_1000_4944();
  }
  else {
    FUN_216d_002e(auStack_12);
    thunk_FUN_54e4_070b(auStack_12[0]);
    thunk_FUN_7875_06ae(2);
    FUN_1000_4944();
  }
  thunk_FUN_7e8f_00d6(0x148);
  return;
}

