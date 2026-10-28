
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_7938_0000(undefined4 param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  
  FUN_1000_4a70(0x4816,0x4125,param_2);
  DAT_451b_08da = param_3;
  _DAT_451b_08ca = param_1;
  DAT_451b_08d0 = 0;
  if (DAT_451b_08ce < 2) {
    DAT_451b_08d2 = 0xffff;
  }
  else {
    DAT_451b_08d2 = 1;
  }
  if (DAT_451b_08ce < 3) {
    DAT_451b_08d4 = 0xffff;
  }
  else {
    DAT_451b_08d4 = 2;
  }
  if (DAT_451b_08ce < 4) {
    DAT_451b_08d6 = 0xffff;
  }
  else {
    DAT_451b_08d6 = 3;
  }
  if (DAT_451b_08ce < 5) {
    DAT_451b_08d8 = 0xffff;
  }
  else {
    DAT_451b_08d8 = 4;
  }
  while (4 < DAT_451b_08da) {
    DAT_451b_08da = DAT_451b_08da + -1;
    for (iVar1 = 0; iVar1 < 5; iVar1 = iVar1 + 1) {
      ((undefined2 *)&DAT_451b_08d0)[iVar1] = ((undefined2 *)&DAT_451b_08d0)[iVar1] + 1;
    }
  }
  FUN_22bf_07a5();
  FUN_7938_00b2();
  DAT_4125_166a = 1;
  thunk_FUN_79c4_056a();
  FUN_7938_0301();
  FUN_22bf_0757();
  return;
}

