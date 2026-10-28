
undefined2 __cdecl16far thunk_FUN_8bc3_019b(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  undefined4 uStack_6;
  
  thunk_FUN_824f_0af3();
  FUN_177b_003d();
  uVar1 = FUN_8bc3_040e();
  uStack_6 = CONCAT22(in_DX,uVar1);
  if (uStack_6 == 0) {
    DAT_451b_1f02 = (int *)0x0;
    thunk_FUN_7d9f_0b5f();
  }
  else {
    FUN_8bc3_06eb(uStack_6);
    thunk_FUN_7d9f_0b79();
  }
  thunk_FUN_899d_0356();
  thunk_FUN_8027_0174();
  if (DAT_3c04_012e != 0) {
    if ((DAT_3c04_0134 & 8) == 0) {
      DAT_3c04_0134 = DAT_3c04_0134 | 8;
      uVar1 = thunk_FUN_7e8f_0505(0x30019);
      thunk_FUN_8027_168d(uVar1,in_DX);
    }
    if ((DAT_3c04_0134 & 0x10) == 0) {
      for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
        iVar2 = thunk_FUN_824f_044a(*DAT_451b_1f02 +
                                    *(int *)((int)(undefined2 *)&DAT_4125_2b4b + iVar3 * 2 + 1),
                                    ((int *)DAT_451b_1f02)[1] +
                                    ((undefined2 *)&DAT_4125_2b5c)[iVar3]);
        if ((-1 < iVar2) && (in_DX = 0x3c04, *(char *)(iVar2 * 0x41 + 0x1592) != DAT_3c04_0110)) {
          DAT_3c04_0134 = DAT_3c04_0134 | 0x10;
          uVar1 = thunk_FUN_7e8f_0505(0x40019);
          thunk_FUN_8027_168d(uVar1,in_DX);
          break;
        }
      }
    }
    if (-1 < (char)DAT_3c04_0134) {
      uVar1 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
      if ((*(char *)(*(byte *)(((int *)DAT_451b_1f02)[1] * 0xe0 + *DAT_451b_1f02 * 2) + 0x710) ==
           '\v') && ((char)((int *)DAT_451b_1f02)[2] == '\x1c')) {
        DAT_3c04_0134 = DAT_3c04_0134 | 0x80;
        uVar1 = thunk_FUN_7e8f_0505(0x50019);
        thunk_FUN_8027_168d(uVar1,in_DX);
      }
    }
  }
  return 1;
}

