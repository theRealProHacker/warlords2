
undefined1 * __cdecl16far FUN_7b71_20dc(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  int iVar3;
  undefined2 unaff_SS;
  int local_42 [9];
  undefined1 local_30 [40];
  int local_8;
  undefined4 local_6;
  
  DAT_451b_1d28 = 0;
  FUN_7b71_21c1(DAT_4125_2563,0,local_30);
  iVar1 = FUN_170b_0006(local_30);
  if (-1 < iVar1) {
    local_8 = FUN_170b_00a9();
    uVar2 = FUN_1d28_01d5();
    local_6 = CONCAT22(in_DX,uVar2);
    FUN_170b_006d(iVar1,uVar2,in_DX,local_8);
    FUN_170b_003a();
    local_42[0] = 0;
    iVar3 = 1;
    iVar1 = 0;
    while( true ) {
      if ((local_8 <= iVar1) || (8 < iVar3)) break;
      if (*(char *)((int)local_6 + iVar1) == '\r') {
        *(undefined1 *)((int)local_6 + iVar1) = 0;
        iVar1 = iVar1 + 2;
        local_42[iVar3] = iVar1;
        iVar3 = iVar3 + 1;
      }
      iVar1 = iVar1 + 1;
    }
    if (param_1 < iVar3 + -1) {
      FUN_1000_4a70((undefined1 *)&DAT_451b_1d28,0x4125,(int)local_6 + local_42[param_1],
                    local_6._2_2_);
    }
    FUN_1d28_050d(local_6);
  }
  return (undefined1 *)&DAT_451b_1d28;
}

