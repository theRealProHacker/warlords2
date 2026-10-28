
void __cdecl16far FUN_1000_02bb(void)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x66);
  (*pcVar1)(0x4125);
  return;
}

