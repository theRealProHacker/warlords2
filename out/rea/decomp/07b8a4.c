
undefined2 __cdecl16far FUN_7b71_0194(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined1 local_66 [60];
  undefined1 local_2a [40];
  
  if (param_1 != 0) {
    uVar1 = thunk_FUN_7e8f_04f0(0x60087);
    uVar1 = thunk_FUN_7e8f_04f0(0x50087,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x40087,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x30087,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x20087,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x10087,uVar1,in_DX);
    uVar1 = thunk_FUN_7e8f_04f0(0x87,uVar1,in_DX);
    thunk_FUN_8027_1471(uVar1,in_DX);
    thunk_FUN_4bea_01b5();
    thunk_FUN_4bea_01ff();
  }
  FUN_1000_4944(local_2a);
  iVar2 = FUN_170b_0006();
  if (iVar2 < 0) {
    thunk_FUN_7e8f_051a(0,local_2a);
    FUN_1000_4944(local_66);
    thunk_FUN_79a9_0000(local_66);
  }
  FUN_170b_006d(iVar2,0,0x3c04,0x2ee1);
  FUN_170b_003a();
  if (param_1 != 0) {
    thunk_FUN_4bea_01ff();
  }
  FUN_7b71_0323();
  if (param_1 != 0) {
    thunk_FUN_4bea_01ff();
  }
  thunk_FUN_621e_0000();
  if (param_1 != 0) {
    thunk_FUN_4bea_01ff();
    thunk_FUN_7e8f_0000();
  }
  thunk_FUN_830b_232b();
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if (*(int *)(iVar2 * 2 + 0x137) == 0) {
      FUN_1000_4a70(iVar2 * 0x14,0x3c04,(char *)s_Not_used_4125_256f,0x4125);
      *(undefined2 *)(iVar2 * 2 + 0xc0) = 3;
    }
  }
  return 1;
}

