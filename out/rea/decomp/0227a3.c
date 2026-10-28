
void __cdecl16far
FUN_21e2_0983(undefined2 param_1,undefined2 param_2,undefined2 param_3,int param_4)

{
  int iVar1;
  undefined2 uVar2;
  undefined1 local_8 [6];
  
  FUN_1000_42d5(param_3,local_8);
  iVar1 = FUN_21e2_0a8e(local_8);
  if (param_4 < iVar1) {
    FUN_21e2_0b33(param_1,param_2,param_4);
  }
  else {
    uVar2 = FUN_21e2_0b33(param_1,param_2,param_4 - iVar1);
    FUN_21e2_0401(uVar2,param_2,local_8);
  }
  return;
}

