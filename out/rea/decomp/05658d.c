
bool __cdecl16far FUN_562a_02ed(int param_1)

{
  uint uVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 unaff_SS;
  bool bVar4;
  byte abStack_13 [7];
  undefined2 local_c;
  undefined2 local_a;
  int local_8;
  uint local_6;
  int local_4;
  
  local_6 = 0xffff;
  local_8 = 1000;
  uVar3 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar2 = (int)DAT_451b_018e;
  local_a = *(undefined2 *)(*(int *)(iVar2 + param_1 * 0x5c + 0x250) * 0x41 + 0x157d);
  local_c = *(undefined2 *)(*(int *)(iVar2 + param_1 * 0x5c + 0x250) * 0x41 + 0x157f);
  thunk_FUN_5d9f_0656(*(undefined2 *)(iVar2 + param_1 * 0x5c + 0x250),0,abStack_13 + 1);
  local_4 = 6;
  while (iVar2 = local_4, local_4 = local_4 + -1, iVar2 != 0) {
    uVar1 = (uint)abStack_13[iVar2];
    if ((uVar1 != 0xff) && (*(char *)(uVar1 * 0x41 + 0x1592) == DAT_3c04_0110)) {
      iVar2 = thunk_FUN_5efd_07f8(uVar1);
      if (iVar2 == 0) {
        iVar2 = FUN_1a8b_0acc(*(undefined2 *)(uVar1 * 0x41 + 0x157d),
                              *(undefined2 *)(uVar1 * 0x41 + 0x157f),local_a,local_c);
        if (iVar2 < local_8) {
          local_8 = iVar2;
          local_6 = uVar1;
        }
      }
    }
  }
  bVar4 = local_6 == 0xffff;
  if (bVar4) {
    FUN_562a_066d(param_1,1);
  }
  else {
    *(uint *)((int)DAT_451b_018e + param_1 * 0x5c + 0x250) = local_6;
  }
  return !bVar4;
}

