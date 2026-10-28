
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Instruction at (ram,0x00088e2f) overlaps instruction at (ram,0x00088e2e)
    */
/* WARNING (jumptable): Unable to track spacebase fully for stack */
/* WARNING: Unable to track spacebase fully for stack */

char * FUN_85d0_0723(undefined2 param_1,uint param_2,undefined2 param_3,undefined2 param_4,
                    undefined2 param_5,undefined2 param_6)

{
  byte *pbVar1;
  bool bVar2;
  bool bVar3;
  byte bVar4;
  int iVar5;
  char *in_AX;
  char *pcVar6;
  int in_CX;
  uint uVar7;
  int iVar8;
  int iVar9;
  undefined2 *puVar10;
  int unaff_BP;
  char *unaff_SI;
  int iVar11;
  int unaff_DI;
  undefined2 unaff_ES;
  int iVar12;
  undefined2 uVar13;
  undefined2 unaff_SS;
  undefined4 in_stack_00000016;
  int in_stack_0000001a;
  undefined1 auStack_58 [54];
  undefined2 uStack_22;
  undefined2 uStack_20;
  undefined1 auStack_1e [4];
  int aiStack_1a [4];
  undefined4 uStack_12;
  char *pcStack_e;
  int in_stack_0000fff4;
  int iVar14;
  int iStack_8;
  int iStack_6;
  int in_stack_0000fffc;
  
  if ((((DAT_4125_2a86 == 0) || (DAT_4125_166a != 0)) || (DAT_4125_1174 != 0)) ||
     ((DAT_4125_1172 != 0 || (DAT_4125_1176 != 0)))) {
    return in_AX;
  }
  if (7 < param_2) {
    FUN_85d0_0629();
    pcVar6 = (char *)thunk_FUN_8027_0174();
    return pcVar6;
  }
  iVar9 = param_2 * 2;
  iVar5 = -0x8000;
  switch(param_2) {
  case 0:
    for (; unaff_DI < DAT_3c04_157b; unaff_DI = unaff_DI + 1) {
      if (*(char *)(*(byte *)(*(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                             *(int *)(unaff_DI * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
        in_stack_0000fffc = in_stack_0000fffc + 1;
      }
    }
    iStack_6 = 0;
    iVar11 = 0;
    bVar2 = true;
    bVar3 = false;
    iVar9 = 8;
    while (iVar8 = iVar9 + -1, iVar9 != 0) {
      if (*(int *)(iVar8 * 2 + 0x137) != 0) {
        bVar2 = false;
      }
      if ((*(int *)(iVar8 * 2 + 0xd0) == 0) && (*(int *)(iVar8 * 2 + 0x137) == 0)) {
        bVar3 = true;
        *(undefined2 *)(iVar8 * 2 + 0xd0) = 1;
      }
      if ((*(int *)(iVar8 * 2 + 0x137) != 0) && (*(int *)(iVar8 * 2 + 0xd0) == 0)) {
        bVar3 = true;
        iVar11 = iVar11 + 1;
        iStack_8 = iVar8;
      }
      iVar9 = iVar8;
      if ((*(int *)(iVar8 * 2 + 0x137) != 0) && (*(int *)(iVar8 * 2 + 0xd0) == 1)) {
        iStack_6 = iStack_6 + 1;
      }
    }
    iVar9 = iVar8;
    if (bVar2) {
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)0x1e92;
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)0x1e9b;
      FUN_8027_1160();
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)s_End_Turn_4125_1eb7 + 2;
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)0x1ec2;
      iVar9 = iVar8;
      FUN_8027_1160();
      in_stack_0000fffc = 0x40c1;
      iVar5 = 0x1a4c;
      iStack_6 = 0x1eca;
      FUN_1a4c_02b5();
      iStack_8 = iVar8;
    }
    if (((DAT_3c04_015b == 0) && (iVar11 == 0)) && (bVar3)) {
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)s_Cannot_allocate_this_newbm_4125_1ef6 + 1;
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)0x1f00;
      FUN_8027_1160();
      iStack_6 = thunk_FUN_7e8f_04f0();
      iVar5 = 0x40c1;
      pcStack_e = (char *)s_standard_pal_4125_1f14 + 10;
      iStack_8 = iVar9;
      thunk_FUN_7e8f_04f0();
      pcStack_e = (char *)s_black_pal_4125_1f21 + 6;
      FUN_8027_1160();
      in_stack_0000fffc = iVar9;
    }
    if (((DAT_3c04_015b == 0) && (iVar11 == 1)) &&
       ((iStack_6 == 0 && (in_stack_0000fffc / 2 < (int)((undefined2 *)&DAT_451b_1e8a)[iStack_8]))))
    {
      DAT_3c04_015b = 1;
      iStack_6 = 0x2b01;
      iStack_8 = 0;
      pcStack_e = (char *)0x0;
      uStack_12 = CONCAT22(iVar5,0x1f74);
      thunk_FUN_6d27_1244();
    }
    if (((DAT_3c04_015b == 0) && (iVar11 == 0)) && (iStack_6 == 1)) {
      DAT_3c04_015b = 1;
      iVar5 = 0;
      while ((iVar5 < 8 && (*(int *)(iVar5 * 2 + 0x137) == 0))) {
        iVar5 = iVar5 + 1;
      }
      pcStack_e = (char *)0x1fc9;
      thunk_FUN_7e8f_04f0();
      pcStack_e = auStack_58;
      uStack_12 = 0x40c11fd8;
      FUN_1000_4944();
      FUN_8027_10fb();
      *(undefined2 *)(iVar5 * 2 + 0xd0) = 0;
      iStack_6 = 0x2b02;
      iStack_8 = 0;
      uStack_12 = 0x10002006;
      pcStack_e = (char *)iVar5;
      thunk_FUN_6d27_1244();
    }
    pcVar6 = (char *)0x3c04;
    if ((((DAT_3c04_015b == 0) && (iVar11 == 1)) && (0 < iStack_6)) && (DAT_3c04_015d == 0)) {
      iVar5 = 0;
      for (iVar9 = 0; iVar9 < 8; iVar9 = iVar9 + 1) {
        if (((*(int *)(iVar9 * 2 + 0x137) != 0) && (*(int *)(iVar9 * 2 + 0xd0) == 1)) &&
           (iVar5 < (int)((undefined2 *)&DAT_451b_1e8a)[iVar9])) {
          iVar5 = ((undefined2 *)&DAT_451b_1e8a)[iVar9];
        }
      }
      pcVar6 = (char *)(DAT_3c04_157b / 2);
      if (((int)pcVar6 < (int)((undefined2 *)&DAT_451b_1e8a)[iStack_8]) &&
         (pcVar6 = (char *)(DAT_3c04_157b / 8),
         (int)(pcVar6 + iVar5) < (int)((undefined2 *)&DAT_451b_1e8a)[iStack_8])) {
        pcVar6 = (char *)0x3c04;
        DAT_3c04_015d = 1;
      }
    }
    return pcVar6;
  case 2:
    do {
      iVar5 = *(int *)(iVar9 + 0x157f) * 0xe0 + *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar5 + 3);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar5 + 3);
      *pbVar1 = *pbVar1 | (byte)in_AX;
      bVar4 = *(byte *)(unaff_DI * 0x41 + 0x1592);
      iVar5 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 + *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar5 + 0xe3);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar5 + 0xe3);
      *pbVar1 = *pbVar1 | bVar4 & 0xf;
      iVar5 = unaff_DI;
      do {
        unaff_DI = iVar5 + -1;
        if (iVar5 == 0) {
          pcVar6 = (char *)0x0;
          for (iVar5 = 0; iVar5 < 0x70; iVar5 = iVar5 + 1) {
            for (iVar9 = 0; iVar9 < 0x9c; iVar9 = iVar9 + 1) {
              pcVar6 = (char *)0x0;
              if (((*(byte *)(iVar9 * 0xe0 + iVar5 * 2 + 1) & 0x20) != 0) &&
                 (pcVar6 = (char *)((*(byte *)(iVar9 * 0xe0 + iVar5 * 2 + 1) & 0x10) >> 4),
                 pcVar6 == (char *)0x0)) {
                pcVar6 = (char *)0x2e1d;
                pbVar1 = (byte *)(iVar9 * 0xe0 + iVar5 * 2 + 1);
                *pbVar1 = *pbVar1 & 0xdf;
              }
            }
          }
          return pcVar6;
        }
        iVar5 = unaff_DI;
      } while (*(char *)(unaff_DI * 0x41 + 0x1592) == '\x0f');
      bVar4 = *(byte *)(unaff_DI * 0x41 + 0x1592);
      iVar5 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 + *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar5 + 1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar5 + 1);
      *pbVar1 = *pbVar1 | bVar4 & 0xf;
      bVar4 = *(byte *)(unaff_DI * 0x41 + 0x1592);
      iVar5 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 + *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar5 + 0xe1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar5 + 0xe1);
      *pbVar1 = *pbVar1 | bVar4 & 0xf;
      in_AX = (char *)((int)*(char *)(unaff_DI * 0x41 + 0x1592) & 0xf);
      iVar9 = unaff_DI * 0x41;
      unaff_ES = 0x3c04;
    } while( true );
  case 3:
    thunk_FUN_7875_06ae();
    FUN_1000_1e79();
    FUN_1997_0129();
    FUN_1000_4944();
    param_1 = (undefined2)DAT_4125_30a2;
    thunk_FUN_7e8f_00bf();
    param_1 = 0x9ff9;
    FUN_1000_1e79();
    param_1 = 0x1000;
    FUN_1997_0129();
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf();
    FUN_1000_1e79();
    FUN_1997_0129();
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf();
    FUN_1000_1e79();
    FUN_1997_0129();
    FUN_1000_4944();
    pcVar6 = (char *)thunk_FUN_7e8f_00bf();
    return pcVar6;
  case 4:
    DAT_4125_2a49 = ((undefined2 *)DAT_451b_1d82)[(int)in_AX];
    *(undefined2 *)(unaff_BP + -2) = 1;
    *(undefined2 *)(unaff_BP + -4) = 0x8000;
    puVar10 = (undefined2 *)(unaff_BP + -6);
    *(undefined2 *)(unaff_BP + -6) = 0x15;
    func_0x0008fd36();
    *puVar10 = 0x8000;
    puVar10[-1] = 0x1b;
    FUN_7f3a_0d45();
    *puVar10 = 0x8000;
    puVar10[-1] = 0x1f;
    pcVar6 = (char *)func_0x0008fe26();
    return pcVar6;
  case 5:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 6:
    unaff_SI[(int)&stack0x0000] = unaff_SI[(int)&stack0x0000] + (char)iVar9;
    *unaff_SI = *unaff_SI << 1;
    pcStack_e = (char *)0x8000;
    uStack_12 = CONCAT22(0x11c,(undefined2)uStack_12);
    FUN_216d_002e();
    FUN_216d_0288();
    DAT_4125_2a4b = *DAT_451b_1d82;
    for (iVar5 = 0; iVar5 < 7; iVar5 = iVar5 + 1) {
      if (-1 < (int)((undefined2 *)DAT_451b_1d82)[iVar5]) {
        thunk_FUN_7875_06ae();
        thunk_FUN_7e8f_00bf();
      }
    }
    pcVar6 = (char *)FUN_22bf_0757();
    return pcVar6;
  case 7:
    FUN_18a9_066e();
    FUN_18a9_066e();
    iVar5 = thunk_FUN_899d_0567();
    if (iVar5 == 0) {
      FUN_18a9_066e();
      FUN_18a9_03b3();
    }
    else {
      FUN_18a9_03b3();
      FUN_18a9_066e();
    }
    for (iVar5 = 0; iVar5 < 8; iVar5 = iVar5 + 1) {
      FUN_18a9_066e();
    }
    for (iVar5 = 0; iVar5 < 8; iVar5 = iVar5 + 1) {
      if (iVar5 < DAT_4125_30f6) {
        FUN_18a9_066e();
        FUN_18a9_066e();
      }
      else {
        FUN_18a9_03b3();
        FUN_18a9_03b3();
      }
    }
    if (DAT_3c04_011c == 0) {
      FUN_18a9_066e();
      FUN_18a9_03b3();
      FUN_18a9_03b3();
    }
    else {
      if ((*(byte *)(DAT_3c04_0110 * 9 + 0x153b) & 0x10) == 0) {
        FUN_18a9_03b3();
        FUN_18a9_03b3();
      }
      else if ((*(byte *)(DAT_3c04_0110 * 9 + 0x153b) & 0x20) == 0) {
        FUN_18a9_03b3();
        FUN_18a9_03b3();
      }
      else {
        FUN_18a9_03b3();
        FUN_18a9_03b3();
      }
      FUN_18a9_05f0();
    }
    FUN_8027_0519();
    pcVar6 = (char *)thunk_FUN_544d_00aa();
    return pcVar6;
  }
  pcVar6 = (char *)CONCAT11((char)((int)in_AX % (int)*(char *)(iVar9 + -0x2f)),
                            (char)((int)in_AX / (int)*(char *)(iVar9 + -0x2f)));
  while (unaff_DI = unaff_DI + 1, unaff_DI < 8) {
    iVar9 = iVar5;
    for (iVar11 = 8; iVar5 = iVar9, 0 < iVar11; iVar11 = iVar11 + -1) {
      in_CX = 8;
      pcStack_e = (char *)0x8e2c;
      pcVar6 = (char *)FUN_1000_1d02();
      iVar9 = 0x1000;
      in_stack_0000fff4 = iVar5;
    }
  }
  for (iVar5 = 0; iVar5 < 9; iVar5 = iVar5 + 1) {
    ((undefined1 *)&DAT_451b_22c1)[iVar5 * 0x48] =
         ((undefined1 *)&DAT_451b_22c1)[iVar5 * 0x48] & 0xfe;
  }
  for (iVar9 = 0; iVar9 < 9; iVar9 = iVar9 + 1) {
    ((undefined1 *)&DAT_451b_2281)[iVar9 * 8] = ((undefined1 *)&DAT_451b_2281)[iVar9 * 8] & 0xfe;
  }
  if (7 < param_2) {
    return pcVar6;
  }
  uVar13 = 0x8000;
  switch(param_2) {
  case 0:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 1:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 2:
switchD_8000_90a5_caseD_2:
    pcStack_e = (char *)0x20;
    uStack_12 = CONCAT22(iVar9,iVar5);
    aiStack_1a[2] = 0x57e2;
    aiStack_1a[3] = 0x4125;
    aiStack_1a[0] = 0x6836;
    aiStack_1a[1] = uVar13;
    pcVar6 = (char *)(*DAT_451b_2a74)();
LAB_85d0_0b39:
    if (-1 < (int)param_2) {
      FUN_1997_034a();
      iVar5 = (int)param_2 % 0x10 << 5;
      FUN_1997_060a();
      pcStack_e = (char *)param_6;
      uStack_12 = CONCAT22(param_5,param_4);
      aiStack_1a[2] = 0x20;
      aiStack_1a[3] = 0x1d;
      auStack_1e = (undefined1  [4])CONCAT22(iVar5,0x4125);
      uStack_20 = 0x1997;
      uStack_22 = 0x68e7;
      aiStack_1a[0] = iVar5;
      aiStack_1a[1] = ((int)param_2 / 0x10) * 0x1e;
      (*DAT_451b_2a68)();
      pcVar6 = (char *)FUN_1997_06bb();
    }
    return pcVar6;
  case 3:
    do {
      FUN_1000_1e79();
      FUN_1997_0129();
      *(int *)(auStack_1e + iVar5 * 4 + 2) = *(int *)(auStack_1e + iVar5 * 4 + 2) + 8;
      iVar9 = iVar9 + 1;
      while (pcVar6 = (char *)FUN_1000_4a99(), (int)pcVar6 <= iVar9) {
        while( true ) {
          iVar5 = iVar5 + 1;
          if (3 < iVar5) {
            if (in_stack_00000016._2_2_ == 0) goto LAB_85d0_0b39;
            uVar13 = 0x1997;
            FUN_1997_034a();
            iVar5 = (in_stack_00000016._2_2_ + -1) * 0x20;
            iVar9 = 0;
            goto switchD_8000_90a5_caseD_2;
          }
          if (in_stack_0000001a != 2) break;
          if (2 < iVar5) {
            *(int *)(auStack_1e + iVar5 * 4 + 2) = *(int *)(auStack_1e + iVar5 * 4 + 2) + 8;
            aiStack_1a[iVar5 * 2] = aiStack_1a[iVar5 * 2] + -0xf;
            for (iVar9 = 0; pcVar6 = (char *)FUN_1000_4a99(), iVar9 < (int)pcVar6; iVar9 = iVar9 + 1
                ) {
              FUN_1000_1e79();
              FUN_1997_0129();
              *(int *)(auStack_1e + iVar5 * 4 + 2) = *(int *)(auStack_1e + iVar5 * 4 + 2) + 8;
            }
          }
        }
        FUN_1000_1e79();
        FUN_1997_0129();
        *(int *)(auStack_1e + iVar5 * 4 + 2) = *(int *)(auStack_1e + iVar5 * 4 + 2) + 8;
        param_1 = (undefined2)*(undefined4 *)(auStack_1e + iVar5 * 4 + 2);
        param_2 = (uint)((ulong)*(undefined4 *)(auStack_1e + iVar5 * 4 + 2) >> 0x10);
        FUN_1000_1e79();
        FUN_1997_0129();
        *(int *)(auStack_1e + iVar5 * 4 + 2) = *(int *)(auStack_1e + iVar5 * 4 + 2) + 8;
        iVar9 = 0;
      }
    } while( true );
  case 5:
    return pcVar6;
  case 6:
    pcVar6 = (char *)s__m__Mono_version__for_laptop_use_4125_2765 + 0x1f + (int)pcVar6 +
             -(uint)((int)param_2 < 0);
    do {
      in_CX = in_CX + 1;
      if (8 < in_CX) {
        for (iVar5 = 0; iVar5 < 9; iVar5 = iVar5 + 1) {
          pcVar6 = (char *)(iVar5 * 2);
          (pcVar6 + param_2 + 4)[0] = '\0';
          (pcVar6 + param_2 + 4)[1] = '\0';
        }
        for (iVar5 = 0; iVar5 < 9; iVar5 = iVar5 + 1) {
          for (iVar9 = 0; iVar9 < 9; iVar9 = iVar9 + 1) {
            iVar11 = param_2 + iVar5 * 0x48 + iVar9 * 8;
            *(undefined4 *)CONCAT22(param_3,(undefined4 *)(iVar11 + 0x1a)) = 0;
            *(undefined4 *)CONCAT22(param_3,(undefined4 *)(iVar11 + 0x16)) = 0;
            pbVar1 = (byte *)(param_2 + iVar5 * 0x48 + iVar9 * 8 + 0x16);
            *pbVar1 = *pbVar1 | 1;
            uVar7 = *(byte *)((DAT_3c04_0175 + iVar9) * 0xe0 + (DAT_3c04_0177 + iVar5) * 2 + 1) &
                    0xf;
            if (7 < uVar7) {
              uVar7 = 8;
            }
            uVar13 = *(undefined2 *)(auStack_1e + uVar7 * 2 + 2);
            iVar11 = param_2 + iVar5 * 0x48 + iVar9 * 8;
            pbVar1 = (byte *)(iVar11 + 0x17);
            *pbVar1 = *pbVar1 & 0x83;
            bVar4 = ((byte)uVar13 & 0x1f) << 2;
            pcVar6 = (char *)(uint)bVar4;
            pbVar1 = (byte *)(iVar11 + 0x17);
            *pbVar1 = *pbVar1 | bVar4;
          }
        }
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) | 1;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xfd;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xfb;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xf7;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xef;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xdf;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0xbf;
        *(byte *)(param_2 + 0x29e) = *(byte *)(param_2 + 0x29e) & 0x7f;
        *(byte *)(param_2 + 0x29f) = *(byte *)(param_2 + 0x29f) & 0xfe;
        return pcVar6;
      }
      for (iVar5 = 0; iVar5 < 0x1d; iVar5 = iVar5 + 1) {
        pcVar6 = (char *)0x3c04;
        if (*(char *)(in_CX * 0x1d + iVar5 + 0x60b) == '\0') {
          pcVar6 = auStack_1e + 2;
          *(int *)(pcVar6 + in_CX * 2) = iVar5;
          break;
        }
      }
    } while( true );
  case 7:
    FUN_1000_1e79();
    pcVar6 = (char *)FUN_1997_0129();
    return pcVar6;
  }
  pcStack_e = (char *)(uint)(*(char *)(param_2 * 2 + 0x829) == '\x01');
  FUN_2372_0eab();
  FUN_2372_0eab();
  FUN_2372_0eab();
  FUN_2372_0eab();
  FUN_2372_0eab();
  FUN_2372_0eab();
  FUN_2372_0eab();
  iStack_8 = 0x2372;
  iVar14 = 0x92a;
  FUN_2372_0eab();
  iVar8 = 0x407f;
  iVar11 = thunk_FUN_76ef_0e25();
  if (iVar11 == 0) {
    iStack_8 = 0x407f;
    iVar8 = 0x2372;
    iVar14 = 0x941;
    FUN_2372_0ef8();
  }
  iVar12 = 0x407f;
  iStack_6 = 0x949;
  iVar11 = thunk_FUN_76ef_0e42();
  if (iVar11 == 0) {
    iStack_6 = 0x1f8;
    iVar8 = 0;
    iStack_8 = 0x407f;
    iVar12 = 0x2372;
    iVar14 = 0x958;
    FUN_2372_0ef8();
  }
  if ((DAT_3c04_0120 == 0) || (iVar11 = iVar12, DAT_3c04_0130 != 0)) {
    iStack_6 = 0x1f7;
    iVar8 = 0;
    iVar11 = 0x2372;
    iVar14 = 0x97d;
    FUN_2372_0ef8();
    iStack_8 = iVar12;
  }
  if (iVar5 == 0) {
    FUN_2372_0ef8();
    iVar12 = 0x2372;
  }
  else {
    iVar12 = iVar11;
    if (iVar9 == 9) goto LAB_8027_0739;
  }
  iStack_6 = 0x207;
  iVar8 = 0;
  iVar11 = 0x2372;
  iVar14 = 0x9a6;
  FUN_2372_0ef8();
  iStack_8 = iVar12;
