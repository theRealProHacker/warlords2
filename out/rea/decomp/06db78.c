
/* WARNING: Instruction at (ram,0x0006a662) overlaps instruction at (ram,0x0006a65f)
    */
/* WARNING: Restarted to delay deadcode elimination for space: ram */

int * __cdecl16far FUN_6d27_0908(undefined4 param_1)

{
  char *pcVar1;
  int *piVar2;
  byte *pbVar3;
  code *pcVar4;
  byte bVar5;
  undefined1 *puVar6;
  undefined1 uVar7;
  int *piVar8;
  uint uVar9;
  int *piVar10;
  int in_CX;
  uint uVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int in_BX;
  int unaff_SI;
  int iVar15;
  int iVar16;
  int *piVar17;
  int unaff_DI;
  int iVar18;
  undefined2 uVar19;
  int unaff_SS;
  bool bVar20;
  uint auStack_ba4 [1378];
  char acStack_e0 [16];
  int aiStack_d0 [8];
  int aiStack_c0 [8];
  int aiStack_b0 [16];
  int aiStack_90 [16];
  int aiStack_70 [5];
  int aiStack_66 [11];
  int aiStack_50 [8];
  int aiStack_40 [8];
  int aiStack_30 [8];
  int iStack_20;
  int iStack_1e;
  undefined2 uStack_1c;
  undefined2 uStack_1a;
  undefined4 uStack_18;
  int iStack_14;
  char *pcStack_12;
  undefined1 *puStack_10;
  int iStack_a;
  byte bStack_8;
  undefined1 uStack_7;
  undefined1 uStack_4;
  undefined1 uStack_3;
  
  iVar16 = CONCAT11(uStack_3,uStack_4);
  uVar19 = 0x6d27;
  if ((int)param_1 != 0) {
    DAT_451b_04de = DAT_451b_04de + (int)param_1;
    if (DAT_4125_0dc4 != 1) {
      puStack_10 = (undefined1 *)0x6d27;
      pcStack_12 = (char *)0xdc14;
      FUN_24d0_0002();
      puStack_10 = (undefined1 *)DAT_451b_04d0;
      iStack_14 = (int)DAT_451b_04cc;
      pcStack_12 = (char *)((ulong)DAT_451b_04cc >> 0x10);
      uStack_18 = DAT_451b_04c8;
      uStack_1a = 0x24d0;
      uVar19 = 0x2133;
      uStack_1c = 0xdc29;
      FUN_2133_0095();
    }
    puStack_10 = (undefined1 *)0x0;
    iStack_14 = 0xdc36;
    pcStack_12 = (char *)uVar19;
    FUN_6d27_0096();
    puStack_10 = (undefined1 *)0xdc3d;
    piVar10 = (int *)FUN_6d27_084e();
    return piVar10;
  }
  puStack_10 = &stack0xfffa;
  pcStack_12 = (char *)0x6d27;
  uVar19 = 0x22bf;
  iStack_14 = -0x2471;
  FUN_22bf_0af4();
  if (DAT_4125_0dc4 == 1) {
    pcVar4 = (code *)swi(0x3b);
    (*pcVar4)();
    pcVar4 = (code *)swi(0x3b);
    (*pcVar4)();
    iVar16 = unaff_SI + 2;
    while (iVar16 = iVar16 + 1, iVar16 < 0x1b) {
      iVar15 = 0;
      while ((iVar15 < 0x1d && (*(char *)(DAT_3c04_0110 * 0x1d + iVar15 + 0x60b) != iVar16))) {
        iVar15 = iVar15 + 1;
      }
      puStack_10 = (undefined1 *)((int)(undefined2 *)&DAT_451b_01c4 + 1);
      pcStack_12 = (char *)0x342a;
      iStack_14 = DAT_3c04_0110;
      uStack_18 = CONCAT22(iVar15,uVar19);
      uVar19 = 0x40f9;
      uStack_1a = 0xb630;
      thunk_FUN_85d0_08be();
      if (unaff_DI == 0) {
        FUN_1000_4944();
        uVar19 = 0x40c1;
        thunk_FUN_7e8f_00bf();
      }
    }
    piVar10 = (int *)FUN_22bf_0757();
    return piVar10;
  }
  pcVar4 = (code *)swi(0x3b);
  uVar9 = (*pcVar4)();
  piVar10 = (int *)((uVar9 & 0xff) * (uint)*(byte *)(in_BX + unaff_DI + 0xdc6));
  pcVar4 = (code *)swi(0x3b);
  uVar19 = (*pcVar4)();
  iVar15 = unaff_SI + 2;
  (&stack0x69d7)[unaff_DI] = (&stack0x69d7)[unaff_DI] + -1;
  (&stack0xd1c0)[unaff_DI] = (&stack0xd1c0)[unaff_DI] + (char)in_CX;
  if ((*(byte *)(in_BX + 1) & 0x20) == 0) {
    uVar9 = CONCAT11(uStack_3,uStack_4) - 4;
    if (uVar9 < 8) {
      iVar14 = uVar9 * 2;
      iVar18 = 0x6000;
      switch(CONCAT11(uStack_3,uStack_4)) {
      case 4:
        *(undefined1 *)(iVar14 + 0xe3) = *(undefined1 *)(iVar14 + 0xe3);
        while( true ) {
          bVar5 = (byte)DAT_3c04_0110;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 0xe1);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 0xe1);
          *pbVar3 = *pbVar3 | bVar5 & 0xf;
          bVar5 = (byte)DAT_3c04_0110;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 3);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 3);
          *pbVar3 = *pbVar3 | bVar5 & 0xf;
          pcStack_12 = (char *)s__m__Mono_version__for_laptop_use_4125_2765 + 0xd;
          puStack_10 = (undefined1 *)iVar18;
          FUN_1555_1ab9();
          bStack_8 = (byte)(DAT_451b_018a + unaff_DI * 6 + 600);
          puStack_10 = (undefined1 *)0x1555;
          pcStack_12 = (char *)s__n__No_startup_animation_4125_279d + 2;
          iVar15 = FUN_621e_0749();
          if (iVar15 == 0) {
            puStack_10 = (undefined1 *)0x1555;
            pcStack_12 = "rds ][ - %s (c) Strategic Studies Group\n\n";
            FUN_1555_1ab9();
            bStack_8 = (byte)(DAT_451b_018a + unaff_DI * 6 + 600);
            puStack_10 = (undefined1 *)0x1555;
            pcStack_12 = "sion 1.02";
            FUN_621e_0749();
          }
          iVar18 = 0x1555;
          *(byte *)(unaff_DI * 0x41 + 0x1592) = bStack_8;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 1);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 1);
          *pbVar3 = *pbVar3 | bStack_8 & 0xf;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 0xe3);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 0xe3);
          *pbVar3 = *pbVar3 | bStack_8 & 0xf;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 0xe1);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 0xe1);
          *pbVar3 = *pbVar3 | bStack_8 & 0xf;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 3);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 3);
          *pbVar3 = *pbVar3 | bStack_8 & 0xf;
          unaff_DI = unaff_DI + 1;
          if (DAT_3c04_157b <= unaff_DI) break;
          iVar15 = (unaff_DI * 0x14) / DAT_3c04_157b;
          if (iVar16 != iVar15) {
            iVar18 = 0x40d7;
            thunk_FUN_8027_1463();
            iVar16 = iVar15;
          }
          *(undefined1 *)(unaff_DI * 0x41 + 0x1592) = (undefined1)DAT_3c04_0110;
          bVar5 = (byte)DAT_3c04_0110;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 1);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 1);
          *pbVar3 = *pbVar3 | bVar5 & 0xf;
          bVar5 = (byte)DAT_3c04_0110;
          iVar15 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar3 = (byte *)(iVar15 + 0xe3);
          *pbVar3 = *pbVar3 & 0xf0;
          pbVar3 = (byte *)(iVar15 + 0xe3);
          *pbVar3 = *pbVar3 | bVar5 & 0xf;
        }
        thunk_FUN_8027_1463();
        DAT_3c04_0110 = 100;
        return (int *)0x3c04;
      case 5:
        uVar9 = in_CX - 1U & *(uint *)((int)auStack_ba4 + unaff_DI);
        do {
          if ((int)*(char *)(iVar14 * 0x41 + 0x1592) == aiStack_b0[unaff_DI]) {
            uVar9 = 1;
          }
LAB_5efd_168f:
          bVar20 = unaff_DI != 0;
          iVar14 = unaff_SS;
          unaff_DI = unaff_DI + -1;
        } while (bVar20);
        if (uVar9 == 0) {
          piVar10 = (int *)(int)*(char *)(unaff_SS * 0x41 + 0x1592);
        }
        break;
      case 6:
        do {
          aiStack_90[unaff_DI] = 1;
          iVar16 = unaff_DI;
          do {
            do {
              unaff_DI = iVar16 + -1;
              if (iVar16 == 0) {
                iVar16 = 8;
                goto LAB_5efd_1356;
              }
              iVar16 = unaff_DI;
            } while (aiStack_30[unaff_DI] == 0);
            iVar18 = 0x40e8;
            piVar10 = (int *)((int)(undefined2 *)&DAT_4125_00ec + 1);
            iStack_1e = thunk_FUN_824f_044a();
          } while (*(char *)(iStack_1e * 0x41 + 0x1592) != DAT_3c04_0110);
        } while( true );
      case 7:
        puStack_10 = (undefined1 *)((ulong)param_1 >> 0x10);
        puVar6 = puStack_10;
        iStack_14 = 0x6000;
        uStack_18 = CONCAT22(0x1f8a,(undefined2)uStack_18);
        pcStack_12 = (char *)(int)param_1;
        FUN_606a_1a3d();
        iStack_14 = 0x6000;
        uStack_18 = CONCAT22(0x1fa3,(undefined2)uStack_18);
        pcStack_12 = (char *)(int)param_1;
        puStack_10 = puVar6;
        piVar10 = (int *)FUN_606a_1a3d();
        bVar20 = false;
        do {
          if (bVar20) {
            return piVar10;
          }
          bVar20 = true;
          for (iVar16 = 0; iVar16 < 8; iVar16 = iVar16 + 1) {
            piVar10 = (int *)(iVar16 * 2);
            if (*piVar10 != -1) {
              if (*(char *)((int)&uStack_18 + iVar16 + 2) == '\0') {
                piVar10 = (int *)0x0;
              }
              else {
                piVar10 = (int *)(int)*(char *)((int)&uStack_18 + iVar16 + 2);
                aiStack_30[0] = -1;
                piVar8 = piVar10;
                for (iVar15 = 0; iVar15 < 8; iVar15 = iVar15 + 1) {
                  if (((iVar16 != iVar15) && (piVar10 = (int *)(iVar15 * 2), *piVar10 != -1)) &&
                     (piVar10 = (int *)(int)*(char *)((int)&uStack_18 + iVar15 + 2),
                     (int)piVar10 < (int)piVar8)) {
                    piVar10 = (int *)(int)*(char *)((int)&uStack_18 + iVar15 + 2);
                    aiStack_30[0] = iVar15;
                    piVar8 = piVar10;
                  }
                }
                if (aiStack_30[0] != -1) {
                  for (iVar15 = 0; iVar15 < 0x16; iVar15 = iVar15 + 1) {
                    piVar8 = (int *)(int)acStack_e0[iVar16 * 0x16 + iVar15];
                    piVar10 = piVar8;
                    if ((piVar8 != (int *)0xff) &&
                       (((piVar10 = (int *)0x3c04, *(char *)((int)piVar8 * 0x1d + 0xcfd) == '\x01'
                         || (*(char *)((int)piVar8 * 0x1d + 0xcfd) == '\x02')) ||
                        (*(char *)((int)piVar8 * 0x1d + 0xcfd) == '\b')))) {
                      acStack_e0[iVar16 * 0x16 + iVar15] = -1;
                      bVar20 = false;
                      piVar2 = (int *)((int)DAT_451b_018e + 0x4c);
                      *piVar2 = *piVar2 + 1;
                      *(undefined2 *)((int)piVar8 * 0x1d + 0xd00) =
                           *(undefined2 *)(aiStack_30[0] * 2);
                      pcVar1 = (char *)((int)&uStack_18 + iVar16 + 2);
                      *pcVar1 = *pcVar1 + -1;
                      piVar10 = (int *)((int)&uStack_18 + 2);
                      *(char *)(aiStack_30[0] + (int)piVar10) =
                           *(char *)(aiStack_30[0] + (int)piVar10) + '\x01';
                      break;
                    }
                  }
                }
              }
            }
          }
        } while( true );
      case 8:
        if (0x9b < CONCAT11(uStack_7,bStack_8) + CONCAT11(uStack_3,uStack_4)) {
          iVar16 = 0x9b - CONCAT11(uStack_7,bStack_8);
        }
        pcStack_12 = (char *)(iStack_a * 2 + 0x50);
        puStack_10 = (undefined1 *)(CONCAT11(uStack_7,bStack_8) * 2 + 0x3c);
        iVar18 = 0x6000;
        bStack_8 = 0xcf;
        uStack_7 = 0x5e;
        FUN_22bf_07a5();
        for (iVar15 = iStack_a; iVar15 < iStack_a + iVar18; iVar15 = iVar15 + 1) {
          iVar14 = CONCAT11(uStack_7,bStack_8);
          while (iVar12 = iVar14, iVar12 < CONCAT11(uStack_7,bStack_8) + iVar16) {
            bStack_8 = (byte)iVar15;
            uStack_7 = (undefined1)((uint)iVar15 >> 8);
            iStack_a = DAT_3c04_0110;
            thunk_FUN_85d0_1298();
            iVar18 = iVar12;
            iVar14 = iVar12 + 1;
          }
        }
        FUN_22bf_0757();
        piVar10 = (int *)0x3c04;
        if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
          thunk_FUN_830b_2200();
          FUN_22bf_07a5();
          FUN_24d0_0002();
          FUN_216d_01fd();
          thunk_FUN_7e8f_0000();
          puStack_10 = (undefined1 *)0x5f64;
          thunk_FUN_830b_0000();
          puStack_10 = (undefined1 *)0x5f78;
          thunk_FUN_54e4_070b();
          FUN_18a9_03b3();
          FUN_18a9_03b3();
          FUN_18a9_03b3();
          FUN_18a9_0839();
          FUN_18a9_066e();
          piVar10 = (int *)FUN_22bf_0757();
        }
        return piVar10;
      case 9:
        do {
          aiStack_66[iVar14] = 1;
          iVar14 = iVar16 + 1;
          iVar16 = iVar14;
        } while (iVar14 < 0x28);
        bStack_8 = 5;
        uStack_7 = 0;
        iVar16 = thunk_FUN_7e8f_02bf();
        iVar16 = (int)DAT_3c04_080f / 3 + iVar16 + 8;
        if (0x16 < iVar16) {
          iVar16 = 0x16;
        }
        for (iVar15 = 8; uStack_4 = (undefined1)iVar15, iVar15 < iVar16; iVar15 = iVar15 + 1) {
          if ((iVar15 < CONCAT11(uStack_7,bStack_8) + 8) || (8 < iVar15)) {
            iVar18 = 0;
            while (iVar18 == 0) {
              unaff_DI = thunk_FUN_7e8f_02bf();
              FUN_1000_1e79();
              iVar18 = 0x1000;
              bStack_8 = 0xa4;
              uStack_7 = 0x6c;
              iVar14 = FUN_66b0_08f4();
              if ((iVar14 == 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) != 0)) {
                FUN_1000_1e79();
                iVar14 = FUN_66b0_08f4();
                if (((iVar14 != 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) == 0)) &&
                   (aiStack_66[unaff_DI] == 0)) {
                  iVar18 = 1;
                  aiStack_66[unaff_DI] = 1;
                }
              }
            }
            *(undefined1 *)(iVar15 * 0x1d + 0xcff) = 2;
            *(int *)(iVar15 * 0x1d + 0xd00) = unaff_DI;
            *(undefined1 *)(unaff_DI * 0x1f + 0x829) = 2;
            *(undefined1 *)(unaff_DI * 0x1f + 0x82a) = uStack_4;
          }
          else {
            *(undefined1 *)(iVar15 * 0x1d + 0xcff) = 0;
          }
        }
        for (; iVar16 < 0x16; iVar16 = iVar16 + 1) {
          *(undefined1 *)(iVar16 * 0x1d + 0xcff) = 0;
        }
        iVar16 = 0;
        do {
          if ((int)DAT_3c04_080f <= iVar16) {
            iVar16 = 0;
            do {
              if ((int)DAT_3c04_080f <= iVar16) {
                return DAT_3c04_080f;
              }
              if (*(char *)(iVar16 * 0x1f + 0x829) == '\x01') {
                *(undefined1 *)(iVar16 * 0x1f + 0x82b) = 0;
              }
              else {
                if (*(char *)(iVar16 * 0x1f + 0x829) == '\x05') {
                  if (*(int *)(iVar16 * 0x1f + 0x82c) == 0) {
                    bVar20 = true;
                    for (iVar15 = 0; iVar15 < 8; iVar15 = iVar15 + 1) {
                      if (*(int *)(iVar15 * 2 + 0x137) != 0) {
                        puStack_10 = (undefined1 *)((int)(undefined2 *)&DAT_451b_3015 + 1);
                        iVar18 = FUN_1a8b_0acc();
                        if (iVar18 < 0xf) {
                          bVar20 = false;
                          break;
                        }
                      }
                    }
                    if (bVar20) {
                      iVar15 = thunk_FUN_7e8f_02bf();
                      uVar7 = *(undefined1 *)(iVar15 + 0xc9e);
                    }
                    else {
                      iVar15 = thunk_FUN_7e8f_02bf();
                      uVar7 = *(undefined1 *)(iVar15 + 0xca2);
                    }
                  }
                  else {
                    iVar15 = thunk_FUN_7e8f_02bf();
                    uVar7 = *(undefined1 *)(iVar15 + 0xc9a);
                  }
                }
                else {
                  uVar7 = thunk_FUN_7e8f_02bf();
                }
                *(undefined1 *)(iVar16 * 0x1f + 0x82b) = uVar7;
              }
              iVar16 = iVar16 + 1;
            } while( true );
          }
          if (aiStack_66[iVar16] == 0) {
            if (*(int *)(iVar16 * 0x1f + 0x82c) == 0) {
              bVar20 = true;
              for (iVar15 = 0; iVar15 < 8; iVar15 = iVar15 + 1) {
                if (*(int *)(iVar15 * 2 + 0x137) != 0) {
                  puStack_10 = (undefined1 *)0x6e25;
                  iVar18 = FUN_1a8b_0acc();
                  if (iVar18 < 0xf) {
                    bVar20 = false;
                    break;
                  }
                }
              }
              if (bVar20) {
                iVar15 = thunk_FUN_7e8f_02bf();
                uVar7 = *(undefined1 *)(iVar15 + 0xca7);
              }
              else {
                iVar15 = thunk_FUN_7e8f_02bf();
                uVar7 = *(undefined1 *)(iVar15 + 0xcac);
              }
            }
            else {
              iVar15 = thunk_FUN_7e8f_02bf();
              uVar7 = *(undefined1 *)(iVar15 + 0xca4);
            }
            *(undefined1 *)(iVar16 * 0x1f + 0x829) = uVar7;
            *(undefined1 *)(iVar16 * 0x1f + 0x82a) = 0;
            aiStack_66[iVar16] = 1;
          }
          iVar16 = iVar16 + 1;
        } while( true );
      case 10:
        piVar10 = (int *)thunk_FUN_71d6_0000();
        return piVar10;
      case 0xb:
        iVar16 = 1;
        goto code_r0x000604b9;
      }
      goto LAB_5efd_16ae;
    }
    piVar10 = (int *)((int)(undefined2 *)&DAT_4125_0000 + 1);
  }
  else {
    piVar10 = (int *)0x0;
  }
  return piVar10;
