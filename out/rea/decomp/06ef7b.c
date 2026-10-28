
/* WARNING: Instruction at (ram,0x00060b50) overlaps instruction at (ram,0x00060b4f)
    */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __cdecl16far FUN_6ec8_02fb(void)

{
  byte *pbVar1;
  undefined1 *puVar2;
  char *pcVar3;
  int iVar4;
  char cVar5;
  char cVar6;
  char cVar7;
  char cVar8;
  byte bVar9;
  char cVar10;
  uint uVar11;
  int iVar12;
  undefined1 *puVar13;
  int iVar14;
  int unaff_DI;
  undefined2 uVar15;
  undefined2 uVar16;
  undefined1 *puVar17;
  undefined2 unaff_SS;
  undefined1 auStack_22 [8];
  int iStack_1a;
  int iStack_18;
  undefined4 uStack_16;
  undefined1 *puStack_12;
  undefined1 *puStack_10;
  undefined1 **ppuStack_e;
  undefined2 uStack_c;
  int iVar19;
  undefined4 uVar18;
  
  iVar14 = 0;
  DAT_4125_0e40 = 0;
  for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
    if (*(int *)(iVar12 * 2 + 0x137) == 0) {
      ((undefined2 *)&DAT_451b_04e0)[iVar12] = 1;
    }
    else {
      ((undefined2 *)&DAT_451b_04e0)[iVar12] = 0;
    }
    ((undefined2 *)&DAT_451b_04f0)[iVar12] = 0;
  }
  cVar10 = thunk_FUN_824f_03f9();
  cVar7 = uStack_c._1_1_;
  cVar5 = (char)uStack_c;
  if (4 < DAT_4125_0df6) {
    return 0;
  }
  puVar17 = (undefined1 *)0x6000;
  uStack_c._0_1_ = (char)unaff_SS;
  cVar6 = (char)uStack_c;
  uStack_c._1_1_ = (char)((uint)unaff_SS >> 8);
  cVar8 = uStack_c._1_1_;
  uStack_c._0_1_ = cVar5;
  uStack_c._1_1_ = cVar7;
  switch(DAT_4125_0df6) {
  case 1:
    iVar12 = unaff_DI + 1;
    while (iVar14 = iVar12 + -1, iVar12 != 0) {
      pbVar1 = (byte *)(((undefined2 *)&DAT_451b_0281)[iVar14] * 0xe0 +
                        ((undefined2 *)&DAT_451b_0289)[iVar14] * 2 + 1);
      *pbVar1 = *pbVar1 & 0xef;
      uStack_c._0_1_ = (char)_DAT_451b_027d;
      uStack_c._1_1_ = (char)((ulong)_DAT_451b_027d >> 8);
      puStack_10 = (undefined1 *)0x8955;
      ppuStack_e = (undefined1 **)puVar17;
      thunk_FUN_6bb0_0000();
      bVar9 = DAT_451b_029a & 0xf;
      iVar12 = ((undefined2 *)&DAT_451b_0281)[iVar14] * 0xe0 +
               ((undefined2 *)&DAT_451b_0289)[iVar14] * 2;
      pbVar1 = (byte *)(iVar12 + 1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar12 + 1);
      *pbVar1 = *pbVar1 | bVar9;
      uStack_c._0_1_ = (char)DAT_3c04_0110;
      uStack_c._1_1_ = (char)((uint)DAT_3c04_0110 >> 8);
      ppuStack_e = (undefined1 **)0x4037;
      puStack_10 = (undefined1 *)0x89a6;
      thunk_FUN_85d0_1298();
      uStack_c._0_1_ = (char)((undefined2 *)&DAT_451b_0289)[iVar14];
      uStack_c._1_1_ = (char)((uint)((undefined2 *)&DAT_451b_0289)[iVar14] >> 8);
      ppuStack_e = (undefined1 **)0x40f9;
      puVar17 = (undefined1 *)0x40f2;
      puStack_10 = (undefined1 *)0x89c0;
      thunk_FUN_830b_1fed();
      iVar12 = iVar14;
    }
    uStack_c._0_1_ = (char)puVar17;
    uStack_c._1_1_ = (char)((uint)puVar17 >> 8);
    ppuStack_e = (undefined1 **)0x89de;
    FUN_1555_0d9e();
    *(undefined2 *)((int)(int *)_DAT_451b_027d + 0x31) = 0;
    uStack_c._0_1_ = 'U';
    uStack_c._1_1_ = '\x15';
    uVar16 = 0x40e8;
    ppuStack_e = (undefined1 **)0x89f7;
    uVar11 = thunk_FUN_824f_044a();
    iVar12 = DAT_3c04_0181;
    while (iVar14 = iVar12 + -1, iVar12 != 0) {
      iVar12 = iVar14;
      if ((((*(char *)(iVar14 * 0x16 + -0x777b) == DAT_451b_029b) &&
           (*(int *)(iVar14 * 0x16 + -0x7780) == -1)) &&
          ((*(byte *)(iVar14 * 0x16 + -0x7772) & 0xf) == 1)) &&
         (*(byte *)(iVar14 * 0x16 + -0x7771) >> 1 == uVar11)) {
        uStack_c._0_1_ = (char)uVar16;
        uStack_c._1_1_ = (char)((uint)uVar16 >> 8);
        uVar16 = 0x1b62;
        ppuStack_e = (undefined1 **)0x8a77;
        FUN_1b62_03be();
      }
    }
    for (iVar12 = 0; iVar12 < DAT_3c04_157b; iVar12 = iVar12 + 1) {
      if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar12 * 0x41) != 0) &&
          (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar12 * 0x41) == *_DAT_451b_027d)) &&
         (*(int *)(iVar12 * 0x41 + 0x15b2) == ((int *)_DAT_451b_027d)[1])) {
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar12 * 0x41) = 0;
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar12 * 0x41) = 0;
        *(undefined1 *)(iVar12 * 0x41 + 0x15aa) = 0;
        *(undefined2 *)(iVar12 * 0x41 + 0x15b2) = 0;
        *(undefined1 *)(iVar12 * 0x41 + 0x15a9) = 0xff;
      }
    }
    thunk_FUN_824f_03f9();
  case 0:
    thunk_FUN_824f_02bf();
    thunk_FUN_824f_0372();
    return 0x21;
  case 3:
    *(char *)(DAT_4125_0df6 * 2) = *(char *)(DAT_4125_0df6 * 2) + cVar10;
    do {
      uStack_c._0_1_ = (char)puVar17;
      uStack_c._1_1_ = (char)((uint)puVar17 >> 8);
      ppuStack_e = (undefined1 **)0xc798;
      thunk_FUN_7875_06ae();
      uStack_c._0_1_ = 0x8a;
      uStack_c._1_1_ = 0x40;
      puVar17 = (undefined1 *)((int)(undefined2 *)&DAT_451b_0160 + 1);
      ppuStack_e = (undefined1 **)0xc7bc;
      thunk_FUN_7e8f_00bf();
      do {
        iVar14 = iVar14 + 1;
        if (2 < iVar14) {
          FUN_24d0_0002();
          ppuStack_e = (undefined1 **)&stack0xfff6;
          puStack_10 = (undefined1 *)0x24d0;
          puStack_12 = (undefined1 *)0xc7e6;
          uStack_c._0_1_ = cVar6;
          uStack_c._1_1_ = cVar8;
          FUN_216d_002e();
          uVar16 = 0x216d;
          FUN_216d_0288();
          if (DAT_451b_04aa < 0) goto LAB_6bf2_0a71;
          if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\b') {
LAB_6bf2_08fb:
            uStack_c._0_1_ = 0x6d;
            uStack_c._1_1_ = 0x21;
            uVar16 = 0x1000;
            ppuStack_e = (undefined1 **)0xc825;
            FUN_1000_4944();
          }
          else if ((*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) ==
                    '\x02') ||
                  (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x01'
                  )) {
LAB_6bf2_09f7:
            uStack_c = auStack_22;
            ppuStack_e = (undefined1 **)0x216d;
            uVar16 = 0x1000;
            puStack_10 = (undefined1 *)0xc921;
            FUN_1000_4944();
          }
          else {
            if ((*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x05')
               || (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x06'
                  )) goto LAB_6bf2_08fb;
            if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\a')
            goto LAB_6bf2_09f7;
          }
          uStack_c._0_1_ = (char)uVar16;
          uStack_c._1_1_ = (char)((uint)uVar16 >> 8);
          ppuStack_e = (undefined1 **)0xc97b;
          thunk_FUN_7875_06ae();
          uStack_c._0_1_ = 0x8a;
          uStack_c._1_1_ = 0x40;
          uVar16 = 0x40c1;
          ppuStack_e = (undefined1 **)0xc98e;
          thunk_FUN_7e8f_00d6();
LAB_6bf2_0a71:
          uStack_c._0_1_ = (char)uVar16;
          uStack_c._1_1_ = (char)((uint)uVar16 >> 8);
          ppuStack_e = (undefined1 **)0xc9a1;
          FUN_216d_000e();
          FUN_1000_1e79();
          uStack_c._0_1_ = 0xc2;
          uStack_c._1_1_ = 0xc9;
          FUN_1997_0129();
          thunk_FUN_7875_06ae();
          thunk_FUN_7e8f_00bf();
          FUN_216d_000e();
          FUN_1000_1e79();
          FUN_1997_0129();
          thunk_FUN_7875_06ae();
          iVar12 = thunk_FUN_7e8f_00bf();
          return iVar12;
        }
      } while ((int)((undefined2 *)&DAT_451b_04a8)[iVar14] < 0);
    } while( true );
  case 4:
                    /* WARNING: Read-only address (ram,0x0004d189) is written */
    uRam0004d189 = 0xa0;
    do {
      do {
        iVar14 = iVar12 + -1;
        if (iVar12 == 0) {
          return 0;
        }
        iVar12 = iVar14;
      } while (((*(char *)(iVar14 * 0x1d + 0xcff) != '\x01') ||
               ((unaff_DI == 0 &&
                ((*(int *)(iVar14 * 0x1d + 0xd02) != 0 || (*(int *)(iVar14 * 0x1d + 0xd04) != 0)))))
               ) || ((unaff_DI != 0 &&
                     ((((*(int *)(iVar14 * 0x1d + 0xd02) < 0 ||
                        (1 < *(int *)(iVar14 * 0x1d + 0xd02))) ||
                       (*(int *)(iVar14 * 0x1d + 0xd04) < unaff_DI)) ||
                      (unaff_DI + 1 < *(int *)(iVar14 * 0x1d + 0xd04)))))));
      *(undefined1 *)(iVar14 * 0x1d + 0xcff) = 3;
      iVar19 = DAT_3c04_0181;
      do {
        iVar4 = iVar19 + -1;
        if (iVar19 == 0) break;
        iVar19 = iVar4;
      } while ((DAT_451b_1efe._2_2_ != 0x2e1d) || (iVar4 * 0x16 + -0x7780 != (int)DAT_451b_1efe));
      *(int *)(iVar14 * 0x1d + 0xd00) = iVar4;
    } while( true );
  }
  do {
    *(undefined1 *)(unaff_DI * 0x16 + -0x7770) = 0x66;
    iVar12 = unaff_DI;
LAB_6f60_04b1:
    do {
      unaff_DI = iVar12 + -1;
      if (iVar12 == 0) {
        for (uVar18 = 1; puVar13 = (undefined1 *)((ulong)uVar18 >> 0x10),
            (int)puVar13 < DAT_3c04_157b; uVar18 = CONCAT22(puVar13 + 1,(int)uVar18)) {
          if (((((undefined1 *)(int)*(char *)((int)puVar13 * 0x41 + 0x1592) == DAT_3c04_0110) &&
               ('\0' < *(char *)((int)puVar13 * 0x41 + 0x15aa))) &&
              (*(char *)((int)puVar13 * 0x41 + 0x15aa) =
                    *(char *)((int)puVar13 * 0x41 + 0x15aa) - (char)uVar18,
              *(char *)((int)puVar13 * 0x41 + 0x15aa) < '\x01')) &&
             (*(undefined1 *)((int)puVar13 * 0x41 + 0x15aa) = 0,
             0 < *(int *)((int)DAT_3c04_0110 * 0x14 + 0x185))) {
            ppuStack_e = (undefined1 **)&stack0xfff8;
            puStack_10 = (undefined1 *)0x0;
            uStack_16 = CONCAT22(puVar17,0xfb76);
            puStack_12 = puVar13;
            uStack_c._0_1_ = cVar6;
            uStack_c._1_1_ = cVar8;
            iVar12 = FUN_5efd_122f();
            if ((iVar12 != 0) ||
               (*(int *)((int)(undefined2 *)&DAT_4125_15ae + (int)puVar13 * 0x41) != 0)) {
              if (*(int *)((int)(undefined2 *)&DAT_4125_15ae + (int)puVar13 * 0x41) == 0) {
                uStack_c = (undefined1 *)0xffff;
                uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
                *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800)) = 2;
              }
              else {
                uStack_c._0_1_ = (char)puVar17;
                uStack_c._1_1_ = (char)((uint)puVar17 >> 8);
                puVar17 = (undefined1 *)((int)(undefined4 *)&DAT_451b_0186 + 2);
                ppuStack_e = (undefined1 **)0xfbcb;
                uStack_c = (undefined1 *)thunk_FUN_824f_044a();
                uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
                *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800)) = 1;
                if ((int)uStack_c < 0) {
                  uStack_c = DAT_3c04_0110 + 100;
                }
              }
              puStack_12 = (undefined1 *)0xfc1e;
              puStack_10 = puVar17;
              ppuStack_e = (undefined1 **)puVar13;
              uStack_16 = func_0x000603d7();
              uVar16 = (undefined2)((ulong)uStack_16 >> 0x10);
              uVar15 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
              iVar12 = (int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) * 4;
              *(undefined2 *)(iVar12 + 0x192) = uVar16;
              *(int *)(iVar12 + 400) = (int)uStack_16;
              *(undefined1 *)((int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) + 100) =
                   *(undefined1 *)((int)uStack_16 + 4);
              uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
              *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800) + 200) =
                   (char)((ulong)uVar18 >> 0x10);
              *(undefined1 *)((int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) + 300) =
                   (char)uStack_c;
              *(char *)((int)DAT_451b_0504 + 800) = *(char *)((int)DAT_451b_0504 + 800) + '\x01';
            }
          }
        }
        iStack_1a = (int)*(char *)((int)DAT_451b_0504 + 800);
        FUN_6f60_07d3();
        return iStack_1a;
      }
      iVar12 = unaff_DI;
    } while ((undefined1 *)(int)*(char *)(unaff_DI * 0x16 + -0x777b) != DAT_3c04_0110);
  } while (((*(int *)(unaff_DI * 0x16 + -0x7780) == -1) &&
           (*(int *)(unaff_DI * 0x16 + -0x777e) == -1)) &&
          (*(char *)(unaff_DI * 0x16 + -0x7770) == 'e'));
  if (((*(int *)(unaff_DI * 0x16 + -0x7780) == -2) && (*(int *)(unaff_DI * 0x16 + -0x777e) == -1))
     && (*(char *)(unaff_DI * 0x16 + -0x7770) == 'e')) {
    *(undefined1 *)(unaff_DI * 0x16 + -0x7770) = 0x66;
    goto LAB_6f60_04b1;
  }
  if (((*(int *)(unaff_DI * 0x16 + -0x7780) == -1) && (*(int *)(unaff_DI * 0x16 + -0x777e) == -1))
     && (*(char *)(unaff_DI * 0x16 + -0x7770) == 'f')) {
    puVar13 = &stack0xfff6;
    ppuStack_e = (undefined1 **)&stack0xfff8;
    puStack_10 = (undefined1 *)0x0;
    puStack_12 = (undefined1 *)(uint)(*(byte *)(unaff_DI * 0x16 + -0x7771) >> 1);
    uStack_16 = CONCAT22(puVar17,0xf73f);
    uStack_c._0_1_ = cVar6;
    uStack_c._1_1_ = cVar8;
    iVar14 = FUN_5efd_122f();
    if (iVar14 != 0) {
      uStack_c._0_1_ = *(char *)(unaff_DI * 0x16 + -0x777c);
      uStack_c._1_1_ = (char)uStack_c >> 7;
      puStack_10 = (undefined1 *)0xf762;
      ppuStack_e = (undefined1 **)puVar17;
      iVar14 = func_0x0006034f();
      if (iVar14 != 0) {
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800)) = 0;
        iVar14 = (int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) * 4;
        *(undefined2 *)(iVar14 + 0x192) = 0x2e1d;
        *(int *)(iVar14 + 400) = unaff_DI * 0x16 + -0x7780;
        *(undefined1 *)((int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) + 100) =
             *(undefined1 *)(unaff_DI * 0x16 + -0x777c);
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800) + 200) =
             *(undefined1 *)(unaff_DI * 0x16 + -0x7777);
        bVar9 = *(byte *)(unaff_DI * 0x16 + -0x7771) >> 1;
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(byte *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800) + 300) = bVar9;
        *(uint *)(unaff_DI * 0x16 + -0x7780) = (uint)bVar9;
        goto LAB_6f60_046e;
      }
    }
    if ((int)*(char *)(unaff_DI * 0x16 + -0x7777) ==
        (uint)(*(byte *)(unaff_DI * 0x16 + -0x7771) >> 1)) {
      uStack_c._0_1_ = (char)puVar17;
      uStack_c._1_1_ = (char)((uint)puVar17 >> 8);
      puVar17 = (undefined1 *)0x1b62;
      ppuStack_e = (undefined1 **)0xf7ab;
      FUN_1b62_03be();
    }
    else {
      cVar5 = *(char *)(unaff_DI * 0x16 + -0x7777);
      pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7771);
      *pbVar1 = *pbVar1 & 1;
      pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7771);
      *pbVar1 = *pbVar1 | cVar5 << 1;
      *(undefined1 *)(unaff_DI * 0x16 + -0x7770) = 0x65;
    }
  }
  else if (((*(int *)(unaff_DI * 0x16 + -0x7780) == -2) &&
           (*(int *)(unaff_DI * 0x16 + -0x777e) == -1)) &&
          (*(char *)(unaff_DI * 0x16 + -0x7770) == 'f')) {
    ppuStack_e = &puStack_10;
    puStack_10 = DAT_3c04_0110;
    uStack_16 = CONCAT22(0xf90d,(undefined2)uStack_16);
    puStack_12 = puVar17;
    uStack_c._0_1_ = cVar6;
    uStack_c._1_1_ = cVar8;
    thunk_FUN_7533_0b47();
    uStack_c._0_1_ = (char)puStack_12;
    uStack_c._1_1_ = (char)((uint)puStack_12 >> 8);
    ppuStack_e = (undefined1 **)puStack_10;
    puStack_10 = (undefined1 *)0x4073;
    puVar17 = (undefined1 *)0x1b62;
    puStack_12 = (undefined1 *)0xf923;
    FUN_1b62_007d();
    if ((ppuStack_e != (undefined1 **)0x0) && (iStack_18 < 8)) {
      uStack_c._0_1_ = *(char *)(unaff_DI * 0x16 + -0x777c);
      uStack_c._1_1_ = (char)uStack_c >> 7;
      ppuStack_e = (undefined1 **)0x1b62;
      puStack_10 = (undefined1 *)0xf94e;
      iVar14 = func_0x0006034f();
      if (iVar14 != 0) {
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800)) = 0;
        iVar14 = (int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) * 4;
        *(undefined2 *)(iVar14 + 0x192) = 0x2e1d;
        *(int *)(iVar14 + 400) = unaff_DI * 0x16 + -0x7780;
        *(undefined1 *)((int)DAT_451b_0504 + *(char *)((int)DAT_451b_0504 + 800) + 100) =
             *(undefined1 *)(unaff_DI * 0x16 + -0x777c);
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(undefined1 *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800) + 200) =
             *(undefined1 *)(unaff_DI * 0x16 + -0x7777);
        uVar16 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
        *(byte *)((int)DAT_451b_0504 + (int)*(char *)((int)DAT_451b_0504 + 800) + 300) =
             *(byte *)(unaff_DI * 0x16 + -0x7771) >> 1;
        *(uint *)(unaff_DI * 0x16 + -0x7780) = (uint)puStack_10;
        puVar13 = puStack_12;
LAB_6f60_046e:
        *(uint *)(unaff_DI * 0x16 + -0x777e) = (uint)puVar13;
        pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7771);
        *pbVar1 = *pbVar1 & 1;
        pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7772);
        *pbVar1 = *pbVar1 & 0xf0;
        puVar2 = (undefined1 *)(unaff_DI * 0x16 + -0x7772);
        *puVar2 = *puVar2;
        *(undefined1 *)(unaff_DI * 0x16 + -0x7770) = 0xff;
        pcVar3 = (char *)((int)DAT_451b_0504 + 800);
        *pcVar3 = *pcVar3 + '\x01';
        goto LAB_6f60_04b1;
      }
    }
    *(undefined2 *)(unaff_DI * 0x16 + -0x7780) = 0xffff;
    cVar5 = *(char *)(unaff_DI * 0x16 + -0x7777);
    pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7771);
    *pbVar1 = *pbVar1 & 1;
    pbVar1 = (byte *)(unaff_DI * 0x16 + -0x7771);
    *pbVar1 = *pbVar1 | cVar5 << 1;
    *(undefined1 *)(unaff_DI * 0x16 + -0x7770) = 0x65;
  }
  goto LAB_6f60_04b1;
}

