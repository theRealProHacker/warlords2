
int __cdecl16far FUN_7e8f_052f(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 in_DX;
  int *piVar4;
  undefined4 local_12;
  
  *(undefined1 *)(DAT_4125_267a * 0x50 + 0x59a8) = 0;
  iVar2 = FUN_1d28_069a(*(undefined4 *)*(undefined4 *)(param_1 * 4 + 0x267c));
  piVar4 = (int *)(iVar2 + param_2 * 4);
  iVar3 = *piVar4;
  local_12 = (int *)CONCAT22(in_DX,piVar4 + 1);
  iVar1 = *local_12;
  if (param_3 < 0) {
    param_3 = FUN_7e8f_02bf(1,iVar1,0xffff);
  }
  if (iVar1 + -1 < param_3) {
    param_3 = iVar1 + -1;
  }
  FUN_1000_4a70(DAT_4125_267a * 0x50 + 0x59a8,0x4125,iVar2 + *(int *)(iVar2 + iVar3 + param_3 * 2),
                in_DX);
  FUN_1d28_07a9(*(undefined4 *)*(undefined4 *)(param_1 * 4 + 0x267c));
  iVar3 = DAT_4125_267a * 0x50;
  DAT_4125_267a = (DAT_4125_267a + 1) % 8;
  return iVar3 + 0x59a8;
}

