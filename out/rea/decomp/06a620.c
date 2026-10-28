
/* WARNING: Instruction at (ram,0x0006063b) overlaps instruction at (ram,0x0006063a)
    */

char * __cdecl16far FUN_6a62_0000(undefined4 param_1)

{
  int *piVar1;
  byte *pbVar2;
  char cVar3;
  undefined1 uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  char *pcVar8;
  int iVar9;
  undefined2 uVar10;
  char *pcVar11;
  int iVar12;
  int *piVar13;
  undefined1 *puVar14;
  int unaff_SI;
  uint uVar15;
  int unaff_DI;
  int iVar16;
  undefined2 unaff_SS;
  bool bVar17;
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
  int iStack_30;
  undefined1 auStack_2e [8];
  undefined1 auStack_26 [6];
  int iStack_20;
  int iStack_1e;
  char acStack_16 [4];
  undefined4 uStack_12;
  undefined1 *puStack_e;
  char *pcStack_c;
  int iStack_a;
  byte bVar18;
  int in_stack_0000fff8;
  int local_4;
  
  local_4 = (int)*(char *)(*(byte *)(param_1._2_2_ * 0xe0 + (int)param_1 * 2) + 0x710);
  uVar10 = 0x2e1d;
  if ((*(byte *)(param_1._2_2_ * 0xe0 + (int)param_1 * 2 + 1) & 0x20) == 0) {
    if (local_4 - 4U < 8) {
      puVar14 = (undefined1 *)((local_4 - 4U) * 2);
      iVar7 = 0x6000;
      switch(local_4) {
      case 4:
        *(undefined1 *)((int)puVar14 + 0xe3) = *(undefined1 *)((int)puVar14 + 0xe3);
        while( true ) {
          bVar18 = (byte)DAT_3c04_0110;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 0xe1);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 0xe1);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          bVar18 = (byte)DAT_3c04_0110;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 3);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 3);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          puStack_e = (undefined1 *)0x2d;
          uStack_12 = (char *)CONCAT22(iVar7,(char *)s__m__Mono_version__for_laptop_use_4125_2765 +
                                             0xd);
          FUN_1555_1ab9();
          cVar3 = (char)DAT_451b_018a + (char)unaff_DI * '\x06';
          uStack_12 = (char *)0x1555279f;
          puStack_e = (undefined1 *)unaff_DI;
          iVar7 = FUN_621e_0749();
          if (iVar7 == 0) {
            puStack_e = (undefined1 *)0x3c;
            uStack_12 = (char *)0x155527ce;
            FUN_1555_1ab9();
            cVar3 = (char)DAT_451b_018a + (char)unaff_DI * '\x06';
            uStack_12 = (char *)0x155527fb;
            puStack_e = (undefined1 *)unaff_DI;
            FUN_621e_0749();
          }
          bVar18 = cVar3 + 0x58;
          iVar7 = 0x1555;
          *(byte *)(unaff_DI * 0x41 + 0x1592) = bVar18;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 1);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 1);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 0xe3);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 0xe3);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 0xe1);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 0xe1);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 3);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 3);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          unaff_DI = unaff_DI + 1;
          if (DAT_3c04_157b <= unaff_DI) break;
          iVar16 = (unaff_DI * 0x14) / DAT_3c04_157b;
          if (local_4 != iVar16) {
            iVar7 = 0x40d7;
            thunk_FUN_8027_1463();
            local_4 = iVar16;
          }
          *(undefined1 *)(unaff_DI * 0x41 + 0x1592) = (undefined1)DAT_3c04_0110;
          bVar18 = (byte)DAT_3c04_0110;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 1);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 1);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
          bVar18 = (byte)DAT_3c04_0110;
          iVar16 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                   *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
          pbVar2 = (byte *)(iVar16 + 0xe3);
          *pbVar2 = *pbVar2 & 0xf0;
          pbVar2 = (byte *)(iVar16 + 0xe3);
          *pbVar2 = *pbVar2 | bVar18 & 0xf;
        }
        thunk_FUN_8027_1463();
        DAT_3c04_0110 = 100;
        return (char *)0x3c04;
      case 5:
        param_1._2_2_ = param_1._2_2_ & *(uint *)((int)auStack_ba4 + unaff_DI);
        do {
          if ((int)*(char *)((int)puVar14 * 0x41 + 0x1592) == aiStack_b0[unaff_DI]) {
            param_1._2_2_ = 1;
          }
LAB_5efd_168f:
          bVar17 = unaff_DI != 0;
          puVar14 = puStack_e;
          unaff_DI = unaff_DI + -1;
        } while (bVar17);
        if (param_1._2_2_ == 0) {
          pcVar11 = (char *)(int)*(char *)((int)puStack_e * 0x41 + 0x1592);
        }
        break;
      case 6:
        do {
          aiStack_90[unaff_DI] = 1;
          iVar6 = unaff_DI;
          iVar16 = iVar7;
          do {
            do {
              unaff_DI = iVar6 + -1;
              if (iVar6 == 0) {
                iVar7 = 8;
                goto LAB_5efd_1356;
              }
              iVar6 = unaff_DI;
            } while (*(int *)(auStack_2e + unaff_DI * 2 + -2) == 0);
            iVar7 = 0x40e8;
            pcStack_c = (char *)CONCAT22(iVar16,(char *)((int)(undefined2 *)&DAT_4125_00ec + 1));
            iStack_1e = thunk_FUN_824f_044a();
            iVar16 = iVar7;
          } while (*(char *)(iStack_1e * 0x41 + 0x1592) != DAT_3c04_0110);
        } while( true );
      case 7:
        puStack_e = auStack_26;
        uStack_12 = (char *)param_1;
        acStack_16[2] = '\0';
        acStack_16[3] = '`';
        acStack_16[0] = -0x76;
        acStack_16[1] = '\x1f';
        FUN_606a_1a3d();
        puStack_e = auStack_2e;
        uStack_12 = (char *)param_1;
        acStack_16[2] = '\0';
        acStack_16[3] = '`';
        acStack_16[0] = -0x5d;
        acStack_16[1] = '\x1f';
        pcVar11 = (char *)FUN_606a_1a3d();
        bVar17 = false;
        do {
          if (bVar17) {
            return pcVar11;
          }
          bVar17 = true;
          for (iVar7 = 0; iVar7 < 8; iVar7 = iVar7 + 1) {
            pcVar11 = (char *)(iVar7 * 2);
            if (*(int *)(pcVar11 + (int)param_1) != -1) {
              if (acStack_16[iVar7] == '\0') {
                pcVar11 = (char *)0x0;
              }
              else {
                pcVar11 = (char *)(int)acStack_16[iVar7];
                iStack_30 = -1;
                pcVar8 = pcVar11;
                for (iVar16 = 0; iVar16 < 8; iVar16 = iVar16 + 1) {
                  if (((iVar7 != iVar16) &&
                      (pcVar11 = (char *)(iVar16 * 2), *(int *)(pcVar11 + (int)param_1) != -1)) &&
                     (pcVar11 = (char *)(int)acStack_16[iVar16], (int)pcVar11 < (int)pcVar8)) {
                    pcVar11 = (char *)(int)acStack_16[iVar16];
                    iStack_30 = iVar16;
                    pcVar8 = pcVar11;
                  }
                }
                if (iStack_30 != -1) {
                  for (iVar16 = 0; iVar16 < 0x16; iVar16 = iVar16 + 1) {
                    pcVar8 = (char *)(int)acStack_e0[iVar7 * 0x16 + iVar16];
                    pcVar11 = pcVar8;
                    if ((pcVar8 != (char *)0xff) &&
                       (((pcVar11 = (char *)0x3c04, *(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\x01'
                         || (*(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\x02')) ||
                        (*(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\b')))) {
                      acStack_e0[iVar7 * 0x16 + iVar16] = -1;
                      bVar17 = false;
                      piVar1 = (int *)((int)DAT_451b_018e + 0x4c);
                      *piVar1 = *piVar1 + 1;
                      *(undefined2 *)((int)pcVar8 * 0x1d + 0xd00) =
                           *(undefined2 *)((int)param_1 + iStack_30 * 2);
                      acStack_16[iVar7] = acStack_16[iVar7] + -1;
                      pcVar11 = acStack_16;
                      pcVar11[iStack_30] = pcVar11[iStack_30] + '\x01';
                      break;
                    }
                  }
                }
              }
            }
          }
        } while( true );
      case 8:
        if (0x9b < in_stack_0000fff8 + local_4) {
          local_4 = 0x9b - in_stack_0000fff8;
        }
        uStack_12 = (char *)CONCAT22(in_stack_0000fff8 * 2 + 0x3c,iStack_a * 2 + 0x50);
        puStack_e = (undefined1 *)0xfffe;
        iVar16 = 0x5ecf;
        iVar6 = 0x6000;
        FUN_22bf_07a5();
        for (iVar7 = iStack_a; iVar9 = iVar16, iVar7 < iStack_a + iVar6; iVar7 = iVar7 + 1) {
          while (iVar12 = iVar9, iVar12 < iVar16 + local_4) {
            iStack_a = DAT_3c04_0110;
            puStack_e = (undefined1 *)0x5eea;
            thunk_FUN_85d0_1298();
            iVar16 = iVar7;
            iVar6 = iVar12;
            iVar9 = iVar12 + 1;
          }
        }
        FUN_22bf_0757();
        pcVar11 = (char *)0x3c04;
        if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
          thunk_FUN_830b_2200();
          FUN_22bf_07a5();
          FUN_24d0_0002();
          FUN_216d_01fd();
          thunk_FUN_7e8f_0000();
          puStack_e = (undefined1 *)0x40c1;
          uStack_12 = (char *)CONCAT22(0x5f64,(undefined2)uStack_12);
          thunk_FUN_830b_0000();
          puStack_e = (undefined1 *)0x40f2;
          uStack_12 = (char *)CONCAT22(0x5f78,(undefined2)uStack_12);
          thunk_FUN_54e4_070b();
          FUN_18a9_03b3();
          FUN_18a9_03b3();
          FUN_18a9_03b3();
          FUN_18a9_0839();
          FUN_18a9_066e();
          pcVar11 = (char *)FUN_22bf_0757();
        }
        return pcVar11;
      case 9:
        do {
          aiStack_66[(int)puVar14] = 1;
          puVar14 = (undefined1 *)(local_4 + 1);
          local_4 = (int)puVar14;
        } while ((int)puVar14 < 0x28);
        uVar10 = 0x40c1;
        puStack_e = (undefined1 *)0x6c16;
        iVar7 = thunk_FUN_7e8f_02bf();
        iVar16 = 5;
        iVar7 = (int)DAT_3c04_080f / 3 + iVar7 + 8;
        if (0x16 < iVar7) {
          iVar7 = 0x16;
        }
        for (local_4 = 8; local_4 < iVar7; local_4 = local_4 + 1) {
          if ((local_4 < iVar16 + 8) || (8 < local_4)) {
            iVar6 = 0;
            while (iVar6 == 0) {
              puStack_e = (undefined1 *)0x6c86;
              unaff_DI = thunk_FUN_7e8f_02bf();
              uVar10 = 0x1000;
              FUN_1000_1e79();
              iVar16 = 0x6ca4;
              iVar9 = FUN_66b0_08f4();
              iVar6 = 0x1000;
              if ((iVar9 == 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) != 0)) {
                uVar10 = 0x1000;
                FUN_1000_1e79();
                iVar9 = FUN_66b0_08f4();
                if (((iVar9 != 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) == 0)) &&
                   (iVar6 = 0x1000, aiStack_66[unaff_DI] == 0)) {
                  iVar16 = 0x6ca4;
                  iVar6 = 1;
                  aiStack_66[unaff_DI] = 1;
                }
              }
            }
            *(undefined1 *)(local_4 * 0x1d + 0xcff) = 2;
            *(int *)(local_4 * 0x1d + 0xd00) = unaff_DI;
            *(undefined1 *)(unaff_DI * 0x1f + 0x829) = 2;
            *(undefined1 *)(unaff_DI * 0x1f + 0x82a) = (undefined1)local_4;
          }
          else {
            *(undefined1 *)(local_4 * 0x1d + 0xcff) = 0;
          }
        }
        while (local_4 = iVar7, local_4 < 0x16) {
          *(undefined1 *)(local_4 * 0x1d + 0xcff) = 0;
          iVar7 = local_4 + 1;
        }
        local_4 = 0;
        do {
          if ((int)DAT_3c04_080f <= local_4) {
            local_4 = 0;
            do {
              if ((int)DAT_3c04_080f <= local_4) {
                return DAT_3c04_080f;
              }
              if (*(char *)(local_4 * 0x1f + 0x829) == '\x01') {
                *(undefined1 *)(local_4 * 0x1f + 0x82b) = 0;
              }
              else {
                if (*(char *)(local_4 * 0x1f + 0x829) == '\x05') {
                  if (*(int *)(local_4 * 0x1f + 0x82c) == 0) {
                    bVar17 = true;
                    puStack_e = (undefined1 *)uVar10;
                    for (iVar7 = 0; iVar7 < 8; iVar7 = iVar7 + 1) {
                      uVar10 = puStack_e;
                      if (*(int *)(iVar7 * 2 + 0x137) != 0) {
                        uVar10 = 0x1a8b;
                        uStack_12 = (char *)CONCAT22(0x6f76,(undefined2)uStack_12);
                        iVar16 = FUN_1a8b_0acc();
                        if (iVar16 < 0xf) {
                          bVar17 = false;
                          break;
                        }
                      }
                      puStack_e = (undefined1 *)uVar10;
                    }
                    if (bVar17) {
                      puStack_e = (undefined1 *)0x6f98;
                      iVar7 = thunk_FUN_7e8f_02bf();
                      uVar4 = *(undefined1 *)(iVar7 + 0xc9e);
                    }
                    else {
                      puStack_e = (undefined1 *)0x6faf;
                      iVar7 = thunk_FUN_7e8f_02bf();
                      uVar4 = *(undefined1 *)(iVar7 + 0xca2);
                    }
                  }
                  else {
                    puStack_e = (undefined1 *)0x6f0f;
                    iVar7 = thunk_FUN_7e8f_02bf();
                    uVar4 = *(undefined1 *)(iVar7 + 0xc9a);
                  }
                }
                else {
                  puStack_e = (undefined1 *)0x6fc4;
                  uVar4 = thunk_FUN_7e8f_02bf();
                }
                uVar10 = 0x40c1;
                *(undefined1 *)(local_4 * 0x1f + 0x82b) = uVar4;
              }
              local_4 = local_4 + 1;
            } while( true );
          }
          if (aiStack_66[local_4] == 0) {
            if (*(int *)(local_4 * 0x1f + 0x82c) == 0) {
              bVar17 = true;
              puStack_e = (undefined1 *)uVar10;
              for (iVar7 = 0; iVar7 < 8; iVar7 = iVar7 + 1) {
                uVar10 = puStack_e;
                if (*(int *)(iVar7 * 2 + 0x137) != 0) {
                  uVar10 = 0x1a8b;
                  uStack_12 = (char *)CONCAT22(0x6e25,(undefined2)uStack_12);
                  iVar16 = FUN_1a8b_0acc();
                  if (iVar16 < 0xf) {
                    bVar17 = false;
                    break;
                  }
                }
                puStack_e = (undefined1 *)uVar10;
              }
              if (bVar17) {
                puStack_e = (undefined1 *)0x6e47;
                iVar7 = thunk_FUN_7e8f_02bf();
                uVar4 = *(undefined1 *)(iVar7 + 0xca7);
              }
              else {
                puStack_e = (undefined1 *)0x6e5e;
                iVar7 = thunk_FUN_7e8f_02bf();
                uVar4 = *(undefined1 *)(iVar7 + 0xcac);
              }
            }
            else {
              puStack_e = (undefined1 *)0x6dbe;
              iVar7 = thunk_FUN_7e8f_02bf();
              uVar4 = *(undefined1 *)(iVar7 + 0xca4);
            }
            uVar10 = 0x40c1;
            *(undefined1 *)(local_4 * 0x1f + 0x829) = uVar4;
            *(undefined1 *)(local_4 * 0x1f + 0x82a) = 0;
            aiStack_66[local_4] = 1;
          }
          local_4 = local_4 + 1;
        } while( true );
      case 10:
        puStack_e = (undefined1 *)0x4206;
        pcVar11 = (char *)thunk_FUN_71d6_0000();
        return pcVar11;
      case 0xb:
        iVar6 = 1;
        iVar16 = iVar7;
        goto code_r0x000604b9;
      }
      goto LAB_5efd_16ae;
    }
    pcVar11 = (char *)((int)(undefined2 *)&DAT_4125_0000 + 1);
  }
  else {
    pcVar11 = (char *)0x0;
  }
  return pcVar11;
LAB_5efd_1356:
  iVar6 = iVar7 + -1;
  if (iVar7 == 0) goto LAB_5efd_1360;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + aiStack_70[iVar6];
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + aiStack_90[iVar6] * 0xf;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + aiStack_40[iVar6] * 4;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + aiStack_50[iVar6] * 6;
  uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar7 = (int)DAT_451b_018e;
  iVar9 = iVar7 + iVar6 * 2;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x3bc) * 4;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x3cc);
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x3dc);
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x3ec) * 2;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x3fc) * 2;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + *(int *)(iVar9 + 0x40c) * 2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    piVar13 = aiStack_c0 + iVar6;
    iVar7 = *(int *)(iVar7 + 0x18);
