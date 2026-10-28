
undefined2 __cdecl16far FUN_1555_020e(int *param_1)

{
  char cVar1;
  bool bVar2;
  bool bVar3;
  undefined1 uVar4;
  int iVar5;
  int *piVar6;
  undefined2 uVar7;
  
  uVar7 = (undefined2)((ulong)param_1 >> 0x10);
  piVar6 = (int *)param_1;
  cVar1 = *(char *)(*(byte *)(piVar6[1] * 0xe0 + *param_1 * 2) + 0x710);
  iVar5 = (int)*(char *)(*(byte *)(piVar6[3] * 0xe0 + piVar6[2] * 2) + 0x710);
  if ((cVar1 == '\x02') || (cVar1 == '\x03')) {
    bVar2 = true;
  }
  else {
    bVar2 = false;
  }
  if ((iVar5 == 2) || (iVar5 == 3)) {
    bVar3 = true;
  }
  else {
    bVar3 = false;
  }
  if (piVar6[5] != 2) {
    if (((bVar2) && (!bVar3)) || ((!bVar2 && (bVar3)))) {
      return 0;
    }
    if (*(int *)(iVar5 * 2 + 0x1274) == 0) {
      return 0;
    }
  }
  uVar4 = FUN_1a8b_0ae4(*param_1,piVar6[1],piVar6[2],piVar6[3]);
  **(undefined1 **)(piVar6 + 6) = uVar4;
  return 1;
}

