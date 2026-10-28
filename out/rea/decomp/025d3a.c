
int __cdecl16far FUN_255e_075a(void)

{
  int iVar1;
  
  if (DAT_4125_37a2 == '\0') {
    return 0;
  }
  if (DAT_4125_37ab != '\0') {
    return (uint)(byte)(DAT_4125_37a2 >> 7) << 8;
  }
  iVar1 = FUN_1000_02b5();
  return iVar1;
}

