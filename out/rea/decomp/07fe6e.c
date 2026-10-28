
void __cdecl16far FUN_7f3a_0ace(void)

{
  uint *puVar1;
  undefined2 in_AX;
  int in_BX;
  int unaff_BP;
  int unaff_SI;
  uint unaff_DI;
  undefined2 unaff_SS;
  
  puVar1 = (uint *)(in_BX + unaff_SI + 2);
  *puVar1 = *puVar1 | unaff_DI;
  *(undefined2 *)(unaff_BP + -4) = in_AX;
  *(undefined2 *)(unaff_BP + -6) = in_AX;
  if (*DAT_451b_1d82 < 1) {
    unaff_DI = 2;
    *(undefined2 *)(unaff_BP + -2) = 2;
  }
  FUN_18a9_066e(0x1d8,unaff_DI);
  FUN_18a9_066e(0x1d6,*(undefined2 *)(unaff_BP + -2));
  FUN_18a9_066e(0x1d7,*(undefined2 *)(unaff_BP + -6));
  FUN_18a9_066e(0x1d9,*(undefined2 *)(unaff_BP + -4));
  FUN_18a9_066e(0x101da);
  FUN_18a9_066e(0x101db);
  return;
}

