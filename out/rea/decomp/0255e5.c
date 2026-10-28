
undefined2 __cdecl16far FUN_255e_0005(void)

{
  byte *pbVar1;
  char *pcVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int in_DX;
  undefined1 *puVar7;
  byte *pbVar8;
  char *pcVar9;
  byte *pbVar10;
  undefined2 unaff_SS;
  bool bVar11;
  bool bVar12;
  byte local_c4 [50];
  byte local_92 [50];
  undefined1 local_60 [80];
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  
  puVar7 = (undefined1 *)&DAT_451b_3108;
  do {
    *puVar7 = 0;
    puVar7 = puVar7 + 0xb;
  } while (puVar7 != (undefined1 *)0x70d6);
  iVar4 = FUN_170b_0006((char *)s_sound_dat_4125_37ae,0x4125,2);
  if (iVar4 < 0) {
    return 0;
  }
  FUN_170b_006d(iVar4,local_60);
  FUN_1000_49ba(local_60);
  FUN_170b_003a(iVar4);
  pbVar8 = local_c4;
  pcVar9 = (char *)s_NO_SOUND_4125_37c1;
  uVar6 = 0xffff;
  do {
    if (uVar6 == 0) break;
    uVar6 = uVar6 - 1;
    pcVar2 = pcVar9;
    pcVar9 = pcVar9 + 1;
  } while (*pcVar2 != '\0');
  uVar6 = ~uVar6;
  pbVar10 = (byte *)(pcVar9 + -uVar6);
  bVar11 = false;
  iVar4 = 0;
  bVar12 = true;
  do {
    if (uVar6 == 0) break;
    uVar6 = uVar6 - 1;
    pbVar3 = pbVar10;
    pbVar10 = pbVar10 + 1;
    pbVar1 = pbVar8;
    pbVar8 = pbVar8 + 1;
    bVar11 = *pbVar1 < *pbVar3;
    bVar12 = *pbVar1 == *pbVar3;
  } while (bVar12);
  if (!bVar12) {
    iVar4 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
  }
  if (iVar4 == 0) {
    DAT_4125_37a2 = '\0';
    DAT_4125_37a4 = 0;
  }
  pbVar8 = local_92;
  pcVar9 = (char *)s_NO_SOUND_4125_37ca;
  uVar6 = 0xffff;
  do {
    if (uVar6 == 0) break;
    uVar6 = uVar6 - 1;
    pcVar2 = pcVar9;
    pcVar9 = pcVar9 + 1;
  } while (*pcVar2 != '\0');
  uVar6 = ~uVar6;
  pbVar10 = (byte *)(pcVar9 + -uVar6);
  bVar11 = false;
  iVar4 = 0;
  bVar12 = true;
  do {
    if (uVar6 == 0) break;
    uVar6 = uVar6 - 1;
    pbVar3 = pbVar10;
    pbVar10 = pbVar10 + 1;
    pbVar1 = pbVar8;
    pbVar8 = pbVar8 + 1;
    bVar11 = *pbVar1 < *pbVar3;
    bVar12 = *pbVar1 == *pbVar3;
  } while (bVar12);
  if (!bVar12) {
    iVar4 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
  }
  if (iVar4 == 0) {
    DAT_4125_37a3 = '\0';
  }
  if ((DAT_4125_37a2 == '\0') && (DAT_4125_37a3 == '\0')) {
    DAT_4125_37a6 = 1;
    return 1;
  }
  if (DAT_4125_37a2 != '\0') {
    pbVar8 = local_c4;
    pcVar9 = (char *)s_IBMBAK_COM_4125_37d3;
    uVar6 = 0xffff;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pcVar2 = pcVar9;
      pcVar9 = pcVar9 + 1;
    } while (*pcVar2 != '\0');
    uVar6 = ~uVar6;
    pbVar10 = (byte *)(pcVar9 + -uVar6);
    bVar11 = false;
    iVar4 = 0;
    bVar12 = true;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pbVar3 = pbVar10;
      pbVar10 = pbVar10 + 1;
      pbVar1 = pbVar8;
      pbVar8 = pbVar8 + 1;
      bVar11 = *pbVar1 < *pbVar3;
      bVar12 = *pbVar1 == *pbVar3;
    } while (bVar12);
    if (!bVar12) {
      iVar4 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
    }
    if (iVar4 == 0) {
      DAT_4125_37ab = '\x01';
    }
    if ((DAT_4125_37ab == '\0') && (iVar4 = FUN_1000_03f5(local_c4), iVar4 == 0)) {
      return 0;
    }
  }
  if (DAT_4125_37a3 != '\0') {
    iVar4 = FUN_1000_0660(local_92);
    local_6 = iVar4;
    if (iVar4 == 0 && in_DX == 0) {
      FUN_1000_43ac((char *)s_Unable_to_find_ADV_file_4125_37de,0x4125);
      return 0;
    }
    local_10 = iVar4;
    local_e = in_DX;
    local_a = FUN_1000_0660(0x37f7,0x4125,0,0);
    local_8 = iVar4;
    if (local_a == 0 && iVar4 == 0) {
      FUN_1000_43ac((char *)s_Unable_to_find_AD_file_4125_3801,0x4125);
      return 0;
    }
    iVar5 = FUN_1000_0d3b((char *)s_MIDPAK_COM_4125_3819,0x4125);
    if (iVar5 == 0) {
      FUN_1000_43ac((char *)s_Unable_to_load_MIDPAK_COM_4125_3824,0x4125);
      return 0;
    }
    local_c = FUN_1000_0e15(local_10,local_e,local_a,local_8);
    if (local_c != 0) {
      FUN_1000_43ac((char *)s_Error_initilizing_driver__4125_383f,0x4125);
      return 0;
    }
    pbVar8 = local_92;
    pcVar9 = (char *)&DAT_4125_385a;
    uVar6 = 0xffff;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pcVar2 = pcVar9;
      pcVar9 = pcVar9 + 1;
    } while (*pcVar2 != '\0');
    uVar6 = ~uVar6;
    pbVar10 = (byte *)(pcVar9 + -uVar6);
    bVar11 = false;
    iVar5 = 0;
    bVar12 = true;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pbVar3 = pbVar10;
      pbVar10 = pbVar10 + 1;
      pbVar1 = pbVar8;
      pbVar8 = pbVar8 + 1;
      bVar11 = *pbVar1 < *pbVar3;
      bVar12 = *pbVar1 == *pbVar3;
    } while (bVar12);
    if (!bVar12) {
      iVar5 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
    }
    if (iVar5 == 0) {
      DAT_4125_37ac = 1;
    }
    pbVar8 = local_92;
    pcVar9 = (char *)s_SC32MPU_ADV_4125_3866;
    uVar6 = 0xffff;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pcVar2 = pcVar9;
      pcVar9 = pcVar9 + 1;
    } while (*pcVar2 != '\0');
    uVar6 = ~uVar6;
    pbVar10 = (byte *)(pcVar9 + -uVar6);
    bVar11 = false;
    iVar5 = 0;
    bVar12 = true;
    do {
      if (uVar6 == 0) break;
      uVar6 = uVar6 - 1;
      pbVar3 = pbVar10;
      pbVar10 = pbVar10 + 1;
      pbVar1 = pbVar8;
      pbVar8 = pbVar8 + 1;
      bVar11 = *pbVar1 < *pbVar3;
      bVar12 = *pbVar1 == *pbVar3;
    } while (bVar12);
    if (!bVar12) {
      iVar5 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
    }
    if (iVar5 == 0) {
      DAT_4125_37ad = 1;
    }
    DAT_451b_30f4 = FUN_1d28_011f((char *)s__x__Use_extended_memory_4125_2703 + 0xd,0,0,3,0);
    DAT_451b_30f6 = iVar4;
    DAT_451b_30f0 = FUN_1d28_069a(DAT_451b_30f4,iVar4);
    DAT_451b_30f2 = iVar4;
  }
  return 1;
}

