
void __cdecl16far FUN_7b71_0f88(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  char local_108 [256];
  int local_8;
  int local_6;
  int local_4;
  
  thunk_FUN_7e8f_0505();
  iVar1 = FUN_170b_0006();
  if (-1 < iVar1) {
    FUN_170b_006d(iVar1,local_108);
    local_108[2] = 0;
    FUN_1000_49ba(local_108);
    local_6 = thunk_FUN_7e8f_02bf();
    for (iVar2 = 0; iVar2 < local_6; iVar2 = iVar2 + 1) {
      FUN_170b_006d(iVar1,local_108);
      local_108[3] = 0;
      FUN_1000_49ba(local_108);
      FUN_170b_006d();
      local_108[local_4 + -1] = '\0';
    }
    FUN_170b_003a();
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    FUN_22bf_07a5();
    local_8 = FUN_1000_4a99(local_108);
    iVar1 = 0;
    iVar3 = 0;
    for (iVar2 = 0; iVar2 < local_8; iVar2 = iVar2 + 1) {
      if (local_108[iVar2] == '|') {
        local_108[iVar2] = '\0';
        thunk_FUN_7e8f_00d6(((undefined2 *)&DAT_4125_253c)[iVar3 * 2],
                            ((undefined2 *)&DAT_4125_253e)[iVar3 * 2],local_108 + iVar1);
        iVar3 = iVar3 + 1;
        iVar1 = iVar2 + 1;
      }
    }
    FUN_22bf_0757();
  }
  return;
}

