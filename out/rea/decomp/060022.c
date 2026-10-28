
/* WARNING: Unable to track spacebase fully for stack */

undefined2 __cdecl16far FUN_5efd_1052(void)

{
  int *piVar1;
  bool bVar2;
  int in_AX;
  uint uVar3;
  uint uVar4;
  int iVar5;
  int *piVar6;
  int unaff_BP;
  int iVar7;
  int unaff_DI;
  int iVar8;
  int iVar9;
  undefined2 uVar10;
  undefined2 uVar11;
  undefined2 unaff_SS;
  int in_stack_00000000;
  
  uVar11 = 0x5efd;
  while( true ) {
    uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (*(int *)((int)DAT_451b_018e + in_AX + 0x24c) != 0) {
      piVar1 = (int *)(*(int *)((int)DAT_451b_018e + unaff_DI * 0x5c + 0x24e) * 2 + unaff_BP + -0xae
                      );
      *piVar1 = *piVar1 + 1;
      *(int *)(unaff_BP + -6) = *(int *)(unaff_BP + -6) + 1;
    }
    if (unaff_DI == 0) break;
    in_AX = (unaff_DI + -1) * 0x5c;
    unaff_DI = unaff_DI + -1;
  }
  if ((*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) != '\x0f') &&
     (*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) != DAT_3c04_0110)) {
    piVar1 = (int *)(*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + 0x14;
  }
  *(undefined2 *)(unaff_BP + -8) = 0;
  iVar7 = 8;
  while (iVar8 = iVar7 + -1, iVar7 != 0) {
    iVar7 = iVar8;
    if (*(int *)(iVar8 * 2 + unaff_BP + -0x2e) != 0) {
      if (DAT_3c04_0110 != iVar8) {
        *(int *)(unaff_BP + -8) = *(int *)(unaff_BP + -8) + 1;
      }
      *(undefined2 *)(in_stack_00000000 + -2) = *(undefined2 *)(iVar8 * 0x14 + 0x195);
      *(undefined2 *)(in_stack_00000000 + -4) = *(undefined2 *)(iVar8 * 0x14 + 0x193);
      *(undefined2 *)(in_stack_00000000 + -6) = uVar11;
      uVar11 = 0x40e8;
      *(undefined2 *)(in_stack_00000000 + -8) = 0xed;
      uVar10 = thunk_FUN_824f_044a();
      *(undefined2 *)(unaff_BP + -0x1c) = uVar10;
      if (*(char *)(*(int *)(unaff_BP + -0x1c) * 0x41 + 0x1592) == DAT_3c04_0110) {
        *(undefined2 *)(iVar8 * 2 + unaff_BP + -0x8e) = 1;
      }
    }
  }
  iVar7 = 8;
  do {
    iVar8 = iVar7 + -1;
    if (iVar7 == 0) {
      bVar2 = false;
      iVar7 = 8;
      while (iVar8 = iVar7 + -1, iVar7 != 0) {
        iVar7 = iVar8;
        if (((*(int *)(iVar8 * 2 + 0x137) != 0) && (DAT_3c04_0110 != iVar8)) &&
           ((*(byte *)(DAT_3c04_0110 * 8 + iVar8 + 0x153b) & 0xc) == 8)) {
          bVar2 = true;
        }
      }
      if ((DAT_3c04_0116 != 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 0)) {
        iVar7 = 8;
        while (iVar7 != 0) {
          *(undefined2 *)((iVar7 + -1) * 2 + unaff_BP + -0xce) = 0;
          iVar7 = iVar7 + -1;
        }
        iVar7 = 8;
        while (iVar8 = iVar7 + -1, iVar7 != 0) {
          iVar7 = iVar8;
          if ((*(int *)(iVar8 * 2 + 0x137) != 0) && (*(int *)(iVar8 * 2 + 0xd0) != 0)) {
            iVar9 = 8;
            while (iVar5 = iVar9 + -1, iVar9 != 0) {
              iVar9 = iVar5;
              if (((*(int *)(iVar5 * 2 + 0x137) != 0) && (*(int *)(iVar5 * 2 + 0xd0) != 1)) &&
                 ((*(byte *)(iVar8 * 8 + iVar5 + 0x153b) & 3) == 2)) {
                *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xce) = 1;
              }
            }
          }
        }
        iVar7 = 8;
        while (iVar8 = iVar7 + -1, iVar7 != 0) {
          iVar7 = iVar8;
          if (((*(int *)(iVar8 * 2 + 0x137) != 0) && (*(int *)(iVar8 * 2 + 0xd0) != 0)) &&
             ((*(int *)(DAT_3c04_0110 * 2 + unaff_BP + -0xce) != 0 ||
              (*(int *)(iVar8 * 2 + unaff_BP + -0xce) != 0)))) {
            *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
          }
        }
      }
      iVar7 = 8;
      while (iVar8 = iVar7 + -1, iVar7 != 0) {
        uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        iVar7 = (int)DAT_451b_018e + iVar8 * 2;
        *(int *)(unaff_BP + -0x1c) = *(int *)(iVar7 + 0x3dc) + *(int *)(iVar7 + 0x3fc);
        if (DAT_3c04_0128 == 0) {
          uVar10 = 8;
        }
        else {
          uVar10 = 4;
        }
        *(undefined2 *)(unaff_BP + -0x1e) = uVar10;
        *(int *)(in_stack_00000000 + -2) = iVar8;
        *(undefined2 *)(in_stack_00000000 + -4) = uVar11;
        *(undefined2 *)(in_stack_00000000 + -6) = 0x4e6;
        iVar7 = thunk_FUN_557a_0a6e();
        if (iVar7 != 0) {
          *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
        }
        if ((bVar2) && ((*(byte *)(DAT_3c04_0110 * 8 + iVar8 + 0x153b) & 0xc) == 0)) {
          *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
        }
        if ((*(int *)(unaff_BP + -6) == 0) && (*(int *)(iVar8 * 2 + unaff_BP + -0x5e) == 0)) {
          *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
        }
        *(undefined2 *)(in_stack_00000000 + -2) = 0x3fb1;
        uVar11 = 0x40d7;
        *(undefined2 *)(in_stack_00000000 + -4) = 0x559;
        iVar7 = thunk_FUN_8027_225b();
        if ((iVar7 < *(int *)(unaff_BP + -0x1e)) && (*(int *)(unaff_BP + -0x1c) == 0)) {
          *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
        }
        iVar7 = iVar8;
        if ((1 < *(int *)(unaff_BP + -8)) &&
           (*(int *)(iVar8 * 2 + unaff_BP + -0x2e) / 4 < *(int *)(iVar8 * 2 + unaff_BP + -0xae))) {
          *(undefined2 *)(iVar8 * 2 + unaff_BP + -0xbe) = 0;
        }
      }
      *(undefined2 *)(DAT_3c04_0110 * 2 + unaff_BP + -0xbe) = 0;
      iVar7 = 0;
      iVar8 = 8;
      while (iVar9 = iVar8 + -1, iVar8 != 0) {
        iVar8 = iVar9;
        if ((*(int *)(iVar9 * 2 + unaff_BP + -0x2e) != 0) &&
           (iVar7 < *(int *)(iVar9 * 2 + unaff_BP + -0xbe))) {
          iVar7 = *(int *)(iVar9 * 2 + unaff_BP + -0xbe);
          *(int *)(unaff_BP + -10) = iVar9;
        }
      }
      if ((*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) != '\x0f') &&
         (*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) != DAT_3c04_0110)) {
        bVar2 = false;
        iVar7 = *(int *)((int)DAT_451b_018e + 0x24a);
        while (iVar8 = iVar7 + -1, iVar7 != 0) {
          iVar7 = iVar8;
          if ((int)*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592) ==
              *(int *)(iVar8 * 2 + unaff_BP + -0xae)) {
            bVar2 = true;
          }
        }
        if (!bVar2) {
          *(int *)(unaff_BP + -10) = (int)*(char *)(*(int *)(unaff_BP + -0xc) * 0x41 + 0x1592);
        }
      }
      if ((*(int *)(unaff_BP + -10) != -1) &&
         (*(int *)(*(int *)(unaff_BP + -10) * 2 + unaff_BP + -0x5e) == 0)) {
        *(undefined2 *)(unaff_BP + -10) = 0xffff;
      }
      return *(undefined2 *)(unaff_BP + -10);
    }
    iVar7 = unaff_BP + -0xbe;
    piVar1 = (int *)(iVar8 * 2 + iVar7);
    *piVar1 = *piVar1 + *(int *)(iVar8 * 2 + unaff_BP + -0x6e);
    piVar1 = (int *)(iVar8 * 2 + iVar7);
    *piVar1 = *piVar1 + *(int *)(iVar8 * 2 + unaff_BP + -0x8e) * 0xf;
    piVar1 = (int *)(iVar8 * 2 + iVar7);
    *piVar1 = *piVar1 + *(int *)(iVar8 * 2 + unaff_BP + -0x3e) * 4;
    piVar1 = (int *)(iVar8 * 2 + iVar7);
    *piVar1 = *piVar1 + *(int *)(iVar8 * 2 + unaff_BP + -0x4e) * 6;
    uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar7 = (int)DAT_451b_018e + iVar8 * 2;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x3bc) * 4;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x3cc);
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x3dc);
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x3ec) * 2;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x3fc) * 2;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + *(int *)(iVar7 + 0x40c) * 2;
    iVar7 = (int)DAT_451b_018e;
    uVar10 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
      piVar6 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
      iVar7 = *(int *)(iVar7 + 0x18);
