
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_85d0_0e68(void)

{
  byte *pbVar1;
  undefined1 uVar2;
  bool bVar3;
  byte *pbVar4;
  int iVar5;
  int iVar6;
  byte *pbStack_6;
  
  iVar5 = 0;
  for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
    if ((*(int *)(iVar6 * 2 + 0x137) != 0) && (*(int *)(iVar6 * 2 + 0xd0) == 0)) {
      iVar5 = iVar5 + 1;
    }
  }
  if ((iVar5 == 1) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0)) {
    bVar3 = true;
  }
  else {
    bVar3 = false;
  }
  pbVar4 = (byte *)FUN_1d28_069a(DAT_4125_1270);
  _DAT_4125_126c = (byte *)CONCAT22(iVar6,pbVar4);
  pbStack_6 = _DAT_4125_126c;
  for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
    for (iVar6 = 0; iVar6 < 0x70; iVar6 = iVar6 + 1) {
      if (bVar3) {
        uVar2 = *(undefined1 *)(iVar5 * 0x70 + iVar6);
        pbVar4 = (byte *)(iVar5 * 0x70 + iVar6);
        pbVar1 = pbVar4;
        *pbVar1 = *pbVar1 & 0x7f;
        pbVar1 = pbVar4;
        *pbVar1 = *pbVar1 | (char)(CONCAT31(0x29,uVar2) >> 5) << 7;
      }
      *pbStack_6 = *pbStack_6 |
                   ((byte)(CONCAT31(0x29,*(undefined1 *)(iVar5 * 0x70 + iVar6)) >> 5) & 1) <<
                   ((byte)DAT_3c04_0110 & 0x1f);
      pbStack_6 = (byte *)CONCAT22(pbStack_6._2_2_,(byte *)pbStack_6 + 1);
    }
  }
  FUN_1d28_07a9(DAT_4125_1270);
  return;
}

