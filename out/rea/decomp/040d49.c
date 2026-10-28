
undefined2 __cdecl16far thunk_FUN_7f3a_06c8(int param_1,undefined4 param_2)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 in_DX;
  int iVar4;
  
  uVar1 = thunk_FUN_7e8f_0505(0,0,2);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (iVar2 < 0) {
LAB_7f3a_06ed:
    uVar1 = 0;
  }
  else {
    for (iVar4 = 0; iVar4 <= param_1; iVar4 = iVar4 + 1) {
      iVar3 = FUN_170b_006d(iVar2,(int)param_2,(int)((ulong)param_2 >> 0x10),0x54);
      if (iVar3 == 0) {
        FUN_170b_003a(iVar2);
        goto LAB_7f3a_06ed;
      }
    }
    FUN_170b_003a(iVar2);
    uVar1 = 1;
  }
  return uVar1;
}

