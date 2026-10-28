
bool __cdecl16far FUN_1000_095e(void)

{
  code *pcVar1;
  bool bVar2;
  
  bVar2 = false;
  pcVar1 = (code *)swi(0x21);
  (*pcVar1)();
  if (!bVar2) {
    pcVar1 = (code *)swi(0x21);
    (*pcVar1)();
  }
  return !bVar2;
}

