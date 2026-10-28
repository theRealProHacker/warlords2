
/* WARNING: Instruction at (ram,0x00011638) overlaps instruction at (ram,0x00011637)
    */

void __cdecl16near FUN_1000_162d(longdouble *param_1,undefined2 param_2,undefined1 *param_3)

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
  undefined1 **unaff_BP;
  undefined1 *puVar7;
  char *unaff_DI;
  undefined2 unaff_ES;
  undefined2 unaff_SS;
  bool bVar8;
  char cVar9;
  char cVar10;
  longdouble in_ST0;
  longdouble lVar11;
  longdouble in_ST1;
  longdouble in_ST2;
  longdouble in_ST3;
  longdouble in_ST4;
  longdouble in_ST5;
  longdouble in_ST6;
  longdouble in_ST7;
  byte bStack_77;
  undefined1 *puStack_2;
  
  do {
    cVar10 = SBORROW2((int)&puStack_2,10);
    cVar9 = (int)&stack0xfff4 < 0;
    bVar8 = &stack0x0000 == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 8;
    puVar7 = param_3;
    lVar11 = in_ST0;
    in_ST0 = in_ST1;
    in_ST1 = in_ST2;
    in_ST2 = in_ST3;
    in_ST3 = in_ST4;
    in_ST4 = in_ST5;
    in_ST5 = in_ST6;
    in_ST6 = in_ST7;
    puStack_2 = (undefined1 *)unaff_BP;
code_r0x00011637:
    do {
      pcVar3 = (code *)swi(0x37);
      (*pcVar3)();
      if (bVar8 || cVar10 != cVar9) {
        in(extraout_DX);
        cVar10 = false;
        bVar5 = (byte)extraout_DX | bStack_77;
        cVar9 = (char)bVar5 < '\0';
        bVar8 = bVar5 == 0;
        if (!bVar8) goto code_r0x00011637;
      }
      else {
        bVar8 = ((uint)puVar7 & 4) == 0;
      }
      if (bVar8) {
        plVar6 = param_1;
        if (((uint)puVar7 & 8) == 0) {
          pcVar3 = (code *)swi(0x37);
          (*pcVar3)();
          puVar1 = puVar7;
          puVar7 = puVar7 + 1;
          out(*puVar1,extraout_DX_02);
          plVar6 = in_BX;
          if ('\0' < (char)((&stack0x0aea)[(int)unaff_DI] & 0xcd)) {
            pcVar3 = (code *)swi(0x39);
            iVar4 = (*pcVar3)();
            cVar9 = *(int *)(&stack0x08ea + (int)unaff_DI) == iVar4;
            pcVar3 = (code *)swi(0x39);
            (*pcVar3)();
            puVar7 = puStack_2;
            if (in_CX != 1 && cVar9 == '\0') goto code_r0x0001165d;
            pcVar3 = (code *)swi(0x3c);
            (*pcVar3)();
            *(float *)param_1 = (float)lVar11;
            goto LAB_1000_16a3;
          }
        }
        pcVar3 = (code *)swi(0x37);
        (*pcVar3)();
        out(*puVar7,extraout_DX_01);
        *plVar6 = lVar11;
        goto LAB_1000_16a3;
      }
      pcVar3 = (code *)swi(0x37);
      (*pcVar3)();
      puVar1 = puVar7;
      puVar7 = puVar7 + 1;
      out(*puVar1,extraout_DX_00);
      cVar10 = false;
      bVar5 = (&stack0x0aea)[(int)unaff_DI] & 0xcd;
      cVar9 = (char)bVar5 < '\0';
      bVar8 = bVar5 == 0;
    } while ((char)bVar5 < '\x01');
    pcVar3 = (code *)swi(0x39);
    cVar9 = (*pcVar3)();
    pcVar2 = unaff_DI;
    unaff_DI = unaff_DI + 1;
    *pcVar2 = cVar9;
    cVar9 = (&stack0x08ea)[(int)unaff_DI] == cVar9;
    pcVar3 = (code *)swi(0x39);
    (*pcVar3)();
    in_CX = in_CX + -1;
    unaff_BP = &puStack_2;
    puVar7 = (undefined1 *)((int)(undefined2 *)&DAT_451b_01c4 + 1);
    in_ST7 = in_ST6;
    if (in_CX == 0 || cVar9 != '\0') {
code_r0x0001165d:
      pcVar3 = (code *)swi(0x3c);
      (*pcVar3)();
      *(double *)param_1 = (double)lVar11;
LAB_1000_16a3:
      pcVar3 = (code *)swi(0x3d);
      (*pcVar3)();
      return;
    }
  } while( true );
}

