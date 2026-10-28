
void FUN_5efd_0eeb(void)

{
  int *in_BX;
  int unaff_BP;
  int unaff_DI;
  undefined2 unaff_SS;
  
  *(char *)(unaff_BP + unaff_DI) = *(char *)(unaff_BP + unaff_DI) + -0x28;
  *in_BX = unaff_DI;
  if (unaff_DI != 0) {
    FUN_5efd_0e73();
    return;
  }
  FUN_4fe5_01b4();
  return;
}

