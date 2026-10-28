
/* WARNING: Instruction at (ram,0x00010202) overlaps instruction at (ram,0x00010201)
    */
/* WARNING: Unable to track spacebase fully for stack */

void __cdecl16far
FUN_1a4c_0388(undefined4 param_1,int param_2,int param_3,int param_4,int param_5,undefined4 param_6,
             int param_7,int param_8)

{
  int *piVar1;
  char *pcVar2;
  undefined2 *puVar3;
  byte bVar4;
  byte bVar5;
  byte bVar6;
  code *pcVar7;
  char cVar8;
  byte bVar9;
  undefined2 uVar10;
  byte *pbVar11;
  uint uVar12;
  uint in_CX;
  byte bVar13;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  char *in_DX;
  int iVar14;
  int iVar15;
  int iVar16;
  char *pcVar17;
  char *unaff_SI;
  undefined1 *puVar18;
  undefined2 *puVar19;
  char *pcVar20;
  int unaff_DI;
  undefined2 unaff_ES;
  undefined2 uVar21;
  undefined2 uVar22;
  int unaff_SS;
  bool bVar23;
  undefined4 uVar24;
  int iStackY_1a;
  int iStackY_14;
  int iStackY_12;
  int iStackY_10;
  undefined4 uStackY_e;
  byte *pbVar25;
  long lVar26;
  
  FUN_1000_43ac(0x2848,0x4125,param_1);
  FUN_1a4c_030c();
  if (5 < DAT_4125_3280 - 1U) {
    FUN_1000_3708();
    FUN_1a4c_02b5();
    return;
  }
  pcVar17 = (char *)((DAT_4125_3280 - 1U) * 2);
  switch(DAT_4125_3280) {
  case 1:
    do {
      uVar10 = *(undefined2 *)(pcVar17 + 0x1c);
      piVar1 = (int *)(pcVar17 + 0x1a);
      unaff_ES = (undefined2)((ulong)param_1 >> 0x10);
      pbVar11 = (byte *)(*piVar1 + param_3 * *(int *)((int)param_1 + 8) * 2 +
                        (param_2 >> (DAT_451b_2a3e & 0x1f)));
      while( true ) {
        pbVar25 = (byte *)CONCAT22(uVar10,pbVar11);
        uVar10 = (undefined2)((ulong)param_6 >> 0x10);
        iVar16 = (int)param_6;
        if (((*(uint *)(iVar16 + 0x35) & 1) == 0) || (param_8 < *(int *)(iVar16 + 6))) {
          iVar15 = iVar16 + unaff_DI * 4;
          uVar21 = *(undefined2 *)(iVar15 + 0x1c);
          pbVar11 = (byte *)(*(int *)(iVar15 + 0x1a) + param_8 * *(int *)(iVar16 + 8) * 2 +
                            (param_7 >> (DAT_451b_2a3e & 0x1f)));
        }
        else {
          uVar22 = (undefined2)((ulong)*(undefined4 *)(iVar16 + 0x37) >> 0x10);
          iVar15 = (int)*(undefined4 *)(iVar16 + 0x37) + unaff_DI * 4;
          uVar21 = *(undefined2 *)(iVar15 + 0x1c);
          pbVar11 = (byte *)(*(int *)(iVar15 + 0x1a) +
                             (param_8 - *(int *)(iVar16 + 6)) *
                             *(int *)((int)*(undefined4 *)(iVar16 + 0x37) + 8) * 2 +
                            (param_7 >> (DAT_451b_2a3e & 0x1f)));
        }
        uStackY_e = (byte *)CONCAT22(uVar21,pbVar11);
        iVar15 = *(int *)((int)param_1 + 8);
        iVar16 = *(int *)(iVar16 + 8);
        iStackY_12 = param_5;
        while (iStackY_12 != 0) {
          iVar14 = param_4;
          bVar13 = *uStackY_e & *(byte *)(iStackY_10 + 0x3402);
          while (uVar10 = (undefined2)((ulong)pbVar25 >> 0x10), iVar14 != 0) {
            bVar9 = *pbVar25;
            bVar4 = *(byte *)(iStackY_10 + 0x33fa);
            bVar5 = *(byte *)(iStackY_10 + 0x3412);
            *uStackY_e = (byte)((int)(char)*pbVar25 >> ((byte)iStackY_10 & 0x1f)) &
                         *(byte *)(iStackY_10 + 0x340a) | bVar13;
            pbVar25 = (byte *)CONCAT22(uVar10,(byte *)pbVar25 + 1);
            uStackY_e = (byte *)CONCAT22(uStackY_e._2_2_,(byte *)uStackY_e + 1);
            iVar14 = iVar14 + -1;
            bVar13 = (bVar9 & bVar4) << (bVar5 & 0x1f);
          }
          bVar9 = (char)iStackY_14 + (byte)iStackY_10;
          lVar26 = (ulong)CONCAT21((int)(((ulong)bVar13 << 0x18) >> 0x10),bVar9) << 8;
          if (DAT_451b_2a44 < (int)(uint)bVar9) {
            bVar4 = *pbVar25;
            bVar5 = *(byte *)(iStackY_10 + 0x33fa);
            bVar6 = *(byte *)(iStackY_10 + 0x3412);
            bVar9 = *(byte *)(((uint)bVar9 - DAT_451b_2a48) + 0x3402);
            *uStackY_e = (byte)((int)(char)*pbVar25 >> ((byte)iStackY_10 & 0x1f)) &
                         *(byte *)(iStackY_10 + 0x340a) | bVar13;
            bVar13 = ((byte *)uStackY_e)[1] &
                     *(byte *)((((uint)lVar26 >> 8) - DAT_451b_2a48) + 0x340a) |
                     (bVar4 & bVar5) << (bVar6 & 0x1f) & bVar9;
            uVar21 = CONCAT11(0xff,bVar13);
            ((byte *)uStackY_e)[1] = bVar13;
          }
          else {
            uVar21 = 0xffff;
            if (bVar9 != 0) {
              if (iStackY_14 != 0) {
                lVar26 = CONCAT13(bVar13 | (byte)((int)(uint)(*pbVar25 &
                                                             *(byte *)(iStackY_14 + 0x3402)) >>
                                                 ((byte)iStackY_10 & 0x1f)),(int3)lVar26);
              }
              bVar13 = *uStackY_e & *(byte *)((byte)((ulong)lVar26 >> 8) + 0x340a) |
                       (byte)((ulong)lVar26 >> 0x18);
              uVar21 = CONCAT11(0xff,bVar13);
              *uStackY_e = bVar13;
            }
          }
          uStackY_e = (byte *)CONCAT22(uStackY_e._2_2_,(byte *)uStackY_e + (iVar16 * 2 - param_4));
          pbVar25 = (byte *)CONCAT22(uVar10,(byte *)pbVar25 + (iVar15 * 2 - param_4));
          iStackY_12 = iStackY_12 + -1;
        }
        iVar16 = (int)param_1 + unaff_DI * 4;
        if ((*(int *)(iVar16 + 10) != 0 || *(int *)(iVar16 + 0xc) != 0) &&
           ((*(uint *)((int)param_1 + 0x35) & 10) == 0)) {
          FUN_1d28_07a9(*(undefined2 *)((int)param_1 + unaff_DI * 4 + 10));
        }
        unaff_DI = unaff_DI + 1;
        if ((int)(uint)*(byte *)((int)param_1 + 0x34) <= unaff_DI) {
          return;
        }
        if (((iStackY_1a != 0) &&
            (iVar16 = (int)param_1 + unaff_DI * 4,
            *(int *)(iVar16 + 10) != 0 || *(int *)(iVar16 + 0xc) != 0)) &&
           ((*(uint *)((int)param_1 + 0x35) & 10) == 0)) {
          uVar10 = FUN_1d28_069a(*(undefined2 *)((int)param_1 + unaff_DI * 4 + 10));
          iVar16 = (int)param_1 + unaff_DI * 4;
          *(undefined2 *)(iVar16 + 0x1c) = uVar21;
          *(undefined2 *)(iVar16 + 0x1a) = uVar10;
        }
        FUN_1e68_0018();
        if (((*(uint *)((int)param_1 + 0x35) & 1) == 0) || (param_3 < *(int *)((int)param_1 + 6)))
        break;
        uVar21 = (undefined2)((ulong)*(undefined4 *)((int)param_1 + 0x37) >> 0x10);
        iVar16 = (int)*(undefined4 *)((int)param_1 + 0x37) + unaff_DI * 4;
        uVar10 = *(undefined2 *)(iVar16 + 0x1c);
        pbVar11 = (byte *)(*(int *)(iVar16 + 0x1a) +
                           (param_3 - *(int *)((int)param_1 + 6)) *
                           *(int *)((int)*(undefined4 *)((int)param_1 + 0x37) + 8) * 2 +
                          (param_2 >> (DAT_451b_2a3e & 0x1f)));
      }
      pcVar17 = (char *)((int)param_1 + unaff_DI * 4);
    } while( true );
  default:
                    /* WARNING: Read-only address (ram,0x00010291) is written */
    uRam00010291 = 0x4125;
    pcVar7 = (code *)swi(0x21);
    uVar24 = (*pcVar7)();
    uVar10 = s_Borland_C_____Copyright_1991_Bor_4125_0004._40_2_;
    iVar16 = DAT_4125_0002;
    uVar21 = (undefined2)((ulong)uVar24 >> 0x10);
    *(undefined2 *)&DAT_4125_007d = (int)uVar24;
    *(undefined2 *)&DAT_4125_007b = unaff_ES;
    *(undefined2 *)(char *)&DAT_4125_0077 = uVar10;
    *(int *)&DAT_4125_0091 = iVar16;
    FUN_1000_017d();
    iVar15 = 0;
    pcVar17 = (char *)0x0;
    uVar12 = 0x7fff;
    break;
  case 5:
    pcVar20 = (char *)(unaff_DI + -1);
    *(char **)(&stack0xfffe + (int)unaff_SI) = unaff_SI + *(int *)(&stack0xfffe + (int)unaff_SI);
    uVar12 = in(in_DX);
    do {
      if (in_CX < uVar12) {
        uVar12 = in_CX;
        in_DX = pcVar17;
      }
      do {
        pcVar17 = pcVar17 + 6;
        while (pcVar17 == pcVar20) {
          if (in_DX == pcVar20) {
            return;
          }
          cVar8 = *in_DX;
          *in_DX = -1;
          if (cVar8 == '\0') {
            (**(code **)(in_DX + 2))();
          }
          else {
            (**(code **)(in_DX + 2))();
          }
          uVar12 = 0x100;
          in_DX = pcVar20;
          pcVar17 = unaff_SI;
        }
      } while (*pcVar17 == -1);
      in_CX = (uint)(byte)pcVar17[1];
    } while( true );
  }
LAB_1000_0037:
  do {
    if (uVar12 != 0) {
      uVar12 = uVar12 - 1;
      pcVar2 = pcVar17;
      pcVar17 = pcVar17 + 1;
      if (*pcVar2 != '\0') goto LAB_1000_0037;
    }
    if (uVar12 == 0) goto LAB_1000_007e;
    iVar15 = iVar15 + 1;
  } while (*pcVar17 != '\0');
  *(int *)&DAT_4125_0075 = -(uVar12 | 0x8000);
  *(uint *)&DAT_4125_0079 = iVar15 * 4 + 0x10U & 0xfff0;
  if (DAT_4125_26ca < 0x200) {
    DAT_4125_26ca = (undefined1 *)0x200;
  }
  bVar13 = 4;
  uVar12 = ((uint)DAT_4125_26ca >> 4) + 1;
  if ((uint)(iVar16 - unaff_SS) < uVar12) {
LAB_1000_007e:
    FUN_1000_027a();
    return;
  }
  iVar16 = uVar12 + unaff_SS;
  *(int *)&DAT_4125_0089 = iVar16;
  *(int *)&DAT_4125_008d = iVar16;
  pcVar7 = (code *)swi(0x21);
  (*pcVar7)();
  puVar18 = (undefined1 *)((int)param_1 << (bVar13 & 0x1f));
  puVar19 = (undefined2 *)&DAT_451b_0000;
  DAT_4125_26ca = puVar18;
  for (pcVar17 = (char *)s_Your_Upkeep_4125_3201 + 5; pcVar17 != (char *)0x0; pcVar17 = pcVar17 + -1
      ) {
    puVar3 = puVar19;
    puVar19 = (undefined2 *)((int)puVar19 + 1);
    *(undefined1 *)puVar3 = 0;
  }
  if (0x14 < *(uint *)&DAT_4125_3cfc) {
    bVar23 = *(byte *)&DAT_4125_007d < 3;
    if ((!bVar23) &&
       ((3 < *(byte *)&DAT_4125_007d || (bVar23 = *(byte *)&DAT_4125_007e < 0x1e, !bVar23)))) {
      pcVar7 = (code *)swi(0x21);
      (*pcVar7)();
      if (!bVar23) {
        pcVar7 = (code *)swi(0x21);
        (*pcVar7)();
        if (!bVar23) {
          pcVar7 = (code *)swi(0x21);
          iVar16 = (*pcVar7)();
          if (!bVar23) {
            *(int *)&DAT_4125_0091 = iVar16 + 1;
            pcVar7 = (code *)swi(0x21);
            (*pcVar7)();
            if (!bVar23) {
              pcVar7 = (code *)swi(0x21);
              (*pcVar7)();
              if (!bVar23) goto LAB_1000_010c;
            }
          }
        }
      }
      FUN_1000_027a();
      return;
    }
  }
LAB_1000_010c:
  pcVar7 = (code *)swi(0x1a);
  cVar8 = (*pcVar7)();
  *(undefined2 *)&DAT_4125_0081 = extraout_DX_00;
  *(undefined2 *)&DAT_4125_0083 = pcVar17;
  if (cVar8 != '\0') {
    DAT_0000_0470 = 1;
  }
  *(undefined2 *)(puVar18 + -2) = 0x138;
  FUN_1000_01ed();
  *(undefined2 *)(puVar18 + -2) = *(undefined2 *)&DAT_4125_0073;
  *(undefined2 *)(puVar18 + -4) = *(undefined2 *)&DAT_4125_0071;
  *(undefined2 *)(puVar18 + -6) = *(undefined2 *)&DAT_4125_006f;
  *(undefined2 *)(puVar18 + -8) = *(undefined2 *)&DAT_4125_006d;
  *(undefined2 *)(puVar18 + -10) = *(undefined2 *)&DAT_4125_006b;
  *(undefined2 *)(puVar18 + -0xc) = 0x1000;
  *(undefined2 *)(puVar18 + -0xe) = 0x151;
  uVar10 = FUN_1a4c_000b();
  *(undefined2 *)(puVar18 + -0xc) = uVar10;
  *(undefined2 *)(puVar18 + -0xe) = 0x1a4c;
  *(undefined2 *)(puVar18 + -0x10) = 0x157;
  FUN_1000_1cc7();
  *(undefined2 *)(puVar18 + -0xe) = 0x3f2a;
  *(undefined2 *)(puVar18 + -0x10) = 0x3f54;
  *(undefined2 *)(puVar18 + -0x12) = 0x167;
  FUN_1000_0231();
  return;
}

