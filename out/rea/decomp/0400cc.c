
void FUN_400b_001c(void)

{
  char in_AL;
  int in_BX;
  int unaff_SI;
  
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + in_AL;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + in_AL;
  FUN_647b_0000();
  return;
}

