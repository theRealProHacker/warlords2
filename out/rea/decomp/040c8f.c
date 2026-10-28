
/* WARNING: Instruction at (ram,0x0007981f) overlaps instruction at (ram,0x0007981e)
    */
/* WARNING: Removing unreachable block (ram,0x00070535) */
/* WARNING: Removing unreachable block (ram,0x0007056a) */
/* WARNING: Removing unreachable block (ram,0x0007b855) */
/* WARNING: Removing unreachable block (ram,0x0007f199) */
/* WARNING: Removing unreachable block (ram,0x00077c14) */
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: stack */

char * __cdecl16far
thunk_FUN_7e8f_06de(undefined4 param_1,char *param_2,undefined4 param_3,long param_4,
                   undefined4 *param_5)

{
  int *piVar1;
  char *pcVar2;
  byte bVar3;
  code *pcVar4;
  undefined1 uVar5;
  char *pcVar6;
  int iVar7;
  undefined2 uVar8;
  char *pcVar9;
  char *pcVar10;
  uint uVar11;
  char *in_EDX;
  ulong uVar12;
  int *piVar13;
  int iVar14;
  int iVar15;
  undefined2 uVar16;
  undefined2 uVar18;
  undefined2 unaff_SS;
  bool bVar19;
  int aiStack_bbc [1369];
  char acStack_109 [121];
  undefined2 uStack_90;
  undefined2 uStack_8e;
  int aiStack_8c [2];
  char *pcStack_88;
  undefined4 uStack_86;
  undefined2 *puStack_80;
  undefined2 auStack_4c [16];
  char acStack_2c [4];
  int iStack_28;
  int iStack_26;
  int iStack_24;
  int iStack_22;
  char cStack_19;
  int iStack_18;
  int *piStack_16;
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  char *pcStack_c;
  char *pcStack_a;
  char *pcStack_8;
  char *pcStack_6;
  char *pcStack_4;
  undefined2 uVar17;
  
  DAT_451b_1cca = (char *)param_2;
  DAT_451b_1cc8 = param_2._2_2_;
  iVar7 = (int)param_1;
  pcVar6 = (char *)((ulong)param_1 >> 0x10);
  pcVar9 = (char *)FUN_170b_0006();
  if ((int)pcVar9 < 0) {
    return pcVar9;
  }
  pcVar10 = (char *)FUN_170b_00a9();
  pcStack_4 = pcVar10;
  pcStack_c = (char *)FUN_1d28_01d5();
  pcStack_a = (char *)in_EDX;
  pcStack_8 = pcStack_c;
  pcStack_6 = pcStack_a;
  FUN_170b_006d();
  FUN_22bf_07a5();
  do {
    for (; *(char *)CONCAT22(pcStack_a,pcStack_c) != '#'; pcStack_c = pcStack_c + 1) {
    }
    pcVar2 = pcStack_c + 1;
    cStack_19 = *(char *)CONCAT22(pcStack_a,pcVar2);
    pcStack_c = pcStack_c + 2;
    uVar11 = (int)*(char *)CONCAT22(pcStack_a,pcVar2) - 0x43;
  } while (0x11 < uVar11);
  piVar13 = (int *)(uVar11 * 2);
  uVar18 = 0x7000;
  uVar16 = (undefined2)((ulong)param_3 >> 0x10);
  iVar15 = (int)param_4;
  uVar17 = (undefined2)((ulong)param_4 >> 0x10);
  switch(uVar11) {
  case 0:
    thunk_FUN_7e8f_0505();
    thunk_FUN_7e8f_0505();
    FUN_255e_032f();
    pcVar9 = (char *)FUN_255e_0412();
    return pcVar9;
  case 1:
    FUN_7b71_10c7();
    FUN_7b71_0f88();
    DAT_4125_166a = 0;
    thunk_FUN_79c4_056a();
    FUN_7b71_0416();
    pcVar9 = (char *)FUN_22bf_0757();
    return pcVar9;
  case 2:
    FUN_1000_4944();
    thunk_FUN_79a9_0000();
    FUN_170b_006d();
    FUN_170b_003a();
    for (iVar7 = 0; iVar7 < 8000; iVar7 = iVar7 + 1) {
      uVar18 = (undefined2)((ulong)_DAT_451b_0520 >> 0x10);
      if (*(char *)((int)_DAT_451b_0520 + iVar7) == '|') {
        *(undefined1 *)((int)_DAT_451b_0520 + iVar7) = 0;
      }
    }
    pcVar9 = (char *)FUN_1d28_07a9();
    return pcVar9;
  case 3:
    while( true ) {
      FUN_1000_1e79();
      FUN_1997_0129();
      FUN_1000_1e79();
      FUN_1997_0129();
      thunk_FUN_7875_06ae();
      thunk_FUN_7e8f_00bf();
      pcVar9 = pcVar9 + 1;
      if ((int)pcStack_6 <= (int)pcVar9) break;
      if (pcVar6 != (char *)0x0) {
        FUN_216d_002e();
        FUN_216d_000e();
        iStack_10 = iStack_10 + -0x10;
        iStack_e = iStack_e + -0x1e;
        FUN_1000_1e79();
        FUN_1997_0129();
      }
      if ((iVar7 < 0) || (pcVar6 != (char *)0x0)) {
        FUN_1000_1d02();
        FUN_1000_1d02();
        iStack_18 = iStack_18 + -1;
        piStack_16 = (int *)((int)piStack_16 + -1);
        iStack_14 = iStack_14 + 2;
        iStack_12 = iStack_12 + 2;
        FUN_1000_1d02();
        FUN_1000_1d02();
        iStack_28 = iStack_28 + 1;
        iStack_26 = iStack_26 + 1;
        iStack_24 = iStack_24 + -2;
        iStack_22 = iStack_22 + -2;
        FUN_24d0_0002();
        FUN_216d_01fd();
        FUN_2133_02fe();
        FUN_2133_0344();
        FUN_2133_02fe();
        FUN_2133_0344();
        FUN_24d0_0002();
        FUN_2133_02fe();
        FUN_2133_0344();
        FUN_2133_02fe();
        FUN_2133_0344();
        thunk_FUN_7875_06ae();
        pcStack_8 = (char *)FUN_21e2_0a8e();
        FUN_24d0_0002();
        FUN_216d_002e();
        FUN_216d_0288();
        thunk_FUN_7e8f_00bf();
      }
      FUN_1000_1e79();
      FUN_1997_0129();
    }
    pcVar9 = (char *)FUN_22bf_0757();
    return pcVar9;
  case 4:
    while( true ) {
      FUN_1000_49ba();
      FUN_170b_006d();
      pcStack_4[(int)acStack_109] = '\0';
      pcVar9 = pcVar9 + 1;
      if ((int)pcStack_6 <= (int)pcVar9) break;
      FUN_170b_006d();
      acStack_109[4] = 0;
    }
    FUN_170b_003a();
    thunk_FUN_7875_06ae();
    FUN_22bf_07a5();
    pcStack_8 = (char *)FUN_1000_4a99();
    for (iVar7 = 0; iVar7 < (int)pcStack_8; iVar7 = iVar7 + 1) {
      if (acStack_109[iVar7 + 1] == '|') {
        acStack_109[iVar7 + 1] = '\0';
        thunk_FUN_7e8f_00d6();
      }
    }
    pcVar9 = (char *)FUN_22bf_0757();
    return pcVar9;
  case 6:
    iVar7 = thunk_FUN_7e8f_00bf();
    pcVar9 = pcVar9 + 1;
    if (DAT_4125_0e52 <= (int)pcVar9) {
      pcVar9 = (char *)FUN_7f3a_0a33();
      return pcVar9;
    }
    *piVar13 = *piVar13 + iVar7;
    (&stack0x066c)[(int)pcVar9] = (&stack0x066c)[(int)pcVar9] + (char)piVar13;
    return (char *)*(char **)pcVar9;
  case 7:
    iVar7 = 1;
    *(char **)((char *)((int)piVar13 + (int)pcVar9) + 0x16) =
         (char *)in_EDX + *(int *)((char *)((int)piVar13 + (int)pcVar9) + 0x16);
    while( true ) {
      uStack_86 = CONCAT22(0x8b23,(undefined2)uStack_86);
      FUN_21e2_0008();
      pcVar9 = pcVar9 + 1;
LAB_7875_03d7:
      if (iVar7 <= (int)pcVar9) break;
      FUN_216d_002e();
    }
    *param_5 = (char *)CONCAT22(pcStack_4,pcStack_6);
    return pcStack_6;
  case 8:
    do {
      pcVar10 = (char *)FUN_1000_4a70();
      DAT_451b_08ce = DAT_451b_08ce + 1;
      do {
        pcVar9 = pcVar9 + 1;
        if (0x15 < (int)pcVar9) {
          for (iVar7 = 0; iVar7 < 0x16; iVar7 = iVar7 + 1) {
            pcVar10 = (char *)*(int *)(iVar7 * 0x1d + 0xd02);
            if (((pcVar10 == pcVar6) &&
                (pcVar10 = (char *)*(int *)(iVar7 * 0x1d + 0xd04), pcVar10 == (char *)param_2)) &&
               (pcVar10 = (char *)0x3c04, *(char *)(iVar7 * 0x1d + 0xcff) == '\x01')) {
              ((undefined2 *)&DAT_451b_0c9c)[DAT_451b_08ce] = iVar7;
              pcVar10 = (char *)FUN_1000_4a70();
              DAT_451b_08ce = DAT_451b_08ce + 1;
            }
          }
          return pcVar10;
        }
        pcVar10 = (char *)0x3c04;
      } while ((*(char *)((int)pcVar9 * 0x1d + 0xcff) != '\x03') ||
              (pcVar10 = (char *)0x3c04, *(int *)((int)pcVar9 * 0x1d + 0xd00) != 0));
      ((undefined2 *)&DAT_451b_0c9c)[DAT_451b_08ce] = pcVar9;
    } while( true );
  case 9:
    do {
      while( true ) {
        while (pcVar6 = pcStack_6 + -1, pcStack_6 == (char *)0x0) {
          if (pcStack_4 == (char *)0x0) {
            pcStack_6 = (char *)0xffff;
            pcStack_4 = (char *)0xffff;
            pcStack_a = pcVar9;
            for (; (int)pcVar9 < 6; pcVar9 = pcVar9 + 1) {
              uStack_86 = 0x584125;
              pcStack_88 = (char *)0x342a;
              aiStack_8c[1] = DAT_3c04_0110;
              aiStack_8c[0] = -1;
              uStack_90 = 0x6d90;
              uStack_8e = uVar18;
              thunk_FUN_85d0_08be();
              uVar18 = 0x40f9;
            }
            pcVar9 = (char *)FUN_22bf_0757();
            return pcVar9;
          }
          pcStack_6 = DAT_3c04_0181;
          pcStack_4 = pcStack_4 + -1;
        }
        pcStack_6 = pcVar6;
        if (*(char *)((int)pcVar6 * 0x16 + -0x777c) != '\x1c') break;
        if ((*(char *)((int)pcVar6 * 0x16 + -0x777b) == DAT_3c04_0110) &&
           (uVar12 = 0x3c04,
           (char *)(*(byte *)(*(char *)((int)pcVar6 * 0x16 + -0x7776) + 0x5e3) & 3) == pcStack_4)) {
          iVar7 = (int)*(char *)((int)pcVar6 * 0x16 + -0x7776);
          if (pcStack_4 == (char *)((int)(undefined2 *)&DAT_4125_0002 + 1)) {
            pcStack_8 = (char *)(DAT_3c04_0110 + 2);
          }
          else {
            pcStack_8 = (char *)((int)(undefined2 *)&DAT_4125_0000 + 1);
          }
          uStack_86 = 0x584125;
          pcStack_88 = (char *)0x342a;
          aiStack_8c[1] = DAT_3c04_0110;
          aiStack_8c[0] = 0x1c;
          uStack_90 = 0x6bb0;
          uStack_8e = uVar18;
          thunk_FUN_85d0_08be();
          thunk_FUN_7e8f_00bf();
          thunk_FUN_7e8f_04f0();
          thunk_FUN_7e8f_00bf();
          FUN_1000_4944();
          thunk_FUN_7e8f_00d6();
          iVar15 = 0x3c04;
          pcVar6 = (char *)0x3c04;
          bVar3 = *(byte *)(iVar7 + 0x5e3);
          uVar11 = bVar3 & 3;
          if (uVar11 < 4) {
            piVar13 = (int *)(uVar11 * 2);
            bVar19 = (bVar3 & 3) == 0;
            switch(uVar11) {
            case 0:
              uVar5 = in((int)uVar12);
              return (char *)(char *)CONCAT31(0x3c,uVar5);
            case 1:
              if (bVar19) {
                do {
                } while( true );
              }
              FUN_170b_004e();
              FUN_170b_003a();
              FUN_1d28_050d();
              if ((char *)param_2 == (char *)0x0) {
                thunk_FUN_621e_0da9();
              }
              FUN_170b_003a();
              pcVar9 = (char *)FUN_22bf_0757();
              return pcVar9;
            case 2:
              if (CARRY2((uint)&stack0xfffe,(uint)pcVar10) ||
                  &stack0xfffe + (int)pcVar10 == (undefined1 *)0x0) {
                pcVar6 = *(char **)(char *)((int)&iStack_e + (int)pcVar10);
              }
              else {
                piVar1 = (int *)(&stack0xfffe + (int)pcVar10 + iVar7 + -0xbba);
                *piVar1 = *piVar1 + -1;
              }
              return pcVar6;
            case 3:
              iVar7 = 0;
              if (pcVar10 != (char *)((int)(undefined2 *)&DAT_4125_0000 + 1)) {
                if (bVar19) {
                  pcStack_4 = (char *)*DAT_451b_1d82;
                }
                else {
                  pcStack_4 = (char *)0x7;
                }
                iVar7 = 0;
                while( true ) {
                  uVar18 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
                  if (6 < iVar7) break;
                  piVar1 = (int *)DAT_451b_1d82 + iVar7;
                  *piVar1 = *piVar1 - (int)pcStack_4;
                  iVar7 = iVar7 + 1;
                }
                DAT_4125_2a49 = ((int *)DAT_451b_1d82)[DAT_451b_1d86];
                func_0x0008fd36();
                FUN_7f3a_0d45();
                pcVar9 = (char *)func_0x0008fe26();
                return pcVar9;
              }
            }
            goto code_r0x0007ffd3;
          }
          thunk_FUN_7e8f_00d6();
          FUN_1000_4944();
          thunk_FUN_7e8f_00d6();
          FUN_1000_4944();
          uVar18 = 0x40c1;
          thunk_FUN_7e8f_00d6();
          pcVar9 = pcVar9 + 1;
        }
      }
    } while( true );
  case 10:
    FUN_1000_1d02();
    FUN_1997_034a();
    uStack_86 = DAT_4125_1050;
    pcStack_88 = (char *)0x4125;
    aiStack_8c[1] = 0x54a8;
    aiStack_8c[0] = 0x1997;
    uStack_8e = 0x4214;
    (*DAT_451b_2a68)();
    thunk_FUN_7875_06ae();
    FUN_4058_0089();
    thunk_FUN_7e8f_00d6();
    uStack_86 = CONCAT22(0x342a,DAT_3c04_0110);
    aiStack_8c[1] = 0x40c1;
    aiStack_8c[0] = 0x427a;
    pcStack_88 = pcVar9;
    thunk_FUN_85d0_08be();
    FUN_1000_4944();
    thunk_FUN_7e8f_0103();
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf();
    FUN_1000_4944();
    thunk_FUN_7e8f_0103();
    FUN_1000_4944();
    pcVar6 = (char *)thunk_FUN_7e8f_00bf();
    if ((((undefined1 *)&DAT_451b_0664)[(int)pcVar9 * 6] != '\0') ||
       ((((((undefined1 *)&DAT_451b_0665)[(int)pcVar9 * 6] != '\0' &&
          (((undefined1 *)&DAT_451b_0666)[(int)pcVar9 * 6] != '\0')) ||
         (((undefined1 *)&DAT_451b_0665)[(int)pcVar9 * 6] != '\0')) ||
        (((undefined1 *)&DAT_451b_0666)[(int)pcVar9 * 6] != '\0')))) {
      uStack_86 = 0x40c1436b;
      pcVar6 = (char *)(*DAT_451b_2a74)();
    }
    return pcVar6;
  case 0xb:
    pcStack_8[8] = pcVar9[uVar11 * 0x82 + 0x159b] + '\x02';
    pcStack_8[9] = (char)param_1;
    pcStack_8[10] = '\0';
    pcStack_8[0xb] = pcVar9[iVar7 * 0x41 + 0x15a3] / '\x02';
    *(undefined1 *)(iVar7 * 0x41 + 0x15aa) = 0;
    ((char *)CONCAT22(pcStack_6,pcStack_8))[0] = -1;
    ((char *)CONCAT22(pcStack_6,pcStack_8))[1] = -1;
    (pcStack_8 + 2)[0] = -1;
    (pcStack_8 + 2)[1] = -1;
    pcStack_8[0xf] = pcStack_8[0xf] & 1;
    pcStack_8[0xf] = pcStack_8[0xf];
    pcStack_8[0x10] = 'e';
    return pcStack_8;
  case 0xc:
    pcStack_a = (char *)0x0;
    pcStack_8 = (char *)0x0;
    iStack_e = 0;
    for (iVar7 = 0; (iStack_e == 0 && (iVar7 < DAT_451b_0886)); iVar7 = iVar7 + 1) {
      if (((char *)*(int *)((int)*(undefined4 *)(pcStack_6 + 0x19) + iVar7 * 6) == pcVar9) &&
         ((*(int *)((int)*(undefined4 *)(pcStack_6 + 0x19) + iVar7 * 6 + 2) == 1 &&
          (*(int *)((int)*(undefined4 *)(pcStack_6 + 0x19) + iVar7 * 6 + 4) == param_2._2_2_)))) {
        iStack_e = 1;
      }
    }
    if (iStack_e == 0) {
      pcStack_c = (char *)(DAT_451b_0886 + -1);
      iStack_12 = (int)*(undefined4 *)(pcStack_6 + 0x19);
      iStack_10 = (int)((ulong)*(undefined4 *)(pcStack_6 + 0x19) >> 0x10);
      iStack_14 = *(int *)(pcStack_6 + 0x1b);
      piStack_16 = (int *)(*(int *)(pcStack_6 + 0x19) + (int)pcStack_c * 6);
      if (*(char **)CONCAT22(iStack_14,piStack_16) != pcVar9) {
        *(char **)CONCAT22(iStack_14,piStack_16) = pcVar9;
        FUN_7875_0839();
      }
      if (piStack_16[1] != 1) {
        piStack_16[1] = 1;
        FUN_7875_0839();
      }
      if (piStack_16[2] != param_2._2_2_) {
        piStack_16[2] = param_2._2_2_;
        FUN_7875_0839();
      }
      DAT_3ef3_0000 = CONCAT22(pcStack_8,pcStack_a);
    }
    else {
      DAT_3ef3_0000 = 0;
    }
    pcVar9 = (char *)FUN_24b0_01f0();
    return pcVar9;
  case 0xd:
    thunk_FUN_7e8f_04f0();
    FUN_1000_4944();
    uVar18 = 0x40c1;
    thunk_FUN_7e8f_00bf();
    if ((*(char *)(*(byte *)(*(int *)((int)DAT_4125_0e98 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)((int)DAT_4125_0e98 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
       ((DAT_3c04_0132 == 0 || (*(char *)((int)DAT_4125_0e98 * 0x41 + 0x1592) == DAT_3c04_0110)))) {
      for (iVar7 = 0; iVar7 < 4; iVar7 = iVar7 + 1) {
        uStack_86 = CONCAT22((int)*(char *)((int)DAT_4125_0e98 * 0x41 + iVar7 + 0x1593),uVar18);
        uVar18 = 0x40f9;
        pcStack_88 = (char *)0x27b9;
        thunk_FUN_85d0_08be();
      }
    }
    else {
      FUN_24d0_0002();
      FUN_216d_002e();
      FUN_216d_01fd();
      FUN_216d_002e();
      FUN_24d0_02e5();
      FUN_216d_002e();
      FUN_216d_000e();
      FUN_1000_1e79();
      FUN_1997_0129();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
    }
    iVar7 = 0;
    do {
      if (7 < iVar7) {
LAB_71d6_0c8b:
        FUN_71d6_1f06();
        for (iVar7 = 0; iVar7 < 3; iVar7 = iVar7 + 1) {
          thunk_FUN_7e8f_00bf();
        }
        pcVar9 = (char *)FUN_71d6_1a88();
        return pcVar9;
      }
      if ((*(int *)((int)DAT_4125_0e98 * 0x41 + 0x157d) == *(int *)(iVar7 * 0x14 + 0x193)) &&
         (*(int *)((int)DAT_4125_0e98 * 0x41 + 0x157f) == *(int *)(iVar7 * 0x14 + 0x195))) {
        thunk_FUN_85d0_0bf7();
        goto LAB_71d6_0c8b;
      }
      iVar7 = iVar7 + 1;
    } while( true );
  case 0xe:
    FUN_1000_4944();
    iVar7 = FUN_197b_0005();
    if (iVar7 == 0) {
      FUN_1000_4944();
      thunk_FUN_79a9_0000();
    }
    FUN_1000_4944();
    uStack_86 = 0x10008850;
    iVar7 = FUN_7875_03ea();
    if (iVar7 == 0) {
      FUN_1000_4944();
      thunk_FUN_79a9_0000();
    }
    pcVar6 = (char *)in_EDX;
    if (param_4 != 0) {
      pcStack_a = *(char **)((char *)param_2 + 2);
      pcStack_c = *(char **)((char *)param_2 + 0xd);
      DAT_4125_12d2 = 0;
      iVar7 = FUN_2012_01fe();
      if (iVar7 == 0) {
        thunk_FUN_79a9_0000();
      }
      uVar18 = 0x2012;
      iVar7 = FUN_2012_0232();
      if (iVar7 == 0) {
        uVar18 = 0x4096;
        thunk_FUN_79a9_0000();
      }
      if ((DAT_4125_12d4 != 0) && ((DAT_4125_12ff & 10) == 0)) {
        for (iVar7 = 0; iVar7 < (int)(uint)DAT_4125_12fe; iVar7 = iVar7 + 1) {
          uVar18 = 0x1d28;
          uVar8 = FUN_1d28_069a();
          ((undefined2 *)&DAT_4125_12e6)[iVar7 * 2] = (char *)in_EDX;
          ((undefined2 *)&DAT_4125_12e4)[iVar7 * 2] = uVar8;
        }
      }
      if ((*(long *)(iVar15 + 10) != 0) && ((*(uint *)(iVar15 + 0x35) & 10) == 0)) {
        for (iVar7 = 0; iVar7 < (int)(uint)*(byte *)(iVar15 + 0x34); iVar7 = iVar7 + 1) {
          uVar18 = 0x1d28;
          uVar8 = FUN_1d28_069a();
          iVar14 = iVar15 + iVar7 * 4;
          *(undefined2 *)(iVar14 + 0x1c) = (char *)in_EDX;
          *(undefined2 *)(iVar14 + 0x1a) = uVar8;
        }
      }
      if ((*(long *)((int)param_3 + 10) != 0) && ((*(uint *)((int)param_3 + 0x35) & 10) == 0)) {
        for (iVar7 = 0; iVar7 < (int)(uint)*(byte *)((int)param_3 + 0x34); iVar7 = iVar7 + 1) {
          uVar18 = 0x1d28;
          uVar8 = FUN_1d28_069a();
          iVar14 = (int)param_3 + iVar7 * 4;
          *(undefined2 *)(iVar14 + 0x1c) = (char *)in_EDX;
          *(undefined2 *)(iVar14 + 0x1a) = uVar8;
        }
      }
      uStack_86 = param_3;
      aiStack_8c[1] = -0x762d;
      pcStack_88 = (char *)uVar18;
      (*DAT_451b_2a74)();
      FUN_251d_00cf();
      if ((*(long *)(iVar15 + 10) != 0) && ((*(uint *)(iVar15 + 0x35) & 10) == 0)) {
        for (iVar7 = 0; iVar7 < (int)(uint)*(byte *)(iVar15 + 0x34); iVar7 = iVar7 + 1) {
          FUN_1d28_07a9();
        }
      }
      pcVar6 = (char *)in_EDX;
      if ((*(long *)((int)param_3 + 10) != 0) && ((*(uint *)((int)param_3 + 0x35) & 10) == 0)) {
        for (iVar7 = 0; pcVar6 = (char *)in_EDX, iVar7 < (int)(uint)*(byte *)((int)param_3 + 0x34);
            iVar7 = iVar7 + 1) {
          FUN_1d28_07a9();
        }
      }
      FUN_2012_0975();
    }
    iVar7 = *(int *)((char *)param_2 + 0xf);
    FUN_1d28_011f();
    pcStack_6 = (char *)FUN_1d28_075d();
    pcVar9 = (char *)0x0;
    pcStack_4 = pcVar6;
    goto LAB_7875_03d7;
  case 0xf:
    *(int *)((int)piVar13 + 0x185) =
         *(int *)((int)piVar13 + 0x185) - *(int *)((char *)in_EDX + (int)DAT_451b_051c + 0x1e);
    FUN_705a_11e2();
    if ('\0' < *(char *)((int)DAT_4125_0e98 * 0x41 + 0x15aa)) {
      bVar19 = false;
      for (iVar7 = 0; iVar7 < 4; iVar7 = iVar7 + 1) {
        if ((char *)(int)*(char *)((int)DAT_4125_0e98 * 0x41 + iVar7 + 0x1593) == pcStack_4) {
          bVar19 = true;
          break;
        }
      }
      if (!bVar19) {
        *(undefined1 *)((int)DAT_4125_0e98 * 0x41 + 0x15aa) = 0;
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + (int)DAT_4125_0e98 * 0x41) = 0;
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + (int)DAT_4125_0e98 * 0x41) = 0xffff;
        *(undefined2 *)((int)DAT_4125_0e98 * 0x41 + 0x15b2) = 0xffff;
        *(undefined1 *)((int)DAT_4125_0e98 * 0x41 + 0x15a9) = 0xff;
      }
    }
    if ((DAT_4125_0e86 < 3) &&
       (*(char *)((int)DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1594) < '\0')) {
      DAT_4125_0e86 = DAT_4125_0e86 + 1;
    }
    pcVar9 = (char *)0x3c04;
    if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
      FUN_705a_09da();
      pcVar9 = (char *)FUN_705a_0dae();
    }
    return pcVar9;
  case 0x10:
    out(0x5c,(char)uVar11);
code_r0x00080001:
    DAT_4125_2a49 = ((int *)DAT_451b_1d82)[uVar11];
    func_0x0008fd36();
code_r0x00080017:
    FUN_7f3a_0d45();
    pcVar9 = (char *)func_0x0008fe26();
    return pcVar9;
  case 0x11:
    iVar7 = thunk_FUN_85d0_15ff();
    if ((iVar7 == 0) && (iVar7 = thunk_FUN_85d0_15ff(), iVar7 == 0)) {
      pcVar6 = (char *)0x0;
    }
    else if ((DAT_4125_0e92 == 0) && ((DAT_4125_0e98 == pcVar9 && (DAT_4125_166a != 0)))) {
      pcVar6 = (char *)FUN_71d6_03a9();
    }
    else {
      DAT_4125_0e9a = *(undefined2 *)((int)pcVar9 * 0x41 + 0x157d);
      pcVar6 = (char *)*(undefined2 *)((int)pcVar9 * 0x41 + 0x157f);
      DAT_4125_0e98 = pcVar9;
      DAT_4125_0e9c = pcVar6;
      if (-1 < (int)pcVar9) {
        DAT_4125_0e92 = 0;
        FUN_22bf_07a5();
        FUN_71d6_06de();
        FUN_71d6_1a9b();
        thunk_FUN_79c4_056a();
        DAT_4125_166a = 1;
        FUN_71d6_03a9();
        FUN_22bf_0757();
        pcVar6 = (char *)0x3c04;
        if (DAT_3c04_012e != 0) {
          if ((DAT_3c04_0134 >> 1 & 1) == 0) {
            DAT_3c04_0134 = DAT_3c04_0134 | 2;
            thunk_FUN_7e8f_0505();
            thunk_FUN_8027_168d();
          }
          pcVar6 = (char *)((uint)(CONCAT31(0x3c,DAT_3c04_0134) >> 5) & 1);
          if (((DAT_3c04_0134 & 0x20) == 0) &&
             (pcVar6 = (char *)0x3c04, 1 < (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110])) {
            DAT_3c04_0134 = DAT_3c04_0134 | 0x20;
            thunk_FUN_7e8f_0505();
            pcVar6 = (char *)thunk_FUN_8027_168d();
          }
        }
      }
    }
    return pcVar6;
  }
  if (iVar7 == 0) {
    uStack_86._2_2_ = (char *)s_standard_pal_4125_1f14;
  }
  else if (iVar7 == 1) {
    uVar18 = 0x1000;
    FUN_1000_4944();
    uStack_86._2_2_ = acStack_2c;
  }
  else {
    if (iVar7 != 2) goto LAB_7ae8_007f;
    uStack_86._2_2_ = (char *)s_black_pal_4125_1f21;
  }
  puStack_80 = auStack_4c;
  uStack_86 = CONCAT22(uStack_86._2_2_,uVar18);
  pcStack_88 = (char *)0xaefc;
  FUN_7ae8_0229();
LAB_7ae8_007f:
  for (iVar7 = 0x10; iVar15 = iVar7 + -1, iVar7 != 0; iVar7 = iVar7 + 2) {
    if (iVar15 == 6) {
      pcStack_4 = (char *)puStack_80;
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + -0x10];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + 1];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
    }
    else if (iVar15 < 8) {
      pcStack_4 = (char *)aiStack_8c[iVar15];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + -0x10];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + 1];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
    }
    else {
      pcStack_4 = (char *)aiStack_8c[iVar15];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + -0x10];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
      pcStack_4 = (char *)auStack_4c[iVar7 + 1];
      pcVar4 = (code *)swi(0x3b);
      (*pcVar4)();
      pcVar4 = (code *)swi(0x38);
      (*pcVar4)();
      FUN_1000_1b57();
    }
    puStack_80 = (undefined2 *)0xb063;
    FUN_7ae8_01f3();
  }
  return (char *)0x0;
code_r0x0007ffd3:
  *(int *)((int)piVar13 + (int)uVar12) = iVar15;
  iVar15 = iVar7;
  while( true ) {
    iVar7 = iVar15 + 1;
    if (6 < iVar7) {
      DAT_451b_1d86 = DAT_451b_1d86 + -1;
      if (-1 < DAT_451b_1d86) goto code_r0x00080017;
      DAT_451b_1d86 = 0;
      uVar11 = 0;
      goto code_r0x00080001;
    }
    piVar13 = (int *)DAT_451b_1d82;
    pcVar6 = (char *)((ulong)DAT_451b_1d82 >> 0x10);
    if (iVar7 < 6) break;
    piVar13[iVar7] = piVar13[iVar7] + 1;
    iVar15 = iVar7;
  }
  iVar15 = piVar13[iVar15 + 2];
  uVar12 = (ulong)(uint)(iVar7 * 2);
  goto code_r0x0007ffd3;
}

