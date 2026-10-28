
undefined2 __cdecl16far FUN_1000_0543(void)

{
  code *pcVar1;
  undefined1 in_CF;
  
  pcVar1 = (code *)swi(0x21);
  (*pcVar1)();
  if (!(bool)in_CF) {
    return 1;
  }
  return 0;
}

