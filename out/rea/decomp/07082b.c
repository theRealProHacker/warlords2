
void __cdecl16far FUN_705a_028b(undefined2 param_1,undefined2 param_2,int param_3)

{
  int iVar1;
  undefined1 local_e [8];
  int local_6;
  int local_4;
  
  if (((param_3 == 1) && ((bRam00000417 & 3) == 0)) && (DAT_4125_0e94 == 0)) {
    local_4 = thunk_FUN_824f_04fa(param_1,param_2,DAT_3c04_0110,0);
    if (local_4 != DAT_4125_0e98) {
      thunk_FUN_71d6_0000();
    }
  }
  else {
    if (*(char *)(DAT_4125_0e98 * 0x41 + 0x15aa) < '\x01') {
      return;
    }
    iVar1 = thunk_FUN_824f_0651(param_1,param_2);
    FUN_705a_0410(iVar1,local_e);
    if (iVar1 == DAT_4125_0e98) {
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + DAT_4125_0e98 * 0x41) = 0;
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + DAT_4125_0e98 * 0x41) = 0xffff;
      *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x15b2) = 0xffff;
    }
    else {
      if (3 < local_6) goto LAB_705a_0407;
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + DAT_4125_0e98 * 0x41) = 1;
      if (iVar1 < 100) {
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + DAT_4125_0e98 * 0x41) =
             *(undefined2 *)(iVar1 * 0x41 + 0x157d);
        *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x15b2) = *(undefined2 *)(iVar1 * 0x41 + 0x157f);
      }
      else {
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + DAT_4125_0e98 * 0x41) = 0xfffe;
        *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x15b2) = 0xfffe;
      }
    }
    thunk_FUN_54e4_07e4(0x280000,0x320000);
    thunk_FUN_71d6_06de(0x3fac,0);
    thunk_FUN_71d6_1a9b();
  }
LAB_705a_0407:
  thunk_FUN_71d6_03a9();
  return;
}

