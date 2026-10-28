
void __cdecl16far FUN_7b71_16ea(int param_1)

{
  int iVar1;
  int iVar2;
  
  if (*(int *)(param_1 * 2 + 0x137) == 0) {
    FUN_7b71_0416();
  }
  else {
    DAT_451b_19f6 = *(undefined2 *)(param_1 * 2 + 0xe0);
    DAT_4125_2563 = param_1;
    FUN_1000_4a70(0x5964,0x4125,param_1 * 0x14,0x3c04);
    for (iVar2 = 0; iVar2 < 5; iVar2 = iVar2 + 1) {
      ((undefined2 *)&DAT_451b_19fa)[iVar2] = 0xffff;
    }
    if (*(int *)(param_1 * 2 + 0xd0) == 1) {
      thunk_FUN_7938_03d9(7,*(undefined2 *)(param_1 * 2 + 0xc0),0xffff,0);
      for (iVar2 = 0; iVar2 < 5; iVar2 = iVar2 + 1) {
        iVar1 = iVar2;
        if (DAT_451b_08ce <= iVar2) {
          iVar1 = -1;
        }
        ((undefined2 *)&DAT_451b_19fa)[iVar2] = iVar1;
      }
      DAT_451b_19f8 = *(undefined2 *)(DAT_4125_2563 * 2 + 0xe0);
      if (4 < *(int *)(DAT_4125_2563 * 2 + 0xe0)) {
        for (iVar2 = 0; iVar2 < 5; iVar2 = iVar2 + 1) {
          ((undefined2 *)&DAT_451b_19fa)[iVar2] =
               ((undefined2 *)&DAT_451b_19fa)[iVar2] + *(int *)(DAT_4125_2563 * 2 + 0xe0) + -4;
        }
      }
    }
    thunk_FUN_54e4_0000();
    FUN_7b71_180b();
    DAT_4125_166a = 1;
    thunk_FUN_79c4_056a();
    FUN_7b71_1ae4();
  }
  return;
}

