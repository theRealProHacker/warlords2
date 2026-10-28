
/* WARNING: Instruction at (ram,0x00018b02) overlaps instruction at (ram,0x00018b01)
    */
/* WARNING: Control flow encountered bad instruction data */

uint __cdecl16far
FUN_1c8c_0197(code *param_1,int **param_2,uint param_3,uint param_4,int param_5,int *param_6,
             undefined2 *param_7)

{
  char *pcVar1;
  undefined2 *puVar2;
  undefined4 uVar3;
  code *pcVar4;
  long lVar5;
  uint uVar6;
  int *piVar7;
  undefined3 uVar8;
  char cVar9;
  byte bVar10;
  int iVar11;
  int iVar12;
  uint uVar13;
  char *pcVar14;
  char *in_CX;
  byte bVar15;
  undefined2 extraout_DX;
  uint uVar16;
  uint uVar17;
  byte bVar18;
  int **in_DX;
  char cVar19;
  int *piVar20;
  uint unaff_SI;
  undefined1 *puVar21;
  undefined2 *puVar22;
  uint uVar23;
  uint unaff_DI;
  undefined2 uVar24;
  int unaff_ES;
  undefined2 uVar25;
  undefined2 unaff_SS;
  undefined1 uVar26;
  undefined1 uVar27;
  bool bVar28;
  int in_stack_00000000;
  code *in_stack_00000002;
  byte abStack_15a4 [5378];
  undefined1 auStack_a2 [96];
  uint auStack_42 [13];
  int aiStack_28 [8];
  int *apiStack_18 [4];
  int iStack_10;
  int iStack_e;
  undefined1 *puStack_c;
  undefined1 *puStack_a;
  char *pcStack_8;
  int **ppiStack_6;
  undefined2 uStack_4;
  
  cVar9 = uStack_4._1_1_;
  uVar26 = (char)uStack_4;
  puVar21 = (undefined1 *)CONCAT11(uStack_4._1_1_,(char)uStack_4);
  if ((char)param_1 == '5') {
    uStack_4._0_1_ = 0x8c;
    uStack_4._1_1_ = 0x1c;
    ppiStack_6 = (int **)0xca67;
    uVar13 = thunk_FUN_85d0_0565();
    return uVar13;
  }
  uVar13 = (int)(char)param_1 - 0x31;
  cVar19 = (char)((uint)in_DX >> 8);
  if (8 < uVar13) {
    ppiStack_6 = (int **)0x1c8c;
    pcStack_8 = (char *)0xcaa8;
    uStack_4._0_1_ = (char)in_DX;
    uStack_4._1_1_ = cVar19;
    uVar13 = FUN_1c8c_041f();
    return uVar13;
  }
  uVar27 = (int)uVar13 < 0;
  piVar20 = (int *)(uVar13 * 2);
  bVar28 = (bool)uVar27 != (int)piVar20 < 0;
  uVar24 = 0x1000;
  uStack_4._0_1_ = (char)unaff_ES;
  uStack_4._1_1_ = (char)((uint)unaff_ES >> 8);
  switch(uVar13) {
  case 0:
    ppiStack_6 = (int **)(DAT_3c04_0175 + uVar13);
    uStack_4._0_1_ = 0;
    uStack_4._1_1_ = 0;
    puStack_a = (undefined1 *)0x1000;
    uVar25 = 0x1a8b;
    puStack_c = (undefined1 *)0xcb36;
    iVar11 = FUN_1a8b_0c4f();
    uStack_4._0_1_ = (char)iVar11;
    uStack_4._1_1_ = (char)((uint)iVar11 >> 8);
    uVar24 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    piVar20 = (int *)DAT_451b_1f02;
    if ((piVar20[9] == *DAT_451b_1f02) && (piVar20[1] == piVar20[10])) {
      piVar20[10] = -1;
      piVar20[9] = -1;
    }
    if (iVar11 == 0) {
      uStack_4._0_1_ = 0x8b;
      uStack_4._1_1_ = 0x1a;
      uVar25 = 0x40f9;
      ppiStack_6 = (int **)0xcb69;
      thunk_FUN_85d0_006c();
    }
    iVar11 = CONCAT11(uStack_4._1_1_,(char)uStack_4);
    uStack_4._0_1_ = (char)uVar25;
    uStack_4._1_1_ = (char)((uint)uVar25 >> 8);
    if (iVar11 == 2) {
      ppiStack_6 = (int **)0xcb74;
      thunk_FUN_8bc3_08fb();
      ppiStack_6 = (int **)0x1;
      uStack_4._0_1_ = 1;
      uStack_4._1_1_ = 0;
      pcStack_8 = (char *)0x1;
      puStack_a = (undefined1 *)0x4119;
      puStack_c = (undefined1 *)0xcb81;
      FUN_1b62_08b3();
      if (DAT_3c04_012e != 0) {
        uStack_4._0_1_ = 0x62;
        uStack_4._1_1_ = 0x1b;
        ppiStack_6 = (int **)0xcb96;
        iVar11 = thunk_FUN_8027_225b();
        if (iVar11 == 1) {
          ppiStack_6 = (int **)0x19;
          uStack_4._0_1_ = 9;
          uStack_4._1_1_ = 0;
          pcStack_8 = (char *)0x40d7;
          puStack_a = (undefined1 *)0xcba6;
          ppiStack_6 = (int **)thunk_FUN_7e8f_0505();
          uStack_4._0_1_ = (char)uVar13;
          uStack_4._1_1_ = (char)(uVar13 >> 8);
          pcStack_8 = (char *)0x40c1;
          puStack_a = (undefined1 *)0xcbb0;
          thunk_FUN_8027_168d();
        }
      }
      uStack_4 = (undefined1 *)0x2;
    }
    else {
      uVar24 = 0x40d7;
      ppiStack_6 = (int **)0xcbbe;
      thunk_FUN_8027_0174();
      if (DAT_3c04_012e != 0) {
        if ((DAT_3c04_0134 & 0x10) == 0) {
          for (iVar11 = 0; iVar11 < 8; iVar11 = iVar11 + 1) {
            ppiStack_6 = (int **)(*DAT_451b_1f02 +
                                 *(int *)((int)(undefined2 *)&DAT_4125_2b4b + iVar11 * 2 + 1));
            uStack_4 = (undefined1 *)
                       (((int *)DAT_451b_1f02)[1] + ((undefined2 *)&DAT_4125_2b5c)[iVar11]);
            puStack_a = (undefined1 *)0xcc13;
            pcStack_8 = (char *)uVar24;
            iVar12 = thunk_FUN_824f_044a();
            if ((-1 < iVar12) &&
               (uVar13 = 0x3c04, *(char *)(iVar12 * 0x41 + 0x1592) != DAT_3c04_0110)) {
              DAT_3c04_0134 = DAT_3c04_0134 | 0x10;
              ppiStack_6 = (int **)0x19;
              uStack_4._0_1_ = 4;
              uStack_4._1_1_ = 0;
              pcStack_8 = (char *)0x40e8;
              puStack_a = (undefined1 *)0xcc50;
              ppiStack_6 = (int **)thunk_FUN_7e8f_0505();
              uStack_4._0_1_ = (char)uVar13;
              uStack_4._1_1_ = (char)(uVar13 >> 8);
              pcStack_8 = (char *)0x40c1;
              uVar24 = 0x40d7;
              puStack_a = (undefined1 *)0xcc5a;
              thunk_FUN_8027_168d();
              break;
            }
            uVar24 = 0x40e8;
          }
        }
        if ((DAT_3c04_0134 & 0x80) == 0) {
          uVar25 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
          if ((*(char *)(*(byte *)(((int *)DAT_451b_1f02)[1] * 0xe0 + *DAT_451b_1f02 * 2) + 0x710)
               == '\v') && ((char)((int *)DAT_451b_1f02)[2] == '\x1c')) {
            DAT_3c04_0134 = DAT_3c04_0134 | 0x80;
            ppiStack_6 = (int **)0x19;
            uStack_4._0_1_ = 5;
            uStack_4._1_1_ = 0;
            puStack_a = (undefined1 *)0xcccb;
            pcStack_8 = (char *)uVar24;
            ppiStack_6 = (int **)thunk_FUN_7e8f_0505();
            uStack_4._0_1_ = (char)uVar13;
            uStack_4._1_1_ = (char)(uVar13 >> 8);
            pcStack_8 = (char *)0x40c1;
            puStack_a = (undefined1 *)0xccd5;
            thunk_FUN_8027_168d();
          }
        }
      }
    }
    return (uint)uStack_4;
  case 1:
    uStack_4 = puVar21;
    if (bVar28) {
      return uVar13;
    }
code_r0x000100e5:
    pcVar4 = (code *)swi(0x21);
    (*pcVar4)();
    if ((bool)uVar27) goto LAB_1000_0109;
    pcVar4 = (code *)swi(0x21);
    iVar11 = (*pcVar4)();
    if ((bool)uVar27) goto LAB_1000_0109;
    DAT_4125_0091 = iVar11 + 1;
    pcVar4 = (code *)swi(0x21);
    (*pcVar4)();
    if ((bool)uVar27) goto LAB_1000_0109;
    pcVar4 = (code *)swi(0x21);
    (*pcVar4)();
    break;
  case 2:
    while( true ) {
      uStack_4._1_1_ = cVar9;
      uStack_4._0_1_ = uVar26;
      abStack_15a4[unaff_DI] = abStack_15a4[unaff_DI] | (byte)in_CX;
      if (piVar20 <= (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 3) break;
      pcVar1 = (char *)CONCAT22(ppiStack_6,pcStack_8);
      pcStack_8 = pcStack_8 + 1;
      if (30000 < (long)pcVar1) {
        pcStack_8 = (char *)0x0;
        uStack_4._0_1_ = (char)uVar24;
        uStack_4._1_1_ = (char)((uint)uVar24 >> 8);
        uVar24 = 0x40c1;
        ppiStack_6 = (int **)0x8ae1;
        thunk_FUN_7e8f_0a1b();
      }
      uStack_4._0_1_ = (char)uVar24;
      uVar26 = (char)uStack_4;
      uStack_4._1_1_ = (char)((uint)uVar24 >> 8);
      uVar27 = uStack_4._1_1_;
      if (DAT_4125_166c != 0) {
        ppiStack_6 = (int **)0x8aed;
        FUN_18a9_02f1();
      }
      ppiStack_6 = (int **)0x8af2;
      uStack_4._0_1_ = uVar26;
      uStack_4._1_1_ = uVar27;
      FUN_251d_008a();
      uStack_4._0_1_ = (char)unaff_SS;
      uStack_4._1_1_ = (char)((uint)unaff_SS >> 8);
      ppiStack_6 = apiStack_18;
      puStack_a = (undefined1 *)0xffff;
      pcStack_8 = (char *)0xffff;
      puStack_c = (undefined1 *)0x251d;
      uVar24 = 0x21b5;
      iStack_e = -0x7501;
      uVar13 = FUN_21b5_0003();
      piVar20 = apiStack_18[0];
      uVar26 = (char)uStack_4;
      cVar9 = uStack_4._1_1_;
    }
    uVar27 = (int)piVar20 < 0;
    iVar11 = (int)piVar20 * 2;
    uVar24 = 0x1000;
    switch(piVar20) {
    case (int *)0x0:
      piVar7 = (int *)CONCAT13(param_1._1_1_,CONCAT12((char)param_1,in_stack_00000002));
      uVar24 = (undefined2)((ulong)piVar7 >> 0x10);
      ppiStack_6 = *(int ***)(in_stack_00000002 + 0xc);
      uStack_4._0_1_ = (char)*(undefined2 *)(in_stack_00000002 + 0xe);
      uStack_4._1_1_ = (char)((uint)*(undefined2 *)(in_stack_00000002 + 0xe) >> 8);
      if (*piVar7 < 0) {
        while (pcVar14 = in_CX + -1, in_CX != (char *)0x0) {
          ppiStack_6 = (int **)((int)ppiStack_6 + -1);
          in_CX = pcVar14;
          if (*(char *)CONCAT13(uStack_4._1_1_,CONCAT12((char)uStack_4,ppiStack_6)) == '\n') {
            unaff_SI = unaff_SI + 1;
          }
        }
      }
      else {
        while (pcVar14 = in_CX + -1, in_CX != (char *)0x0) {
          uVar8 = CONCAT12((char)uStack_4,ppiStack_6);
          ppiStack_6 = (int **)((int)ppiStack_6 + 1);
          in_CX = pcVar14;
          if (*(char *)CONCAT13(uStack_4._1_1_,uVar8) == '\n') {
            unaff_SI = unaff_SI + 1;
          }
        }
      }
      return unaff_SI;
    case (int *)0x1:
      uStack_4._0_1_ = (char)unaff_SI;
      uStack_4._1_1_ = (char)(unaff_SI >> 8);
      while( true ) {
        *(char *)((int)in_DX + 5) = '\0';
        *(char *)(ppiStack_6 + 2) = '\0';
        uVar24 = (undefined2)((ulong)DAT_451b_0ce0 >> 0x10);
        if (in_CX == (char *)0x0) break;
        unaff_ES = ((int *)DAT_451b_0ce0)[1];
        in_DX = (int **)(*DAT_451b_0ce0 + (int)(in_CX + -1) * 0x21);
        uStack_4._0_1_ = (char)unaff_ES;
        uStack_4._1_1_ = (char)((uint)unaff_ES >> 8);
        ppiStack_6 = in_DX;
        in_CX = in_CX + -1;
      }
      in_CX = (char *)**(undefined2 **)((int *)DAT_451b_0ce0 + 6);
      while (in_CX != (char *)0x0) {
        unaff_ES = (int)((ulong)*(undefined4 *)((int *)DAT_451b_0ce0 + 2) >> 0x10);
        iVar11 = (int)*(undefined4 *)((int *)DAT_451b_0ce0 + 2);
        uVar13 = (int)(in_CX + -1) * 0xe;
        in_CX = in_CX + -1;
switchD_1000_8b0c_caseD_7:
        *(uint *)((int)auStack_42 + unaff_DI) = *(uint *)((int)auStack_42 + unaff_DI) >> 0xe;
        *(undefined2 *)(iVar11 + uVar13 + 2) = 0;
      }
      return 0;
    case (int *)0x2:
      pcVar1 = (char *)(iVar11 + unaff_DI);
      *pcVar1 = *pcVar1 + (char)uVar13 + uVar27;
      bVar28 = *pcVar1 == '\0';
      while (uVar25 = uVar24, bVar28) {
        do {
          unaff_DI = unaff_DI + 1;
          if (7 < (int)unaff_DI) goto LAB_1b62_05cf;
          puStack_c = (undefined1 *)
                      (*DAT_451b_1f02 +
                      *(int *)((int)(undefined2 *)&DAT_4125_2b4b + unaff_DI * 2 + 1));
          iStack_e = ((int *)DAT_451b_1f02)[1] + ((undefined2 *)&DAT_4125_2b5c)[unaff_DI];
          uVar24 = 0x40e8;
          puStack_a = (undefined1 *)0xbb9d;
          pcStack_8 = (char *)uVar25;
          ppiStack_6 = (int **)puStack_c;
          uStack_4 = (undefined1 *)iStack_e;
          iStack_10 = thunk_FUN_824f_044a();
          uVar25 = uVar24;
        } while (iStack_10 < 0);
        in_DX = (int **)0x3c04;
        bVar28 = *(char *)(iStack_10 * 0x41 + 0x1592) == DAT_3c04_0110;
      }
      DAT_3c04_0134 = DAT_3c04_0134 | 0x10;
      ppiStack_6 = (int **)0x19;
      uStack_4._0_1_ = 4;
      uStack_4._1_1_ = 0;
      puStack_a = (undefined1 *)0xbbda;
      pcStack_8 = (char *)uVar24;
      ppiStack_6 = (int **)thunk_FUN_7e8f_0505();
      uStack_4._0_1_ = (char)in_DX;
      uStack_4._1_1_ = (char)((uint)in_DX >> 8);
      pcStack_8 = (char *)0x40c1;
      uVar25 = 0x40d7;
      puStack_a = (undefined1 *)0xbbe4;
      thunk_FUN_8027_168d();
LAB_1b62_05cf:
      uVar13 = (uint)(CONCAT31(0x3c,DAT_3c04_0134) >> 7) & 1;
      if ((DAT_3c04_0134 & 0x80) == 0) {
        uVar24 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        uVar13 = 0x3c04;
        if ((*(char *)(*(byte *)(((int *)DAT_451b_1f02)[1] * 0xe0 + *DAT_451b_1f02 * 2) + 0x710) ==
             '\v') && ((char)((int *)DAT_451b_1f02)[2] == '\x1c')) {
          DAT_3c04_0134 = DAT_3c04_0134 | 0x80;
          ppiStack_6 = (int **)0x19;
          uStack_4._0_1_ = 5;
          uStack_4._1_1_ = 0;
          puStack_a = (undefined1 *)0xbc55;
          pcStack_8 = (char *)uVar25;
          ppiStack_6 = (int **)thunk_FUN_7e8f_0505();
          uStack_4._0_1_ = (char)in_DX;
          uStack_4._1_1_ = (char)((uint)in_DX >> 8);
          pcStack_8 = (char *)0x40c1;
          puStack_a = (undefined1 *)0xbc5f;
          uVar13 = thunk_FUN_8027_168d();
        }
      }
      DAT_4125_1172 = 1;
      return uVar13;
    case (int *)0x3:
      *(uint *)&DAT_4125_26ca = unaff_DI;
      bVar10 = 4;
      puVar21 = (undefined1 *)((unaff_DI >> 4) + 1);
      if (&stack0xfffe < puVar21) {
        uVar13 = FUN_1000_027a();
        return uVar13;
      }
      DAT_4125_0089 = puVar21 + (int)in_DX;
      pcVar4 = (code *)swi(0x21);
      DAT_4125_008d = DAT_4125_0089;
      uStack_4 = puVar21;
      (*pcVar4)();
      DAT_4125_26ca = in_stack_00000000 << (bVar10 & 0x1f);
      puVar22 = (undefined2 *)&DAT_451b_0000;
      for (in_CX = (char *)s_Your_Upkeep_4125_3201 + 5; in_CX != (char *)0x0; in_CX = in_CX + -1) {
        puVar2 = puVar22;
        puVar22 = (undefined2 *)((int)puVar22 + 1);
        *(undefined1 *)puVar2 = 0;
      }
      if (((DAT_4125_3cfc < 0x15) || (DAT_4125_007d < 3)) ||
         ((DAT_4125_007d < 4 && (DAT_4125_007e < 0x1e)))) goto LAB_1000_010c;
      bVar28 = false;
      pcVar4 = (code *)swi(0x21);
      (*pcVar4)();
      if (bVar28) goto LAB_1000_0109;
      uVar27 = false;
      goto code_r0x000100e5;
    case (int *)0x4:
      do {
        if (((undefined1 *)&DAT_451b_0664)[uVar13 * 6] == '\0') {
          pcStack_8 = pcStack_8 + 1;
          uVar3 = *(undefined4 *)(aiStack_28 + unaff_SI * 2);
          ppiStack_6 = (int **)uVar3;
          uStack_4._0_1_ = (char)((ulong)uVar3 >> 0x10);
          uStack_4._1_1_ = (char)((ulong)uVar3 >> 0x18);
          pcStack_8 = (char *)0x1000;
          puStack_a = (undefined1 *)0xc649;
          FUN_1b62_03be();
        }
        do {
          unaff_SI = unaff_SI + 1;
          if ((int)unaff_DI <= (int)unaff_SI) {
            if (0 < (int)pcStack_8) {
              uStack_4._0_1_ = 0;
              uStack_4._1_1_ = 0x10;
              ppiStack_6 = (int **)0xc81d;
              thunk_FUN_7d9f_023d();
              DAT_451b_1efe = 0;
              DAT_451b_1f02 = (int *)0x0;
              for (iVar11 = 0; iVar11 < 8; iVar11 = iVar11 + 1) {
                *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar11 * 4) = 0;
                ((undefined2 *)&DAT_451b_1ede)[iVar11 * 2] = 0;
              }
              DAT_4125_2bda = 0;
              DAT_451b_1e9e = 0;
              uStack_4._0_1_ = 0xba;
              uStack_4._1_1_ = 0x40;
              ppiStack_6 = (int **)0xc850;
              thunk_FUN_824f_0000();
              uStack_4._0_1_ = 0xe8;
              uStack_4._1_1_ = 0x40;
              ppiStack_6 = (int **)0xc855;
              thunk_FUN_85d0_006c();
              uStack_4._1_1_ = (char)((uint)pcStack_8 >> 8);
              if (pcStack_8 == (char *)0x1) {
                ppiStack_6 = (int **)0x2;
              }
              else {
                ppiStack_6 = (int **)0x0;
              }
              uStack_4._0_1_ = (char)pcStack_8;
              pcStack_8 = (char *)0xa8;
              puStack_a = (undefined1 *)0x40f9;
              puStack_c = (undefined1 *)0xc86f;
              pcStack_8 = (char *)thunk_FUN_7e8f_04f0();
              puStack_a = (undefined1 *)0x4125;
              puStack_c = (undefined1 *)&DAT_451b_1d28;
              iStack_e = 0x40c1;
              iStack_10 = 0xc87d;
              FUN_1000_4944();
              ppiStack_6 = (int **)0xa8;
              uStack_4._0_1_ = 1;
              uStack_4._1_1_ = 0;
              pcStack_8 = (char *)0x1000;
              puStack_a = (undefined1 *)0xc88b;
              ppiStack_6 = (int **)thunk_FUN_7e8f_04f0();
              uStack_4._0_1_ = (char)in_DX;
              uStack_4._1_1_ = (char)((uint)in_DX >> 8);
              pcStack_8 = (char *)0x4125;
              puStack_a = (undefined1 *)&DAT_451b_1d28;
              puStack_c = (undefined1 *)0x40c1;
              iStack_e = 0xc899;
              thunk_FUN_8027_1160();
              if ((-1 < (int)param_1) && (-1 < (int)param_2)) {
                uStack_4._0_1_ = param_2._0_1_;
                ppiStack_6 = (int **)param_1;
                pcStack_8 = (char *)0x40d7;
                puStack_a = (undefined1 *)0xc8b3;
                thunk_FUN_85d0_0629();
              }
            }
            return (uint)(0 < (int)pcStack_8);
          }
          uVar24 = (undefined2)((ulong)*(undefined4 *)(aiStack_28 + unaff_SI * 2) >> 0x10);
        } while (((*(uint *)((int)*(undefined4 *)(aiStack_28 + unaff_SI * 2) + 0xc) & 0x1000) != 0)
                || (*(char *)(aiStack_28[unaff_SI * 2] + 4) == '\x1c'));
        uVar13 = (uint)*(char *)(aiStack_28[unaff_SI * 2] + 4);
      } while( true );
    case (int *)0x6:
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    case (int *)0x7:
      goto switchD_1000_8b0c_caseD_7;
    }
    break;
  case 3:
    *(char *)(unaff_DI + 0x3d) = *(char *)(unaff_DI + 0x3d) + cVar19;
    uVar24 = *(undefined2 *)((int)*(undefined4 *)DAT_451b_0ce0 + uVar13 * 0x21);
    uStack_4._0_1_ = (char)uVar24;
    uStack_4._1_1_ = (char)((uint)uVar24 >> 8);
    ppiStack_6 = (int **)0x1000;
    pcStack_8 = (char *)0x8bee;
    uVar13 = thunk_FUN_54ad_0000();
    return uVar13;
  case 4:
    pcVar1 = (char *)((int)piVar20 + (unaff_SI - 0x76));
    *pcVar1 = *pcVar1 + (char)in_DX;
    ppiStack_6 = (int **)(uint)(byte)((byte)uVar13 | 0xb4);
    pcStack_8 = (char *)((uint)param_2 & 0xff);
    puStack_a = (undefined1 *)((param_3 & 0xff) + 1);
    puStack_c = (undefined1 *)(param_4 & 0xff);
    iStack_e = 0x1000;
    iStack_10 = 0x3c00;
    FUN_1000_38ee();
    uStack_4 = auStack_a2;
    ppiStack_6 = (int **)((uint)param_1 & 0xff);
    pcStack_8 = (char *)(param_4 & 0xff);
    puStack_a = (undefined1 *)((uint)param_1 & 0xff);
    puStack_c = (undefined1 *)(param_4 & 0xff);
    iStack_e = 0x1000;
    iStack_10 = 0x3c26;
    FUN_1000_3766();
    uStack_4 = auStack_a2;
    ppiStack_6 = (int **)(param_4 & 0xff);
    pcStack_8 = (char *)((uint)param_2 & 0xff);
    puStack_a = (undefined1 *)0x3c3e;
    FUN_1000_3b79();
    uStack_4 = auStack_a2;
    ppiStack_6 = (int **)((uint)param_1 & 0xff);
    pcStack_8 = (char *)((uint)param_2 & 0xff);
    puStack_a = (undefined1 *)((uint)param_1 & 0xff);
    puStack_c = (undefined1 *)(param_4 & 0xff);
    iStack_e = 0x1000;
    iStack_10 = 0x3c61;
    uVar13 = FUN_1000_37bc();
    return uVar13;
  case 5:
    ppiStack_6 = (int **)apiStack_18._4_4_;
    uStack_4._0_1_ = SUB41(apiStack_18._4_4_,2);
    uStack_4._1_1_ = SUB41(apiStack_18._4_4_,3);
    pcStack_8 = (char *)0x1000;
    puStack_a = (undefined1 *)0x74e8;
    thunk_FUN_8027_0e04();
    DAT_4125_1176 = 1;
    return 0;
  case 6:
    uStack_4._1_1_ = cVar9;
    if (bVar28 == (int)piVar20 < 0) {
      uStack_4._1_1_ = (char)(param_3 >> 8);
      ppiStack_6 = param_2;
      pcStack_8 = (char *)s_CARDS__c_03d__s_4125_261a + 0xd;
      uStack_4._0_1_ = (undefined1)param_3;
      uVar13 = (*in_stack_00000002)();
      param_4 = 8;
      bVar10 = (byte)uVar13;
      uVar26 = bVar10 < 0x78;
      if ((bVar10 != 0x78) && (uVar26 = bVar10 < 0x58, bVar10 != 0x58)) goto LAB_1000_2667;
      param_4 = 0x10;
      do {
        if (param_5 < 1) goto LAB_1000_26b1;
        uStack_4._0_1_ = param_2._0_1_;
        uStack_4._1_1_ = param_2._1_1_;
        ppiStack_6 = (int **)0x2665;
        uVar13 = (*in_stack_00000002)();
        param_5 = param_5 + -1;
LAB_1000_2667:
        FUN_1000_2524();
        if ((bool)uVar26) goto LAB_1000_26a1;
        uVar16 = (uint)((ulong)unaff_SI * (ulong)param_4 >> 0x10);
        uVar23 = (uint)((ulong)unaff_SI * (ulong)param_4);
        unaff_SI = uVar13 + uVar23;
        uVar13 = (uint)CARRY2(uVar13,uVar23);
        uVar23 = unaff_DI + uVar16;
        uVar26 = CARRY2(unaff_DI,uVar16) || CARRY2(uVar23,uVar13);
        uVar23 = uVar23 + uVar13;
        unaff_DI = 0;
      } while (uVar23 == 0);
      do {
        if (param_5 < 1) goto LAB_1000_26b1;
        uStack_4._0_1_ = param_2._0_1_;
        uStack_4._1_1_ = param_2._1_1_;
        ppiStack_6 = (int **)((char *)s_FDATA_STRING_DAT_4125_2693 + 2);
        uVar13 = (*in_stack_00000002)();
        uVar16 = param_4;
        FUN_1000_2524();
        if ((bool)uVar26) goto LAB_1000_26a1;
        uVar17 = (uint)((ulong)unaff_SI * (ulong)uVar16 >> 0x10);
        uVar6 = (uint)((ulong)unaff_SI * (ulong)uVar16);
        lVar5 = (ulong)uVar23 * (ulong)uVar16;
        unaff_SI = uVar13 + uVar6;
        uVar13 = (uint)CARRY2(uVar13,uVar6);
        uVar23 = (uint)lVar5 + uVar17;
        bVar28 = CARRY2((uint)lVar5,uVar17) || CARRY2(uVar23,uVar13);
        uVar23 = uVar23 + uVar13;
        bVar15 = (byte)((ulong)lVar5 >> 0x10);
        bVar18 = (byte)((ulong)lVar5 >> 0x18);
        bVar10 = bVar15 + bVar18;
        uVar26 = CARRY1(bVar15,bVar18) || CARRY1(bVar10,bVar28);
        param_5 = param_5 + -1;
      } while ((byte)(bVar10 + bVar28) == '\0');
      unaff_SI = CONCAT11((uStack_4._1_1_ != '\0') + -1,uStack_4._1_1_ + -1);
      pcStack_8 = (char *)0x2;
      goto LAB_1000_26c1;
    }
    goto LAB_1000_26b1;
  case 7:
    if (*piVar20 < 0) {
      piVar7 = (int *)CONCAT13(param_2._1_1_,CONCAT12(param_2._0_1_,param_1));
      uVar24 = (undefined2)((ulong)piVar7 >> 0x10);
      iVar11 = *(int *)(param_1 + 6) + *piVar7 + 1;
      *piVar7 = *piVar7 - iVar11;
      pcStack_8 = *(char **)(param_1 + 10);
      puStack_a = *(undefined1 **)(param_1 + 8);
      *(char **)(param_1 + 0xe) = pcStack_8;
      *(undefined1 **)(param_1 + 0xc) = puStack_a;
      puStack_c = (undefined1 *)(int)(char)param_1[4];
      iStack_e = 0x1000;
      iStack_10 = 0x4006;
      ppiStack_6 = (int **)iVar11;
      iVar12 = FUN_1000_50e4();
      if ((iVar12 != iVar11) &&
         (uVar24 = (undefined2)(CONCAT13(param_2._1_1_,CONCAT12(param_2._0_1_,param_1)) >> 0x10),
         (*(uint *)(param_1 + 2) & 0x200) == 0)) {
        *(uint *)(param_1 + 2) = *(uint *)(param_1 + 2) | 0x10;
        return 0xffff;
      }
    }
    else if (((piVar20[1] & 8U) != 0) ||
            (((int **)piVar20[7] == param_2 && ((code *)piVar20[6] == param_1 + 5)))) {
      puVar2 = (undefined2 *)CONCAT13(param_2._1_1_,CONCAT12(param_2._0_1_,param_1));
      uVar24 = (undefined2)((ulong)puVar2 >> 0x10);
      *puVar2 = 0;
      if ((*(int ***)(param_1 + 0xe) == param_2) && (*(code **)(param_1 + 0xc) == param_1 + 5)) {
        uVar25 = *(undefined2 *)(param_1 + 8);
        *(undefined2 *)(param_1 + 0xe) = *(undefined2 *)(param_1 + 10);
        *(undefined2 *)(param_1 + 0xc) = uVar25;
      }
    }
    return 0;
  case 8:
    uStack_4._0_1_ = 0x7c;
    uStack_4._1_1_ = 0x11;
    ppiStack_6 = (int **)0x1000;
    pcStack_8 = "n";
    thunk_FUN_73de_10e1();
    DAT_4125_1174 = 1;
    return 0;
  }
  if (!(bool)uVar27) {
LAB_1000_010c:
    pcVar4 = (code *)swi(0x1a);
    cVar9 = (*pcVar4)();
    if (cVar9 != '\0') {
      DAT_0000_0470 = 1;
    }
    DAT_4125_0081 = extraout_DX;
    DAT_4125_0083 = in_CX;
    FUN_1000_01ed();
    uStack_4._0_1_ = (char)DAT_4125_006f;
    uStack_4._1_1_ = (char)((uint)DAT_4125_006f >> 8);
    ppiStack_6 = (int **)DAT_4125_006d;
    pcStack_8 = (char *)DAT_4125_006b;
    puStack_a = (undefined1 *)0x1000;
    puStack_c = (undefined1 *)0x151;
    puStack_a = (undefined1 *)FUN_1a4c_000b();
    puStack_c = (undefined1 *)0x1a4c;
    iStack_e = 0x157;
    FUN_1000_1cc7();
    puStack_c = (undefined1 *)0x3f2a;
    iStack_e = 0x3f54;
    iStack_10 = 0x167;
    uVar13 = FUN_1000_0231();
    return uVar13;
  }
LAB_1000_0109:
  uVar13 = FUN_1000_027a();
  return uVar13;
LAB_1000_26a1:
  uStack_4._0_1_ = param_2._0_1_;
  uStack_4._1_1_ = param_2._1_1_;
  pcStack_8 = (char *)s_DATA_ERROR_DAT_4125_26a4 + 7;
  ppiStack_6 = (int **)uVar13;
  (*param_1)();
  ppiStack_6 = (int **)((int)ppiStack_6 - 1);
LAB_1000_26b1:
  if (uStack_4._1_1_ != '\0') {
    unaff_SI = -unaff_SI;
  }
LAB_1000_26c1:
  *param_6 = (int)(*param_6 + (int)ppiStack_6);
  *param_7 = pcStack_8;
  return unaff_SI;
}

