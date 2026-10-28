
void __cdecl16far FUN_1000_1a6a(void)

{
  code *pcVar1;
  uint in_stack_0000000a;
  
  pcVar1 = (code *)swi(0x39);
  (*pcVar1)();
  if ((in_stack_0000000a & 0x7fff) != 0) {
    if ((int)in_stack_0000000a < 0) {
      pcVar1 = (code *)swi(0x39);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x39);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x3d);
      (*pcVar1)(0);
      FUN_1000_1aae(0x1000,1,0x3a48,0x4125,&stack0x0004);
    }
    else {
      pcVar1 = (code *)swi(0x35);
      (*pcVar1)();
    }
  }
  return;
}

