
/* WARNING: Control flow encountered bad instruction data */

void FUN_407f_00ab(void)

{
  byte in_AL;
  int in_BX;
  int unaff_SI;
  byte in_AF;
  
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + in_AL;
  *(char *)(in_BX + unaff_SI) =
       *(char *)(in_BX + unaff_SI) + (in_AL + (9 < (in_AL & 0xf) | in_AF) * -6 & 0xf);
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