LAB_8027_0739:
  iVar12 = iVar11;
  if (((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] == 0) {
    iStack_6 = 0x1fd;
    iVar8 = 0;
    iVar12 = 0x2372;
    iVar14 = 0x9c7;
    FUN_2372_0ef8();
    iStack_8 = iVar11;
  }
  iVar11 = iVar12;
  if (DAT_3c04_011c == 0) {
    iStack_6 = 0x203;
    iVar8 = 0;
    iVar11 = 0x2372;
    iVar14 = 0x9e2;
    FUN_2372_0ef8();
    iStack_8 = iVar12;
  }
  if (iVar14 == 0) {
    FUN_2372_0ef8();
    iStack_6 = 0x208;
    iVar8 = 0;
    iStack_8 = 0x2372;
    iVar11 = 0x2372;
    FUN_2372_0ef8();
  }
  if (((((iVar5 == 0) || (iStack_8 != 0x1c)) || (*(char *)(DAT_3c04_0110 * 0x1d + 0xcff) != '\x03'))
      || (((DAT_451b_1f02._2_2_ != 0x2e1d ||
           (*(int *)(DAT_3c04_0110 * 0x1d + 0xd00) * 0x16 + -0x7780 != (int)DAT_451b_1f02)) ||
          (((*(byte *)(iStack_6 * 0x70 + iVar8) & 0x40) != 0 || ((iVar9 == 10 || (iVar9 == 0xb))))))
         )) || ((iVar9 == 2 || (iVar9 == 3)))) {
    iStack_6 = 0x206;
    iVar8 = 0;
    FUN_2372_0ef8();
    iStack_8 = iVar11;
  }
  if (((in_stack_0000fff4 == 0) || (iVar5 == 0)) ||
     (((iStack_8 != 0x1c && (pcStack_e == (char *)0x0)) ||
      ((iVar9 != 0xb || ((*(byte *)(iStack_6 * 0xe0 + iVar8 * 2 + 1) & 0x40) != 0)))))) {
    FUN_2372_0ef8();
  }
  if ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < 1) {
    FUN_2372_0ef8();
    FUN_2372_0ef8();
    FUN_2372_0ef8();
  }
  if (iVar5 == 0) {
    FUN_2372_0ef8();
  }
  iVar5 = FUN_8027_225b();
  if (iVar5 == 1) {
    FUN_2372_0ef8();
    FUN_2372_0ef8();
    FUN_2372_0ef8();
    FUN_2372_0ef8();
  }
  pcVar6 = (char *)0x3c04;
  if (DAT_3c04_015b != 0) {
    pcVar6 = (char *)FUN_2372_0ef8();
  }
  return pcVar6;
}

