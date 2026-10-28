
void FUN_899d_166f(undefined2 param_1,int param_2)

{
  int iVar1;
  int iVar2;
  
  iVar1 = ((undefined2 *)&DAT_451b_28f2)[param_2];
  for (iVar2 = 0; iVar2 < DAT_4125_30f6; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_28e2)[iVar2] = (uint)(((undefined2 *)&DAT_451b_28f2)[iVar2] == iVar1);
  }
  FUN_899d_17e7();
  FUN_899d_0e85(0,0xffff0000);
  FUN_899d_1425();
  return;
}

