
int FUN_1000_4904(int *param_1,int param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 uVar1;
  
  uVar1 = (undefined2)((ulong)param_1 >> 0x10);
  FUN_1000_4345(*param_1,((int *)param_1)[1],param_3,param_4,param_2);
  *param_1 = *param_1 + param_2;
  *(undefined1 *)*param_1 = 0;
  return param_2;
}