LAB_5efd_12f0:
      *piVar6 = *piVar6 + iVar7;
    }
    else {
      if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 2) {
        piVar6 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
        iVar7 = *(int *)(iVar7 + 0x1e);
        goto LAB_5efd_12f0;
      }
      if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 1) {
        piVar6 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
        iVar7 = *(int *)(iVar7 + 0x1a);
        goto LAB_5efd_12f0;
      }
      if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 0) {
        piVar6 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
        iVar7 = *(int *)(iVar7 + 0x1c);
        goto LAB_5efd_12f0;
      }
    }
    *(int *)(in_stack_00000000 + -2) = iVar8 * 2;
    *(undefined2 *)(in_stack_00000000 + -4) = 0x3c04;
    uVar3 = *(int *)(unaff_BP + -0xe) - *(int *)(*(int *)(in_stack_00000000 + -2) + 0x10e3);
    uVar4 = (int)uVar3 >> 0xf;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + (int)((uVar3 ^ uVar4) - uVar4) / 8;
    uVar3 = *(int *)(DAT_3c04_0110 * 2 + unaff_BP + -0x2e) - *(int *)(iVar8 * 2 + unaff_BP + -0x2e);
    uVar4 = (int)uVar3 >> 0xf;
    piVar1 = (int *)(iVar8 * 2 + unaff_BP + -0xbe);
    *piVar1 = *piVar1 + (int)((uVar3 ^ uVar4) - uVar4) / 4;
    iVar7 = iVar8;
  } while( true );
}

