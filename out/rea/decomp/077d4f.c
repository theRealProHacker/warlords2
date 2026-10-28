
void __cdecl16far FUN_76ef_0e5f(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  char local_1e [20];
  undefined2 local_a;
  char local_7;
  int local_6;
  uint local_4;
  
  uVar1 = thunk_FUN_7e8f_0505(4,0x20000);
  local_a = FUN_170b_0006(uVar1,in_DX);
  for (iVar4 = 0; iVar4 < 10; iVar4 = iVar4 + 1) {
    FUN_170b_006d(local_a,&local_7);
    local_4 = (uint)(local_7 == '1');
    FUN_170b_006d(local_a,local_1e);
    local_1e[2] = 0;
    FUN_1000_49ba(local_1e);
    FUN_170b_006d(local_a,local_1e);
    (&stack0xffe1)[local_6] = 0;
    ((undefined1 *)&DAT_451b_07b2)[iVar4] = (undefined1)local_4;
    for (iVar3 = 0; iVar2 = FUN_1000_4a99(local_1e), iVar3 < iVar2; iVar3 = iVar3 + 1) {
      if (local_1e[iVar3] == '_') {
        local_1e[iVar3] = ' ';
      }
    }
    FUN_1000_4a70(iVar4 * 0xf + 0x471c,0x4125,local_1e);
  }
  FUN_170b_003a();
  return;
}

