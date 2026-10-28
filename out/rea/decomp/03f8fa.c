
void __cdecl16far thunk_FUN_5131_0689(void)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  int unaff_DI;
  undefined2 uVar4;
  undefined2 unaff_SS;
  int aiStack_1e [8];
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_e = 0;
LAB_5131_0696:
  iStack_e = iStack_e + 1;
  for (iStack_4 = 0; iStack_4 < 8; iStack_4 = iStack_4 + 1) {
    aiStack_1e[iStack_4] = 0;
    *(undefined2 *)(iStack_4 * 0x14 + 0x189) = 0xff9c;
    *(undefined2 *)(iStack_4 * 0x14 + 0x18b) = 0xff9c;
  }
  iStack_4 = 0;
  do {
    if (7 < iStack_4) {
      for (iStack_4 = 0; iStack_4 < 8; iStack_4 = iStack_4 + 1) {
        iVar2 = thunk_FUN_824f_044a(*(undefined2 *)(iStack_4 * 0x14 + 0x189),
                                    *(undefined2 *)(iStack_4 * 0x14 + 0x18b));
        *(undefined1 *)(iVar2 * 0x41 + 0x1592) = (undefined1)iStack_4;
        FUN_5131_09b3(iVar2 * 0x41 + 0x157d);
      }
      return;
    }
    iStack_6 = 0;
    while (iStack_6 == 0) {
      iStack_a = thunk_FUN_7e8f_02bf(1);
      if (aiStack_1e[iStack_a] == 0) {
        iStack_6 = 1;
        aiStack_1e[iStack_a] = 1;
      }
    }
    iStack_6 = 0;
    for (iStack_8 = 0; (iStack_6 == 0 && (iStack_8 < 100)); iStack_8 = iStack_8 + 1) {
      unaff_DI = FUN_5131_08f0();
      if ((0xb < *(int *)(unaff_DI * 0x41 + 0x157d)) &&
         (((*(int *)(unaff_DI * 0x41 + 0x157d) < 0x65 && (0xb < *(int *)(unaff_DI * 0x41 + 0x157f)))
          && (*(int *)(unaff_DI * 0x41 + 0x157f) < 0x91)))) {
        iStack_c = 1;
        for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
          uVar1 = *(int *)(unaff_DI * 0x41 + 0x157d) - *(int *)(iVar2 * 0x14 + 0x189);
          uVar3 = (int)uVar1 >> 0xf;
          if (((int)((uVar1 ^ uVar3) - uVar3) < 0x14) ||
             (uVar1 = *(int *)(unaff_DI * 0x41 + 0x157f) - *(int *)(iVar2 * 0x14 + 0x18b),
             uVar3 = (int)uVar1 >> 0xf, (int)((uVar1 ^ uVar3) - uVar3) < 0x14)) {
            iStack_c = 0;
            break;
          }
        }
        if (iStack_c != 0) {
          iStack_6 = 1;
        }
      }
    }
    if ((99 < iStack_8) && (iStack_e < 10)) goto LAB_5131_0696;
    uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    *(undefined2 *)((int)DAT_451b_002a + iStack_a * 2 + 0x1d72) =
         *(undefined2 *)((char *)s_Fight_Order_4125_1d58 + 10 + (int)DAT_451b_002a + iStack_4 * 2);
    *(undefined2 *)(iStack_4 * 0x14 + 0x189) = *(undefined2 *)(unaff_DI * 0x41 + 0x157d);
    *(undefined2 *)(iStack_4 * 0x14 + 0x18b) = *(undefined2 *)(unaff_DI * 0x41 + 0x157f);
    iStack_4 = iStack_4 + 1;
  } while( true );
}

