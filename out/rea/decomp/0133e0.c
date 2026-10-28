
/* WARNING: Removing unreachable block (ram,0x00013449) */

undefined2 __cdecl16far FUN_1000_33e0(uint param_1)

{
  int *piVar1;
  uint uVar2;
  undefined2 uVar3;
  int iVar4;
  
  DAT_1000_319c = 0x4125;
  uVar3 = 0;
  if (param_1 != 0) {
    uVar2 = CONCAT11((byte)(param_1 + 0x13 >> 0xc) | (0xffec < param_1) << 4,
                     (char)(param_1 + 0x13 >> 4));
    if (DAT_1000_3196 == 0) {
      uVar3 = FUN_1000_32ff();
    }
    else {
      iVar4 = DAT_1000_319a;
      if (DAT_1000_319a != 0) {
        do {
          if (uVar2 <= *(uint *)0x0) {
            if (*(uint *)0x0 <= uVar2) {
              FUN_1000_3276();
              *(undefined2 *)&DAT_4125_0002 =
                   *(undefined2 *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 4);
              return 4;
            }
            uVar3 = FUN_1000_33bd();
            return uVar3;
          }
          piVar1 = (int *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 2);
          iVar4 = *piVar1;
        } while (*piVar1 != DAT_1000_319a);
      }
      uVar3 = FUN_1000_3363();
    }
  }
  return uVar3;
}

