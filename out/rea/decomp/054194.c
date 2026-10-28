
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_53ff_01a4(void)

{
  bool bVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  int *piVar6;
  undefined2 in_DX;
  int iVar7;
  
  bVar1 = false;
  if (((DAT_451b_1f02 != (int *)0x0) &&
      (*(char *)(*(byte *)(((int *)DAT_451b_1f02)[1] * 0xe0 + *DAT_451b_1f02 * 2) + 0x710) == '\t'))
     && (iVar4 = FUN_170b_0006(0x3df,0x4125,2), -1 < iVar4)) {
    uVar5 = FUN_170b_00a9();
    DAT_451b_003c = uVar5;
    piVar6 = (int *)FUN_1d28_01d5();
    DAT_451b_003e = (int *)CONCAT22(in_DX,piVar6);
    FUN_170b_006d(iVar4,piVar6,in_DX,uVar5);
    FUN_170b_003a();
    piVar2 = DAT_451b_003e;
    iVar4 = *DAT_451b_003e;
    piVar6 = (int *)DAT_451b_003e + 1;
    DAT_451b_003e = (int *)CONCAT22(DAT_451b_003e._2_2_,piVar6);
    _DAT_451b_0036 = DAT_451b_003e;
    iVar3 = 0;
    do {
      iVar7 = iVar3;
      if ((piVar6[iVar7 * 0x34] == *DAT_451b_1f02) &&
         (piVar6[iVar7 * 0x34 + 1] == ((int *)DAT_451b_1f02)[1])) {
        bVar1 = true;
      }
    } while ((!bVar1) && (iVar3 = iVar7 + 1, iVar7 + 1 < iVar4));
    DAT_451b_003e = piVar2;
    if (bVar1) {
      DAT_451b_003a = iVar7;
      thunk_FUN_54e4_0000();
      FUN_53ff_02d7();
      DAT_4125_166a = 1;
      thunk_FUN_79c4_056a();
      FUN_53ff_03ae();
    }
    else {
      FUN_1d28_050d(piVar2);
    }
  }
  return;
}

