
void __cdecl16far
thunk_FUN_7b13_03a6(int param_1,int param_2,undefined2 param_3,undefined2 param_4,undefined4 param_5
                   ,int param_6,int param_7)

{
  int iVar1;
  undefined2 unaff_SS;
  undefined2 uVar2;
  undefined1 auStack_76 [49];
  undefined1 auStack_45 [51];
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  uint uStack_6;
  byte bStack_3;
  
  FUN_1000_1d02(&param_1,unaff_SS,&iStack_12,unaff_SS);
  iStack_12 = iStack_12 + 1;
  iStack_10 = iStack_10 + 1;
  iStack_e = iStack_e + -2;
  iStack_c = iStack_c + -2;
  FUN_22bf_07a5();
  iVar1 = 0x32;
  while (iVar1 != 0) {
    auStack_45[iVar1] = 0;
    iVar1 = iVar1 + -1;
  }
  FUN_1000_4a70(auStack_45 + 1);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  FUN_24d0_0002();
  FUN_216d_0288(&iStack_12);
  thunk_FUN_7e8f_00bf(param_1 + 3,param_2 + 2,auStack_45 + 1);
  bStack_3 = 0;
  iVar1 = 0;
  do {
    bStack_3 = bStack_3 ^ 1;
    uStack_6 = thunk_FUN_7e8f_020d();
    if (uStack_6 == 0xd) {
LAB_7b13_0575:
      FUN_1000_4a70(param_5,auStack_45 + 1);
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      FUN_24d0_0002();
      FUN_216d_0288(&iStack_12);
      thunk_FUN_7e8f_00bf(param_1 + 3,param_2 + 2,param_5);
      FUN_22bf_0757();
      return;
    }
    if (uStack_6 == 0x1b) {
      FUN_1000_4a70(auStack_45 + 1);
      goto LAB_7b13_0575;
    }
    if (uStack_6 == 8) {
      if (0 < iVar1) {
        iVar1 = iVar1 + -1;
LAB_7b13_04d8:
        auStack_45[iVar1 + 1] = 0;
        thunk_FUN_7875_06ae(0xf0002,0x30000);
        FUN_24d0_0002();
        FUN_216d_0288(&iStack_12);
        thunk_FUN_7e8f_00bf(param_1 + 3,param_2 + 2,auStack_45 + 1);
      }
    }
    else if ((0x1f < uStack_6) && (uStack_6 < 0x7b)) {
      bStack_3 = 0;
      FUN_1000_4a70(auStack_76);
      auStack_76[iVar1] = (undefined1)uStack_6;
      auStack_76[iVar1 + 1] = 0;
      iStack_a = FUN_21e2_0a8e(auStack_45 + 1);
      if ((iVar1 < param_6 + -1) && (iStack_a < param_7)) {
        auStack_45[iVar1 + 1] = (undefined1)uStack_6;
        iVar1 = iVar1 + 1;
        goto LAB_7b13_04d8;
      }
    }
    if (bStack_3 == 0) {
      uVar2 = 0xf;
    }
    else {
      uVar2 = 9;
    }
    thunk_FUN_7875_06ae(2,uVar2,0x30000);
    iStack_8 = FUN_21e2_0a8e(auStack_45 + 1);
    thunk_FUN_7e8f_00bf(param_1 + iStack_8 + 5,param_2 + 2,0x2375,0x4125);
  } while( true );
}

