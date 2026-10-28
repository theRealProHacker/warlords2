
/* WARNING (jumptable): Unable to track spacebase fully for stack */
/* WARNING: Instruction at (ram,0x00070347) overlaps instruction at (ram,0x00070346)
    */
/* WARNING: Removing unreachable block (ram,0x00077c14) */

undefined2 __cdecl16far FUN_7533_1a1d(void)

{
  int *piVar1;
  undefined1 uVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  uint in_CX;
  int iVar6;
  uint uVar7;
  undefined2 *puVar8;
  uint unaff_BP;
  int unaff_SI;
  undefined2 uVar9;
  undefined2 unaff_SS;
  bool bVar10;
  undefined4 uVar11;
  
  do {
    iVar6 = *(int *)(unaff_BP - 2);
    *(int *)(unaff_BP - 2) = *(int *)(unaff_BP - 2) + -1;
    if (iVar6 == 0) {
      *(int *)(unaff_BP - 8) = unaff_SI;
      for (iVar6 = *(int *)(unaff_BP - 8); iVar6 < 6; iVar6 = iVar6 + 1) {
        thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,0x58,iVar6 * 0x1e + 0x80,0,0,0,0,1,0)
        ;
      }
      uVar5 = FUN_22bf_0757();
      return uVar5;
    }
    *(undefined2 *)(unaff_BP - 4) = DAT_3c04_0181;
    while (iVar6 = *(int *)(unaff_BP - 4), *(int *)(unaff_BP - 4) = *(int *)(unaff_BP - 4) + -1,
          iVar6 != 0) {
      if (((*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x777c) == '\x1c') &&
          (*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x777b) == DAT_3c04_0110)) &&
         (iVar6 = 0x3c04,
         (*(byte *)(*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x7776) + 0x5e3) & 3) ==
         *(uint *)(unaff_BP - 2))) {
        iVar3 = (int)*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x7776);
        if (*(int *)(unaff_BP - 2) == 3) {
          iVar4 = DAT_3c04_0110 + 2;
        }
        else {
          iVar4 = 1;
        }
        *(int *)(unaff_BP - 6) = iVar4;
        thunk_FUN_85d0_08be(0x1c,DAT_3c04_0110,0x342a,0x4125,0x58,unaff_SI * 0x1e + 0x80,0,0,0,0,
                            iVar4,0);
        thunk_FUN_7e8f_00bf(0x80,unaff_SI * 0x1e + 0x86,iVar3 * 0x14 + 0x223,0x3c04);
        if (*(int *)(iVar3 * 2 + 0x593) == 0) {
          uVar11 = CONCAT22(*(byte *)(iVar3 + 0x5e3) & 3,99);
        }
        else {
          uVar11 = CONCAT22(*(byte *)(iVar3 + 0x5e3) & 3,100);
        }
        uVar5 = thunk_FUN_7e8f_04f0(uVar11);
        thunk_FUN_7e8f_00bf(0x110,unaff_SI * 0x1e + 0x86,uVar5,iVar6);
        FUN_1000_4944(unaff_BP - 0x1c);
        thunk_FUN_7e8f_00d6(0x188,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
        uVar5 = 0x3c04;
        uVar9 = 0x3c04;
        uVar7 = *(byte *)(iVar3 + 0x5e3) & 3;
        if (uVar7 < 4) {
          puVar8 = (undefined2 *)(uVar7 * 2);
          bVar10 = (*(byte *)(iVar3 + 0x5e3) & 3) == 0;
          switch(uVar7) {
          case 0:
            uVar2 = in(iVar6);
            return CONCAT11(0x3c,uVar2);
          case 2:
            iVar6 = unaff_BP + in_CX;
            if (CARRY2(unaff_BP,in_CX) || iVar6 == 0) {
              uVar5 = *(undefined2 *)(iVar6 + -0xc);
            }
            else {
              piVar1 = (int *)(iVar6 + iVar3 + -0xbba);
              *piVar1 = *piVar1 + -1;
            }
            return uVar5;
          case 3:
            iVar3 = 0;
            if (in_CX != 1) {
              if (bVar10) {
                uVar5 = *DAT_451b_1d82;
              }
              else {
                uVar5 = 7;
              }
              *(undefined2 *)(unaff_BP - 2) = uVar5;
              iVar6 = 0;
              while( true ) {
                uVar5 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
                if (6 < iVar6) break;
                piVar1 = (undefined2 *)DAT_451b_1d82 + iVar6;
                *piVar1 = *piVar1 - *(int *)(unaff_BP - 2);
                iVar6 = iVar6 + 1;
              }
              DAT_4125_2a49 = ((undefined2 *)DAT_451b_1d82)[DAT_451b_1d86];
              func_0x0008fd36(0x7000,1,0x4125);
              FUN_7f3a_0d45();
              uVar5 = func_0x0008fe26(0x7000);
              return uVar5;
            }
            do {
              *(undefined2 *)((int)puVar8 + iVar6) = uVar5;
              iVar6 = iVar3;
              while( true ) {
                iVar3 = iVar6 + 1;
                puVar8 = (undefined2 *)DAT_451b_1d82;
                uVar9 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
                if (6 < iVar3) {
                  DAT_451b_1d86 = DAT_451b_1d86 + -1;
                  if (DAT_451b_1d86 < 0) {
                    DAT_451b_1d86 = 0;
                    DAT_4125_2a49 = *DAT_451b_1d82;
                    func_0x0008fd36(0x7000,1,0x4125);
                  }
                  FUN_7f3a_0d45();
                  uVar5 = func_0x0008fe26(0x7000);
                  return uVar5;
                }
                if (iVar3 < 6) break;
                puVar8[iVar3] = puVar8[iVar3] + 1;
                iVar6 = iVar3;
              }
              uVar5 = puVar8[iVar6 + 2];
              iVar6 = iVar3 * 2;
            } while( true );
          }
          if (bVar10) {
            do {
            } while( true );
          }
          FUN_170b_004e();
          FUN_170b_003a();
          FUN_1d28_050d();
          if (*(int *)(unaff_BP + 10) == 0) {
            thunk_FUN_621e_0da9();
          }
          FUN_170b_003a();
          uVar5 = FUN_22bf_0757();
          return uVar5;
        }
        thunk_FUN_7e8f_00d6(0x1b8,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
        FUN_1000_4944(unaff_BP - 0x1c);
        thunk_FUN_7e8f_00d6(0x1e8,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
        FUN_1000_4944(unaff_BP - 0x1c);
        thunk_FUN_7e8f_00d6(0x218,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
        unaff_SI = unaff_SI + 1;
      }
    }
  } while( true );
}

