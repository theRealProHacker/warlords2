
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_79c4_056a(int param_1)

{
  bool bVar1;
  int *piVar2;
  undefined2 uVar3;
  uint in_DX;
  uint extraout_DX;
  uint extraout_DX_00;
  uint uVar4;
  int iVar5;
  undefined2 unaff_SS;
  undefined1 auStack_4c [2];
  int iStack_4a;
  byte bStack_48;
  undefined1 auStack_2a [2];
  int iStack_28;
  uint uStack_26;
  uint uStack_24;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  int *piStack_14;
  undefined4 uStack_10;
  uint uStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  piVar2 = (int *)FUN_1d28_069a(DAT_451b_0cec);
  uStack_10 = (int *)CONCAT22(in_DX,piVar2);
  piStack_14 = uStack_10;
  bVar1 = false;
  for (iStack_4 = 0; iStack_4 < 0x24; iStack_4 = iStack_4 + 1) {
    iStack_6 = *piStack_14;
    piVar2 = (int *)piStack_14;
    piStack_14 = (int *)CONCAT22(piStack_14._2_2_,(int *)piStack_14 + 1);
    if (iStack_6 == param_1) {
      iStack_a = *piStack_14;
      piStack_14 = (int *)CONCAT22(piStack_14._2_2_,piVar2 + 2);
      iStack_8 = *piStack_14;
      bVar1 = true;
    }
    piStack_14 = (int *)CONCAT22(piStack_14._2_2_,piVar2 + 3);
  }
  FUN_1d28_07a9(DAT_451b_0cec);
  if (!bVar1) {
    thunk_FUN_79a9_0000((char *)s_Join_data_not_found_4125_175a,0x4125);
  }
  uVar3 = FUN_1d28_069a(DAT_451b_0ce8);
  uStack_10 = (int *)CONCAT22(in_DX,uVar3);
  uStack_18 = uStack_10;
  bVar1 = false;
  iStack_4 = 0;
  while( true ) {
    if (6 < iStack_4) goto LAB_79c4_068c;
    FUN_1000_1d02(uStack_18,auStack_2a,unaff_SS);
    uStack_18 = CONCAT22(uStack_18._2_2_,(int)uStack_18 + 0xe);
    if (iStack_28 == iStack_8) break;
    for (iVar5 = 0; iVar5 < (int)uStack_24; iVar5 = iVar5 + 1) {
      uStack_18 = CONCAT22(uStack_18._2_2_,(int)uStack_18 + 0xe);
    }
    iStack_4 = iStack_4 + 1;
    in_DX = uStack_24;
  }
  uStack_c = uStack_26;
  in_DX = extraout_DX;
  for (uVar4 = 0; uVar4 < uStack_24; uVar4 = uVar4 + 1) {
    FUN_1000_1d02(uStack_18,DAT_4125_168e + uVar4 * 0xe,(int)((ulong)_DAT_4125_168e >> 0x10));
    uStack_18 = CONCAT22(uStack_18._2_2_,(int)uStack_18 + 0xe);
    in_DX = extraout_DX_00;
  }
  bVar1 = true;
  DAT_4125_1686 = uStack_24;
LAB_79c4_068c:
  FUN_1d28_07a9(DAT_451b_0ce8);
  if (!bVar1) {
    thunk_FUN_79a9_0000((char *)s_Area_data_not_found_4125_176e,0x4125);
  }
  uVar3 = FUN_1d28_069a(DAT_451b_0ce4);
  uStack_10 = (int *)CONCAT22(in_DX,uVar3);
  uStack_1c = uStack_10;
  bVar1 = false;
  iStack_4 = 0;
  while( true ) {
    if (0x23 < iStack_4) goto LAB_79c4_0744;
    FUN_1000_1d02(uStack_1c,auStack_4c,unaff_SS);
    uStack_1c = CONCAT22(uStack_1c._2_2_,(int)uStack_1c + 0x21);
    if (iStack_4a == iStack_a) break;
    for (iVar5 = 0; iVar5 < (int)(uint)bStack_48; iVar5 = iVar5 + 1) {
      uStack_1c = CONCAT22(uStack_1c._2_2_,(int)uStack_1c + 0x21);
    }
    iStack_4 = iStack_4 + 1;
  }
  for (iVar5 = 0; iVar5 < (int)(uint)bStack_48; iVar5 = iVar5 + 1) {
    FUN_1000_1d02(uStack_1c,DAT_4125_168a + iVar5 * 0x21,(int)((ulong)_DAT_4125_168a >> 0x10));
    uStack_1c = CONCAT22(uStack_1c._2_2_,(int)uStack_1c + 0x21);
  }
  DAT_4125_1688 = (uint)bStack_48;
  bVar1 = true;
LAB_79c4_0744:
  FUN_1d28_07a9(DAT_451b_0ce4);
  if (!bVar1) {
    thunk_FUN_79a9_0000((char *)s_Button_data_not_found_4125_1782,0x4125);
  }
  DAT_4125_1692 = _DAT_4125_168a;
  DAT_4125_1696 = _DAT_4125_168e;
  DAT_4125_169c = 0x4125;
  DAT_4125_169a = (undefined2 *)&DAT_4125_1688;
  DAT_4125_16a0 = 0x4125;
  DAT_4125_169e = (undefined2 *)&DAT_4125_1686;
  DAT_451b_0ce0._2_2_ = 0x4125;
  DAT_451b_0ce0._0_2_ = (undefined4 *)&DAT_4125_1692;
  FUN_18a9_0345();
  for (iStack_4 = 0; iStack_4 < 8; iStack_4 = iStack_4 + 1) {
    if ((uStack_c & 1 << ((byte)iStack_4 & 0x1f)) != 0) {
      FUN_18a9_07ed();
    }
  }
  return;
}

