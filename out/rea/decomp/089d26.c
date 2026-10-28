
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_899d_0356(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined1 local_10 [2];
  undefined2 uStack_e;
  undefined2 uStack_c;
  uint local_8;
  int local_6;
  undefined2 local_4;
  
  if (DAT_451b_1f02 == (undefined2 *)0x0) {
    FUN_899d_05a3();
  }
  else {
    FUN_1b62_007d(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1],&local_4);
    FUN_1b62_09ec(local_4,0);
    if (DAT_4125_30f8 != 0) {
      thunk_FUN_8027_0aeb();
    }
    DAT_4125_30f8 = 0;
    FUN_22bf_07a5();
    if (DAT_4125_2bda == 0) {
      DAT_451b_1e9e = 1;
      _DAT_451b_1ede = DAT_451b_1f02;
    }
    for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
      if (iVar1 < DAT_4125_30f6) {
        local_6 = (DAT_3c04_0110 + ((undefined2 *)&DAT_451b_28f2)[iVar1]) % 8 + 2;
        local_8 = (uint)(((undefined2 *)&DAT_451b_28e2)[iVar1] == 0);
        uVar2 = (undefined2)
                ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar1 * 2) >> 0x10);
        thunk_FUN_85d0_08be((int)*(char *)((int)*(undefined4 *)
                                                 ((undefined2 *)&DAT_451b_2902 + iVar1 * 2) + 4),
                            DAT_3c04_0110,0x342a,0x4125,((undefined2 *)&DAT_4125_2fc6)[iVar1 * 2],
                            ((undefined2 *)&DAT_4125_2fc8)[iVar1 * 2],0,0,
                            (int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar1 * 2] + 7),
                            (int)*(char *)((int)*(undefined4 *)
                                                 ((undefined2 *)&DAT_451b_2902 + iVar1 * 2) + 8),
                            local_6,2,local_8);
        if (((undefined2 *)&DAT_451b_28d2)[iVar1] == -1) {
          FUN_24d0_0002();
          goto LAB_899d_04f4;
        }
        FUN_1000_1e79();
        FUN_1997_0129();
      }
      else {
        thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,
                            ((undefined2 *)&DAT_4125_2fc6)[iVar1 * 2],
                            ((undefined2 *)&DAT_4125_2fc8)[iVar1 * 2],0,0,0,0x10000,0);
        FUN_24d0_0002();
        FUN_216d_0288(iVar1 * 8 + 0x2fe6,0x4125);
LAB_899d_04f4:
        FUN_216d_002e(local_10);
        FUN_216d_0288();
      }
    }
    FUN_899d_0567();
    FUN_1000_1e79(DAT_4125_30f2);
    FUN_1997_0129();
    uStack_c = 0x1997;
    uStack_e = 0x9f2f;
    FUN_899d_070d();
    uStack_c = 0x1997;
    uStack_e = 0x9f34;
    FUN_22bf_0757();
  }
  return;
}

