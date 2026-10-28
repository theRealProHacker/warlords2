
undefined2 __cdecl16far thunk_FUN_8bc3_09e7(void)

{
  uint uVar1;
  uint uVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  char *pcVar8;
  int iVar9;
  char *pcStack_8;
  char *pcStack_6;
  int iStack_4;
  
  iStack_4 = -1;
  pcStack_6 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
  pcStack_8 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
  iVar4 = DAT_3c04_0181;
  iVar9 = -1;
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    iVar4 = iVar5;
    if ((((*(char *)(iVar5 * 0x16 + -0x777b) == (char)DAT_3c04_0110) &&
         (-1 < *(int *)(iVar5 * 0x16 + -0x7780))) && ((*(uint *)(iVar5 * 0x16 + -0x7774) & 1) != 0))
       && ((*(uint *)(iVar5 * 0x16 + -0x7774) & 0x40) == 0)) {
      uVar1 = *(int *)(iVar5 * 0x16 + -0x7780) - DAT_4125_3250;
      uVar6 = (int)uVar1 >> 0xf;
      uVar2 = *(int *)(iVar5 * 0x16 + -0x777e) - DAT_4125_3252;
      uVar7 = (int)uVar2 >> 0xf;
      pcVar8 = (char *)(((uVar1 ^ uVar6) - uVar6) + ((uVar2 ^ uVar7) - uVar7));
      if (pcVar8 == (char *)0x0) {
        pcVar8 = (char *)0x2328;
      }
      if ((*(uint *)(iVar5 * 0x16 + -0x7774) & 0x200) == 0) {
        if ((int)pcVar8 < (int)pcStack_6) {
          iVar9 = iVar5;
          pcStack_6 = pcVar8;
        }
      }
      else if ((int)pcVar8 < (int)pcStack_8) {
        pcStack_8 = pcVar8;
        iStack_4 = iVar5;
      }
    }
  }
  if ((iVar9 == -1) && (iStack_4 == -1)) {
    uVar3 = 0;
  }
  else {
    uVar3 = 1;
  }
  return uVar3;
}

