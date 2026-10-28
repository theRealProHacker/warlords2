
undefined2 __cdecl16far FUN_606a_0b75(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined1 local_20 [16];
  int local_10;
  int local_e;
  undefined2 local_c;
  undefined2 local_a;
  undefined2 local_8;
  int local_6;
  uint local_4;
  
  uVar3 = (undefined2)((ulong)param_2 >> 0x10);
  iVar2 = (int)param_2;
  iVar1 = *(int *)(iVar2 + param_1 * 2);
  local_e = *(int *)(iVar2 + 0x38);
  local_8 = *(undefined2 *)(local_e * 0x41 + 0x157d);
  local_a = *(undefined2 *)(local_e * 0x41 + 0x157f);
  local_6 = *(int *)(iVar2 + param_1 * 2 + 0xc);
  local_c = FUN_1a8b_0acc(local_8,local_a,*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                          *(undefined2 *)(iVar1 * 0x16 + -0x777e));
  iVar2 = thunk_FUN_621e_13b2(*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                              *(undefined2 *)(iVar1 * 0x16 + -0x777e),local_20);
  if (iVar2 != 0) {
    if ((local_6 != -1) && (*(byte *)((int)DAT_451b_018e + local_6 + 0x182) == local_4)) {
      local_10 = thunk_FUN_57d5_0a3e(*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                                     *(undefined2 *)(iVar1 * 0x16 + -0x777e),0xffff);
      iVar1 = thunk_FUN_8027_225b();
      if (iVar1 < 6) {
        iVar1 = 10;
      }
      else {
        iVar1 = 0xf;
      }
      if (local_10 < iVar1) {
        return 0;
      }
    }
    thunk_FUN_621e_0ae7(local_20);
    uVar3 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                  *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
  }
  return 0;
}

