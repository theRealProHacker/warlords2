
char * __cdecl16far FUN_1000_4265(char *param_1)

{
  char *pcVar1;
  char *pcVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  char *pcVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  bool bVar12;
  undefined4 *local_6;
  
  iVar9 = (int)((ulong)param_1 >> 0x10);
  pcVar7 = (char *)param_1;
  if (iVar9 != 0 || pcVar7 != (char *)0x0) {
    uVar3 = 0xffff;
    pcVar8 = pcVar7;
    do {
      if (uVar3 == 0) break;
      uVar3 = uVar3 - 1;
      pcVar1 = pcVar8;
      pcVar8 = pcVar8 + 1;
    } while (*pcVar1 != '\0');
    iVar4 = ~uVar3 - 1;
    if (iVar4 != 0) {
      iVar10 = (int)((ulong)DAT_4125_3ed0 >> 0x10);
      local_6 = (undefined4 *)DAT_4125_3ed0;
      if (iVar10 != 0 || local_6 != (undefined4 *)0x0) {
        while( true ) {
          pcVar1 = (char *)*local_6;
          iVar11 = (int)((ulong)pcVar1 >> 0x10);
          pcVar8 = (char *)pcVar1;
          if ((iVar11 == 0 && pcVar8 == (char *)0x0) || (*pcVar1 == '\0')) break;
          if ((*param_1 == *pcVar1) && (pcVar8[iVar4] == '=')) {
            bVar12 = true;
            iVar5 = iVar4;
            pcVar6 = pcVar7;
            do {
              if (iVar5 == 0) break;
              iVar5 = iVar5 + -1;
              pcVar2 = pcVar8;
              pcVar8 = pcVar8 + 1;
              pcVar1 = pcVar6;
              pcVar6 = pcVar6 + 1;
              bVar12 = *pcVar1 == *pcVar2;
            } while (bVar12);
            if (bVar12) {
              return pcVar8 + 1;
            }
          }
          local_6 = local_6 + 1;
        }
      }
    }
  }
  return (char *)0x0;
}

