
int __cdecl16far FUN_1000_4a99(char *param_1)

{
  char *pcVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  
  iVar5 = (int)((ulong)param_1 >> 0x10);
  pcVar4 = (char *)param_1;
  iVar2 = 0;
  if ((iVar5 != 0) || (pcVar4 != (char *)0x0)) {
    uVar3 = 0xffff;
    do {
      if (uVar3 == 0) break;
      uVar3 = uVar3 - 1;
      pcVar1 = pcVar4;
      pcVar4 = pcVar4 + 1;
    } while (*pcVar1 != '\0');
    iVar2 = ~uVar3 - 1;
  }
  return iVar2;
}

