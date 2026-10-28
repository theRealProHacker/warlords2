
void __cdecl16far FUN_899d_0a55(void)

{
  int iVar1;
  
  if (DAT_451b_1f02 != 0) {
    for (iVar1 = 0; iVar1 < DAT_4125_30f6; iVar1 = iVar1 + 1) {
      ((undefined2 *)&DAT_451b_28f2)[iVar1] = 0;
      ((undefined2 *)&DAT_451b_28e2)[iVar1] = 1;
    }
    FUN_899d_17e7(1);
    FUN_899d_000a(0x899d,0);
    FUN_899d_0356();
    thunk_FUN_8027_0174();
  }
  return;
}

