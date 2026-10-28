
/* WARNING: Instruction at (ram,0x000600e1) overlaps instruction at (ram,0x000600e0)
    */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __cdecl16far FUN_66b0_0b36(int param_1,undefined2 param_2,int param_3)

{
  byte *pbVar1;
  int *piVar2;
  char cVar3;
  bool bVar4;
  undefined1 uVar5;
  byte bVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int *piVar10;
  int iVar11;
  int iVar12;
  undefined4 *unaff_SI;
  uint uVar13;
  int iVar14;
  uint unaff_DI;
  undefined2 uVar15;
  undefined2 unaff_SS;
  int aiStack_d0 [8];
  int aiStack_c0 [8];
  int aiStack_b0 [16];
  int aiStack_90 [16];
  int aiStack_70 [8];
  int aiStack_60 [8];
  int aiStack_50 [8];
  int aiStack_40 [8];
  int aiStack_30 [8];
  int iStack_20;
  int iStack_1e;
  uint uStack_16;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  uint uStack_8;
  undefined4 uStack_6;
  
  cVar3 = *(char *)(param_1 * 0x1d + 0xcff);
  if (3 < (uint)(int)cVar3) {
    uRam0004ca4f = 2;
    return 1;
  }
  uVar15 = 0x6000;
  switch(cVar3) {
  case '\0':
    do {
      uStack_6 = (char *)CONCAT22(uVar15,(char *)0x885);
      FUN_606a_07ea();
      while( true ) {
        do {
          bVar4 = true;
          iStack_a = 0;
          uStack_6 = (char *)((ulong)uStack_6 & 0xffff);
          while (((bVar4 && (iStack_a < 2)) && ('\x03' < *(char *)((int)unaff_SI * 0x16 + -0x7779)))
                ) {
            iStack_a = iStack_a + 1;
            FUN_606a_0fda();
            FUN_606a_11f8();
            FUN_606a_1348();
            uVar13 = FUN_606a_0efc();
            uStack_8 = uVar13;
            if (uVar13 - 1 < 4) {
              iVar11 = (uVar13 - 1) * 2;
              uVar15 = 0x6000;
              switch(uVar13) {
              case 1:
                while( true ) {
                  LOCK();
                  *(byte *)(iVar11 + 0xe3) = *(byte *)(iVar11 + 0xe3) | (byte)uVar13;
                  UNLOCK();
                  bVar6 = (byte)DAT_3c04_0110;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 0xe1);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 0xe1);
                  *pbVar1 = *pbVar1 | bVar6 & 0xf;
                  bVar6 = (byte)DAT_3c04_0110;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 3);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 3);
                  *pbVar1 = *pbVar1 | bVar6 & 0xf;
                  uStack_6 = (char *)CONCAT22(uVar15,(char *)
                                                  s__m__Mono_version__for_laptop_use_4125_2765 + 0xd
                                             );
                  FUN_1555_1ab9();
                  uStack_6 = (char *)0x1555279f;
                  iVar11 = FUN_621e_0749();
                  if (iVar11 == 0) {
                    uStack_6 = (char *)0x155527ce;
                    FUN_1555_1ab9();
                    uStack_6 = (char *)0x155527fb;
                    FUN_621e_0749();
                  }
                  uVar15 = 0x1555;
                  *(byte *)(unaff_DI * 0x41 + 0x1592) = (byte)uStack_8;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 1);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 1);
                  *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 0xe3);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 0xe3);
                  *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 0xe1);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 0xe1);
                  *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 3);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 3);
                  *pbVar1 = *pbVar1 | (byte)uStack_8 & 0xf;
                  unaff_DI = unaff_DI + 1;
                  if (DAT_3c04_157b <= (int)unaff_DI) break;
                  uStack_8 = (uint)*(char *)(unaff_DI * 0x41 + 0x1592);
                  iVar11 = (int)(unaff_DI * 0x14) / DAT_3c04_157b;
                  if (uStack_6._2_2_ != iVar11) {
                    uStack_6 = (char *)CONCAT22(iVar11,(char *)uStack_6);
                    uVar15 = 0x40d7;
                    thunk_FUN_8027_1463();
                  }
                  *(undefined1 *)(unaff_DI * 0x41 + 0x1592) = (undefined1)DAT_3c04_0110;
                  bVar6 = (byte)DAT_3c04_0110;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  pbVar1 = (byte *)(iVar11 + 1);
                  *pbVar1 = *pbVar1 & 0xf0;
                  pbVar1 = (byte *)(iVar11 + 1);
                  *pbVar1 = *pbVar1 | bVar6 & 0xf;
                  uVar13 = DAT_3c04_0110 & 0xf;
                  iVar11 = *(int *)(unaff_DI * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(unaff_DI * 0x41 + 0x157d) * 2;
                  *(byte *)(iVar11 + 0xe3) = *(byte *)(iVar11 + 0xe3) & 0xf0;
                  *(byte *)(iVar11 + 0xe3) = *(byte *)(iVar11 + 0xe3) | (byte)uVar13;
                }
                thunk_FUN_8027_1463();
                DAT_3c04_0110 = (uint)(char *)uStack_6;
                return 0x3c04;
              case 2:
                piVar2 = (int *)((int)unaff_SI + iVar11 + 2);
                *piVar2 = *piVar2 + uVar13;
                LOCK();
                *(byte *)(iVar11 + 1) = *(byte *)(iVar11 + 1) | (byte)uVar13;
                UNLOCK();
                thunk_FUN_85d0_1298();
                thunk_FUN_830b_1fed();
                if ((DAT_451b_0292._1_1_ & 0x20) != 0) {
                  pbVar1 = (byte *)(param_3 * 0xe0 + 3);
                  *pbVar1 = *pbVar1 & 0xdf;
                }
                if (*(char *)((byte)DAT_451b_0292 + 0x710) == '\n') {
                  if (DAT_451b_029b == '\x0f') {
                    iVar11 = 0;
                  }
                  else if ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_451b_029b] < 2) {
                    iVar11 = *(int *)(DAT_451b_029b * 0x14 + 0x185);
                  }
                  else {
                    iVar11 = *(int *)(DAT_451b_029b * 0x14 + 0x185) /
                             (int)((undefined2 *)&DAT_451b_1e8a)[DAT_451b_029b];
                  }
                  if (iVar11 / 2 < 0) {
                    iVar11 = 0;
                  }
                  else {
                    iVar11 = iVar11 / 2;
                  }
                  if ((*(int *)((char)DAT_451b_029a * 2 + 0xd0) == 0) && (0 < iVar11)) {
                    thunk_FUN_7e8f_04f0();
                    uStack_6 = (char *)0x40c1889b;
                    FUN_1000_4944();
                    thunk_FUN_6a0f_04c5();
                  }
                  if (DAT_451b_029b < '\b') {
                    piVar2 = (int *)((char)DAT_451b_029a * 0x14 + 0x185);
                    *piVar2 = *piVar2 + iVar11;
                    piVar2 = (int *)(DAT_451b_029b * 0x14 + 0x185);
                    *piVar2 = *piVar2 + iVar11 * -2;
                  }
                  uVar15 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
                  piVar10 = (int *)_DAT_451b_027d;
                  if (*(char *)((int)piVar10 + 0x15) != '\x0f') {
                    if (*(byte *)((int)piVar10 + 0x2f) == DAT_3c04_0110) {
                      uVar5 = 0xf;
                    }
                    else {
                      uVar5 = *(undefined1 *)((int)piVar10 + 0x15);
                    }
                    *(undefined1 *)((int)piVar10 + 0x2f) = uVar5;
                  }
                  uVar15 = (undefined2)((ulong)_DAT_451b_027d >> 0x10);
                  piVar10 = (int *)_DAT_451b_027d;
                  *(undefined1 *)(piVar10 + 0x18) = 0;
                  *(byte *)((int)piVar10 + 0x15) = DAT_451b_029a;
                  *(undefined1 *)((int)piVar10 + 0x2d) = 0;
                  iVar11 = 4;
                  while (iVar12 = iVar11 + -1, iVar11 != 0) {
                    pbVar1 = (byte *)(((undefined2 *)&DAT_451b_0281)[iVar12] * 0xe0 +
                                      ((undefined2 *)&DAT_451b_0289)[iVar12] * 2 + 1);
                    *pbVar1 = *pbVar1 & 0xef;
                    thunk_FUN_6bb0_0000();
                    bVar6 = DAT_451b_029a & 0xf;
                    iVar11 = ((undefined2 *)&DAT_451b_0281)[iVar12] * 0xe0 +
                             ((undefined2 *)&DAT_451b_0289)[iVar12] * 2;
                    pbVar1 = (byte *)(iVar11 + 1);
                    *pbVar1 = *pbVar1 & 0xf0;
                    pbVar1 = (byte *)(iVar11 + 1);
                    *pbVar1 = *pbVar1 | bVar6;
                    thunk_FUN_85d0_1298();
                    thunk_FUN_830b_1fed();
                    iVar11 = iVar12;
                  }
                  FUN_1555_0d9e();
                  *(undefined2 *)((int)(int *)_DAT_451b_027d + 0x31) = 0;
                  uVar13 = thunk_FUN_824f_044a();
                  iVar11 = DAT_3c04_0181;
                  uStack_6._2_2_ = uVar13;
                  while (iVar12 = iVar11 + -1, iVar11 != 0) {
                    iVar11 = iVar12;
                    if ((((*(char *)(iVar12 * 0x16 + -0x777b) == DAT_451b_029b) &&
                         (*(int *)(iVar12 * 0x16 + -0x7780) == -1)) &&
                        ((*(byte *)(iVar12 * 0x16 + -0x7772) & 0xf) == 1)) &&
                       (*(byte *)(iVar12 * 0x16 + -0x7771) >> 1 == uStack_6._2_2_)) {
                      FUN_1b62_03be();
                    }
                  }
                  for (iVar11 = 0; iVar11 < DAT_3c04_157b; iVar11 = iVar11 + 1) {
                    if (((*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar11 * 0x41) != 0) &&
                        (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar11 * 0x41) ==
                         *_DAT_451b_027d)) &&
                       (*(int *)(iVar11 * 0x41 + 0x15b2) == ((int *)_DAT_451b_027d)[1])) {
                      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar11 * 0x41) = 0;
                      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar11 * 0x41) = 0;
                      *(undefined1 *)(iVar11 * 0x41 + 0x15aa) = 0;
                      *(undefined2 *)(iVar11 * 0x41 + 0x15b2) = 0;
                      *(undefined1 *)(iVar11 * 0x41 + 0x15a9) = 0xff;
                    }
                  }
                  thunk_FUN_824f_03f9();
                  thunk_FUN_824f_02bf();
                  thunk_FUN_824f_0372();
                  iVar11 = 0x21;
                }
                else {
                  iVar11 = 1;
                }
                return iVar11;
              case 3:
                FUN_1000_4944();
                thunk_FUN_621e_170c();
                thunk_FUN_621e_0ae7();
                FUN_1a8b_0001();
                return 1;
              case 4:
              }
              goto LAB_5efd_1356;
            }
            if ((uStack_6._2_2_ != 0) && (DAT_3c04_0124 != 0)) {
              uVar15 = 0x40d7;
              iVar11 = thunk_FUN_8027_225b();
              if (iVar11 < 10) {
                uVar15 = 0x3ff7;
                uStack_6 = s_Choose_4_buttons_for_shortcuts_4125_056b + 2;
                iVar11 = thunk_FUN_621e_12c9();
                if (iVar11 == 1) {
                  uVar15 = 0x3fbd;
                  thunk_FUN_57d5_0e4b();
                }
              }
            }
            bVar4 = false;
            if (((int)*(char *)((int)unaff_SI * 0x16 + -0x777b) != DAT_3c04_0110) ||
               (*(char *)((int)unaff_SI * 0x16 + -0x777c) != '\x1c')) {
              bVar4 = false;
            }
          }
          do {
            do {
              uVar13 = unaff_DI;
              unaff_DI = uVar13 - 1;
              if (uVar13 == 0) {
                return 0;
              }
              unaff_SI = (undefined4 *)aiStack_50[uVar13 + 2];
            } while (((unaff_SI == (undefined4 *)0xffff) ||
                     ((int)*(char *)((int)unaff_SI * 0x16 + -0x777b) != DAT_3c04_0110)) ||
                    (*(char *)((int)unaff_SI * 0x16 + -0x777c) != '\x1c'));
            if (-1 < aiStack_40[uVar13]) {
              uVar15 = 0x3fd6;
              thunk_FUN_5c8e_023f();
            }
          } while (((DAT_3c04_011e != 0) &&
                   (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) &&
                  ((*(undefined4 **)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) ==
                    unaff_SI && (iVar11 = FUN_606a_0cf3(), iVar11 != 0))));
        } while ((*(byte *)((int)unaff_SI * 0x16 + -0x7772) & 0xf) != 3);
        iVar12 = FUN_606a_1637();
        iVar11 = DAT_3c04_0181;
        if (iVar12 != 0) break;
        while (iVar12 = iVar11 + -1, iVar11 != 0) {
          iVar11 = iVar12;
          if ((((int)*(char *)(iVar12 * 0x16 + -0x777b) == DAT_3c04_0110) &&
              (*(int *)(iVar12 * 0x16 + -0x7780) == *(int *)((int)unaff_SI * 0x16 + -0x7780))) &&
             ((*(int *)(iVar12 * 0x16 + -0x777e) == *(int *)((int)unaff_SI * 0x16 + -0x777e) &&
              ((*(byte *)(iVar12 * 0x16 + -0x7772) & 0xf) ==
               (*(byte *)((int)unaff_SI * 0x16 + -0x7772) & 0xf))))) {
            pbVar1 = (byte *)(iVar12 * 0x16 + -0x7772);
            *pbVar1 = *pbVar1 & 0xf0;
            pbVar1 = (byte *)(iVar12 * 0x16 + -0x7771);
            *pbVar1 = *pbVar1 & 1;
            *(undefined2 *)(iVar12 * 0x16 + -0x776c) = 0xffff;
            *(undefined2 *)(iVar12 * 0x16 + -0x776e) = 0xffff;
          }
        }
      }
      uStack_16 = (uint)(*(byte *)((int)unaff_SI * 0x16 + -0x7771) >> 1);
    } while( true );
  case '\x01':
    for (; uStack_8 = uVar15, (int)unaff_SI < 8; unaff_SI = (undefined4 *)((int)unaff_SI + 1)) {
      uStack_6 = (char *)(ulong)CONCAT12(unaff_SI != DAT_451b_04c2,unaff_SI + 0x5a);
      iStack_a = 0xdf89;
      FUN_18a9_066e();
      uVar15 = 0x18a9;
    }
    uStack_6 = (char *)0x10167;
    iStack_a = 0xdf9d;
    iVar11 = FUN_18a9_066e();
    return iVar11;
  case '\x02':
    uStack_6 = (char *)0x6000db74;
    iVar11 = (**(code **)(&stack0x0754 + (int)unaff_SI))();
    return iVar11;
  case '\x03':
                    /* WARNING (jumptable): Read-only address (ram,0x0004ca4f) is written */
                    /* WARNING: Read-only address (ram,0x0004ca4f) is written */
    uRam0004ca4f = 0;
    *(int *)(&stack0x0037 + (int)unaff_SI) = *(int *)(&stack0x0037 + (int)unaff_SI) + cVar3 * 2;
    uStack_6 = (char *)CONCAT22(0xee,(char *)uStack_6);
    func_0x0006842e();
    iStack_1e = (int)*unaff_SI;
  }
  do {
    uVar13 = unaff_DI;
    if ((int)*(char *)(iStack_1e * 0x41 + 0x1592) == DAT_3c04_0110) {
      aiStack_90[unaff_DI] = 1;
    }
    do {
      unaff_DI = uVar13 - 1;
      if (uVar13 == 0) {
        unaff_DI = 8;
        goto LAB_5efd_1356;
      }
      uVar13 = unaff_DI;
    } while (aiStack_30[unaff_DI] == 0);
    if (DAT_3c04_0110 != unaff_DI) {
      iStack_a = iStack_a + 1;
    }
    iStack_1e = thunk_FUN_824f_044a();
  } while( true );
