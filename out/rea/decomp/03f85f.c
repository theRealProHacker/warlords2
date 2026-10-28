
/* WARNING: Removing unreachable block (ram,0x00050e71) */
/* WARNING: Removing unreachable block (ram,0x00050e89) */
/* WARNING: Removing unreachable block (ram,0x00050e93) */
/* WARNING: Removing unreachable block (ram,0x00050e84) */

bool __cdecl16far thunk_FUN_4fe5_1001(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined1 auStack_52 [40];
  undefined1 auStack_2a [40];
  
  FUN_1000_4a70(auStack_52);
  FUN_1000_4944(auStack_2a);
  iVar1 = FUN_170b_0006();
  if (-1 < iVar1) {
    FUN_170b_006d(iVar1,0,0x3c04,0x2ee1);
    FUN_170b_003a(iVar1);
  }
  else {
    uVar2 = thunk_FUN_7e8f_051a(0,auStack_2a);
    FUN_1000_43ac(uVar2,in_DX);
  }
  return -1 < iVar1;
}

