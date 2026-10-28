
void __cdecl16far FUN_4974_0000(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  undefined1 local_54 [80];
  int local_4;
  
  thunk_FUN_7d9f_0000();
  local_4 = thunk_FUN_824f_04b5(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1]);
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  thunk_FUN_7875_06ae(0x70002,0x10006);
  thunk_FUN_7e8f_04f0(0x13,local_4 * 0x1f + 0x815,0x3c04);
  FUN_1000_4944(local_54);
  thunk_FUN_7e8f_00d6(0x10e0140,local_54);
  uVar1 = thunk_FUN_7e8f_04f0(0x10013);
  thunk_FUN_7e8f_00d6(0x1220140,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x20013);
  thunk_FUN_7e8f_00d6(0x1360140,uVar1,in_DX);
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  FUN_18a9_066e(0x10148);
  if (((DAT_3c04_011e == 0) ||
      (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) ||
     (DAT_451b_1efe == 0)) {
    uVar1 = 2;
  }
  else {
    uVar1 = 1;
  }
  FUN_18a9_066e(0x149,uVar1);
  FUN_22bf_0757();
  return;
}

