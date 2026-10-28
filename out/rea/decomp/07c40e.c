
void __cdecl16far FUN_7b71_0cfe(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if ((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xc0) != 3)) {
      iVar1 = iVar1 + 1;
    }
  }
  if (iVar1 < 1) {
    thunk_FUN_7d9f_0b5f();
    FUN_7b71_0416();
  }
  else {
    FUN_7b71_2289();
    for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
      if (*(int *)(iVar1 * 2 + 0x137) == 0) {
        *(undefined2 *)(iVar1 * 2 + 0xd0) = 1;
        *(undefined2 *)(iVar1 * 2 + 0xc0) = 0;
      }
      if (*(int *)(iVar1 * 2 + 0xc0) == 3) {
        *(undefined2 *)(iVar1 * 2 + 0x137) = 0;
        *(undefined2 *)(iVar1 * 2 + 0xd0) = 1;
        *(undefined2 *)(iVar1 * 2 + 0xc0) = 0;
        iVar2 = thunk_FUN_824f_044a(*(undefined2 *)(iVar1 * 0x14 + 0x189),
                                    *(undefined2 *)(iVar1 * 0x14 + 0x18b));
        if (-1 < iVar2) {
          *(undefined1 *)(iVar2 * 0x41 + 0x1592) = 0xf;
        }
      }
      if (*(int *)(iVar1 * 2 + 0xd0) == 0) {
        *(undefined2 *)(iVar1 * 2 + 0xc0) = 2;
      }
    }
    thunk_FUN_7d9f_0000();
    thunk_FUN_7d9f_026f();
    DAT_3c04_011a = DAT_4125_23b4;
    DAT_3c04_011c = DAT_4125_23b6;
    DAT_3c04_011e = DAT_4125_23b8;
    DAT_3c04_0124 = DAT_4125_23ba;
    DAT_3c04_012a = DAT_4125_23bc;
    DAT_3c04_0132 = DAT_4125_23be;
    DAT_3c04_0126 = DAT_4125_23c0;
    DAT_3c04_0128 = DAT_4125_23c2;
    DAT_3c04_012c = DAT_4125_23c4;
    DAT_3c04_0122 = DAT_4125_23c6;
    DAT_3c04_0130 = 0;
    thunk_FUN_5d9f_0519();
    thunk_FUN_8027_0aeb();
    if (DAT_3c04_0124 != 0) {
      thunk_FUN_8027_0a6e();
    }
    thunk_FUN_8027_0000(0x10000);
  }
  return;
}

