
void __cdecl16far FUN_7b71_223b(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  
  uVar1 = thunk_FUN_7e8f_0505(0x43,0x20000);
  iVar2 = FUN_170b_0006(uVar1,in_DX);
  if (-1 < iVar2) {
    for (iVar3 = 0; iVar3 < 10; iVar3 = iVar3 + 1) {
      FUN_170b_006d(iVar2,(undefined2 *)&DAT_4125_23b4 + iVar3,0x4125,2);
    }
    FUN_170b_003a();
  }
  return;
}

