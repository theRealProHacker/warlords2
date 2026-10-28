
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __cdecl16far FUN_197b_0005(undefined4 param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  undefined1 local_70 [80];
  undefined2 local_20;
  undefined2 uStack_1e;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  undefined4 local_a;
  undefined4 local_6;
  
  FUN_1000_4a70(local_70);
  FUN_1000_4a01(local_70);
  DAT_451b_0cfa = FUN_170b_0006(local_70);
  if (DAT_451b_0cfa != -1) {
    FUN_170b_006d(DAT_451b_0cfa,0x4c54,0x4125,6);
    iVar5 = (int)param_1;
    uVar6 = (undefined2)((ulong)param_1 >> 0x10);
    iVar2 = FUN_2012_01fe(iVar5,uVar6,(int)_DAT_451b_0cf6,(int)((ulong)_DAT_451b_0cf6 >> 0x10));
    if (iVar2 != 0) {
      FUN_2012_07cc(iVar5,uVar6,0);
      if ((*(long *)(iVar5 + 10) != 0) && ((*(uint *)(iVar5 + 0x35) & 10) == 0)) {
        for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar5 + 0x34); iVar2 = iVar2 + 1) {
          uVar1 = *(undefined4 *)(iVar5 + iVar2 * 4 + 10);
          uVar3 = FUN_1d28_069a((int)uVar1,(int)((ulong)uVar1 >> 0x10));
          iVar4 = iVar5 + iVar2 * 4;
          *(undefined2 *)(iVar4 + 0x1c) = in_DX;
          *(undefined2 *)(iVar4 + 0x1a) = uVar3;
        }
      }
      local_20 = FUN_1d28_011f(0x800,0,0,0,0);
      uStack_1e = in_DX;
      iVar2 = FUN_1d28_069a(local_20,in_DX);
      local_6 = CONCAT22(in_DX,iVar2);
      local_a = CONCAT22(in_DX,iVar2 + 0x400);
      local_c = (DAT_451b_0cf6 / 8) * DAT_451b_0cf8;
      local_10 = *(undefined4 *)(iVar5 + 0x1a);
      local_14 = *(undefined4 *)(iVar5 + 0x1e);
      local_18 = *(undefined4 *)(iVar5 + 0x22);
      local_1c = *(undefined4 *)(iVar5 + 0x26);
      FUN_1719_0059(local_10,DAT_451b_0cfa,local_6,local_a,0x400,local_c,4,local_14,(int)local_18,
                    (int)((ulong)local_18 >> 0x10),(int)local_1c,(int)((ulong)local_1c >> 0x10),0);
      FUN_1d28_048e(local_20,uStack_1e);
      FUN_170b_003a(DAT_451b_0cfa);
      if ((*(long *)(iVar5 + 10) != 0) && ((*(uint *)(iVar5 + 0x35) & 10) == 0)) {
        for (iVar2 = 0; iVar2 < (int)(uint)*(byte *)(iVar5 + 0x34); iVar2 = iVar2 + 1) {
          uVar1 = *(undefined4 *)(iVar5 + iVar2 * 4 + 10);
          FUN_1d28_07a9((int)uVar1,(int)((ulong)uVar1 >> 0x10));
        }
      }
      return 1;
    }
    FUN_1000_43ac((char *)s_Cannot_allocate_this_newbm_4125_1ef6,0x4125);
  }
  return 0;
}

