
undefined2 __cdecl16far FUN_255e_032f(void)

{
  undefined2 *puVar1;
  undefined2 *puVar2;
  int iVar3;
  int in_DX;
  undefined2 *puVar4;
  undefined2 *puVar5;
  undefined2 unaff_SS;
  undefined1 local_58 [80];
  undefined2 local_8;
  char *local_6;
  int local_4;
  
  if (DAT_4125_37a3 == '\0') {
    return 0;
  }
  puVar5 = &local_8;
  puVar4 = (undefined2 *)&DAT_4125_3872;
  for (iVar3 = 1; iVar3 != 0; iVar3 = iVar3 + -1) {
    puVar2 = puVar5;
    puVar5 = puVar5 + 1;
    puVar1 = puVar4;
    puVar4 = puVar4 + 1;
    *puVar2 = *puVar1;
  }
  if (DAT_4125_37ac != '\0') {
    puVar5 = &local_8;
    puVar4 = (undefined2 *)&DAT_4125_3874;
    for (iVar3 = 1; iVar3 != 0; iVar3 = iVar3 + -1) {
      puVar2 = puVar5;
      puVar5 = puVar5 + 1;
      puVar1 = puVar4;
      puVar4 = puVar4 + 1;
      *puVar2 = *puVar1;
    }
  }
  if (DAT_4125_37ad != '\0') {
    puVar5 = &local_8;
    puVar4 = (undefined2 *)&DAT_4125_3876;
    for (iVar3 = 1; iVar3 != 0; iVar3 = iVar3 + -1) {
      puVar2 = puVar5;
      puVar5 = puVar5 + 1;
      puVar1 = puVar4;
      puVar4 = puVar4 + 1;
      *puVar2 = *puVar1;
    }
  }
  FUN_1000_4944(local_58);
  iVar3 = FUN_170b_0006(local_58);
  if (iVar3 < 0) {
    return 0;
  }
  local_6 = (char *)FUN_170b_00a9(iVar3);
  local_4 = in_DX;
  if ((-1 < in_DX) && ((0 < in_DX || ((char *)s__x__Use_extended_memory_4125_2703 + 0xd < local_6)))
     ) {
    local_4 = 0;
    local_6 = (char *)s__x__Use_extended_memory_4125_2703 + 0xc;
  }
  DAT_451b_30fa = local_4;
  DAT_451b_30f8 = local_6;
  FUN_170b_006d(iVar3,DAT_451b_30f0,DAT_451b_30f2,local_6);
  FUN_170b_003a(iVar3);
  return 1;
}

