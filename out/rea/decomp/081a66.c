
void __cdecl16far FUN_8027_17f6(void)

{
  bool bVar1;
  
  bVar1 = false;
  while (!bVar1) {
    if (DAT_3c04_0118 != 0) {
      DAT_3c04_0135 = DAT_3c04_0135 + 1;
      FUN_8027_1732();
      DAT_3c04_0118 = 0;
      FUN_8027_18ab();
      FUN_8027_1aed();
      thunk_FUN_63d6_0034();
      thunk_FUN_6bb0_025a();
      thunk_FUN_6d27_0d60();
      thunk_FUN_8c81_0952(1);
    }
    DAT_3c04_0110 = *(int *)(DAT_3c04_0173 * 2 + 0x163);
    DAT_3c04_0173 = DAT_3c04_0173 + 1;
    if (7 < DAT_3c04_0173) {
      DAT_3c04_0118 = 1;
    }
    if (*(int *)(DAT_3c04_0110 * 2 + 0x137) != 0) {
      bVar1 = true;
    }
  }
  return;
}

