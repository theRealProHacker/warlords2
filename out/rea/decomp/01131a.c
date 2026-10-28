
/* WARNING: Instruction at (ram,0x0001158d) overlaps instruction at (ram,0x0001158b)
    */

void __cdecl16near FUN_1000_131a(code *param_1,code *param_2,uint param_3,int *param_4,int param_5)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  code *pcVar4;
  ulong uVar5;
  bool bVar6;
  bool bVar7;
  bool bVar8;
  undefined1 uVar9;
  byte bVar10;
  char *pcVar11;
  uint uVar12;
  uint uVar13;
  int iVar14;
  int *piVar15;
  int *piVar16;
  undefined2 extraout_DX;
  uint uVar17;
  uint uVar18;
  undefined2 extraout_DX_00;
  undefined2 extraout_DX_01;
  undefined2 extraout_DX_02;
  undefined2 extraout_DX_03;
  undefined2 extraout_DX_04;
  char *in_BX;
  char *pcVar19;
  int *piVar20;
  undefined2 *puVar21;
  undefined2 *puVar22;
  undefined2 *puVar23;
  undefined2 *puVar24;
  int *piVar25;
  int *piVar26;
  undefined2 unaff_ES;
  undefined2 unaff_SS;
  undefined1 uVar27;
  bool bVar28;
  char cVar29;
  char cVar30;
  char *local_1a;
  char *local_18;
  uint local_16;
  int *local_14;
  char local_b;
  
  puVar21 = (undefined2 *)&stack0xfffe;
  puVar22 = (undefined2 *)&stack0xfffe;
  puVar24 = (undefined2 *)&stack0xfffe;
  puVar23 = (undefined2 *)&stack0xfffe;
  cVar30 = SBORROW2((int)&stack0xfffe,0x18);
  cVar29 = (int)&local_1a < 0;
  uVar27 = &stack0x0000 == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0x16;
  bVar8 = false;
  bVar28 = true;
  bVar6 = false;
  bVar7 = false;
  local_b = '\0';
  pcVar4 = (code *)swi(0x35);
  uVar9 = (*pcVar4)();
  out(extraout_DX,uVar9);
  pcVar4 = (code *)swi(0x37);
  (*pcVar4)();
  if ((bool)uVar27 || cVar30 != cVar29) {
    do {
                    /* WARNING: Do nothing block with infinite loop */
    } while( true );
  }
  pcVar4 = (code *)swi(0x3d);
  (*pcVar4)();
  piVar25 = (int *)0x8000;
  piVar26 = (int *)0xfffe;
  do {
    pcVar19 = in_BX;
    local_14 = param_4;
    local_16 = param_3;
    local_18 = (char *)0x135b;
    in_BX = (char *)(*param_1)();
    piVar15 = local_14;
    iVar14 = param_5;
    if ((int)in_BX < 0) goto LAB_1000_1459;
    cVar29 = (char)in_BX;
    in_BX = (char *)(int)cVar29;
  } while ((((uint)in_BX & 0x80) == 0) && ((in_BX[0x3a5f] & 1U) != 0));
  iVar1 = param_5 + -1;
  if (0 < param_5) {
    if (cVar29 != '+') {
      piVar20 = piVar26;
      if (cVar29 != '-') goto LAB_1000_13b5;
      bVar8 = true;
    }
    bVar6 = true;
    param_5 = iVar1;
    while (iVar1 = param_5 + -1, 0 < param_5) {
      local_14 = param_4;
      local_16 = param_3;
      local_18 = (char *)0x1397;
      in_BX = (char *)(*param_1)();
      piVar20 = piVar26;
      if ((bVar28) && (bVar6)) {
        if ((char)in_BX == 'I') {
          local_14 = param_4;
          local_16 = param_3;
          local_18 = (char *)0x159d;
          in_BX = (char *)(*param_1)();
          iVar2 = param_5 + -2;
          piVar15 = local_14;
          iVar14 = iVar2;
          if ((iVar1 < 1) || ((char)in_BX != 'N')) goto LAB_1000_1459;
          local_14 = param_4;
          local_16 = param_3;
          local_18 = (char *)0x15b4;
          in_BX = (char *)(*param_1)();
          piVar15 = local_14;
          iVar14 = param_5 + -3;
          if ((iVar2 < 1) || ((char)in_BX != 'F')) goto LAB_1000_1459;
          if (!bVar8) {
            pcVar4 = (code *)swi(0x35);
            (*pcVar4)();
            do {
                    /* WARNING: Do nothing block with infinite loop */
            } while( true );
          }
          pcVar4 = (code *)swi(0x35);
          (*pcVar4)();
          goto LAB_1000_157c;
        }
        if ((char)in_BX == 'N') {
          local_14 = param_4;
          local_16 = param_3;
          local_18 = (char *)0x15df;
          in_BX = (char *)(*param_1)();
          iVar2 = param_5 + -2;
          piVar15 = local_14;
          iVar14 = iVar2;
          if ((iVar1 < 1) || ((char)in_BX != 'A')) goto LAB_1000_1459;
          local_14 = param_4;
          local_16 = param_3;
          local_18 = (char *)0x15f6;
          in_BX = (char *)(*param_1)();
          iVar14 = param_5 + -3;
          piVar15 = local_14;
          if ((iVar2 < 1) || ((char)in_BX != 'N')) goto LAB_1000_1459;
          if (bVar8) {
            pcVar4 = (code *)swi(0x35);
            (*pcVar4)();
            puVar24 = (undefined2 *)&stack0xfffe;
            goto LAB_1000_157c;
          }
          pcVar4 = (code *)swi(0x35);
          in_BX = (char *)(*pcVar4)();
          piVar26 = (int *)((int)piVar26 + 1);
          piVar25 = (int *)((int)piVar25 + 1);
          pcVar19[(int)piVar25] = pcVar19[(int)piVar25] + (char)in_BX;
          goto LAB_1000_1459;
        }
      }
LAB_1000_13b5:
      param_5 = iVar1;
      bVar28 = false;
      bVar10 = (byte)in_BX;
      piVar15 = local_14;
      if (bVar10 == 0x2e) {
        if (piVar25 != (int *)0x8000) goto LAB_1000_1475;
        piVar25 = (int *)0x0;
        piVar26 = piVar20;
        if (0 < (int)piVar20) {
          piVar25 = piVar20;
        }
      }
      else {
        if ((0x39 < bVar10) || (bVar10 < 0x30)) goto LAB_1000_1475;
        cVar29 = bVar10 - 0x30;
        pcVar11 = (char *)(int)cVar29;
        piVar26 = (int *)((int)piVar20 + 1);
        if (piVar26 == (int *)0x0 || (int)piVar20 < -1) {
          local_1a = (char *)CONCAT11(local_1a._1_1_,cVar29);
          in_BX = (char *)(int)cVar29;
          piVar26 = (int *)((int)(undefined2 *)&DAT_4125_0000 + 1);
          if ((cVar29 == '\0') && (piVar26 = (int *)0xffff, piVar25 != (int *)0x8000)) {
            piVar25 = (int *)((int)piVar25 + -1);
          }
        }
        else if ((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 1 < piVar26) {
          in_BX = pcVar11;
          if (piVar26 < (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0xf) {
            uVar5 = (ulong)local_16;
            uVar17 = (uint)(ZEXT24(local_18) * 10 >> 0x10);
            uVar13 = (uint)(ZEXT24(local_18) * 10);
            uVar18 = (uint)(ZEXT24(local_1a) * 10 >> 0x10);
            uVar12 = (uint)(ZEXT24(local_1a) * 10);
            in_BX = pcVar11 + uVar12;
            uVar12 = (uint)CARRY2(uVar12,(uint)pcVar11);
            uVar3 = uVar13 + uVar18;
            local_18 = (char *)(uVar3 + uVar12);
            uVar12 = (uint)(CARRY2(uVar13,uVar18) || CARRY2(uVar3,uVar12));
            local_16 = uVar17 * 2 + uVar12;
            pcVar19 = pcVar11;
            local_1a = in_BX;
            local_14 = (int *)((int)(uVar5 * 10 >> 0x10) * 2 +
                              (uint)(CARRY2(uVar17,uVar17) || CARRY2(uVar17 * 2,uVar12)));
          }
        }
        else {
          uVar12 = (uint)(ZEXT24(local_1a) * 10);
          local_18 = (char *)(uint)(byte)((char)(ZEXT24(local_1a) * 10 >> 0x10) +
                                         CARRY2(uVar12,(uint)pcVar11));
          in_BX = pcVar11 + uVar12;
          pcVar19 = pcVar11;
          local_1a = pcVar11 + uVar12;
        }
      }
    }
  }
  param_5 = iVar1;
  in_BX = (char *)CONCAT11((char)((uint)in_BX >> 8),0x65);
  piVar20 = piVar26;
LAB_1000_1475:
  piVar26 = piVar20;
  iVar14 = param_5;
  if (piVar20 == (int *)0xfffe) {
LAB_1000_1459:
    param_5 = iVar14;
    if (-1 < param_5) {
      local_14 = param_4;
      local_16 = param_3;
      local_1a = (char *)s_Chance36_4125_1467 + 2;
      local_18 = in_BX;
      (*param_2)();
    }
    pcVar4 = (code *)swi(0x35);
    uVar9 = (*pcVar4)();
    out(extraout_DX_00,uVar9);
    puVar23 = (undefined2 *)&stack0xfffe;
  }
  else {
    piVar16 = piVar25;
    if (piVar25 == (int *)0x8000) {
      piVar16 = piVar20;
    }
    piVar26 = (int *)0x0;
    if (((char)in_BX == 'E') || ((char)in_BX == 'e')) {
      iVar14 = param_5 + -1;
      if (0 < param_5) {
        local_14 = param_4;
        local_16 = param_3;
        local_18 = (char *)s__s_fin_4125_14a3;
        in_BX = (char *)(*param_1)();
        param_5 = iVar14;
        if ((char)in_BX != '+') {
          if ((char)in_BX != '-') goto LAB_1000_14c3;
          bVar7 = true;
        }
        while (piVar15 = local_14, 0 < param_5) {
          local_14 = param_4;
          local_16 = param_3;
          local_18 = (char *)s_Couldn_t_load_the_file___s___4125_14aa + 0x17;
          in_BX = (char *)(*param_1)();
          param_5 = param_5 + -1;
LAB_1000_14c3:
          bVar10 = (byte)in_BX;
          piVar15 = local_14;
          if ((0x39 < bVar10) || (bVar10 < 0x30)) goto LAB_1000_14e4;
          piVar26 = (int *)((int)(char)(bVar10 - 0x30) + (int)piVar26 * 10);
          if (0x1344 < (int)piVar26) {
            piVar26 = (int *)0x0;
            local_b = '\x01';
          }
        }
      }
    }
    else {
LAB_1000_14e4:
      local_14 = param_4;
      local_16 = param_3;
      local_1a = (char *)s_Couldn_t_allocate_the_temp_mask_b_4125_14c7 + 0x27;
      local_18 = in_BX;
      (*param_2)();
    }
    if (bVar7) {
      piVar26 = (int *)-(int)piVar26;
      local_b = -local_b;
    }
    piVar25 = piVar16;
    if ((int)piVar20 < 0) {
      pcVar4 = (code *)swi(0x35);
      uVar9 = (*pcVar4)();
      out(extraout_DX_01,uVar9);
      puVar23 = (undefined2 *)&stack0xfffe;
    }
    else {
      piVar15 = piVar16;
      if (local_b == '\x01') {
        local_1a = (char *)0xffff;
        local_18 = (char *)0xffff;
        local_16 = 0xffff;
        local_14 = (int *)0xffff;
        pcVar4 = (code *)swi(0x37);
        (*pcVar4)();
        piVar25 = (int *)((int)piVar16 + 1);
        out((char)*piVar16,extraout_DX_03);
        func_0x00015c04();
      }
      else {
        if (local_b != -1) {
          if (piVar20 < (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0xf)
          goto LAB_1000_154c;
          goto code_r0x00011549;
        }
        pcVar4 = (code *)swi(0x35);
        uVar9 = (*pcVar4)();
        out(extraout_DX_02,uVar9);
        puVar23 = (undefined2 *)&stack0xfffe;
      }
    }
  }
  do {
    cVar30 = '\0';
    cVar29 = *(char *)((int)puVar23 + -5) < '\0';
    bVar28 = *(char *)((int)puVar23 + -5) == '\0';
    puVar24 = puVar23;
    if (bVar28) {
LAB_1000_157c:
      unaff_ES = (undefined2)((ulong)*(int **)(puVar24 + 7) >> 0x10);
      piVar26 = (int *)*(int **)(puVar24 + 7);
code_r0x0001157f:
      *piVar26 = *piVar26 + puVar24[-6];
      **(undefined2 **)(puVar24 + 9) = puVar24[-7];
      return;
    }
    pcVar4 = (code *)swi(0x35);
    (*pcVar4)();
    piVar16 = (int *)((int)piVar15 + -1);
    if (piVar16 == (int *)0x0 || bVar28 != false) {
      if (bVar28 || cVar30 != cVar29) {
        do {
                    /* WARNING: Do nothing block with infinite loop */
        } while( true );
      }
      goto code_r0x0001157f;
    }
    *(uint *)((undefined1 *)((int)puVar23 + (int)piVar26) + -0x7c3d) =
         *(uint *)((undefined1 *)((int)puVar23 + (int)piVar26) + -0x7c3d) ^ (uint)piVar16;
    puVar21 = puVar23;
code_r0x00011549:
    piVar20 = (int *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0xe);
    puVar22 = puVar21;
LAB_1000_154c:
    piVar15 = (int *)((int)piVar16 - (int)piVar20);
    piVar26 = (int *)((int)piVar26 + (int)piVar15);
    pcVar4 = (code *)swi(0x3b);
    (*pcVar4)();
    piVar20 = (int *)((int)piVar25 + 1);
    out((char)*piVar25,extraout_DX_04);
    iVar14 = FUN_1d28_0a63();
    puVar23 = puVar22;
    piVar25 = piVar20;
    if (iVar14 != 0) {
      local_14 = (int *)0x1566;
      FUN_1000_1a35();
      if ((int)piVar26 < 0) {
        pcVar4 = (code *)swi(0x3a);
        (*pcVar4)();
      }
      else {
        pcVar4 = (code *)swi(0x3a);
        (*pcVar4)();
        puVar23 = (undefined2 *)*puVar22;
      }
    }
  } while( true );
}

