
undefined2 __cdecl16far FUN_7f3a_0dff(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined2 local_4;
  
  local_4 = 1;
  uVar1 = thunk_FUN_7e8f_0505(0x24,0x20000);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (iVar2 == 0) {
    local_4 = 1;
  }
  else {
    FUN_170b_006d(iVar2,&local_4);
    FUN_170b_003a();
  }
  return local_4;
}

