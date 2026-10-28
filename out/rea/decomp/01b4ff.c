
undefined2 __cdecl16far FUN_1a8b_0c4f(undefined2 param_1,undefined2 param_2,int param_3)

{
  int iVar1;
  undefined2 *puVar2;
  undefined2 uVar3;
  undefined1 local_da [16];
  undefined1 local_ca [200];
  
  uVar3 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
  puVar2 = (undefined2 *)DAT_451b_1f02;
  puVar2[9] = param_1;
  puVar2[10] = param_2;
  FUN_1555_1868(local_da);
  iVar1 = FUN_1555_000a(local_da);
  if (iVar1 == 0) {
    if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
      thunk_FUN_7d9f_0b5f();
    }
    return 1;
  }
  if (param_3 == 0) {
    FUN_1c8c_0963(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1],local_ca);
  }
  else {
    DAT_4125_2eaa = 0;
    DAT_4125_2ea6 = 0;
    DAT_4125_2ea8 = 0;
  }
  uVar3 = FUN_1a8b_07f9(local_da);
  if (DAT_451b_1e64 != 0) {
    FUN_1a8b_0d1a();
    uVar3 = 2;
  }
  if (param_3 == 0) {
    thunk_FUN_899d_070d();
    thunk_FUN_891f_07e0();
    thunk_FUN_899d_0356();
  }
  return uVar3;
}

