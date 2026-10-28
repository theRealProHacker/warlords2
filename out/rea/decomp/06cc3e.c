
void __cdecl16far FUN_6bf2_0d1e(void)

{
  int iVar1;
  int iVar2;
  undefined1 local_18 [20];
  int local_4;
  
  thunk_FUN_7533_0943();
  FUN_22bf_07a5();
  FUN_6bf2_0724();
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  thunk_FUN_54e4_070b(0x690058,0x280040);
  iVar1 = (int)*(char *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7778);
  iVar2 = FUN_6bf2_0cad();
  iVar1 = iVar1 + iVar2;
  if (9 < iVar1) {
    iVar1 = 9;
  }
  local_4 = FUN_6bf2_0c27(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780,0x2e1d);
  local_4 = *(int *)(iVar1 * 2 + 0xce4) + local_4;
  FUN_6bf2_0cad(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780,0x2e1d);
  FUN_1000_4944(local_18);
  thunk_FUN_7e8f_00bf(0xa50188,local_18);
  FUN_1000_4944(local_18);
  thunk_FUN_7e8f_00bf(0xb90188,local_18);
  FUN_6bf2_0620();
  FUN_22bf_0757();
  return;
}

