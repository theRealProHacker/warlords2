
void __cdecl16far FUN_4974_0167(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  bool bVar2;
  
  bVar2 = *(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0;
  if (((*(int *)(*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) * 0x16 + -0x7780)
        < 0) || (*(int *)(*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) * 0x16 +
                         -0x777e) < 0)) ||
     (*(char *)(*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) * 0x16 + -0x777c)
      != '\x1c')) {
    bVar2 = false;
  }
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  if (bVar2) {
    FUN_1000_1e79(DAT_4125_009c);
    FUN_1997_027e();
  }
  else {
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0xffff0014);
    thunk_FUN_7e8f_00d6(0x8601b0,uVar1,in_DX);
  }
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  thunk_FUN_7e8f_00d6(0x3e01b0,0xb4,0x4125);
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  FUN_18a9_066e(0x1014a);
  thunk_FUN_830b_0000(0,0);
  if (bVar2) {
    FUN_4974_0320();
    thunk_FUN_830b_1f5f();
    thunk_FUN_830b_04d3(0);
  }
  FUN_22bf_0757();
  return;
}

