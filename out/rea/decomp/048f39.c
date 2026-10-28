
void __cdecl16far FUN_484d_0a69(byte param_1,int param_2)

{
  byte *pbVar1;
  
  if ((*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) && (DAT_3c04_0110 <= param_2)) {
    param_2 = param_2 + 1;
  }
  param_2 = DAT_3c04_0110 * 8 + param_2;
  pbVar1 = (byte *)(param_2 + 0x153b);
  *pbVar1 = *pbVar1 & 0xf3;
  pbVar1 = (byte *)(param_2 + 0x153b);
  *pbVar1 = *pbVar1 | (param_1 & 3) << 2;
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    FUN_22bf_07a5();
    FUN_484d_0382(1);
    FUN_484d_09d4();
    FUN_22bf_0757();
  }
  return;
}

