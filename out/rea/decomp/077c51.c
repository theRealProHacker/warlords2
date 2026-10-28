
void __cdecl16far FUN_76ef_0d61(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  long lVar5;
  undefined2 in_DX;
  undefined2 uVar6;
  undefined2 local_a;
  undefined4 local_6;
  
  iVar1 = FUN_170b_0006((int)param_1,(int)((ulong)param_1 >> 0x10),2);
  if (-1 < iVar1) {
    iVar2 = FUN_170b_0006((int)param_2,(int)((ulong)param_2 >> 0x10),9);
    if (iVar2 < 0) {
      FUN_170b_003a(iVar1);
    }
    else {
      uVar3 = FUN_170b_00a9(iVar1);
      uVar6 = in_DX;
      uVar4 = FUN_1d28_01d5(30000);
      for (local_6 = CONCAT22(in_DX,uVar3); 0 < local_6; local_6 = local_6 - lVar5) {
        FUN_170b_006d(iVar1,uVar4,uVar6,30000);
        lVar5 = local_6;
        if (29999 < local_6) {
          lVar5 = 30000;
        }
        local_a = (undefined2)lVar5;
        FUN_170b_004e(iVar2,uVar4,uVar6,local_a);
      }
      FUN_170b_003a(iVar1);
      FUN_170b_003a(iVar2);
      FUN_1d28_050d(uVar4,uVar6);
    }
  }
  return;
}

