
int __cdecl16far FUN_1000_2e5f(byte param_1)

{
  code *pcVar1;
  int iVar2;
  bool bVar3;
  
  bVar3 = true;
  pcVar1 = (code *)swi(0x16);
  iVar2 = (*pcVar1)();
  if (bVar3) {
    if ((param_1 & 1) != 0) {
      iVar2 = 0;
    }
  }
  else if (((param_1 & 1) == 0) && (iVar2 == 0)) {
    iVar2 = -1;
  }
  return iVar2;
}

