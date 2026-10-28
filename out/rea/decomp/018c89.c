
void __cdecl16far FUN_18a9_01f9(void)

{
  int iVar1;
  undefined1 local_a [8];
  
  for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
    *(undefined2 *)(iVar1 * 2 + 0x137) = 0;
  }
  thunk_FUN_544d_02fb();
  thunk_FUN_79c4_056a(1);
  thunk_FUN_7ab1_0341(local_a);
  FUN_18a9_0273(3,local_a);
  FUN_18a9_07ed(3);
  thunk_FUN_7f3a_0000(1);
  thunk_FUN_7e8f_01f1();
  DAT_4125_166e = 1;
  return;
}

