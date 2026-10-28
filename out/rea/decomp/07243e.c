
/* WARNING: Instruction at (ram,0x0007e80f) overlaps instruction at (ram,0x0007e80e)
    */

void FUN_71d6_06de(undefined2 param_1,int param_2)

{
  byte *pbVar1;
  int *piVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int in_CX;
  char *in_DX;
  int *piVar7;
  int unaff_SI;
  int unaff_DI;
  undefined2 unaff_ES;
  undefined2 uVar8;
  undefined2 unaff_SS;
  int iVar9;
  undefined1 auStack_c6 [10];
  long alStack_bc [4];
  int aiStack_ac [13];
  byte bStack_92;
  uint uStack_91;
  char acStack_8a [78];
  undefined1 auStack_3c [50];
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iVar9 = 0x71d6;
  uVar3 = FUN_22bf_07a5();
  if (param_2 != 0) {
    if (DAT_4125_166a == 0) {
      in_CX = 2;
      uVar3 = thunk_FUN_54e4_0000();
      iVar9 = in_CX;
    }
    else {
      iVar9 = 0x32;
      uVar3 = thunk_FUN_54e4_07e4(0,0,0,0x32);
    }
  }
  if (4 < DAT_4125_0e92) {
    FUN_71d6_1a88();
    return;
  }
  piVar7 = (int *)(DAT_4125_0e92 * 2);
  uVar8 = 0x7000;
  switch(DAT_4125_0e92) {
  case 0:
    if (in_CX != 0) {
      *(undefined2 *)(((int)piVar7 + -1) * 0x1d + 0xd04) = *(undefined2 *)(unaff_SI + 2);
      *(undefined1 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xcff) = 1;
      *(undefined2 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xd00) = 0;
      pbVar1 = (byte *)(((int *)DAT_451b_1efe)[1] * 0x70 + *DAT_451b_1efe);
      *pbVar1 = *pbVar1 | 0x40;
      thunk_FUN_85d0_006c();
      FUN_7533_0b3f();
      return;
    }
    if ((*(byte *)(piVar7[1] * 0x70 + *piVar7) & 0x40) == 0) {
      thunk_FUN_7938_03d9(2,0,0,(int *)DAT_451b_1efe,DAT_451b_1efe._2_2_);
      if (0 < DAT_451b_08ce) {
        FUN_7533_0a96();
        return;
      }
      thunk_FUN_8027_0174();
    }
    return;
  case 1:
    FUN_1000_4944(uVar3);
    thunk_FUN_8027_10fb(auStack_3c);
    for (iVar9 = 0; iVar9 < unaff_SI; iVar9 = iVar9 + 1) {
      iStack_a = thunk_FUN_6513_12e6(iStack_6,DAT_451b_058a,DAT_451b_0588);
      FUN_1b62_02e2(iStack_a,in_DX);
    }
    return;
  case 2:
    return;
  case 3:
    if ((int)DAT_4125_0e92 < 0 != (int)piVar7 < 0) {
      iVar9 = *(int *)(unaff_SI + 0x3b00);
      unaff_SI = unaff_SI + 1;
    }
    break;
  case 4:
    do {
      piVar2 = (int *)((int)DAT_451b_1d82 + uVar3);
      *piVar2 = *piVar2 + 1;
      in_CX = in_CX + 1;
      while (6 < in_CX) {
        if (DAT_451b_1d86 < 7) {
          DAT_4125_2a49 = 0;
          uVar8 = 0x4099;
          thunk_FUN_79c4_056a(0x1d);
          DAT_4125_166a = 1;
          if ((DAT_4125_2a18 != 0) && ((DAT_4125_2a43 & 10) == 0)) {
            for (iVar9 = 0; iVar9 < (int)(uint)DAT_4125_2a42; iVar9 = iVar9 + 1) {
              uVar8 = 0x1d28;
              uVar6 = FUN_1d28_069a((int)((undefined4 *)&DAT_4125_2a18)[iVar9],
                                    (int)((ulong)((undefined4 *)&DAT_4125_2a18)[iVar9] >> 0x10));
              ((undefined2 *)&DAT_4125_2a2a)[iVar9 * 2] = in_DX;
              ((undefined2 *)&DAT_4125_2a28)[iVar9 * 2] = uVar6;
            }
          }
          (*DAT_451b_2a74)(uVar8,0x342a,0x4125,0x120,100,0x100,0xd4,0x2a0e,0x4125,0,0);
          if ((DAT_4125_2a18 != 0) && ((DAT_4125_2a43 & 10) == 0)) {
            for (iVar9 = 0; iVar9 < (int)(uint)DAT_4125_2a42; iVar9 = iVar9 + 1) {
              uVar8 = 0x1d28;
              FUN_1d28_07a9((int)((undefined4 *)&DAT_4125_2a18)[iVar9],
                            (int)((ulong)((undefined4 *)&DAT_4125_2a18)[iVar9] >> 0x10));
            }
          }
          FUN_7f3a_0996(uVar8,0);
          FUN_7f3a_0a86();
          return;
        }
        DAT_451b_1d86 = DAT_451b_1d86 + -1;
        in_CX = 0;
      }
      uVar3 = in_CX << 1;
    } while( true );
  }
  do {
    if (iStack_a < (int)(uVar3 & 0xff)) {
      uVar8 = 0x1d28;
      iVar5 = FUN_1d28_069a((int)alStack_bc[iStack_a],(int)((ulong)alStack_bc[iStack_a] >> 0x10),
                            iVar9);
      iVar4 = iStack_a * 2;
      aiStack_ac[iStack_a * 2 + 1] = (int)in_DX;
      aiStack_ac[iVar4] = iVar5;
      iStack_a = iStack_a + 1;
    }
    else {
      do {
        (*DAT_451b_2a74)(uVar8,0x342a,0x4125,0x138 - unaff_DI / 2,0x198,unaff_DI,0x11,auStack_c6);
        if ((alStack_bc[0] != 0) && ((uStack_91 & 10) == 0)) {
          for (iStack_a = 0; iStack_a < (int)(uint)bStack_92; iStack_a = iStack_a + 1) {
            FUN_1d28_07a9((int)alStack_bc[iStack_a],(int)((ulong)alStack_bc[iStack_a] >> 0x10));
          }
        }
        thunk_FUN_7e8f_00d6(0x138,0x198,acStack_8a + iStack_6);
        thunk_FUN_7e8f_015e(0x28);
        (*DAT_451b_2a74)(0x40c1,auStack_c6);
        FUN_2012_0975(auStack_c6);
        iVar4 = iStack_8;
        if ((iStack_4 != 0) || (iStack_8 = iStack_8 + 1, 4 < iVar4)) {
          thunk_FUN_7e8f_0a1b();
          return;
        }
        iStack_6 = unaff_SI;
        for (; unaff_SI < 0x80; unaff_SI = unaff_SI + 1) {
          if (acStack_8a[unaff_SI] == '|') {
            acStack_8a[unaff_SI] = '\0';
            unaff_SI = unaff_SI + 1;
            break;
          }
          if (acStack_8a[unaff_SI] == '~') {
            acStack_8a[unaff_SI] = '\0';
            unaff_SI = unaff_SI + 1;
            iStack_4 = 1;
            break;
          }
        }
        thunk_FUN_7e8f_0a1b();
        in_DX = acStack_8a + iStack_6;
        iVar4 = FUN_21e2_0a8e(in_DX);
        unaff_DI = (iVar4 >> 4) * 0x10 + 0x10;
        bStack_92 = 0;
        uStack_91 = 0;
        iVar4 = FUN_2012_01fe(auStack_c6);
        if (iVar4 == 0) {
          return;
        }
        uVar8 = 0x40c1;
        thunk_FUN_7e8f_0a1b();
      } while ((alStack_bc[0] == 0) || ((uStack_91 & 10) != 0));
      iStack_a = 0;
    }
    uVar3 = (uint)bStack_92;
  } while( true );
}

