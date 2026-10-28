
void __cdecl16far FUN_7d9f_0d01(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  char *pcVar4;
  int iVar5;
  undefined2 uVar6;
  undefined2 unaff_SS;
  undefined1 local_c6 [10];
  long local_bc [4];
  int aiStack_ac [13];
  byte local_92;
  uint local_91;
  char local_8a [128];
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  local_8 = 0;
  iVar1 = FUN_170b_0006((int)param_1,(int)((ulong)param_1 >> 0x10),2);
  if (-1 < iVar1) {
    FUN_170b_006d(iVar1,local_8a);
    FUN_170b_003a(iVar1);
    iVar1 = 0;
    local_4 = 0;
    thunk_FUN_7875_06ae(2,0xf,0,3);
    while ((iVar2 = local_8, local_4 == 0 && (local_8 = local_8 + 1, iVar2 < 5))) {
      local_6 = iVar1;
      for (; iVar1 < 0x80; iVar1 = iVar1 + 1) {
        if (local_8a[iVar1] == '|') {
          local_8a[iVar1] = '\0';
          iVar1 = iVar1 + 1;
          break;
        }
        if (local_8a[iVar1] == '~') {
          local_8a[iVar1] = '\0';
          iVar1 = iVar1 + 1;
          local_4 = 1;
          break;
        }
      }
      thunk_FUN_7e8f_0a1b();
      pcVar4 = local_8a + local_6;
      iVar2 = FUN_21e2_0a8e(pcVar4);
      iVar5 = (iVar2 >> 4) * 0x10 + 0x10;
      local_92 = 0;
      local_91 = 0;
      iVar2 = FUN_2012_01fe(local_c6);
      if (iVar2 == 0) {
        return;
      }
      uVar6 = 0x40c1;
      thunk_FUN_7e8f_0a1b();
      if ((local_bc[0] != 0) && ((local_91 & 10) == 0)) {
        for (local_a = 0; local_a < (int)(uint)local_92; local_a = local_a + 1) {
          uVar6 = 0x1d28;
          iVar3 = FUN_1d28_069a((int)local_bc[local_a],(int)((ulong)local_bc[local_a] >> 0x10));
          iVar2 = local_a * 2;
          aiStack_ac[local_a * 2 + 1] = (int)pcVar4;
          aiStack_ac[iVar2] = iVar3;
        }
      }
      (*DAT_451b_2a74)(uVar6,0x342a,0x4125,0x138 - iVar5 / 2,0x198,iVar5,0x11,local_c6);
      if ((local_bc[0] != 0) && ((local_91 & 10) == 0)) {
        for (local_a = 0; local_a < (int)(uint)local_92; local_a = local_a + 1) {
          FUN_1d28_07a9((int)local_bc[local_a],(int)((ulong)local_bc[local_a] >> 0x10));
        }
      }
      thunk_FUN_7e8f_00d6(0x138,0x198,local_8a + local_6);
      thunk_FUN_7e8f_015e(0x28);
      (*DAT_451b_2a74)(0x40c1,local_c6);
      FUN_2012_0975(local_c6);
    }
    thunk_FUN_7e8f_0a1b();
  }
  return;
}

