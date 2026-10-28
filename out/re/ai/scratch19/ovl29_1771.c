// ovl29:1771 ent 63951

int __cdecl16far FUN_621e_1771(int param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar3 = FUN_621e_15c5(param_2,param_3);
  uVar1 = *DAT_451b_1f02;
  uVar2 = (DAT_451b_1f02)[1];
  iVar4 = *(param_1 * 0x41 + 0x1592);
  if ((iVar4 == 0xf) || ((*(iVar4 * 8 + DAT_3c04_0110 + 0x153b) & 3) == 2)) {
    iVar5 = 1;
  }
  else {
    iVar5 = 0;
  }
  if (((iVar4 != 0xf) && (*(iVar4 * 2 + 0xd0) == 0)) &&
     (iVar4 = thunk_FUN_7e8f_02bf(1,0xffff0004), iVar4 == 0)) {
    iVar5 = 1;
  }
  if ((iVar5 == 0) || (iVar4 = param_1, iVar3 < 0x33)) {
    FUN_1555_1ab9(0xf,uVar1,uVar2,DAT_451b_1e9c,DAT_451b_1e9a);
    iVar4 = FUN_621e_1885(param_2,param_3,iVar5);
    if (iVar4 == -1) {
      iVar4 = param_1;
    }
  }
  return iVar4;
}

