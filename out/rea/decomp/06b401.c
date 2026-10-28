
void __cdecl16far FUN_6a62_0de1(void)

{
  undefined2 in_DX;
  int iVar1;
  
  thunk_FUN_54e4_0000(0xb);
  DAT_4125_0d56 = 0xffff;
  DAT_4125_0d58._0_2_ = FUN_1d28_01d5(0x1d);
  DAT_4125_0d58._2_2_ = in_DX;
  for (iVar1 = 0; iVar1 < 0x1d; iVar1 = iVar1 + 1) {
    *(undefined1 *)((int)DAT_4125_0d58 + iVar1) =
         *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar1 + 0x60b);
  }
  DAT_4125_166a = 1;
  FUN_6a62_0e4a(0);
  thunk_FUN_79c4_056a(0x1a);
  FUN_6a62_1067();
  return;
}

