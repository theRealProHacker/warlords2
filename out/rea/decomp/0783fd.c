
void __cdecl16far FUN_76ef_150d(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  
  if (((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] != 0) {
    DAT_4125_166a = 1;
    thunk_FUN_54e4_0000();
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0xa5);
    thunk_FUN_7e8f_00d6(0x5c0140,uVar1,in_DX);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0x100a5);
    thunk_FUN_7e8f_00d6(0x8c0140,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x200a5);
    thunk_FUN_7e8f_00d6(0xa00140,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x300a5);
    thunk_FUN_7e8f_00d6(0xb40140,uVar1,in_DX);
    thunk_FUN_79c4_056a();
    FUN_18a9_066e(0x101e7);
    FUN_18a9_066e(0x101e8);
    FUN_18a9_066e(0x101e9);
  }
  return;
}

