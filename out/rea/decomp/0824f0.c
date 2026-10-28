
void __cdecl16far FUN_824f_0000(void)

{
  byte *pbVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  for (iVar3 = 0; iVar5 = DAT_3c04_0181, iVar3 < 0x70; iVar3 = iVar3 + 1) {
    for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
      pbVar1 = (byte *)(iVar5 * 0xe0 + iVar3 * 2 + 1);
      *pbVar1 = *pbVar1 & 0xef;
      iVar4 = iVar5 * 0xe0 + iVar3 * 2;
      pbVar1 = (byte *)(iVar4 + 1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar4 + 1);
      *pbVar1 = *pbVar1 | 0xf;
    }
  }
  while (iVar4 = iVar5 + -1, iVar3 = DAT_3c04_157b, iVar5 != 0) {
    iVar5 = iVar4;
    if (-1 < *(int *)(iVar4 * 0x16 + -0x777e)) {
      pbVar1 = (byte *)(*(int *)(iVar4 * 0x16 + -0x777e) * 0xe0 +
                        *(int *)(iVar4 * 0x16 + -0x7780) * 2 + 1);
      *pbVar1 = *pbVar1 | 0x10;
      bVar2 = *(byte *)(iVar4 * 0x16 + -0x777b);
      iVar3 = *(int *)(iVar4 * 0x16 + -0x777e) * 0xe0 + *(int *)(iVar4 * 0x16 + -0x7780) * 2;
      pbVar1 = (byte *)(iVar3 + 1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar3 + 1);
      *pbVar1 = *pbVar1 | bVar2 & 0xf;
    }
  }
  while (iVar5 = iVar3 + -1, iVar3 != 0) {
    iVar3 = iVar5;
    if (*(char *)(iVar5 * 0x41 + 0x1592) != '\x0f') {
      bVar2 = *(byte *)(iVar5 * 0x41 + 0x1592);
      iVar4 = *(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar5 * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar4 + 1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar4 + 1);
      *pbVar1 = *pbVar1 | bVar2 & 0xf;
      bVar2 = *(byte *)(iVar5 * 0x41 + 0x1592);
      iVar4 = *(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar5 * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar4 + 0xe1);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar4 + 0xe1);
      *pbVar1 = *pbVar1 | bVar2 & 0xf;
      bVar2 = *(byte *)(iVar5 * 0x41 + 0x1592);
      iVar4 = *(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar5 * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar4 + 3);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar4 + 3);
      *pbVar1 = *pbVar1 | bVar2 & 0xf;
      bVar2 = *(byte *)(iVar5 * 0x41 + 0x1592);
      iVar5 = *(int *)(iVar5 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar5 * 0x41 + 0x157d) * 2;
      pbVar1 = (byte *)(iVar5 + 0xe3);
      *pbVar1 = *pbVar1 & 0xf0;
      pbVar1 = (byte *)(iVar5 + 0xe3);
      *pbVar1 = *pbVar1 | bVar2 & 0xf;
    }
  }
  for (iVar3 = 0; iVar3 < 0x70; iVar3 = iVar3 + 1) {
    for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
      if (((*(byte *)(iVar5 * 0xe0 + iVar3 * 2 + 1) & 0x20) != 0) &&
         ((*(byte *)(iVar5 * 0xe0 + iVar3 * 2 + 1) & 0x10) == 0)) {
        pbVar1 = (byte *)(iVar5 * 0xe0 + iVar3 * 2 + 1);
        *pbVar1 = *pbVar1 & 0xdf;
      }
    }
  }
  return;
}

