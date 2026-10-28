
void __cdecl16far FUN_255e_06f7(void)

{
  int iVar1;
  
  if (((DAT_4125_37a2 != '\0') && (DAT_4125_37ab == '\0')) && (DAT_4125_37a0 != -1)) {
    do {
      iVar1 = FUN_1000_02b5();
    } while (iVar1 != 0);
    if ((DAT_4125_37a7 & 2) != 0) {
      FUN_255e_061e(DAT_4125_37a0);
    }
    DAT_4125_37a0 = -1;
    DAT_4125_37a7 = 0;
  }
  return;
}

