
void __cdecl16far FUN_7f3a_067c(int param_1)

{
  if (-1 < param_1) {
    FUN_7f3a_06c8(param_1,0x5d64,0x4125);
    FUN_1000_4a70((char *)s_Illuria__4125_1672,0x4125,0x5da0,0x4125);
    FUN_1000_4a01((char *)s_Illuria__4125_1672,0x4125,0x2a7a,0x4125);
                    /* WARNING: Read-only address (ram,0x00043b1e) is written */
    iRam00043b1e = param_1;
                    /* WARNING: Read-only address (ram,0x00043b18) is written */
    uRam00043b18 = 0;
  }
  FUN_7f3a_0000(0);
  return;
}

