
void __cdecl16far thunk_FUN_8027_0e04(void)

{
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  if (DAT_4125_1176 == 0) {
    DAT_451b_1e60 = DAT_3c04_017d;
    DAT_451b_1e62 = DAT_3c04_017f;
    FUN_22bf_0b0c(&iStack_8);
    DAT_451b_1e58 = 0;
    DAT_451b_1e5c = 0;
  }
  else {
    FUN_22bf_0b0c(&iStack_8);
    DAT_451b_1e58 = DAT_451b_1e58 - iStack_8;
    DAT_451b_1e5c = DAT_451b_1e5c - iStack_a / 2;
    iStack_4 = (int)(DAT_451b_1e58 / 0x28);
    iStack_6 = (int)(DAT_451b_1e5c / 0x28);
    if ((DAT_3c04_017d != DAT_451b_1e60 + iStack_4) || (DAT_3c04_017f != DAT_451b_1e62 + iStack_6))
    {
      thunk_FUN_85d0_0629(DAT_451b_1e60 + iStack_4,DAT_451b_1e62 + iStack_6);
    }
  }
  return;
}

