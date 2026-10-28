
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far
FUN_7b13_0000(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
             undefined4 param_5,undefined4 param_6,undefined2 param_7,undefined2 param_8,int param_9
             )

{
  DAT_4125_166a = 1;
  DAT_451b_1970 = 0;
  DAT_451b_196e = param_7;
  DAT_451b_1974 = param_8;
  if (param_9 < 1) {
    param_9 = 0xe8;
  }
  _DAT_451b_19cc = param_5;
  _DAT_451b_19c8 = param_6;
  DAT_451b_1972 = param_9;
  FUN_1000_4a70(0x58d8,0x4125,param_4);
  DAT_451b_1976 = FUN_1000_4a99(0x58d8,0x4125);
  FUN_22bf_07a5();
  FUN_7b13_00e2(param_1,param_2,param_3);
  thunk_FUN_79c4_056a();
  FUN_7b13_02c7();
  FUN_22bf_0757();
  return;
}