LAB_5efd_1356:
  iVar15 = iVar16 + -1;
  if (iVar16 == 0) goto LAB_5efd_1360;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + aiStack_70[iVar15];
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + aiStack_90[iVar15] * 0xf;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + aiStack_40[iVar15] * 4;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + aiStack_50[iVar15] * 6;
  uVar19 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar16 = (int)DAT_451b_018e;
  iVar14 = iVar16 + iVar15 * 2;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x3bc) * 4;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x3cc);
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x3dc);
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x3ec) * 2;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x3fc) * 2;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + *(int *)(iVar14 + 0x40c) * 2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    piVar8 = aiStack_c0 + iVar15;
    iVar16 = *(int *)(iVar16 + 0x18);
LAB_5efd_12f0:
    *piVar8 = *piVar8 + iVar16;
  }
  else {
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 2) {
      piVar8 = aiStack_c0 + iVar15;
      iVar16 = *(int *)(iVar16 + 0x1e);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 1) {
      piVar8 = aiStack_c0 + iVar15;
      iVar16 = *(int *)(iVar16 + 0x1a);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 0) {
      piVar8 = aiStack_c0 + iVar15;
      iVar16 = *(int *)(iVar16 + 0x1c);
      goto LAB_5efd_12f0;
    }
  }
  uVar9 = (int)puStack_10 - *(int *)(iVar15 * 2 + 0x10e3);
  uVar11 = (int)uVar9 >> 0xf;
  aiStack_c0[iVar15] = aiStack_c0[iVar15] + (int)((uVar9 ^ uVar11) - uVar11) / 8;
  uVar9 = aiStack_30[DAT_3c04_0110] - aiStack_30[iVar15] >> 0xf;
  aiStack_c0[iVar15] =
       aiStack_c0[iVar15] +
       (int)((aiStack_30[DAT_3c04_0110] - aiStack_30[iVar15] ^ uVar9) - uVar9) / 4;
  iVar16 = iVar15;
  goto LAB_5efd_1356;
