
undefined2 __cdecl16far FUN_1000_47e7(int *param_1,int param_2,int param_3,int param_4,uint param_5)

{
  undefined2 uVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  
  iVar4 = (int)((ulong)param_1 >> 0x10);
  piVar3 = (int *)param_1;
  if ((((int *)piVar3[9] == piVar3) && (param_4 < 3)) && (param_5 < 0x8000)) {
    if ((DAT_4125_3ed8 == 0) && (piVar3 == (int *)0x3b80)) {
      DAT_4125_3ed8 = 1;
    }
    else if ((DAT_4125_3ed6 == 0) && (piVar3 == (int *)0x3b6c)) {
      DAT_4125_3ed6 = 1;
    }
    if (*param_1 != 0) {
      FUN_1000_4105(piVar3,iVar4,0,0,1);
    }
    if ((piVar3[1] & 4U) != 0) {
      FUN_1d28_050d(piVar3[4],piVar3[5]);
    }
    piVar3[1] = piVar3[1] & 0xfff3;
    piVar3[3] = 0;
    iVar2 = (int)piVar3 + 5;
    piVar3[5] = iVar4;
    piVar3[4] = iVar2;
    piVar3[7] = iVar4;
    piVar3[6] = iVar2;
    if ((param_4 != 2) && (param_5 != 0)) {
      DAT_4125_3b62 = 0x1000;
      DAT_4125_3b60 = 0x5271;
      if (param_2 == 0 && param_3 == 0) {
        param_2 = FUN_1d28_01d5(param_5);
        if (param_2 == 0 && iVar2 == 0) goto LAB_1000_4809;
        piVar3[1] = piVar3[1] | 4;
        param_3 = iVar2;
      }
      piVar3[7] = param_3;
      piVar3[6] = param_2;
      piVar3[5] = param_3;
      piVar3[4] = param_2;
      piVar3[3] = param_5;
      if (param_4 == 1) {
        piVar3[1] = piVar3[1] | 8;
      }
    }
    uVar1 = 0;
  }
  else {
LAB_1000_4809:
    uVar1 = 0xffff;
  }
  return uVar1;
}

