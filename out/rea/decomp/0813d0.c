
void __cdecl16far FUN_8027_1160(long param_1,long param_2)

{
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  if (param_1 != 0) {
    thunk_FUN_7e8f_00d6(DAT_4125_2ad0,param_1);
  }
  if (param_2 != 0) {
    thunk_FUN_7e8f_00d6(DAT_4125_2ad4,param_2);
  }
  FUN_22bf_0757();
  DAT_4125_166a = 1;
  thunk_FUN_7e8f_0142();
  DAT_4125_166a = 0;
  thunk_FUN_54e4_069c();
  return;
}

