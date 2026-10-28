
int __cdecl16far FUN_17be_0037(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar2 = 0;
  iVar1 = 0;
  while ((((undefined2 *)&DAT_4125_155c)[iVar2] != 0 && (iVar1 == 0))) {
    if (((undefined2 *)&DAT_4125_155c)[iVar2] == param_1) {
      iVar1 = 1;
    }
    iVar2 = iVar2 + 1;
  }
  return iVar1;
}

