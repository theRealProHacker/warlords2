
undefined2 __cdecl16far FUN_1000_3547(undefined2 param_1,int param_2,uint param_3)

{
  uint uVar1;
  undefined2 uVar2;
  
  DAT_1000_319c = 0x4125;
  DAT_1000_319e = 0;
  DAT_1000_31a0 = param_3;
  if (param_2 == 0) {
    uVar2 = FUN_1000_33ea(param_3,0);
  }
  else if (param_3 == 0) {
    FUN_1000_32d6(0,param_2);
    uVar2 = 0;
  }
  else {
    uVar1 = CONCAT11((byte)(param_3 + 0x13 >> 0xc) | (0xffec < param_3) << 4,
                     (char)(param_3 + 0x13 >> 4));
    if (*(uint *)0x0 < uVar1) {
      uVar2 = FUN_1000_3467();
    }
    else if (*(uint *)0x0 == uVar1) {
      uVar2 = 4;
    }
    else {
      uVar2 = FUN_1000_34e3();
    }
  }
  return uVar2;
}

