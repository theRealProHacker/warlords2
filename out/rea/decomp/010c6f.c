
void __cdecl16far FUN_1000_0c6f(void)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x66);
  (*pcVar1)();
  return;
}

