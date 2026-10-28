
int __cdecl16far FUN_5131_0a77(int param_1,int *param_2,int *param_3)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  int unaff_SI;
  int unaff_DI;
  undefined2 uVar4;
  int local_c;
  
  bVar1 = false;
  if (DAT_4125_02d4 == -1) {
    DAT_4125_02d4 = thunk_FUN_7e8f_02bf(1,0xffff0010);
  }
  iVar3 = DAT_4125_02d4 % 4;
  local_c = 0;
  while ((!bVar1 && (iVar2 = local_c + 1, local_c < 0x32))) {
    unaff_DI = thunk_FUN_7e8f_02bf(1,0x14,(iVar3 * 0x70) / 4 + 3);
    unaff_SI = thunk_FUN_7e8f_02bf(1);
    local_c = iVar2;
    if (((*(char *)((int)DAT_451b_002a + unaff_SI * 0x70 + unaff_DI + 0x6120) == param_1) &&
        ((((iVar2 = thunk_FUN_4c45_11f5(unaff_DI), iVar2 == 0 &&
           (iVar2 = thunk_FUN_4c45_11f5(unaff_DI), iVar2 == 0)) &&
          (iVar2 = thunk_FUN_4c45_11f5(unaff_DI + -3), iVar2 == 0)) &&
         ((iVar2 = thunk_FUN_4c45_11f5(unaff_DI + 3), iVar2 == 0 &&
          (iVar2 = thunk_FUN_4c45_11f5(unaff_DI), iVar2 == 0)))))) &&
       (iVar2 = thunk_FUN_4c45_11f5(unaff_DI), iVar2 == 0)) {
      bVar1 = true;
    }
  }
  if (!bVar1) {
    local_c = 0;
    while ((!bVar1 && (iVar3 = local_c + 1, local_c < 0x32))) {
      unaff_DI = thunk_FUN_7e8f_02bf(1,0x50066);
      unaff_SI = thunk_FUN_7e8f_02bf(1,0x50092);
      local_c = iVar3;
      if ((*(char *)((int)DAT_451b_002a + unaff_SI * 0x70 + unaff_DI + 0x6120) == param_1) &&
         ((iVar3 = thunk_FUN_4c45_11f5(unaff_DI,unaff_SI,10), iVar3 == 0 &&
          (iVar3 = thunk_FUN_4c45_11f5(unaff_DI,unaff_SI,0xb), iVar3 == 0)))) {
        bVar1 = true;
      }
    }
  }
  if (!bVar1) {
    unaff_DI = thunk_FUN_7e8f_02bf(1,0x50066);
    unaff_SI = thunk_FUN_7e8f_02bf(1,0x50092);
    local_c = 0;
    while ((!bVar1 && (iVar3 = local_c + 1, local_c < 0x32))) {
      unaff_DI = thunk_FUN_7e8f_02bf(1,0x50066);
      unaff_SI = thunk_FUN_7e8f_02bf(1,0x50092);
      uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      local_c = iVar3;
      if ((*(char *)((int)DAT_451b_002a + unaff_SI * 0x70 + unaff_DI + 0x6120) != '\n') &&
         (*(char *)((int)DAT_451b_002a + unaff_SI * 0x70 + unaff_DI + 0x6120) != '\v')) {
        bVar1 = true;
      }
    }
  }
  *param_2 = unaff_DI;
  *param_3 = unaff_SI;
  iVar3 = DAT_4125_02d4 + 1;
  DAT_4125_02d4 = iVar3 % 0x10;
  return iVar3 / 0x10;
}

