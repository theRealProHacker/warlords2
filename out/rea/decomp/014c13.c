
/* WARNING: Removing unreachable block (ram,0x00014d99) */
/* WARNING: Removing unreachable block (ram,0x00014ccb) */
/* WARNING: Removing unreachable block (ram,0x00014e02) */

void __cdecl16far FUN_1000_4c13(uint param_1,int param_2,uint *param_3,undefined1 *param_4)

{
  int iVar1;
  char cVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  undefined1 *puVar7;
  undefined2 uVar8;
  undefined4 uVar9;
  long lVar10;
  long lVar11;
  undefined2 uVar12;
  
  FUN_1000_4e17();
  iVar4 = param_1 - (DAT_4125_3f08 + 0xa600);
  iVar1 = (param_2 - (DAT_4125_3f0a + 0x12ce + (uint)(0x59ff < DAT_4125_3f08))) -
          (uint)(param_1 < DAT_4125_3f08 + 0xa600);
  uVar8 = (undefined2)((ulong)param_4 >> 0x10);
  puVar7 = (undefined1 *)param_4;
  puVar7[2] = 0;
  uVar3 = FUN_1000_1d53(iVar4,iVar1,0x3c,0);
  puVar7[3] = uVar3;
  uVar9 = FUN_1000_1d44(iVar4,iVar1,0x3c,0);
  uVar3 = FUN_1000_1d53(uVar9,0x3c,0);
  *param_4 = uVar3;
  uVar9 = FUN_1000_1d44(uVar9,0x3c,0);
  iVar4 = FUN_1000_1d44(uVar9,0x88f8,0);
  *param_3 = iVar4 * 4 + 0x7bc;
  lVar10 = FUN_1000_1d53(uVar9,0x88f8,0);
  if (0x224f < lVar10) {
    iVar4 = (uint)lVar10 + 0xddb0;
    iVar1 = (int)((ulong)lVar10 >> 0x10) - (uint)((uint)lVar10 < 0x2250);
    *param_3 = *param_3 + 1;
    iVar5 = FUN_1000_1d44(iVar4,iVar1,0x2238,0);
    *param_3 = *param_3 + iVar5;
    lVar10 = FUN_1000_1d53(iVar4,iVar1,0x2238,0);
  }
  if (DAT_4125_3f0c != 0) {
    uVar12 = 0;
    uVar6 = FUN_1000_1d53(lVar10,0x18,0);
    uVar6 = FUN_1000_1d44(lVar10,0x18,0,uVar6);
    iVar4 = FUN_1000_5005(*param_3 - 0x7b2,0,uVar6,uVar12);
    if (iVar4 != 0) {
      lVar10 = lVar10 + 1;
    }
  }
  uVar3 = FUN_1000_1d53(lVar10,0x18,0);
  puVar7[1] = uVar3;
  lVar11 = FUN_1000_1d44(lVar10,0x18,0);
  lVar10 = lVar11 + 1;
  uVar8 = (undefined2)((ulong)param_3 >> 0x10);
  if ((*param_3 & 3) == 0) {
    if (lVar10 < 0x3d) {
      if (lVar10 == 0x3c) {
        *(undefined1 *)((int)(uint *)param_3 + 3) = 2;
        *(undefined1 *)((uint *)param_3 + 1) = 0x1d;
        return;
      }
    }
    else {
      lVar10 = CONCAT22((int)((ulong)lVar10 >> 0x10) - (uint)((int)lVar10 == 0),(int)lVar11);
    }
  }
  *(undefined1 *)((int)(uint *)param_3 + 3) = 0;
  for (; (int)*(char *)(*(char *)((int)(uint *)param_3 + 3) + 0x3eda) < lVar10;
      lVar10 = lVar10 - (int)cVar2) {
    cVar2 = *(char *)(*(char *)((int)(uint *)param_3 + 3) + 0x3eda);
    *(char *)((int)(uint *)param_3 + 3) = *(char *)((int)(uint *)param_3 + 3) + '\x01';
  }
  *(char *)((int)(uint *)param_3 + 3) = *(char *)((int)(uint *)param_3 + 3) + '\x01';
  param_1._0_1_ = (undefined1)lVar10;
  *(undefined1 *)((uint *)param_3 + 1) = (undefined1)param_1;
  return;
}

