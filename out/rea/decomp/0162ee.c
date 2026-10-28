
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unable to track spacebase fully for stack */
/* WARNING: Type propagation algorithm not settling */

code * __cdecl16far
FUN_1555_0d9e(code *param_1,int param_2,int param_3,uint param_4,int param_5,int *param_6,
             undefined2 *param_7)

{
  code *pcVar1;
  byte *pbVar2;
  code *pcVar3;
  char *pcVar4;
  undefined2 *puVar5;
  code *pcVar6;
  long lVar7;
  char cVar8;
  byte bVar9;
  uint uVar10;
  uint uVar11;
  char *pcVar12;
  undefined2 uVar13;
  int iVar14;
  int iVar15;
  code *pcVar16;
  uint in_CX;
  byte bVar17;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  uint uVar18;
  uint uVar19;
  byte bVar20;
  undefined2 in_DX;
  uint uVar21;
  int *piVar22;
  int unaff_SI;
  code *pcVar23;
  undefined1 *puVar24;
  undefined2 *puVar25;
  undefined2 *puVar26;
  int unaff_SS;
  bool bVar27;
  undefined1 uVar28;
  code *in_stack_00000002;
  char acStack_9e [128];
  char *pcStack_1e;
  code *pcStack_1c;
  undefined4 uStack_1a;
  int *local_10;
  code *local_e;
  code *local_c;
  code *local_a;
  code *local_8;
  int local_6;
  undefined2 local_4;
  
  if (DAT_4125_00de == 0) {
    uStack_1a = (char *)0x15556301;
    FUN_1555_02f2();
  }
  if ((param_2 == 0) && (DAT_451b_000c == param_1)) {
    return DAT_451b_000c;
  }
  DAT_451b_000c = param_1;
  DAT_4125_00e0 =
       (uint)(param_1 == (code *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 10));
  uStack_1a = (char *)DAT_451b_0026;
  pcStack_1c = (code *)0x1555;
  pcStack_1e = (char *)0x6333;
  DAT_451b_001a._0_2_ = FUN_1d28_069a();
  uStack_1a = (char *)DAT_451b_0022;
  pcStack_1c = (code *)0x1d28;
  pcStack_1e = (char *)0x6347;
  DAT_451b_001a._2_2_ = in_DX;
  uVar13 = FUN_1d28_069a();
  DAT_451b_0016 = CONCAT22(in_DX,uVar13);
  local_4 = 0x70;
  local_c = (code *)0x8960;
  local_e = (code *)&DAT_451b_0550;
  puVar25 = (undefined2 *)&DAT_451b_04e0;
  do {
    puVar26 = puVar25;
    local_c = local_c + -2;
    local_e = local_e + -1;
    puVar25 = puVar26 + -0x4e;
    iVar15 = local_4 + -1;
    if (local_4 == 0) {
      local_6 = DAT_3c04_157b;
      piVar22 = (int *)(DAT_3c04_157b * 0x41 + 0x157f);
      local_10 = (int *)(DAT_3c04_157b * 0x41 + 0x157d);
      while( true ) {
        piVar22 = (int *)((int)piVar22 + -0x41);
        local_10 = (int *)((int)local_10 + -0x41);
        iVar15 = local_6 + -1;
        if (local_6 == 0) break;
        local_6 = iVar15;
        if (*(char *)(*(byte *)(*piVar22 * 0xe0 + *local_10 * 2) + 0x710) != '\n') {
          uStack_1a = (char *)CONCAT22(*piVar22,*local_10);
          pcStack_1c = (code *)0x1d28;
          pcStack_1e = (char *)0x6549;
          iVar15 = FUN_1555_109d();
          if (iVar15 != 0) {
            iVar15 = *piVar22;
            iVar14 = *local_10 * 0x9c;
            uVar13 = (undefined2)((ulong)DAT_451b_0016 >> 0x10);
            pbVar2 = (byte *)((int)DAT_451b_0016 + iVar14 + iVar15);
            *pbVar2 = *pbVar2 | 0x18;
            pbVar2 = (byte *)(iVar14 + (int)DAT_451b_0016 + iVar15 + 0x9c);
            *pbVar2 = *pbVar2 | 0x18;
            pbVar2 = (byte *)((int)DAT_451b_0016 + iVar14 + iVar15 + 1);
            *pbVar2 = *pbVar2 | 0x18;
            pbVar2 = (byte *)(iVar14 + (int)DAT_451b_0016 + iVar15 + 0x9d);
            *pbVar2 = *pbVar2 | 0x18;
          }
        }
      }
      uStack_1a = (char *)DAT_451b_0026;
      pcStack_1c = (code *)0x1d28;
      pcStack_1e = (char *)0x65c5;
      FUN_1d28_07a9();
      uStack_1a = (char *)DAT_451b_0022;
      pcStack_1c = (code *)0x1d28;
      pcStack_1e = (char *)0x65d2;
      pcVar16 = (code *)FUN_1d28_07a9();
      return pcVar16;
    }
    pcVar16 = (code *)&DAT_4125_009c;
    local_a = local_e;
    local_8 = local_c;
    while( true ) {
      pcVar3 = local_8 + -0xe0;
      local_a = local_a + -0x70;
      pcVar23 = pcVar16 + -1;
      local_4 = iVar15;
      if (pcVar16 == (code *)0x0) break;
      iVar14 = (int)*(char *)((byte)*pcVar3 + 0x710);
      uVar13 = (undefined2)((ulong)DAT_451b_0016 >> 0x10);
      if (param_1 == (code *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 10)) {
        if (((byte)*local_a & 0x1f) == 0) {
          pcVar16 = (code *)(uint)*(byte *)(iVar14 * 2 + 0x1e0);
        }
        else {
          pcVar16 = (code *)((int)(undefined2 *)&DAT_4125_0000 + 1);
        }
        pcVar23[(int)DAT_451b_0016 + (int)puVar25] = SUB21(pcVar16,0);
      }
      else {
        if (((byte)*local_a & 0x1f) == 0) {
          pcVar16 = (code *)(uint)*(byte *)(iVar14 * 2 + 0x1274);
        }
        else {
          pcVar16 = (code *)((int)(undefined2 *)&DAT_4125_0000 + 1);
        }
        pcVar23[(int)DAT_451b_0016 + (int)puVar25] = SUB21(pcVar16,0);
      }
      uVar21 = iVar14 - 1;
      if (uVar21 < 10) {
        piVar22 = (int *)(uVar21 * 2);
        cVar8 = (char)pcVar16;
        switch(uVar21) {
        case 1:
          return pcVar16;
        case 2:
          acStack_9e[(int)puVar26] = acStack_9e[(int)puVar26] + (char)((uint)piVar22 >> 8);
          pcVar16 = (code *)FUN_17be_0b0a();
          return pcVar16;
        case 3:
          iVar15 = 0;
          while( true ) {
            if (*(int *)((undefined4 *)DAT_451b_0ce0)[2] <= iVar15) {
              return (code *)0x0;
            }
            if ((code *)*(int *)((int)*DAT_451b_0ce0 + iVar15 * 0x21) == param_1) break;
            iVar15 = iVar15 + 1;
          }
          return (code *)(uint)*(byte *)((int)*DAT_451b_0ce0 + iVar15 * 0x21 + 4);
        case 4:
          pcVar12 = (char *)((int)puVar26 + -0x9b);
          goto code_r0x00010039;
        case 5:
          piVar22[1] = (int)pcVar16;
          *piVar22 = iVar14;
          return local_e;
        case 6:
          if (-1 < (int)uVar21 && piVar22 != (int *)0x0) {
            uStack_1a = (char *)CONCAT22(param_4,(char *)s_IBMBAK_COM_4125_37d3 + 2);
            iVar15 = FUN_1000_3b24();
            if (iVar15 != 0) {
              pcVar12 = (char *)((param_3 - (int)puVar25) + 1);
              for (; (int)pcVar23 <= (int)param_4; pcVar23 = pcVar23 + 1) {
                FUN_1000_2dc0();
                uStack_1a = (char *)CONCAT22(param_5,pcVar12);
                pcStack_1c = (code *)0x37fb;
                FUN_1000_3ae8();
                param_5 = param_5 + (int)pcVar12 * 2;
              }
              return (code *)((int)(undefined2 *)&DAT_4125_0000 + 1);
            }
          }
          return (code *)0x0;
        case 7:
          pbVar2 = (byte *)(uVar21 * 0x1c0 + (int)puVar25 * 2 + 1);
          *pbVar2 = *pbVar2 & 0xef;
          return pcVar3;
        case 8:
          return pcVar16;
        case 9:
          *(code *)((int)piVar22 + (int)pcVar23) =
               (code)((char)*(code *)((int)piVar22 + (int)pcVar23) + cVar8);
          bVar9 = cVar8 + (char)*(code *)((int)piVar22 + (int)pcVar23);
          *(uint *)(code *)((int)piVar22 + (int)pcVar23) =
               *(int *)(code *)((int)piVar22 + (int)pcVar23) + (uint)bVar9;
          bVar9 = bVar9 + (char)*(code *)((int)piVar22 + (int)pcVar23) +
                  (char)*(code *)((int)piVar22 + (int)pcVar23);
          *(uint *)(code *)((int)piVar22 + (int)pcVar23) =
               *(int *)(code *)((int)piVar22 + (int)pcVar23) + (uint)bVar9;
          *(code *)((int)piVar22 + (int)pcVar23) =
               (code)((char)*(code *)((int)piVar22 + (int)pcVar23) +
                     bVar9 + (char)*(code *)((int)piVar22 + (int)pcVar23));
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        pcVar16 = (code *)((uint)pcVar16 & 0xff77 ^
                          *(uint *)((code *)((int)piVar22 + (int)pcVar23) + 0x2f9));
        bVar27 = (byte)pcVar16 < 0x30;
        local_4._1_1_ = (char)((uint)iVar15 >> 8);
        if ((byte)pcVar16 != 0x30) {
          uStack_1a = (char *)CONCAT22(0x2644,(undefined2)uStack_1a);
          FUN_1000_2524();
          if (!bVar27) {
            uVar28 = false;
            pcVar23 = pcVar16;
            goto LAB_1000_2654;
          }
          local_8 = (code *)0x0;
          uStack_1a = (char *)CONCAT22(param_3,param_2);
          pcStack_1e = (char *)0x25fe;
          pcStack_1c = pcVar16;
          (*param_1)();
          local_6 = local_6 + -1;
          pcVar23 = (code *)0x0;
          goto LAB_1000_26c1;
        }
        uVar28 = (byte)in_CX < 0x10;
        if ((byte)in_CX != 0x10) goto LAB_1000_2654;
        iVar15 = param_5 + -1;
        if (param_5 < 1) goto LAB_1000_26b1;
        local_6 = local_6 + 1;
        uStack_1a = (char *)CONCAT22(param_3,param_2);
        pcStack_1c = (code *)((char *)s_Leader_4125_25d9 + 2);
        uVar21 = (*in_stack_00000002)();
        bVar9 = (byte)uVar21;
        uVar28 = bVar9 < 0x78;
        param_5 = iVar15;
        if ((bVar9 != 0x78) && (uVar28 = bVar9 < 0x58, bVar9 != 0x58)) goto LAB_1000_2667;
        goto LAB_1000_2654;
      }
      pcVar1 = local_8 + -0xdf;
      pcVar16 = pcVar23;
      local_8 = pcVar3;
      if ((char)*pcVar1 < '\0') {
        pcVar23[(int)DAT_451b_0016 + (int)puVar25] =
             (code)((byte)pcVar23[(int)DAT_451b_0016 + (int)puVar25] | 0x10);
      }
    }
  } while( true );
code_r0x00010039:
  if (in_CX == 0) {
LAB_1000_007e:
    pcVar16 = (code *)FUN_1000_027a();
    return pcVar16;
  }
  piVar22 = (int *)((int)piVar22 + 1);
  if (*pcVar12 == cVar8) {
    DAT_4125_0075 = -(in_CX | 0x8000);
    DAT_4125_0079 = (int)piVar22 * 4 + 0x10U & 0xfff0;
    if (DAT_4125_26ca < 0x200) {
      DAT_4125_26ca = (undefined1 *)0x200;
    }
    bVar9 = 4;
    puVar24 = (undefined1 *)(((uint)DAT_4125_26ca >> 4) + 1);
    if (puVar24 <= &stack0xfffe + -unaff_SS) {
      DAT_4125_0089 = puVar24 + unaff_SS;
      uStack_1a = (char *)CONCAT22(puVar24,(undefined2)uStack_1a);
      pcVar6 = (code *)swi(0x21);
      DAT_4125_008d = DAT_4125_0089;
      (*pcVar6)();
      puVar24 = (undefined1 *)(unaff_SI << (bVar9 & 0x1f));
      puVar25 = (undefined2 *)&DAT_451b_0000;
      DAT_4125_26ca = puVar24;
      for (pcVar12 = (char *)s_Your_Upkeep_4125_3201 + 5; pcVar12 != (char *)0x0;
          pcVar12 = pcVar12 + -1) {
        puVar5 = puVar25;
        puVar25 = (undefined2 *)((int)puVar25 + 1);
        *(undefined1 *)puVar5 = 0;
      }
      if (((0x14 < DAT_4125_3cfc) && (bVar27 = DAT_4125_007d < 3, !bVar27)) &&
         ((3 < DAT_4125_007d || (bVar27 = DAT_4125_007e < 0x1e, !bVar27)))) {
        pcVar6 = (code *)swi(0x21);
        (*pcVar6)();
        if (!bVar27) {
          pcVar6 = (code *)swi(0x21);
          (*pcVar6)();
          if (!bVar27) {
            pcVar6 = (code *)swi(0x21);
            iVar15 = (*pcVar6)();
            if (!bVar27) {
              DAT_4125_0091 = iVar15 + 1;
              pcVar6 = (code *)swi(0x21);
              (*pcVar6)();
              if (!bVar27) {
                pcVar6 = (code *)swi(0x21);
                (*pcVar6)();
                if (!bVar27) goto LAB_1000_010c;
              }
            }
          }
        }
        pcVar16 = (code *)FUN_1000_027a();
        return pcVar16;
      }
LAB_1000_010c:
      pcVar6 = (code *)swi(0x1a);
      cVar8 = (*pcVar6)();
      if (cVar8 != '\0') {
        DAT_0000_0470 = 1;
      }
      DAT_4125_0081 = extraout_DX_00;
      DAT_4125_0083 = pcVar12;
      *(undefined2 *)(puVar24 + -2) = 0x138;
      FUN_1000_01ed();
      *(undefined2 *)(puVar24 + -2) = DAT_4125_0073;
      *(undefined2 *)(puVar24 + -4) = DAT_4125_0071;
      *(undefined2 *)(puVar24 + -6) = DAT_4125_006f;
      *(undefined2 *)(puVar24 + -8) = DAT_4125_006d;
      *(undefined2 *)(puVar24 + -10) = DAT_4125_006b;
      *(undefined2 *)(puVar24 + -0xc) = 0x1000;
      *(undefined2 *)(puVar24 + -0xe) = 0x151;
      uVar13 = FUN_1a4c_000b();
      *(undefined2 *)(puVar24 + -0xc) = uVar13;
      *(undefined2 *)(puVar24 + -0xe) = 0x1a4c;
      *(undefined2 *)(puVar24 + -0x10) = 0x157;
      FUN_1000_1cc7();
      *(undefined2 *)(puVar24 + -0xe) = 0x3f2a;
      *(undefined2 *)(puVar24 + -0x10) = 0x3f54;
      *(undefined2 *)(puVar24 + -0x12) = 0x167;
      pcVar16 = (code *)FUN_1000_0231();
      return pcVar16;
    }
    goto LAB_1000_007e;
  }
  do {
    if (in_CX == 0) break;
    in_CX = in_CX - 1;
    pcVar4 = pcVar12;
    pcVar12 = pcVar12 + 1;
  } while (cVar8 != *pcVar4);
  goto code_r0x00010039;
LAB_1000_26a1:
  uStack_1a = (char *)CONCAT22(param_3,param_2);
  pcStack_1e = (char *)s_DATA_ERROR_DAT_4125_26a4 + 7;
  pcStack_1c = (code *)uVar21;
  (*param_1)();
  local_6 = local_6 + -1;
LAB_1000_26b1:
  local_8 = pcVar3;
  if (local_4._1_1_ != '\0') {
    pcVar23 = (code *)-(int)pcVar23;
  }
  goto LAB_1000_26c1;
  while( true ) {
    local_6 = local_6 + 1;
    uStack_1a = (char *)CONCAT22(param_3,param_2);
    pcStack_1c = (code *)0x2665;
    uVar21 = (*in_stack_00000002)();
    param_5 = param_5 + -1;
LAB_1000_2667:
    uStack_1a = (char *)CONCAT22(0x266e,(undefined2)uStack_1a);
    FUN_1000_2524();
    if ((bool)uVar28) goto LAB_1000_26a1;
    uVar18 = (uint)(ZEXT24(pcVar23) * (ulong)param_4 >> 0x10);
    uVar10 = (uint)(ZEXT24(pcVar23) * (ulong)param_4);
    pcVar23 = (code *)(uVar21 + uVar10);
    uVar21 = (uint)CARRY2(uVar21,uVar10);
    uVar10 = (int)puVar25 + uVar18;
    uVar28 = CARRY2((uint)puVar25,uVar18) || CARRY2(uVar10,uVar21);
    uVar10 = uVar10 + uVar21;
    puVar25 = (undefined2 *)0x0;
    if (uVar10 != 0) break;
LAB_1000_2654:
    if (param_5 < 1) goto LAB_1000_26b1;
  }
  do {
    if (param_5 < 1) goto LAB_1000_26b1;
    local_6 = local_6 + 1;
    uStack_1a = (char *)CONCAT22(param_3,param_2);
    pcStack_1c = (code *)((char *)s_FDATA_STRING_DAT_4125_2693 + 2);
    uVar21 = (*in_stack_00000002)();
    uStack_1a = (char *)CONCAT22((char *)s_FDATA_STRING_DAT_4125_2693 + 0xb,(undefined2)uStack_1a);
    uVar18 = param_4;
    FUN_1000_2524();
    if ((bool)uVar28) goto LAB_1000_26a1;
    uVar19 = (uint)(ZEXT24(pcVar23) * (ulong)uVar18 >> 0x10);
    uVar11 = (uint)(ZEXT24(pcVar23) * (ulong)uVar18);
    lVar7 = (ulong)uVar10 * (ulong)uVar18;
    pcVar23 = (code *)(uVar21 + uVar11);
    uVar21 = (uint)CARRY2(uVar21,uVar11);
    uVar10 = (uint)lVar7 + uVar19;
    bVar27 = CARRY2((uint)lVar7,uVar19) || CARRY2(uVar10,uVar21);
    uVar10 = uVar10 + uVar21;
    bVar17 = (byte)((ulong)lVar7 >> 0x10);
    bVar20 = (byte)((ulong)lVar7 >> 0x18);
    bVar9 = bVar17 + bVar20;
    uVar28 = CARRY1(bVar17,bVar20) || CARRY1(bVar9,bVar27);
    param_5 = param_5 + -1;
  } while ((byte)(bVar9 + bVar27) == '\0');
  pcVar23 = (code *)CONCAT11((local_4._1_1_ != '\0') + -1,local_4._1_1_ + -1);
  local_8 = (code *)&DAT_4125_0002;
LAB_1000_26c1:
  *param_6 = *param_6 + local_6;
  *param_7 = local_8;
  return pcVar23;
}

