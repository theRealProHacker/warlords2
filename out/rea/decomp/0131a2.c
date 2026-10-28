
void __cdecl16near FUN_1000_31a2(void)

{
  int in_DX;
  undefined2 uVar1;
  int iVar2;
  
  if (in_DX == DAT_1000_3196) {
LAB_1000_31e0:
    DAT_1000_3196 = 0;
    DAT_1000_3198 = 0;
    DAT_1000_319a = 0;
  }
  else {
    iVar2 = *(int *)&DAT_4125_0002;
    DAT_1000_3198 = iVar2;
    if (*(int *)&DAT_4125_0002 == 0) {
      in_DX = DAT_1000_3196;
      if (iVar2 != DAT_1000_3196) {
        DAT_1000_3198 = *(int *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
        uVar1 = 0;
        FUN_1000_3276(0,iVar2);
        goto LAB_1000_31fe;
      }
      goto LAB_1000_31e0;
    }
  }
  uVar1 = 0;
  iVar2 = in_DX;
LAB_1000_31fe:
  FUN_1000_363e(uVar1,iVar2);
  return;
}

