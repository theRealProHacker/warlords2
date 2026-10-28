
int __cdecl16far FUN_67a7_2065(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  undefined2 in_DX;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  for (iVar3 = 0; iVar3 < 0x13; iVar3 = iVar3 + 1) {
    iVar1 = FUN_67a7_124a(param_1,param_2,0);
    if (0 < *(int *)(iVar1 + 6)) {
      iVar2 = iVar2 + 1;
    }
  }
  return iVar2 / 2;
}

