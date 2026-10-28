
void __cdecl16far FUN_606a_0fda(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  bool bVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  uint uVar13;
  undefined2 uVar14;
  int local_10;
  uint local_e;
  int local_c;
  uint local_a;
  
  uVar14 = (undefined2)((ulong)param_2 >> 0x10);
  iVar12 = (int)param_2;
  iVar1 = *(int *)(iVar12 + param_1 * 2);
  local_a = 0xffff;
  local_c = 100;
  local_e = 0xffff;
  local_10 = 100;
  if ((*(byte *)(iVar1 * 0x16 + -0x7772) & 0xf) == 1) {
    iVar7 = 5;
  }
  else {
    iVar7 = 0x19;
  }
  uVar13 = 0;
  do {
    if (DAT_3c04_080f <= (int)uVar13) {
      *(uint *)(iVar12 + 0x30) = local_e;
      *(int *)(iVar12 + 0x32) = local_10;
      *(uint *)(iVar12 + 0x34) = local_a;
      *(int *)(iVar12 + 0x36) = local_c;
      return;
    }
    uVar2 = *(undefined2 *)(uVar13 * 0x1f + 0x811);
    uVar3 = *(undefined2 *)(uVar13 * 0x1f + 0x813);
    bVar4 = true;
    iVar8 = FUN_606a_1637(uVar13,iVar1);
    if (iVar8 != 0) {
      iVar8 = FUN_1a8b_0acc(uVar2,uVar3,*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                            *(undefined2 *)(iVar1 * 0x16 + -0x777e));
      if (*(char *)(uVar13 * 0x1f + 0x829) == '\x01') {
        if ((((DAT_3c04_011e == 0) ||
             (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) ||
            ((iVar7 <= iVar8 || (iVar5 = iVar8, uVar6 = uVar13, local_10 <= iVar8)))) &&
           (uVar9 = FUN_606a_063c(uVar13), iVar5 = local_10, uVar6 = local_e,
           (*(uint *)(iVar1 * 0x16 + -0x7774) & uVar9) != 0)) goto LAB_606a_11c5;
      }
      else {
        iVar10 = 6;
        while (iVar11 = iVar10 + -1, iVar5 = local_10, uVar6 = local_e, iVar10 != 0) {
          iVar10 = iVar11;
          if ((((iVar11 != param_1) && (*(int *)(iVar12 + iVar11 * 2) != -1)) &&
              ((*(byte *)(*(int *)(iVar12 + iVar11 * 2) * 0x16 + -0x7772) & 0xf) == 3)) &&
             (*(byte *)(*(int *)(iVar12 + iVar11 * 2) * 0x16 + -0x7771) >> 1 == uVar13)) {
            bVar4 = false;
          }
        }
      }
      local_e = uVar6;
      local_10 = iVar5;
      if ((bVar4) && (iVar8 <= iVar7)) {
        if (iVar8 < local_c) {
          local_c = iVar8;
          local_a = uVar13;
        }
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x9c6,0x4125,uVar13,iVar8,iVar7,local_a);
        thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,
                            *(undefined2 *)(uVar13 * 0x1f + 0x811),
                            *(undefined2 *)(uVar13 * 0x1f + 0x813));
      }
    }
LAB_606a_11c5:
    uVar13 = uVar13 + 1;
  } while( true );
}

