
void __cdecl16far FUN_484d_0382(int param_1)

{
  undefined2 uVar1;
  uint in_DX;
  int iVar2;
  int iVar3;
  uint unaff_SS;
  undefined4 local_e;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  if (DAT_4125_166a == 0) {
    thunk_FUN_54e4_0000();
  }
  if (param_1 == 0) {
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0x6c);
    thunk_FUN_7e8f_00d6(0x400140,uVar1,in_DX);
    thunk_FUN_85d0_0bf7(DAT_3c04_0110,0,0x342a,0x4125,0x6f0060);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    thunk_FUN_7e8f_00bf(0x7a0090,DAT_3c04_0110 * 0x14,0x3c04);
    uVar1 = thunk_FUN_7e8f_04f0(0x6e);
    thunk_FUN_7e8f_00bf(0xa50068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x1006e);
    thunk_FUN_7e8f_00bf(0xcd0068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x2006e);
    thunk_FUN_7e8f_00bf(0xfb0068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x3006e);
    thunk_FUN_7e8f_00bf(0x10f0068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x4006e);
    thunk_FUN_7e8f_00bf(0x1230068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x5006e);
    thunk_FUN_7e8f_00bf(0x1370068,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x6006e);
    thunk_FUN_7e8f_00bf(0x14b0068,uVar1,in_DX);
  }
  iVar3 = 0;
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if (DAT_3c04_0110 != iVar2) {
      thunk_FUN_85d0_0bf7(iVar2,0,0x342a,0x4125,iVar3 * 0x28 + 0x110,0x6f);
      if (*(int *)(iVar2 * 2 + 0x137) == 0) {
        FUN_24d0_0002();
        uVar1 = FUN_216d_002e(&local_a);
        FUN_216d_01fd(uVar1,in_DX);
        local_a = local_a + 1;
        local_8 = local_8 + 1;
        local_6 = local_6 + -2;
        local_4 = local_4 + -2;
        FUN_24d0_0002();
        FUN_216d_0288(&local_a);
      }
      else {
        FUN_216d_002e(&local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79(local_e);
        FUN_1997_0129();
      }
      if ((*(int *)(iVar2 * 2 + 0x137) == 0) ||
         (in_DX = (*(byte *)(iVar2 * 8 + DAT_3c04_0110 + 0x153b) & 0xc) >> 2,
         (*(byte *)(iVar2 * 8 + DAT_3c04_0110 + 0x153b) & 3) == in_DX)) {
        FUN_24d0_0002();
        uVar1 = FUN_216d_002e(&local_a);
        FUN_216d_01fd(uVar1,in_DX);
        local_a = local_a + 1;
        local_8 = local_8 + 1;
        local_6 = local_6 + -2;
        local_4 = local_4 + -2;
        FUN_24d0_0002();
        FUN_216d_0288(&local_a);
      }
      else {
        FUN_216d_002e(&local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79(local_e);
        FUN_1997_0129();
      }
      if (*(int *)(iVar2 * 2 + 0x137) == 0) {
        FUN_24d0_0002();
        uVar1 = FUN_216d_002e(&local_a);
        FUN_216d_01fd(uVar1,in_DX);
        local_a = local_a + 1;
        local_8 = local_8 + 1;
        local_6 = local_6 + -2;
        local_4 = local_4 + -2;
        FUN_24d0_0002();
        FUN_216d_0288(&local_a);
      }
      else {
        FUN_216d_002e(&local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79(local_e);
        FUN_1997_0129();
      }
      if (*(int *)(iVar2 * 2 + 0x137) == 0) {
        FUN_24d0_0002();
        uVar1 = FUN_216d_002e(&local_a);
        FUN_216d_01fd(uVar1,in_DX);
        local_a = local_a + 1;
        local_8 = local_8 + 1;
        local_6 = local_6 + -2;
        local_4 = local_4 + -2;
        FUN_24d0_0002();
        FUN_216d_0288(&local_a);
      }
      else {
        FUN_216d_002e(&local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79(local_e);
        FUN_1997_0129();
      }
      if (*(int *)(iVar2 * 2 + 0x137) == 0) {
        FUN_24d0_0002();
        uVar1 = FUN_216d_002e(&local_a);
        FUN_216d_01fd(uVar1);
        local_a = local_a + 1;
        local_8 = local_8 + 1;
        local_6 = local_6 + -2;
        local_4 = local_4 + -2;
        FUN_24d0_0002();
        FUN_216d_0288();
      }
      else {
        FUN_216d_002e(&local_a);
        FUN_216d_000e(&local_e);
        in_DX = unaff_SS;
        FUN_1000_1e79();
        FUN_1997_0129();
      }
      iVar3 = iVar3 + 1;
    }
  }
  return;
}

