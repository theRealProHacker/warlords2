
void __cdecl16far FUN_7ae8_0229(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  undefined1 local_12 [10];
  undefined1 local_8;
  
  iVar1 = FUN_170b_0006(param_1,2);
  if (-1 < iVar1) {
    for (iVar2 = 0; iVar2 < 0x10; iVar2 = iVar2 + 1) {
      FUN_170b_006d(iVar1,local_12);
      local_8 = 0;
      FUN_1000_49ba(local_12);
    }
    FUN_170b_003a(iVar1);
  }
  return;
}

