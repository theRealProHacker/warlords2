
void __cdecl16far thunk_FUN_8027_10fb(long param_1)

{
  FUN_22bf_07a5();
  if (param_1 != 0) {
    thunk_FUN_54e4_0000();
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    thunk_FUN_7e8f_00d6(DAT_4125_2acc,param_1);
  }
  FUN_22bf_0757();
  DAT_4125_166a = 1;
  thunk_FUN_7e8f_0142();
  DAT_4125_166a = 0;
  if (param_1 != 0) {
    thunk_FUN_54e4_069c();
  }
  thunk_FUN_7e8f_01f1();
  return;
}

