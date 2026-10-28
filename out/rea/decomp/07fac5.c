
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_7f3a_0725(void)

{
  bool bVar1;
  undefined4 uVar2;
  undefined2 uVar3;
  undefined2 *puVar4;
  int iVar5;
  undefined2 uVar6;
  int iVar7;
  undefined4 in_EDX;
  undefined1 local_56 [84];
  
  thunk_FUN_54e4_0000();
  FUN_2012_01fe(0x2a0e,0x4125,0xd40100);
  uVar3 = FUN_1d28_01d5();
  DAT_451b_1e00 = CONCAT22((int)in_EDX,uVar3);
  DAT_451b_1d88._0_2_ = FUN_1d28_01d5();
  ram0x00046f3a = CONCAT22(_DAT_451b_1d8c,(int)in_EDX);
  for (iVar7 = 1; uVar2 = ram0x00046f3a, iVar7 < 0x1e; iVar7 = iVar7 + 1) {
    iVar5 = (int)DAT_451b_1d88 + iVar7 * 0x14;
    *(undefined2 *)((int)(undefined4 *)&DAT_451b_1d88 + iVar7 * 4 + 2) = (int)ram0x00046f3a;
    *(int *)((undefined4 *)&DAT_451b_1d88 + iVar7) = iVar5;
    in_EDX = uVar2;
  }
  puVar4 = (undefined2 *)FUN_1d28_01d5();
  DAT_451b_1d82 = (undefined2 *)CONCAT22((int)in_EDX,puVar4);
  iVar7 = 0;
  bVar1 = false;
  while (!bVar1) {
    iVar5 = FUN_7f3a_06c8();
    if (iVar5 == 0) {
      bVar1 = true;
      DAT_451b_1d80 = iVar7;
    }
    else {
      *(int *)((int)DAT_451b_1e00 + iVar7 * 2) = iVar7;
      FUN_1000_4a70(((undefined4 *)&DAT_451b_1d88)[iVar7],local_56);
      iVar7 = iVar7 + 1;
    }
  }
  DAT_451b_1d86 = 0;
  *DAT_451b_1d82 = 0;
  if (DAT_451b_1d80 < 2) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 1;
  }
  ((undefined2 *)DAT_451b_1d82)[1] = uVar3;
  if (DAT_451b_1d80 < 3) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 2;
  }
  ((undefined2 *)DAT_451b_1d82)[2] = uVar3;
  if (DAT_451b_1d80 < 4) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 3;
  }
  ((undefined2 *)DAT_451b_1d82)[3] = uVar3;
  if (DAT_451b_1d80 < 5) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 4;
  }
  ((undefined2 *)DAT_451b_1d82)[4] = uVar3;
  if (DAT_451b_1d80 < 6) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 5;
  }
  ((undefined2 *)DAT_451b_1d82)[5] = uVar3;
  if (DAT_451b_1d80 < 7) {
    uVar3 = 0xffff;
  }
  else {
    uVar3 = 6;
  }
  ((undefined2 *)DAT_451b_1d82)[6] = uVar3;
  while (6 < DAT_451b_1d86) {
    DAT_451b_1d86 = DAT_451b_1d86 + -1;
    for (iVar7 = 0; iVar7 < 7; iVar7 = iVar7 + 1) {
      ((undefined2 *)DAT_451b_1d82)[iVar7] = ((undefined2 *)DAT_451b_1d82)[iVar7] + 1;
    }
  }
  DAT_4125_2a49 = 0;
  uVar3 = 0x4099;
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  if ((DAT_4125_2a18 != 0) && ((DAT_4125_2a43 & 10) == 0)) {
    for (iVar7 = 0; iVar7 < (int)(uint)DAT_4125_2a42; iVar7 = iVar7 + 1) {
      uVar3 = 0x1d28;
      uVar6 = FUN_1d28_069a(((undefined4 *)&DAT_4125_2a18)[iVar7]);
      ((undefined2 *)&DAT_4125_2a2a)[iVar7 * 2] = (int)in_EDX;
      ((undefined2 *)&DAT_4125_2a28)[iVar7 * 2] = uVar6;
    }
  }
  (*DAT_451b_2a74)(uVar3,0x342a,0x4125,0x640120,0xd40100,0x2a0e,0x4125,0);
  if ((DAT_4125_2a18 != 0) && ((DAT_4125_2a43 & 10) == 0)) {
    for (iVar7 = 0; iVar7 < (int)(uint)DAT_4125_2a42; iVar7 = iVar7 + 1) {
      uVar3 = 0x1d28;
      FUN_1d28_07a9(((undefined4 *)&DAT_4125_2a18)[iVar7]);
    }
  }
  FUN_7f3a_0996(uVar3,0);
  FUN_7f3a_0a86();
  return;
}

