
void __cdecl16far FUN_6a62_116a(void)

{
  int iVar1;
  
  for (iVar1 = 0; iVar1 < 0x1d; iVar1 = iVar1 + 1) {
    *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar1 + 0x60b) = *(undefined1 *)(iVar1 + 0x6f3);
  }
  DAT_4125_0d56 = 0xffff;
  FUN_6a62_0e4a(1);
  FUN_6a62_1067();
  return;
}

