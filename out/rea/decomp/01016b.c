
bool __cdecl16far FUN_1000_016b(void)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  int in_BX;
  int unaff_SI;
  undefined2 uVar4;
  
  pcVar1 = (code *)swi(0x21);
  (*pcVar1)();
  FUN_1000_0272();
  cVar2 = FUN_1000_1cd6();
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar2;
  uVar4 = 0;
  iVar3 = FUN_1000_0391();
  if (iVar3 != 0) {
    pcVar1 = (code *)swi(0x66);
    (*pcVar1)(uVar4);
  }
  return iVar3 != 0;
}

