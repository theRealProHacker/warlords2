
void __cdecl16far thunk_FUN_7d9f_01a9(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  
  if (DAT_4125_0bec != 0) {
    if (param_1 == 0) {
      uVar1 = thunk_FUN_7e8f_0505(0x25);
      iVar2 = FUN_255e_04e9(uVar1,in_DX);
    }
    else {
      uVar1 = thunk_FUN_7e8f_0505(0x10025);
      iVar2 = FUN_255e_04e9(uVar1,in_DX);
    }
    if (-1 < iVar2) {
      FUN_255e_065e(iVar2,2);
      FUN_255e_0736();
    }
  }
  return;
}

