
int __cdecl16far FUN_7e8f_02bf(uint param_1,int param_2,int param_3)

{
  undefined2 *puVar1;
  code *pcVar2;
  char cVar3;
  undefined2 uVar4;
  int in_BX;
  undefined2 *puVar5;
  int iVar6;
  undefined2 unaff_ES;
  undefined2 unaff_SS;
  char cVar7;
  undefined2 uVar8;
  undefined2 uVar9;
  
  puVar5 = (undefined2 *)&stack0xfffe;
  uVar8 = 0;
  if (DAT_4125_2678 == 0) {
    DAT_4125_2678 = 1;
    FUN_7e8f_0356();
  }
  if (param_2 != 0) {
    uVar9 = 0;
    iVar6 = param_3;
    while (cVar7 = (uint)puVar5[-1] < param_1, (int)puVar5[-1] < (int)param_1) {
      uVar4 = FUN_1000_200a();
      puVar5[-3] = uVar4;
      pcVar2 = (code *)swi(0x3b);
      (*pcVar2)();
      pcVar2 = (code *)swi(0x34);
      (*pcVar2)(uVar8,uVar9);
      puVar5[-3] = puVar5[4];
      pcVar2 = (code *)swi(0x3b);
      (*pcVar2)();
      pcVar2 = (code *)swi(0x3a);
      (*pcVar2)();
      puVar5 = (undefined2 *)*puVar5;
      pcVar2 = (code *)swi(0x35);
      (*pcVar2)();
      cVar3 = FUN_71d6_0975();
      puVar1 = (undefined2 *)((int)puVar5 + iVar6 + 0x1b59);
      *puVar1 = *puVar1;
      *(char *)(in_BX + param_1) = *(char *)(in_BX + param_1) + cVar3 + cVar7;
      iVar6 = iVar6 + 3;
      puVar5[-1] = puVar5[-1] + 1;
    }
    param_3 = puVar5[-2] + iVar6;
    if (param_3 < (int)(param_1 + iVar6)) {
      param_3 = param_1 + iVar6;
    }
    else if ((int)(param_1 * puVar5[4] + iVar6) < param_3) {
      param_3 = param_1 * puVar5[4] + iVar6;
    }
  }
  return param_3;
}

