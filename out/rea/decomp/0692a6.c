
void __cdecl16far FUN_67a7_1836(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_SS;
  undefined4 local_12;
  undefined4 local_e;
  undefined1 local_a [8];
  
  iVar1 = 0;
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if ((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xd0) == 0)) {
      iVar1 = iVar1 + 1;
    }
  }
  if ((((iVar1 < 2) || (DAT_3c04_0124 == 0)) || (*(int *)(DAT_3c04_0110 * 2 + 0xd0) != 1)) &&
     (((DAT_3c04_0124 == 0 || (DAT_4125_3254 == 0)) || (*(char *)(param_2 * 0x70 + param_1) < '\0'))
     )) {
    thunk_FUN_891f_0227(DAT_3c04_017d,DAT_3c04_017f);
    thunk_FUN_85d0_0053();
    if (param_3 != 0) {
      FUN_1997_034a();
      FUN_1000_1d02(0xcfa,0x4125,&local_12,unaff_SS);
      if (DAT_3c04_0177 == param_1) {
        local_12 = CONCAT22(local_12._2_2_,(int)local_12 + 0x28);
        local_e = CONCAT22(local_e._2_2_,(int)local_e + -0x30);
      }
      if (DAT_3c04_017b == param_1) {
        local_e = CONCAT22(local_e._2_2_,(int)local_e + -0x30);
      }
      if (DAT_3c04_0175 == param_2) {
        local_12 = CONCAT22(local_12._2_2_ + 0x28,(int)local_12);
        local_e = CONCAT22(local_e._2_2_ + -0x28,(int)local_e);
      }
      if (DAT_3c04_0179 == param_2) {
        local_e = CONCAT22(local_e._2_2_ + -0x28,(int)local_e);
      }
      if (DAT_3c04_0177 == param_1) {
        iVar1 = 0;
      }
      else {
        iVar1 = 0x28;
      }
      if (DAT_3c04_0175 == param_2) {
        iVar2 = 0;
      }
      else {
        iVar2 = 0x28;
      }
      (*DAT_451b_2a68)(0x1000,0x5731,0x4125,local_12,local_e,0x6795,0x4125,
                       (param_1 - DAT_3c04_0177) * 0x28 - iVar1,
                       (param_2 - DAT_3c04_0175) * 0x28 - iVar2,0x56f6,0x4125,local_12);
    }
    FUN_22bf_07a5();
    FUN_216d_002e(local_a);
    FUN_24d0_009d(0x6795,0x4125,local_a);
    if ((*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) && (param_3 != 0)) {
      thunk_FUN_7d9f_0206();
    }
    FUN_22bf_0757();
    if (param_3 != 0) {
      thunk_FUN_85d0_1927();
    }
  }
  return;
}

