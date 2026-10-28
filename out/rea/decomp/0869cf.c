
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_85d0_0ccf(void)

{
  undefined2 uVar1;
  undefined1 *puVar2;
  int iVar3;
  undefined2 in_DX;
  int iVar4;
  undefined1 *local_6;
  
  uVar1 = FUN_1d28_011f(0x4440,0,0x29a);
  DAT_4125_1270 = CONCAT22(in_DX,uVar1);
  puVar2 = (undefined1 *)FUN_1d28_069a(uVar1,in_DX);
  _DAT_4125_126c = (undefined1 *)CONCAT22(in_DX,puVar2);
  local_6 = _DAT_4125_126c;
  for (iVar4 = 0; iVar4 < 0x9c; iVar4 = iVar4 + 1) {
    for (iVar3 = 0; iVar3 < 0x70; iVar3 = iVar3 + 1) {
      *local_6 = 0;
      local_6 = (undefined1 *)CONCAT22(local_6._2_2_,(undefined1 *)local_6 + 1);
    }
  }
  FUN_1d28_07a9(DAT_4125_1270);
  return;
}

