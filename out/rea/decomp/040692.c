
/* WARNING: Instruction at (ram,0x00076be2) overlaps instruction at (ram,0x00076be1)
    */
/* WARNING: Removing unreachable block (ram,0x00077c14) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 * __cdecl16far thunk_FUN_71d6_1a9b(undefined2 param_1,int param_2,int param_3)

{
  int *piVar1;
  undefined2 *puVar2;
  undefined2 uVar3;
  undefined2 *puVar4;
  undefined1 uVar5;
  undefined2 *in_AX;
  undefined2 *puVar6;
  uint in_CX;
  int *piVar7;
  ulong in_EDX;
  uint uVar8;
  int unaff_SI;
  int iVar9;
  int unaff_DI;
  int iVar10;
  undefined2 uVar11;
  uint unaff_SS;
  bool bVar12;
  undefined4 in_stack_00000002;
  int aiStack_bbc [1486];
  undefined2 uStack_20;
  undefined2 uStack_1e;
  undefined2 uStack_1c;
  int iStack_1a;
  undefined4 uStack_16;
  undefined2 *puStack_12;
  undefined2 uStack_10;
  int iStack_e;
  undefined2 *puStack_c;
  undefined2 *in_stack_0000fff8;
  int in_stack_0000fffa;
  undefined2 in_stack_0000fffc;
  
  switch(DAT_4125_0e92) {
  case 0:
    iVar9 = 0x593;
    s__UDB_DAT_4125_05a5[0] = s__UDB_DAT_4125_05a5[0] + (char)(in_EDX >> 8);
    while( true ) {
      thunk_FUN_7e8f_04f0();
      puStack_c = (undefined2 *)0x40c1;
      iStack_e = 0x6c21;
      thunk_FUN_7e8f_00bf();
      puStack_c = &uStack_1e;
      iStack_e = 0x40c1;
      FUN_1000_4944();
      puStack_c = (undefined2 *)0x1000;
      iStack_e = 0x6c5c;
      thunk_FUN_7e8f_00d6();
      iVar10 = 0x3c04;
      puVar6 = (undefined2 *)0x3c04;
      uVar8 = *(byte *)(iVar9 + 0x5e3) & 3;
      if (uVar8 < 4) break;
      puStack_c = (undefined2 *)0x40c1;
      iStack_e = 0x6cc4;
      thunk_FUN_7e8f_00d6();
      puStack_c = &uStack_1e;
      iStack_e = 0x40c1;
      FUN_1000_4944();
      puStack_c = (undefined2 *)0x1000;
      iStack_e = 0x6d00;
      thunk_FUN_7e8f_00d6();
      puStack_c = &uStack_1e;
      iStack_e = 0x40c1;
      FUN_1000_4944();
      puStack_c = (undefined2 *)0x1000;
      uVar11 = 0x40c1;
      iStack_e = 0x6d3c;
      thunk_FUN_7e8f_00d6();
      unaff_SI = unaff_SI + 1;
      puVar6 = &uStack_1e;
      uVar8 = unaff_SS;
      do {
        while (puVar2 = (undefined2 *)((int)puVar6 + -1), puVar6 == (undefined2 *)0x0) {
          bVar12 = uVar8 == 0;
          puVar6 = DAT_3c04_0181;
          uVar8 = uVar8 - 1;
          if (bVar12) {
            for (; unaff_SI < 6; unaff_SI = unaff_SI + 1) {
              iStack_e = 0;
              puStack_c = (undefined2 *)0x0;
              iStack_1a = DAT_3c04_0110;
              uStack_1c = 0xffff;
              uStack_20 = 0x6d90;
              uStack_1e = uVar11;
              thunk_FUN_85d0_08be();
              uVar11 = 0x40f9;
            }
            puVar6 = (undefined2 *)FUN_22bf_0757();
            return puVar6;
          }
        }
        puVar6 = puVar2;
      } while (((*(char *)((int)puVar2 * 0x16 + -0x777c) != '\x1c') ||
               (*(char *)((int)puVar2 * 0x16 + -0x777b) != DAT_3c04_0110)) ||
              (in_EDX = 0x3c04,
              (*(byte *)(*(char *)((int)puVar2 * 0x16 + -0x7776) + 0x5e3) & 3) != uVar8));
      iVar9 = (int)*(char *)((int)puVar2 * 0x16 + -0x7776);
      puStack_c = (undefined2 *)0x0;
      iStack_e = 0;
      iStack_1a = DAT_3c04_0110;
      uStack_1c = 0x1c;
      uStack_1e = 0x40c1;
      uStack_20 = 0x6bb0;
      thunk_FUN_85d0_08be();
      puStack_c = (undefined2 *)0x40f9;
      iStack_e = 0x6bd0;
      thunk_FUN_7e8f_00bf();
    }
    piVar7 = (int *)(uVar8 * 2);
    bVar12 = (*(byte *)(iVar9 + 0x5e3) & 3) == 0;
    switch(uVar8) {
    case 0:
      uVar5 = in((int)in_EDX);
      return (undefined2 *)(undefined2 *)CONCAT31(0x3c,uVar5);
    case 2:
      if (CARRY2((uint)&stack0xfffe,in_CX) || &stack0xfffe + in_CX == (undefined1 *)0x0) {
        puVar6 = (undefined2 *)*(undefined2 *)((int)&iStack_e + in_CX);
      }
      else {
        piVar1 = (int *)(&stack0xfffe + in_CX + iVar9 + -0xbba);
        *piVar1 = *piVar1 + -1;
      }
      return puVar6;
    case 3:
      iVar9 = 0;
      if (in_CX != 1) {
        if (bVar12) {
          iVar9 = *DAT_451b_1d82;
        }
        else {
          iVar9 = 7;
        }
        iVar10 = 0;
        while( true ) {
          uVar11 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
          if (6 < iVar10) break;
          piVar1 = (int *)DAT_451b_1d82 + iVar10;
          *piVar1 = *piVar1 - iVar9;
          iVar10 = iVar10 + 1;
        }
        DAT_4125_2a49 = ((int *)DAT_451b_1d82)[DAT_451b_1d86];
        func_0x0008fd36();
        FUN_7f3a_0d45();
        puVar6 = (undefined2 *)func_0x0008fe26();
        return puVar6;
      }
      do {
        *(int *)((int)piVar7 + (int)in_EDX) = iVar10;
        iVar10 = iVar9;
        while( true ) {
          iVar9 = iVar10 + 1;
          piVar7 = (int *)DAT_451b_1d82;
          puVar6 = (undefined2 *)((ulong)DAT_451b_1d82 >> 0x10);
          if (6 < iVar9) {
            DAT_451b_1d86 = DAT_451b_1d86 + -1;
            if (DAT_451b_1d86 < 0) {
              DAT_451b_1d86 = 0;
              DAT_4125_2a49 = *DAT_451b_1d82;
              func_0x0008fd36();
            }
            FUN_7f3a_0d45();
            puVar6 = (undefined2 *)func_0x0008fe26();
            return puVar6;
          }
          if (iVar9 < 6) break;
          piVar7[iVar9] = piVar7[iVar9] + 1;
          iVar10 = iVar9;
        }
        iVar10 = piVar7[iVar10 + 2];
        in_EDX = (ulong)(uint)(iVar9 * 2);
      } while( true );
    }
    if (bVar12) {
      do {
      } while( true );
    }
    puStack_c = (undefined2 *)0x7c1e;
    FUN_170b_004e();
    FUN_170b_003a();
    FUN_1d28_050d();
    if (param_2 == 0) {
      thunk_FUN_621e_0da9();
    }
    FUN_170b_003a();
    puVar6 = (undefined2 *)FUN_22bf_0757();
    return puVar6;
  case 1:
    FUN_1000_1d02();
    FUN_1997_034a();
    puStack_c = (undefined2 *)0x4125;
    iStack_e = 0x342a;
    iStack_1a = 0x54a8;
    uStack_1c = 0x1997;
    uStack_1e = 0x4214;
    (*DAT_451b_2a68)();
    thunk_FUN_7875_06ae();
    FUN_4058_0089();
    thunk_FUN_7e8f_00d6();
    puStack_c = (undefined2 *)0x0;
    iStack_e = DAT_451b_0532 + 0x1f;
    iStack_1a = 0x40c1;
    uStack_1c = 0x427a;
    thunk_FUN_85d0_08be();
    puStack_c = (undefined2 *)0x428e;
    FUN_1000_4944();
    thunk_FUN_7e8f_0103();
    puStack_c = (undefined2 *)0x42bd;
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf();
    puStack_c = (undefined2 *)&DAT_451b_038c;
    FUN_1000_4944();
    thunk_FUN_7e8f_0103();
    puStack_c = (undefined2 *)0x431b;
    FUN_1000_4944();
    puVar6 = (undefined2 *)thunk_FUN_7e8f_00bf();
    if (((undefined1 *)&DAT_451b_0664)[unaff_SI * 6] == '\0') {
      if ((((undefined1 *)&DAT_451b_0665)[unaff_SI * 6] == '\0') ||
         (((undefined1 *)&DAT_451b_0666)[unaff_SI * 6] == '\0')) {
        if (((undefined1 *)&DAT_451b_0665)[unaff_SI * 6] == '\0') {
          if (((undefined1 *)&DAT_451b_0666)[unaff_SI * 6] == '\0') {
            return puVar6;
          }
          iStack_e = 0x98;
        }
        else {
          iStack_e = 0xf8;
        }
      }
      else {
        iStack_e = 0xd8;
      }
    }
    else {
      iStack_e = 0xb8;
    }
    puStack_c = (undefined2 *)0x1e;
    puVar6 = (undefined2 *)(*DAT_451b_2a74)();
    return puVar6;
  case 2:
    *(char *)(in_stack_0000fff8 + 4) = *(char *)(DAT_4125_0e92 * 0x82 + unaff_SI + 0x159b) + '\x02';
    *(undefined1 *)((int)in_stack_0000fff8 + 9) = (char)((ulong)in_stack_00000002 >> 0x10);
    *(undefined1 *)(in_stack_0000fff8 + 5) = 0;
    iVar9 = (int)((ulong)in_stack_00000002 >> 0x10);
    *(char *)((int)in_stack_0000fff8 + 0xb) = *(char *)(iVar9 * 0x41 + unaff_SI + 0x15a3) / '\x02';
    *(undefined1 *)(iVar9 * 0x41 + 0x15aa) = 0;
    if (unaff_DI == -1) {
      *(byte *)((int)in_stack_0000fff8 + 0xf) = *(byte *)((int)in_stack_0000fff8 + 0xf) & 1;
      *(byte *)(in_stack_0000fff8 + 7) = *(byte *)(in_stack_0000fff8 + 7) & 0xf0;
      *(undefined1 *)(in_stack_0000fff8 + 7) = *(undefined1 *)(in_stack_0000fff8 + 7);
      *(undefined1 *)(in_stack_0000fff8 + 8) = 0xff;
      puStack_c = (undefined2 *)0x58a;
      FUN_1b62_02e2();
    }
    else {
      if (unaff_DI < 100) {
        *(undefined2 *)CONCAT22(in_stack_0000fffa,in_stack_0000fff8) = 0xffff;
      }
      else {
        *(undefined2 *)CONCAT22(in_stack_0000fffa,in_stack_0000fff8) = 0xfffe;
      }
      in_stack_0000fff8[1] = 0xffff;
      *(byte *)((int)in_stack_0000fff8 + 0xf) = *(byte *)((int)in_stack_0000fff8 + 0xf) & 1;
      *(byte *)((int)in_stack_0000fff8 + 0xf) =
           *(byte *)((int)in_stack_0000fff8 + 0xf) | (char)unaff_DI << 1;
      *(undefined1 *)(in_stack_0000fff8 + 8) = 0x65;
    }
    return in_stack_0000fff8;
  case 3:
    iVar10 = unaff_DI + 1;
    uVar11 = 0;
    iStack_e = 0;
    for (iVar9 = 0; (iStack_e == 0 && (iVar9 < DAT_451b_0886)); iVar9 = iVar9 + 1) {
      if ((*(int *)((int)*(undefined4 *)(in_stack_0000fffa + 0x19) + iVar9 * 6) == unaff_SI) &&
         ((*(int *)((int)*(undefined4 *)(in_stack_0000fffa + 0x19) + iVar9 * 6 + 2) == iVar10 &&
          (*(int *)((int)*(undefined4 *)(in_stack_0000fffa + 0x19) + iVar9 * 6 + 4) == param_3)))) {
        iStack_e = 1;
      }
    }
    if (iStack_e == 0) {
      puStack_c = (undefined2 *)(DAT_451b_0886 + -1);
      puVar4 = (undefined2 *)*(undefined4 *)(in_stack_0000fffa + 0x19);
      puStack_12 = (undefined2 *)puVar4;
      uStack_10 = (undefined2)((ulong)puVar4 >> 0x10);
      uVar3 = *(undefined2 *)(in_stack_0000fffa + 0x1b);
      piVar7 = (int *)(*(int *)(in_stack_0000fffa + 0x19) + (int)puStack_c * 6);
      uStack_16 = (int *)CONCAT22(uVar3,piVar7);
      iVar9 = 0;
      if (*uStack_16 != unaff_SI) {
        *uStack_16 = unaff_SI;
        uVar11 = *puVar4;
        puStack_c = (undefined2 *)0x7000;
        iStack_e = -0x70ec;
        FUN_7875_0839();
        iVar9 = unaff_SI;
      }
      if (piVar7[1] != iVar10) {
        piVar7[1] = iVar10;
        uVar11 = puStack_12[1];
        puStack_c = (undefined2 *)0x7000;
        iStack_e = -0x70cb;
        FUN_7875_0839();
        iVar9 = iVar10;
      }
      if (piVar7[2] != param_3) {
        piVar7[2] = param_3;
        uVar11 = puStack_12[2];
        puStack_c = (undefined2 *)0x7000;
        iStack_e = -0x70a4;
        FUN_7875_0839();
        iVar9 = param_3;
      }
      DAT_3ef3_0000 = CONCAT22(iVar9,uVar11);
    }
    else {
      DAT_3ef3_0000 = 0;
    }
    puVar6 = (undefined2 *)FUN_24b0_01f0();
    return puVar6;
  case 4:
    thunk_FUN_7e8f_04f0();
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf();
    if ((*(char *)(*(byte *)(*(int *)(DAT_4125_0e98 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)(DAT_4125_0e98 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
       ((DAT_3c04_0132 == 0 || (*(char *)(DAT_4125_0e98 * 0x41 + 0x1592) == DAT_3c04_0110)))) {
      iVar10 = 0;
      for (iVar9 = 0; iVar9 < 4; iVar9 = iVar9 + 1) {
        puStack_c = (undefined2 *)*(int *)(iVar10 * 4 + 0xf18);
        iStack_e = 0x4125;
        thunk_FUN_85d0_08be();
        iVar10 = iVar10 + 1;
      }
    }
    else {
      FUN_24d0_0002();
      FUN_216d_002e();
      FUN_216d_01fd();
      puStack_c = (undefined2 *)0x216d;
      iStack_e = 0x280d;
      FUN_216d_002e();
      FUN_24d0_02e5();
      FUN_216d_002e();
      FUN_216d_000e();
      FUN_1000_1e79();
      FUN_1997_0129();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
      thunk_FUN_85d0_0860();
    }
    iVar9 = 0;
    break;
  default:
    return in_AX;
  }
  do {
    if (7 < iVar9) {
LAB_71d6_0c8b:
      FUN_71d6_1f06();
      for (iVar9 = 0; iVar9 < 3; iVar9 = iVar9 + 1) {
        thunk_FUN_7e8f_00bf();
      }
      puVar6 = (undefined2 *)FUN_71d6_1a88();
      return puVar6;
    }
    if ((*(int *)(DAT_4125_0e98 * 0x41 + 0x157d) == *(int *)(iVar9 * 0x14 + 0x193)) &&
       (*(int *)(DAT_4125_0e98 * 0x41 + 0x157f) == *(int *)(iVar9 * 0x14 + 0x195))) {
      thunk_FUN_85d0_0bf7();
      goto LAB_71d6_0c8b;
    }
    iVar9 = iVar9 + 1;
  } while( true );
}

