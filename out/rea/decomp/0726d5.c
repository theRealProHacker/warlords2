
void FUN_71d6_0975(void)

{
  char in_DL;
  int in_BX;
  int unaff_BP;
  int unaff_SI;
  int iVar1;
  int iVar2;
  
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + in_DL;
  thunk_FUN_7e8f_00bf();
  if ((*(char *)(*(byte *)(*(int *)(DAT_4125_0e98 * 0x41 + 0x157f) * 0xe0 +
                          *(int *)(DAT_4125_0e98 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
     ((DAT_3c04_0132 == 0 || (*(char *)(DAT_4125_0e98 * 0x41 + 0x1592) == DAT_3c04_0110)))) {
    iVar2 = 0;
    for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
      thunk_FUN_85d0_08be((int)*(char *)(DAT_4125_0e98 * 0x41 + iVar1 + 0x1593),
                          (int)*(char *)(DAT_4125_0e98 * 0x41 + 0x1592),0x342a,0x4125,
                          *(undefined2 *)(iVar2 * 4 + 0xf18),*(undefined2 *)(iVar2 * 4 + 0xf1a),0);
      iVar2 = iVar2 + 1;
    }
  }
  else {
    FUN_24d0_0002();
    FUN_216d_002e();
    FUN_216d_01fd();
    FUN_216d_002e(unaff_BP + -0x20);
    FUN_24d0_02e5();
    FUN_216d_002e();
    FUN_216d_000e();
    FUN_1000_1e79();
    FUN_1997_0129();
    thunk_FUN_85d0_0860();
    thunk_FUN_85d0_0860();
    thunk_FUN_85d0_0860();
    thunk_FUN_85d0_0860();
  }
  iVar1 = 0;
  do {
    if (7 < iVar1) {
LAB_71d6_0c8b:
      FUN_71d6_1f06();
      for (iVar1 = 0; iVar1 < 3; iVar1 = iVar1 + 1) {
        thunk_FUN_7e8f_00bf();
      }
      FUN_71d6_1a88();
      return;
    }
    if ((*(int *)(DAT_4125_0e98 * 0x41 + 0x157d) == *(int *)(iVar1 * 0x14 + 0x193)) &&
       (*(int *)(DAT_4125_0e98 * 0x41 + 0x157f) == *(int *)(iVar1 * 0x14 + 0x195))) {
      thunk_FUN_85d0_0bf7();
      goto LAB_71d6_0c8b;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

