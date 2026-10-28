
uint __cdecl16far FUN_57d5_0935(undefined2 param_1,undefined4 param_2)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined2 unaff_SS;
  byte abStack_9 [7];
  
  iVar1 = FUN_57d5_01f6(param_1,abStack_9 + 1);
  if (iVar1 == 0) {
LAB_57d5_097b:
    uVar2 = 0xff;
  }
  else {
    iVar1 = 6;
    do {
      iVar3 = iVar1 + -1;
      if (iVar1 == 0) goto LAB_57d5_097b;
      uVar2 = (uint)abStack_9[iVar1];
      iVar1 = iVar3;
    } while ((uVar2 == 0xff) || ('\x02' < *(char *)((int)param_2 + uVar2)));
  }
  return uVar2;
}

