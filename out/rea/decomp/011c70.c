
void FUN_1000_1c70(undefined2 param_1,int param_2,int param_3)

{
  undefined2 *puVar1;
  
  if (param_3 == 0) {
    while (DAT_4125_3a5c != 0) {
      DAT_4125_3a5c = DAT_4125_3a5c + -1;
      puVar1 = (undefined2 *)(DAT_4125_3a5c * 4 + 0x70d6);
      (*(code *)*puVar1)(0x1000);
    }
    FUN_1000_0157();
    (*DAT_4125_3b60)(0x1000);
  }
  FUN_1000_01c0();
  FUN_1000_016a();
  if (param_2 == 0) {
    if (param_3 == 0) {
      (*DAT_4125_3b64)(0x1000);
      (*DAT_4125_3b68)(0x1000);
    }
    FUN_1000_016b(param_1);
  }
  return;
}

