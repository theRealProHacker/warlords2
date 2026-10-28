
void __cdecl16far thunk_FUN_5c8e_015e(int param_1,int param_2)

{
  undefined2 uVar1;
  undefined2 uVar2;
  
  uVar1 = *(undefined2 *)(param_1 * 0x16 + -0x7780);
  uVar2 = *(undefined2 *)(param_1 * 0x16 + -0x777e);
  if (*(char *)(param_1 * 0x16 + -0x777c) == '\x1c') {
    thunk_FUN_67a7_16cd(param_1 * 0x16 + -0x7780,0x2e1d,uVar1,uVar2);
  }
  FUN_1b62_03be(param_1 * 0x16 + -0x7780,0x2e1d);
  if (param_2 != 0) {
    FUN_5c8e_10a1(uVar1,uVar2);
  }
  return;
}

