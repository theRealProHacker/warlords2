
void __cdecl16far FUN_177b_0161(uint param_1)

{
  if (((param_1 & 3) == 0) && (DAT_4125_124c != 0)) {
    FUN_177b_01a1(DAT_4125_1252,DAT_4125_1254,*(int *)(DAT_4125_124c * 2 + 0x125c) + DAT_4125_124e,
                  DAT_4125_1250);
    DAT_4125_124e = DAT_4125_124e + 1 & 3;
  }
  return;
}

