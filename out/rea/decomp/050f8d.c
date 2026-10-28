
void __cdecl16far FUN_4fe5_113d(void)

{
  undefined4 uVar1;
  bool bVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined2 in_DX;
  int *piVar9;
  int *piVar10;
  int iVar11;
  undefined2 uVar12;
  int local_14;
  undefined4 local_6;
  
  local_14 = 0;
  iVar3 = thunk_FUN_7e8f_02bf(1,0x1e,0x28);
  piVar4 = (int *)FUN_1d28_01d5(iVar3 * 0x68 + 2);
  local_6 = (int *)CONCAT22(in_DX,piVar4);
  piVar9 = piVar4 + 1;
  *local_6 = iVar3;
  iVar11 = 0;
  piVar10 = piVar9;
  do {
    if (iVar3 <= iVar11) {
      uVar12 = thunk_FUN_7e8f_0505(0x21,0,9);
      iVar11 = FUN_170b_0006(uVar12,piVar10);
      if (-1 < iVar11) {
        FUN_170b_004e(iVar11,piVar4,in_DX,iVar3 * 0x68 + 2);
        FUN_170b_003a(iVar11);
      }
      FUN_1d28_050d(piVar4,in_DX);
      return;
    }
    bVar2 = false;
    do {
      iVar5 = thunk_FUN_7e8f_02bf(1,0x70,0xffff);
      iVar6 = thunk_FUN_7e8f_02bf(1,0x9c,0xffff);
      if ((((*(char *)(*(byte *)(iVar6 * 0xe0 + iVar5 * 2) + 0x710) == '\a') &&
           (iVar7 = thunk_FUN_4c45_11f5(iVar5,iVar6,10), iVar7 == 0)) &&
          (iVar7 = thunk_FUN_4c45_11f5(iVar5,iVar6,9), iVar7 == 0)) &&
         ((*(byte *)(iVar6 * 0x70 + iVar5) & 0x1f) == 0)) {
        bVar2 = true;
      }
    } while (!bVar2);
    *(undefined1 *)(iVar6 * 0xe0 + iVar5 * 2) = 0;
    piVar9[iVar11 * 0x34] = iVar5;
    piVar9[iVar11 * 0x34 + 1] = iVar6;
    iVar7 = thunk_FUN_7e8f_02bf(1,10,0);
    if (iVar7 < 4) {
      uVar12 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      if (*(int *)((int)DAT_451b_002a + 0x18b0) <= local_14) goto LAB_4fe5_12ea;
      FUN_1000_4a70(piVar9 + iVar11 * 0x34 + 2,in_DX,(int)DAT_451b_002a + local_14 * 0x3c + 0x18b2,
                    uVar12);
      piVar10 = piVar9 + iVar11 * 0x34 + 0x1b;
      FUN_1000_4a70(piVar10,in_DX,(int)DAT_451b_002a + local_14 * 0x3c + 0x18d0,DAT_451b_002a._2_2_)
      ;
      local_14 = local_14 + 1;
    }
    else {
LAB_4fe5_12ea:
      iVar7 = thunk_FUN_824f_04fa(iVar5,iVar6,0xe,0);
      iVar8 = FUN_1a8b_0acc(iVar5,iVar6,*(undefined2 *)(iVar7 * 0x41 + 0x157d),
                            *(undefined2 *)(iVar7 * 0x41 + 0x157f));
      iVar5 = thunk_FUN_824f_0b51(iVar5,iVar6,*(undefined2 *)(iVar7 * 0x41 + 0x157d),
                                  *(undefined2 *)(iVar7 * 0x41 + 0x157f));
      FUN_1000_4944(piVar9 + iVar11 * 0x34 + 2,in_DX,(int)DAT_451b_002a + 0x1888,DAT_451b_002a._2_2_
                    ,iVar7 * 0x41 + 0x1581,0x3c04);
      uVar1 = *(undefined4 *)(iVar5 * 4 + 0x2b7c);
      piVar10 = piVar9 + iVar11 * 0x34 + 0x1b;
      FUN_1000_4944(piVar10,in_DX,(int)DAT_451b_002a + 0x189c,DAT_451b_002a._2_2_,iVar8 << 1,
                    (int)uVar1,(int)((ulong)uVar1 >> 0x10));
    }
    iVar11 = iVar11 + 1;
  } while( true );
}