LAB_5efd_1356:
  uVar13 = unaff_DI - 1;
  if (unaff_DI == 0) {
    bVar4 = false;
    uVar13 = 8;
    while (uVar7 = uVar13 - 1, uVar13 != 0) {
      uVar13 = uVar7;
      if (((*(int *)(uVar7 * 2 + 0x137) != 0) && (DAT_3c04_0110 != uVar7)) &&
         ((*(byte *)(DAT_3c04_0110 * 8 + uVar7 + 0x153b) & 0xc) == 8)) {
        bVar4 = true;
      }
    }
    if ((DAT_3c04_0116 != 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 0)) {
      iVar11 = 8;
      while (iVar11 != 0) {
        aiStack_d0[iVar11 + -1] = 0;
        iVar11 = iVar11 + -1;
      }
      iVar11 = 8;
      while (iVar12 = iVar11 + -1, iVar11 != 0) {
        iVar11 = iVar12;
        if ((*(int *)(iVar12 * 2 + 0x137) != 0) && (*(int *)(iVar12 * 2 + 0xd0) != 0)) {
          iVar14 = 8;
          while (iVar9 = iVar14 + -1, iVar14 != 0) {
            iVar14 = iVar9;
            if (((*(int *)(iVar9 * 2 + 0x137) != 0) && (*(int *)(iVar9 * 2 + 0xd0) != 1)) &&
               ((*(byte *)(iVar12 * 8 + iVar9 + 0x153b) & 3) == 2)) {
              aiStack_d0[iVar12] = 1;
            }
          }
        }
      }
      iVar11 = 8;
      while (iVar12 = iVar11 + -1, iVar11 != 0) {
        iVar11 = iVar12;
        if (((*(int *)(iVar12 * 2 + 0x137) != 0) && (*(int *)(iVar12 * 2 + 0xd0) != 0)) &&
           ((aiStack_d0[DAT_3c04_0110] != 0 || (aiStack_d0[iVar12] != 0)))) {
          aiStack_c0[iVar12] = 0;
        }
      }
    }
    iVar11 = 8;
    while( true ) {
      iVar12 = iVar11 + -1;
      uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (iVar11 == 0) break;
      iVar11 = (int)DAT_451b_018e + iVar12 * 2;
      iStack_1e = *(int *)(iVar11 + 0x3dc) + *(int *)(iVar11 + 0x3fc);
      if (DAT_3c04_0128 == 0) {
        iStack_20 = 8;
      }
      else {
        iStack_20 = 4;
      }
      iVar11 = thunk_FUN_557a_0a6e();
      if (iVar11 != 0) {
        aiStack_c0[iVar12] = 0;
      }
      if ((bVar4) && ((*(byte *)(DAT_3c04_0110 * 8 + iVar12 + 0x153b) & 0xc) == 0)) {
        aiStack_c0[iVar12] = 0;
      }
      if ((uStack_8 == 0) && (aiStack_60[iVar12] == 0)) {
        aiStack_c0[iVar12] = 0;
      }
      iVar11 = thunk_FUN_8027_225b();
      if ((iVar11 < iStack_20) && (iStack_1e == 0)) {
        aiStack_c0[iVar12] = 0;
      }
      iVar11 = iVar12;
      if ((1 < iStack_a) && (aiStack_30[iVar12] / 4 < aiStack_b0[iVar12])) {
        aiStack_c0[iVar12] = 0;
      }
    }
    aiStack_c0[DAT_3c04_0110] = 0;
    iVar11 = 0;
    iVar12 = 8;
    while (iVar14 = iVar12 + -1, iVar12 != 0) {
      iVar12 = iVar14;
      if ((aiStack_30[iVar14] != 0) && (iVar11 < aiStack_c0[iVar14])) {
        iVar11 = aiStack_c0[iVar14];
        iStack_c = iVar14;
      }
    }
    if ((*(char *)(iStack_e * 0x41 + 0x1592) != '\x0f') &&
       ((int)*(char *)(iStack_e * 0x41 + 0x1592) != DAT_3c04_0110)) {
      bVar4 = false;
      iVar11 = *(int *)((int)DAT_451b_018e + 0x24a);
      while (iVar12 = iVar11 + -1, iVar11 != 0) {
        iVar11 = iVar12;
        if ((int)*(char *)(iStack_e * 0x41 + 0x1592) == aiStack_b0[iVar12]) {
          bVar4 = true;
        }
      }
      if (!bVar4) {
        iStack_c = (int)*(char *)(iStack_e * 0x41 + 0x1592);
      }
    }
    if ((iStack_c != -1) && (aiStack_60[iStack_c] == 0)) {
      iStack_c = -1;
    }
    return iStack_c;
  }
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + aiStack_70[uVar13];
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + aiStack_90[uVar13] * 0xf;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + aiStack_40[uVar13] * 4;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + aiStack_50[uVar13] * 6;
  uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar11 = (int)DAT_451b_018e;
  iVar12 = iVar11 + uVar13 * 2;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x3bc) * 4;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x3cc);
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x3dc);
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x3ec) * 2;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x3fc) * 2;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + *(int *)(iVar12 + 0x40c) * 2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    piVar10 = aiStack_c0 + uVar13;
    iVar11 = *(int *)(iVar11 + 0x18);
