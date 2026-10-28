
undefined2 __cdecl16far FUN_1000_3f58(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  if ((int *)param_1 == (int *)0x0 && param_1._2_2_ == 0) {
    FUN_1000_4025();
  }
  else {
    if ((int *)((int *)param_1)[9] != (int *)param_1) {
      return 0xffff;
    }
    if (*param_1 < 0) {
      iVar2 = ((int *)param_1)[3] + *param_1 + 1;
      *param_1 = *param_1 - iVar2;
      iVar3 = ((int *)param_1)[5];
      iVar1 = ((int *)param_1)[4];
      ((int *)param_1)[7] = iVar3;
      ((int *)param_1)[6] = iVar1;
      iVar3 = FUN_1000_50e4((int)(char)((int *)param_1)[2],iVar1,iVar3,iVar2);
      if ((iVar3 != iVar2) && ((((int *)param_1)[1] & 0x200U) == 0)) {
        ((int *)param_1)[1] = ((int *)param_1)[1] | 0x10;
        return 0xffff;
      }
    }
    else if (((((int *)param_1)[1] & 8U) != 0) ||
            ((((int *)param_1)[7] == param_1._2_2_ &&
             (((int *)param_1)[6] == (int)(int *)param_1 + 5)))) {
      *param_1 = 0;
      if ((((int *)param_1)[7] == param_1._2_2_) && (((int *)param_1)[6] == (int)(int *)param_1 + 5)
         ) {
        iVar3 = ((int *)param_1)[4];
        ((int *)param_1)[7] = ((int *)param_1)[5];
        ((int *)param_1)[6] = iVar3;
      }
    }
  }
  return 0;
}

