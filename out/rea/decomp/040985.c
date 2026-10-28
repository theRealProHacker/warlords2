
void __cdecl16far thunk_FUN_79a9_0054(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  
  uVar1 = thunk_FUN_7e8f_0505(0x18);
  iVar2 = FUN_197b_0005(0x15e0,0x4125,0x1669,0x4125,uVar1,in_DX);
  if (iVar2 == 0) {
    uVar1 = thunk_FUN_7e8f_051a(2);
    FUN_79a9_0000(uVar1,in_DX);
  }
  if ((DAT_4125_15ea != 0) && ((DAT_4125_1615 & 10) == 0)) {
    for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_1614; iVar2 = iVar2 + 1) {
      FUN_1d28_07a9(((undefined4 *)&DAT_4125_15ea)[iVar2]);
    }
  }
  thunk_FUN_7e8f_0a1b();
  if ((DAT_4125_15ea != 0) && ((DAT_4125_1615 & 10) == 0)) {
    for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_1614; iVar2 = iVar2 + 1) {
      uVar1 = FUN_1d28_069a(((undefined4 *)&DAT_4125_15ea)[iVar2]);
      ((undefined2 *)&DAT_4125_15fc)[iVar2 * 2] = in_DX;
      ((undefined2 *)&DAT_4125_15fa)[iVar2 * 2] = uVar1;
    }
  }
  FUN_2012_09e3(0x15e0,0x4125,1);
  FUN_1709_0000(0x15e0,0x4125,0x1000a);
  if ((DAT_4125_15ea != 0) && ((DAT_4125_1615 & 10) == 0)) {
    for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_1614; iVar2 = iVar2 + 1) {
      FUN_1d28_07a9(((undefined4 *)&DAT_4125_15ea)[iVar2]);
    }
  }
  FUN_1997_034a();
  FUN_1997_034a();
  FUN_2012_0975(0x5559,0x4125);
  FUN_2012_09fb(0x161b,0x4125,3,0x40028);
  FUN_2012_07cc(0x161b,0x4125,0);
  FUN_2012_0232(0x54e3,0x4125,0xe0,0x10138);
  return;
}

