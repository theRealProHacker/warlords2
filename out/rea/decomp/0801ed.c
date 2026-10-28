
undefined2 __cdecl16far FUN_7f3a_0e4d(int param_1,undefined4 param_2)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  int local_4;
  
  local_4 = 1;
  uVar1 = thunk_FUN_7e8f_0505(0x24,0,2);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (iVar2 != 0) {
    FUN_170b_006d(iVar2,&local_4);
    if (param_1 < local_4) {
      for (iVar3 = 0; iVar3 <= param_1; iVar3 = iVar3 + 1) {
        FUN_170b_006d(iVar2,(int)param_2,(int)((ulong)param_2 >> 0x10),0x34);
      }
      FUN_170b_003a(iVar2);
      return 1;
    }
    FUN_170b_003a(iVar2);
  }
  return 0;
}

