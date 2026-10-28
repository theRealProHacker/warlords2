
void __cdecl16far FUN_76ef_0a46(long param_1,int param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  undefined1 local_5a [80];
  undefined2 local_a;
  undefined2 uStack_8;
  undefined4 local_6;
  
  if (param_1 != 0) {
    FUN_1000_4a70(DAT_4125_128c * 0xf + 0x471c,0x4125,(int)param_1,(int)((ulong)param_1 >> 0x10));
    ((undefined1 *)&DAT_451b_07b2)[DAT_4125_128c] = 1;
    FUN_76ef_0f4c();
  }
  if (param_2 == 0) {
    thunk_FUN_7e8f_0505(0x1c,DAT_4125_128c);
    FUN_1000_4944(local_5a);
  }
  else {
    FUN_1000_4a70(local_5a);
  }
  FUN_22bf_07a5();
  iVar1 = FUN_170b_0006(local_5a);
  if (-1 < iVar1) {
    FUN_170b_004e(iVar1,0x5d64,0x4125,0x54);
    FUN_170b_004e(iVar1,0,0x3c04,0x2ee1);
    FUN_170b_004e(iVar1,0,0x2e1d,0xde70);
    FUN_170b_004e(iVar1,0,0x29d9,(undefined2 *)&DAT_451b_04e0);
    DAT_4125_126c = FUN_1d28_069a((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    DAT_4125_126e = in_DX;
    FUN_170b_004e(iVar1,DAT_4125_126c,in_DX,(undefined2 *)&DAT_451b_04e0);
    FUN_1d28_07a9((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    uVar2 = thunk_FUN_7e8f_0505(0x1d,0,2);
    uVar2 = FUN_170b_0006(uVar2,in_DX);
    uVar3 = FUN_170b_00a9(uVar2);
    local_6 = CONCAT22(in_DX,uVar3);
    local_a = FUN_1d28_01d5(uVar3);
    uStack_8 = in_DX;
    FUN_170b_006d(uVar2,local_a,in_DX,(undefined2)local_6);
    FUN_170b_004e(iVar1,&local_6);
    FUN_170b_004e(iVar1,local_a,uStack_8,(undefined2)local_6);
    FUN_170b_003a(uVar2);
    FUN_1d28_050d(local_a,uStack_8);
    if (DAT_3c04_0120 != 0) {
      uVar2 = thunk_FUN_7e8f_0505(0x22,0,2);
      uVar2 = FUN_170b_0006(uVar2,in_DX);
      uVar3 = FUN_170b_00a9(uVar2);
      local_6 = CONCAT22(in_DX,uVar3);
      local_a = FUN_1d28_01d5(uVar3);
      uStack_8 = in_DX;
      FUN_170b_006d(uVar2,local_a,in_DX,(undefined2)local_6);
      FUN_170b_004e(iVar1,&local_6);
      FUN_170b_004e(iVar1,local_a,uStack_8,(undefined2)local_6);
      FUN_170b_003a(uVar2);
      FUN_1d28_050d(local_a,uStack_8);
    }
    if (DAT_3c04_0120 != 0) {
      uVar2 = thunk_FUN_7e8f_0505(0x23,0,2);
      uVar2 = FUN_170b_0006(uVar2,in_DX);
      uVar3 = FUN_170b_00a9(uVar2);
      local_6 = CONCAT22(in_DX,uVar3);
      local_a = FUN_1d28_01d5(uVar3);
      uStack_8 = in_DX;
      FUN_170b_006d(uVar2,local_a,in_DX,(undefined2)local_6);
      FUN_170b_004e(iVar1,&local_6);
      FUN_170b_004e(iVar1,local_a,uStack_8,(undefined2)local_6);
      FUN_170b_003a(uVar2);
      FUN_1d28_050d(local_a,uStack_8);
    }
    uVar2 = thunk_FUN_7e8f_0505(6,0,2);
    uVar2 = FUN_170b_0006(uVar2,in_DX);
    uVar3 = FUN_170b_00a9(uVar2);
    local_6 = CONCAT22(in_DX,uVar3);
    uVar3 = FUN_1d28_01d5(uVar3);
    _local_a = CONCAT22(in_DX,uVar3);
    FUN_170b_006d(uVar2,uVar3,in_DX,(undefined2)local_6);
    FUN_170b_004e(iVar1,&local_6);
    FUN_170b_004e(iVar1,(int)_local_a,(int)((ulong)_local_a >> 0x10),(undefined2)local_6);
    FUN_170b_003a(uVar2);
    FUN_1d28_050d((int)_local_a,(int)((ulong)_local_a >> 0x10));
    if (param_2 == 0) {
      thunk_FUN_621e_0da9(iVar1);
    }
    FUN_170b_003a(iVar1);
  }
  FUN_22bf_0757();
  return;
}

