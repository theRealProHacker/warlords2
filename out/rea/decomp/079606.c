
void __cdecl16far FUN_7938_0286(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_451b_08d0;
  if (5 < DAT_451b_08d0) {
    iVar1 = 5;
  }
  for (iVar2 = 0; iVar2 < 5; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_08d0)[iVar2] = ((undefined2 *)&DAT_451b_08d0)[iVar2] - iVar1;
  }
  FUN_7938_00f3();
  FUN_7938_0301();
  return;
}

