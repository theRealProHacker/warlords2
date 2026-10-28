
void __cdecl16far FUN_79c4_0000(void)

{
  byte *pbVar1;
  int *piVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  
  iVar4 = 0;
  uVar3 = 1;
  DAT_3c04_0118 = 0;
  DAT_3c04_015d = 0;
  DAT_3c04_0135 = 1;
  DAT_3c04_0181 = 10;
  DAT_3c04_0157 = 0;
  for (iVar5 = 0; iVar5 < 8; iVar5 = iVar5 + 1) {
    if (*(int *)(iVar5 * 2 + 0xd0) == 0) {
      iVar4 = iVar4 + 1;
    }
  }
  if ((DAT_3c04_0124 != 0) && (0 < iVar4)) {
    uVar3 = 0;
  }
  if ((DAT_3c04_0124 != 0) && (iVar4 == 1)) {
    DAT_4125_16a6 = 1;
  }
  for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
    *(undefined2 *)(iVar4 * 2 + 0x147) = uVar3;
    if (*(int *)(iVar4 * 2 + 0x137) == 0) {
      *(undefined2 *)(iVar4 * 0x14 + 0x185) = 0;
    }
  }
  thunk_FUN_66b0_0000();
  iVar4 = 1000;
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    *(undefined1 *)(iVar5 * 0x16 + -0x777b) = 0xff;
    *(undefined2 *)(iVar5 * 0x16 + -0x7780) = 0xffff;
    *(undefined2 *)(iVar5 * 0x16 + -0x777e) = 0xffff;
    iVar4 = iVar5;
  }
  DAT_451b_1efe = 0;
  DAT_451b_1f02 = 0;
  for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
    *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar4 * 4) = 0;
    ((undefined2 *)&DAT_451b_1ede)[iVar4 * 2] = 0;
  }
  thunk_FUN_76e4_0000();
  FUN_79c4_07ca();
  thunk_FUN_85d0_1931();
  thunk_FUN_85d0_113b();
  thunk_FUN_63d6_0000();
  thunk_FUN_6bb0_00cc();
  iVar4 = DAT_3c04_0110;
  if (DAT_3c04_0124 != 0) {
    iVar5 = 0;
    while ((iVar4 = DAT_3c04_0110, iVar5 < 8 && (iVar4 = iVar5, *(int *)(iVar5 * 2 + 0xd0) != 0))) {
      iVar5 = iVar5 + 1;
    }
    thunk_FUN_830b_2200();
  }
  DAT_3c04_017d = *(int *)(iVar4 * 0x14 + 0x189);
  DAT_3c04_017f = *(int *)(iVar4 * 0x14 + 0x18b);
  if (DAT_3c04_017d < 5) {
    DAT_3c04_017d = 4;
  }
  if (DAT_3c04_017f < 5) {
    DAT_3c04_017f = 4;
  }
  if (0x6a < DAT_3c04_017d) {
    DAT_3c04_017d = 0x6b;
  }
  if (0x96 < DAT_3c04_017f) {
    DAT_3c04_017f = 0x97;
  }
  DAT_3c04_0177 = DAT_3c04_017d + -4;
  DAT_3c04_017b = DAT_3c04_017d + 4;
  DAT_3c04_0175 = DAT_3c04_017f + -4;
  DAT_3c04_0179 = DAT_3c04_017f + 4;
  for (iVar4 = 0; iVar4 < 0x70; iVar4 = iVar4 + 1) {
    for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
      pbVar1 = (byte *)(iVar5 * 0xe0 + iVar4 * 2 + 1);
      *pbVar1 = *pbVar1 & 0xdf;
      pbVar1 = (byte *)(iVar5 * 0x70 + iVar4);
      *pbVar1 = *pbVar1 & 0xbf;
    }
  }
  thunk_FUN_53ff_0103();
  for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
    uVar3 = thunk_FUN_7e8f_02bf(1,8);
    *(undefined2 *)(iVar4 * 2 + 0x10e3) = uVar3;
    if ((DAT_3c04_0116 != 0) && (*(int *)(iVar4 * 2 + 0xd0) == 0)) {
      piVar2 = (int *)(iVar4 * 2 + 0x10e3);
      *piVar2 = *piVar2 + 400;
    }
  }
  thunk_FUN_484d_11bd();
  return;
}

