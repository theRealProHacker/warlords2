
/* WARNING: Instruction at (ram,0x000626c1) overlaps instruction at (ram,0x000626c0)
    */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __cdecl16far thunk_FUN_606a_0000(undefined2 param_1,int param_2,int param_3)

{
  byte *pbVar1;
  int *piVar2;
  bool bVar3;
  undefined1 uVar4;
  byte bVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int *piVar10;
  int iVar11;
  int iVar12;
  undefined2 uVar13;
  undefined2 uVar14;
  undefined2 unaff_SS;
  int aiStack_d0 [8];
  int aiStack_c0 [8];
  int aiStack_b0 [16];
  int aiStack_90 [16];
  int aiStack_70 [2];
  char *pcStack_6c;
  undefined2 uStack_6a;
  int iStack_68;
  int iStack_66;
  int *piStack_64;
  undefined2 uStack_5a;
  undefined1 *puStack_58;
  int aiStack_50 [8];
  int aiStack_40 [8];
  int aiStack_30 [8];
  int iStack_20;
  int iStack_1e;
  undefined1 auStack_1c [6];
  uint uStack_16;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  uint uStack_8;
  undefined2 uStack_6;
  uint uStack_4;
  
  uVar14 = 0x606a;
  uStack_6 = 0;
  iVar12 = 4;
  while( true ) {
    iVar9 = iVar12 + -1;
    uVar13 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (iVar12 == 0) break;
    iVar12 = iVar9;
    if (*(int *)((int)DAT_451b_018e + iVar9 * 0x5c + 0x24c) != 0) {
      uStack_6 = 1;
    }
  }
  *(undefined2 *)((int)DAT_451b_018e + 0x46) = 0xffff;
  if (((DAT_3c04_011e != 0) &&
      (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) &&
     ((*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 4 ||
      (*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 5)))) {
    *(undefined2 *)((int)DAT_451b_018e + 0x46) =
         *(undefined2 *)((char *)s_Explored__4125_1105 + 4 + DAT_3c04_0110 * 0xc);
  }
  piStack_64 = (int *)0x606a;
  iStack_66 = 0x75c;
  FUN_606a_065d();
  iVar12 = 6;
LAB_606a_0411:
  do {
    iVar9 = iVar12;
    iVar12 = iVar9 + -1;
    if (iVar9 == 0) {
      return 0;
    }
    iVar11 = aiStack_50[iVar9 + 2];
  } while (((iVar11 == -1) || ((int)*(char *)(iVar11 * 0x16 + -0x777b) != DAT_3c04_0110)) ||
          (*(char *)(iVar11 * 0x16 + -0x777c) != '\x1c'));
  if (-1 < aiStack_40[iVar9]) {
    iStack_66 = 0x7ce;
    piStack_64 = (int *)uVar14;
    thunk_FUN_5c8e_023f();
    uVar14 = 0x3fd6;
  }
  if (((DAT_3c04_011e != 0) &&
      (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) &&
     (*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) == iVar11))
  goto code_r0x0006080e;
  goto LAB_606a_0183;
code_r0x0006080e:
  iStack_68 = 0x819;
  iStack_66 = uVar14;
  piStack_64 = (int *)iVar12;
  iVar9 = FUN_606a_0cf3();
  if (iVar9 == 0) {
LAB_606a_0183:
    if ((*(byte *)(iVar11 * 0x16 + -0x7772) & 0xf) == 3) {
      iStack_66 = 0x858;
      piStack_64 = (int *)uVar14;
      iVar6 = FUN_606a_1637();
      iVar9 = DAT_3c04_0181;
      if (iVar6 == 0) {
        while (iVar6 = iVar9 + -1, iVar9 != 0) {
          iVar9 = iVar6;
          if ((((int)*(char *)(iVar6 * 0x16 + -0x777b) == DAT_3c04_0110) &&
              (*(int *)(iVar6 * 0x16 + -0x7780) == *(int *)(iVar11 * 0x16 + -0x7780))) &&
             ((*(int *)(iVar6 * 0x16 + -0x777e) == *(int *)(iVar11 * 0x16 + -0x777e) &&
              ((*(byte *)(iVar6 * 0x16 + -0x7772) & 0xf) ==
               (*(byte *)(iVar11 * 0x16 + -0x7772) & 0xf))))) {
            pbVar1 = (byte *)(iVar6 * 0x16 + -0x7772);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar6 * 0x16 + -0x7771);
            *pbVar1 = *pbVar1 & 1;
            *(undefined2 *)(iVar6 * 0x16 + -0x776c) = 0xffff;
            *(undefined2 *)(iVar6 * 0x16 + -0x776e) = 0xffff;
          }
        }
      }
      else {
        uStack_16 = (uint)(*(byte *)(iVar11 * 0x16 + -0x7771) >> 1);
        piStack_64 = aiStack_50 + 3;
        iStack_66 = 3;
        pcStack_6c = (char *)0x885;
        uStack_6a = uVar14;
        iStack_68 = iVar12;
        FUN_606a_07ea();
      }
    }
    bVar3 = true;
    iStack_a = 0;
    uStack_4 = 0;
    while (((bVar3 && (iStack_a < 2)) && ('\x03' < *(char *)(iVar11 * 0x16 + -0x7779)))) {
      iStack_a = iStack_a + 1;
      iStack_68 = 0x98a;
      iStack_66 = uVar14;
      piStack_64 = (int *)iVar12;
      FUN_606a_0fda();
      iStack_68 = 0x998;
      iStack_66 = uVar14;
      piStack_64 = (int *)iVar12;
      FUN_606a_11f8();
      iStack_68 = 0x9a6;
      iStack_66 = uVar14;
      piStack_64 = (int *)iVar12;
      FUN_606a_1348();
      iStack_68 = 0x9b4;
      iStack_66 = uVar14;
      piStack_64 = (int *)iVar12;
      uVar7 = FUN_606a_0efc();
      uStack_8 = uVar7;
      if (uVar7 - 1 < 4) {
        iVar9 = (uVar7 - 1) * 2;
        uVar14 = 0x6000;
        switch(uVar7) {
        case 1:
          while( true ) {
            LOCK();
            *(byte *)(iVar9 + 0xe3) = *(byte *)(iVar9 + 0xe3) | (byte)uVar7;
            UNLOCK();
            bVar5 = (byte)DAT_3c04_0110;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 0xe1);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 0xe1);
            *pbVar1 = *pbVar1 | bVar5 & 0xf;
            bVar5 = (byte)DAT_3c04_0110;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 3);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 3);
            *pbVar1 = *pbVar1 | bVar5 & 0xf;
            piStack_64 = (int *)*(undefined2 *)(iVar12 * 0x41 + 0x157f);
            iStack_66 = *(undefined2 *)(iVar12 * 0x41 + 0x157d);
            iStack_68 = 0x2d;
            pcStack_6c = (char *)s__m__Mono_version__for_laptop_use_4125_2765 + 0xd;
            uStack_6a = uVar14;
            FUN_1555_1ab9();
            iStack_66 = DAT_451b_018a + iVar12 * 6;
            piStack_64 = (int *)DAT_451b_018c;
            uStack_6a = 0x1555;
            pcStack_6c = (char *)s__n__No_startup_animation_4125_279d + 2;
            iStack_68 = iVar12;
            iVar9 = FUN_621e_0749();
            if (iVar9 == 0) {
              piStack_64 = (int *)*(undefined2 *)(iVar12 * 0x41 + 0x157f);
              iStack_66 = *(undefined2 *)(iVar12 * 0x41 + 0x157d);
              iStack_68 = 0x3c;
              uStack_6a = 0x1555;
              pcStack_6c = "rds ][ - %s (c) Strategic Studies Group\n\n";
              FUN_1555_1ab9();
              iStack_66 = DAT_451b_018a + iVar12 * 6;
              piStack_64 = (int *)DAT_451b_018c;
              uStack_6a = 0x1555;
              pcStack_6c = "sion 1.02";
              iStack_68 = iVar12;
              FUN_621e_0749();
            }
            uVar14 = 0x1555;
            *(byte *)(iVar12 * 0x41 + 0x1592) = (byte)uStack_8;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 1);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 1);
            *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 0xe3);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 0xe3);
            *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 0xe1);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 0xe1);
            *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 3);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 3);
            *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
            iVar12 = iVar12 + 1;
            if (DAT_3c04_157b <= iVar12) break;
            uStack_8 = (uint)*(char *)(iVar12 * 0x41 + 0x1592);
            iVar9 = (iVar12 * 0x14) / DAT_3c04_157b;
            if (uStack_4 != iVar9) {
              uVar14 = 0x40d7;
              piStack_64 = (int *)((char *)s_CARDS__c_03d__s_4125_261a + 0xe);
              uStack_4 = iVar9;
              thunk_FUN_8027_1463();
            }
            *(undefined1 *)(iVar12 * 0x41 + 0x1592) = (undefined1)DAT_3c04_0110;
            bVar5 = (byte)DAT_3c04_0110;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            pbVar1 = (byte *)(iVar9 + 1);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar9 + 1);
            *pbVar1 = *pbVar1 | bVar5 & 0xf;
            uVar7 = DAT_3c04_0110 & 0xf;
            iVar9 = *(int *)(iVar12 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar12 * 0x41 + 0x157d) * 2;
            *(byte *)(iVar9 + 0xe3) = *(byte *)(iVar9 + 0xe3) & 0xf0;
            *(byte *)(iVar9 + 0xe3) = *(byte *)(iVar9 + 0xe3) | (byte)uVar7;
          }
          piStack_64 = (int *)0x2917;
          thunk_FUN_8027_1463();
          DAT_3c04_0110 = uStack_6;
          return 0x3c04;
        case 2:
          piVar2 = (int *)(iVar9 + iVar11 + 2);
          *piVar2 = *piVar2 + uVar7;
          LOCK();
          *(byte *)(iVar9 + 1) = *(byte *)(iVar9 + 1) | (byte)uVar7;
          UNLOCK();
          piStack_64 = (int *)DAT_3c04_0110;
          iStack_66 = 0x6000;
          iStack_68 = 0x87aa;
          thunk_FUN_85d0_1298();
          piStack_64 = (int *)DAT_451b_0289;
          iStack_66 = 0x40f9;
          uVar14 = 0x40f2;
          iStack_68 = 0x87bc;
          thunk_FUN_830b_1fed();
          if ((DAT_451b_0292._1_1_ & 0x20) != 0) {
            pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
            *pbVar1 = *pbVar1 & 0xdf;
          }
          if (*(char *)((byte)DAT_451b_0292 + 0x710) == '\n') {
            if (DAT_451b_029b == '\x0f') {
              iVar12 = 0;
            }
            else if ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_451b_029b] < 2) {
              iVar12 = *(int *)(DAT_451b_029b * 0x14 + 0x185);
            }
            else {
              iVar12 = *(int *)(DAT_451b_029b * 0x14 + 0x185) /
                       (int)((undefined2 *)&DAT_451b_1e8a)[DAT_451b_029b];
            }
            if (iVar12 / 2 < 0) {
              iVar12 = 0;
            }
            else {
              iVar12 = iVar12 / 2;
            }
            if ((*(int *)((char)DAT_451b_029a * 2 + 0xd0) == 0) && (0 < iVar12)) {
              piStack_64 = (int *)0x93;
              iStack_66 = 0x40f2;
              iStack_68 = 0x888d;
              piStack_64 = (int *)thunk_FUN_7e8f_04f0();
              iStack_66 = 0x4125;
              iStack_68 = 0x4162;
              uStack_6a = 0x40c1;
              pcStack_6c = (char *)0x889b;
              FUN_1000_4944();
              piStack_64 = (int *)0x1000;
              uVar14 = 0x402c;
              iStack_66 = 0x88a7;
              thunk_FUN_6a0f_04c5();
            }
            if (DAT_451b_029b < '\b') {
              piVar2 = (int *)((char)DAT_451b_029a * 0x14 + 0x185);
              *piVar2 = *piVar2 + iVar12;
              piVar2 = (int *)(DAT_451b_029b * 0x14 + 0x185);
              *piVar2 = *piVar2 + iVar12 * -2;
            }
            uVar13 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
            piVar10 = (int *)_DAT_451b_027d;
            if (*(char *)((int)piVar10 + 0x15) != '\x0f') {
              if (*(byte *)((int)piVar10 + 0x2f) == DAT_3c04_0110) {
                uVar4 = 0xf;
              }
              else {
                uVar4 = *(undefined1 *)((int)piVar10 + 0x15);
              }
              *(undefined1 *)((int)piVar10 + 0x2f) = uVar4;
            }
            uVar13 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
            piVar10 = (int *)_DAT_451b_027d;
            *(undefined1 *)(piVar10 + 0x18) = 0;
            *(byte *)((int)piVar10 + 0x15) = DAT_451b_029a;
            *(undefined1 *)((int)piVar10 + 0x2d) = 0;
            iVar12 = 4;
            while (iVar9 = iVar12 + -1, iVar12 != 0) {
              pbVar1 = (byte *)(((undefined2 *)&DAT_451b_0281)[iVar9] * 0xe0 +
                                ((undefined2 *)&DAT_451b_0289)[iVar9] * 2 + 1);
              *pbVar1 = *pbVar1 & 0xef;
              piStack_64 = (int *)_DAT_451b_027d;
              iStack_68 = 0x8955;
              iStack_66 = uVar14;
              thunk_FUN_6bb0_0000();
              bVar5 = DAT_451b_029a & 0xf;
              iVar12 = ((undefined2 *)&DAT_451b_0281)[iVar9] * 0xe0 +
                       ((undefined2 *)&DAT_451b_0289)[iVar9] * 2;
              pbVar1 = (byte *)(iVar12 + 1);
              *pbVar1 = *pbVar1 & 0xf0;
              pbVar1 = (byte *)(iVar12 + 1);
              *pbVar1 = *pbVar1 | bVar5;
              piStack_64 = (int *)DAT_3c04_0110;
              iStack_66 = 0x4037;
              iStack_68 = 0x89a6;
              thunk_FUN_85d0_1298();
              piStack_64 = (int *)((undefined2 *)&DAT_451b_0289)[iVar9];
              iStack_66 = 0x40f9;
              uVar14 = 0x40f2;
              iStack_68 = 0x89c0;
              thunk_FUN_830b_1fed();
              iVar12 = iVar9;
            }
            iStack_66 = 0x89de;
            piStack_64 = (int *)uVar14;
            FUN_1555_0d9e();
            *(undefined2 *)((int)(int *)_DAT_451b_027d + 0x31) = 0;
            piStack_64 = (int *)0x1555;
            iStack_66 = 0x89f7;
            uStack_4 = thunk_FUN_824f_044a();
            iVar12 = DAT_3c04_0181;
            uVar14 = 0x40e8;
            while (iVar9 = iVar12 + -1, iVar12 != 0) {
              iVar12 = iVar9;
              if ((((*(char *)(iVar9 * 0x16 + -0x777b) == DAT_451b_029b) &&
                   (*(int *)(iVar9 * 0x16 + -0x7780) == -1)) &&
                  ((*(byte *)(iVar9 * 0x16 + -0x7772) & 0xf) == 1)) &&
                 (*(byte *)(iVar9 * 0x16 + -0x7771) >> 1 == uStack_4)) {
                iStack_66 = 0x8a77;
                piStack_64 = (int *)uVar14;
                FUN_1b62_03be();
                uVar14 = 0x1b62;
              }
            }
            for (iVar12 = 0; iVar12 < DAT_3c04_157b; iVar12 = iVar12 + 1) {
              if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar12 * 0x41) != 0) &&
                  (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar12 * 0x41) == *_DAT_451b_027d))
                 && (*(int *)(iVar12 * 0x41 + 0x15b2) == ((int *)_DAT_451b_027d)[1])) {
                *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar12 * 0x41) = 0;
                *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar12 * 0x41) = 0;
                *(undefined1 *)(iVar12 * 0x41 + 0x15aa) = 0;
                *(undefined2 *)(iVar12 * 0x41 + 0x15b2) = 0;
                *(undefined1 *)(iVar12 * 0x41 + 0x15a9) = 0xff;
              }
            }
            thunk_FUN_824f_03f9();
            thunk_FUN_824f_02bf();
            thunk_FUN_824f_0372();
            iVar12 = 0x21;
          }
          else {
            iVar12 = 1;
          }
          return iVar12;
        case 3:
          FUN_1000_4944();
          aiStack_50[0] = *(int *)(iVar12 * 0x16 + -0x777e);
          puStack_58 = (undefined1 *)0x1000;
          uStack_5a = 0x156a;
          thunk_FUN_621e_170c();
          aiStack_50[0] = 0;
          puStack_58 = auStack_1c;
          uStack_5a = 0x3ff7;
          thunk_FUN_621e_0ae7();
          aiStack_50[0] = 0;
          puStack_58 = (undefined1 *)0x1592;
          FUN_1a8b_0001();
          return 1;
        case 4:
        }
        goto LAB_5efd_1356;
      }
      if ((uStack_4 != 0) && (DAT_3c04_0124 != 0)) {
        uVar14 = 0x40d7;
        iVar9 = thunk_FUN_8027_225b();
        if (iVar9 < 10) {
          piStack_64 = &uStack_5a;
          iStack_66 = *(undefined2 *)(iVar11 * 0x16 + -0x777e);
          iStack_68 = *(int *)(iVar11 * 0x16 + -0x7780);
          uStack_6a = 0x40d7;
          uVar14 = 0x3ff7;
          pcStack_6c = (char *)0xa4d;
          iVar9 = thunk_FUN_621e_12c9();
          if (iVar9 == 1) {
            piStack_64 = (int *)0x3ff7;
            uVar14 = 0x3fbd;
            iStack_66 = 0xa5d;
            thunk_FUN_57d5_0e4b();
          }
        }
      }
      bVar3 = false;
      if (((int)*(char *)(iVar11 * 0x16 + -0x777b) != DAT_3c04_0110) ||
         (*(char *)(iVar11 * 0x16 + -0x777c) != '\x1c')) {
        bVar3 = false;
      }
    }
  }
  goto LAB_606a_0411;
