
void __cdecl16far FUN_484d_0039(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  undefined2 local_20 [8];
  int local_10;
  undefined4 local_e;
  undefined1 local_a [8];
  
  if (DAT_4125_166a == 0) {
    thunk_FUN_54e4_0000();
  }
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0x6b);
  thunk_FUN_7e8f_00d6(0x400140,uVar1,in_DX);
  FUN_24d0_0002();
  FUN_2133_0344();
  for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
    FUN_2133_0344();
  }
  FUN_2133_02fe();
  for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
    FUN_2133_02fe();
  }
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if (*(int *)(iVar2 * 2 + 0x137) != 0) {
      thunk_FUN_85d0_0bf7(iVar2,3,0x342a,0x4125,iVar2 * 0x20 + 0x80,0x75);
      thunk_FUN_85d0_0bf7(iVar2,3);
    }
  }
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if (((iVar2 == iVar3) ||
          ((*(int *)(iVar2 * 2 + 0x137) != 0 && (*(int *)(iVar3 * 2 + 0x137) != 0)))) &&
         ((iVar2 == iVar3 ||
          (((*(byte *)(iVar2 * 8 + iVar3 + 0x153b) & 3) == 2 ||
           ((*(byte *)(iVar2 * 8 + iVar3 + 0x153b) & 3) == 0)))))) {
        FUN_216d_002e(local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79(local_e);
        FUN_1997_0129();
      }
    }
  }
  FUN_24d0_0002();
  uVar1 = FUN_216d_002e(local_a);
  FUN_216d_01fd(uVar1,in_DX);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0x6d);
  thunk_FUN_7e8f_00d6(0x7401d8,uVar1,in_DX);
  FUN_484d_0aed(&local_10);
  for (iVar2 = 0; iVar2 < local_10; iVar2 = iVar2 + 1) {
    thunk_FUN_85d0_0bf7(local_20[iVar2],3,0x342a,0x4125,400,iVar2 * 0x1d + 0x92);
    thunk_FUN_7e8f_04f0(0x6a);
    thunk_FUN_7e8f_00bf();
  }
  return;
}

