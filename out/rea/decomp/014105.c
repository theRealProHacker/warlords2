
undefined2 __cdecl16far FUN_1000_4105(int *param_1,uint param_2,int param_3,int param_4)

{
  int iVar1;
  undefined2 uVar2;
  uint uVar3;
  int iVar4;
  bool bVar5;
  
  iVar1 = FUN_1000_3f58((int *)param_1,param_1._2_2_);
  if (iVar1 == 0) {
    if ((param_4 == 1) && (0 < *param_1)) {
      uVar3 = FUN_1000_4083((int *)param_1,param_1._2_2_);
      bVar5 = param_2 < uVar3;
      param_2 = param_2 - uVar3;
      param_3 = (param_3 - ((int)uVar3 >> 0xf)) - (uint)bVar5;
    }
    ((int *)param_1)[1] = ((int *)param_1)[1] & 0xfe5f;
    *param_1 = 0;
    iVar1 = ((int *)param_1)[4];
    ((int *)param_1)[7] = ((int *)param_1)[5];
    ((int *)param_1)[6] = iVar1;
    iVar4 = FUN_1000_1f98((int)(char)((int *)param_1)[2],param_2,param_3,param_4);
    if ((iVar1 == -1) && (iVar4 == -1)) {
      uVar2 = 0xffff;
    }
    else {
      uVar2 = 0;
    }
  }
  else {
    uVar2 = 0xffff;
  }
  return uVar2;
}