LAB_5efd_1356:
  iVar9 = iVar12 + -1;
  if (iVar12 == 0) {
    bVar3 = false;
    uVar7 = 8;
    while (uVar8 = uVar7 - 1, uVar7 != 0) {
      uVar7 = uVar8;
      if (((*(int *)(uVar8 * 2 + 0x137) != 0) && (DAT_3c04_0110 != uVar8)) &&
         ((*(byte *)(DAT_3c04_0110 * 8 + uVar8 + 0x153b) & 0xc) == 8)) {
        bVar3 = true;
      }
    }
    if ((DAT_3c04_0116 != 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 0)) {
      iVar12 = 8;
      while (iVar12 != 0) {
        aiStack_d0[iVar12 + -1] = 0;
        iVar12 = iVar12 + -1;
      }
      iVar12 = 8;
      while (iVar9 = iVar12 + -1, iVar12 != 0) {
        iVar12 = iVar9;
        if ((*(int *)(iVar9 * 2 + 0x137) != 0) && (*(int *)(iVar9 * 2 + 0xd0) != 0)) {
          iVar11 = 8;
          while (iVar6 = iVar11 + -1, iVar11 != 0) {
            iVar11 = iVar6;
            if (((*(int *)(iVar6 * 2 + 0x137) != 0) && (*(int *)(iVar6 * 2 + 0xd0) != 1)) &&
               ((*(byte *)(iVar9 * 8 + iVar6 + 0x153b) & 3) == 2)) {
              aiStack_d0[iVar9] = 1;
            }
          }
        }
      }
      iVar12 = 8;
      while (iVar9 = iVar12 + -1, iVar12 != 0) {
        iVar12 = iVar9;
        if (((*(int *)(iVar9 * 2 + 0x137) != 0) && (*(int *)(iVar9 * 2 + 0xd0) != 0)) &&
           ((aiStack_d0[DAT_3c04_0110] != 0 || (aiStack_d0[iVar9] != 0)))) {
          aiStack_c0[iVar9] = 0;
        }
      }
    }
    iVar12 = 8;
    while( true ) {
      iVar9 = iVar12 + -1;
      uVar14 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (iVar12 == 0) break;
      iVar11 = (int)DAT_451b_018e + iVar9 * 2;
      iStack_1e = *(int *)(iVar11 + 0x3dc) + *(int *)(iVar11 + 0x3fc);
      if (DAT_3c04_0128 == 0) {
        iStack_20 = 8;
      }
      else {
        iStack_20 = 4;
      }
      iVar11 = thunk_FUN_557a_0a6e();
      if (iVar11 != 0) {
        aiStack_c0[iVar9] = 0;
      }
      if ((bVar3) && ((*(byte *)(DAT_3c04_0110 * 8 + iVar9 + 0x153b) & 0xc) == 0)) {
        aiStack_c0[iVar9] = 0;
      }
      if ((uStack_8 == 0) && (aiStack_40[iVar12 + -0x11] == 0)) {
        aiStack_c0[iVar9] = 0;
      }
      iVar12 = thunk_FUN_8027_225b();
      if ((iVar12 < iStack_20) && (iStack_1e == 0)) {
        aiStack_c0[iVar9] = 0;
      }
      iVar12 = iVar9;
      if ((1 < iStack_a) && (aiStack_30[iVar9] / 4 < aiStack_b0[iVar9])) {
        aiStack_c0[iVar9] = 0;
      }
    }
    aiStack_c0[DAT_3c04_0110] = 0;
    iVar12 = 0;
    iVar9 = 8;
    while (iVar11 = iVar9 + -1, iVar9 != 0) {
      iVar9 = iVar11;
      if ((aiStack_30[iVar11] != 0) && (iVar12 < aiStack_c0[iVar11])) {
        iVar12 = aiStack_c0[iVar11];
        iStack_c = iVar11;
      }
    }
    if ((*(char *)(iStack_e * 0x41 + 0x1592) != '\x0f') &&
       ((int)*(char *)(iStack_e * 0x41 + 0x1592) != DAT_3c04_0110)) {
      bVar3 = false;
      iVar12 = *(int *)((int)DAT_451b_018e + 0x24a);
      while (iVar9 = iVar12 + -1, iVar12 != 0) {
        iVar12 = iVar9;
        if ((int)*(char *)(iStack_e * 0x41 + 0x1592) == aiStack_b0[iVar9]) {
          bVar3 = true;
        }
      }
      if (!bVar3) {
        iStack_c = (int)*(char *)(iStack_e * 0x41 + 0x1592);
      }
    }
    if ((iStack_c != -1) && (aiStack_40[iStack_c + -0x10] == 0)) {
      iStack_c = -1;
    }
    return iStack_c;
  }
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + aiStack_70[iVar9];
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + aiStack_90[iVar9] * 0xf;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + aiStack_40[iVar9] * 4;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + aiStack_50[iVar9] * 6;
  uVar14 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar12 = (int)DAT_451b_018e;
  iVar11 = iVar12 + iVar9 * 2;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x3bc) * 4;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x3cc);
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x3dc);
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x3ec) * 2;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x3fc) * 2;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + *(int *)(iVar11 + 0x40c) * 2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    piVar10 = aiStack_c0 + iVar9;
    iVar12 = *(int *)(iVar12 + 0x18);
LAB_5efd_12f0:
    *piVar10 = *piVar10 + iVar12;
  }
  else {
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 2) {
      piVar10 = aiStack_c0 + iVar9;
      iVar12 = *(int *)(iVar12 + 0x1e);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 1) {
      piVar10 = aiStack_c0 + iVar9;
      iVar12 = *(int *)(iVar12 + 0x1a);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 0) {
      piVar10 = aiStack_c0 + iVar9;
      iVar12 = *(int *)(iVar12 + 0x1c);
      goto LAB_5efd_12f0;
    }
  }
  uVar7 = iStack_10 - *(int *)(iVar9 * 2 + 0x10e3);
  uVar8 = (int)uVar7 >> 0xf;
  aiStack_c0[iVar9] = aiStack_c0[iVar9] + (int)((uVar7 ^ uVar8) - uVar8) / 8;
  uVar7 = aiStack_30[DAT_3c04_0110] - aiStack_30[iVar9] >> 0xf;
  aiStack_c0[iVar9] =
       aiStack_c0[iVar9] +
       (int)((aiStack_30[DAT_3c04_0110] - aiStack_30[iVar9] ^ uVar7) - uVar7) / 4;
  iVar12 = iVar9;
  goto LAB_5efd_1356;
}

