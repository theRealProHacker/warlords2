
void __cdecl16far FUN_255e_02ab(void)

{
  char cVar1;
  
  if (DAT_4125_379e != -1) {
    cVar1 = FUN_255e_04a8();
    if (cVar1 == '\0') {
      if ((DAT_4125_37a9 & 1) == 0) {
        if ((DAT_4125_37a9 & 2) == 0) {
          FUN_255e_0466();
        }
        else {
          FUN_255e_0466();
        }
      }
      else {
        FUN_255e_0412(DAT_4125_379e,DAT_4125_37a9);
      }
    }
  }
  if (DAT_4125_37a0 != -1) {
    cVar1 = FUN_255e_075a();
    if (cVar1 == '\0') {
      if ((DAT_4125_37a7 & 1) != 0) {
        FUN_255e_065e(DAT_4125_37a0,DAT_4125_37a7);
        return;
      }
      if ((DAT_4125_37a7 & 2) != 0) {
        FUN_255e_06f7();
        DAT_4125_37a0 = 0xffff;
        return;
      }
      DAT_4125_37a0 = -1;
    }
  }
  return;
}

