
void __cdecl16far
FUN_7875_0059(undefined2 param_1,undefined2 param_2,undefined4 param_3,undefined4 param_4,
             long param_5,undefined4 *param_6)

{
  undefined4 uVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  undefined2 in_DX;
  undefined2 extraout_DX;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  int iVar8;
  undefined2 uVar9;
  int iVar10;
  undefined2 uVar11;
  undefined1 local_ea [14];
  undefined1 local_dc [200];
  undefined1 local_14 [8];
  undefined2 local_c;
  undefined2 local_a;
  undefined2 local_8;
  undefined4 local_6;
  
  local_8 = 1;
  FUN_1000_4a70(local_dc);
  FUN_1000_4944(local_ea);
  iVar6 = (int)param_4;
  uVar4 = (undefined2)((ulong)param_4 >> 0x10);
  iVar2 = FUN_197b_0005(iVar6,uVar4,local_dc);
  if (iVar2 == 0) {
    FUN_1000_4944(local_dc);
    thunk_FUN_79a9_0000(local_dc);
  }
  FUN_1000_4944(local_ea);
  iVar8 = (int)param_3;
  uVar9 = (undefined2)((ulong)param_3 >> 0x10);
  iVar2 = FUN_7875_03ea(iVar8,uVar9,iVar6,uVar4,local_dc);
  if (iVar2 == 0) {
    FUN_1000_4944(local_dc);
    thunk_FUN_79a9_0000(local_dc);
  }
  if (param_5 != 0) {
    local_a = *(undefined2 *)(iVar8 + 2);
    local_c = *(undefined2 *)(iVar8 + 0xd);
    DAT_4125_12d2 = 0;
    iVar2 = FUN_2012_01fe(0x12ca,0x4125,local_a,local_c);
    if (iVar2 == 0) {
      thunk_FUN_79a9_0000((char *)s_Couldn_t_allocate_the_temp_mask_b_4125_14c7,0x4125);
    }
    iVar10 = (int)param_5;
    uVar11 = (undefined2)((ulong)param_5 >> 0x10);
    uVar7 = 0x2012;
    iVar2 = FUN_2012_0232(iVar10,uVar11,local_a,local_c,1);
    if (iVar2 == 0) {
      uVar7 = 0x4096;
      thunk_FUN_79a9_0000((char *)s_Couldn_t_allocate_the_mask_bitma_4125_14f0,0x4125);
    }
    if ((DAT_4125_12d4 != 0) && ((DAT_4125_12ff & 10) == 0)) {
      for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_12fe; iVar2 = iVar2 + 1) {
        uVar7 = 0x1d28;
        uVar3 = FUN_1d28_069a((int)((undefined4 *)&DAT_4125_12d4)[iVar2],
                              (int)((ulong)((undefined4 *)&DAT_4125_12d4)[iVar2] >> 0x10));
        ((undefined2 *)&DAT_4125_12e6)[iVar2 * 2] = in_DX;
        ((undefined2 *)&DAT_4125_12e4)[iVar2 * 2] = uVar3;
      }
    }
    if ((*(long *)(iVar10 + 10) != 0) && ((*(uint *)(iVar10 + 0x35) & 10) == 0)) {
      for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar10 + 0x34); iVar2 = iVar2 + 1) {
        uVar1 = *(undefined4 *)(iVar10 + iVar2 * 4 + 10);
        uVar7 = 0x1d28;
        uVar3 = FUN_1d28_069a((int)uVar1,(int)((ulong)uVar1 >> 0x10));
        iVar5 = iVar10 + iVar2 * 4;
        *(undefined2 *)(iVar5 + 0x1c) = in_DX;
        *(undefined2 *)(iVar5 + 0x1a) = uVar3;
      }
    }
    if ((*(long *)(iVar6 + 10) != 0) && ((*(uint *)(iVar6 + 0x35) & 10) == 0)) {
      for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar6 + 0x34); iVar2 = iVar2 + 1) {
        uVar1 = *(undefined4 *)(iVar6 + iVar2 * 4 + 10);
        uVar7 = 0x1d28;
        uVar3 = FUN_1d28_069a((int)uVar1,(int)((ulong)uVar1 >> 0x10));
        iVar5 = iVar6 + iVar2 * 4;
        *(undefined2 *)(iVar5 + 0x1c) = in_DX;
        *(undefined2 *)(iVar5 + 0x1a) = uVar3;
      }
    }
    (*DAT_451b_2a74)(uVar7,param_4,0,0,local_a,local_c,0x12ca,0x4125,0,0);
    in_DX = extraout_DX;
    FUN_251d_00cf(&local_8);
    if ((*(long *)(iVar10 + 10) != 0) && ((*(uint *)(iVar10 + 0x35) & 10) == 0)) {
      for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar10 + 0x34); iVar2 = iVar2 + 1) {
        uVar1 = *(undefined4 *)(iVar10 + iVar2 * 4 + 10);
        FUN_1d28_07a9((int)uVar1,(int)((ulong)uVar1 >> 0x10));
      }
    }
    if ((*(long *)(iVar6 + 10) != 0) && ((*(uint *)(iVar6 + 0x35) & 10) == 0)) {
      for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar6 + 0x34); iVar2 = iVar2 + 1) {
        uVar1 = *(undefined4 *)(iVar6 + iVar2 * 4 + 10);
        FUN_1d28_07a9((int)uVar1,(int)((ulong)uVar1 >> 0x10));
      }
    }
    FUN_2012_0975(0x12ca,0x4125);
  }
  iVar2 = *(int *)(iVar8 + 0xf);
  uVar4 = FUN_1d28_011f(iVar2 * 0x2a,0,0x20,0,0);
  uVar4 = FUN_1d28_075d(uVar4,in_DX);
  local_6 = CONCAT22(in_DX,uVar4);
  for (iVar6 = 0; iVar6 < iVar2; iVar6 = iVar6 + 1) {
    FUN_216d_002e(local_14);
    FUN_21e2_0008((int)local_6 + iVar6 * 0x2a,local_6._2_2_,param_4,param_5,local_14);
  }
  *param_6 = local_6;
  return;
}

