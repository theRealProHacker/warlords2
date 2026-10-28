
void __cdecl16far FUN_1000_02b5(void)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x66);
  (*pcVar1)();
  return;
}

