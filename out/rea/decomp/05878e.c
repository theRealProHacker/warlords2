
int __cdecl16far FUN_57d5_0a3e(undefined2 param_1,undefined2 param_2,int param_3)

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar3 = DAT_3c04_0181;
  iVar5 = 1000;
LAB_57d5_0b09:
  do {
    do {
      iVar4 = iVar3 + -1;
      if (iVar3 == 0) {
        return iVar5;
      }
      iVar3 = iVar4;
    } while (*(char *)(iVar4 * 0x16 + -0x777b) == '\x0f');
    uVar1 = *(undefined2 *)(iVar4 * 0x16 + -0x7780);
    uVar2 = *(undefined2 *)(iVar4 * 0x16 + -0x777e);
    if (param_3 != -1) goto LAB_57d5_0ab9;
  } while (*(char *)(iVar4 * 0x16 + -0x777b) == (char)DAT_3c04_0110);
  goto LAB_57d5_0ace;
LAB_57d5_0ab9:
  if (*(char *)(iVar4 * 0x16 + -0x777b) == param_3) {
LAB_57d5_0ace:
    if (((DAT_3c04_0124 == 0) || (iVar4 = thunk_FUN_621e_16ae(uVar1,uVar2), iVar4 != 0)) &&
       (iVar4 = FUN_1a8b_0acc(param_1,param_2,uVar1,uVar2), iVar4 < iVar5)) {
      iVar5 = iVar4;
    }
  }
  goto LAB_57d5_0b09;
}

