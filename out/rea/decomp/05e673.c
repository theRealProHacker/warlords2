
/* WARNING: Instruction at (ram,0x00055fc7) overlaps instruction at (ram,0x00055fc5)
    */
/* WARNING: Removing unreachable block (ram,0x0005e763) */
/* WARNING: Removing unreachable block (ram,0x0005e778) */
/* WARNING: Removing unreachable block (ram,0x00055e45) */
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 ******* __cdecl16far FUN_5d9f_0c83(int param_1,int param_2)

{
  byte *pbVar1;
  undefined4 *******pppppppuVar2;
  uint uVar3;
  undefined4 *******in_CX;
  char cVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char *pcVar9;
  int *piVar10;
  undefined4 *******unaff_SI;
  undefined4 *******pppppppuVar11;
  int unaff_DI;
  int iVar12;
  int iVar13;
  undefined4 *******pppppppuVar14;
  undefined2 uVar15;
  undefined2 uVar16;
  int unaff_SS;
  bool bVar17;
  int aiStack_d0 [8];
  int aiStack_c0 [8];
  int aiStack_b0 [16];
  int aiStack_90 [16];
  int aiStack_70 [8];
  int local_60 [5];
  undefined1 auStack_56 [6];
  int aiStack_50 [8];
  int local_40 [8];
  int aiStack_30 [4];
  undefined2 uStack_28;
  undefined2 uStack_26;
  int iStack_24;
  undefined4 *******pppppppuStack_22;
  int iStack_20;
  undefined4 ******appppppuStack_1e [2];
  int iStack_1a;
  undefined2 uStack_18;
  undefined1 *local_16;
  int local_a;
  undefined4 *******local_8;
  int local_6;
  int iStack_4;
  
  local_8 = (undefined4 *******)0xffff;
  pppppppuVar11 = DAT_3c04_157b;
  do {
    do {
      pppppppuVar14 = pppppppuVar11;
      pppppppuVar11 = (undefined4 *******)((int)pppppppuVar14 + -1);
      if (pppppppuVar14 == (undefined4 *******)0x0) {
        return (undefined4 *******)0xffff;
      }
    } while (*(char *)((int)pppppppuVar11 * 0x41 + 0x1592) != (char)DAT_3c04_0110);
    iVar12 = 4;
    do {
      bVar17 = iVar12 != 0;
      iVar12 = iVar12 + -1;
    } while (bVar17);
    iVar12 = 0;
    local_6 = 0;
    uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar8 = (int)DAT_451b_018e;
    pppppppuVar2 = (undefined4 *******)(*(byte *)((int)pppppppuVar11 + iVar8 + 0x56) - 2);
  } while ((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 9 <= pppppppuVar2);
  pcVar9 = (char *)((int)pppppppuVar2 * 2);
  uVar16 = 0x5000;
  switch(pppppppuVar2) {
  case (undefined4 *******)0x0:
    do {
      pppppppuVar14 = pppppppuVar11;
      if ((*(int *)((int)pppppppuVar11 * 0x16 + -0x7780) == -1) &&
         ((undefined4 *******)*(int *)((int)pppppppuVar11 * 0x16 + -0x777e) == unaff_SI)) {
        if (iStack_4 == 0) {
          pppppppuVar2 = appppppuStack_1e;
          pppppppuVar2[local_6] = (undefined4 ******)pppppppuVar11;
          local_6 = local_6 + 1;
          if (7 < local_6) {
LAB_57d5_0d04:
            if (local_6 == 0) {
              return pppppppuVar2;
            }
            local_8 = (undefined4 *******)0x0;
            while( true ) {
              cVar4 = '\0';
              iVar12 = 8;
              iVar8 = -1;
              while (iVar13 = iVar12 + -1, iVar12 != 0) {
                iVar12 = iVar13;
                if ((appppppuStack_1e[iVar13] != (undefined4 ******)0xffff) &&
                   (cVar4 < *(char *)((int)appppppuStack_1e[iVar13] * 0x16 + -0x777a))) {
                  cVar4 = *(char *)((int)appppppuStack_1e[iVar13] * 0x16 + -0x777a);
                  iVar8 = iVar13;
                }
              }
              if (iVar8 == -1) break;
              aiStack_30[(int)local_8 + 1] = (int)appppppuStack_1e[iVar8];
              local_8 = (undefined4 *******)((int)local_8 + 1);
              appppppuStack_1e[iVar8] = (undefined4 ******)0xffff;
            }
            do {
              iVar12 = 8;
              while (iVar12 != 0) {
                appppppuStack_1e[iVar12 + -1] = (undefined4 ******)0xffff;
                iVar12 = iVar12 + -1;
              }
              for (iVar12 = 0; iVar12 < 8; iVar12 = iVar12 + 1) {
                if (aiStack_30[iVar12 + 1] != -1) {
                  appppppuStack_1e[0] = (undefined4 ******)aiStack_30[iVar12 + 1];
                  aiStack_30[iVar12 + 1] = -1;
                  break;
                }
              }
              if (appppppuStack_1e[0] == (undefined4 ******)0xffff) {
                return (undefined4 *******)0xffff;
              }
              if (DAT_3c04_0124 != 0) {
                _local_16 = (char *)CONCAT22(*(undefined2 *)(param_1 * 0x41 + 0x157d),0x5000);
                uStack_18 = (undefined4 *******)0x8b80;
                pppppppuVar2 = (undefined4 *******)FUN_57d5_0a3e();
code_r0x00058b83:
                if ((int)pppppppuVar2 < 0xf) {
                  return pppppppuVar2;
                }
              }
              _local_16 = (char *)0x50008b91;
              FUN_57d5_0e4b();
            } while( true );
          }
        }
        else {
          iStack_4 = iStack_4 + -1;
        }
      }
      do {
        pppppppuVar11 = (undefined4 *******)((int)pppppppuVar14 + -1);
        pppppppuVar2 = (undefined4 *******)0x0;
        if (pppppppuVar14 == (undefined4 *******)0x0) goto LAB_57d5_0d04;
        pppppppuVar14 = pppppppuVar11;
      } while ((((*(char *)((int)pppppppuVar11 * 0x16 + -0x777b) != (char)DAT_3c04_0110) ||
                ((*(byte *)((int)pppppppuVar11 * 0x16 + -0x7772) & 0x70) != 0)) ||
               ((*(uint *)((int)pppppppuVar11 * 0x16 + -0x7774) & 0x40) != 0)) ||
              (((*(char *)((int)pppppppuVar11 * 0x16 + -0x777c) == '\x1c' && (unaff_DI != 0)) ||
               (((*(byte *)((int)pppppppuVar11 * 0x16 + -0x7772) & 0xf) != 0 ||
                ((param_2 != 0 &&
                 (((undefined1 *)&DAT_451b_0664)[*(char *)((int)pppppppuVar11 * 0x16 + -0x777c) * 6]
                  == '\0'))))))));
    } while( true );
  case (undefined4 *******)0x1:
    *pcVar9 = *pcVar9 + (char)pppppppuVar2 + ((int)pppppppuVar2 < 0);
    do {
      iStack_4 = iStack_4 + 1;
      iVar8 = iVar12;
      if ((*(byte *)((int)DAT_3c04_0110 * 8 + (int)*(char *)((int)in_CX * 0x41 + 0x1592) + 0x153b) &
          3) == 2) {
        local_6 = local_6 + 1;
      }
      do {
        iVar12 = iVar8 + -1;
        if (iVar8 == 0) {
          if (local_6 == 0) {
            if (iStack_4 < 2) {
              if (iStack_4 != 0) {
                local_8 = (undefined4 *******)((int)(undefined2 *)&DAT_4125_0002 + 1);
              }
            }
            else {
              local_8 = (undefined4 *******)s_Borland_C_____Copyright_1991_Bor_4125_0004;
            }
          }
          else {
            local_8 = (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4)
            ;
          }
          return local_8;
        }
        in_CX = (undefined4 *******)(uint)(byte)(&stack0xfff1)[iVar8];
        iVar8 = iVar12;
      } while ((((in_CX == (undefined4 *******)0xff) ||
                (*(char *)((int)in_CX * 0x41 + 0x1592) == '\x0f')) ||
               ((undefined4 *******)(int)*(char *)((int)in_CX * 0x41 + 0x1592) == DAT_3c04_0110)) ||
              (*(char *)(*(byte *)(*(int *)((int)in_CX * 0x41 + 0x157f) * 0xe0 +
                                  *(int *)((int)in_CX * 0x41 + 0x157d) * 2) + 0x710) != '\n'));
    } while( true );
  case (undefined4 *******)0x2:
    pcVar9[-0x6305] = pcVar9[-0x6305] + (char)pppppppuVar2;
    *(char *)(pppppppuVar14 + 1) = *(char *)(pppppppuVar14 + 1) + (char)((uint)pcVar9 >> 8);
    iVar8 = -1;
    do {
      bVar17 = true;
      do {
        uVar15 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        if (*(char *)((int)DAT_451b_002a + (int)pcVar9 * 0x70 + iVar12 + 0x6120) == '\x04') {
          bVar17 = true;
        }
        if (bVar17) {
          pppppppuVar11 = (undefined4 *******)((uint)pppppppuVar11 | 1 << ((byte)iVar8 & 0x1f));
        }
        iVar8 = iVar8 + 1;
        if (7 < iVar8) {
          return pppppppuVar11;
        }
        iVar13 = (int)DAT_451b_002a + iVar8 * 4;
        iVar12 = param_1 + *(int *)(iVar13 + 0xbc);
        pcVar9 = (char *)(param_2 + *(int *)(iVar13 + 0xbe));
        bVar17 = 0x6f < iVar12 || ((int)pcVar9 < 0 || iVar12 < 0);
      } while ((int)pcVar9 < 0x9c);
    } while( true );
  case (undefined4 *******)0x3:
    thunk_FUN_7875_06ae();
    thunk_FUN_7e8f_00d6();
    thunk_FUN_7e8f_00d6();
    thunk_FUN_7875_06ae();
    _local_16 = s_Floating_point_error___s__4125_39a5 + 0x17;
    thunk_FUN_7e8f_0058();
    _local_16 = (char *)0x40c14394;
    thunk_FUN_7e8f_0058();
    pppppppuVar11 = (undefined4 *******)FUN_22bf_0757();
    return pppppppuVar11;
  case (undefined4 *******)0x4:
    while (pppppppuVar2 != (undefined4 *******)0x0) {
      if ((*(int *)(iVar8 + (int)in_CX * 0x5c + 0x24c) != 0) &&
         (*(int *)(iVar8 + (int)in_CX * 0x5c + 0x250) == -1)) goto LAB_5efd_0ae9;
      pppppppuVar2 = in_CX;
      in_CX = (undefined4 *******)((int)in_CX + -1);
    }
    if (((*(char *)(iVar8 + 0x55) == '\b') || (*(char *)(iVar8 + 0x55) == '\x05')) ||
       ((param_2 != 0 && (*(char *)(iVar8 + 0x55) == '\x06')))) {
      pppppppuVar11 = (undefined4 *******)((int)(undefined2 *)&DAT_4125_0000 + 1);
    }
    else {
LAB_5efd_0ae9:
      pppppppuVar11 = (undefined4 *******)0x0;
    }
    return pppppppuVar11;
  case (undefined4 *******)0x5:
    _local_16 = (char *)0x50007c2d;
    thunk_FUN_5c8e_10a1();
    pppppppuVar11 = (undefined4 *******)thunk_FUN_621e_1851();
    return pppppppuVar11;
  case (undefined4 *******)0x6:
    goto code_r0x00058b83;
  case (undefined4 *******)0x7:
    do {
      uVar15 = uVar16;
      if ((*(byte *)((int)DAT_3c04_0110 * 8 +
                     *(int *)((int)DAT_451b_018e + (int)pppppppuVar11 * 0x5c + 0x24e) + 0x153b) &
          0xc) == 0) {
        uVar15 = 0x3fb5;
        _local_16 = (char *)CONCAT22(uVar16,0x5fe3);
        thunk_FUN_562a_066d();
      }
LAB_557a_0846:
      do {
        pppppppuVar14 = (undefined4 *******)((int)pppppppuVar11 + -1);
        if (pppppppuVar11 == (undefined4 *******)0x0) {
          return (undefined4 *******)0x0;
        }
        pppppppuVar11 = pppppppuVar14;
        uVar16 = uVar15;
      } while (*(int *)((int)DAT_451b_018e + (int)pppppppuVar14 * 0x5c + 0x24c) == 0);
    } while( true );
  case (undefined4 *******)0x8:
    do {
      pppppppuVar14 = pppppppuVar11;
      if (((uint)pppppppuVar2 >> 2 & 3) != 0) {
        _local_16 = (char *)CONCAT22(0x5d70,local_16);
        iVar8 = FUN_557a_0a6e();
        if (iVar8 != 0) {
          pbVar1 = (byte *)((int)pppppppuVar11 + (int)DAT_3c04_0110 * 8 + 0x153b);
          *pbVar1 = *pbVar1 & 0xf3;
        }
      }
      do {
        pppppppuVar11 = (undefined4 *******)((int)pppppppuVar14 + -1);
        if (pppppppuVar14 == (undefined4 *******)0x0) {
          iVar8 = 8;
          while (iVar13 = iVar8 + -1, iVar8 != 0) {
            iVar8 = iVar13;
            if (((*(int *)(iVar13 * 2 + 0x137) != 0) && (*(int *)(iVar13 * 2 + 0xd0) != 1)) &&
               ((*(byte *)((int)DAT_3c04_0110 * 8 + iVar13 + 0x153b) & 3) == 2)) {
              iVar12 = 1;
            }
          }
          if (iVar12 != 0) {
            iVar12 = 8;
            while (iVar8 = iVar12 + -1, iVar12 != 0) {
              iVar12 = iVar8;
              if (((*(int *)(iVar8 * 2 + 0x137) != 0) && (*(int *)(iVar8 * 2 + 0xd0) == 1)) &&
                 (*(int *)(iVar8 * 2 + 0x40f2) != 0)) {
                pbVar1 = (byte *)((int)DAT_3c04_0110 * 8 + iVar8 + 0x153b);
                *pbVar1 = *pbVar1 & 0xf3;
              }
            }
          }
          if (DAT_3c04_0116 != 0) {
            iVar12 = 8;
            while (iVar12 != 0) {
              local_40[iVar12 + 2] = 0;
              iVar12 = iVar12 + -1;
            }
            iVar12 = 8;
            while (iVar8 = iVar12, iVar12 = iVar8 + -1, iVar8 != 0) {
              if ((*(int *)(iVar12 * 2 + 0x137) != 0) && (*(int *)(iVar12 * 2 + 0xd0) != 0)) {
                iVar13 = 8;
                while (iVar5 = iVar13 + -1, iVar13 != 0) {
                  iVar13 = iVar5;
                  if (((*(int *)(iVar5 * 2 + 0x137) != 0) && (*(int *)(iVar5 * 2 + 0xd0) != 1)) &&
                     ((*(byte *)(iVar12 * 8 + iVar5 + 0x153b) & 3) == 2)) {
                    local_40[iVar8 + 2] = 1;
                  }
                }
              }
            }
            iVar12 = 8;
            while (iVar8 = iVar12, iVar12 = iVar8 + -1, iVar8 != 0) {
              if (((*(int *)(iVar12 * 2 + 0x137) != 0) && (*(int *)(iVar12 * 2 + 0xd0) != 0)) &&
                 ((local_40[(int)((int)DAT_3c04_0110 + 3)] != 0 || (local_40[iVar8 + 2] != 0)))) {
                pbVar1 = (byte *)((int)DAT_3c04_0110 * 8 + iVar12 + 0x153b);
                *pbVar1 = *pbVar1 & 0xf3;
              }
            }
          }
          iVar12 = 8;
          while (iVar8 = iVar12 + -1, iVar12 != 0) {
            iVar12 = iVar8;
            if (*(int *)(iVar8 * 2 + 0x40b0) == 0) {
              pbVar1 = (byte *)((int)DAT_3c04_0110 * 8 + iVar8 + 0x153b);
              *pbVar1 = *pbVar1 & 0xf3;
            }
          }
          pppppppuVar11 = (undefined4 *******)s_Borland_C_____Copyright_1991_Bor_4125_0004;
          uVar15 = uVar16;
          goto LAB_557a_0846;
        }
        pppppppuVar14 = pppppppuVar11;
      } while (((*(int *)((int)pppppppuVar11 * 2 + 0x137) == 0) ||
               (*(int *)((int)pppppppuVar11 * 2 + 0xd0) == 0)) || (DAT_3c04_0110 == pppppppuVar11));
      pppppppuVar2 = (undefined4 *******)
                     CONCAT11(0x3c,*(char *)((int)pppppppuVar11 + (int)DAT_3c04_0110 * 8 + 0x153b));
    } while( true );
  case (undefined4 *******)0x9:
    if (pppppppuVar11 ==
        (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 2)) {
      uVar15 = 0x1c;
      goto LAB_54e4_07c6;
    }
    if ((pppppppuVar11 !=
         (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4)) ||
       (_DAT_451b_027d == 0)) {
      if (pppppppuVar11 ==
          (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 3)) {
        uVar15 = 0x20;
        goto LAB_54e4_07c6;
      }
      if (pppppppuVar11 ==
          (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 9)) {
        uVar15 = 0x45;
        goto LAB_54e4_07c6;
      }
      if (pppppppuVar11 ==
          (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0x13)) {
        uVar15 = 0x46;
        goto LAB_54e4_07c6;
      }
    }
    uVar15 = 0x19;
LAB_54e4_07c6:
    _local_16 = (char *)0x50005617;
    FUN_1000_1e79();
    _local_16 = (char *)CONCAT22(uVar15,0x1000);
    uStack_18 = (undefined4 *******)0x561d;
    pppppppuVar11 = (undefined4 *******)FUN_1997_0129();
    return pppppppuVar11;
  case (undefined4 *******)0xa:
    s_Cannot_allocate_saveBM_4125_3684[7] = '\0';
    do {
      if ((undefined4 *******)(int)*(char *)((int)pppppppuVar11 * 0x41 + 0x1592) == DAT_3c04_0110) {
        bVar17 = false;
        iVar12 = 0;
        while( true ) {
          uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
          if (*(int *)(iVar12 * 2 + 0x932) == -1) break;
          iVar8 = iVar12 + 1;
          iVar13 = iVar12 * 2;
          iVar12 = iVar8;
          if ((uint)*(byte *)((int)pppppppuVar11 + (int)DAT_451b_018e + 0x56) ==
              *(uint *)(iVar13 + 0x932)) {
            bVar17 = true;
          }
        }
        if ((bVar17) && (3 < *(byte *)((int)pppppppuVar11 + (int)DAT_451b_018e + 0x182))) {
          _local_16 = (char *)CONCAT22(0xecf4,local_16);
          FUN_5e7c_053f();
        }
      }
      bVar17 = pppppppuVar11 != (undefined4 *******)0x0;
      pppppppuVar11 = (undefined4 *******)((int)pppppppuVar11 + -1);
    } while (bVar17);
    return (undefined4 *******)0x0;
  case (undefined4 *******)0xb:
    for (iVar12 = 0; iVar12 < 6; iVar12 = iVar12 + 1) {
      if (((byte)(&stack0xffee)[iVar12] != 0xff) &&
         ((undefined4 *******)(int)*(char *)((uint)(byte)(&stack0xffee)[iVar12] * 0x41 + 0x1592) ==
          unaff_SI)) {
        if (*(byte *)((int)&uStack_18 + iVar12) < 10) {
          local_6 = local_6 + 1;
        }
        if (*(byte *)((int)&uStack_18 + iVar12) < 0x14) {
          local_6 = local_6 + 1;
        }
        if (*(byte *)((int)&uStack_18 + iVar12) < 0x1e) {
          local_6 = local_6 + 1;
        }
        if (*(byte *)((int)&uStack_18 + iVar12) < 0x32) {
          local_6 = local_6 + 1;
        }
      }
    }
    if ((iStack_4 == 0) && (local_6 == 0)) {
      local_8 = (undefined4 *******)((int)(undefined2 *)&DAT_4125_0000 + 1);
    }
    iVar12 = param_2;
    if (iStack_4 <= local_6) {
      iVar12 = -1;
    }
    bVar17 = false;
    for (iVar13 = 0; iVar13 < 6; iVar13 = iVar13 + 1) {
      if (*(int *)(iVar8 + iVar13 * 2 + 0x292) == iVar12) {
        bVar17 = true;
        break;
      }
    }
    if (!bVar17) {
      for (iVar13 = 0; iVar13 < 6; iVar13 = iVar13 + 1) {
        if (*(int *)(iVar8 + iVar13 * 2 + 0x292) == -1) {
          *(int *)(iVar8 + iVar13 * 2 + 0x292) = iVar12;
          break;
        }
      }
    }
    if (local_8 == (undefined4 *******)0x0) {
      uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      *(int *)((int)DAT_451b_018e + 0x250) = iVar12;
      *(undefined1 *)((int)DAT_451b_018e + param_2 + 0x56) = 7;
      FUN_562a_16fd();
    }
    else {
      FUN_562a_066d();
    }
    return (undefined4 *******)(uint)(local_8 == (undefined4 *******)0x0);
  }
  if ((*(byte *)((int)pppppppuVar11 + iVar8 + 0x11e) & 1) == 0) {
    local_60[*(char *)((int)pppppppuVar11 * 0x41 + 0x1592)] =
         local_60[*(char *)((int)pppppppuVar11 * 0x41 + 0x1592)] + 1;
  }
  if ((undefined4 *******)(int)*(char *)((int)pppppppuVar11 * 0x41 + 0x1592) != DAT_3c04_0110) {
    pppppppuVar11 = (undefined4 *******)FUN_4fe5_01b4();
    return pppppppuVar11;
  }
  if (*(char *)((int)pppppppuVar11 * 0x41 + 0x15ac) != '\x0f') {
    local_40[*(byte *)((int)pppppppuVar11 * 0x41 + 0x15ac)] =
         local_40[*(byte *)((int)pppppppuVar11 * 0x41 + 0x15ac)] + 1;
  }
  _local_16 = (char *)(ZEXT24(&local_16) << 0x10);
  iStack_1a = 0x5000;
  appppppuStack_1e[1] = (undefined4 ******)0xff94;
  uStack_18 = pppppppuVar11;
  thunk_FUN_5d9f_0656();
  iVar12 = 6;
  while (iVar8 = iVar12 + -1, iVar12 != 0) {
    uVar3 = (uint)*(byte *)((int)&uStack_18 + iVar12 + 1);
    iVar12 = iVar8;
    if (((uVar3 != 0xff) &&
        ((undefined4 *******)(int)*(char *)(uVar3 * 0x41 + 0x1592) != DAT_3c04_0110)) &&
       ((undefined4 *******)(uint)*(byte *)(uVar3 * 0x41 + 0x15ac) == DAT_3c04_0110)) {
      aiStack_50[*(char *)((int)pppppppuVar11 * 0x41 + 0x1592)] =
           aiStack_50[*(char *)((int)pppppppuVar11 * 0x41 + 0x1592)] + 1;
    }
  }
  if (pppppppuVar11 == (undefined4 *******)0x0) {
    local_8 = (undefined4 *******)0x0;
    uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar8 = (int)DAT_451b_018e;
    iVar12 = *(int *)(iVar8 + 0x24a);
    while (iVar13 = iVar12 + -1, iVar12 != 0) {
      iVar12 = iVar13;
      if (*(int *)(iVar8 + iVar13 * 0x5c + 0x24c) != 0) {
        aiStack_b0[*(int *)(iVar8 + iVar13 * 0x5c + 0x24e)] =
             aiStack_b0[*(int *)(iVar8 + iVar13 * 0x5c + 0x24e)] + 1;
        local_8 = (undefined4 *******)((int)local_8 + 1);
      }
    }
    if ((*(char *)(unaff_SS * 0x41 + 0x1592) != '\x0f') &&
       ((undefined4 *******)(int)*(char *)(unaff_SS * 0x41 + 0x1592) != DAT_3c04_0110)) {
      aiStack_c0[*(char *)(unaff_SS * 0x41 + 0x1592)] =
           aiStack_c0[*(char *)(unaff_SS * 0x41 + 0x1592)] + 0x14;
    }
    local_a = 0;
    pppppppuVar11 = (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
    iVar12 = unaff_SS;
    while (pppppppuVar14 = (undefined4 *******)((int)pppppppuVar11 + -1),
          pppppppuVar11 != (undefined4 *******)0x0) {
      pppppppuVar11 = pppppppuVar14;
      if (aiStack_30[(int)pppppppuVar14] != 0) {
        if (DAT_3c04_0110 != pppppppuVar14) {
          local_a = local_a + 1;
        }
        iVar12 = *(int *)((int)pppppppuVar14 * 0x14 + 0x195);
        _local_16 = (char *)CONCAT22(0xed,local_16);
        appppppuStack_1e[0] = (undefined4 ******)thunk_FUN_824f_044a();
        if ((undefined4 *******)(int)*(char *)((int)appppppuStack_1e[0] * 0x41 + 0x1592) ==
            DAT_3c04_0110) {
          aiStack_90[(int)pppppppuVar14] = 1;
        }
      }
    }
    iVar8 = 8;
    do {
      iVar13 = iVar8 + -1;
      if (iVar8 == 0) {
        bVar17 = false;
        pppppppuVar11 =
             (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
        while (pppppppuVar14 = (undefined4 *******)((int)pppppppuVar11 + -1),
              pppppppuVar11 != (undefined4 *******)0x0) {
          pppppppuVar11 = pppppppuVar14;
          if (((*(int *)((int)pppppppuVar14 * 2 + 0x137) != 0) && (DAT_3c04_0110 != pppppppuVar14))
             && ((*(byte *)((int)pppppppuVar14 + (int)DAT_3c04_0110 * 8 + 0x153b) & 0xc) == 8)) {
            bVar17 = true;
          }
        }
        if ((DAT_3c04_0116 != 0) && (*(int *)((int)DAT_3c04_0110 * 2 + 0xd0) != 0)) {
          iVar8 = 8;
          while (iVar8 != 0) {
            aiStack_d0[iVar8 + -1] = 0;
            iVar8 = iVar8 + -1;
          }
          iVar8 = 8;
          while (iVar13 = iVar8 + -1, iVar8 != 0) {
            iVar8 = iVar13;
            if ((*(int *)(iVar13 * 2 + 0x137) != 0) && (*(int *)(iVar13 * 2 + 0xd0) != 0)) {
              iVar5 = 8;
              while (iVar7 = iVar5 + -1, iVar5 != 0) {
                iVar5 = iVar7;
                if (((*(int *)(iVar7 * 2 + 0x137) != 0) && (*(int *)(iVar7 * 2 + 0xd0) != 1)) &&
                   ((*(byte *)(iVar13 * 8 + iVar7 + 0x153b) & 3) == 2)) {
                  aiStack_d0[iVar13] = 1;
                }
              }
            }
          }
          iVar8 = 8;
          while (iVar13 = iVar8 + -1, iVar8 != 0) {
            iVar8 = iVar13;
            if (((*(int *)(iVar13 * 2 + 0x137) != 0) && (*(int *)(iVar13 * 2 + 0xd0) != 0)) &&
               ((aiStack_d0[(int)DAT_3c04_0110] != 0 || (aiStack_d0[iVar13] != 0)))) {
              aiStack_c0[iVar13] = 0;
            }
          }
        }
        iVar8 = 8;
        while( true ) {
          iVar13 = iVar8 + -1;
          uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
          if (iVar8 == 0) break;
          iVar12 = (int)DAT_451b_018e + iVar13 * 2;
          appppppuStack_1e[0] =
               (undefined4 ******)(*(int *)(iVar12 + 0x3dc) + *(int *)(iVar12 + 0x3fc));
          if (DAT_3c04_0128 == 0) {
            iStack_20 = 8;
          }
          else {
            iStack_20 = 4;
          }
          iVar12 = thunk_FUN_557a_0a6e();
          if (iVar12 != 0) {
            aiStack_c0[iVar13] = 0;
          }
          if ((bVar17) && ((*(byte *)((int)DAT_3c04_0110 * 8 + iVar13 + 0x153b) & 0xc) == 0)) {
            aiStack_c0[iVar13] = 0;
          }
          if ((local_8 == (undefined4 *******)0x0) && (local_60[iVar13] == 0)) {
            aiStack_c0[iVar13] = 0;
          }
          iVar12 = 0x3fb1;
          iVar8 = thunk_FUN_8027_225b();
          if ((iVar8 < iStack_20) && (appppppuStack_1e[0] == (undefined4 ******)0x0)) {
            aiStack_c0[iVar13] = 0;
          }
          iVar8 = iVar13;
          if ((1 < local_a) && (aiStack_30[iVar13] / 4 < aiStack_b0[iVar13])) {
            aiStack_c0[iVar13] = 0;
          }
        }
        aiStack_c0[(int)DAT_3c04_0110] = 0;
        iVar8 = 0;
        pppppppuVar11 =
             (undefined4 *******)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
        while (pppppppuVar14 = (undefined4 *******)((int)pppppppuVar11 + -1),
              pppppppuVar11 != (undefined4 *******)0x0) {
          pppppppuVar11 = pppppppuVar14;
          if ((aiStack_30[(int)pppppppuVar14] != 0) && (iVar8 < aiStack_c0[(int)pppppppuVar14])) {
            iVar8 = aiStack_c0[(int)pppppppuVar14];
            unaff_SI = pppppppuVar14;
          }
        }
        if ((*(char *)(iVar12 * 0x41 + 0x1592) != '\x0f') &&
           ((undefined4 *******)(int)*(char *)(iVar12 * 0x41 + 0x1592) != DAT_3c04_0110)) {
          bVar17 = false;
          iVar8 = *(int *)((int)DAT_451b_018e + 0x24a);
          while (iVar13 = iVar8 + -1, iVar8 != 0) {
            iVar8 = iVar13;
            if ((int)*(char *)(iVar12 * 0x41 + 0x1592) == aiStack_b0[iVar13]) {
              bVar17 = true;
            }
          }
          if (!bVar17) {
            unaff_SI = (undefined4 *******)(int)*(char *)(iVar12 * 0x41 + 0x1592);
          }
        }
        if ((unaff_SI != (undefined4 *******)0xffff) && (local_60[(int)unaff_SI] == 0)) {
          unaff_SI = (undefined4 *******)0xffff;
        }
        return unaff_SI;
      }
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + aiStack_70[iVar13];
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + aiStack_90[iVar13] * 0xf;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + local_40[iVar13] * 4;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + aiStack_50[iVar13] * 6;
      uVar15 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      iVar12 = (int)DAT_451b_018e;
      iVar8 = iVar12 + iVar13 * 2;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x3bc) * 4;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x3cc);
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x3dc);
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x3ec) * 2;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x3fc) * 2;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + *(int *)(iVar8 + 0x40c) * 2;
      if (*(int *)((int)DAT_3c04_0110 * 2 + 0xd0) == 0) {
        piVar10 = aiStack_c0 + iVar13;
        iVar12 = *(int *)(iVar12 + 0x18);
LAB_5efd_12f0:
        *piVar10 = *piVar10 + iVar12;
      }
      else {
        if (*(int *)((int)DAT_3c04_0110 * 2 + 0xc0) == 2) {
          piVar10 = aiStack_c0 + iVar13;
          iVar12 = *(int *)(iVar12 + 0x1e);
          goto LAB_5efd_12f0;
        }
        if (*(int *)((int)DAT_3c04_0110 * 2 + 0xc0) == 1) {
          piVar10 = aiStack_c0 + iVar13;
          iVar12 = *(int *)(iVar12 + 0x1a);
          goto LAB_5efd_12f0;
        }
        if (*(int *)((int)DAT_3c04_0110 * 2 + 0xc0) == 0) {
          piVar10 = aiStack_c0 + iVar13;
          iVar12 = *(int *)(iVar12 + 0x1c);
          goto LAB_5efd_12f0;
        }
      }
      iVar12 = iVar13 * 2;
      uVar3 = 0x3c04 - *(int *)(iVar12 + 0x10e3);
      uVar6 = (int)uVar3 >> 0xf;
      aiStack_c0[iVar13] = aiStack_c0[iVar13] + (int)((uVar3 ^ uVar6) - uVar6) / 8;
      uVar3 = aiStack_30[(int)DAT_3c04_0110] - aiStack_30[iVar13] >> 0xf;
      aiStack_c0[iVar13] =
           aiStack_c0[iVar13] +
           (int)((aiStack_30[(int)DAT_3c04_0110] - aiStack_30[iVar13] ^ uVar3) - uVar3) / 4;
      iVar8 = iVar13;
    } while( true );
  }
  _local_16 = (char *)0x3fdbfee8;
  thunk_FUN_7875_06ae();
  _local_16 = (char *)CONCAT22(auStack_56,0x408a);
  uStack_18 = (undefined4 *******)0xfefd;
  FUN_1000_4944();
  _local_16 = (char *)0x1000ff16;
  thunk_FUN_7e8f_00bf();
  _local_16 = (char *)0x0;
  uStack_18 = (undefined4 *******)0x0;
  iStack_1a = (int)(pppppppuVar14 + -1) * 0x1e + 0xaa;
  appppppuStack_1e[1] = (undefined4 ******)0x148;
  appppppuStack_1e[0] = (undefined4 ******)0x4125;
  iStack_20 = 0x342a;
  pppppppuStack_22 = DAT_3c04_0110;
  iStack_24 = (int)*(char *)((int)DAT_451b_0504 + 99);
  uStack_26 = 0x40c1;
  uVar16 = 0x40f9;
  uStack_28 = 0xff52;
  thunk_FUN_85d0_08be();
  uVar15 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
  iVar12 = (int)DAT_451b_0504;
  if (*(char *)(iVar12 + -1) == '\0') {
    iVar8 = iVar12 + -1;
    if ('c' < *(char *)(iVar12 + 299)) {
      _local_16 = (char *)CONCAT22(DAT_3c04_0110,0x40f9);
      uVar16 = 0x4073;
      uStack_18 = (undefined4 *******)0xff8d;
      thunk_FUN_7533_0b47();
    }
  }
  else {
    if (*(char *)(iVar12 + -1) != '\x01') {
      iVar8 = iVar12 + -1;
      _local_16 = "$\x04";
      FUN_1000_4a70();
      goto code_r0x00070008;
    }
    iVar8 = iVar12 + -1;
  }
  _local_16 = (char *)CONCAT22(unaff_SS,auStack_56);
  iStack_1a = -0x5e;
  uStack_18 = (undefined4 *******)uVar16;
  FUN_1000_4944();
code_r0x00070008:
  _local_16 = "\x1ew";
  iVar12 = thunk_FUN_7e8f_00bf();
  if (DAT_4125_0e52 <= (int)pppppppuVar11) {
    pppppppuVar11 = (undefined4 *******)FUN_7f3a_0a33();
    return pppppppuVar11;
  }
  *(int *)(iVar8 + -1) = *(int *)(iVar8 + -1) + iVar12;
  (&stack0x066c)[(int)pppppppuVar11] = (&stack0x066c)[(int)pppppppuVar11] + (char)iVar8;
  return (undefined4 *******)*(undefined4 ********)pppppppuVar11;
}

