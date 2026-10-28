
uint __cdecl16far FUN_1000_33ea(uint param_1,uint param_2)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  
  DAT_1000_319c = 0x4125;
  if (param_1 != 0 || param_2 != 0) {
    uVar2 = param_2 + (0xffec < param_1);
    if ((CARRY2(param_2,(uint)(0xffec < param_1))) || ((uVar2 & 0xfff0) != 0)) {
      param_1 = 0;
    }
    else {
      uVar2 = CONCAT11((byte)(param_1 + 0x13 >> 0xc) | (char)uVar2 * '\x10',
                       (char)(param_1 + 0x13 >> 4));
      if (DAT_1000_3196 == 0) {
        param_1 = FUN_1000_32ff();
      }
      else {
        iVar3 = DAT_1000_319a;
        if (DAT_1000_319a != 0) {
          do {
            if (uVar2 <= *(uint *)0x0) {
              if (*(uint *)0x0 <= uVar2) {
                FUN_1000_3276();
                *(undefined2 *)&DAT_4125_0002 =
                     *(undefined2 *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
                return 4;
              }
              uVar2 = FUN_1000_33bd();
              return uVar2;
            }
            piVar1 = (int *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 2);
            iVar3 = *piVar1;
          } while (*piVar1 != DAT_1000_319a);
        }
        param_1 = FUN_1000_3363();
      }
    }
  }
  return param_1;
}

