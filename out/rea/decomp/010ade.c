
int __cdecl16far FUN_1000_0ade(char *param_1)

{
  char *pcVar1;
  code *pcVar2;
  char cVar3;
  uint uVar4;
  char *unaff_ES;
  undefined2 uVar5;
  undefined2 uVar6;
  
  uVar6 = 0x4125;
  uVar5 = (undefined2)((ulong)param_1 >> 0x10);
  pcVar2 = (code *)swi(0x21);
  cVar3 = (*pcVar2)();
  *param_1 = cVar3 + 'A';
  ((char *)param_1)[1] = ':';
  ((char *)param_1)[2] = '\\';
  pcVar2 = (code *)swi(0x21);
  (*pcVar2)(uVar6);
  uVar4 = 0xffff;
  do {
    if (uVar4 == 0) break;
    uVar4 = uVar4 - 1;
    pcVar1 = unaff_ES;
    unaff_ES = unaff_ES + 1;
  } while (*pcVar1 != '\0');
  return ~uVar4 - 1;
}

