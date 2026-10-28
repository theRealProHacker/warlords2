
int __cdecl16far FUN_1555_000a(undefined2 *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  int *piVar5;
  int iVar6;
  undefined2 uVar7;
  int local_4;
  
  iVar6 = 0;
  uVar7 = (undefined2)((ulong)param_1 >> 0x10);
  puVar4 = (undefined2 *)param_1;
  iVar1 = FUN_1a8b_0acc(puVar4[2],puVar4[3],*param_1,puVar4[1]);
  if (((((int)puVar4[2] < 0) || ((int)puVar4[3] < 0)) || (0x6f < (int)puVar4[2])) ||
     (0x9b < (int)puVar4[3])) {
    return 0;
  }
  if (DAT_4125_00de == 0) {
    FUN_1555_02f2();
  }
  iVar2 = 200;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    *(undefined1 *)((int)*(undefined4 *)(puVar4 + 6) + iVar3) = 0xff;
    iVar2 = iVar3;
  }
  if ((puVar4[4] & 0x10) == 0) {
    iVar2 = FUN_1555_1508(puVar4,uVar7,0);
    if (iVar2 != 0) {
      return 1;
    }
    if ((0xe < iVar1) && (iVar2 = FUN_1555_1508(puVar4,uVar7,1), iVar2 != 0)) {
      return 1;
    }
    if ((iVar1 == 1) && (iVar2 = FUN_1555_020e(puVar4,uVar7), iVar2 != 0)) {
      return 1;
    }
  }
  DAT_451b_001a._0_2_ = FUN_1d28_069a((int)DAT_451b_0026,(int)((ulong)DAT_451b_0026 >> 0x10));
  DAT_451b_001a._2_2_ = iVar3;
  DAT_451b_0016._0_2_ = FUN_1d28_069a((int)DAT_451b_0022,(int)((ulong)DAT_451b_0022 >> 0x10));
  DAT_451b_0016._2_2_ = iVar3;
  FUN_1555_08bf(puVar4,uVar7);
  piVar5 = (int *)((int)DAT_451b_001a + puVar4[2] * 0x138 + puVar4[3] * 2);
  if ((*piVar5 != 0x7531) ||
     ((*(byte *)((int)DAT_451b_0016 + puVar4[2] * 0x9c + puVar4[3]) & 0x80) != 0)) {
    *piVar5 = -1;
    for (iVar2 = 0; (iVar6 == 0 && (iVar2 < 2)); iVar2 = iVar2 + 1) {
      iVar6 = FUN_1555_0373(puVar4,uVar7,iVar2);
    }
    if ((iVar6 == 1) && ((puVar4[4] & 0x10) == 0)) {
      FUN_1555_117b(puVar4,uVar7);
      if (local_4 == 0xd) {
        FUN_1555_13e4(puVar4,uVar7);
      }
      if (iVar1 < 0xf) {
        FUN_1555_16f0(iVar1,puVar4,uVar7,0);
      }
      else {
        FUN_1555_16f0(iVar1,puVar4,uVar7,1);
      }
    }
  }
  FUN_1555_0bde(puVar4,uVar7,0);
  FUN_1d28_07a9((int)DAT_451b_0026,(int)((ulong)DAT_451b_0026 >> 0x10));
  FUN_1d28_07a9((int)DAT_451b_0022,(int)((ulong)DAT_451b_0022 >> 0x10));
  return iVar6;
}

