
void FUN_7533_1652(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  DAT_4125_166a = 1;
  thunk_FUN_79c4_056a();
  FUN_18a9_066e(0x101d5);
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0x68);
  thunk_FUN_7e8f_00d6(0x3f0140,uVar1,in_DX);
  thunk_FUN_7875_06ae(2,*(undefined2 *)(DAT_3c04_0110 * 2 + 0xa0),
                      *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0),3);
  uVar1 = thunk_FUN_7e8f_04f0(0x10068);
  thunk_FUN_7e8f_00bf(0x690080,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x20068);
  thunk_FUN_7e8f_00bf(0x690110,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x30068);
  thunk_FUN_7e8f_00d6(0x690188,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x40068);
  thunk_FUN_7e8f_00d6(0x6901b8,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x50068);
  thunk_FUN_7e8f_00d6(0x6901e8,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x60068);
  thunk_FUN_7e8f_00d6(0x690218,uVar1,in_DX);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  FUN_7533_1a1d();
  return;
}

