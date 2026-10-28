
void __cdecl16far FUN_1000_08f8(char *param_1)

{
  char *pcVar1;
  char cVar2;
  uint uVar3;
  char *pcVar4;
  char *pcVar5;
  undefined2 uVar6;
  
  uVar6 = (undefined2)((ulong)param_1 >> 0x10);
  pcVar4 = (char *)param_1;
  uVar3 = 0xffff;
  pcVar5 = pcVar4;
  do {
    if (uVar3 == 0) break;
    uVar3 = uVar3 - 1;
    pcVar1 = pcVar5;
    pcVar5 = pcVar5 + 1;
  } while (*pcVar1 != '\0');
  uVar3 = ~uVar3;
  pcVar5 = pcVar4;
  do {
    pcVar1 = pcVar4;
    pcVar4 = pcVar4 + 1;
    cVar2 = *pcVar1;
    if (('`' < cVar2) && (cVar2 < '{')) {
      cVar2 = cVar2 + -0x20;
    }
    pcVar1 = pcVar5;
    pcVar5 = pcVar5 + 1;
    *pcVar1 = cVar2;
    uVar3 = uVar3 - 1;
  } while (uVar3 != 0);
  return;
}

