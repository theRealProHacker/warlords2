
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_899d_0d30(void)

{
  undefined2 uVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int local_8;
  uint local_6;
  int local_4;
  
  iVar6 = -1;
  local_6 = 0xffff;
  if (DAT_4125_2bda == 0) {
    DAT_451b_1e9e = 1;
    _DAT_451b_1ede = DAT_451b_1f02;
  }
  FUN_1b62_007d(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1],&local_8);
  FUN_1b62_09ec(local_8,0);
  local_4 = local_8;
  iVar4 = 0;
  do {
    iVar5 = local_8;
    if (local_8 <= iVar4) {
      for (; iVar5 < 8; iVar5 = iVar5 + 1) {
        ((undefined2 *)&DAT_451b_28e2)[iVar5] = 0;
        ((undefined2 *)&DAT_451b_28f2)[iVar5] = 0xffff;
        ((undefined2 *)&DAT_451b_28d2)[iVar5] = 0xffff;
        ((undefined2 *)&DAT_451b_2904)[iVar5 * 2] = 0;
        ((undefined2 *)&DAT_451b_2902)[iVar5 * 2] = 0;
      }
      DAT_4125_30f6 = local_8;
      FUN_899d_17e7(0);
      return;
    }
    bVar2 = false;
    for (iVar5 = 0; iVar5 < DAT_451b_1e9e; iVar5 = iVar5 + 1) {
      if ((*(int *)((undefined *)&DAT_451b_1ee0 + iVar5 * 4) ==
           *(int *)((int)(undefined4 *)&DAT_451b_1ebe + iVar4 * 4 + 2)) &&
         (((undefined2 *)&DAT_451b_1ede)[iVar5 * 2] ==
          *(int *)((undefined4 *)&DAT_451b_1ebe + iVar4))) {
        bVar2 = true;
        break;
      }
    }
    uVar3 = (uint)*(byte *)((int)((undefined4 *)&DAT_451b_1ebe)[iVar4] + 0x11);
    if (((local_6 == uVar3) && (uVar3 != 0)) && (-1 < iVar6)) {
      ((undefined2 *)&DAT_451b_28d2)[iVar4] = 0xffff;
    }
    else {
      ((undefined2 *)&DAT_451b_28d2)[iVar4] = 0;
      iVar6 = iVar6 + 1;
    }
    ((undefined2 *)&DAT_451b_28f2)[iVar4] = iVar6;
    uVar1 = *(undefined2 *)((undefined4 *)&DAT_451b_1ebe + iVar4);
    ((undefined2 *)&DAT_451b_2904)[iVar4 * 2] =
         *(undefined2 *)((int)(undefined4 *)&DAT_451b_1ebe + iVar4 * 4 + 2);
    ((undefined2 *)&DAT_451b_2902)[iVar4 * 2] = uVar1;
    if (bVar2) {
      ((undefined2 *)&DAT_451b_28e2)[iVar4] = 1;
    }
    else {
      ((undefined2 *)&DAT_451b_28e2)[iVar4] = 0;
    }
    iVar4 = iVar4 + 1;
    local_6 = uVar3;
  } while( true );
}

