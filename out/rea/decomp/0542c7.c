
void __cdecl16far FUN_53ff_02d7(int param_1)

{
  FUN_22bf_07a5();
  if (param_1 == 0) {
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    thunk_FUN_7e8f_00d6(0x5e0140,0x3eb,0x4125);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    thunk_FUN_7e8f_00d6(0x8c0140,0x3f7,0x4125);
    thunk_FUN_7e8f_00d6(0xa00140,0x410,0x4125);
  }
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  thunk_FUN_7e8f_0058(0xbe00c8,0x1600f0,DAT_451b_0036 + DAT_451b_003a * 0x68 + 4,DAT_451b_0038);
  thunk_FUN_7e8f_0058(0xd700c8,0x1600f0,DAT_451b_0036 + DAT_451b_003a * 0x68 + 0x36,DAT_451b_0038);
  FUN_22bf_0757();
  return;
}

