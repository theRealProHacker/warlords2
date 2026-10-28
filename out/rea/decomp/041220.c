
void __cdecl16far thunk_FUN_8c81_0000(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined1 auStack_54 [80];
  int iStack_4;
  
  iVar2 = 0;
  bVar1 = true;
  iStack_4 = 0;
  DAT_3c04_0159 = *(int *)(param_1 * 2 + 0x147);
  for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
    if ((*(int *)(iVar3 * 2 + 0x137) != 0) && (*(int *)(iVar3 * 2 + 0xd0) == 0)) {
      iVar2 = iVar2 + 1;
      bVar1 = false;
    }
  }
  if ((iVar2 == 1) && (DAT_3c04_0124 != 0)) {
    DAT_4125_3254 = 1;
  }
  else {
    DAT_4125_3254 = 0;
  }
  if (bVar1) {
    DAT_3c04_0159 = 1;
  }
  if (((1 < iVar2) && (DAT_3c04_0124 != 0)) && (*(int *)(param_1 * 2 + 0x147) == 0)) {
    DAT_3c04_0159 = 0;
  }
  if (DAT_3c04_0124 != 0) {
    iStack_4 = 1;
    thunk_FUN_85d0_0d39();
    thunk_FUN_85d0_1558();
    if ((bVar1) || ((DAT_3c04_0159 != 0 && (DAT_4125_3254 == 0)))) {
      thunk_FUN_830b_2200();
    }
  }
  if ((bVar1) || ((DAT_3c04_0159 != 0 && (DAT_4125_3254 == 0)))) {
    thunk_FUN_830b_0000(0x10001,0);
  }
  FUN_1000_4944(auStack_54);
  thunk_FUN_8027_11d1();
  thunk_FUN_8027_1291();
  thunk_FUN_8027_131b();
  thunk_FUN_484d_0db3();
  thunk_FUN_824f_03f9();
  if ((int)((undefined2 *)&DAT_451b_1e8a)[param_1] < 1) {
    FUN_8c81_0952(0);
    thunk_FUN_8027_1291();
    thunk_FUN_8027_131b();
    thunk_FUN_8027_131b();
    thunk_FUN_8027_131b();
    thunk_FUN_8027_131b();
  }
  else {
    iVar2 = thunk_FUN_7533_0000();
    if (iVar2 != 0) {
      thunk_FUN_7533_0301();
    }
    thunk_FUN_7533_0579();
    FUN_8c81_0827();
    thunk_FUN_6f60_0000();
    FUN_1b62_0d85();
    FUN_8c81_05fb();
    thunk_FUN_8bc3_0000();
    thunk_FUN_824f_03f9();
    thunk_FUN_8bc3_0113();
    thunk_FUN_4974_1ded(0xffff,0,0);
    thunk_FUN_5d9f_0000();
    iVar2 = 8;
    while (iVar3 = iVar2 + -1, iVar2 != 0) {
      *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) = 0;
      ((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] = 0;
      iVar2 = iVar3;
    }
    DAT_451b_1f02 = 0;
    DAT_451b_1efe = 0;
    thunk_FUN_824f_0af3();
    if (iStack_4 != 0) {
      thunk_FUN_85d0_0e68();
    }
  }
  return;
}

