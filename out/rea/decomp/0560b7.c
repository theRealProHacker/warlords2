
void __cdecl16far FUN_557a_0917(void)

{
  int iVar1;
  uint uVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  char *local_6;
  int local_4;
  
  local_4 = -1;
  local_6 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
  iVar1 = thunk_FUN_824f_044a(*(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x193),
                              *(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x195));
  iVar4 = DAT_3c04_157b;
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    iVar4 = iVar5;
    if ((((*(char *)(*(byte *)(*(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 +
                              *(int *)(iVar5 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
         (uVar2 = (uint)*(byte *)(iVar5 * 0x41 + 0x15ac), uVar2 != DAT_3c04_0110)) &&
        ((uVar2 == 0xf || (*(int *)(uVar2 * 2 + 0x137) == 0)))) &&
       ((pcVar3 = (char *)FUN_1a8b_0acc(*(undefined2 *)(iVar5 * 0x41 + 0x157d),
                                        *(undefined2 *)(iVar5 * 0x41 + 0x157f),
                                        *(undefined2 *)(iVar1 * 0x41 + 0x157d),
                                        *(undefined2 *)(iVar1 * 0x41 + 0x157f)), (int)pcVar3 < 0x28
        && ((int)pcVar3 < (int)local_6)))) {
      local_6 = pcVar3;
      local_4 = iVar5;
    }
  }
  if (local_4 != -1) {
    *(undefined1 *)(local_4 * 0x41 + 0x15ac) = (undefined1)DAT_3c04_0110;
  }
  return;
}

