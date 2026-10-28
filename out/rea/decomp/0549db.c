
undefined2 __cdecl16far FUN_544d_050b(int param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  undefined2 local_6;
  int local_4;
  
  local_6 = 0;
  iVar1 = FUN_170b_0006(0x5ae,0x4125,2);
  if (iVar1 < 0) {
    local_6 = 0;
  }
  else {
    FUN_170b_006d(iVar1,&local_4);
    for (iVar2 = 0; iVar2 < local_4; iVar2 = iVar2 + 1) {
      FUN_170b_006d(iVar1,param_2,0x44);
      if (*param_2 == param_1) {
        local_6 = 1;
        break;
      }
    }
    FUN_170b_003a(iVar1);
  }
  return local_6;
}

