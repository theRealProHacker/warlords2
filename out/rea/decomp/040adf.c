
/* WARNING: Removing unreachable block (ram,0x0007b766) */
/* WARNING: Removing unreachable block (ram,0x0007b76c) */
/* WARNING: Removing unreachable block (ram,0x0007b773) */
/* WARNING: Removing unreachable block (ram,0x0007b779) */
/* WARNING: Removing unreachable block (ram,0x0007b77f) */

void __cdecl16far thunk_FUN_7b71_0000(undefined2 param_1,int param_2,int param_3,int param_4)

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  
  FUN_22bf_07a5();
  if (param_2 != 0) {
    FUN_1997_0066();
    if (param_4 == 2) {
                    /* WARNING: Read-only address (ram,0x00043b18) is written */
      uRam00043b18 = DAT_3c04_0120;
    }
    thunk_FUN_8027_092a();
    FUN_2372_132f();
  }
  thunk_FUN_7d9f_0000();
  if (param_4 != 1) {
    thunk_FUN_54e4_0000();
  }
  if (param_3 != 0) {
    FUN_7b71_0194();
  }
  uVar1 = 0;
  DAT_3c04_0120 = 0;
  if (param_4 != 1) {
    thunk_FUN_54e4_069c();
  }
  thunk_FUN_7ae8_0000();
  if (DAT_3c04_012e == 0) {
    if (param_4 != 1) {
      FUN_7b71_223b();
    }
    if (param_2 != 0) {
      thunk_FUN_8027_0a10(0);
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      FUN_7b71_0634(0xffff);
      FUN_7b71_0bab();
      FUN_7b71_10c7();
      FUN_7b71_0f88();
    }
    DAT_4125_166a = 0;
    if (param_2 != 0) {
      uVar2 = thunk_FUN_7e8f_04f0(7);
      thunk_FUN_7e8f_00d6(0x300200,uVar2,uVar1);
      uVar2 = thunk_FUN_7e8f_04f0(0x10007);
      thunk_FUN_7e8f_00d6(0xce0200,uVar2,uVar1);
    }
    thunk_FUN_79c4_056a();
    FUN_7b71_0416();
    FUN_22bf_0757();
  }
  else {
    for (iVar3 = 0; iVar3 < 10; iVar3 = iVar3 + 1) {
      ((undefined2 *)&DAT_4125_23b4)[iVar3] = ((undefined2 *)&DAT_4125_2378)[iVar3];
    }
    DAT_4125_166a = 0;
    FUN_22bf_0757();
    uVar1 = thunk_FUN_7e8f_0505(0x80019);
    thunk_FUN_8027_168d(uVar1,iVar3);
    FUN_7b71_0cfe();
  }
  return;
}

