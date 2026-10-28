
ulong __cdecl16near FUN_1000_3467(void)

{
  char *pcVar1;
  undefined2 *puVar2;
  char *pcVar3;
  undefined2 *puVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int in_DX;
  int in_BX;
  int iVar10;
  char *pcVar11;
  undefined2 *puVar12;
  char *pcVar13;
  undefined2 *puVar14;
  bool bVar15;
  
  iVar10 = in_BX;
  uVar5 = FUN_1000_33ea(DAT_1000_31a0,DAT_1000_319e);
  if (in_DX == 0) {
    return (ulong)uVar5;
  }
  uVar5 = *(int *)0x0 - 1;
  pcVar13 = (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004;
  pcVar11 = (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004;
  for (iVar7 = 6; iVar7 != 0; iVar7 = iVar7 + -1) {
    pcVar3 = pcVar13;
    pcVar13 = pcVar13 + 2;
    pcVar1 = pcVar11;
    pcVar11 = pcVar11 + 2;
    *(undefined2 *)pcVar3 = *(undefined2 *)pcVar1;
  }
  if (uVar5 != 0) {
    iVar7 = in_DX + 1;
    iVar6 = in_BX + 1;
    while( true ) {
      puVar14 = (undefined2 *)0x0;
      puVar12 = (undefined2 *)0x0;
      uVar8 = uVar5;
      if (0x1000 < uVar5) {
        uVar8 = 0x1000;
      }
      for (iVar9 = uVar8 << 3; iVar9 != 0; iVar9 = iVar9 + -1) {
        puVar4 = puVar14;
        puVar14 = puVar14 + 1;
        puVar2 = puVar12;
        puVar12 = puVar12 + 1;
        *puVar4 = *puVar2;
      }
      bVar15 = uVar5 < 0x1000;
      uVar5 = uVar5 - 0x1000;
      if (bVar15 || uVar5 == 0) break;
      iVar7 = iVar7 + 0x1000;
      iVar6 = iVar6 + 0x1000;
    }
  }
  FUN_1000_32d6(iVar10,in_BX);
  return CONCAT22(in_DX,4);
}

