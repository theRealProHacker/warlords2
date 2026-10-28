
void __cdecl16far thunk_FUN_899d_070d(void)

{
  bool bVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  int iVar5;
  undefined2 unaff_SS;
  undefined2 *puVar6;
  undefined4 uStack_14;
  undefined1 *puStack_10;
  undefined1 auStack_c [10];
  
  bVar1 = false;
  if (DAT_4125_30f8 == 0) {
    FUN_22bf_07a5();
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    FUN_1c8c_0912((undefined2 *)&DAT_451b_2902,0x4125,(undefined2 *)&DAT_451b_28e2,0x4125,
                  DAT_4125_30f6);
    if (DAT_451b_1f02 == 0) {
      FUN_1000_4a70(auStack_c);
    }
    else {
      FUN_1000_4944(auStack_c);
    }
    FUN_1000_1e79(DAT_4125_3036);
    FUN_1997_0129();
    uVar4 = 0x4125;
    FUN_1000_1e79(DAT_4125_303a);
    FUN_1997_0129(8);
    iVar5 = 0;
    while( true ) {
      _puStack_10 = (undefined1 *)CONCAT22(unaff_SS,auStack_c);
      uStack_14 = 0x1997a1c7;
      iVar2 = FUN_1000_4a99();
      if (iVar2 <= iVar5) break;
      _puStack_10 = (undefined1 *)((undefined4 *)&DAT_4125_303e)[iVar5];
      uVar4 = 0x4125;
      uStack_14 = 0x1000a1b2;
      FUN_1000_1e79();
      uStack_14 = 0x81000;
      FUN_1997_0129();
      iVar5 = iVar5 + 1;
    }
    for (iVar5 = 0; iVar5 < DAT_4125_30f6; iVar5 = iVar5 + 1) {
      if ((((undefined2 *)&DAT_451b_28e2)[iVar5] != 0) &&
         (((undefined1 *)&DAT_451b_0665)
          [*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar5 * 2) + 4) * 6] !=
          '\0')) {
        bVar1 = true;
      }
    }
    _puStack_10 = (undefined1 *)CONCAT22(DAT_4125_30f6,0x4125);
    uStack_14 = 0x68424125;
    puVar6 = (undefined2 *)&DAT_451b_2902;
    iVar2 = 0x1000;
    iVar5 = FUN_1c8c_07fa();
    if ((((iVar5 != 0) || (puVar6 != (undefined2 *)0x0)) || ((bVar1 && (iVar2 != 0)))) ||
       ((bVar1 || (iVar2 != 0)))) {
      _puStack_10 = (undefined1 *)DAT_4125_306e;
      uStack_14 = 0x1c8ca260;
      FUN_1000_1e79();
      uStack_14 = 0x81000;
      uVar4 = 0x1997;
      FUN_1997_0129();
    }
    else {
      _puStack_10 = (undefined1 *)0x31c8c;
      uStack_14 = CONCAT22(0xa2b5,(undefined2)uStack_14);
      FUN_24d0_0002();
      _puStack_10 = (undefined1 *)DAT_4125_304a;
      uStack_14 = DAT_4125_306e;
      uVar3 = FUN_216d_002e(&uStack_14);
      _puStack_10 = (undefined1 *)CONCAT22(uVar4,uVar3);
      uVar4 = 0x216d;
      uStack_14 = 0x216da2d4;
      FUN_216d_0288();
    }
    _puStack_10 = (undefined1 *)CONCAT22(uVar4,0xa2dc);
    FUN_22bf_0757();
  }
  return;
}

