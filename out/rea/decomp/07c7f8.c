
void __cdecl16far FUN_7b71_10e8(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  undefined2 unaff_SS;
  undefined1 local_14 [6];
  undefined1 local_e;
  int local_c;
  undefined4 local_a;
  undefined4 local_6;
  
  for (iVar2 = 0; iVar2 < 6; iVar2 = iVar2 + 1) {
    local_c = thunk_FUN_7e8f_02bf();
    local_c = local_c + 0x20;
    local_14[iVar2] = (undefined1)local_c;
  }
  local_e = 0;
  uVar1 = thunk_FUN_7e8f_04f0(0x60088);
  uVar1 = thunk_FUN_7e8f_04f0(0x50088,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x40088,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x30088,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x20088,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x10088,uVar1,in_DX);
  uVar1 = thunk_FUN_7e8f_04f0(0x88,uVar1,in_DX);
  thunk_FUN_8027_1471(uVar1,in_DX);
  FUN_22bf_07a5();
  for (iVar2 = 0; iVar2 < 4; iVar2 = iVar2 + 1) {
    if (*(int *)(iVar2 * 2 + 0x28d0) == 7) {
      uVar1 = thunk_FUN_7e8f_02bf();
    }
    else {
      uVar1 = *(undefined2 *)(iVar2 * 2 + 0x28d0);
    }
    *(undefined2 *)((int)&local_a + iVar2 * 2) = uVar1;
  }
  thunk_FUN_4bea_0000(local_a,local_6);
  FUN_1000_4a70(0x5da0,0x4125,(char *)s_random_4125_255c,0x4125);
  FUN_1000_4a70(0x5d78,0x4125,(char *)s_random_4125_255c,0x4125);
  FUN_1000_4a70(0x5da8,0x4125,local_14);
  DAT_3c04_0161 = 0;
  FUN_1000_4a70((char *)s_Illuria__4125_1672,0x4125,0x259d,0x4125);
  FUN_7b71_0194();
  thunk_FUN_76ef_11f3();
  FUN_22bf_0757();
  return;
}

