
void __cdecl16far thunk_FUN_621e_170c(undefined4 param_1,undefined2 param_2,undefined2 param_3)

{
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    DAT_3c04_017d = param_2;
    DAT_3c04_017f = param_3;
    thunk_FUN_85d0_006c();
    FUN_177b_0020(param_2,param_3,0xf0001);
    FUN_177b_005f();
    thunk_FUN_5c3a_0478(param_1,0x10000);
  }
  return;
}