LAB_5efd_12f0:
    *piVar13 = *piVar13 + iVar7;
  }
  else {
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 2) {
      piVar13 = aiStack_c0 + iVar6;
      iVar7 = *(int *)(iVar7 + 0x1e);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 1) {
      piVar13 = aiStack_c0 + iVar6;
      iVar7 = *(int *)(iVar7 + 0x1a);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 0) {
      piVar13 = aiStack_c0 + iVar6;
      iVar7 = *(int *)(iVar7 + 0x1c);
      goto LAB_5efd_12f0;
    }
  }
  uVar5 = uStack_12._2_2_ - *(int *)(iVar6 * 2 + 0x10e3);
  uVar15 = (int)uVar5 >> 0xf;
  aiStack_c0[iVar6] = aiStack_c0[iVar6] + (int)((uVar5 ^ uVar15) - uVar15) / 8;
  uVar5 = *(int *)(auStack_2e + DAT_3c04_0110 * 2 + -2) - *(int *)(auStack_2e + iVar6 * 2 + -2) >>
          0xf;
  aiStack_c0[iVar6] =
       aiStack_c0[iVar6] +
       (int)((*(int *)(auStack_2e + DAT_3c04_0110 * 2 + -2) - *(int *)(auStack_2e + iVar6 * 2 + -2)
             ^ uVar5) - uVar5) / 4;
  iVar7 = iVar6;
  goto LAB_5efd_1356;
