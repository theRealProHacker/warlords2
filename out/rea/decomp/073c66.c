
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far
FUN_71d6_1f06(undefined2 param_1,undefined2 param_2,undefined4 param_3,undefined4 param_4,
             undefined4 param_5)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined1 local_c [10];
  
  FUN_71d6_1e02();
  uVar1 = FUN_1d28_069a(DAT_451b_0524);
  _DAT_451b_0520 = CONCAT22(in_DX,uVar1);
  iVar4 = 0;
  FUN_1000_4944(local_c);
  for (iVar3 = 0; iVar3 < 8000; iVar3 = iVar3 + 1) {
    uVar1 = (undefined2)((ulong)_DAT_451b_0520 >> 0x10);
    if ((*(char *)((int)_DAT_451b_0520 + iVar3) == '#') &&
       (iVar2 = FUN_1000_4a40(iVar3 + (int)_DAT_451b_0520 + 1,uVar1,local_c), iVar2 == 0))
    goto LAB_71d6_1ff0;
  }
LAB_71d6_2002:
  FUN_1d28_07a9(DAT_451b_0524);
  return;
LAB_71d6_1ff0:
  if (7999 < iVar3) goto LAB_71d6_2002;
  uVar1 = (undefined2)((ulong)_DAT_451b_0520 >> 0x10);
  iVar2 = (int)_DAT_451b_0520;
  if (((*(char *)(iVar2 + iVar3) == '\0') && (uVar5 = param_3, iVar4 == 0)) ||
     ((*(char *)(iVar2 + iVar3) == '\0' && (uVar5 = param_4, iVar4 == 1)))) {
    FUN_1000_4a70(uVar5);
    iVar4 = iVar4 + 1;
  }
  else if ((*(char *)(iVar2 + iVar3) == '\0') && (iVar4 == 2)) {
    FUN_1000_4a70(param_5,iVar3 + iVar2 + 1,uVar1);
    goto LAB_71d6_2002;
  }
  iVar3 = iVar3 + 1;
  goto LAB_71d6_1ff0;
}

