
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_621e_0dff(undefined2 param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    uVar1 = thunk_FUN_5d9f_056c(iVar2);
    FUN_170b_006d(param_1,uVar1,in_DX,0x42c);
    thunk_FUN_5d9f_05b9(iVar2);
  }
  thunk_FUN_5d9f_05e6();
  FUN_170b_006d(param_1,_DAT_451b_018a,0x4b0);
  thunk_FUN_5d9f_063d();
  FUN_1555_0350();
  return;
}

