
void __cdecl16far FUN_606a_11f8(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  bool bVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  undefined2 uVar11;
  int local_a;
  uint local_8;
  
  uVar11 = (undefined2)((ulong)param_2 >> 0x10);
  iVar8 = (int)param_2;
  iVar1 = *(int *)(iVar8 + param_1 * 2);
  local_8 = 0xffff;
  local_a = 100;
  if ((*(byte *)(iVar1 * 0x16 + -0x7772) & 0xf) == 1) {
    iVar5 = 5;
  }
  else {
    iVar5 = 0xf;
  }
  uVar9 = 0x16;
  while (uVar10 = uVar9 - 1, uVar9 != 0) {
    uVar2 = *(undefined2 *)(uVar10 * 0x1d + 0xd02);
    uVar3 = *(undefined2 *)(uVar10 * 0x1d + 0xd04);
    bVar4 = true;
    iVar6 = FUN_606a_1736(uVar10);
    uVar9 = uVar10;
    if (iVar6 != 0) {
      iVar6 = 6;
      while (iVar7 = iVar6 + -1, iVar6 != 0) {
        iVar6 = iVar7;
        if ((((iVar7 != param_1) && (*(int *)(iVar8 + iVar7 * 2) != -1)) &&
            ((*(byte *)(*(int *)(iVar8 + iVar7 * 2) * 0x16 + -0x7772) & 0xf) == 2)) &&
           (*(byte *)(*(int *)(iVar8 + iVar7 * 2) * 0x16 + -0x7771) >> 1 == uVar10)) {
          bVar4 = false;
        }
      }
      if (((bVar4) &&
          (iVar6 = FUN_1a8b_0acc(uVar2,uVar3,*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                                 *(undefined2 *)(iVar1 * 0x16 + -0x777e)), iVar6 <= iVar5)) &&
         (iVar6 < local_a)) {
        local_a = iVar6;
        local_8 = uVar10;
      }
    }
  }
  *(uint *)(iVar8 + 0x3c) = local_8;
  *(int *)(iVar8 + 0x3e) = local_a;
  return;
}

