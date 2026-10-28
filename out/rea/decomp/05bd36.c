
undefined2 __cdecl16far FUN_5ab9_11a6(int *param_1)

{
  byte *pbVar1;
  undefined1 *puVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  undefined2 uVar12;
  int local_c;
  int local_8;
  int local_6;
  uint local_4;
  
  local_c = 0x28;
  local_8 = -1;
  local_6 = -1;
  local_4 = 0xffff;
  iVar5 = -1;
  iVar11 = -1;
  iVar8 = 0;
  while( true ) {
    piVar7 = (int *)param_1;
    uVar12 = (undefined2)((ulong)param_1 >> 0x10);
    if (7 < iVar8) break;
    if ((iVar11 == -1) && (*(char *)(piVar7[iVar8] * 0x16 + -0x777c) == '\x1c')) {
      iVar11 = piVar7[iVar8];
    }
    if ((iVar5 == -1) &&
       (((undefined1 *)&DAT_451b_0664)[*(char *)(piVar7[iVar8] * 0x16 + -0x777c) * 6] != '\0')) {
      iVar5 = piVar7[iVar8];
    }
    iVar8 = iVar8 + 1;
  }
  if (iVar11 != -1) {
    if (iVar5 == -1) {
      return 1;
    }
    for (iVar8 = 0; iVar8 < 8; iVar8 = iVar8 + 1) {
      piVar7[iVar8] = -1;
    }
    *param_1 = iVar11;
    piVar7[1] = iVar5;
    pbVar1 = (byte *)(iVar5 * 0x16 + -0x7772);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar11 * 0x16 + -0x7772);
    *pbVar1 = *pbVar1 & 0xf0;
    puVar2 = (undefined1 *)(iVar11 * 0x16 + -0x7772);
    *puVar2 = *puVar2;
    pbVar1 = (byte *)(iVar5 * 0x16 + -0x7771);
    *pbVar1 = *pbVar1 & 1;
    pbVar1 = (byte *)(iVar11 * 0x16 + -0x7771);
    *pbVar1 = *pbVar1 & 1;
    puVar2 = (undefined1 *)(iVar11 * 0x16 + -0x7771);
    *puVar2 = *puVar2;
    uVar9 = DAT_3c04_080f;
LAB_5ab9_1463:
    uVar10 = uVar9 - 1;
    iVar5 = DAT_3c04_157b;
    if (uVar9 != 0) {
      bVar3 = false;
      iVar5 = *(int *)(uVar10 * 0x1f + 0x811);
      iVar8 = *(int *)(uVar10 * 0x1f + 0x813);
      iVar4 = DAT_3c04_0181;
      do {
        iVar6 = iVar4 + -1;
        if (iVar4 == 0) goto LAB_5ab9_1395;
        iVar4 = iVar6;
      } while ((((*(char *)(iVar6 * 0x16 + -0x777b) != (char)DAT_3c04_0110) || (iVar11 == iVar6)) ||
               (*(char *)(iVar6 * 0x16 + -0x777c) != '\x1c')) ||
              (((*(byte *)(iVar6 * 0x16 + -0x7772) & 0xf) != 3 ||
               (*(byte *)(iVar6 * 0x16 + -0x7771) >> 1 != uVar10))));
      bVar3 = true;
LAB_5ab9_1395:
      uVar9 = uVar10;
      if (((!bVar3) && (iVar4 = thunk_FUN_621e_16ae(iVar5,iVar8), iVar4 != 0)) &&
         ((*(char *)(*(byte *)(iVar8 * 0xe0 + iVar5 * 2) + 0x710) == '\v' &&
          ((*(char *)(uVar10 * 0x1f + 0x829) != '\x01' &&
           ((*(byte *)(iVar8 * 0xe0 + iVar5 * 2 + 1) & 0x40) == 0)))))) {
        iVar5 = FUN_1a8b_0acc();
        if ((iVar5 < 0xf) && (local_6 < 0xd7 - iVar5)) {
          local_6 = 0xd7;
        }
        else {
          if ((0x27 < iVar5) || (0x5a - iVar5 <= local_6)) goto LAB_5ab9_1463;
          local_6 = 0x5a;
        }
        local_6 = local_6 - iVar5;
        local_4 = uVar10;
      }
      goto LAB_5ab9_1463;
    }
LAB_5ab9_1511:
    iVar8 = iVar5 + -1;
    if (iVar5 != 0) {
      iVar5 = iVar8;
      if (*(char *)(iVar8 * 0x41 + 0x1592) == (char)DAT_3c04_0110) {
        iVar4 = FUN_1a8b_0acc();
        if (*(char *)((int)DAT_451b_018e + iVar8 + 0x56) == '\a') {
          iVar4 = iVar4 + -0x50;
        }
        if ((iVar4 < 0xf) && (local_6 < 0x73 - iVar4)) {
          iVar6 = 0x73;
        }
        else if ((0x27 < iVar4) || (iVar6 = local_c, 0x28 - iVar4 <= local_6)) goto LAB_5ab9_1511;
        local_6 = iVar6 - iVar4;
        local_8 = iVar8;
      }
      goto LAB_5ab9_1511;
    }
    if (local_4 != 0xffff) {
      thunk_FUN_621e_0ae7(param_1,3,local_4,0x100);
      uVar12 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
      FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                    *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
      uVar12 = FUN_5ab9_15c3(iVar11,local_4);
      return uVar12;
    }
    if ((local_8 != -1) && (iVar11 = FUN_1a8b_0acc(), 2 < iVar11)) {
      thunk_FUN_621e_0ae7(param_1,1,local_8,0);
      uVar12 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
      FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                    *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
    }
  }
  return 0;
}

