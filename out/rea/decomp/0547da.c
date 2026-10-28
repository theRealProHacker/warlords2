
void __cdecl16far FUN_544d_030a(void)

{
  int iVar1;
  undefined2 unaff_SS;
  undefined1 *puVar2;
  undefined2 uVar3;
  undefined2 local_56;
  undefined4 uStack_54;
  undefined1 local_22 [8];
  undefined1 local_1a [8];
  undefined1 local_12 [8];
  undefined1 local_a [8];
  
  FUN_1997_034a();
  FUN_1997_060a();
  FUN_1997_034a();
  FUN_1997_060a();
  for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
    if (((undefined2 *)&DAT_451b_0042)[iVar1] == 0) {
      FUN_1000_1d02(0x49e,0x4125,local_a,unaff_SS);
      uVar3 = 0x4125;
      puVar2 = (undefined1 *)0x4a6;
    }
    else {
      FUN_544d_050b(((undefined2 *)&DAT_451b_0042)[iVar1],&local_56);
      FUN_1000_1d02(local_22,unaff_SS,local_a,unaff_SS);
      puVar2 = local_1a;
      uVar3 = unaff_SS;
    }
    FUN_1000_1d02(puVar2,uVar3,(undefined1 *)CONCAT22(unaff_SS,local_12));
    FUN_1000_1e79(4,*(undefined4 *)(iVar1 * 4 + 0x4ae));
    FUN_1997_00a2(0x2b);
    uStack_54 = *(undefined4 *)(iVar1 * 4 + 0x4be);
    local_56 = 4;
    FUN_1000_1e79();
    FUN_1997_00a2(0x2b);
  }
  FUN_1997_06bb();
  FUN_1997_06bb();
  return;
}

