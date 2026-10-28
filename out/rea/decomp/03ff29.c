
/* WARNING: Instruction at (ram,0x00061dbd) overlaps instruction at (ram,0x00061dba)
    */
/* WARNING: Control flow encountered bad instruction data */

char * __cdecl16far thunk_FUN_606a_17db(int param_1,int param_2,int param_3,undefined2 param_4)

{
  int *piVar1;
  bool bVar2;
  char *pcVar3;
  undefined1 uVar4;
  undefined2 uVar5;
  int iVar6;
  uint uVar7;
  char *pcVar8;
  int in_CX;
  int iVar9;
  char *pcVar10;
  char *pcVar11;
  int iVar12;
  undefined2 unaff_SS;
  char acStack_e0 [22];
  undefined2 uStack_ca;
  undefined2 uStack_c8;
  int aiStack_66 [27];
  int iStack_30;
  undefined1 auStack_2e [8];
  undefined1 auStack_26 [4];
  undefined1 auStack_22 [2];
  char *pcStack_20;
  char *apcStack_1e [4];
  char acStack_16 [2];
  undefined2 uStack_14;
  uint uStack_12;
  char *pcStack_10;
  char *pcStack_e;
  char *pcStack_c;
  char *pcStack_a;
  char *pcStack_8;
  int iStack_6;
  char *pcStack_4;
  
  for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
    auStack_2e[iVar12] = 0;
    auStack_26[iVar12] = 0;
    *(undefined1 *)((int)apcStack_1e + iVar12) = 0;
    acStack_16[iVar12] = '\0';
    *(undefined1 *)((int)&pcStack_e + iVar12) = 0;
    iVar6 = 0x16;
    while (iVar6 != 0) {
      (&stack0xff1f)[iVar12 * 0x16 + iVar6 + -1 + 1] = 0xff;
      iVar6 = iVar6 + -1;
    }
  }
  iVar12 = 0;
  do {
    if (7 < iVar12) {
      FUN_606a_1a3d(CONCAT22(param_2,param_1),apcStack_1e);
      FUN_606a_1a3d(CONCAT22(param_2,param_1),auStack_26);
      pcVar11 = (char *)FUN_606a_1a3d(CONCAT22(param_2,param_1),auStack_2e);
      iStack_6 = 0;
      do {
        if (iStack_6 != 0) {
          return pcVar11;
        }
        iStack_6 = 1;
        for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
          pcVar11 = (char *)(iVar12 * 2);
          if (*(int *)(pcVar11 + param_1) != -1) {
            if (acStack_16[iVar12] == '\0') {
              pcVar11 = (char *)0x0;
            }
            else {
              pcVar11 = (char *)(int)acStack_16[iVar12];
              iStack_30 = -1;
              pcVar8 = pcVar11;
              for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
                if (((iVar12 != iVar6) &&
                    (pcVar11 = (char *)(iVar6 * 2), *(int *)(pcVar11 + param_1) != -1)) &&
                   (pcVar11 = (char *)(int)acStack_16[iVar6], (int)pcVar11 < (int)pcVar8)) {
                  pcVar11 = (char *)(int)acStack_16[iVar6];
                  iStack_30 = iVar6;
                  pcVar8 = pcVar11;
                }
              }
              if (iStack_30 != -1) {
                for (iVar6 = 0; iVar6 < 0x16; iVar6 = iVar6 + 1) {
                  pcVar8 = (char *)(int)acStack_e0[iVar12 * 0x16 + iVar6];
                  pcVar11 = pcVar8;
                  if ((pcVar8 != (char *)0xff) &&
                     (((pcVar11 = (char *)0x3c04, *(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\x01' ||
                       (*(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\x02')) ||
                      (*(char *)((int)pcVar8 * 0x1d + 0xcfd) == '\b')))) {
                    acStack_e0[iVar12 * 0x16 + iVar6] = -1;
                    iStack_6 = 0;
                    piVar1 = (int *)((int)DAT_451b_018e + 0x4c);
                    *piVar1 = *piVar1 + 1;
                    *(undefined2 *)((int)pcVar8 * 0x1d + 0xd00) =
                         *(undefined2 *)(param_1 + iStack_30 * 2);
                    acStack_16[iVar12] = acStack_16[iVar12] + -1;
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
    }
    pcStack_4 = (char *)*(uint *)(param_1 + iVar12 * 2);
    if (pcStack_4 != (char *)0xffff) {
      thunk_FUN_7938_03d9(2,0,(int)pcStack_4 * 0x16 + -0x7780,0x2e1d);
      pcVar11 = (char *)0x0;
      while( true ) {
        if (DAT_451b_08ce <= (int)pcVar11) goto LAB_606a_18b2;
        pcVar8 = acStack_e0;
        (pcVar11 + iVar12 * 0x16)[(int)pcVar8] =
             *(char *)((undefined2 *)&DAT_451b_0c9c + (int)pcVar11);
        iVar6 = (int)*(char *)(((undefined2 *)&DAT_451b_0c9c)[(int)pcVar11] * 0x1d + 0xcfd);
        uVar7 = iVar6 - 1;
        if (uVar7 < 8) break;
        *(char *)((int)&pcStack_e + iVar12) = *(char *)((int)&pcStack_e + iVar12) + '\x01';
        pcVar11 = pcVar11 + 1;
      }
      pcVar10 = (char *)(uVar7 * 2);
      switch(uVar7) {
      case 0:
        pcStack_e = (char *)FUN_1a8b_0acc();
        pcStack_4 = (char *)thunk_FUN_621e_13b2();
        if (pcStack_4 != (char *)0x0) {
          pcStack_a = (char *)*(int *)(param_3 + param_1 * 2 + 0xc);
          if (pcStack_a == (char *)0xffff) {
            iStack_6 = 100;
          }
          else {
            iStack_6 = thunk_FUN_57d5_0a3e(*(undefined2 *)((int)pcVar11 * 0x16 + -0x7780),
                                           *(undefined2 *)((int)pcVar11 * 0x16 + -0x777e),0xffff);
          }
          if (pcStack_a != (char *)0xffff) {
            pcVar8 = (char *)0xffff;
            iVar6 = 8;
            while (iVar9 = iVar6 + -1, iVar6 != 0) {
              pcStack_10 = apcStack_1e[iVar6 + -2];
              iVar6 = iVar9;
              if ((pcStack_10 != (char *)0xffff) &&
                 (((undefined1 *)&DAT_451b_0664)[*(char *)((int)pcStack_10 * 0x16 + -0x777c) * 6] !=
                  '\0')) {
                pcVar8 = pcStack_10;
              }
            }
            if (pcVar8 == (char *)0xffff) {
              if (0xe < iStack_6) {
                iVar6 = 8;
                while (iVar6 != 0) {
                  apcStack_1e[iVar6 + -2] = (char *)0xffff;
                  iVar6 = iVar6 + -1;
                }
                pcStack_4 = (char *)0x1;
                goto LAB_606a_09ff;
              }
            }
            else {
              iVar6 = 8;
              while (iVar6 != 0) {
                apcStack_1e[iVar6 + -2] = (char *)0xffff;
                iVar6 = iVar6 + -1;
              }
              pcStack_4 = (char *)0x2;
              apcStack_1e[0] = pcVar8;
LAB_606a_09ff:
              pcStack_20 = pcVar11;
              thunk_FUN_621e_14d3(&pcStack_20);
            }
          }
          if ((((pcStack_a == (char *)0xffff) ||
               ((char *)(uint)*(byte *)((int)DAT_451b_018e + (int)pcStack_a + 0x182) != pcStack_4))
              || (2 < (int)pcStack_4)) || (0xe < iStack_6)) {
            if ((pcStack_a != (char *)0xffff) && (pcStack_4 == (char *)0x3)) {
              iVar6 = 8;
              while (iVar6 != 0) {
                apcStack_1e[iVar6 + -2] = (char *)0xffff;
                iVar6 = iVar6 + -1;
              }
              pcStack_20 = pcVar11;
              thunk_FUN_621e_14d3(&pcStack_20);
            }
            FUN_1c8c_0529();
            FUN_1000_4944();
            thunk_FUN_621e_170c();
            if (iVar12 != -1) {
              FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x981,0x4125,iVar12);
              if (iVar12 < 1000) {
                thunk_FUN_621e_0ae7(&pcStack_20);
                uVar5 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
                iVar12 = FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                                       *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
              }
              else {
                thunk_FUN_621e_0ae7(&pcStack_20);
                *(undefined2 *)((int)DAT_451b_1f02 + 0x12) =
                     *(undefined2 *)(iVar12 * 0x1d + -0x6446);
                uVar5 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
                iVar6 = (int)DAT_451b_1f02;
                *(undefined2 *)(iVar6 + 0x14) = *(undefined2 *)(iVar12 * 0x1d + -0x6444);
                iVar12 = FUN_1a8b_0001(*(undefined2 *)(iVar6 + 0x12),*(undefined2 *)(iVar6 + 0x14),0
                                      );
              }
              if (iVar12 == 4) {
                pcStack_8 = (char *)((int)(undefined2 *)&DAT_4125_0000 + 1);
              }
            }
          }
        }
        return pcStack_8;
      case 1:
        goto switchD_6000_1f31_caseD_1;
      case 2:
        *(undefined1 *)(iVar12 + -0x68) = 0;
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      case 3:
        iStack_6 = thunk_FUN_621e_13b2(*(undefined2 *)((int)pcStack_8 * 0x16 + -0x7780),
                                       *(undefined2 *)((int)pcStack_8 * 0x16 + -0x777e),auStack_22);
        if (iStack_6 == 0) {
          pcStack_10 = (char *)0x0;
        }
        else {
          if (iStack_6 < 3) {
            pcStack_4 = (char *)0x5f;
            pcVar11 = DAT_3c04_157b;
          }
          else {
            pcStack_4 = (char *)0x4b;
            pcVar11 = DAT_3c04_157b;
          }
          while (pcVar8 = pcVar11, pcVar11 = pcVar8 + -1, pcVar8 != (char *)0x0) {
            if ((((*(char *)(*(byte *)(*(int *)((int)pcVar11 * 0x41 + 0x157f) * 0xe0 +
                                      *(int *)((int)pcVar11 * 0x41 + 0x157d) * 2) + 0x710) == '\n')
                 && ((pcVar11[(int)DAT_451b_018e + 0x11e] & 1U) == 0)) &&
                (*(char *)((int)pcVar11 * 0x41 + 0x1592) != '\x0f')) &&
               (((*(byte *)(DAT_3c04_0110 * 8 + (int)*(char *)((int)pcVar11 * 0x41 + 0x1592) +
                           0x153b) & 3) == 2 &&
                ((pcStack_c = (char *)FUN_1a8b_0acc(*(undefined2 *)((int)pcVar11 * 0x41 + 0x157d),
                                                    *(undefined2 *)((int)pcVar11 * 0x41 + 0x157f),
                                                    *(undefined2 *)((int)pcStack_8 * 0x16 + -0x7780)
                                                    ,*(undefined2 *)
                                                      ((int)pcStack_8 * 0x16 + -0x777e)),
                 (int)pcStack_c <= (int)pcStack_10 || (pcStack_a == pcVar11)))))) {
              uVar7 = thunk_FUN_621e_15c5(*(undefined2 *)((int)pcVar11 * 0x41 + 0x157d),
                                          *(undefined2 *)((int)pcVar11 * 0x41 + 0x157f));
              if (pcStack_a == pcVar11) {
                uVar7 = uVar7 + 0x14;
              }
              uVar5 = FUN_1a8b_0acc(*(undefined2 *)((int)pcVar11 * 0x41 + 0x157d),
                                    *(undefined2 *)((int)pcVar11 * 0x41 + 0x157f),
                                    *(undefined2 *)((int)pcStack_8 * 0x16 + -0x7780),
                                    *(undefined2 *)((int)pcStack_8 * 0x16 + -0x777e));
              FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x9ef,0x4125,pcVar8,uVar7,uVar5);
              thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,
                                  *(undefined2 *)((int)pcVar11 * 0x41 + 0x157d),
                                  *(undefined2 *)((int)pcVar11 * 0x41 + 0x157f));
              if (((int)pcStack_4 <= (int)uVar7) &&
                 (((int)uStack_12 < (int)uVar7 ||
                  ((uVar7 == uStack_12 && ((int)pcStack_c < (int)pcStack_10)))))) {
                pcStack_10 = pcStack_c;
                uStack_12 = uVar7;
                pcStack_e = pcVar11;
              }
            }
          }
          *(uint *)(param_2 + 0x38) = (uint)pcStack_e;
          *(int *)(param_2 + 0x3a) = (int)pcStack_10;
        }
        return pcStack_10;
      case 4:
        iStack_6 = iVar6 + -2;
        if (0x9b < (int)(pcStack_8 + (int)pcStack_4)) {
          pcStack_4 = (char *)(0x9b - (int)pcStack_8);
        }
        uStack_12 = (int)pcStack_a * 2 + 0x50;
        pcStack_10 = (char *)((int)pcStack_8 * 2 + 0x3c);
        pcStack_e = (char *)(iStack_6 * 2);
        pcStack_c = (char *)((int)pcStack_4 << 1);
        FUN_22bf_07a5();
        for (pcVar11 = pcStack_a; pcVar8 = pcStack_8, (int)pcVar11 < (int)(pcStack_a + iStack_6);
            pcVar11 = pcVar11 + 1) {
          for (; (int)pcVar8 < (int)(pcStack_8 + (int)pcStack_4); pcVar8 = pcVar8 + 1) {
            thunk_FUN_85d0_1298();
          }
        }
        FUN_22bf_0757();
        pcVar11 = (char *)0x3c04;
        if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
          thunk_FUN_830b_2200(DAT_3c04_0110);
          FUN_22bf_07a5();
          FUN_24d0_0002(0xf);
          FUN_216d_01fd(&uStack_12);
          thunk_FUN_7e8f_0000(10);
          thunk_FUN_830b_0000(0x10001,0,0);
          thunk_FUN_54e4_070b(0x1160008,0xf0,0x17);
          FUN_18a9_03b3(0x118);
          FUN_18a9_03b3(0x119);
          FUN_18a9_03b3(0x117);
          FUN_18a9_0839(0xf);
          FUN_18a9_066e(0x11a,1);
          pcVar11 = (char *)FUN_22bf_0757();
        }
        return pcVar11;
      case 5:
        *(uint *)(pcVar10 + (int)pcVar11) = *(int *)(pcVar10 + (int)pcVar11) + uVar7;
        while (pcStack_4 = pcStack_4 + 1, (int)pcStack_4 < 0x28) {
          aiStack_66[(int)pcStack_4] = 1;
        }
        iVar6 = thunk_FUN_7e8f_02bf();
        pcVar11 = (char *)((int)DAT_3c04_080f / 3 + iVar6 + 8);
        if (0x16 < (int)pcVar11) {
          pcVar11 = (char *)0x16;
        }
        for (pcStack_4 = (char *)0x8; (int)pcStack_4 < (int)pcVar11;
            pcStack_4 = (char *)((int)pcStack_4 + 1)) {
          if (((int)pcStack_4 < (int)(pcStack_8 + 8)) || ((int)(pcStack_a + 8) <= (int)pcStack_4)) {
            iStack_6 = 0;
            while (iStack_6 == 0) {
              iVar12 = thunk_FUN_7e8f_02bf();
              FUN_1000_1e79();
              iVar6 = FUN_66b0_08f4();
              if ((iVar6 == 0) || (*(int *)(iVar12 * 0x1f + 0x82c) != 0)) {
                uStack_c8 = 0x1000;
                uStack_ca = 0x6cd1;
                FUN_1000_1e79();
                uStack_c8 = 0x1000;
                uStack_ca = 0x6cd6;
                iVar6 = FUN_66b0_08f4();
                if (((iVar6 != 0) || (*(int *)(iVar12 * 0x1f + 0x82c) == 0)) &&
                   (aiStack_66[iVar12] == 0)) {
                  iStack_6 = 1;
                  aiStack_66[iVar12] = 1;
                }
              }
            }
            *(undefined1 *)((int)pcStack_4 * 0x1d + 0xcff) = 2;
            *(int *)((int)pcStack_4 * 0x1d + 0xd00) = iVar12;
            *(undefined1 *)(iVar12 * 0x1f + 0x829) = 2;
            *(undefined1 *)(iVar12 * 0x1f + 0x82a) = pcStack_4._0_1_;
          }
          else {
            *(undefined1 *)((int)pcStack_4 * 0x1d + 0xcff) = 0;
          }
        }
        while (pcStack_4 = pcVar11, (int)pcStack_4 < 0x16) {
          *(undefined1 *)((int)pcStack_4 * 0x1d + 0xcff) = 0;
          pcVar11 = (char *)((int)pcStack_4 + 1);
        }
        pcStack_4 = (char *)0x0;
        break;
      case 6:
        *(uint *)(pcVar10 + (int)pcVar11) =
             *(int *)(pcVar10 + (int)pcVar11) + in_CX + (uint)((int)uVar7 < 0);
        goto code_r0x000616dd;
      case 7:
        return (char *)(uint)((pcVar10[1] & 0x40U) == 0);
      }
      do {
        if ((int)DAT_3c04_080f <= (int)pcStack_4) {
          pcStack_4 = (char *)0x0;
          do {
            if ((int)DAT_3c04_080f <= (int)pcStack_4) {
              return DAT_3c04_080f;
            }
            if (*(char *)((int)pcStack_4 * 0x1f + 0x829) == '\x01') {
              *(undefined1 *)((int)pcStack_4 * 0x1f + 0x82b) = 0;
            }
            else {
              if (*(char *)((int)pcStack_4 * 0x1f + 0x829) == '\x05') {
                if (*(int *)((int)pcStack_4 * 0x1f + 0x82c) == 0) {
                  bVar2 = true;
                  for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
                    if ((*(int *)(iVar12 * 2 + 0x137) != 0) &&
                       (iVar6 = FUN_1a8b_0acc(*(undefined2 *)(iVar12 * 0x14 + 0x189),
                                              *(undefined2 *)(iVar12 * 0x14 + 0x18b),
                                              *(undefined2 *)((int)pcStack_4 * 0x1f + 0x811),
                                              *(undefined2 *)((int)pcStack_4 * 0x1f + 0x813)),
                       iVar6 < 0xf)) {
                      bVar2 = false;
                      break;
                    }
                  }
                  if (bVar2) {
                    iVar12 = thunk_FUN_7e8f_02bf();
                    uVar4 = *(undefined1 *)(iVar12 + 0xc9e);
                  }
                  else {
                    iVar12 = thunk_FUN_7e8f_02bf();
                    uVar4 = *(undefined1 *)(iVar12 + 0xca2);
                  }
                }
                else {
                  iVar12 = thunk_FUN_7e8f_02bf();
                  uVar4 = *(undefined1 *)(iVar12 + 0xc9a);
                }
              }
              else {
                uVar4 = thunk_FUN_7e8f_02bf();
              }
              *(undefined1 *)((int)pcStack_4 * 0x1f + 0x82b) = uVar4;
            }
            pcStack_4 = (char *)((int)pcStack_4 + 1);
          } while( true );
        }
        if (aiStack_66[(int)pcStack_4] == 0) {
          if (*(int *)((int)pcStack_4 * 0x1f + 0x82c) == 0) {
            bVar2 = true;
            for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
              if ((*(int *)(iVar12 * 2 + 0x137) != 0) &&
                 (iVar6 = FUN_1a8b_0acc(*(undefined2 *)(iVar12 * 0x14 + 0x189),
                                        *(undefined2 *)(iVar12 * 0x14 + 0x18b),
                                        *(undefined2 *)((int)pcStack_4 * 0x1f + 0x811),
                                        *(undefined2 *)((int)pcStack_4 * 0x1f + 0x813)), iVar6 < 0xf
                 )) {
                bVar2 = false;
                break;
              }
            }
            if (bVar2) {
              iVar12 = thunk_FUN_7e8f_02bf();
              uVar4 = *(undefined1 *)(iVar12 + 0xca7);
            }
            else {
              iVar12 = thunk_FUN_7e8f_02bf();
              uVar4 = *(undefined1 *)(iVar12 + 0xcac);
            }
          }
          else {
            iVar12 = thunk_FUN_7e8f_02bf();
            uVar4 = *(undefined1 *)(iVar12 + 0xca4);
          }
          *(undefined1 *)((int)pcStack_4 * 0x1f + 0x829) = uVar4;
          *(undefined1 *)((int)pcStack_4 * 0x1f + 0x82a) = 0;
          aiStack_66[(int)pcStack_4] = 1;
        }
        pcStack_4 = (char *)((int)pcStack_4 + 1);
      } while( true );
    }
LAB_606a_18b2:
    iVar12 = iVar12 + 1;
  } while( true );
code_r0x000616dd:
  uStack_14 = *(undefined2 *)((int)pcVar11 * 0x1f + 0x813);
  iStack_6 = 1;
  uStack_12 = uVar7;
  iVar12 = FUN_606a_1637(pcVar11,pcStack_4);
  if (iVar12 != 0) {
    pcVar8 = (char *)FUN_1a8b_0acc(uStack_12,uStack_14,
                                   *(undefined2 *)((int)pcStack_4 * 0x16 + -0x7780),
                                   *(undefined2 *)((int)pcStack_4 * 0x16 + -0x777e));
    if (*(char *)((int)pcVar11 * 0x1f + 0x829) == '\x01') {
      if (((((DAT_3c04_011e == 0) ||
            (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) ||
           ((int)pcStack_8 <= (int)pcVar8)) ||
          (pcVar10 = pcVar8, pcVar3 = pcVar11, (int)pcStack_10 <= (int)pcVar8)) &&
         (uVar7 = FUN_606a_063c(pcVar11), pcVar10 = pcStack_10, pcVar3 = pcStack_e,
         (*(uint *)((int)pcStack_4 * 0x16 + -0x7774) & uVar7) != 0)) goto LAB_606a_11c5;
    }
    else {
      iVar12 = 6;
      while (iVar6 = iVar12 + -1, pcVar10 = pcStack_10, pcVar3 = pcStack_e, iVar12 != 0) {
        iVar12 = iVar6;
        if (((iVar6 != param_1) && (*(int *)(param_2 + iVar6 * 2) != -1)) &&
           (((*(byte *)(*(int *)(param_2 + iVar6 * 2) * 0x16 + -0x7772) & 0xf) == 3 &&
            ((char *)(uint)(*(byte *)(*(int *)(param_2 + iVar6 * 2) * 0x16 + -0x7771) >> 1) ==
             pcVar11)))) {
          iStack_6 = 0;
        }
      }
    }
    pcStack_e = pcVar3;
    pcStack_10 = pcVar10;
    if ((iStack_6 != 0) && ((int)pcVar8 <= (int)pcStack_8)) {
      if ((int)pcVar8 < (int)pcStack_c) {
        pcStack_c = pcVar8;
        pcStack_a = pcVar11;
      }
      FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x9c6,0x4125,pcVar11,pcVar8,pcStack_8,
                    pcStack_a);
      thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,
                          *(undefined2 *)((int)pcVar11 * 0x1f + 0x811),
                          *(undefined2 *)((int)pcVar11 * 0x1f + 0x813));
    }
  }
LAB_606a_11c5:
  pcVar11 = pcVar11 + 1;
  if ((int)DAT_3c04_080f <= (int)pcVar11) {
    *(uint *)(param_2 + 0x30) = (uint)pcStack_e;
    *(int *)(param_2 + 0x32) = (int)pcStack_10;
    *(uint *)(param_2 + 0x34) = (uint)pcStack_a;
    *(int *)(param_2 + 0x36) = (int)pcStack_c;
    return pcStack_c;
  }
  uVar7 = *(uint *)((int)pcVar11 * 0x1f + 0x811);
  goto code_r0x000616dd;
switchD_6000_1f31_caseD_1:
  while( true ) {
    iVar6 = (int)pcVar10[0x159b];
    if (((undefined1 *)&DAT_451b_0669)[pcVar8[iVar12 * 0x41 + 0x1593] * 6] == '\x01') {
      iVar6 = iVar6 + 2;
    }
    if (iVar6 < iStack_6) {
      pcStack_4 = pcVar8;
      iStack_6 = iVar6;
    }
    pcVar8 = pcVar8 + 1;
    pcVar10 = pcVar11;
    if ((3 < (int)pcVar8) || (pcVar10 = pcVar8, pcVar8[iVar12 * 0x41 + 0x1593] == -1)) break;
    pcVar10 = pcVar8 + iVar12 * 0x41;
    uVar7 = 0x3c04;
  }
  if (pcVar10 == (char *)0xffff) {
    pcVar10 = pcStack_4;
  }
  return pcVar10;
}

