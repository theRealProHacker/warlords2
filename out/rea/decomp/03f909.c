
/* WARNING: Removing unreachable block (ram,0x00052407) */

void __cdecl16far thunk_FUN_5131_0ce0(void)

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  
  for (iVar3 = 0; iVar3 < DAT_3c04_157b; iVar3 = iVar3 + 1) {
    DAT_4125_02de = 0;
    DAT_4125_02dc = 0;
    DAT_4125_02da = 0;
    DAT_4125_02d8 = 0;
    DAT_4125_02d6 = 0;
    iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                *(undefined2 *)(iVar3 * 0x41 + 0x157f),3);
    if ((((iVar1 != 0) ||
         (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                      *(undefined2 *)(iVar3 * 0x41 + 0x157f),3), iVar1 != 0)) ||
        (iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,3), iVar1 != 0)) ||
       (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                    *(int *)(iVar3 * 0x41 + 0x157f) + 1,3), iVar1 != 0)) {
      DAT_4125_02d6 = 1;
    }
    iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                *(undefined2 *)(iVar3 * 0x41 + 0x157f),4);
    if (((iVar1 != 0) ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(undefined2 *)(iVar3 * 0x41 + 0x157f),4), iVar1 != 0)) ||
       ((iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,4), iVar1 != 0 ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,4), iVar1 != 0)))) {
      DAT_4125_02d8 = 1;
    }
    iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                *(undefined2 *)(iVar3 * 0x41 + 0x157f),0);
    if (((iVar1 != 0) ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(undefined2 *)(iVar3 * 0x41 + 0x157f),0), iVar1 != 0)) ||
       ((iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,0), iVar1 != 0 ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,0), iVar1 != 0)))) {
      DAT_4125_02da = 1;
    }
    iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                *(undefined2 *)(iVar3 * 0x41 + 0x157f),5);
    if ((((iVar1 != 0) ||
         (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                      *(undefined2 *)(iVar3 * 0x41 + 0x157f),5), iVar1 != 0)) ||
        (iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,5), iVar1 != 0)) ||
       (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                    *(int *)(iVar3 * 0x41 + 0x157f) + 1,5), iVar1 != 0)) {
      DAT_4125_02dc = 1;
    }
    iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                *(undefined2 *)(iVar3 * 0x41 + 0x157f),8);
    if (((iVar1 != 0) ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(undefined2 *)(iVar3 * 0x41 + 0x157f),8), iVar1 != 0)) ||
       ((iVar1 = thunk_FUN_4c45_11f5(*(undefined2 *)(iVar3 * 0x41 + 0x157d),
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,8), iVar1 != 0 ||
        (iVar1 = thunk_FUN_4c45_11f5(*(int *)(iVar3 * 0x41 + 0x157d) + 1,
                                     *(int *)(iVar3 * 0x41 + 0x157f) + 1,8), iVar1 != 0)))) {
      DAT_4125_02de = 1;
    }
    uVar2 = FUN_5131_1104(iVar3);
    FUN_5131_1171(iVar3,uVar2);
    FUN_5131_161d(iVar3,uVar2);
  }
  FUN_5131_1c1d();
  return;
}

