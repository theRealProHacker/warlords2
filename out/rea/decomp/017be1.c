
void __cdecl16far FUN_17be_0001(int param_1,undefined2 param_2)

{
  bool bVar1;
  int iVar2;
  
  iVar2 = 0;
  bVar1 = false;
  while ((((undefined2 *)&DAT_4125_155c)[iVar2] != 0 && (!bVar1))) {
    if (((undefined2 *)&DAT_4125_155c)[iVar2] == param_1) {
      bVar1 = true;
      ((undefined2 *)&DAT_4125_155c)[iVar2] = param_2;
    }
    iVar2 = iVar2 + 1;
  }
  return;
}

