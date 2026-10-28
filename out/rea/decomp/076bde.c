
/* WARNING: Instruction at (ram,0x00076be2) overlaps instruction at (ram,0x00076be1)
    */
/* WARNING (jumptable): Unable to track spacebase fully for stack */
/* WARNING: Removing unreachable block (ram,0x00077c14) */

undefined2 __cdecl16far switchD_7000:3809::caseD_0(void)

{
  int *piVar1;
  undefined1 uVar2;
  int iVar3;
  undefined2 uVar4;
  uint in_CX;
  int in_DX;
  uint uVar5;
  undefined2 *puVar6;
  uint unaff_BP;
  int unaff_SI;
  int iVar7;
  undefined2 uVar8;
  undefined2 unaff_SS;
  bool bVar9;
  undefined4 uVar10;
  
  iVar7 = 0x593;
  s__UDB_DAT_4125_05a5[0] = s__UDB_DAT_4125_05a5[0] + (char)((uint)in_DX >> 8);
  do {
    uVar10 = CONCAT22(*(byte *)(iVar7 + 0x5e3) & 3,99);
    while( true ) {
      uVar4 = thunk_FUN_7e8f_04f0(uVar10);
      thunk_FUN_7e8f_00bf(0x110,unaff_SI * 0x1e + 0x86,uVar4,in_DX);
      FUN_1000_4944(unaff_BP - 0x1c);
      thunk_FUN_7e8f_00d6(0x188,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
      uVar4 = 0x3c04;
      uVar8 = 0x3c04;
      uVar5 = *(byte *)(iVar7 + 0x5e3) & 3;
      if (uVar5 < 4) {
        puVar6 = (undefined2 *)(uVar5 * 2);
        bVar9 = (*(byte *)(iVar7 + 0x5e3) & 3) == 0;
        switch(uVar5) {
        case 0:
          uVar2 = in(in_DX);
          return CONCAT11(0x3c,uVar2);
        case 2:
          iVar3 = unaff_BP + in_CX;
          if (CARRY2(unaff_BP,in_CX) || iVar3 == 0) {
            uVar4 = *(undefined2 *)(iVar3 + -0xc);
          }
          else {
            piVar1 = (int *)(iVar3 + iVar7 + -0xbba);
            *piVar1 = *piVar1 + -1;
          }
          return uVar4;
        case 3:
          iVar7 = 0;
          if (in_CX != 1) {
            if (bVar9) {
              uVar4 = *DAT_451b_1d82;
            }
            else {
              uVar4 = 7;
            }
            *(undefined2 *)(unaff_BP - 2) = uVar4;
            iVar7 = 0;
            while( true ) {
              uVar4 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
              if (6 < iVar7) break;
              piVar1 = (undefined2 *)DAT_451b_1d82 + iVar7;
              *piVar1 = *piVar1 - *(int *)(unaff_BP - 2);
              iVar7 = iVar7 + 1;
            }
            DAT_4125_2a49 = ((undefined2 *)DAT_451b_1d82)[DAT_451b_1d86];
            func_0x0008fd36(0x7000,1,0x4125);
            FUN_7f3a_0d45();
            uVar4 = func_0x0008fe26(0x7000);
            return uVar4;
          }
          do {
            *(undefined2 *)((int)puVar6 + in_DX) = uVar4;
            iVar3 = iVar7;
            while( true ) {
              iVar7 = iVar3 + 1;
              puVar6 = (undefined2 *)DAT_451b_1d82;
              uVar8 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
              if (6 < iVar7) {
                DAT_451b_1d86 = DAT_451b_1d86 + -1;
                if (DAT_451b_1d86 < 0) {
                  DAT_451b_1d86 = 0;
                  DAT_4125_2a49 = *DAT_451b_1d82;
                  func_0x0008fd36(0x7000,1,0x4125);
                }
                FUN_7f3a_0d45();
                uVar4 = func_0x0008fe26(0x7000);
                return uVar4;
              }
              if (iVar7 < 6) break;
              puVar6[iVar7] = puVar6[iVar7] + 1;
              iVar3 = iVar7;
            }
            uVar4 = puVar6[iVar3 + 2];
            in_DX = iVar7 * 2;
          } while( true );
        }
        if (bVar9) {
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
        uVar4 = FUN_22bf_0757();
        return uVar4;
      }
      thunk_FUN_7e8f_00d6(0x1b8,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
      FUN_1000_4944(unaff_BP - 0x1c);
      thunk_FUN_7e8f_00d6(0x1e8,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
      FUN_1000_4944(unaff_BP - 0x1c);
      thunk_FUN_7e8f_00d6(0x218,unaff_SI * 0x1e + 0x86,unaff_BP - 0x1c);
      unaff_SI = unaff_SI + 1;
      do {
        while (iVar7 = *(int *)(unaff_BP - 4), *(int *)(unaff_BP - 4) = *(int *)(unaff_BP - 4) + -1,
              iVar7 == 0) {
          iVar7 = *(int *)(unaff_BP - 2);
          *(int *)(unaff_BP - 2) = *(int *)(unaff_BP - 2) + -1;
          if (iVar7 == 0) {
            *(int *)(unaff_BP - 8) = unaff_SI;
            for (iVar7 = *(int *)(unaff_BP - 8); iVar7 < 6; iVar7 = iVar7 + 1) {
              thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,0x58,iVar7 * 0x1e + 0x80,0,0,0,
                                  0,1,0);
            }
            uVar4 = FUN_22bf_0757();
            return uVar4;
          }
          *(undefined2 *)(unaff_BP - 4) = DAT_3c04_0181;
        }
      } while (((*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x777c) != '\x1c') ||
               (*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x777b) != DAT_3c04_0110)) ||
              (in_DX = 0x3c04,
              (*(byte *)(*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x7776) + 0x5e3) & 3) !=
              *(uint *)(unaff_BP - 2)));
      iVar7 = (int)*(char *)(*(int *)(unaff_BP - 4) * 0x16 + -0x7776);
      if (*(int *)(unaff_BP - 2) == 3) {
        iVar3 = DAT_3c04_0110 + 2;
      }
      else {
        iVar3 = 1;
      }
      *(int *)(unaff_BP - 6) = iVar3;
      thunk_FUN_85d0_08be(0x1c,DAT_3c04_0110,0x342a,0x4125,0x58,unaff_SI * 0x1e + 0x80,0,0,0,0,iVar3
                          ,0);
      thunk_FUN_7e8f_00bf(0x80,unaff_SI * 0x1e + 0x86,iVar7 * 0x14 + 0x223);
      if (*(int *)(iVar7 * 2 + 0x593) == 0) break;
      uVar10 = CONCAT22(*(byte *)(iVar7 + 0x5e3) & 3,100);
    }
  } while( true );
}

