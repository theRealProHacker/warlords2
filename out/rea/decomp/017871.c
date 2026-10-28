
void __cdecl16far
FUN_177b_00c1(undefined2 param_1,undefined2 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 uVar1;
  
  if (DAT_4125_1258 < 0x16) {
    *(undefined2 *)(DAT_4125_1258 * 2 + 0x459a) = param_1;
    *(undefined2 *)(DAT_4125_1258 * 2 + 0x4570) = param_2;
    *(undefined2 *)(DAT_4125_1258 * 2 + 0x4546) = param_3;
    uVar1 = thunk_FUN_7e8f_02bf(1,0xffff0003);
    *(undefined2 *)(DAT_4125_1258 * 2 + 0x451c) = uVar1;
    *(undefined2 *)(DAT_4125_1258 * 2 + 0x44f2) = param_4;
    DAT_4125_1258 = DAT_4125_1258 + 1;
  }
  return;
}

