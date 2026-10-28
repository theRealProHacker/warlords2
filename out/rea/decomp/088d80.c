
/* WARNING: Instruction at (ram,0x00088322) overlaps instruction at (ram,0x00088321)
    */
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far
FUN_85d0_3080(undefined4 param_1,undefined4 param_2,undefined2 param_3,int param_4)

{
  byte *pbVar1;
  int *piVar2;
  uint uVar3;
  int in_CX;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  byte *unaff_SI;
  int unaff_DI;
  undefined2 uVar8;
  undefined2 unaff_SS;
  int in_stack_00000018;
  int in_stack_0000001a;
  int aiStack_fa [91];
  undefined1 auStack_44 [18];
  int iStack_32;
  uint uStack_30;
  int iStack_2e;
  int aiStack_2c [6];
  int iStack_20;
  int iStack_1e;
  int aiStack_1c [2];
  char acStack_18 [2];
  byte *pbStack_16;
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  byte *pbStack_c;
  int *piStack_a;
  byte *in_stack_0000fff8;
  byte bVar9;
  byte *pbVar10;
  
  piVar2 = (int *)(DAT_451b_2509 & 1);
  if ((DAT_451b_2509 & 1) == 0) {
    return;
  }
  uVar8 = (undefined2)((ulong)param_2 >> 0x10);
  iVar4 = -0x8000;
  pbVar10 = unaff_SI;
  switch((uint)param_1) {
  case 0:
    piStack_a = (int *)0x8000;
    pbStack_c = (byte *)0x475;
    FUN_18a9_066e();
    piStack_a = (int *)0x18a9;
    pbStack_c = (byte *)0x483;
    FUN_18a9_066e();
    piStack_a = (int *)0x18a9;
    pbStack_c = (byte *)0x4ae;
    FUN_18a9_066e();
    if (DAT_451b_1f02 == 0) {
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x50f;
      FUN_18a9_066e();
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x51d;
      FUN_18a9_066e();
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x52b;
      FUN_18a9_066e();
    }
    else {
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x4c4;
      FUN_18a9_066e();
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x4d2;
      FUN_18a9_066e();
      iVar4 = thunk_FUN_899d_0567();
      if (iVar4 == 0) {
        piStack_a = (int *)0x410c;
        pbStack_c = (byte *)0x4f6;
        FUN_18a9_066e();
        piStack_a = (int *)0x501;
        FUN_18a9_03b3();
        goto LAB_8027_02cb;
      }
      piStack_a = (int *)0x4e6;
      FUN_18a9_03b3();
    }
    piStack_a = (int *)0x18a9;
    pbStack_c = (byte *)0x538;
    FUN_18a9_066e();
LAB_8027_02cb:
    for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x54c;
      FUN_18a9_066e();
    }
    for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
      if (iVar4 < DAT_4125_30f6) {
        piStack_a = (int *)0x18a9;
        pbStack_c = (byte *)0x56c;
        FUN_18a9_066e();
        piStack_a = (int *)0x18a9;
        pbStack_c = (byte *)0x57c;
        FUN_18a9_066e();
      }
      else {
        piStack_a = (int *)0x58c;
        FUN_18a9_03b3();
        piStack_a = (int *)0x598;
        FUN_18a9_03b3();
      }
    }
    if (DAT_3c04_011c == 0) {
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x5b7;
      FUN_18a9_066e();
      piStack_a = (int *)0x5c2;
      FUN_18a9_03b3();
      piStack_a = (int *)0x5cb;
      FUN_18a9_03b3();
    }
    else {
      if ((*(byte *)(DAT_3c04_0110 * 9 + 0x153b) & 0x10) == 0) {
        piStack_a = (int *)0x663;
        FUN_18a9_03b3();
        piStack_a = (int *)0x66c;
        FUN_18a9_03b3();
      }
      else if ((*(byte *)(DAT_3c04_0110 * 9 + 0x153b) & 0x20) == 0) {
        piStack_a = (int *)0x649;
        FUN_18a9_03b3();
        piStack_a = (int *)0x652;
        FUN_18a9_03b3();
      }
      else {
        piStack_a = (int *)0x62f;
        FUN_18a9_03b3();
        piStack_a = (int *)0x638;
        FUN_18a9_03b3();
      }
      piStack_a = (int *)0x18a9;
      pbStack_c = (byte *)0x678;
      FUN_18a9_05f0();
    }
    FUN_8027_0519();
    thunk_FUN_544d_00aa();
    return;
  case 1:
    iVar4 = (int)piVar2 - 1;
    do {
      iVar4 = iVar4 + (int)unaff_SI * 8;
      if ((((*(byte *)CONCAT22(0x4125,(undefined1 *)&DAT_451b_2281 + iVar4) & 1) != 0) &&
          (*(long *)CONCAT22(unaff_DI,in_stack_0000fff8 + 4) ==
           *(long *)CONCAT22(0x4125,(long *)(iVar4 + 0x61e5)))) &&
         (*(long *)CONCAT22(unaff_DI,in_stack_0000fff8) ==
          *(long *)CONCAT22(0x4125,(undefined1 *)&DAT_451b_2281 + iVar4))) {
        *(byte *)CONCAT22(unaff_DI,in_stack_0000fff8) =
             *(byte *)CONCAT22(unaff_DI,in_stack_0000fff8) & 0xfe;
      }
      unaff_SI = unaff_SI + 1;
      while (8 < (int)unaff_SI) {
        in_CX = in_CX + 1;
        if (8 < in_CX) {
          return;
        }
        unaff_SI = (byte *)0x0;
      }
      in_stack_0000fff8 = (byte *)(in_CX * 0x48 + (int)unaff_SI * 8 + 0x5f3b);
      unaff_DI = 0x4125;
      iVar4 = in_CX * 0x48;
    } while( true );
  case 2:
    return;
  case 3:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 4:
    do {
      piStack_a = (int *)(unaff_DI + 7);
      pbStack_c = in_stack_0000fff8 + (int)unaff_SI * 2 + 7;
      iStack_e = 0x4125;
      iStack_10 = 0x6795;
      iStack_14 = 0x4622;
      iStack_12 = iVar4;
      FUN_2133_00b8();
      while( true ) {
        do {
          pbVar10 = pbVar10 + 1;
          if (DAT_3c04_157b <= (int)pbVar10) {
            return;
          }
          iVar4 = *(int *)((int)pbVar10 * 0x41 + 0x157d);
          iVar7 = *(int *)((int)pbVar10 * 0x41 + 0x157f);
        } while (((DAT_3c04_0124 != 0) && ((*(byte *)(iVar7 * 0x70 + iVar4) & 0x20) == 0)) &&
                (((*(byte *)(iVar7 * 0x70 + iVar4 + 1) & 0x20) == 0 &&
                 (((*(byte *)(iVar7 * 0x70 + iVar4 + 0x70) & 0x20) == 0 &&
                  ((*(byte *)(iVar7 * 0x70 + iVar4 + 0x71) & 0x20) == 0))))));
        unaff_DI = iVar7 * 2 + -1;
        unaff_SI = (byte *)((iVar4 * 2 + -1 >> 3) * 8);
        if (pbVar10[(int)param_2] == 0xff) {
          bVar9 = 0xff;
        }
        else if (pbVar10[(int)param_2] == 0xf) {
          bVar9 = 8;
        }
        else {
          bVar9 = pbVar10[(int)param_2];
        }
        if ((char)bVar9 < '\0') break;
        FUN_1997_034a();
        FUN_1997_060a();
        iStack_e = 0x4125;
        iStack_10 = 0x6795;
        iStack_12 = iRam000447ac;
        iStack_14 = _DAT_4125_355a;
        pbStack_16 = (byte *)(s_Font__Can_t_create_font_4125_3542._22_2_ + iRam000447ac * 0x576c);
        acStack_18[0] = s_Font__Can_t_create_font_4125_3542[0x14];
        acStack_18[1] = s_Font__Can_t_create_font_4125_3542[0x15];
        aiStack_1c[1] = 0x4125;
        aiStack_1c[0] = 0x57a7;
        iStack_1e = 0x1997;
        iStack_20 = 0x4567;
        pbStack_c = unaff_SI;
        piStack_a = (int *)unaff_DI;
        (*DAT_451b_2a68)();
        pbVar10 = (byte *)0x1997;
        FUN_1997_06bb();
      }
      FUN_1997_034a();
      FUN_1997_060a();
      iStack_e = 0x4125;
      iStack_10 = 0x6795;
      iStack_14 = (int)DAT_4125_2c72;
      pbStack_16 = (byte *)(DAT_4125_2c70 + DAT_4125_2c72._2_2_ * 0x576c);
      acStack_18[0] = (char)DAT_4125_2c6e;
      acStack_18[1] = DAT_4125_2c6e._1_1_;
      aiStack_1c[1] = 0x4125;
      aiStack_1c[0] = 0x57a7;
      iStack_1e = 0x1997;
      iStack_20 = 0x45c0;
      iStack_12 = DAT_4125_2c72._2_2_;
      pbStack_c = unaff_SI;
      piStack_a = (int *)unaff_DI;
      (*DAT_451b_2a68)();
      FUN_1997_06bb();
      FUN_24d0_0002();
      in_stack_0000fff8 = unaff_SI + 0x5772;
      pbStack_c = unaff_SI + (int)in_stack_0000fff8 + 1;
      iStack_e = 0x4125;
      iStack_10 = 0x6795;
      iStack_12 = 0x24d0;
      iVar4 = 0x2133;
      iStack_14 = 0x45f9;
      piStack_a = (int *)(iVar7 * 2);
      FUN_2133_00b8();
      pbVar10 = (byte *)0x0;
    } while( true );
  case 5:
    piStack_a = aiStack_1c;
    pbStack_c = (byte *)0x8000;
    iStack_e = 0x4900;
    FUN_216d_002e();
    FUN_1997_034a();
    FUN_1997_060a();
    if (DAT_3c04_0124 == 0) {
      iStack_e = aiStack_2c[4];
      pbStack_c = (byte *)aiStack_2c[5];
      iStack_10 = 0x4125;
      iStack_12 = 0x581d;
      iStack_14 = 0x1997;
      pbStack_16 = (byte *)0x49a9;
      (*DAT_451b_2a74)();
    }
    else {
      piStack_a = (int *)0x1997;
      pbStack_c = (byte *)0x4969;
      FUN_24d0_0497();
      pbStack_c = (byte *)0x4125;
      iStack_e = 0x6795;
      iStack_12 = iStack_20;
      iStack_10 = iStack_1e;
      pbStack_16 = (byte *)aiStack_2c[4];
      iStack_14 = aiStack_2c[5];
      acStack_18[0] = '%';
      acStack_18[1] = 'A';
      aiStack_1c[1] = 0x581d;
      aiStack_1c[0] = 0x24d0;
      iStack_1e = 0x498c;
      (*DAT_451b_2a68)();
    }
    uVar8 = 0x1997;
    FUN_1997_06bb();
    for (iVar4 = 0; iVar4 < DAT_3c04_157b; iVar4 = iVar4 + 1) {
      aiStack_fa[iVar4] = 0;
    }
    for (iVar4 = 0; piStack_a = (int *)uVar8, iVar4 < DAT_3c04_157b; iVar4 = iVar4 + 1) {
      if ((*(char *)(iVar4 * 0x41 + 0x1592) == DAT_3c04_0110) && (aiStack_fa[iVar4] == 0)) {
        aiStack_fa[iVar4] = 1;
        pbStack_c = (byte *)0x4a2a;
        thunk_FUN_705a_0410();
        uVar3 = *(int *)(iVar4 * 0x41 + 0x157d) * 2 - 2;
        piStack_a = (int *)(*(int *)(iVar4 * 0x41 + 0x157f) * 2 + 2);
        uStack_30 = uVar3 & 7;
        if (uStack_30 == 7) {
          uStack_30 = 6;
        }
        uVar8 = 0x1997;
        FUN_1997_034a();
        pbStack_c = (byte *)0x4125;
        iStack_e = 0x6795;
        iStack_10 = 0x468b;
        iStack_12 = 0xd75;
        iStack_14 = uStack_30 * 0x468b + -0x7ba;
        pbStack_16 = (byte *)0x3bf4;
        acStack_18[0] = '%';
        acStack_18[1] = 'A';
        aiStack_1c[1] = 0x57a7;
        aiStack_1c[0] = 0x1997;
        iStack_1e = 0x4b58;
        piStack_a = (int *)(((int)uVar3 >> 3) << 3);
        (*DAT_451b_2a68)();
        if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar4 * 0x41) != 0) &&
           (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar4 * 0x41) == -2)) {
          iStack_32 = 2;
        }
        if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar4 * 0x41) != 0) &&
           (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar4 * 0x41) != -2)) {
          iVar7 = thunk_FUN_824f_044a();
          aiStack_fa[iVar7] = 1;
          iVar5 = *(int *)(iVar7 * 0x41 + 0x157d) * 2;
          uVar3 = iVar5 - 2;
          pbStack_c = (byte *)(iVar5 + 2);
          iStack_e = *(int *)(iVar7 * 0x41 + 0x157f) * 2 + 2;
          uStack_30 = uVar3 & 7;
          if (uStack_30 == 7) {
            uStack_30 = 6;
          }
          FUN_1997_034a();
          pbStack_c = (byte *)0x4125;
          iStack_e = 0x6795;
          iStack_10 = 0x468b;
          iStack_12 = 0xd75;
          iStack_14 = uStack_30 * 0x468b + -0x7ba;
          pbStack_16 = (byte *)0x3bf4;
          acStack_18[0] = '%';
          acStack_18[1] = 'A';
          aiStack_1c[1] = 0x57a7;
          aiStack_1c[0] = 0x1997;
          iStack_1e = 0x4cd1;
          piStack_a = (int *)(((int)uVar3 >> 3) << 3);
          (*DAT_451b_2a68)();
          FUN_24d0_0002();
          piStack_a = (int *)pbStack_c;
          pbStack_c = (byte *)0x4125;
          iStack_e = 0x6795;
          iStack_10 = 0x24d0;
          uVar8 = 0x2133;
          iStack_12 = 0x4cf4;
          FUN_2133_00b8();
        }
        for (iStack_10 = 0; iStack_10 < iStack_2e; iStack_10 = iStack_10 + 1) {
          aiStack_fa[aiStack_2c[iStack_10]] = 1;
          iVar7 = *(int *)(aiStack_2c[iStack_10] * 0x41 + 0x157d) * 2;
          uVar3 = iVar7 - 2;
          pbStack_c = (byte *)(iVar7 + 2);
          iStack_e = *(int *)(aiStack_2c[iStack_10] * 0x41 + 0x157f) * 2 + 2;
          uStack_30 = uVar3 & 7;
          if (uStack_30 == 7) {
            uStack_30 = 6;
          }
          FUN_1997_034a();
          pbStack_c = (byte *)0x4125;
          iStack_e = 0x6795;
          iStack_10 = 0x468b;
          iStack_12 = 0xd75;
          iStack_14 = uStack_30 * 0x468b + -0x7ba;
          pbStack_16 = (byte *)0x3bf4;
          acStack_18[0] = '%';
          acStack_18[1] = 'A';
          aiStack_1c[1] = 0x57a7;
          aiStack_1c[0] = 0x1997;
          iStack_1e = 0x4e03;
          piStack_a = (int *)(((int)uVar3 >> 3) << 3);
          (*DAT_451b_2a68)();
          FUN_24d0_0002();
          piStack_a = (int *)pbStack_c;
          pbStack_c = (byte *)0x4125;
          iStack_e = 0x6795;
          iStack_10 = 0x24d0;
          uVar8 = 0x2133;
          iStack_12 = 0x4e26;
          FUN_2133_00b8();
        }
      }
    }
    uVar8 = 0x4073;
    pbStack_c = (byte *)0x4e60;
    iVar4 = thunk_FUN_7533_0b47();
    if ((iVar4 != 0) && (iStack_32 == 0)) {
      iStack_32 = 1;
    }
    if ((iVar4 != 0) && (FUN_830b_1f5f(), iStack_32 == 2)) {
      for (iVar4 = 0; iVar4 < 100; iVar4 = iVar4 + 1) {
        if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar4 * 0x41) != 0) &&
            (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar4 * 0x41) == -2)) &&
           (*(char *)(iVar4 * 0x41 + 0x1592) == DAT_3c04_0110)) {
          piStack_a = (int *)(*(int *)(iVar4 * 0x41 + 0x157f) * 2 + 2);
          pbStack_c = (byte *)(iStack_12 << 1);
          iStack_e = iStack_14 << 1;
          FUN_24d0_0002();
          pbStack_c = (byte *)0x4125;
          iStack_e = 0x6795;
          iStack_10 = 0x24d0;
          uVar8 = 0x2133;
          iStack_12 = 0x4f59;
          FUN_2133_00b8();
        }
      }
    }
    if (-1 < (int)param_2) {
      piStack_a = (int *)0x6795;
      iStack_e = 0x4fb3;
      pbStack_c = (byte *)uVar8;
      FUN_2012_0bb7();
      piStack_a = (int *)0x6795;
      pbStack_c = (byte *)0x2012;
      iStack_e = 0x4fd0;
      FUN_2012_0bb7();
      piStack_a = (int *)0x6795;
      pbStack_c = (byte *)0x2012;
      iStack_e = 0x4feb;
      FUN_2012_0f08();
      piStack_a = (int *)0x6795;
      pbStack_c = (byte *)0x2012;
      iStack_e = 0x5008;
      FUN_2012_0f08();
    }
    return;
  case 6:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 7:
