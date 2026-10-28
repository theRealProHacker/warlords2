
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __cdecl16far FUN_67a7_0a6b(int param_1,int param_2,int param_3)

{
  byte *pbVar1;
  int *piVar2;
  byte bVar3;
  undefined1 uVar4;
  int iVar5;
  undefined2 uVar6;
  undefined2 uVar7;
  uint uVar8;
  int *piVar9;
  int iVar10;
  
  FUN_67a7_1aff();
  iVar5 = thunk_FUN_824f_044a(param_2,param_3);
  if ((((-1 < iVar5) && (7 < (int)DAT_451b_0364 + (int)DAT_451b_0365)) && ('\x03' < DAT_451b_0365))
     && (param_1 == 1)) {
    if (DAT_451b_1efe == 0) {
      uVar6 = thunk_FUN_824f_044a(param_2,param_3,0xd12,0x4125);
      iVar5 = (int)(char)DAT_451b_029a;
    }
    else {
      uVar6 = thunk_FUN_824f_044a(param_2,param_3,*(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223,
                                  0x3c04);
      iVar5 = -1;
    }
    thunk_FUN_6d27_1244((int)(char)DAT_451b_029a,5,iVar5,uVar6);
  }
  DAT_451b_1e9e = 0;
  iVar5 = 8;
  while (iVar10 = iVar5 + -1, iVar5 != 0) {
    *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar10 * 4) = 0;
    ((undefined2 *)&DAT_451b_1ede)[iVar10 * 2] = 0;
    iVar5 = iVar10;
  }
  for (iVar5 = 0; iVar10 = DAT_451b_1e9e, iVar5 < DAT_451b_0364; iVar5 = iVar5 + 1) {
    if (((undefined1 *)&DAT_451b_02c4)[iVar5] != '\0') {
      uVar6 = *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar5);
      *(undefined2 *)((undefined *)&DAT_451b_1ee0 + DAT_451b_1e9e * 4) =
           *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar5 * 4 + 2);
      ((undefined2 *)&DAT_451b_1ede)[iVar10 * 2] = uVar6;
      DAT_451b_1e9e = DAT_451b_1e9e + 1;
    }
  }
  DAT_451b_1f02 = _DAT_451b_1ede;
  for (iVar5 = 0; iVar5 < DAT_451b_0364; iVar5 = iVar5 + 1) {
    if (((undefined1 *)&DAT_451b_02c4)[iVar5] == '\0') {
      if (((undefined1 *)&DAT_451b_02ec)[iVar5] == '\x1c') {
        uVar6 = thunk_FUN_824f_044a(param_2,param_3,0,
                                    *(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar5] + 10) *
                                    0x14 + 0x223,0x3c04);
        thunk_FUN_6d27_1244((int)(char)DAT_451b_029a,1,uVar6);
        FUN_67a7_16cd((int)((undefined4 *)&DAT_451b_0366)[iVar5],
                      (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar5] >> 0x10),param_2,param_3);
      }
      FUN_1b62_03be((int)((undefined4 *)&DAT_451b_0366)[iVar5],
                    (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar5] >> 0x10));
    }
    else if (((undefined1 *)&DAT_451b_02ec)[iVar5] == '\x1c') {
      if (*(char *)((byte)DAT_451b_0292 + 0x710) == '\n') {
        uVar6 = 2;
      }
      else {
        uVar6 = 1;
      }
      thunk_FUN_7533_04f1((int)((undefined4 *)&DAT_451b_0366)[iVar5],
                          (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar5] >> 0x10),uVar6);
    }
  }
  for (iVar5 = 0; iVar5 < DAT_451b_0365; iVar5 = iVar5 + 1) {
    if (((undefined1 *)&DAT_451b_02cc)[iVar5] == '\0') {
      if (((undefined1 *)&DAT_451b_02f4)[iVar5] == '\x1c') {
        uVar6 = thunk_FUN_824f_044a(param_2,param_3,0,
                                    *(char *)((int)*(undefined4 *)
                                                    ((undefined2 *)&DAT_451b_0386 + iVar5 * 2) + 10)
                                    * 0x14 + 0x223,0x3c04);
        thunk_FUN_6d27_1244((int)(char)DAT_451b_029b,1,uVar6);
        FUN_67a7_16cd((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2),
                      (int)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2) >> 0x10
                           ),param_2,param_3);
      }
      FUN_1b62_03be((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2),
                    (int)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2) >> 0x10))
      ;
    }
    else if (((undefined1 *)&DAT_451b_02ec)[iVar5] == '\x1c') {
      thunk_FUN_7533_04f1((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2),
                          (int)((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar5 * 2) >>
                               0x10),1);
    }
  }
  thunk_FUN_824f_03f9();
  thunk_FUN_824f_02bf();
  thunk_FUN_824f_0372();
  if (param_1 == 0) {
    bVar3 = DAT_451b_029b & 0xf;
    iVar5 = DAT_451b_0281 * 0xe0 + DAT_451b_0289 * 2;
    pbVar1 = (byte *)(iVar5 + 1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar5 + 1);
    *pbVar1 = *pbVar1 | bVar3;
    thunk_FUN_824f_0000();
  }
  else {
    bVar3 = DAT_451b_029a & 0xf;
    iVar5 = DAT_451b_0281 * 0xe0 + DAT_451b_0289 * 2;
    pbVar1 = (byte *)(iVar5 + 1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar5 + 1);
    *pbVar1 = *pbVar1 | bVar3;
    thunk_FUN_85d0_1298(DAT_3c04_0110,DAT_451b_0289,DAT_451b_0281);
    thunk_FUN_830b_1fed(DAT_451b_0289,DAT_451b_0281,1);
    if ((DAT_451b_0292._1_1_ & 0x20) != 0) {
      pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
      *pbVar1 = *pbVar1 & 0xdf;
    }
    if (*(char *)((byte)DAT_451b_0292 + 0x710) == '\n') {
      if (DAT_451b_029b == 0xf) {
        iVar5 = 0;
      }
      else if ((int)((undefined2 *)&DAT_451b_1e8a)[(char)DAT_451b_029b] < 2) {
        iVar5 = *(int *)((char)DAT_451b_029b * 0x14 + 0x185);
      }
      else {
        iVar5 = *(int *)((char)DAT_451b_029b * 0x14 + 0x185) /
                (int)((undefined2 *)&DAT_451b_1e8a)[(char)DAT_451b_029b];
      }
      if (iVar5 / 2 < 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = iVar5 / 2;
      }
      uVar6 = 0x3c04;
      if ((*(int *)((char)DAT_451b_029a * 2 + 0xd0) == 0) && (0 < iVar5)) {
        uVar7 = thunk_FUN_7e8f_04f0(0x93,0,iVar5);
        FUN_1000_4944(0x4162,0x4125,uVar7,uVar6);
        thunk_FUN_6a0f_04c5(0x4162,0x4125);
      }
      if ((char)DAT_451b_029b < '\b') {
        piVar2 = (int *)((char)DAT_451b_029a * 0x14 + 0x185);
        *piVar2 = *piVar2 + iVar5;
        piVar2 = (int *)((char)DAT_451b_029b * 0x14 + 0x185);
        *piVar2 = *piVar2 + iVar5 * -2;
      }
      uVar6 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
      piVar9 = (int *)_DAT_451b_027d;
      if (*(char *)((int)piVar9 + 0x15) != '\x0f') {
        if (*(byte *)((int)piVar9 + 0x2f) == DAT_3c04_0110) {
          uVar4 = 0xf;
        }
        else {
          uVar4 = *(undefined1 *)((int)piVar9 + 0x15);
        }
        *(undefined1 *)((int)piVar9 + 0x2f) = uVar4;
      }
      uVar6 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
      piVar9 = (int *)_DAT_451b_027d;
      *(undefined1 *)(piVar9 + 0x18) = 0;
      *(byte *)((int)piVar9 + 0x15) = DAT_451b_029a;
      *(undefined1 *)((int)piVar9 + 0x2d) = 0;
      iVar5 = 4;
      while (iVar10 = iVar5 + -1, iVar5 != 0) {
        pbVar1 = (byte *)(((undefined2 *)&DAT_451b_0281)[iVar10] * 0xe0 +
                          ((undefined2 *)&DAT_451b_0289)[iVar10] * 2 + 1);
        *pbVar1 = *pbVar1 & 0xef;
        thunk_FUN_6bb0_0000((int *)_DAT_451b_027d,(int)((ulong)_DAT_451b_027d >> 0x10),
                            (int)(char)DAT_451b_029a);
        bVar3 = DAT_451b_029a & 0xf;
        iVar5 = ((undefined2 *)&DAT_451b_0281)[iVar10] * 0xe0 +
                ((undefined2 *)&DAT_451b_0289)[iVar10] * 2;
        pbVar1 = (byte *)(iVar5 + 1);
        *pbVar1 = *pbVar1 & 0xf0;
        pbVar1 = (byte *)(iVar5 + 1);
        *pbVar1 = *pbVar1 | bVar3;
        thunk_FUN_85d0_1298(DAT_3c04_0110,((undefined2 *)&DAT_451b_0289)[iVar10],
                            ((undefined2 *)&DAT_451b_0281)[iVar10]);
        thunk_FUN_830b_1fed(((undefined2 *)&DAT_451b_0289)[iVar10],
                            ((undefined2 *)&DAT_451b_0281)[iVar10],1);
        iVar5 = iVar10;
      }
      FUN_1555_0d9e(DAT_3c04_0110,1);
      piVar2 = _DAT_451b_027d;
      uVar6 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
      piVar9 = (int *)_DAT_451b_027d;
      *(undefined2 *)((int)piVar9 + 0x31) = 0;
      uVar8 = thunk_FUN_824f_044a(*piVar2,piVar9[1]);
      iVar5 = DAT_3c04_0181;
      while (iVar10 = iVar5 + -1, iVar5 != 0) {
        iVar5 = iVar10;
        if (((*(byte *)(iVar10 * 0x16 + -0x777b) == DAT_451b_029b) &&
            (*(int *)(iVar10 * 0x16 + -0x7780) == -1)) &&
           (((*(byte *)(iVar10 * 0x16 + -0x7772) & 0xf) == 1 &&
            (*(byte *)(iVar10 * 0x16 + -0x7771) >> 1 == uVar8)))) {
          FUN_1b62_03be(iVar10 * 0x16 + -0x7780,0x2e1d);
        }
      }
      for (iVar5 = 0; iVar5 < DAT_3c04_157b; iVar5 = iVar5 + 1) {
        if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar5 * 0x41) != 0) &&
            (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar5 * 0x41) == *_DAT_451b_027d)) &&
           (*(int *)(iVar5 * 0x41 + 0x15b2) == ((int *)_DAT_451b_027d)[1])) {
          *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar5 * 0x41) = 0;
          *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar5 * 0x41) = 0;
          *(undefined1 *)(iVar5 * 0x41 + 0x15aa) = 0;
          *(undefined2 *)(iVar5 * 0x41 + 0x15b2) = 0;
          *(undefined1 *)(iVar5 * 0x41 + 0x15a9) = 0xff;
        }
      }
      thunk_FUN_824f_03f9();
      thunk_FUN_824f_02bf();
      thunk_FUN_824f_0372();
      return 0x21;
    }
  }
  return 1;
}

