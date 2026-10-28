
int __cdecl16far FUN_1000_4185(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined2 uVar5;
  int local_6;
  
  iVar2 = 0;
  uVar5 = (undefined2)((ulong)param_1 >> 0x10);
  piVar4 = (int *)param_1;
  iVar1 = FUN_1000_1f98((int)(char)piVar4[2],0,0,1);
  if ((iVar2 == -1) && (iVar1 == -1)) {
    iVar1 = -1;
  }
  else if (*param_1 < 0) {
    local_6 = iVar1;
    if ((*(uint *)((char)piVar4[2] * 2 + 0x3cfe) & 0x800) != 0) {
      iVar3 = 0;
      local_6 = FUN_1000_1f98((int)(char)piVar4[2],0,0,2);
      if ((iVar3 == -1) && (local_6 == -1)) {
        return -1;
      }
      iVar1 = FUN_1000_1f98((int)(char)piVar4[2],iVar1,iVar2,0,local_6,iVar3);
      if ((iVar3 == -1) && (iVar1 == -1)) {
        return -1;
      }
    }
    iVar1 = FUN_1000_4083(piVar4,uVar5);
    iVar1 = local_6 + iVar1;
  }
  else {
    iVar2 = FUN_1000_4083(piVar4,uVar5);
    iVar1 = iVar1 - iVar2;
  }
  return iVar1;
}

