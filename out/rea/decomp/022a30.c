
int __cdecl16far
FUN_229d_0060(undefined2 param_1,undefined2 param_2,undefined2 param_3,undefined2 param_4,
             undefined2 param_5)

{
  int iVar1;
  undefined2 in_DX;
  undefined4 local_6;
  
  iVar1 = FUN_229d_00a9(param_1,param_2,param_5);
  local_6 = CONCAT22(in_DX,iVar1);
  if (local_6 != 0) {
    FUN_1000_4345(*(undefined2 *)(iVar1 + 8),*(undefined2 *)(iVar1 + 10),param_3,param_4,param_5);
  }
  return iVar1;
}

