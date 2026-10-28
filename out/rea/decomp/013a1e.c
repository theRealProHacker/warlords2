
void FUN_1000_3a1e(int param_1,undefined2 *param_2,undefined2 *param_3)

{
  undefined2 uVar1;
  undefined2 unaff_SS;
  bool bVar2;
  bool bVar3;
  undefined2 local_8;
  undefined2 local_6;
  undefined2 local_4;
  
  local_8 = FUN_1000_3ea6();
  bVar2 = param_3._2_2_ == DAT_4125_3e7f;
  if (bVar2) {
    local_4 = FUN_1000_39b2((undefined2 *)param_3,param_3._2_2_);
  }
  bVar3 = param_2._2_2_ == DAT_4125_3e7f;
  if (bVar3) {
    local_6 = FUN_1000_39b2((undefined2 *)param_2,param_2._2_2_);
  }
  while (param_1 != 0) {
    if (bVar3) {
      FUN_1000_39ea(&local_8,unaff_SS,&local_6,unaff_SS);
      uVar1 = FUN_1000_300d();
    }
    else {
      uVar1 = *param_2;
      param_2 = (undefined2 *)CONCAT22(param_2._2_2_,(undefined2 *)param_2 + 1);
    }
    if (bVar2) {
      FUN_1000_39ea(&local_8,unaff_SS,&local_4,unaff_SS);
      FUN_1000_300d();
      param_1 = param_1 + -1;
    }
    else {
      *param_3 = uVar1;
      param_3 = (undefined2 *)CONCAT22(param_3._2_2_,(undefined2 *)param_3 + 1);
      param_1 = param_1 + -1;
    }
  }
  FUN_1000_300d();
  return;
}

