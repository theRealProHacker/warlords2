
void FUN_705a_00ff(void)

{
  int iVar1;
  
  iVar1 = FUN_705a_0000(DAT_4125_0e98,DAT_4125_0e9e);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x15a9) = (undefined1)DAT_4125_0e9e;
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x15aa) =
       *(undefined1 *)(DAT_4125_0e98 * 0x41 + iVar1 + 0x1597);
  FUN_22bf_07a5();
  thunk_FUN_54e4_07e4(0x280000,0x320000);
  thunk_FUN_71d6_06de(0x3fac,0);
  thunk_FUN_71d6_1a9b();
  thunk_FUN_71d6_03a9();
  FUN_22bf_0757();
  return;
}

