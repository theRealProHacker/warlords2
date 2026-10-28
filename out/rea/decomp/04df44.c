
void __cdecl16far FUN_4d6c_0884(undefined4 param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined4 local_6;
  
  iVar1 = thunk_FUN_7e8f_02bf();
  local_6 = CONCAT22(local_6._2_2_,(int)param_1 + iVar1);
  iVar1 = thunk_FUN_7e8f_02bf();
  local_6 = CONCAT22(param_1._2_2_ + iVar1,(undefined2)local_6);
  thunk_FUN_4bea_0470(&local_6);
  uVar2 = thunk_FUN_7e8f_02bf(0x20001,0x60001);
  FUN_4d6c_09a7(param_1,local_6,uVar2);
  return;
}

