
uint __cdecl16far FUN_1000_200a(void)

{
  long lVar1;
  
  lVar1 = FUN_1000_1fc1();
  DAT_4125_3d86 = (uint)((ulong)(lVar1 + 1) >> 0x10);
  DAT_4125_3d84 = (int)(lVar1 + 1);
  return DAT_4125_3d86 & 0x7fff;
}