switchD_8000_90a5_caseD_1:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  if (7 < (uint)param_1) {
    return;
  }
  iVar7 = (uint)param_1 * 2;
  iVar4 = -0x8000;
  switch((uint)param_1) {
  case 0:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 1:
    goto switchD_8000_90a5_caseD_1;
  case 2:
switchD_8000_90a5_caseD_2:
    piStack_a = (int *)param_3;
    iStack_12 = 0x20;
    iStack_10 = 0x1e;
    acStack_18[0] = '%';
    acStack_18[1] = 'A';
    aiStack_1c[1] = 0x57e2;
    iStack_1e = 0x6836;
    aiStack_1c[0] = iVar4;
    pbStack_16 = unaff_SI;
    iStack_14 = unaff_DI;
    iStack_e = (int)param_2;
    pbStack_c = (byte *)uVar8;
    (*DAT_451b_2a74)();
LAB_85d0_0b39:
    if (-1 < (int)(uint)param_1) {
      pbStack_c = (byte *)0x6894;
      piStack_a = (int *)iVar4;
      FUN_1997_034a();
      iVar7 = (int)(uint)param_1 % 0x10 << 5;
      iVar4 = ((int)(uint)param_1 / 0x10) * 0x1e;
      piStack_a = (int *)0x1997;
      pbStack_c = (byte *)0x68b6;
      FUN_1997_060a();
      iStack_e = (int)pbStack_c;
      if (in_stack_0000001a == 1) {
        iStack_10 = 0x14;
      }
      else {
        iStack_10 = 0;
      }
      iStack_10 = param_4 + iStack_10;
      iStack_12 = param_3;
      aiStack_1c[1] = 0x20;
      acStack_18[0] = '\x1d';
      acStack_18[1] = '\0';
      iStack_20 = 0x4125;
      aiStack_2c[4] = 0x1997;
      aiStack_2c[3] = 0x68e7;
      aiStack_2c[5] = iVar4;
      iStack_1e = iVar7;
      aiStack_1c[0] = iVar4;
      pbStack_16 = (byte *)(int)param_2;
      iStack_14 = uVar8;
      pbStack_c = (byte *)iVar7;
      piStack_a = (int *)iVar7;
      (*DAT_451b_2a68)();
      piStack_a = (int *)0x1997;
      pbStack_c = (byte *)0x68f2;
      FUN_1997_06bb();
    }
    return;
  case 3:
    do {
      piStack_a = (int *)*(undefined4 *)(iVar7 + (int)piVar2);
      iStack_e = 0x67bb;
      pbStack_c = (byte *)iVar4;
      FUN_1000_1e79();
      pbStack_c = (byte *)0x8;
      iStack_e = 0x1000;
      iStack_10 = 0x67c2;
      FUN_1997_0129();
      aiStack_1c[(int)unaff_SI * 2] = aiStack_1c[(int)unaff_SI * 2] + 8;
      unaff_DI = unaff_DI + 1;
      while( true ) {
        piStack_a = (int *)(auStack_44 + (int)unaff_SI * 10);
        pbStack_c = (byte *)0x1997;
        iVar4 = 0x1000;
        iStack_e = 0x67e5;
        iVar7 = FUN_1000_4a99();
        if (unaff_DI < iVar7) break;
        while( true ) {
          iVar4 = 0x1000;
          unaff_SI = unaff_SI + 1;
          if (3 < (int)unaff_SI) {
            if (in_stack_00000018 == 0) goto LAB_85d0_0b39;
            piStack_a = (int *)0x1000;
            iVar4 = 0x1997;
            pbStack_c = (byte *)0x6802;
            FUN_1997_034a();
            unaff_SI = (byte *)((in_stack_00000018 + -1) * 0x20);
            unaff_DI = 0;
            goto switchD_8000_90a5_caseD_2;
          }
          if (in_stack_0000001a != 2) break;
          if (2 < (int)unaff_SI) {
            aiStack_1c[(int)unaff_SI * 2] = aiStack_1c[(int)unaff_SI * 2] + 8;
            aiStack_1c[(int)unaff_SI * 2 + 1] = aiStack_1c[(int)unaff_SI * 2 + 1] + -0xf;
            iVar7 = 0;
            while( true ) {
              piStack_a = (int *)(auStack_44 + (int)unaff_SI * 10);
              iStack_e = 0x6717;
              pbStack_c = (byte *)iVar4;
              iVar4 = FUN_1000_4a99();
              if (iVar4 <= iVar7) break;
              piStack_a = (int *)*(undefined4 *)(aiStack_1c + (int)unaff_SI * 2);
              pbStack_c = (byte *)0x1000;
              iStack_e = 0x66ed;
              FUN_1000_1e79();
              pbStack_c = (byte *)0x8;
              iStack_e = 0x1000;
              iVar4 = 0x1997;
              iStack_10 = 0x66f4;
              FUN_1997_0129();
              aiStack_1c[(int)unaff_SI * 2] = aiStack_1c[(int)unaff_SI * 2] + 8;
              iVar7 = iVar7 + 1;
            }
          }
        }
        piStack_a = (int *)*(undefined4 *)(aiStack_1c + (int)unaff_SI * 2);
        pbStack_c = (byte *)0x1000;
        iStack_e = 0x6741;
        FUN_1000_1e79();
        pbStack_c = (byte *)0x8;
        iStack_e = 0x1000;
        iStack_10 = 0x6748;
        FUN_1997_0129();
        aiStack_1c[(int)unaff_SI * 2] = aiStack_1c[(int)unaff_SI * 2] + 8;
        FUN_1000_1e79();
        FUN_1997_0129();
        aiStack_1c[(int)unaff_SI * 2] = aiStack_1c[(int)unaff_SI * 2] + 8;
        unaff_DI = 0;
      }
      iVar7 = (int)unaff_SI << 2;
      piVar2 = aiStack_1c;
    } while( true );
  case 5:
    return;
  case 6:
    do {
      in_CX = in_CX + 1;
      if (8 < in_CX) {
        for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
          *(undefined2 *)((uint)param_1 + iVar4 * 2 + 4) = 0;
        }
        for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
          for (iVar7 = 0; iVar7 < 9; iVar7 = iVar7 + 1) {
            iVar5 = (uint)param_1 + iVar4 * 0x48 + iVar7 * 8;
            piStack_a = (int *)(iVar5 + 0x1a);
            *(undefined4 *)CONCAT22(param_1._2_2_,piStack_a) = 0;
            *(undefined4 *)CONCAT22(param_1._2_2_,(undefined4 *)(iVar5 + 0x16)) = 0;
            pbVar1 = (byte *)((uint)param_1 + iVar4 * 0x48 + iVar7 * 8 + 0x16);
            *pbVar1 = *pbVar1 | 1;
            uVar3 = *(byte *)((DAT_3c04_0175 + iVar7) * 0xe0 + (DAT_3c04_0177 + iVar4) * 2 + 1) &
                    0xf;
            if (7 < uVar3) {
              uVar3 = 8;
            }
            iVar5 = aiStack_1c[uVar3];
            iVar6 = (uint)param_1 + iVar4 * 0x48 + iVar7 * 8;
            pbVar1 = (byte *)(iVar6 + 0x17);
            *pbVar1 = *pbVar1 & 0x83;
            pbVar1 = (byte *)(iVar6 + 0x17);
            *pbVar1 = *pbVar1 | ((byte)iVar5 & 0x1f) << 2;
          }
        }
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) | 1;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xfd;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xfb;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xf7;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xef;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xdf;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0xbf;
        *(byte *)((uint)param_1 + 0x29e) = *(byte *)((uint)param_1 + 0x29e) & 0x7f;
        *(byte *)((uint)param_1 + 0x29f) = *(byte *)((uint)param_1 + 0x29f) & 0xfe;
        return;
      }
      for (iVar4 = 0; iVar4 < 0x1d; iVar4 = iVar4 + 1) {
        if (*(char *)(in_CX * 0x1d + iVar4 + 0x60b) == '\0') {
          aiStack_1c[in_CX] = iVar4;
          break;
        }
      }
    } while( true );
  case 7:
    piStack_a = (int *)0xcd1;
    FUN_1000_1e79();
    piStack_a = (int *)0x1000;
    pbStack_c = (byte *)0xcd8;
    FUN_1997_0129();
    return;
  }
  piStack_a = (int *)0x0;
  pbStack_c = (byte *)0x8000;
  iStack_e = 0x8c8;
  FUN_2372_0eab();
  piStack_a = (int *)0x1;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x8d6;
  FUN_2372_0eab();
  piStack_a = (int *)0x2;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x8e4;
  FUN_2372_0eab();
  piStack_a = (int *)0x3;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x8f2;
  FUN_2372_0eab();
  piStack_a = (int *)0x4;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x900;
  FUN_2372_0eab();
  piStack_a = (int *)0x5;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x90e;
  FUN_2372_0eab();
  piStack_a = (int *)0x6;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x91c;
  FUN_2372_0eab();
  piStack_a = (int *)0x7;
  pbStack_c = (byte *)0x2372;
  iStack_e = 0x92a;
  FUN_2372_0eab();
  iVar7 = 0x407f;
  piStack_a = (int *)0x932;
  iVar4 = thunk_FUN_76ef_0e25();
  if (iVar4 == 0) {
    piStack_a = (int *)0x1f6;
    pbStack_c = (byte *)0x407f;
    iVar7 = 0x2372;
    iStack_e = 0x941;
    FUN_2372_0ef8();
  }
  iVar5 = 0x407f;
  piStack_a = (int *)0x949;
  iVar4 = thunk_FUN_76ef_0e42();
  if (iVar4 == 0) {
    piStack_a = (int *)0x1f8;
    iVar7 = 0;
    pbStack_c = (byte *)0x407f;
    iVar5 = 0x2372;
    iStack_e = 0x958;
    FUN_2372_0ef8();
  }
  if ((DAT_3c04_0120 == 0) || (iVar4 = iVar5, DAT_3c04_0130 != 0)) {
    piStack_a = (int *)0x1f7;
    iVar7 = 0;
    iVar4 = 0x2372;
    iStack_e = 0x97d;
    pbStack_c = (byte *)iVar5;
    FUN_2372_0ef8();
  }
  if (unaff_SI == (byte *)0x0) {
    piStack_a = (int *)0x1fc;
    iStack_e = 0x98f;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
    iVar5 = 0x2372;
LAB_8027_072b:
    piStack_a = (int *)0x207;
    iVar7 = 0;
    iVar4 = 0x2372;
    iStack_e = 0x9a6;
    pbStack_c = (byte *)iVar5;
    FUN_2372_0ef8();
  }
  else {
    iVar5 = iVar4;
    if (unaff_DI != 9) goto LAB_8027_072b;
  }
  iVar5 = iVar4;
  if (((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] == 0) {
    piStack_a = (int *)0x1fd;
    iVar7 = 0;
    iVar5 = 0x2372;
    iStack_e = 0x9c7;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
  }
  iVar4 = iVar5;
  if (DAT_3c04_011c == 0) {
    piStack_a = (int *)0x203;
    iVar7 = 0;
    iVar4 = 0x2372;
    iStack_e = 0x9e2;
    pbStack_c = (byte *)iVar5;
    FUN_2372_0ef8();
  }
  if (piStack_a == (int *)0x0) {
    piStack_a = (int *)0x205;
    iStack_e = 0x9f6;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
    piStack_a = (int *)0x208;
    iVar7 = 0;
    pbStack_c = (byte *)0x2372;
    iVar4 = 0x2372;
    iStack_e = 0xa04;
    FUN_2372_0ef8();
  }
  if (((unaff_SI != (byte *)0x0) && (iVar7 == 0x1c)) &&
     (*(char *)(DAT_3c04_0110 * 0x1d + 0xcff) == '\x03')) {
    if ((((DAT_451b_1f02._2_2_ == 0x2e1d) &&
         (*(int *)(DAT_3c04_0110 * 0x1d + 0xd00) * 0x16 + -0x7780 == (int)DAT_451b_1f02)) &&
        (((unaff_SI[unaff_DI * 0x70] & 0x40) == 0 && ((unaff_DI != 10 && (unaff_DI != 0xb)))))) &&
       ((unaff_DI != 2 && (iVar7 = 0x1c, unaff_DI != 3)))) goto LAB_8027_082f;
  }
  piStack_a = (int *)0x206;
  iVar7 = 0;
  iStack_e = 0xa9c;
  pbStack_c = (byte *)iVar4;
  FUN_2372_0ef8();
  iVar4 = 0x2372;
LAB_8027_082f:
  if (((pbStack_c == (byte *)0x0) || (unaff_SI == (byte *)0x0)) ||
     (((iVar7 != 0x1c && (iStack_e == 0)) ||
      ((unaff_DI != 0xb || (iVar7 = iVar4, (*(byte *)((int)unaff_SI * 2 + 0x9a1) & 0x40) != 0))))))
  {
    piStack_a = (int *)0x209;
    iVar7 = 0x2372;
    iStack_e = 0xae7;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
  }
  if ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < 1) {
    piStack_a = (int *)0x20c;
    iStack_e = 0xb08;
    pbStack_c = (byte *)iVar7;
    FUN_2372_0ef8();
    piStack_a = (int *)0x20e;
    pbStack_c = (byte *)0x2372;
    iStack_e = 0xb16;
    FUN_2372_0ef8();
    piStack_a = (int *)0x20f;
    pbStack_c = (byte *)0x2372;
    iVar7 = 0x2372;
    iStack_e = 0xb24;
    FUN_2372_0ef8();
  }
  iVar4 = iVar7;
  if (unaff_SI == (byte *)0x0) {
    piStack_a = (int *)0x211;
    iVar4 = 0x2372;
    iStack_e = 0xb36;
    pbStack_c = (byte *)iVar7;
    FUN_2372_0ef8();
  }
  piStack_a = (int *)0xb3e;
  iVar7 = FUN_8027_225b();
  if (iVar7 == 1) {
    piStack_a = (int *)0x212;
    iStack_e = 0xb4e;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
    piStack_a = (int *)0x213;
    pbStack_c = (byte *)0x2372;
    iStack_e = 0xb5c;
    FUN_2372_0ef8();
    piStack_a = (int *)0x214;
    pbStack_c = (byte *)0x2372;
    iStack_e = 0xb6a;
    FUN_2372_0ef8();
    piStack_a = (int *)0x215;
    pbStack_c = (byte *)0x2372;
    iVar4 = 0x2372;
    iStack_e = 0xb78;
    FUN_2372_0ef8();
  }
  if (DAT_3c04_015b != 0) {
    piStack_a = (int *)0x217;
    iStack_e = 0xb93;
    pbStack_c = (byte *)iVar4;
    FUN_2372_0ef8();
  }
  return;
}

