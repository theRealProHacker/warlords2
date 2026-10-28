
undefined1 FUN_1000_2e84(undefined2 param_1,undefined2 param_2,int param_3,undefined1 *param_4)

{
  undefined1 *puVar1;
  byte bVar2;
  int iVar3;
  undefined2 unaff_SS;
  undefined4 uVar4;
  undefined2 local_a;
  undefined1 local_7;
  uint local_6;
  uint local_4;
  
  local_7 = 0;
  bVar2 = FUN_1000_3ea6();
  local_4 = (uint)bVar2;
  local_6 = FUN_1000_3ea6();
  local_6 = local_6 >> 8;
  while (puVar1 = param_4, iVar3 = param_3 + -1, param_3 != 0) {
    param_4 = (undefined1 *)CONCAT22(param_4._2_2_,(undefined1 *)param_4 + 1);
    local_7 = *puVar1;
    switch(local_7) {
    case 7:
      FUN_1000_300d();
      break;
    case 8:
      if ((int)(uint)DAT_4125_3e72 < (int)local_4) {
        local_4 = local_4 - 1;
      }
      break;
    default:
      if ((DAT_4125_3e7b == '\0') && (DAT_4125_3e81 != 0)) {
        local_a = CONCAT11(DAT_4125_3e76,local_7);
        uVar4 = FUN_1000_2dc0(local_6 + 1,local_4 + 1);
        FUN_1000_2de5(1,&local_a,unaff_SS,uVar4);
      }
      else {
        FUN_1000_300d();
        FUN_1000_300d();
      }
      local_4 = local_4 + 1;
      break;
    case 10:
      local_6 = local_6 + 1;
      break;
    case 0xd:
      local_4 = (uint)DAT_4125_3e72;
    }
    if ((int)(uint)DAT_4125_3e74 < (int)local_4) {
      local_4 = (uint)DAT_4125_3e72;
      local_6 = local_6 + DAT_4125_3e70;
    }
    param_3 = iVar3;
    if ((int)(uint)DAT_4125_3e75 < (int)local_6) {
      FUN_1000_3b9b(1,DAT_4125_3e75,DAT_4125_3e74,DAT_4125_3e73,DAT_4125_3e72,6);
      local_6 = local_6 - 1;
    }
  }
  FUN_1000_300d();
  return local_7;
}

