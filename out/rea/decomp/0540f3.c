
void __cdecl16far FUN_53ff_0103(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  undefined1 local_2e [40];
  undefined4 local_6;
  
  FUN_1000_4944(local_2e);
  iVar1 = FUN_170b_0006(local_2e);
  if (-1 < iVar1) {
    uVar2 = FUN_170b_00a9(iVar1);
    uVar3 = FUN_1d28_01d5(uVar2);
    local_6 = CONCAT22(in_DX,uVar3);
    if (local_6 != 0) {
      FUN_170b_006d(iVar1,uVar3,in_DX,uVar2);
      FUN_170b_003a(iVar1);
      iVar1 = FUN_170b_0006(0x3d3,0x4125,9);
      if (-1 < iVar1) {
        FUN_170b_004e(iVar1,(int)local_6,(int)((ulong)local_6 >> 0x10),uVar2);
        FUN_170b_003a(iVar1);
        FUN_1d28_050d((int)local_6,(int)((ulong)local_6 >> 0x10));
      }
    }
  }
  return;
}

