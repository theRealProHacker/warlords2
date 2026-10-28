
void __cdecl16far FUN_899d_0e85(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  undefined2 ***local_28;
  undefined1 local_18 [10];
  undefined4 local_e;
  uint local_a;
  int local_8;
  int local_6;
  int local_4;
  
  FUN_22bf_07a5();
  if (param_1 != 0) {
    thunk_FUN_54e4_0000(0);
    FUN_1000_1e79((int)DAT_4125_3102,(int)((ulong)DAT_4125_3102 >> 0x10));
    FUN_1997_027e(0x2e);
    _local_28 = (undefined2 ****)0x30000;
    thunk_FUN_7875_06ae(2,0xf);
    _local_28 = (undefined2 ****)CONCAT22(DAT_3c04_0112,0x4125);
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,(char *)s__max___d__4125_320d);
    _local_28 = (undefined2 ****)&DAT_451b_1d28;
    thunk_FUN_7e8f_00bf(0x1e0,0x42);
  }
  _local_28 = (undefined2 ****)CONCAT22(unaff_SS,&local_28);
  FUN_899d_1b9c();
  local_4 = param_3;
  if (param_2 == 0) {
    local_4 = 0;
    param_3 = 7;
  }
  _local_28 = (undefined2 ****)0x30000;
  uVar5 = 0x408a;
  local_6 = param_3;
  thunk_FUN_7875_06ae(2,0xf);
  for (iVar2 = 0; iVar3 = local_4, iVar2 < DAT_4125_30f6; iVar2 = iVar2 + 1) {
    if (((undefined2 *)&DAT_451b_28d2)[iVar2] == -1) {
      if (param_1 == 0) {
        _local_28 = (undefined2 ****)0x1e0020;
        uVar5 = 0x3fac;
        thunk_FUN_54e4_070b(0,iVar2 * 0x1e + 0x23);
      }
    }
    else {
      local_e = (undefined2 ***)
                CONCAT22(((undefined2 *)&DAT_4125_3108)[iVar2 * 2] + 5,
                         (undefined2 ***)(((undefined2 *)&DAT_4125_3106)[iVar2 * 2] + -0x20));
      _local_28 = (undefined2 ****)local_e;
      FUN_1000_1e79();
      uVar5 = 0x1997;
      FUN_1997_0129(8);
    }
  }
  do {
    if (local_6 < iVar3) {
      _local_28 = (undefined2 ****)CONCAT22(uVar5,0xadf1);
      FUN_22bf_0757();
      return;
    }
    if (iVar3 < DAT_4125_30f6) {
      local_8 = (DAT_3c04_0110 + ((undefined2 *)&DAT_451b_28f2)[iVar3]) % 8 + 2;
      local_a = (uint)(((undefined2 *)&DAT_451b_28e2)[iVar3] == 0);
      _local_28 = (undefined2 ****)((ulong)local_a << 0x10);
      uVar5 = 0x40f9;
      thunk_FUN_85d0_08be((int)*(char *)((int)*(undefined4 *)
                                               ((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4),
                          DAT_3c04_0110,0x342a,0x4125,((undefined2 *)&DAT_4125_3106)[iVar3 * 2],
                          ((undefined2 *)&DAT_4125_3108)[iVar3 * 2],0,0,0,0,local_8);
      if (param_1 == 0) {
        _local_28 = (undefined2 ****)0x1401a0;
        uVar5 = 0x3fac;
        thunk_FUN_54e4_070b(0x40,iVar3 * 0x1e + 0x23);
      }
      uVar4 = (undefined2)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) >> 0x10)
      ;
      if ((*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) != '\x1c')
         && (((undefined1 *)&DAT_451b_0668)
             [*(char *)(((undefined2 *)&DAT_451b_2902)[iVar3 * 2] + 4) * 6] == '\0')) {
        for (iVar2 = 0;
            iVar2 < *(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 10);
            iVar2 = iVar2 + 1) {
          _local_28 = (undefined2 ****)
                      CONCAT22(((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + (iVar2 % 2) * 9 + 8,
                               ((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + (iVar2 / 2) * 8 + 0x20);
          FUN_216d_000e(&local_e);
          _local_28 = (undefined2 ****)local_e;
          FUN_1000_1e79();
          uVar5 = 0x1997;
          FUN_1997_0129(8);
        }
      }
      uVar4 = (undefined2)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) >> 0x10)
      ;
      if (*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) == '\x1c') {
        _local_28 = (undefined2 ****)
                    CONCAT22(0x3c04,*(char *)(((undefined2 *)&DAT_451b_2902)[iVar3 * 2] + 10) * 0x14
                                    + 0x223);
      }
      else {
        _local_28 = (undefined2 ****)
                    CONCAT22((int)*(char *)((int)*(undefined4 *)
                                                  ((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4),
                             uVar5);
        _local_28 = (undefined2 ****)FUN_4058_0089();
      }
      thunk_FUN_7e8f_00bf(((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + 0x30,
                          ((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + 5);
      uVar5 = (undefined2)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) >> 0x10)
      ;
      iVar2 = (int)*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 8);
      if (*(char *)(((undefined2 *)&DAT_451b_2902)[iVar3 * 2] + 4) == '\x1c') {
        _local_28 = *(undefined2 *****)((undefined2 *)&DAT_451b_2902 + iVar3 * 2);
        iVar1 = thunk_FUN_6a62_0d1a();
        iVar2 = iVar2 + iVar1;
      }
      if (9 < iVar2) {
        iVar2 = 9;
      }
      _local_28 = (undefined2 ****)CONCAT22(iVar2,0x4125);
      FUN_1000_4944(local_18);
      _local_28 = (undefined2 ****)CONCAT22(unaff_SS,local_18);
      thunk_FUN_7e8f_00bf(((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + 0xa8,
                          ((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + 5);
      if (((undefined2 *)&DAT_451b_28e2)[iVar3] != 0) {
        _local_28 = (undefined2 ****)CONCAT22((&local_28)[iVar3],0x4125);
        FUN_1000_4944(local_18);
        _local_28 = (undefined2 ****)CONCAT22(unaff_SS,local_18);
        thunk_FUN_7e8f_00bf(((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + 0xb8,
                            ((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + 5);
      }
      _local_28 = (undefined2 ****)
                  CONCAT22((int)*(char *)((int)*(undefined4 *)
                                                ((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 7),
                           0x4125);
      FUN_1000_4944(local_18);
      _local_28 = (undefined2 ****)CONCAT22(unaff_SS,local_18);
      thunk_FUN_7e8f_00bf(((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + 0xe8,
                          ((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + 5);
      _local_28 = (undefined2 ****)
                  CONCAT22(((undefined2 *)&DAT_4125_3108)[iVar3 * 2] + 8,
                           (undefined2 ***)(((undefined2 *)&DAT_4125_3106)[iVar3 * 2] + 0x100));
      uVar4 = 0x216d;
      FUN_216d_000e(&local_e);
      uVar5 = (undefined2)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) >> 0x10)
      ;
      if (((undefined1 *)&DAT_451b_0664)
          [*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) * 6] ==
          '\0') {
        if (*(char *)(((undefined2 *)&DAT_451b_2902)[iVar3 * 2] + 4) == '\x1c') {
          _local_28 = *(undefined2 *****)((undefined2 *)&DAT_451b_2902 + iVar3 * 2);
          uVar4 = 0x401d;
          iVar2 = thunk_FUN_66b0_08b4();
          if (iVar2 != 0) goto LAB_899d_1380;
        }
        if ((((*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 0xc) &
              0x1000) != 0) ||
            (((uVar5 = (undefined2)
                       ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) >> 0x10),
              ((undefined1 *)&DAT_451b_0665)
              [*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) * 6] !=
              '\0' && (((undefined1 *)&DAT_451b_0666)
                       [*(char *)(((undefined2 *)&DAT_451b_2902)[iVar3 * 2] + 4) * 6] != '\0')) ||
             (((undefined1 *)&DAT_451b_0665)
              [*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) * 6] !=
              '\0')))) ||
           (((undefined1 *)&DAT_451b_0666)
            [*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar3 * 2) + 4) * 6] !=
            '\0')) goto LAB_899d_1380;
      }
      else {
LAB_899d_1380:
        _local_28 = (undefined2 ****)local_e;
        FUN_1000_1e79();
        uVar4 = 0x1997;
        FUN_1997_0129(8);
      }
      _local_28 = (undefined2 ****)CONCAT22(0xad82,local_28);
      FUN_899d_1a07();
      uVar5 = 0x40c1;
      _local_28 = (undefined2 ****)CONCAT22(uVar4,0xada6);
      thunk_FUN_7e8f_00bf();
    }
    else {
      _local_28 = (undefined2 ****)0x0;
      uVar5 = 0x40f9;
      thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,
                          ((undefined2 *)&DAT_4125_3106)[iVar3 * 2],
                          ((undefined2 *)&DAT_4125_3108)[iVar3 * 2],0,0,0,0,1);
    }
    iVar3 = iVar3 + 1;
  } while( true );
}

