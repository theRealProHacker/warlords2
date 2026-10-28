
void __cdecl16far FUN_899d_0910(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = ((undefined2 *)&DAT_451b_28f2)[param_1];
  for (iVar2 = 0; iVar2 < DAT_4125_30f6; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_28e2)[iVar2] = (uint)(((undefined2 *)&DAT_451b_28f2)[iVar2] == iVar1);
  }
  FUN_899d_17e7(0);
  FUN_899d_000a(0x899d,0);
  FUN_899d_0356();
  thunk_FUN_8027_0174();
  return;
}

