
/* WARNING: Instruction at (ram,0x00051e8d) overlaps instruction at (ram,0x00051e8b)
    */
/* WARNING: Removing unreachable block (ram,0x00053342) */
/* WARNING: Removing unreachable block (ram,0x00053355) */
/* WARNING: Removing unreachable block (ram,0x00053370) */
/* WARNING: Removing unreachable block (ram,0x0005335c) */
/* WARNING: Removing unreachable block (ram,0x0005336b) */
/* WARNING: Removing unreachable block (ram,0x0005336f) */
/* WARNING: Removing unreachable block (ram,0x00053375) */
/* WARNING: Removing unreachable block (ram,0x0005337a) */

uint __cdecl16far
FUN_5304_01f6(int param_1,undefined2 *param_2,int param_3,int *param_4,int param_5,
             undefined2 param_6)

{
  byte *pbVar1;
  uint *puVar2;
  byte bVar3;
  char cVar4;
  ulong uVar5;
  ulong uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  char *pcVar10;
  uint uVar11;
  int iVar12;
  byte *pbVar13;
  int iVar14;
  uint uVar15;
  int *piVar16;
  int unaff_SI;
  int iVar17;
  int unaff_DI;
  undefined2 *puVar18;
  undefined2 *puVar19;
  undefined2 uVar20;
  undefined2 uVar21;
  undefined2 unaff_SS;
  longdouble in_ST0;
  undefined1 auStack_34 [30];
  int iStack_16;
  uint uStack_14;
  char *pcStack_12;
  char *pcStack_10;
  undefined2 *puStack_e;
  char *pcStack_c;
  char *pcStack_a;
  undefined2 *puVar22;
  int local_4;
  
  iVar8 = 0x5304;
  local_4 = 0;
  puVar19 = (undefined2 *)&DAT_4125_0000;
  do {
    puVar19 = (undefined2 *)((int)puVar19 + 1);
    if (0x99 < (int)puVar19) {
      *(undefined2 *)(param_1 + 400) = 0xffff;
      while( true ) {
        pcStack_c = (char *)param_1;
        pcStack_a = (char *)param_2;
        pcStack_10 = (char *)s_h_Apalloc__no_hdr_4125_33d3 + 0x10;
        puStack_e = (undefined2 *)iVar8;
        uVar9 = FUN_5304_03c3();
        if ((uVar9 == 0xffff) || (9 < local_4)) break;
        local_4 = local_4 + 1;
        piVar16 = (int *)(param_1 + uVar9 * 2);
        piVar16[0x96] = 1;
        pbVar1 = (byte *)(piVar16[0x32] * 0xe0 + *piVar16 * 2 + 1);
        *pbVar1 = *pbVar1 | 0x80;
      }
      return uVar9;
    }
    for (iVar17 = 1; iVar17 < 0x6e; iVar17 = iVar17 + 1) {
      pcStack_c = (char *)0x2;
      pcStack_a = (char *)0xffff;
      puStack_e = (undefined2 *)((int)(undefined2 *)&DAT_4125_0000 + 1);
      pcStack_12 = (char *)0x325c;
      pcStack_10 = (char *)iVar8;
      iVar8 = thunk_FUN_7e8f_02bf();
      if (iVar8 == 0) {
        uVar11 = 0;
        uVar9 = 0x2e1d;
        bVar3 = *(byte *)((int)puVar19 * 0xe0 + iVar17 * 2);
        uVar15 = bVar3 - 0x20;
        if (uVar15 < 6) {
          iVar8 = uVar15 * 2;
          uVar20 = 0x5000;
          uVar15 = uVar9;
          switch(bVar3) {
          case 0x20:
            pcStack_a = auStack_34;
            puStack_e = (undefined2 *)0x1;
            pcStack_c = (char *)0x0;
            pcStack_10 = (char *)0x5000;
            pcStack_12 = (char *)0x270;
            puStack_e = (undefined2 *)thunk_FUN_7e8f_051a();
            pcStack_10 = (char *)0x4125;
            pcStack_12 = (char *)&DAT_451b_1d28;
            uStack_14 = 0x40c1;
            iStack_16 = 0x27e;
            FUN_1000_4944();
            pcStack_a = (char *)&DAT_451b_1d28;
            pcStack_c = (char *)0x1000;
            puStack_e = (undefined2 *)0x28a;
            thunk_FUN_79a9_0000();
            pcStack_a = (char *)((ulong)DAT_451b_002a >> 0x10);
            pcStack_c = (char *)s_print_scanf___floating_point_for_4125_3e8a + 0xc +
                        (int)DAT_451b_002a;
            pcStack_10 = (char *)0x4096;
            pcStack_12 = (char *)0x2a7;
            puStack_e = (undefined2 *)iVar17;
            FUN_170b_004e();
            pcStack_a = (char *)s_Area_file_not_found_4125_16fe + 0xd;
            pcStack_c = (char *)0x2b0;
            uVar9 = FUN_170b_003a();
            return uVar9;
          case 0x22:
            do {
              if (*(char *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) == '\x03')
              goto LAB_4fe5_04a3;
              while( true ) {
                iVar17 = iVar17 + 1;
                while (0x6f < iVar17) {
                  puVar19 = (undefined2 *)((int)puVar19 + 1);
                  if (0x9b < (int)puVar19) {
                    for (iVar8 = 0; iVar8 < 0x9c; iVar8 = iVar8 + 1) {
                      for (iVar17 = 0; iVar17 < 0x70; iVar17 = iVar17 + 1) {
                        uVar9 = iVar8 * 0x70;
                        if (*(char *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) == '\x04') {
                          pcStack_10 = (char *)0x42a;
                          puStack_e = (undefined2 *)uVar20;
                          pcStack_c = (char *)iVar17;
                          pcStack_a = (char *)iVar8;
                          iVar7 = FUN_4fe5_0d4f();
                          if ((iVar17 + iVar8 == 0) ||
                             ((iVar17 + iVar8) / 2 != (iVar17 + iVar8 + -1) / 2)) {
                            iVar12 = 1;
                          }
                          else {
                            iVar12 = 0;
                          }
                          uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                          iVar14 = (int)DAT_451b_002a;
                          if (*(char *)(iVar14 + iVar7 + 0x264) < '\0') {
                            pcStack_c = (char *)0xa;
                            pcStack_a = (char *)0x0;
                            puStack_e = (undefined2 *)0x1;
                            pcStack_12 = (char *)0x473;
                            pcStack_10 = (char *)uVar20;
                            iVar7 = thunk_FUN_7e8f_02bf();
                            uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                            uVar20 = 0x40c1;
                            if (iVar7 < 6) {
                              uVar21 = *(undefined2 *)((int)DAT_451b_002a + iVar12 * 2 + 0x624);
                              pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                              *pbVar13 = 0;
                              pbVar1 = pbVar13;
                              *pbVar1 = *pbVar1 | (byte)uVar21;
                              uVar9 = iVar8 * 0x70;
                              *(undefined1 *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) = 7;
                            }
                            else {
                              uVar11 = *(uint *)((int)DAT_451b_002a + iVar12 * 2 + 0x598);
                              uVar9 = uVar11 & 0xff;
                              pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                              *pbVar13 = 0;
                              pbVar1 = pbVar13;
                              *pbVar1 = *pbVar1 | (byte)uVar11;
                            }
                          }
                          else {
                            uVar21 = *(undefined2 *)
                                      (iVar14 + *(char *)(iVar14 + iVar7 + 0x264) * 4 + iVar12 * 2 +
                                      0x564);
                            pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                            *pbVar13 = 0;
                            pbVar1 = pbVar13;
                            *pbVar1 = *pbVar1 | (byte)uVar21;
                            uVar9 = iVar8 * 0x70;
                            *(undefined1 *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) = 4;
                          }
                        }
                      }
                    }
                    for (iVar8 = 0; iVar8 < 0x9c; iVar8 = iVar8 + 1) {
                      for (iVar17 = 0; iVar17 < 0x70; iVar17 = iVar17 + 1) {
                        if (*(char *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) == '\x06'
                           ) {
                          pcStack_10 = (char *)0x580;
                          puStack_e = (undefined2 *)uVar20;
                          pcStack_c = (char *)iVar17;
                          pcStack_a = (char *)iVar8;
                          iVar7 = FUN_4fe5_0dcb();
                          if ((iVar17 + iVar8 == 0) ||
                             ((iVar17 + iVar8) / 2 != (iVar17 + iVar8 + -1) / 2)) {
                            iVar12 = 1;
                          }
                          else {
                            iVar12 = 0;
                          }
                          uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                          iVar14 = (int)DAT_451b_002a;
                          if (*(char *)(iVar14 + iVar7 + 0x264) < '\0') {
                            uVar21 = *(undefined2 *)(iVar14 + iVar12 * 2 + 0x5a4);
                            pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                            *pbVar13 = 0;
                            pbVar1 = pbVar13;
                            *pbVar1 = *pbVar1 | (byte)uVar21;
                            *(undefined1 *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) = 5
                            ;
                          }
                          else {
                            uVar21 = *(undefined2 *)
                                      (iVar14 + *(char *)(iVar14 + iVar7 + 0x264) * 4 + iVar12 * 2 +
                                      0x5e4);
                            pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                            *pbVar13 = 0;
                            pbVar1 = pbVar13;
                            *pbVar1 = *pbVar1 | (byte)uVar21;
                            *(undefined1 *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) = 6
                            ;
                          }
                        }
                        uVar9 = iVar8 * 0x70;
                      }
                    }
                    for (iVar8 = 0; iVar8 < 0x9c; iVar8 = iVar8 + 1) {
                      for (iVar17 = 0; iVar17 < 0x70; iVar17 = iVar17 + 1) {
                        uVar9 = iVar8 * 0x70;
                        if (*(char *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) == '\x05') {
                          pcStack_10 = (char *)0x68c;
                          puStack_e = (undefined2 *)uVar20;
                          pcStack_c = (char *)iVar17;
                          pcStack_a = (char *)iVar8;
                          iVar7 = FUN_4fe5_0e47();
                          if ((iVar17 + iVar8 == 0) ||
                             ((iVar17 + iVar8) / 2 != (iVar17 + iVar8 + -1) / 2)) {
                            iVar12 = 1;
                          }
                          else {
                            iVar12 = 0;
                          }
                          uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                          iVar14 = (int)DAT_451b_002a;
                          if (*(char *)(iVar14 + iVar7 + 0x264) < '\0') {
                            pcStack_c = (char *)0xa;
                            pcStack_a = (char *)0x0;
                            puStack_e = (undefined2 *)0x1;
                            pcStack_12 = (char *)0x6d5;
                            pcStack_10 = (char *)uVar20;
                            iVar7 = thunk_FUN_7e8f_02bf();
                            uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                            uVar20 = 0x40c1;
                            if (iVar7 < 6) {
                              uVar21 = *(undefined2 *)((int)DAT_451b_002a + iVar12 * 2 + 0x624);
                              pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                              *pbVar13 = 0;
                              pbVar1 = pbVar13;
                              *pbVar1 = *pbVar1 | (byte)uVar21;
                              uVar9 = iVar8 * 0x70;
                              *(undefined1 *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) = 7;
                            }
                            else {
                              *(undefined1 *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) =
                                   5;
                              uVar11 = *(uint *)((int)DAT_451b_002a + iVar12 * 2 + 0x5d8);
                              uVar9 = uVar11 & 0xff;
                              pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                              *pbVar13 = 0;
                              pbVar1 = pbVar13;
                              *pbVar1 = *pbVar1 | (byte)uVar11;
                            }
                          }
                          else {
                            uVar21 = *(undefined2 *)
                                      (iVar14 + *(char *)(iVar14 + iVar7 + 0x264) * 4 + iVar12 * 2 +
                                      0x5a4);
                            pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                            *pbVar13 = 0;
                            pbVar1 = pbVar13;
                            *pbVar1 = *pbVar1 | (byte)uVar21;
                            uVar9 = iVar8 * 0x70;
                            *(undefined1 *)((int)DAT_451b_002a + uVar9 + iVar17 + 0x6120) = 5;
                          }
                        }
                      }
                    }
                    for (iVar8 = 0; iVar8 < 0x9c; iVar8 = iVar8 + 1) {
                      for (iVar17 = 0; iVar17 < 0x70; iVar17 = iVar17 + 1) {
                        if (*(char *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) == '\b')
                        {
                          if ((iVar17 + iVar8 == 0) ||
                             ((iVar17 + iVar8) / 2 != (iVar17 + iVar8 + -1) / 2)) {
                            iVar7 = 1;
                          }
                          else {
                            iVar7 = 0;
                          }
                          pcStack_c = (char *)0xa;
                          pcStack_a = (char *)0x0;
                          puStack_e = (undefined2 *)0x1;
                          pcStack_12 = (char *)0x828;
                          pcStack_10 = (char *)uVar20;
                          iVar12 = thunk_FUN_7e8f_02bf();
                          if (iVar12 < 7) {
                            iVar7 = iVar7 << 1;
                          }
                          else {
                            pcStack_c = (char *)0x4;
                            pcStack_a = (char *)0x0;
                            puStack_e = (undefined2 *)0x1;
                            pcStack_10 = (char *)0x40c1;
                            pcStack_12 = (char *)0x841;
                            iVar7 = thunk_FUN_7e8f_02bf();
                            iVar7 = iVar7 << 2;
                          }
                          uVar20 = 0x40c1;
                          uVar21 = *(undefined2 *)((int)DAT_451b_002a + iVar7 + 0x664);
                          pbVar13 = (byte *)(iVar8 * 0xe0 + iVar17 * 2);
                          *pbVar13 = 0;
                          pbVar1 = pbVar13;
                          *pbVar1 = *pbVar1 | (byte)uVar21;
                          *(undefined1 *)((int)DAT_451b_002a + iVar8 * 0x70 + iVar17 + 0x6120) = 8;
                        }
                        uVar9 = iVar8 * 0x70;
                      }
                    }
                    return uVar9;
                  }
                  iVar17 = 0;
                }
                uVar15 = (uint)((ulong)DAT_451b_002a >> 0x10);
                if (*(char *)((int)DAT_451b_002a + (int)puVar19 * 0x70 + iVar17 + 0x6120) != '\x02')
                break;
LAB_4fe5_04a3:
                pcStack_10 = (char *)0x2fa;
                puStack_e = (undefined2 *)uVar20;
                pcStack_c = (char *)iVar17;
                pcStack_a = (char *)puVar19;
                iVar8 = FUN_4fe5_0c9d();
                if ((iVar17 + (int)puVar19 == 0) ||
                   ((iVar17 + (int)puVar19) / 2 != ((int)puVar19 + iVar17 + -1) / 2)) {
                  iVar7 = 1;
                }
                else {
                  iVar7 = 0;
                }
                uVar21 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                iVar12 = (int)DAT_451b_002a;
                if (*(char *)(iVar12 + iVar8 + 0x264) < '\0') {
                  *(undefined1 *)(iVar12 + (int)puVar19 * 0x70 + iVar17 + 0x6120) = 8;
                  uVar21 = *(undefined2 *)((int)DAT_451b_002a + iVar7 * 2 + 0x664);
                  pbVar13 = (byte *)((int)puVar19 * 0xe0 + iVar17 * 2);
                  *pbVar13 = 0;
                  pbVar1 = pbVar13;
                  *pbVar1 = *pbVar1 | (byte)uVar21;
                  pcStack_10 = (char *)0x37f;
                  puStack_e = (undefined2 *)uVar20;
                  pcStack_c = (char *)iVar17;
                  pcStack_a = (char *)puVar19;
                  thunk_FUN_4fc0_0029();
                  uVar9 = 0x2e1d;
                  pbVar1 = (byte *)((int)puVar19 * 0xe0 + iVar17 * 2 + 1);
                  *pbVar1 = *pbVar1 & 0x7f;
                  uVar20 = 0x3f80;
                }
                else {
                  *(undefined1 *)(iVar12 + (int)puVar19 * 0x70 + iVar17 + 0x6120) = 2;
                  uVar11 = *(uint *)((int)DAT_451b_002a +
                                     *(char *)((int)DAT_451b_002a + iVar8 + 0x264) * 4 + iVar7 * 2 +
                                    0x4e4);
                  uVar9 = uVar11 & 0xff;
                  pbVar13 = (byte *)((int)puVar19 * 0xe0 + iVar17 * 2);
                  *pbVar13 = 0;
                  pbVar1 = pbVar13;
                  *pbVar1 = *pbVar1 | (byte)uVar11;
                }
              }
              uVar9 = (int)puVar19 * 0x70;
            } while( true );
          case 0x23:
            do {
              uVar21 = uVar20;
              if (iVar8 == 0) {
                pcStack_a = (char *)0xb;
                pcStack_c = (char *)(iVar17 + 3);
                uVar21 = 0x3f67;
                pcStack_12 = (char *)s_Winners_4125_1e9c + 3;
                pcStack_10 = (char *)uVar20;
                puStack_e = puVar19;
                iVar8 = thunk_FUN_4c45_11f5();
                if (iVar8 == 0) {
                  puStack_e = (undefined2 *)((int)(undefined2 *)&DAT_4125_0000 + 1);
                }
              }
              do {
                do {
                  do {
                    do {
                      do {
                        if ((puStack_e != (undefined2 *)0x0) || (0x31 < (int)pcStack_c)) {
                          if (puStack_e == (undefined2 *)0x0) {
                            pcStack_c = (char *)0x0;
                            while ((puStack_e == (undefined2 *)0x0 && ((int)pcStack_c < 0x32))) {
                              pcStack_c = (char *)0x66;
                              pcStack_a = (char *)0x5;
                              puStack_e = (undefined2 *)0x1;
                              pcStack_12 = (char *)s_Report_4125_1ed7 + 2;
                              pcStack_10 = (char *)uVar21;
                              puVar19 = (undefined2 *)thunk_FUN_7e8f_02bf();
                              pcStack_c = (char *)0x92;
                              pcStack_a = (char *)0x5;
                              puStack_e = (undefined2 *)((int)(undefined2 *)&DAT_4125_0000 + 1);
                              pcStack_10 = (char *)0x40c1;
                              uVar21 = 0x40c1;
                              pcStack_12 = (char *)s_History_4125_1ee8 + 3;
                              iVar17 = thunk_FUN_7e8f_02bf();
                              if (*(char *)((int)puVar19 +
                                           (int)DAT_451b_002a + iVar17 * 0x70 + 0x6120) == param_1)
                              {
                                pcStack_a = (char *)0xa;
                                pcStack_10 = (char *)0x40c1;
                                uVar21 = 0x3f67;
                                pcStack_12 = (char *)s_Cannot_allocate_this_newbm_4125_1ef6 + 0x19;
                                puStack_e = puVar19;
                                pcStack_c = (char *)iVar17;
                                iVar8 = thunk_FUN_4c45_11f5();
                                if (iVar8 == 0) {
                                  pcStack_a = (char *)0xb;
                                  pcStack_10 = (char *)0x3f67;
                                  uVar21 = 0x3f67;
                                  pcStack_12 = (char *)s_standard_pal_4125_1f14 + 0xb;
                                  puStack_e = puVar19;
                                  pcStack_c = (char *)iVar17;
                                  iVar8 = thunk_FUN_4c45_11f5();
                                  if (iVar8 == 0) {
                                    puStack_e = (undefined2 *)
                                                ((int)(undefined2 *)&DAT_4125_0000 + 1);
                                  }
                                }
                              }
                            }
                          }
                          if (puStack_e == (undefined2 *)0x0) {
                            pcStack_c = (char *)0x66;
                            pcStack_a = (char *)0x5;
                            puStack_e = (undefined2 *)0x1;
                            pcStack_12 = (char *)0x1f52;
                            pcStack_10 = (char *)uVar21;
                            puVar19 = (undefined2 *)thunk_FUN_7e8f_02bf();
                            pcStack_c = (char *)0x92;
                            pcStack_a = (char *)0x5;
                            puStack_e = (undefined2 *)0x1;
                            pcStack_10 = (char *)0x40c1;
                            pcStack_12 = (char *)0x1f64;
                            iVar17 = thunk_FUN_7e8f_02bf();
                            pcStack_c = (char *)0x0;
                            while ((puStack_e == (undefined2 *)0x0 && ((int)pcStack_c < 0x32))) {
                              pcStack_c = (char *)0x66;
                              pcStack_a = (char *)0x5;
                              puStack_e = (undefined2 *)0x1;
                              pcStack_10 = (char *)0x40c1;
                              pcStack_12 = (char *)0x1f7d;
                              puVar19 = (undefined2 *)thunk_FUN_7e8f_02bf();
                              pcStack_c = (char *)0x92;
                              pcStack_a = (char *)0x5;
                              puStack_e = (undefined2 *)0x1;
                              pcStack_10 = (char *)0x40c1;
                              pcStack_12 = (char *)0x1f8f;
                              iVar17 = thunk_FUN_7e8f_02bf();
                              uVar20 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                              if ((*(char *)((int)puVar19 +
                                            (int)DAT_451b_002a + iVar17 * 0x70 + 0x6120) != '\n') &&
                                 (*(char *)((int)puVar19 +
                                           (int)DAT_451b_002a + iVar17 * 0x70 + 0x6120) != '\v')) {
                                puStack_e = (undefined2 *)0x1;
                              }
                            }
                          }
                          *(undefined2 **)CONCAT22(param_3,param_2) = puVar19;
                          *(int *)CONCAT22(param_5,param_4) = iVar17;
                          iVar8 = DAT_4125_02d4 + 1;
                          DAT_4125_02d4 = iVar8 % 0x10;
                          return iVar8 / 0x10;
                        }
                        pcStack_a = (char *)0xffff;
                        puStack_e = (undefined2 *)0x1;
                        pcStack_12 = (char *)s_Plant_Flag_4125_1df9 + 6;
                        pcStack_10 = (char *)uVar21;
                        puVar19 = (undefined2 *)thunk_FUN_7e8f_02bf();
                        pcStack_a = (char *)(unaff_DI + -1);
                        pcStack_c = (char *)((int)pcStack_a - unaff_DI);
                        puStack_e = (undefined2 *)((int)(undefined2 *)&DAT_4125_0000 + 1);
                        pcStack_10 = (char *)0x40c1;
                        uVar21 = 0x40c1;
                        pcStack_12 = (char *)s_Search_4125_1e13 + 4;
                        iVar17 = thunk_FUN_7e8f_02bf();
                      } while (*(char *)((int)puVar19 + (int)DAT_451b_002a + iVar17 * 0x70 + 0x6120)
                               != param_1);
                      pcStack_a = (char *)0xa;
                      pcStack_10 = (char *)0x40c1;
                      uVar21 = 0x3f67;
                      pcStack_12 = (char *)s_Build_4125_1e39 + 2;
                      puStack_e = puVar19;
                      pcStack_c = (char *)iVar17;
                      iVar8 = thunk_FUN_4c45_11f5();
                    } while (iVar8 != 0);
                    pcStack_a = (char *)0xb;
                    pcStack_10 = (char *)0x3f67;
                    uVar21 = 0x3f67;
                    pcStack_12 = (char *)0x1e4b;
                    puStack_e = puVar19;
                    pcStack_c = (char *)iVar17;
                    iVar8 = thunk_FUN_4c45_11f5();
                  } while (iVar8 != 0);
                  pcStack_a = (char *)0xb;
                  puStack_e = (undefined2 *)((int)puVar19 + -3);
                  pcStack_10 = (char *)0x3f67;
                  uVar21 = 0x3f67;
                  pcStack_12 = (char *)s_Vectoring_4125_1e5d + 3;
                  pcStack_c = (char *)iVar17;
                  iVar8 = thunk_FUN_4c45_11f5();
                } while (iVar8 != 0);
                pcStack_a = (char *)0xb;
                puStack_e = (undefined2 *)((int)puVar19 + 3);
                pcStack_10 = (char *)0x3f67;
                uVar21 = 0x3f67;
                pcStack_12 = (char *)s_Stack_4125_1e75;
                pcStack_c = (char *)iVar17;
                iVar8 = thunk_FUN_4c45_11f5();
              } while (iVar8 != 0);
              pcStack_a = (char *)0xb;
              pcStack_c = (char *)(iVar17 + -3);
              pcStack_10 = (char *)0x3f67;
              uVar20 = 0x3f67;
              pcStack_12 = (char *)s_Events_4125_1e88 + 2;
              puStack_e = puVar19;
              iVar8 = thunk_FUN_4c45_11f5();
            } while( true );
          case 0x24:
            return uVar9;
          case 0x25:
            do {
              puVar18 = puVar19;
              iVar8 = unaff_DI;
              puVar22 = puVar19;
              do {
                while( true ) {
                  do {
                    while (puVar19 = (undefined2 *)((int)puVar18 + -1), puVar18 == (undefined2 *)0x0
                          ) {
                      if ((puVar22 == (undefined2 *)0xffff) && (pcStack_a == (char *)0xffff)) {
                        if (0 < (int)uStack_14) {
                          uStack_14 = 0;
                        }
                        return uStack_14;
                      }
                      if (uVar11 != 0xfff) {
                        pcVar10 = (char *)puVar22;
                        if (pcStack_a != (char *)0xffff) {
                          pcVar10 = pcStack_a;
                        }
                        iVar8 = *(int *)(param_3 + (int)pcVar10 * 2);
                        cVar4 = ((undefined1 *)&DAT_451b_0669)
                                [*(char *)(iVar8 * 0x16 + -0x777c) * 6];
                        if (*(char *)(iVar8 * 0x16 + -0x777c) == '\x1c') {
                          uVar11 = uVar11 | 1;
                        }
                        else {
                          if (cVar4 == '\x02') {
                            uVar11 = uVar11 | 2;
                          }
                          if (cVar4 == '\x03') {
                            uVar11 = uVar11 | 4;
                          }
                          if (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar8 * 0x16 + -0x777c) * 6]
                              != '\0') {
                            uVar11 = uVar11 | 0x10;
                          }
                          if (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar8 * 0x16 + -0x777c) * 6]
                              != '\0') {
                            uVar11 = uVar11 | 0x80;
                          }
                          if (cVar4 == '\x01') {
                            uVar11 = uVar11 | 8;
                          }
                          if (((undefined1 *)&DAT_451b_0665)[*(char *)(iVar8 * 0x16 + -0x777c) * 6]
                              != '\0') {
                            uVar11 = uVar11 | 0x20;
                          }
                          if (((undefined1 *)&DAT_451b_0666)[*(char *)(iVar8 * 0x16 + -0x777c) * 6]
                              != '\0') {
                            uVar11 = uVar11 | 0x40;
                          }
                        }
                      }
                      if (pcStack_a == (char *)0xffff) {
                        *(undefined2 *)(param_5 + (int)pcStack_10 * 2) =
                             *(undefined2 *)(param_3 + (int)puVar22 * 2);
                        *(undefined2 *)(param_3 + (int)puVar22 * 2) = 0xffff;
                      }
                      else {
                        *(undefined2 *)(param_5 + (int)pcStack_10 * 2) =
                             *(undefined2 *)(param_3 + (int)pcStack_a * 2);
                        *(undefined2 *)(param_3 + (int)pcStack_a * 2) = 0xffff;
                        uStack_14 = uStack_14 + 1;
                      }
                      pcStack_10 = (char *)((int)pcStack_10 + 1);
                      pcStack_c = (char *)0xffff;
                      pcStack_a = (char *)0xffff;
                      iVar8 = -1;
                      puVar22 = (undefined2 *)0xffff;
                      puVar18 = param_2;
                    }
                    iVar17 = *(int *)(param_3 + (int)puVar19 * 2);
                    puVar18 = puVar19;
                  } while (iVar17 == -1);
                  unaff_DI = (int)*(char *)(iVar17 * 0x16 + -0x7778);
                  if ((int)pcStack_10 < 0) {
                    cVar4 = ((undefined1 *)&DAT_451b_0669)[*(char *)(iVar17 * 0x16 + -0x777c) * 6];
                    if (((uVar11 & 1) == 0) && (*(char *)(iVar17 * 0x16 + -0x777c) == '\x1c')) {
                      unaff_DI = unaff_DI + 1000;
                    }
                    else if ((int)pcStack_12 <= (int)*(char *)(iVar17 * 0x16 + -0x777a)) {
                      if (((uVar11 & 0x10) == 0) &&
                         (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar17 * 0x16 + -0x777c) * 6] !=
                          '\0')) {
                        unaff_DI = unaff_DI + 900;
                      }
                      else if (iStack_16 == 0) {
                        if (((uVar11 & 2) == 0) && (cVar4 == '\x02')) {
                          unaff_DI = unaff_DI + 800;
                        }
                        else if (((uVar11 & 4) == 0) && (cVar4 == '\x03')) {
                          unaff_DI = unaff_DI + 700;
                        }
                        else if (((uVar11 & 0x80) == 0) &&
                                (((undefined1 *)&DAT_451b_0668)
                                 [*(char *)(iVar17 * 0x16 + -0x777c) * 6] != '\0')) {
                          unaff_DI = unaff_DI + 600;
                        }
                        else if (((uVar11 & 8) == 0) && (cVar4 == '\x01')) {
                          unaff_DI = unaff_DI + 500;
                        }
                        else if (((uVar11 & 0x20) == 0) &&
                                (((undefined1 *)&DAT_451b_0665)
                                 [*(char *)(iVar17 * 0x16 + -0x777c) * 6] != '\0')) {
                          unaff_DI = unaff_DI + 400;
                        }
                        else if (((uVar11 & 0x40) == 0) &&
                                (((undefined1 *)&DAT_451b_0666)
                                 [*(char *)(iVar17 * 0x16 + -0x777c) * 6] != '\0')) {
                          unaff_DI = unaff_DI + 300;
                        }
                      }
                    }
                  }
                  else {
                    uVar11 = 0xfff;
                  }
                  if (((uVar11 & 1) != 0) && (*(char *)(iVar17 * 0x16 + -0x777c) == '\x1c')) {
                    unaff_DI = 1;
                  }
                  if (((uVar11 & 0x80) != 0) &&
                     (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar17 * 0x16 + -0x777c) * 6] != '\0'
                     )) {
                    unaff_DI = 2;
                  }
                  if (((int)*(char *)(iVar17 * 0x16 + -0x777a) < (int)pcStack_12) ||
                     (((iStack_16 != 0 &&
                       (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar17 * 0x16 + -0x777c) * 6] ==
                        '\0')) && (*(char *)(iVar17 * 0x16 + -0x777c) != '\x1c')))) break;
                  if ((int)pcStack_c < unaff_DI) {
                    pcStack_c = (char *)unaff_DI;
                    pcStack_a = (char *)puVar19;
                  }
                }
              } while (unaff_DI <= iVar8);
            } while( true );
          }
          (&stack0x6bdc)[(int)puVar19] = (&stack0x6bdc)[(int)puVar19];
          s_Production_4125_1db6._2_4_ = (undefined4)ROUND(in_ST0);
          if ((*(int *)(iVar8 + -0x777e) == unaff_SI) &&
             (*(char *)(iVar17 * 0x16 + -0x7779) != '\0')) {
            if (*(char *)(*(byte *)(unaff_SI * 0xe0) + 0x710) != '\v') {
              uVar5 = (ulong)s_Production_4125_1db6._2_4_ >> 0x10;
              uVar6 = (ulong)s_Production_4125_1db6._2_4_ >> 0x18;
              s_Production_4125_1db6[2] = (char)s_Production_4125_1db6._2_4_;
              s_Production_4125_1db6[3] = (char)((ulong)s_Production_4125_1db6._2_4_ >> 8);
              s_Production_4125_1db6[4] = (char)uVar5;
              s_Production_4125_1db6[5] = (char)uVar6;
              return 2;
            }
            if ((*(char *)((int)puVar19 * 0x1f + 0x829) != '\x01') &&
               ((*(byte *)(unaff_SI * 0xe0 + 1) & 0x40) != 0)) {
              uVar5 = (ulong)s_Production_4125_1db6._2_4_ >> 0x10;
              uVar6 = (ulong)s_Production_4125_1db6._2_4_ >> 0x18;
              s_Production_4125_1db6[2] = (char)s_Production_4125_1db6._2_4_;
              s_Production_4125_1db6[3] = (char)((ulong)s_Production_4125_1db6._2_4_ >> 8);
              s_Production_4125_1db6[4] = (char)uVar5;
              s_Production_4125_1db6[5] = (char)uVar6;
              return 2;
            }
            DAT_451b_1f02._0_2_ = iVar17 * 0x16 + -0x7780;
            DAT_451b_1f02._2_2_ = 0x2e1d;
            pcStack_a = (char *)0x5000;
            uVar20 = 0x4014;
            pcStack_c = (char *)0xc245;
            thunk_FUN_6513_0000();
            if (((*(char *)((int)puVar19 * 0x1f + 0x829) == '\x01') && (DAT_3c04_011e != 0)) &&
               (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) == 0)) {
              pcStack_a = (char *)0x1;
              pcStack_c = (char *)0x4014;
              uVar20 = 0x3f5b;
              puStack_e = (undefined2 *)0xc282;
              thunk_FUN_4974_0d7a();
            }
            if (*(char *)(iVar17 * 0x16 + -0x777c) == '\x1c') {
              for (iVar8 = 0; iVar8 < DAT_451b_1e9e; iVar8 = iVar8 + 1) {
                if (((undefined2 *)&DAT_451b_1ede)[iVar8 * 2] != 0 ||
                    *(int *)((undefined *)&DAT_451b_1ee0 + iVar8 * 4) != 0) {
                  puVar2 = (uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar8 * 2) +
                                   0xc);
                  *puVar2 = *puVar2 & 0xffbf;
                }
              }
              if ((DAT_3c04_0124 != 0) &&
                 (iVar8 = DAT_3c04_0181, *(char *)((int)puVar19 * 0x1f + 0x829) == '\x05')) {
                while (iVar17 = iVar8 + -1, iVar8 != 0) {
                  iVar8 = iVar17;
                  if (((*(char *)(iVar17 * 0x16 + -0x777b) == (char)DAT_3c04_0110) &&
                      ((*(byte *)(iVar17 * 0x16 + -0x7772) & 0xf) == 0)) &&
                     ((((undefined1 *)&DAT_451b_0668)[*(char *)(iVar17 * 0x16 + -0x777c) * 6] !=
                       '\0' && ((*(int *)(iVar17 * 0x16 + -0x7780) == 0 &&
                                (*(int *)(iVar17 * 0x16 + -0x777e) == unaff_SI)))))) {
                    puVar2 = (uint *)(iVar17 * 0x16 + -0x7774);
                    *puVar2 = *puVar2 | 0x20;
                    pcStack_a = (char *)0xffff;
                    pcStack_10 = (char *)0xc37f;
                    puStack_e = (undefined2 *)uVar20;
                    pcStack_c = (char *)iVar17;
                    thunk_FUN_57d5_0e4b();
                    uVar20 = 0x3fbd;
                  }
                }
              }
              return 2;
            }
          }
          return 0;
        }
      }
      iVar8 = 0x40c1;
    }
  } while( true );
}

