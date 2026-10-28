
void __cdecl16far FUN_1000_0e4d(void)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x21);
  (*pcVar1)();
  FUN_1000_1cd6();
  return;
}

