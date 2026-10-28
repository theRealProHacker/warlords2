
/* WARNING: Instruction at (ram,0x00011638) overlaps instruction at (ram,0x00011637)
    */

void FUN_1000_1625(undefined2 param_1,longdouble *param_2,undefined2 param_3,undefined1 *param_4)

{
  undefined1 *puVar1;
  char *pcVar2;
  code *pcVar3;
  int iVar4;
  int in_CX;
  byte bVar5;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  undefined2 extraout_DX_01;
  undefined2 extraout_DX_02;
  longdouble *in_BX;
  longdouble *plVar6;
  undefined1 *puVar7;
  undefined1 *puVar8;
  char *unaff_DI;
  undefined2 unaff_ES;
  undefined2 unaff_SS;
  bool bVar9;
  char cVar10;
  char cVar11;
  longdouble lVar12;
  longdouble in_ST1;
  longdouble in_ST2;
  longdouble in_ST3;
  longdouble in_ST4;
  longdouble in_ST5;
  longdouble in_ST6;
  longdouble in_ST7;
  longdouble lVar13;
  byte bStack_75;
  
  pcVar3 = (code *)swi(0x39);
  (*pcVar3)();
  puVar7 = &stack0xfffe;
  do {
    lVar12 = in_ST1;
    cVar11 = SBORROW2((int)&stack0x0000,10);
    cVar10 = (int)&stack0xfff6 < 0;
    bVar9 = &stack0x0000 == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 6;
    puVar8 = param_4;
    lVar13 = in_ST7;
code_r0x00011637:
    do {
      pcVar3 = (code *)swi(0x37);
      (*pcVar3)();
      if (bVar9 || cVar11 != cVar10) {
        in(extraout_DX);
        cVar11 = false;
        bVar5 = (byte)extraout_DX | bStack_75;
        cVar10 = (char)bVar5 < '\0';
        bVar9 = bVar5 == 0;
        if (!bVar9) goto code_r0x00011637;
      }
      else {
        bVar9 = ((uint)puVar8 & 4) == 0;
      }
      if (bVar9) {
        plVar6 = param_2;
        if (((uint)puVar8 & 8) == 0) {
          pcVar3 = (code *)swi(0x37);
          (*pcVar3)();
          puVar1 = puVar8;
          puVar8 = puVar8 + 1;
          out(*puVar1,extraout_DX_02);
          plVar6 = in_BX;
          if ('\0' < (char)(unaff_DI[(int)&stack0x0aec] & 0xcdU)) {
            pcVar3 = (code *)swi(0x39);
            iVar4 = (*pcVar3)();
            cVar10 = *(int *)(unaff_DI + (int)&stack0x08ec) == iVar4;
            pcVar3 = (code *)swi(0x39);
            (*pcVar3)();
            puVar8 = puVar7;
            if (in_CX != 1 && cVar10 == '\0') goto code_r0x0001165d;
            pcVar3 = (code *)swi(0x3c);
            (*pcVar3)();
            *(float *)param_2 = (float)lVar12;
            goto LAB_1000_16a3;
          }
        }
        pcVar3 = (code *)swi(0x37);
        (*pcVar3)();
        out(*puVar8,extraout_DX_01);
        *plVar6 = lVar12;
        goto LAB_1000_16a3;
      }
      pcVar3 = (code *)swi(0x37);
      (*pcVar3)();
      puVar1 = puVar8;
      puVar8 = puVar8 + 1;
      out(*puVar1,extraout_DX_00);
      cVar11 = false;
      bVar5 = unaff_DI[(int)&stack0x0aec] & 0xcd;
      cVar10 = (char)bVar5 < '\0';
      bVar9 = bVar5 == 0;
    } while ((char)bVar5 < '\x01');
    pcVar3 = (code *)swi(0x39);
    cVar10 = (*pcVar3)();
    pcVar2 = unaff_DI;
    unaff_DI = unaff_DI + 1;
    *pcVar2 = cVar10;
    cVar10 = unaff_DI[(int)&stack0x08ec] == cVar10;
    pcVar3 = (code *)swi(0x39);
    (*pcVar3)();
    in_CX = in_CX + -1;
    puVar7 = (undefined1 *)register0x00000010;
    puVar8 = (undefined1 *)((int)(undefined2 *)&DAT_451b_01c4 + 1);
    in_ST1 = in_ST2;
    in_ST2 = in_ST3;
    in_ST3 = in_ST4;
    in_ST4 = in_ST5;
    in_ST5 = in_ST6;
    in_ST6 = in_ST7;
    in_ST7 = lVar13;
    if (in_CX == 0 || cVar10 != '\0') {
code_r0x0001165d:
      pcVar3 = (code *)swi(0x3c);
      (*pcVar3)();
      *(double *)param_2 = (double)lVar12;
LAB_1000_16a3:
      pcVar3 = (code *)swi(0x3d);
      (*pcVar3)();
      return;
    }
  } while( true );
}

