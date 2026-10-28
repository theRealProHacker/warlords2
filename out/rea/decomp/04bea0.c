
void __cdecl16far FUN_4bea_0000(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  undefined2 in_DX;
  undefined2 uVar4;
  
  FUN_22bf_07a5();
  FUN_4bea_01b5();
  uVar2 = FUN_1d28_011f(0xa560,0x20,0x29b,0);
  uVar4 = in_DX;
  DAT_451b_002a._0_2_ = FUN_1d28_069a(uVar2,in_DX);
  DAT_451b_002a._2_2_ = uVar4;
  iVar3 = FUN_170b_0006(0x262,0x4125,2);
  if (iVar3 < 0) {
    FUN_1000_43ac(0x274,0x4125);
    FUN_1a4c_02b5();
  }
  else {
    FUN_170b_006d();
    FUN_170b_003a(iVar3);
    uVar4 = DAT_451b_002a._2_2_;
    iVar3 = (int)DAT_451b_002a;
    *(int *)((int)DAT_451b_002a + 0x2a) =
         *(int *)((int)DAT_451b_002a + 0x2a) + *(int *)((int)DAT_451b_002a + param_3 * 2 + 0x6e);
    iVar1 = (int)DAT_451b_002a;
    *(int *)((int)DAT_451b_002a + 0x3c) =
         *(int *)((int)DAT_451b_002a + 0x3c) + *(int *)(iVar3 + param_4 * 2 + 0x60);
    iVar3 = (int)DAT_451b_002a;
    *(int *)((int)DAT_451b_002a + 0x36) =
         *(int *)((int)DAT_451b_002a + 0x36) + *(int *)(iVar1 + param_2 * 2 + 0x44);
    iVar1 = (int)DAT_451b_002a;
    *(int *)((int)DAT_451b_002a + 0x34) =
         *(int *)((int)DAT_451b_002a + 0x34) + *(int *)(iVar3 + param_2 * 2 + 0x44);
    iVar3 = (int)DAT_451b_002a;
    *(int *)((int)DAT_451b_002a + 0x38) =
         *(int *)((int)DAT_451b_002a + 0x38) + *(int *)(iVar1 + param_1 * 2 + 0x52);
    *(int *)((int)DAT_451b_002a + 0x3a) =
         *(int *)((int)DAT_451b_002a + 0x3a) + *(int *)(iVar3 + param_1 * 2 + 0x52);
    FUN_4bea_011c();
    FUN_1d28_07a9(uVar2,in_DX);
    FUN_1d28_048e(uVar2,in_DX);
    FUN_22bf_0757();
  }
  return;
}

