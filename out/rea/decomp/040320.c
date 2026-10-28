
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_6a62_008b(int param_1,int param_2)

{
  bool bVar1;
  char cVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  undefined2 unaff_SS;
  char acStack_92 [32];
  undefined1 auStack_72 [32];
  int iStack_52;
  int iStack_50;
  int iStack_4e;
  int iStack_4c;
  int iStack_4a;
  int iStack_48;
  int iStack_46;
  int iStack_44;
  int iStack_40;
  int iStack_3e;
  char acStack_35 [9];
  int iStack_2c;
  int iStack_2a;
  int iStack_28;
  int iStack_26;
  int iStack_24;
  int iStack_22;
  int iStack_20;
  int iStack_1e;
  int iStack_1c;
  int iStack_1a;
  int iStack_18;
  int iStack_16;
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  undefined2 uStack_6;
  undefined2 uStack_4;
  
  iStack_e = 0;
  iStack_12 = 0;
  iStack_14 = 0;
  iStack_18 = 0;
  iStack_1a = 0;
  bVar1 = false;
  iStack_1e = 0;
  iStack_20 = 0;
  iStack_22 = 0;
  iStack_24 = 0;
  iStack_26 = 0;
  iStack_28 = 0;
  iStack_2a = 0;
  iStack_2c = FUN_6a62_0000(param_1,param_2);
  DAT_451b_029a = (char)DAT_3c04_0110;
  DAT_451b_029b = *(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0xf;
  if (DAT_451b_029b < 8) {
    iStack_c = (int)(char)DAT_451b_029b;
  }
  else {
    iStack_c = 8;
  }
  if (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\n') {
    DAT_451b_0291 = '\x04';
    iVar7 = 0;
    while ((iVar7 < DAT_3c04_157b &&
           (((*(int *)(iVar7 * 0x41 + 0x157d) != param_1 &&
             (*(int *)(iVar7 * 0x41 + 0x157d) != param_1 + -1)) ||
            ((*(int *)(iVar7 * 0x41 + 0x157f) != param_2 &&
             (*(int *)(iVar7 * 0x41 + 0x157f) != param_2 + -1))))))) {
      iVar7 = iVar7 + 1;
    }
    iVar6 = 4;
    while (iVar4 = iVar6 + -1, iVar6 != 0) {
      ((undefined2 *)&DAT_451b_0292)[iVar4] =
           *(undefined2 *)
            ((*(int *)(iVar7 * 0x41 + 0x157f) + *(int *)(iVar4 * 2 + 0xd4e)) * 0xe0 +
            (*(int *)(iVar7 * 0x41 + 0x157d) + *(int *)(iVar4 * 2 + 0xd46)) * 2);
      ((undefined2 *)&DAT_451b_0289)[iVar4] =
           *(int *)(iVar7 * 0x41 + 0x157d) + *(int *)(iVar4 * 2 + 0xd46);
      ((undefined2 *)&DAT_451b_0281)[iVar4] =
           *(int *)(iVar7 * 0x41 + 0x157f) + *(int *)(iVar4 * 2 + 0xd4e);
      iVar6 = iVar4;
    }
    _DAT_451b_027d = CONCAT22(0x3c04,iVar7 * 0x41 + 0x157d);
  }
  else {
    DAT_451b_0291 = '\x01';
    DAT_451b_0292 = *(uint *)(param_2 * 0xe0 + param_1 * 2);
    DAT_451b_0289 = param_1;
    DAT_451b_0281 = param_2;
    _DAT_451b_027d = 0;
  }
  DAT_451b_0364 = (char)DAT_451b_1e9e;
  if (DAT_4125_2bda == 0) {
    DAT_451b_0364 = '\x01';
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
    ((undefined1 *)&DAT_451b_02c4)[iVar7] = 1;
  }
  if (DAT_4125_2bda == 0) {
    DAT_451b_0366 = DAT_451b_1f02;
  }
  else {
    for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
      uVar8 = ((undefined2 *)&DAT_451b_1ede)[iVar7 * 2];
      *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar7 * 4 + 2) =
           *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar7 * 4);
      *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar7) = uVar8;
    }
  }
  DAT_451b_0365 = '\0';
  iVar7 = DAT_3c04_0181;
  if (DAT_451b_0291 == '\x04') {
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if ((((*(char *)(iVar6 * 0x16 + -0x777b) != (char)DAT_3c04_0110) &&
           (DAT_451b_0289 <= *(int *)(iVar6 * 0x16 + -0x7780))) &&
          (*(int *)(iVar6 * 0x16 + -0x7780) <= DAT_451b_0289 + 1)) &&
         ((DAT_451b_0281 <= *(int *)(iVar6 * 0x16 + -0x777e) &&
          (*(int *)(iVar6 * 0x16 + -0x777e) <= DAT_451b_0281 + 1)))) {
        iVar4 = (int)DAT_451b_0365;
        ((undefined2 *)&DAT_451b_0388)[iVar4 * 2] = 0x2e1d;
        ((undefined2 *)&DAT_451b_0386)[iVar4 * 2] = iVar6 * 0x16 + -0x7780;
        DAT_451b_0365 = DAT_451b_0365 + '\x01';
      }
    }
  }
  else {
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if (((*(char *)(iVar6 * 0x16 + -0x777b) != (char)DAT_3c04_0110) &&
          (*(int *)(iVar6 * 0x16 + -0x7780) == DAT_451b_0289)) &&
         (*(int *)(iVar6 * 0x16 + -0x777e) == DAT_451b_0281)) {
        iVar4 = (int)DAT_451b_0365;
        ((undefined2 *)&DAT_451b_0388)[iVar4 * 2] = 0x2e1d;
        ((undefined2 *)&DAT_451b_0386)[iVar4 * 2] = iVar6 * 0x16 + -0x7780;
        DAT_451b_0365 = DAT_451b_0365 + '\x01';
      }
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    ((undefined1 *)&DAT_451b_02cc)[iVar7] = 1;
  }
  if (((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x02') ||
      (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x03')) ||
     (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x06')) {
    bVar1 = true;
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    acStack_92[iVar7] =
         *(char *)(iStack_c * 0x1d +
                   (int)*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 4
                                 ) + 0x60b);
    if ((iStack_28 == 0) &&
       (*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 4) == '\x1c')) {
      iStack_28 = 1;
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
    acStack_35[iVar7 + 1] =
         *(char *)(DAT_451b_029a * 0x1d +
                   (int)*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 4) + 0x60b);
    if ((iStack_2a == 0) && (*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 4) == '\x1c')) {
      iStack_2a = 1;
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    if ((((bVar1) &&
         (uVar8 = (undefined2)
                  ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) >> 0x10),
         (*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 0xc) & 0x1000)
         == 0)) &&
        (((undefined1 *)&DAT_451b_0664)
         [*(char *)(((undefined2 *)&DAT_451b_0386)[iVar7 * 2] + 4) * 6] != '\0')) &&
       (iStack_28 != 0)) {
      acStack_92[iVar7] = acStack_92[iVar7] + 'P';
      break;
    }
  }
  iVar7 = 0;
  do {
    if (DAT_451b_0364 <= iVar7) {
LAB_6a62_05f1:
      for (iVar7 = 1; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
        iVar6 = iVar7;
        if (acStack_35[iVar7 + 1] < acStack_35[iVar7]) {
          for (; (0 < iVar6 && (acStack_35[iVar6 + 1] < acStack_35[iVar6])); iVar6 = iVar6 + -1) {
            uStack_4 = *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar6 * 4 + 2);
            uStack_6 = *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar6);
            uVar8 = *(undefined2 *)(iVar6 * 4 + 0x42c2);
            *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar6 * 4 + 2) =
                 *(undefined2 *)((undefined1 *)&DAT_451b_0364 + iVar6 * 4);
            *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar6) = uVar8;
            *(undefined2 *)((undefined1 *)&DAT_451b_0364 + iVar6 * 4) = uStack_4;
            *(undefined2 *)(iVar6 * 4 + 0x42c2) = uStack_6;
            cVar2 = acStack_35[iVar6 + 1];
            acStack_35[iVar6 + 1] = acStack_35[iVar6];
            acStack_35[iVar6] = cVar2;
          }
        }
      }
      for (iVar7 = 1; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
        iVar6 = iVar7;
        if (acStack_92[iVar7] < acStack_92[iVar7 + -1]) {
          for (; (0 < iVar6 && (acStack_92[iVar6] < acStack_92[iVar6 + -1])); iVar6 = iVar6 + -1) {
            uStack_4 = ((undefined2 *)&DAT_451b_0388)[iVar6 * 2];
            uStack_6 = ((undefined2 *)&DAT_451b_0386)[iVar6 * 2];
            uVar8 = *(undefined2 *)((undefined4 *)&DAT_451b_0382 + iVar6);
            ((undefined2 *)&DAT_451b_0388)[iVar6 * 2] =
                 *(undefined2 *)((int)(undefined4 *)&DAT_451b_0382 + iVar6 * 4 + 2);
            ((undefined2 *)&DAT_451b_0386)[iVar6 * 2] = uVar8;
            *(undefined2 *)((int)(undefined4 *)&DAT_451b_0382 + iVar6 * 4 + 2) = uStack_4;
            *(undefined2 *)((undefined4 *)&DAT_451b_0382 + iVar6) = uStack_6;
            cVar2 = acStack_92[iVar6];
            acStack_92[iVar6] = acStack_92[iVar6 + -1];
            acStack_92[iVar6 + -1] = cVar2;
          }
        }
      }
      iVar7 = (int)DAT_451b_0364;
      while (iVar7 != 0) {
        *(undefined1 *)(iVar7 + 0x4273) = 1;
        *(undefined1 *)(iVar7 + 0x424b) =
             *(undefined1 *)((int)((undefined4 *)&DAT_451b_0366)[iVar7 + -1] + 4);
        iVar7 = iVar7 + -1;
      }
      iVar7 = (int)DAT_451b_0365;
      while (iVar7 != 0) {
        ((undefined1 *)&DAT_451b_031b)[iVar7] = 1;
        ((undefined1 *)&DAT_451b_02f3)[iVar7] =
             *(undefined1 *)
              ((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + (iVar7 + -1) * 2) + 4);
        iVar7 = iVar7 + -1;
      }
      iVar7 = 0;
      iStack_10 = 0;
      uVar8 = 0x6a62;
      for (iVar6 = 0; iVar6 < DAT_451b_0364; iVar6 = iVar6 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02ec)[iVar6],auStack_72);
        if (((undefined1 *)&DAT_451b_02ec)[iVar6] == '\x1c') {
          iVar4 = (int)*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar6] + 8);
          iVar5 = FUN_6a62_0d1a((int)((undefined4 *)&DAT_451b_0366)[iVar6],
                                (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar6] >> 0x10));
          iVar4 = iVar4 + iVar5;
          if ((iVar7 < iVar4) && (iVar7 = iVar4, 9 < iVar4)) {
            iVar7 = 9;
          }
        }
        if (iStack_3e == 1) {
          iStack_1e = 1;
        }
        if (iStack_3e == 2) {
          iStack_20 = 1;
        }
        if (iStack_3e == 3) {
          iStack_22 = 1;
        }
        iVar4 = iStack_1a;
        if ((iStack_40 != 0) && (iVar4 = iStack_40, iStack_1a < iStack_40)) {
          iVar4 = iStack_1a;
        }
        iStack_1a = iVar4;
        iVar4 = iStack_12;
        if (((iStack_2c == 0) && (iStack_4a != 0)) && (iVar4 = iStack_4a, iStack_4a < iStack_12)) {
          iVar4 = iStack_12;
        }
        iStack_12 = iVar4;
        iVar4 = iStack_12;
        if (((iStack_2c == 1) && (iStack_48 != 0)) && (iVar4 = iStack_48, iStack_48 < iStack_12)) {
          iVar4 = iStack_12;
        }
        iStack_12 = iVar4;
        iVar4 = iStack_12;
        if (((iStack_2c == 2) && (iStack_46 != 0)) && (iVar4 = iStack_46, iStack_46 < iStack_12)) {
          iVar4 = iStack_12;
        }
        iStack_12 = iVar4;
        iVar4 = iStack_12;
        if (((iStack_2c == 3) && (iStack_44 != 0)) && (iVar4 = iStack_44, iStack_44 < iStack_12)) {
          iVar4 = iStack_12;
        }
        iStack_12 = iVar4;
        if (((undefined1 *)&DAT_451b_02ec)[iVar6] == '\x1c') {
          iVar4 = FUN_6a62_0d71((int)((undefined4 *)&DAT_451b_0366)[iVar6],
                                (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar6] >> 0x10));
          iStack_10 = iStack_10 + iVar4;
        }
        uVar8 = 0x4058;
      }
      iStack_16 = iStack_10 + *(int *)(iVar7 * 2 + 0xce4);
      iVar7 = 0;
      iStack_10 = 0;
      for (iVar6 = 0; iVar6 < DAT_451b_0365; iVar6 = iVar6 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02f4)[iVar6],auStack_72);
        if (((undefined1 *)&DAT_451b_02f4)[iVar6] == '\x1c') {
          iVar4 = (int)*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2) + 8)
          ;
          iVar5 = FUN_6a62_0d1a((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2),
                                (int)((ulong)*(undefined4 *)
                                              ((undefined2 *)&DAT_451b_0386 + iVar6 * 2) >> 0x10));
          iVar4 = iVar4 + iVar5;
          if ((iVar7 < iVar4) && (iVar7 = iVar4, 9 < iVar4)) {
            iVar7 = 9;
          }
        }
        if (iStack_3e == 2) {
          iStack_24 = 1;
        }
        if (iStack_3e == 3) {
          iStack_26 = 1;
        }
        iVar4 = iStack_14;
        if ((iStack_40 != 0) && (iVar4 = iStack_40, iStack_14 < iStack_40)) {
          iVar4 = iStack_14;
        }
        iStack_14 = iVar4;
        iVar4 = iStack_18;
        if (((iStack_2c == 0) && (iStack_4a != 0)) && (iVar4 = iStack_4a, iStack_4a < iStack_18)) {
          iVar4 = iStack_18;
        }
        iStack_18 = iVar4;
        iVar4 = iStack_18;
        if (((iStack_2c == 1) && (iStack_48 != 0)) && (iVar4 = iStack_48, iStack_48 < iStack_18)) {
          iVar4 = iStack_18;
        }
        iStack_18 = iVar4;
        iVar4 = iStack_18;
        if (((iStack_2c == 2) && (iStack_46 != 0)) && (iVar4 = iStack_46, iStack_46 < iStack_18)) {
          iVar4 = iStack_18;
        }
        iStack_18 = iVar4;
        iVar4 = iStack_18;
        if (((iStack_2c == 3) && (iStack_44 != 0)) && (iVar4 = iStack_44, iStack_44 < iStack_18)) {
          iVar4 = iStack_18;
        }
        iStack_18 = iVar4;
        if (((undefined1 *)&DAT_451b_02f4)[iVar6] == '\x1c') {
          iVar4 = FUN_6a62_0d71((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2),
                                (int)((ulong)*(undefined4 *)
                                              ((undefined2 *)&DAT_451b_0386 + iVar6 * 2) >> 0x10));
          iStack_10 = iStack_10 + iVar4;
        }
        uVar8 = 0x4058;
      }
      if ((iStack_1e == 0) && (iStack_2c == 0)) {
        if ((DAT_451b_0292 >> 8 & 0x20) == 0) {
          if (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\v') {
            iStack_e = 2;
          }
          else {
            iStack_e = (int)*(char *)((int)_DAT_451b_027d + 0x14);
          }
        }
        else {
          iStack_e = 1;
        }
        if (DAT_451b_029b == 0xf) {
          iStack_e = iStack_e / 2;
        }
      }
      iStack_1c = iStack_10 + *(int *)(iVar7 * 2 + 0xce4);
      iStack_8 = 0;
      if (iStack_24 == 0) {
        iStack_8 = iStack_16;
      }
      if (iStack_26 == 0) {
        iStack_8 = iStack_8 + iStack_12;
      }
      if (DAT_3c04_0112 < iStack_8) {
        iStack_8 = DAT_3c04_0112;
      }
      iStack_8 = iStack_8 + iStack_14;
      iStack_a = 0;
      if (iStack_20 == 0) {
        iStack_a = iStack_1c;
      }
      if (iStack_22 == 0) {
        iStack_a = iStack_a + iStack_18;
      }
      if (iStack_1e == 0) {
        iStack_a = iStack_a + iStack_e;
      }
      if (DAT_3c04_0112 < iStack_a) {
        iStack_a = DAT_3c04_0112;
      }
      iStack_a = iStack_a + iStack_1a;
      for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02ec)[iVar7],auStack_72);
        ((undefined1 *)&DAT_451b_029c)[iVar7] = 0;
        if (((*(uint *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 0xc) & 0x1000) == 0) ||
           ((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x02' &&
            (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x03')))) {
          ((undefined1 *)&DAT_451b_033c)[iVar7] =
               *(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 8) + (char)iStack_8;
          if (((undefined1 *)&DAT_451b_02ec)[iVar7] == '\x1c') {
            cVar2 = FUN_6a62_0d1a((int)((undefined4 *)&DAT_451b_0366)[iVar7],
                                  (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar7] >> 0x10));
            ((undefined1 *)&DAT_451b_033c)[iVar7] = ((undefined1 *)&DAT_451b_033c)[iVar7] + cVar2;
          }
          if ((iStack_2c == 0) && (iStack_52 != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)iStack_52;
          }
          if ((iStack_2c == 1) && (iStack_50 != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)iStack_50;
          }
          if ((iStack_2c == 2) && (iStack_4e != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)iStack_4e;
          }
          if ((iStack_2c == 3) && (iStack_4c != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)iStack_4c;
          }
          if ((char)((undefined1 *)&DAT_451b_033c)[iVar7] < '\x10') {
            uVar3 = ((undefined1 *)&DAT_451b_033c)[iVar7];
          }
          else {
            uVar3 = 0xf;
          }
          ((undefined1 *)&DAT_451b_033c)[iVar7] = uVar3;
        }
        else {
          ((undefined1 *)&DAT_451b_033c)[iVar7] = 4;
          ((undefined1 *)&DAT_451b_029c)[iVar7] = 1;
        }
        uVar8 = 0x4058;
      }
      for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02f4)[iVar7],auStack_72);
        ((undefined1 *)&DAT_451b_02a4)[iVar7] = 0;
        if (((*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 0xc) &
             0x1000) == 0) ||
           ((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x02' &&
            (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x03')))) {
          ((undefined1 *)&DAT_451b_0344)[iVar7] =
               *(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 8) +
               (char)iStack_a;
          if (((undefined1 *)&DAT_451b_02f4)[iVar7] == '\x1c') {
            cVar2 = FUN_6a62_0d1a((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2),
                                  (int)((ulong)*(undefined4 *)
                                                ((undefined2 *)&DAT_451b_0386 + iVar7 * 2) >> 0x10))
            ;
            ((undefined1 *)&DAT_451b_0344)[iVar7] = ((undefined1 *)&DAT_451b_0344)[iVar7] + cVar2;
          }
          if ((iStack_2c == 0) && (iStack_52 != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)iStack_52;
          }
          if ((iStack_2c == 1) && (iStack_50 != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)iStack_50;
          }
          if ((iStack_2c == 2) && (iStack_4e != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)iStack_4e;
          }
          if ((iStack_2c == 3) && (iStack_4c != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)iStack_4c;
          }
          if ((char)((undefined1 *)&DAT_451b_0344)[iVar7] < '\x10') {
            uVar3 = ((undefined1 *)&DAT_451b_0344)[iVar7];
          }
          else {
            uVar3 = 0xf;
          }
          ((undefined1 *)&DAT_451b_0344)[iVar7] = uVar3;
        }
        else {
          ((undefined1 *)&DAT_451b_0344)[iVar7] = 4;
          ((undefined1 *)&DAT_451b_02a4)[iVar7] = 1;
        }
        uVar8 = 0x4058;
      }
      return;
    }
    if (((bVar1) &&
        (uVar8 = (undefined2)((ulong)((undefined4 *)&DAT_451b_0366)[iVar7] >> 0x10),
        (*(uint *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 0xc) & 0x1000) == 0)) &&
       ((((undefined1 *)&DAT_451b_0664)
         [*(char *)(*(int *)((undefined4 *)&DAT_451b_0366 + iVar7) + 4) * 6] != '\0' &&
        (iStack_2a != 0)))) {
      acStack_35[iVar7 + 1] = acStack_35[iVar7 + 1] + 'P';
      goto LAB_6a62_05f1;
    }
    iVar7 = iVar7 + 1;
  } while( true );
}

