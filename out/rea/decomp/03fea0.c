
void __cdecl16far thunk_FUN_5efd_0000(void)

{
  byte *pbVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  undefined2 uVar6;
  int iStack_6;
  
  iVar5 = 0;
  iStack_6 = 0;
  iVar2 = DAT_3c04_157b;
  if (*DAT_451b_018e != 0) {
    while( true ) {
      iVar3 = iVar2;
      iVar2 = iVar3 + -1;
      piVar4 = (int *)DAT_451b_018e;
      uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (iVar3 == 0) break;
      if ((*(char *)(iVar2 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         ((*(char *)((int)piVar4 + iVar3 + 0x55) == '\x05' ||
          (*(char *)((int)piVar4 + iVar3 + 0x55) == '\b')))) {
        iStack_6 = iStack_6 + 1;
      }
    }
    iVar2 = 4;
    while (iVar3 = iVar2 + -1, iVar2 != 0) {
      iVar2 = iVar3;
      if (piVar4[iVar3 * 0x2e + 0x126] != 0) {
        iVar5 = iVar5 + 1;
      }
    }
    if (((iVar5 < piVar4[0x125]) && (iStack_6 != 0)) && ((iVar5 == 0 || (2 < iStack_6)))) {
      iVar2 = piVar4[0x125];
      iVar5 = -1;
      while (iVar3 = iVar2 + -1, iVar2 != 0) {
        iVar2 = iVar3;
        if (piVar4[iVar3 * 0x2e + 0x126] == 0) {
          iVar5 = iVar3;
        }
      }
      if (iVar5 != -1) {
        FUN_5efd_08ba(iVar5);
        iVar2 = FUN_5efd_0e04(0x5efd,0);
        if (iVar2 != -1) {
          iVar3 = FUN_5efd_01bb(iVar5,iVar2,(int *)DAT_451b_018e + iVar5 * 0x2e + 0x12d,
                                DAT_451b_018e._2_2_,(int *)DAT_451b_018e + iVar5 * 0x2e + 0x139,
                                DAT_451b_018e._2_2_);
          if (iVar3 == -1) {
            FUN_5efd_08ba(iVar5);
          }
          else {
            uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
            ((int *)DAT_451b_018e)[iVar5 * 0x2e + 0x126] = 1;
            ((int *)DAT_451b_018e)[iVar5 * 0x2e + 0x127] = iVar2;
            ((int *)DAT_451b_018e)[iVar5 * 0x2e + 0x128] = iVar3;
            *(undefined1 *)((int)(int *)DAT_451b_018e + iVar3 + 0x56) = 7;
            FUN_5efd_06a0(iVar5);
            iVar2 = DAT_3c04_0110 * 8 + iVar2;
            pbVar1 = (byte *)(iVar2 + 0x153b);
            *pbVar1 = *pbVar1 & 0xf3;
            pbVar1 = (byte *)(iVar2 + 0x153b);
            *pbVar1 = *pbVar1 | 8;
            FUN_5efd_083e(iVar3);
            FUN_5efd_09ca(iVar5);
            thunk_FUN_59a9_01b3();
          }
        }
      }
    }
  }
  return;
}

