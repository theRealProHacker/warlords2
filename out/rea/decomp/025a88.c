
uint __cdecl16far FUN_255e_04a8(void)

{
  uint uVar1;
  
  if (DAT_4125_37a3 == '\0') {
    return 0;
  }
  uVar1 = FUN_1000_0cfd();
  if (uVar1 == 1) {
    return 1;
  }
  return uVar1 & 0xff00;
}

