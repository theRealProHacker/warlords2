
/* WARNING: Instruction at (ram,0x000808eb) overlaps instruction at (ram,0x000808e7)
    */
/* WARNING: Type propagation algorithm not settling */

int * __cdecl16far FUN_899d_0ad9(undefined4 param_1,int *param_2)

{
  char *pcVar1;
  byte *pbVar2;
  byte bVar3;
  int *in_AX;
  int iVar4;
  int *piVar5;
  uint uVar6;
  int in_DX;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined2 unaff_DI;
  undefined2 unaff_ES;
  undefined2 uVar10;
  undefined2 unaff_SS;
  char *pcVar11;
  char *pcVar12;
  int aiStack_1c [7];
  int iStack_e;
  int iStack_c;
  undefined4 uStack_a;
  undefined4 uStack_6;
  
  if (DAT_4125_1174 != 0) {
    return in_AX;
  }
  if (DAT_4125_30f8 == 0) {
    iVar4 = ((int)param_1 + -0x10) / 0x28;
    if ((int)param_1 < 0x150) {
      if (iVar4 < DAT_4125_30f6) {
        uVar10 = (undefined2)
                 ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar4 * 2) >> 0x10);
        piVar5 = (int *)thunk_FUN_73de_0626((int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar4 * 2]
                                                          + 4),
                                            (int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar4 * 2]
                                                          + 6),
                                            (int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar4 * 2]
                                                          + 8),
                                            (int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar4 * 2]
                                                          + 0xb),
                                            (int)*(char *)(((undefined2 *)&DAT_451b_2902)[iVar4 * 2]
                                                          + 7),
                                            (int)*(char *)((int)*(undefined4 *)
                                                                 ((undefined2 *)&DAT_451b_2902 +
                                                                 iVar4 * 2) + 10),(int)param_1,
                                            param_1._2_2_);
        DAT_4125_1174 = 1;
        return piVar5;
      }
      thunk_FUN_73de_1201((int)param_1,param_1._2_2_,0);
      pcVar12 = (char *)s_Select_armies_when_present_4125_314e;
      pcVar11 = (char *)s_Select_Army_4125_3142;
    }
    else {
      thunk_FUN_73de_1201((int)param_1,param_1._2_2_,0);
      pcVar12 = (char *)s_Manipulate_all_armies_4125_3177;
      pcVar11 = (char *)s_Group_Ungroup_4125_3169;
    }
    piVar5 = (int *)thunk_FUN_73de_10e1(pcVar11,0x4125,pcVar12,CONCAT22(unaff_DI,0x4125));
    DAT_4125_1174 = 1;
    return piVar5;
  }
  iVar4 = (int)param_1;
  piVar5 = (int *)thunk_FUN_73de_1201((int)param_1,param_1._2_2_,0);
  if ((int *)s_Borland_C_____Copyright_1991_Bor_4125_0004 <= param_2) {
    DAT_4125_1174 = 1;
    return piVar5;
  }
  switch(param_2) {
  case (int *)0x0:
    piVar5 = (int *)thunk_FUN_85d0_0629(*(undefined2 *)0x17d,*(undefined2 *)0x17f);
    return piVar5;
  case (int *)0x1:
    while( true ) {
      if ((((iVar4 < 0) || ((int)piVar5 < 0)) || (0x6f < iVar4)) || (0x9b < (int)piVar5)) {
        uVar6 = 1 << ((byte)in_DX & 0x1f);
      }
      else if ((*(byte *)((int)piVar5 * 0x70 + iVar4) & 0x20) == 0) {
        uVar6 = 1 << ((byte)in_DX & 0x1f);
      }
      else {
        uVar6 = 0;
      }
      param_2 = (int *)((uint)param_2 | uVar6);
      in_DX = in_DX + 1;
      if (7 < in_DX) break;
      iVar4 = (int)param_1 + ((undefined2 *)&DAT_4125_2eda)[in_DX];
      piVar5 = (int *)(param_1._2_2_ + ((undefined2 *)&DAT_4125_2eea)[in_DX]);
    }
    return param_2;
  case (int *)0x2:
    piVar5 = (int *)((int)piVar5 +
                    (int)((char *)s__m__Mono_version__for_laptop_use_4125_2765 +
                         (0x1f - (uint)((int)param_2 < 0))));
    do {
      iVar4 = iVar4 + 1;
      if (8 < iVar4) {
        for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
          piVar5 = (int *)(iVar4 * 2);
          pcVar1 = (char *)((int)piVar5 + (int)param_1 + 4);
          pcVar1[0] = '\0';
          pcVar1[1] = '\0';
        }
        for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
          for (iVar9 = 0; iVar9 < 9; iVar9 = iVar9 + 1) {
            iVar7 = (int)param_1 + iVar4 * 0x48 + iVar9 * 8;
            uStack_6 = (undefined4 *)CONCAT22(param_1._2_2_,(undefined4 *)(iVar7 + 0x16));
            uStack_a = (undefined4 *)CONCAT22(param_1._2_2_,(undefined4 *)(iVar7 + 0x1a));
            *uStack_a = 0;
            *uStack_6 = 0;
            pbVar2 = (byte *)((int)param_1 + iVar4 * 0x48 + iVar9 * 8 + 0x16);
            *pbVar2 = *pbVar2 | 1;
            uVar6 = *(byte *)((DAT_3c04_0175 + iVar9) * 0xe0 + (DAT_3c04_0177 + iVar4) * 2 + 1) &
                    0xf;
            if (7 < uVar6) {
              uVar6 = 8;
            }
            iVar7 = aiStack_1c[uVar6];
            iVar8 = (int)param_1 + iVar4 * 0x48 + iVar9 * 8;
            pbVar2 = (byte *)(iVar8 + 0x17);
            *pbVar2 = *pbVar2 & 0x83;
            bVar3 = ((byte)iVar7 & 0x1f) << 2;
            piVar5 = (int *)(uint)bVar3;
            pbVar2 = (byte *)(iVar8 + 0x17);
            *pbVar2 = *pbVar2 | bVar3;
          }
        }
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) | 1;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xfd;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xfb;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xf7;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xef;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xdf;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0xbf;
        *(byte *)((int)param_1 + 0x29e) = *(byte *)((int)param_1 + 0x29e) & 0x7f;
        *(byte *)((int)param_1 + 0x29f) = *(byte *)((int)param_1 + 0x29f) & 0xfe;
        return piVar5;
      }
      for (iVar9 = 0; iVar9 < 0x1d; iVar9 = iVar9 + 1) {
        piVar5 = (int *)0x3c04;
        if (*(char *)(iVar4 * 0x1d + iVar9 + 0x60b) == '\0') {
          piVar5 = aiStack_1c;
          piVar5[iVar4] = iVar9;
          break;
        }
      }
    } while( true );
  }
  *(int **)param_1._2_2_ = piVar5;
  if ((int)param_2 < 0) {
    *(int *)((int)param_2 * 3) = (int)((int)piVar5 + *(int *)((int)param_2 * 3));
  }
  FUN_2372_0eab(0x10001);
  FUN_2372_0eab(0x10002);
  FUN_2372_0eab(0x10003);
  FUN_2372_0eab(0x10004);
  FUN_2372_0eab(0x10005);
  FUN_2372_0eab(0x10006);
  FUN_2372_0eab(0x10007);
  iVar4 = thunk_FUN_76ef_0e25();
  if (iVar4 == 0) {
    FUN_2372_0ef8(0x1f6);
  }
  iVar4 = thunk_FUN_76ef_0e42();
  if (iVar4 == 0) {
    FUN_2372_0ef8(0x1f8);
  }
  if ((DAT_3c04_0120 == 0) || (DAT_3c04_0130 != 0)) {
    FUN_2372_0ef8(0x1f7);
  }
  if (param_2 == (int *)0x0) {
    FUN_2372_0ef8(0x1fc);
LAB_8027_072b:
    FUN_2372_0ef8(0x207);
  }
  else if (param_1._2_2_ != (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 3)
  goto LAB_8027_072b;
  if (((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] == 0) {
    FUN_2372_0ef8(0x1fd);
  }
  if (DAT_3c04_011c == 0) {
    FUN_2372_0ef8(0x203);
  }
  if ((int)uStack_a == 0) {
    FUN_2372_0ef8(0x205);
    FUN_2372_0ef8(0x208);
  }
  if ((((param_2 == (int *)0x0) || (uStack_a._2_2_ != 0x1c)) ||
      (*(char *)(DAT_3c04_0110 * 0x1d + 0xcff) != '\x03')) ||
     ((DAT_451b_1f02._2_2_ != 0x2e1d ||
      (*(int *)(DAT_3c04_0110 * 0x1d + 0xd00) * 0x16 + -0x7780 != (int)DAT_451b_1f02)))) {
LAB_8027_0821:
    FUN_2372_0ef8(0x206);
  }
  else if ((((*(byte *)((int)uStack_6 * 0x70 + uStack_6._2_2_) & 0x40) != 0) ||
           ((param_1._2_2_ == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4 ||
            (param_1._2_2_ == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 5)))) ||
          ((param_1._2_2_ == (char *)0x0 ||
           (param_1._2_2_ == (char *)((int)(undefined2 *)&DAT_4125_0000 + 1))))) goto LAB_8027_0821;
  if ((((iStack_c != 0) && (param_2 != (int *)0x0)) && ((uStack_a._2_2_ == 0x1c || (iStack_e != 0)))
      ) && (param_1._2_2_ == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 5)) {
    if ((*(byte *)((int)uStack_6 * 0xe0 + uStack_6._2_2_ * 2 + 1) & 0x40) == 0) goto LAB_8027_087a;
  }
  FUN_2372_0ef8(0x209);
LAB_8027_087a:
  if ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < 1) {
    FUN_2372_0ef8(0x20c);
    FUN_2372_0ef8(0x20e);
    FUN_2372_0ef8(0x20f);
  }
  if (param_2 == (int *)0x0) {
    FUN_2372_0ef8(0x211);
  }
  iVar4 = FUN_8027_225b();
  if (iVar4 == 1) {
    FUN_2372_0ef8(0x212);
    FUN_2372_0ef8(0x213);
    FUN_2372_0ef8(0x214);
    FUN_2372_0ef8(0x215);
  }
  piVar5 = (int *)0x3c04;
  if (DAT_3c04_015b != 0) {
    piVar5 = (int *)FUN_2372_0ef8(0x217);
  }
  return piVar5;
}

