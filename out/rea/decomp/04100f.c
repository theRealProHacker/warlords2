
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_85d0_0d39(void)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  byte *pbVar4;
  int iVar5;
  undefined2 in_DX;
  int iVar6;
  byte *pbStack_8;
  
  pbVar4 = (byte *)FUN_1d28_069a(DAT_4125_1270);
  _DAT_4125_126c = (byte *)CONCAT22(in_DX,pbVar4);
  pbStack_8 = _DAT_4125_126c;
  bVar3 = (byte)DAT_3c04_0110 & 0x1f;
  for (iVar6 = 0; iVar6 < 0x9c; iVar6 = iVar6 + 1) {
    for (iVar5 = 0; pbVar1 = pbStack_8, iVar5 < 0x70; iVar5 = iVar5 + 1) {
      pbStack_8 = (byte *)CONCAT22(pbStack_8._2_2_,(byte *)pbStack_8 + 1);
      bVar2 = *pbVar1;
      pbVar4 = (byte *)(iVar6 * 0x70 + iVar5);
      pbVar1 = pbVar4;
      *pbVar1 = *pbVar1 & 0xdf;
      pbVar1 = pbVar4;
      *pbVar1 = *pbVar1 | ((1 << bVar3 & (uint)bVar2) != 0) << 5;
    }
  }
  FUN_1d28_07a9(DAT_4125_1270);
  return;
}

