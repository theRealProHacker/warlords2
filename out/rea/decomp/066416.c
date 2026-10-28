
int * __cdecl16far FUN_6513_12e6(undefined2 param_1,int param_2,int param_3)

{
  byte *pbVar1;
  byte bVar2;
  int *piVar3;
  int extraout_DX;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined1 local_4a [22];
  undefined1 local_34;
  undefined1 local_2e;
  int local_c;
  int local_a;
  int local_8;
  undefined4 local_6;
  
  local_c = 10;
  thunk_FUN_705a_14ac(0x6513,param_1,local_4a);
  local_8 = 0;
  iVar4 = extraout_DX;
  iVar5 = param_2;
  iVar6 = param_3;
  do {
    while( true ) {
      if (local_8 != 0) {
        piVar3 = (int *)FUN_1b62_0309();
        local_6 = (int *)CONCAT22(iVar4,piVar3);
        *local_6 = param_2;
        piVar3[1] = param_3;
        *(undefined1 *)(piVar3 + 2) = (undefined1)param_1;
        *(undefined1 *)((int)piVar3 + 5) = (undefined1)DAT_3c04_0110;
        *(undefined1 *)(piVar3 + 3) = local_2e;
        *(undefined1 *)((int)piVar3 + 7) = local_2e;
        *(undefined1 *)(piVar3 + 4) = local_34;
        *(undefined1 *)((int)piVar3 + 9) = 0;
        *(undefined1 *)(piVar3 + 5) = 0;
        *(undefined1 *)((int)piVar3 + 0xb) = 0;
        FUN_1b62_02e2(piVar3,iVar4);
        bVar2 = (byte)DAT_3c04_0110;
        iVar4 = param_3 * 0xe0 + param_2 * 2;
        pbVar1 = (byte *)(iVar4 + 1);
        *pbVar1 = *pbVar1 & 0xf0;
        pbVar1 = (byte *)(iVar4 + 1);
        *pbVar1 = *pbVar1 | bVar2 & 0xf;
        return (int *)local_6;
      }
      FUN_1b62_007d(iVar5,iVar6,&local_a);
      if ((7 < local_a) ||
         ((iVar4 = 0x3c04, (*(byte *)(iVar6 * 0xe0 + iVar5 * 2 + 1) & 0xf) != DAT_3c04_0110 &&
          (local_a != 0)))) break;
      local_8 = 1;
      param_2 = iVar5;
      param_3 = iVar6;
    }
    iVar4 = thunk_FUN_7e8f_02bf(1,0xfffe0003);
    iVar5 = iVar5 + iVar4;
    iVar4 = thunk_FUN_7e8f_02bf(1,0xfffe0003);
    iVar4 = iVar6 + iVar4;
    local_c = local_c + -1;
    iVar6 = iVar4;
  } while (local_c != 0);
  return (int *)0x0;
}

