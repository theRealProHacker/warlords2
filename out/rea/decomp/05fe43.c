
void FUN_5efd_0e73(void)

{
  undefined2 uVar1;
  int unaff_BP;
  int unaff_DI;
  undefined2 unaff_SS;
  
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x5e) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0xbe) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x2e) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x8e) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x4e) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x3e) = 0;
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0xae) = 0;
  uVar1 = thunk_FUN_7e8f_02bf(1,10);
  *(undefined2 *)(unaff_DI * 2 + unaff_BP + -0x6e) = uVar1;
  *(int *)(unaff_DI * 2 + unaff_BP + -0x7e) = unaff_DI;
  if (unaff_DI != 0) {
    FUN_5efd_0e73();
    return;
  }
  FUN_4fe5_01b4();
  return;
}