LAB_5efd_1360:
  iVar15 = 0;
  iVar16 = 8;
  while (iVar14 = iVar16 + -1, iVar16 != 0) {
    iVar16 = iVar14;
    if (((*(int *)(iVar14 * 2 + 0x137) != 0) && (DAT_3c04_0110 != iVar14)) &&
       ((*(byte *)(DAT_3c04_0110 * 8 + iVar14 + 0x153b) & 0xc) == 8)) {
      iVar15 = 1;
    }
  }
  if ((DAT_3c04_0116 != 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 0)) {
    iVar16 = 8;
    while (iVar16 != 0) {
      aiStack_d0[iVar16 + -1] = 0;
      iVar16 = iVar16 + -1;
    }
    iVar16 = 8;
    while (iVar14 = iVar16 + -1, iVar16 != 0) {
      iVar16 = iVar14;
      if ((*(int *)(iVar14 * 2 + 0x137) != 0) && (*(int *)(iVar14 * 2 + 0xd0) != 0)) {
        iVar12 = 8;
        while (iVar13 = iVar12 + -1, iVar12 != 0) {
          iVar12 = iVar13;
          if (((*(int *)(iVar13 * 2 + 0x137) != 0) && (*(int *)(iVar13 * 2 + 0xd0) != 1)) &&
             ((*(byte *)(iVar14 * 8 + iVar13 + 0x153b) & 3) == 2)) {
            aiStack_d0[iVar14] = 1;
          }
        }
      }
    }
    iVar16 = 8;
    while (iVar14 = iVar16 + -1, iVar16 != 0) {
      iVar16 = iVar14;
      if (((*(int *)(iVar14 * 2 + 0x137) != 0) && (*(int *)(iVar14 * 2 + 0xd0) != 0)) &&
         ((aiStack_d0[DAT_3c04_0110] != 0 || (aiStack_d0[iVar14] != 0)))) {
        aiStack_c0[iVar14] = 0;
      }
    }
  }
  unaff_DI = 8;
  while( true ) {
    iVar14 = (int)DAT_451b_018e;
    uVar19 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (unaff_DI == 0) break;
    iVar16 = (unaff_DI + -1) * 2;
    unaff_DI = unaff_DI + -1;
code_r0x000604b9:
    iStack_1e = *(int *)(iVar14 + iVar16 + 0x3dc) + *(int *)(iVar14 + iVar16 + 0x3fc);
    if (DAT_3c04_0128 == 0) {
      iStack_20 = 8;
    }
    else {
      iStack_20 = 4;
    }
    iVar16 = thunk_FUN_557a_0a6e();
    if (iVar16 != 0) {
      aiStack_c0[unaff_DI] = 0;
    }
    if ((iVar15 != 0) && ((*(byte *)(DAT_3c04_0110 * 8 + unaff_DI + 0x153b) & 0xc) == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    if ((iVar18 == 0) && (aiStack_66[unaff_DI + 3] == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    iVar18 = 0x40d7;
    iVar16 = thunk_FUN_8027_225b();
    if ((iVar16 < iStack_20) && (iStack_1e == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    if (aiStack_30[unaff_DI] / 4 < aiStack_b0[unaff_DI]) {
      aiStack_c0[unaff_DI] = 0;
    }
  }
  aiStack_c0[DAT_3c04_0110] = 0;
  iVar16 = 0;
  piVar8 = (int *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
  while (piVar17 = (int *)((int)piVar8 + -1), piVar8 != (int *)0x0) {
    piVar8 = piVar17;
    if ((aiStack_30[(int)piVar17] != 0) && (iVar16 < aiStack_c0[(int)piVar17])) {
      iVar16 = aiStack_c0[(int)piVar17];
      piVar10 = piVar17;
    }
  }
  if ((*(char *)(unaff_SS * 0x41 + 0x1592) != '\x0f') &&
     (*(char *)(unaff_SS * 0x41 + 0x1592) != DAT_3c04_0110)) {
    uVar9 = 0;
    unaff_DI = *(int *)(iVar14 + 0x24a);
    goto LAB_5efd_168f;
  }
LAB_5efd_16ae:
  if ((piVar10 != (int *)0xffff) && (aiStack_66[(int)((int)piVar10 + 3)] == 0)) {
    piVar10 = (int *)0xffff;
  }
  return piVar10;
}

