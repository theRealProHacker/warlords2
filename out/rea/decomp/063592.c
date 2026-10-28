
int __cdecl16far
FUN_621e_13b2(int param_1,int param_2,long param_3,uint param_4,uint param_5,int param_6)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  int local_12 [8];
  
  iVar2 = 8;
  while (iVar2 != 0) {
    local_12[iVar2 + -1] = -1;
    iVar2 = iVar2 + -1;
  }
  iVar3 = 0;
  iVar2 = DAT_3c04_0181;
  do {
    do {
      iVar1 = iVar2 + -1;
      if (iVar2 == 0) goto LAB_621e_1491;
      iVar2 = iVar1;
    } while ((((*(char *)(iVar1 * 0x16 + -0x777b) != (char)DAT_3c04_0110) ||
              (*(int *)(iVar1 * 0x16 + -0x7780) != param_1)) ||
             (*(int *)(iVar1 * 0x16 + -0x777e) != param_2)) ||
            ((((*(byte *)(iVar1 * 0x16 + -0x7772) & 0x70) >> 4 != param_4 ||
              ((*(byte *)(iVar1 * 0x16 + -0x7772) & 0xf) != param_5)) ||
             ((param_6 != 0 && (*(char *)(iVar1 * 0x16 + -0x777a) < param_6))))));
    local_12[iVar3] = iVar1;
    iVar3 = iVar3 + 1;
  } while (iVar3 < 8);
LAB_621e_1491:
  if (iVar3 != 0) {
    FUN_621e_14d3(local_12);
  }
  if (param_3 != 0) {
    iVar2 = 8;
    while (iVar1 = iVar2 + -1, iVar2 != 0) {
      *(int *)((int)param_3 + iVar1 * 2) = local_12[iVar1];
      iVar2 = iVar1;
    }
  }
  return iVar3;
}

