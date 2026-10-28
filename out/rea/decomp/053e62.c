
undefined2 __cdecl16far FUN_5304_0e22(undefined4 param_1,int *param_2,int *param_3)

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  int local_6;
  int local_4;
  
  do {
    iVar6 = 0x50;
    do {
      iVar5 = (int)param_1;
      uVar8 = (undefined2)((ulong)param_1 >> 0x10);
      iVar3 = -1;
      if (iVar6 == 0) break;
      iVar3 = thunk_FUN_7e8f_02bf(1,DAT_3c04_157b,0xffff);
      iVar6 = iVar6 + -1;
    } while (*(char *)(iVar5 + iVar3 + 600) != '\0');
    if (iVar3 == -1) {
      return 0;
    }
    *(undefined1 *)(iVar5 + iVar3 + 600) = 1;
    uVar1 = *(undefined2 *)(iVar3 * 0x41 + 0x157d);
    uVar2 = *(undefined2 *)(iVar3 * 0x41 + 0x157f);
    local_6 = -1;
    local_4 = -1;
    iVar6 = DAT_3c04_157b;
    while (iVar7 = iVar6 + -1, iVar6 != 0) {
      iVar6 = iVar7;
      if ((((*(char *)(iVar5 + iVar7 + 600) == '\0') &&
           (iVar4 = FUN_1a8b_0acc(uVar1,uVar2), 0x1d < iVar4)) && (iVar4 < 0x47)) &&
         (iVar4 = thunk_FUN_7e8f_02bf(1), local_4 < iVar4)) {
        local_6 = iVar7;
        local_4 = iVar4;
      }
    }
    if (local_6 != -1) {
      *(undefined1 *)(iVar5 + local_6 + 600) = 1;
      *param_2 = iVar3;
      *param_3 = local_6;
      return 1;
    }
  } while( true );
}

