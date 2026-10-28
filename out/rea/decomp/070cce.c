
void __cdecl16far FUN_705a_072e(undefined2 param_1,undefined2 param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_SS;
  int local_16 [4];
  int local_e;
  undefined1 local_c [8];
  int local_4;
  
  if ((param_3 == 1) && ((bRam00000417 & 3) != 0)) {
    FUN_705a_028b(param_1,param_2,1);
    DAT_4125_0e94 = 0;
  }
  else {
    iVar1 = thunk_FUN_824f_0651(param_1,param_2);
    FUN_705a_0410(iVar1,local_c);
    FUN_705a_0410(DAT_4125_0e98,local_16);
    if (((DAT_4125_0e94 == 2) &&
        ((((0 < local_e && (local_e + local_4 < 5)) && (local_16[0] != iVar1)) &&
         ((local_16[1] != iVar1 && (local_16[2] != iVar1)))))) && (local_16[3] != iVar1)) {
      for (iVar2 = 0; iVar2 < local_e; iVar2 = iVar2 + 1) {
        if (iVar1 < 100) {
          *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + local_16[iVar2] * 0x41) =
               *(undefined2 *)(iVar1 * 0x41 + 0x157d);
          *(undefined2 *)(local_16[iVar2] * 0x41 + 0x15b2) = *(undefined2 *)(iVar1 * 0x41 + 0x157f);
        }
        else {
          *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + local_16[iVar2] * 0x41) = 0xfffe;
          *(undefined2 *)(local_16[iVar2] * 0x41 + 0x15b2) = 0xfffe;
        }
      }
    }
    if (DAT_4125_0e94 == 1) {
      FUN_705a_028b(param_1,param_2,param_3);
    }
    iVar2 = DAT_4125_0e98;
    if ((DAT_4125_0e94 != 1) && (iVar1 < 100)) {
      iVar2 = iVar1;
    }
    DAT_4125_0e94 = 0;
    thunk_FUN_71d6_0000(3,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                        *(undefined2 *)(iVar2 * 0x41 + 0x157f));
    FUN_705a_08e4();
    FUN_705a_0638(0);
    FUN_705a_0638(1);
    thunk_FUN_71d6_03a9();
  }
  return;
}

