
uint __cdecl16far FUN_1a8b_0001(int param_1,int param_2,int param_3)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  uint uVar4;
  code *pcVar5;
  uint uVar6;
  int in_CX;
  int iVar7;
  char cVar8;
  uint *puVar9;
  char *unaff_SI;
  char *pcVar10;
  char *pcVar11;
  undefined2 uVar12;
  bool bVar13;
  undefined1 uVar14;
  bool bVar15;
  uint local_a;
  
  bVar13 = true;
  if ((((DAT_451b_1f02 == (uint *)0x0) || (param_1 < 0)) || (param_2 < 0)) ||
     ((0x6f < param_1 || (0x9b < param_2)))) {
    return 0;
  }
  do {
    if (!bVar13) {
      if (param_3 == 0) {
        thunk_FUN_8bc3_08fb();
        FUN_1b62_08b3(1,0x10001);
      }
      return local_a;
    }
    bVar13 = false;
    thunk_FUN_606a_0427(*DAT_451b_1f02,((uint *)DAT_451b_1f02)[1]);
    local_a = FUN_1a8b_0c4f(param_1);
    uVar12 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    puVar9 = (uint *)DAT_451b_1f02;
    uVar6 = puVar9[9];
    if ((uVar6 == *DAT_451b_1f02) && (uVar6 = puVar9[1], uVar6 == puVar9[10])) {
      local_a = 4;
      uVar6 = 0xffff;
      puVar9[10] = 0xffff;
      puVar9[9] = 0xffff;
    }
    switch(local_a) {
    case 2:
      return uVar6;
    case 3:
      do {
        pcVar5 = (code *)swi(0x21);
        iVar7 = (*pcVar5)();
      } while (iVar7 == in_CX);
      pcVar5 = (code *)swi(0x21);
      (*pcVar5)();
      return 0;
    case 4:
      if (*unaff_SI != *(char *)0x0) {
        DAT_4125_3332 = 0;
        return uVar6 - 0xd00;
      }
      DAT_4125_3346 = 0x20;
      DAT_4125_334e = 0x20;
      DAT_4125_3348 = 0;
      DAT_4125_334a = 0x10;
      DAT_4125_3352 = 4;
      bVar13 = false;
      uVar14 = 0;
      DAT_4125_3350 = 0x4562;
      pcVar5 = (code *)swi(0x15);
      uVar6 = (*pcVar5)();
      uVar12 = DAT_4125_3332;
      if (bVar13) {
        return uVar6;
      }
      pcVar11 = (char *)&DAT_4125_3315;
      pcVar10 = (char *)&DAT_4125_3368;
      iVar7 = 5;
      goto code_r0x0001e642;
    case 5:
      if ((*(byte *)s_Borland_C_____Copyright_1991_Bor_4125_0004 & 8) == 0) {
        uVar6 = *(int *)&DAT_4125_0002 - 1;
        *(char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 = '\0';
        if (*(int *)s_Borland_C_____Copyright_1991_Bor_4125_0004 == 0) {
          uVar6 = FUN_1d28_060d();
        }
        else {
          DAT_4125_3280 = 6;
        }
      }
      else {
        *(char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 = '\0';
        uVar6 = FUN_1d28_0bab();
      }
      return uVar6;
    }
  } while( true );
  while( true ) {
    iVar7 = iVar7 + -1;
    pcVar2 = pcVar11;
    pcVar11 = pcVar11 + 1;
    pcVar1 = pcVar10;
    pcVar10 = pcVar10 + 1;
    uVar14 = *pcVar1 == *pcVar2;
    if (!(bool)uVar14) break;
code_r0x0001e642:
    if (iVar7 == 0) break;
  }
  if (!(bool)uVar14) {
    return uVar6;
  }
  uVar6 = (uint)((ulong)DAT_4125_3330 * 0x400);
  cVar3 = ((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004)[0x2a];
  cVar8 = (char)((ulong)DAT_4125_3330 * 0x400 >> 0x10);
  bVar15 = SBORROW1(cVar8,cVar3);
  bVar13 = (char)(cVar8 - cVar3) < '\0';
  if (cVar8 == cVar3) {
    uVar4 = *(uint *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0x28);
    bVar15 = SBORROW2(uVar6,uVar4);
    bVar13 = (int)(uVar6 - uVar4) < 0;
    if (uVar6 == uVar4) {
      return uVar6;
    }
  }
  if (bVar15 == bVar13) {
    ((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004)[0x2a] = cVar8;
    *(uint *)((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0x28) = uVar6;
  }
  else {
    uVar6 = (uint)((ulong)CONCAT12(((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004)[0x2a],
                                   *(undefined2 *)
                                    ((char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 0x28)) /
                  0x40);
    DAT_4125_3330 = uVar6;
  }
  return uVar6;
}

