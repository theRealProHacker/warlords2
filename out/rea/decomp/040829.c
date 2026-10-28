
void __cdecl16far thunk_FUN_76ef_0e5f(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  char acStack_1e [20];
  undefined2 uStack_a;
  char cStack_7;
  int iStack_6;
  uint uStack_4;
  
  uVar1 = thunk_FUN_7e8f_0505(4,0x20000);
  uStack_a = FUN_170b_0006(uVar1,in_DX);
  for (iVar4 = 0; iVar4 < 10; iVar4 = iVar4 + 1) {
    FUN_170b_006d(uStack_a,&cStack_7);
    uStack_4 = (uint)(cStack_7 == '1');
    FUN_170b_006d(uStack_a,acStack_1e);
    acStack_1e[2] = 0;
    FUN_1000_49ba(acStack_1e);
    FUN_170b_006d(uStack_a,acStack_1e);
    (&stack0xffe1)[iStack_6] = 0;
    ((undefined1 *)&DAT_451b_07b2)[iVar4] = (undefined1)uStack_4;
    for (iVar3 = 0; iVar2 = FUN_1000_4a99(acStack_1e), iVar3 < iVar2; iVar3 = iVar3 + 1) {
      if (acStack_1e[iVar3] == '_') {
        acStack_1e[iVar3] = ' ';
      }
    }
    FUN_1000_4a70(iVar4 * 0xf + 0x471c,0x4125,acStack_1e);
  }
  FUN_170b_003a();
  return;
}

