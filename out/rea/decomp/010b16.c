
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __cdecl16far FUN_1000_0b16(char *param_1)

{
  char *pcVar1;
  undefined2 uVar2;
  int iVar3;
  uint uVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  undefined2 uVar8;
  bool bVar9;
  
  uVar2 = _DAT_0000_ff2c;
  pcVar5 = (char *)0x0;
  iVar3 = -1;
  do {
    pcVar6 = (char *)param_1;
    uVar8 = (undefined2)((ulong)param_1 >> 0x10);
    if (0x3ff < (int)pcVar5) goto LAB_1000_0b77;
    do {
      pcVar7 = pcVar5;
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      pcVar1 = pcVar5;
      pcVar5 = pcVar5 + 1;
      pcVar7 = pcVar5;
    } while (*pcVar1 != '\0');
    pcVar5 = pcVar7 + 1;
  } while ((*pcVar7 != '\0') || (pcVar1 = pcVar5, pcVar5 = pcVar7 + 2, *pcVar1 != '\x01'));
  if (*pcVar5 == '\0') {
    pcVar7 = pcVar6;
    for (iVar3 = 0x43; pcVar5 = pcVar5 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
      pcVar1 = pcVar7;
      pcVar7 = pcVar7 + 1;
      *pcVar1 = *pcVar5;
    }
    bVar9 = true;
    *pcVar7 = '\0';
    uVar4 = 0xffff;
    pcVar5 = pcVar6;
    do {
      if (uVar4 == 0) break;
      uVar4 = uVar4 - 1;
      pcVar1 = pcVar5;
      pcVar5 = pcVar5 + 1;
      bVar9 = *pcVar1 == '\0';
    } while (!bVar9);
    uVar4 = ~uVar4;
    do {
      if (uVar4 == 0) break;
      uVar4 = uVar4 - 1;
      pcVar1 = pcVar5;
      pcVar5 = pcVar5 + -1;
      bVar9 = *pcVar1 == '\\';
    } while (!bVar9);
    if (bVar9) {
      pcVar5[1] = '\0';
      return uVar4 + 1;
    }
  }
LAB_1000_0b77:
  iVar3 = FUN_1000_0ade(pcVar6,uVar8);
  return iVar3;
}

