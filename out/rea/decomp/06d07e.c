
void __cdecl16far FUN_6bf2_115e(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 1000;
  for (iVar2 = 0; iVar2 < DAT_4125_0d68; iVar2 = iVar2 + 1) {
    iVar1 = FUN_1a8b_0acc(param_1,param_2,
                          *(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[iVar2] * 0x16 + -0x7780),
                          *(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[iVar2] * 0x16 + -0x777e));
    if (iVar1 < iVar3) {
      iVar3 = iVar1;
      DAT_4125_0d6a = iVar2;
    }
  }
  DAT_4125_0d6c = 0;
  FUN_22bf_07a5();
  FUN_6bf2_00f9();
  FUN_6bf2_10ac();
  FUN_6bf2_0620();
  FUN_22bf_0757();
  return;
}