LAB_5efd_1360:
  unaff_SI = 0;
  iVar7 = 8;
  while (iVar6 = iVar7 + -1, iVar7 != 0) {
    iVar7 = iVar6;
    if (((*(int *)(iVar6 * 2 + 0x137) != 0) && (DAT_3c04_0110 != iVar6)) &&
       ((*(byte *)(DAT_3c04_0110 * 8 + iVar6 + 0x153b) & 0xc) == 8)) {
      unaff_SI = 1;
    }
  }
  if ((DAT_3c04_0116 != 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 0)) {
    iVar7 = 8;
    while (iVar7 != 0) {
      aiStack_d0[iVar7 + -1] = 0;
      iVar7 = iVar7 + -1;
    }
    iVar7 = 8;
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if ((*(int *)(iVar6 * 2 + 0x137) != 0) && (*(int *)(iVar6 * 2 + 0xd0) != 0)) {
        iVar9 = 8;
        while (iVar12 = iVar9 + -1, iVar9 != 0) {
          iVar9 = iVar12;
          if (((*(int *)(iVar12 * 2 + 0x137) != 0) && (*(int *)(iVar12 * 2 + 0xd0) != 1)) &&
             ((*(byte *)(iVar6 * 8 + iVar12 + 0x153b) & 3) == 2)) {
            aiStack_d0[iVar6] = 1;
          }
        }
      }
    }
    iVar7 = 8;
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if (((*(int *)(iVar6 * 2 + 0x137) != 0) && (*(int *)(iVar6 * 2 + 0xd0) != 0)) &&
         ((aiStack_d0[DAT_3c04_0110] != 0 || (aiStack_d0[iVar6] != 0)))) {
        aiStack_c0[iVar6] = 0;
      }
    }
  }
  unaff_DI = 8;
  while( true ) {
    puVar14 = (undefined1 *)DAT_451b_018e;
    uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (unaff_DI == 0) break;
    iVar6 = (unaff_DI + -1) * 2;
    unaff_DI = unaff_DI + -1;
code_r0x000604b9:
    iStack_1e = *(int *)((int)puVar14 + iVar6 + 0x3dc) + *(int *)((int)puVar14 + iVar6 + 0x3fc);
    if (DAT_3c04_0128 == 0) {
      iStack_20 = 8;
    }
    else {
      iStack_20 = 4;
    }
    pcStack_c = (char *)CONCAT22(0x4e6,pcVar11);
    iVar7 = thunk_FUN_557a_0a6e();
    if (iVar7 != 0) {
      aiStack_c0[unaff_DI] = 0;
    }
    if ((unaff_SI != 0) && ((*(byte *)(DAT_3c04_0110 * 8 + unaff_DI + 0x153b) & 0xc) == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    if ((iVar16 == 0) && (aiStack_66[unaff_DI + 3] == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    iVar16 = 0x40d7;
    iVar7 = thunk_FUN_8027_225b();
    if ((iVar7 < iStack_20) && (iStack_1e == 0)) {
      aiStack_c0[unaff_DI] = 0;
    }
    if (*(int *)(auStack_2e + unaff_DI * 2 + -2) / 4 < aiStack_b0[unaff_DI]) {
      aiStack_c0[unaff_DI] = 0;
    }
  }
  aiStack_c0[DAT_3c04_0110] = 0;
  iVar7 = 0;
  uVar5 = 8;
  while( true ) {
    uVar15 = uVar5 - 1;
    if (uVar5 == 0) break;
    uVar5 = uVar15;
    if ((*(int *)(auStack_2e + uVar15 * 2 + -2) != 0) && (iVar7 < aiStack_c0[uVar15])) {
      iVar7 = aiStack_c0[uVar15];
      pcStack_c = (char *)(ulong)uVar15;
    }
  }
  if ((*(char *)((int)puStack_e * 0x41 + 0x1592) != '\x0f') &&
     (*(char *)((int)puStack_e * 0x41 + 0x1592) != DAT_3c04_0110)) {
    param_1._2_2_ = 0;
    unaff_DI = *(int *)((int)puVar14 + 0x24a);
    goto LAB_5efd_168f;
  }
LAB_5efd_16ae:
  if ((pcVar11 != (char *)0xffff) && (aiStack_66[(int)(pcVar11 + 3)] == 0)) {
    pcVar11 = (char *)0xffff;
  }
  return pcVar11;
}

