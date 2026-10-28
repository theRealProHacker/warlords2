
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint __cdecl16far FUN_85d0_15ff(long param_1,int param_2)

{
  int *piVar1;
  char *pcVar2;
  undefined2 *puVar3;
  uint uVar4;
  int in_DX;
  char cVar5;
  int iVar6;
  int unaff_SI;
  int iVar7;
  int unaff_DI;
  undefined2 uVar8;
  undefined2 unaff_SS;
  undefined2 *puStack_16;
  undefined2 *puStack_14;
  undefined2 *puStack_12;
  int in_stack_0000fff0;
  int in_stack_0000fff2;
  int in_stack_0000fff4;
  int in_stack_0000fff6;
  int iVar9;
  uint uVar10;
  long in_stack_0000fff8;
  
  uVar4 = 0x3c04;
  if (DAT_3c04_0124 == 0) {
    uVar4 = 1;
  }
  else {
    if ((uint)param_1 < 4) {
      cVar5 = (char)((uint)in_DX >> 8);
      switch((uint)param_1) {
      case 0:
        *(char *)(unaff_DI + 3) = *(char *)(unaff_DI + 3) + cVar5;
        return uVar4;
      case 1:
        pcVar2 = (char *)((int)((uint)param_1 * 2) + param_2);
        *pcVar2 = *pcVar2 + '\x04';
        (&stack0xfffe)[unaff_DI] = (&stack0xfffe)[unaff_DI] + cVar5;
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      case 2:
        piVar1 = (int *)((uint)param_1 * 2);
        *piVar1 = *piVar1 + -0x3c04;
        while( true ) {
          in_DX = in_DX + 1;
          uVar8 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
          if (6 < in_DX) break;
          piVar1 = (int *)((int)DAT_451b_1d82 + in_DX * 2);
          *piVar1 = *piVar1 - unaff_SI;
        }
        DAT_4125_2a49 = *(undefined2 *)((int)DAT_451b_1d82 + DAT_451b_1d86 * 2);
        func_0x0008fd36(0x8000,1);
        FUN_7f3a_0d45();
        uVar4 = func_0x0008fe26();
        return uVar4;
      }
switchD_8000_7329_caseD_3:
      if (((((uVar4 >> 5 & 1) == 0) &&
           (iVar7 = (int)((ulong)in_stack_0000fff8 >> 0x10),
           (*(byte *)(iVar7 * 0x70 + unaff_DI + 1) & 0x20) == 0)) &&
          ((*(byte *)(iVar7 * 0x70 + unaff_DI + 0x70) & 0x20) == 0)) &&
         ((*(byte *)(iVar7 * 0x70 + unaff_DI + 0x71) & 0x20) == 0)) goto LAB_830b_12bb;
      do {
        puVar3 = puStack_14;
        uVar4 = unaff_DI * 2 - 1;
        uVar10 = uVar4 & 7;
        iVar7 = ((int)uVar4 >> 3) * 8;
        if (puStack_12 == (undefined2 *)0x0) {
LAB_830b_113f:
          if (*(char *)(*(byte *)(*(int *)(unaff_SI * 0x41 + 0x157f) * 0xe0 +
                                 *(int *)(unaff_SI * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
            if (*(char *)(unaff_SI * 0x41 + 0x1592) == '\x0f') {
              iVar6 = 8;
            }
            else {
              iVar6 = (int)*(char *)(unaff_SI * 0x41 + 0x1592);
            }
          }
          else {
            iVar6 = -1;
          }
          if (-1 < iVar6) {
            FUN_1997_034a();
            iVar9 = 0x1997;
            FUN_1997_060a();
            in_stack_0000fff2 = *(int *)(iVar6 * 8 + 0x2c30) + iVar9 * *(int *)(iVar6 * 8 + 0x2c34);
            in_stack_0000fff4 = 0x576c;
            puStack_14 = puStack_16;
            puStack_12 = puVar3;
            puStack_16 = (undefined2 *)*(undefined2 *)(iVar6 * 8 + 0x2c34);
            in_stack_0000fff0 = iVar7;
            (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iVar6 * 8 + 0x2c2e),
                             *(int *)(iVar6 * 8 + 0x2c30) +
                             *(int *)(iVar6 * 8 + 0x2c2e) * *(int *)(iVar6 * 8 + 0x2c34),
                             *(undefined2 *)(iVar6 * 8 + 0x2c32));
            uVar10 = 0x1997;
            in_stack_0000fff6 = 0x42ef;
            FUN_1997_06bb();
          }
          if (unaff_SI == param_2) {
            iVar7 = iVar7 + uVar10;
            FUN_2012_0bb7(0x6795,0x4125,iVar7 + -1,0xe);
            FUN_2012_0bb7(0x6795,0x4125,iVar7 + -1,0x18);
            FUN_2012_0f08(0x6795,0x4125,iVar7 + -1,0xe);
            in_stack_0000fff6 = 0xe;
            in_stack_0000fff4 = iVar7 + 9;
            in_stack_0000fff2 = 0x4125;
            in_stack_0000fff0 = 0x6795;
            puStack_12 = (undefined2 *)0x2012;
            puStack_14 = (undefined2 *)&DAT_451b_0408;
            FUN_2012_0f08();
          }
        }
        else {
          iVar7 = iVar7 - DAT_451b_1f3a;
          iVar6 = ((int)((ulong)in_stack_0000fff8 >> 0x10) * 2 + -1) - _DAT_451b_1f3c;
          if (((-1 < iVar7) && (-1 < iVar6)) && ((iVar7 < 0x11 && (iVar6 < 0x17))))
          goto LAB_830b_113f;
        }
LAB_830b_12bb:
        while( true ) {
          unaff_SI = unaff_SI + 1;
          if ((int)DAT_3c04_157b <= unaff_SI) {
            return DAT_3c04_157b;
          }
          unaff_DI = *(int *)(unaff_SI * 0x41 + 0x157d);
          uVar4 = *(uint *)(unaff_SI * 0x41 + 0x157f);
          in_stack_0000fff8 = (ulong)uVar4 << 0x10;
          if (DAT_3c04_0124 == 0) break;
          if ((param_1 == 0) ||
             (((in_stack_0000fff0 <= unaff_DI &&
               (unaff_DI <= in_stack_0000fff0 + in_stack_0000fff4 + -1)) &&
              ((in_stack_0000fff2 <= (int)uVar4 &&
               ((int)uVar4 <= in_stack_0000fff2 + in_stack_0000fff6 + -1)))))) {
            if (DAT_4125_3254 == 0) {
              uVar4 = CONCAT11(0x29,*(undefined1 *)(uVar4 * 0x70 + unaff_DI));
              goto switchD_8000_7329_caseD_3;
            }
            if ((((*(char *)(uVar4 * 0x70 + unaff_DI) < '\0') ||
                 (*(char *)(uVar4 * 0x70 + unaff_DI + 1) < '\0')) ||
                (*(char *)(uVar4 * 0x70 + unaff_DI + 0x70) < '\0')) ||
               (*(char *)(uVar4 * 0x70 + unaff_DI + 0x71) < '\0')) break;
          }
        }
      } while( true );
    }
    uVar4 = 0;
  }
  return uVar4;
}

