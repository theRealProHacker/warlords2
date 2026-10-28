
undefined2 __cdecl16far thunk_FUN_5c8e_023f(uint param_1,int param_2)

{
  byte *pbVar1;
  char *pcVar2;
  int *piVar3;
  uint *puVar4;
  char cVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  undefined2 uVar9;
  undefined2 unaff_SS;
  int aiStack_ae [8];
  int aiStack_9e [32];
  int aiStack_5e [32];
  int iStack_1e;
  int iStack_1c;
  int iStack_1a;
  uint uStack_18;
  int iStack_16;
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_4 = *(int *)(param_1 * 0x41 + 0x157d);
  iStack_6 = *(int *)(param_1 * 0x41 + 0x157f);
  iStack_8 = -1;
  iStack_a = 0;
  iStack_c = 0;
  iStack_e = 0;
  iStack_10 = 0;
  uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  uStack_18 = (uint)*(byte *)((int)DAT_451b_018e + param_1 + 0x182);
  iStack_1a = 0;
  if (((int)param_1 < 0) || (DAT_3c04_157b <= (int)param_1)) {
    uVar9 = 0;
  }
  else {
    iVar6 = 8;
    while (iVar6 != 0) {
      aiStack_ae[iVar6 + -1] = -1;
      iVar6 = iVar6 + -1;
    }
    pbVar1 = (byte *)((int)DAT_451b_018e + param_1 + 0x11e);
    *pbVar1 = *pbVar1 | 4;
    iVar6 = 0x20;
    while (iVar8 = iVar6 + -1, iVar6 != 0) {
      aiStack_9e[iVar8] = -1;
      aiStack_5e[iVar8] = -1;
      iVar6 = iVar8;
    }
    *(undefined1 *)((int)DAT_451b_018e + param_1 + 0x182) = 0;
    iStack_12 = 0;
    iVar6 = DAT_3c04_0181;
    while (iVar8 = iVar6 + -1, iVar6 != 0) {
      iVar6 = iVar8;
      if ((((iStack_4 <= *(int *)(iVar8 * 0x16 + -0x7780)) &&
           (*(int *)(iVar8 * 0x16 + -0x7780) <= iStack_4 + 1)) &&
          (iStack_6 <= *(int *)(iVar8 * 0x16 + -0x777e))) &&
         (*(int *)(iVar8 * 0x16 + -0x777e) <= iStack_6 + 1)) {
        if (*(char *)(iVar8 * 0x16 + -0x777b) != (char)DAT_3c04_0110) {
          FUN_5c8e_015e();
        }
        pcVar2 = (char *)((int)DAT_451b_018e + param_1 + 0x182);
        *pcVar2 = *pcVar2 + '\x01';
        if (((*(byte *)(iVar8 * 0x16 + -0x7772) & 0xf) == 1) &&
           (*(byte *)(iVar8 * 0x16 + -0x7771) >> 1 == param_1)) {
          pbVar1 = (byte *)(iVar8 * 0x16 + -0x7772);
          *pbVar1 = *pbVar1 & 0xf0;
          pbVar1 = (byte *)(iVar8 * 0x16 + -0x7771);
          *pbVar1 = *pbVar1 & 1;
        }
        if ((*(byte *)(iVar8 * 0x16 + -0x7772) & 0xf) != 0) {
          iStack_a = iStack_a + 1;
        }
        if ((*(char *)(iVar8 * 0x16 + -0x777c) == '\x1c') && (iStack_1a < 8)) {
          aiStack_ae[iStack_1a] = iVar8;
          iStack_1a = iStack_1a + 1;
          iStack_c = iStack_c + 1;
          iStack_8 = iVar8;
        }
        if (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar8 * 0x16 + -0x777c) * 6] != '\0') {
          iStack_10 = iStack_10 + 1;
        }
        if (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar8 * 0x16 + -0x777c) * 6] != '\0') {
          iStack_e = iStack_e + 1;
        }
        if (iStack_12 < 0x20) {
          aiStack_5e[iStack_12] = iVar8;
          iStack_12 = iStack_12 + 1;
        }
        else {
          FUN_5c8e_015e();
        }
      }
    }
    if (iStack_8 != -1) {
      DAT_451b_1efe._0_2_ = iStack_8 * 0x16 + -0x7780;
      DAT_451b_1efe._2_2_ = 0x2e1d;
      thunk_FUN_606a_0427(*(undefined2 *)(iStack_8 * 0x16 + -0x7780),
                          *(undefined2 *)(iStack_8 * 0x16 + -0x777e));
    }
    if (1 < iStack_c) {
      thunk_FUN_606a_17db(aiStack_ae);
    }
    uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    pbVar1 = (byte *)((int)DAT_451b_018e + param_1 + 0x11e);
    *pbVar1 = *pbVar1 & 0xcf;
    if (iStack_c != 0) {
      pbVar1 = (byte *)((int)DAT_451b_018e + param_1 + 0x11e);
      *pbVar1 = *pbVar1 | 0x20;
    }
    if (iStack_e != 0) {
      pbVar1 = (byte *)((int)DAT_451b_018e + param_1 + 0x11e);
      *pbVar1 = *pbVar1 | 0x10;
    }
    if (0x10 < iStack_12) {
      uStack_18 = 0;
      iStack_a = 0;
    }
    uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (((iStack_a < 3) || (*(char *)((int)DAT_451b_018e + param_1 + 0x56) == '\a')) &&
       ((param_2 != 0 ||
        ((((iStack_c != 0 || (*(byte *)((int)DAT_451b_018e + param_1 + 0x182) != uStack_18)) ||
          (iVar6 = thunk_FUN_7e8f_02bf(1,0xffff0006), iVar6 == 0)) ||
         ((*(byte *)(iStack_6 * 0xe0 + iStack_4 * 2 + 0xe3) & 0x10) != 0)))))) {
      uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      *(undefined1 *)((int)DAT_451b_018e + param_1 + 0x1e6) = 0;
      cVar5 = *(char *)((int)DAT_451b_018e + param_1 + 0x56);
      if (((cVar5 == '\x04') || (cVar5 == '\x05')) || (cVar5 == '\b')) {
        iStack_1c = FUN_5c8e_0a3d();
        iVar6 = (int)DAT_451b_018e;
        uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        if (iStack_12 < 2) {
          *(undefined1 *)(iVar6 + param_1 + 0x56) = 4;
        }
        else if (iStack_12 < iStack_1c) {
          *(undefined1 *)(iVar6 + param_1 + 0x56) = 5;
        }
        else {
          *(undefined1 *)(iVar6 + param_1 + 0x56) = 8;
        }
      }
      iStack_14 = FUN_5c8e_0b5c(param_1,iStack_12,aiStack_5e);
      if (((param_2 == 0) && (*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < 300)) &&
         ((int)((undefined2 *)&DAT_451b_1e6a)[DAT_3c04_0110] <
          ((undefined2 *)&DAT_451b_1e7a)[DAT_3c04_0110] * 2)) {
        uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        if ((((*(char *)((int)DAT_451b_018e + param_1 + 0x56) != '\a') &&
             (10 < *(byte *)((int)DAT_451b_018e + param_1 + 0xba))) &&
            (iStack_c + iStack_e + 4 < iStack_12)) &&
           (iVar6 = thunk_FUN_57d5_0a3e(*(undefined2 *)(param_1 * 0x41 + 0x157d),
                                        *(undefined2 *)(param_1 * 0x41 + 0x157f),0xffff), 10 < iVar6
           )) {
          for (iVar6 = iStack_c + iStack_e + 4; iVar6 < iStack_12; iVar6 = iVar6 + 1) {
            iVar8 = aiStack_9e[iVar6];
            if (iVar8 != -1) {
              aiStack_9e[iVar6] = -1;
              FUN_5c8e_015e(iVar8,0);
            }
          }
        }
      }
      if (0x18 < iStack_12) {
        for (iVar6 = 0x18; iVar6 < iStack_12; iVar6 = iVar6 + 1) {
          iVar8 = aiStack_9e[iVar6];
          if (iVar8 != -1) {
            aiStack_9e[iVar6] = -1;
            FUN_5c8e_015e(iVar8,0);
          }
        }
      }
      if (((DAT_3c04_0128 == 0) || (iVar6 = thunk_FUN_8027_225b(), 2 < iVar6)) && (iStack_12 < 2)) {
        *(undefined1 *)((int)DAT_451b_018e + param_1 + 0x56) = 4;
      }
      iVar6 = 4;
      while (iVar8 = iVar6 + -1, iVar6 != 0) {
        pbVar1 = (byte *)((iStack_6 + *(int *)(iVar8 * 2 + 0x81c)) * 0xe0 +
                          (iStack_4 + *(int *)(iVar8 * 2 + 0x814)) * 2 + 1);
        *pbVar1 = *pbVar1 & 0xef;
        iVar6 = iVar8;
      }
      if (DAT_3c04_0124 != 0) {
        uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        if ((*(char *)((int)DAT_451b_018e + param_1 + 0x56) == '\v') &&
           (*(int *)((int)DAT_451b_018e + 0x24) < 5)) {
          iStack_1c = iStack_10;
          iVar6 = 2 - (iStack_12 - iStack_10);
          if (0 < iVar6) {
            iStack_1c = iStack_10 - iVar6;
          }
          if ((DAT_3c04_0128 != 0) && (iVar6 = thunk_FUN_8027_225b(), iVar6 < 3)) {
            iStack_1c = 1;
          }
          for (iVar6 = 0; iVar6 < iStack_12; iVar6 = iVar6 + 1) {
            if (((0 < iStack_1c) && (iVar8 = aiStack_9e[iVar6], iVar8 != -1)) &&
               (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar8 * 0x16 + -0x777c) * 6] != '\0')) {
              piVar3 = (int *)((int)DAT_451b_018e + 0x24);
              *piVar3 = *piVar3 + 1;
              puVar4 = (uint *)(iVar8 * 0x16 + -0x7774);
              *puVar4 = *puVar4 | 0x20;
              thunk_FUN_57d5_0e4b(iVar8,0xffff);
              aiStack_9e[iVar6] = -1;
              iStack_1c = iStack_1c + -1;
            }
          }
        }
      }
      uVar9 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if ((*(char *)((int)DAT_451b_018e + param_1 + 0x56) == '\x03') ||
         (*(char *)((int)DAT_451b_018e + param_1 + 0x56) == '\x02')) {
        uVar7 = 1;
        iStack_16 = 8;
      }
      else {
        uVar7 = (uint)(iStack_14 == 0);
        iStack_16 = iStack_14;
        if (iStack_14 == 0) {
          iStack_16 = 8;
        }
      }
      for (iVar6 = 0; iVar6 < iStack_12; iVar6 = iVar6 + 1) {
        iVar8 = aiStack_9e[iVar6];
        if (iVar8 != -1) {
          if (uVar7 == 0) {
            pcVar2 = (char *)((int)DAT_451b_018e + param_1 + 0x1e6);
            *pcVar2 = *pcVar2 + '\x01';
          }
          aiStack_9e[iVar6] = -1;
          iStack_1c = *(int *)(param_1 * 0x41 + 0x157d) + *(int *)(uVar7 * 2 + 0x814);
          iStack_1e = *(int *)(param_1 * 0x41 + 0x157f) + *(int *)(uVar7 * 2 + 0x81c);
          *(int *)(iVar8 * 0x16 + -0x7780) = iStack_1c;
          *(int *)(iVar8 * 0x16 + -0x777e) = iStack_1e;
          *(undefined2 *)(iVar8 * 0x16 + -0x776c) = 0xffff;
          *(undefined2 *)(iVar8 * 0x16 + -0x776e) = 0xffff;
          *(undefined1 *)(iVar8 * 0x16 + -0x776f) = 0;
          pbVar1 = (byte *)(iVar8 * 0x16 + -0x7772);
          *pbVar1 = *pbVar1 & 0x8f;
          *(undefined1 *)(iVar8 * 0x16 + -0x7770) = (undefined1)param_1;
          puVar4 = (uint *)(iVar8 * 0x16 + -0x7774);
          *puVar4 = *puVar4 & 0xffbf;
          pbVar1 = (byte *)(iStack_1e * 0xe0 + iStack_1c * 2 + 1);
          *pbVar1 = *pbVar1 | 0x10;
          iStack_16 = iStack_16 + -1;
          if (iStack_16 == 0) {
            uVar7 = uVar7 + 1;
            iStack_16 = 8;
          }
        }
      }
      FUN_5c8e_10a1(*(undefined2 *)(param_1 * 0x41 + 0x157d),
                    *(undefined2 *)(param_1 * 0x41 + 0x157f));
    }
    uVar9 = 1;
  }
  return uVar9;
}

