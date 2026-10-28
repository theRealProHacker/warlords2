
/* WARNING: Removing unreachable block (ram,0x0007731b) */
/* WARNING: Removing unreachable block (ram,0x00077328) */

undefined2 __cdecl16far FUN_76ef_0414(undefined2 param_1,int param_2,int param_3)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined1 local_2e [20];
  undefined2 local_1a;
  undefined1 local_18 [10];
  undefined2 local_e;
  undefined2 uStack_c;
  undefined2 local_a [2];
  long local_6;
  
  local_1a = 0;
  FUN_1000_4a70(local_18);
  FUN_1997_0066();
  thunk_FUN_85d0_1927();
  thunk_FUN_85d0_1931();
  for (local_6 = 0; local_6 < 10; local_6 = local_6 + 1) {
    *(undefined1 *)((int)local_6 * 0x16 + -0x777b) = 0xf;
    *(undefined2 *)((int)local_6 * 0x16 + -0x777e) = 0xffff;
    in_DX = 0xffff;
    *(undefined2 *)((int)local_6 * 0x16 + -0x7780) = 0xffff;
  }
  DAT_451b_1efe = 0;
  DAT_451b_1f02 = 0;
  for (local_6 = 0; local_6 < 8; local_6 = local_6 + 1) {
    *(undefined2 *)((undefined *)&DAT_451b_1ee0 + (int)local_6 * 4) = 0;
    ((undefined2 *)&DAT_451b_1ede)[(int)local_6 * 2] = 0;
  }
  thunk_FUN_54e4_0000(0x17);
  if (param_2 == 0) {
    uVar1 = thunk_FUN_7e8f_04f0(0x86,6);
    uVar1 = thunk_FUN_7e8f_04f0(0x86,5,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x40086,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x30086,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x20086,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x10086,uVar1,in_DX);
    uVar4 = CONCAT22(in_DX,uVar1);
    uVar3 = 0x86;
  }
  else {
    uVar1 = thunk_FUN_7e8f_04f0(0x85,6);
    uVar1 = thunk_FUN_7e8f_04f0(0x85,5,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x40085,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x30085,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x20085,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x10085,uVar1,in_DX);
    uVar4 = CONCAT22(in_DX,uVar1);
    uVar3 = 0x85;
  }
  uVar1 = thunk_FUN_7e8f_04f0(uVar3,uVar4);
  thunk_FUN_8027_1471(uVar1,in_DX);
  thunk_FUN_4bea_01b5();
  thunk_FUN_4bea_01ff(0);
  thunk_FUN_85d0_113b();
  thunk_FUN_4bea_01ff(10);
  if (param_2 == 0) {
    uVar1 = 0x1a;
  }
  else {
    uVar1 = 0x1c;
  }
  thunk_FUN_7e8f_0505(uVar1,param_1);
  FUN_1000_4944(local_2e);
  FUN_22bf_07a5();
  iVar2 = FUN_170b_0006(local_2e);
  if (-1 < iVar2) {
    FUN_170b_006d(iVar2,0x5d64,0x4125,0x54);
    FUN_170b_006d(iVar2,0,0x3c04,0x2ee1);
    thunk_FUN_4bea_01ff(0x14);
    FUN_170b_006d(iVar2,0,0x2e1d,0xde70);
    FUN_170b_006d(iVar2,0,0x29d9,(undefined2 *)&DAT_451b_04e0);
    thunk_FUN_4bea_01ff(0x1e);
    DAT_4125_126c = FUN_1d28_069a((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    DAT_4125_126e = in_DX;
    FUN_170b_006d(iVar2,DAT_4125_126c,in_DX,(undefined2 *)&DAT_451b_04e0);
    FUN_1d28_07a9((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    thunk_FUN_4bea_01ff(0x28);
    FUN_170b_006d(iVar2,local_a);
    local_e = FUN_1d28_01d5(local_a[0]);
    uStack_c = in_DX;
    FUN_170b_006d(iVar2,local_e,in_DX,local_a[0]);
    uVar1 = thunk_FUN_7e8f_0505(0x1d,0,9);
    uVar1 = FUN_170b_0006(uVar1,in_DX);
    FUN_170b_004e(uVar1,local_e,uStack_c,local_a[0]);
    FUN_170b_003a(uVar1);
    FUN_1d28_050d(local_e,uStack_c);
    thunk_FUN_4bea_01ff(0x32);
    if (DAT_3c04_0120 != 0) {
      FUN_170b_006d(iVar2,local_a);
      local_e = FUN_1d28_01d5(local_a[0]);
      uStack_c = in_DX;
      FUN_170b_006d(iVar2,local_e,in_DX,local_a[0]);
      uVar1 = thunk_FUN_7e8f_0505(0x22,0,9);
      uVar1 = FUN_170b_0006(uVar1,in_DX);
      FUN_170b_004e(uVar1,local_e,uStack_c,local_a[0]);
      FUN_170b_003a(uVar1);
      FUN_1d28_050d(local_e,uStack_c);
    }
    thunk_FUN_4bea_01ff(0x3c);
    if (DAT_3c04_0120 != 0) {
      FUN_170b_006d(iVar2,local_a);
      local_e = FUN_1d28_01d5(local_a[0]);
      uStack_c = in_DX;
      FUN_170b_006d(iVar2,local_e,in_DX,local_a[0]);
      uVar1 = thunk_FUN_7e8f_0505(0x23,0,9);
      uVar1 = FUN_170b_0006(uVar1,in_DX);
      FUN_170b_004e(uVar1,local_e,uStack_c,local_a[0]);
      FUN_170b_003a(uVar1);
      FUN_1d28_050d(local_e,uStack_c);
    }
    thunk_FUN_4bea_01ff(0x46);
    FUN_170b_006d(iVar2,local_a);
    uVar1 = FUN_1d28_01d5(local_a[0]);
    _local_e = CONCAT22(in_DX,uVar1);
    FUN_170b_006d(iVar2,uVar1,in_DX,local_a[0]);
    uVar1 = thunk_FUN_7e8f_0505(6,0,9);
    uVar1 = FUN_170b_0006(uVar1,in_DX);
    FUN_170b_004e(uVar1,(int)_local_e,(int)((ulong)_local_e >> 0x10),local_a[0]);
    FUN_170b_003a(uVar1);
    FUN_1d28_050d((int)_local_e,(int)((ulong)_local_e >> 0x10));
    DAT_3c04_0130 = 1;
    if (param_2 != 0) {
      thunk_FUN_621e_0dff(iVar2);
    }
    FUN_170b_003a(iVar2);
  }
  thunk_FUN_4bea_01ff(0x50);
  if (DAT_3c04_0124 != 0) {
    thunk_FUN_830b_2200(DAT_3c04_0110);
  }
  FUN_1997_034a(7);
  thunk_FUN_4bea_01ff(0x5a);
  if ((param_3 != 0) || (iVar2 = FUN_1000_4a40(0x5da8,0x4125,local_18), iVar2 != 0)) {
    thunk_FUN_830b_232b();
    local_1a = 1;
  }
  if (DAT_3c04_0120 != 0) {
    thunk_FUN_71d6_1de4();
  }
  thunk_FUN_4bea_01ff(100);
  thunk_FUN_54e4_069c();
  thunk_FUN_7ae8_0000(1);
  FUN_22bf_0757();
  return local_1a;
}

