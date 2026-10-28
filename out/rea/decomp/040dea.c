
void __cdecl16far thunk_FUN_8027_2123(void)

{
  bool bVar1;
  bool bVar2;
  int iVar3;
  
  bVar2 = false;
  do {
    if ((bVar2) || ((DAT_3c04_015b != 0 && (DAT_3c04_0157 != 0)))) {
      return;
    }
    thunk_FUN_7e8f_0a1b();
    bVar1 = true;
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if ((*(int *)(iVar3 * 2 + 0x137) != 0) && (*(int *)(iVar3 * 2 + 0xd0) == 0)) {
        bVar1 = false;
        break;
      }
    }
    thunk_FUN_7e8f_01f1();
    if (bVar1) {
      FUN_251d_008a();
    }
    thunk_FUN_66b0_09f2(DAT_3c04_0110);
    thunk_FUN_824f_0000();
    FUN_1555_0d9e(DAT_3c04_0110,1);
    thunk_FUN_484d_0cc7();
    thunk_FUN_8c81_089d();
    thunk_FUN_67a7_10d7(DAT_3c04_0110);
    thunk_FUN_85d0_175c();
    if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 1) {
      thunk_FUN_7d9f_0000(2);
      DAT_4125_2ade = DAT_3c04_0110;
      FUN_22bf_07a5();
      thunk_FUN_8c81_0000(DAT_3c04_0110);
      FUN_22bf_0757();
      FUN_8027_17f6();
      FUN_255e_02ab();
      if (DAT_4125_166a != 0) {
        bVar2 = true;
      }
    }
    else {
      thunk_FUN_8c81_0259(DAT_3c04_0110);
      bVar2 = true;
      DAT_4125_2ade = DAT_3c04_0110;
    }
  } while( true );
}