LAB_5efd_12f0:
    *piVar10 = *piVar10 + iVar11;
  }
  else {
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 2) {
      piVar10 = aiStack_c0 + uVar13;
      iVar11 = *(int *)(iVar11 + 0x1e);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 1) {
      piVar10 = aiStack_c0 + uVar13;
      iVar11 = *(int *)(iVar11 + 0x1a);
      goto LAB_5efd_12f0;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0xc0) == 0) {
      piVar10 = aiStack_c0 + uVar13;
      iVar11 = *(int *)(iVar11 + 0x1c);
      goto LAB_5efd_12f0;
    }
  }
  uVar7 = iStack_10 - *(int *)(uVar13 * 2 + 0x10e3);
  uVar8 = (int)uVar7 >> 0xf;
  aiStack_c0[uVar13] = aiStack_c0[uVar13] + (int)((uVar7 ^ uVar8) - uVar8) / 8;
  uVar7 = aiStack_30[DAT_3c04_0110] - aiStack_30[uVar13] >> 0xf;
  aiStack_c0[uVar13] =
       aiStack_c0[uVar13] +
       (int)((aiStack_30[DAT_3c04_0110] - aiStack_30[uVar13] ^ uVar7) - uVar7) / 4;
  unaff_DI = uVar13;
  goto LAB_5efd_1356;
}

