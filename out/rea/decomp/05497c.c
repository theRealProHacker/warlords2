
undefined2 __cdecl16far FUN_544d_04ac(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  int local_4;
  
  iVar1 = FUN_170b_0006(0x5a2,0x4125,2);
  if ((-1 < iVar1) && (FUN_170b_006d(iVar1,&local_4), param_1 < local_4)) {
    for (iVar2 = 0; iVar2 <= param_1; iVar2 = iVar2 + 1) {
      FUN_170b_006d(iVar1,param_2,0x44);
    }
    FUN_170b_003a(iVar1);
    return 1;
  }
  return 0;
}

