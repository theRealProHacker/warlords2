
void __cdecl16far thunk_FUN_85d0_1558(void)

{
  byte *pbVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uStack_4;
  
  uVar2 = DAT_4125_3254;
  DAT_4125_3254 = 0;
  for (uStack_4 = 0; uStack_4 < 2; uStack_4 = uStack_4 + 1) {
    for (iVar4 = 0; iVar4 < 0x70; iVar4 = iVar4 + 1) {
      for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
        if ((*(byte *)(iVar5 * 0x70 + iVar4) & 0x20) == 0) {
          iVar3 = FUN_85d0_0f6f(iVar4,iVar5);
          if (*(char *)(iVar3 + 0x2d56) == -1) {
            pbVar1 = (byte *)(iVar5 * 0x70 + iVar4);
            *pbVar1 = *pbVar1 | 0x20;
          }
        }
      }
    }
  }
  DAT_4125_3254 = uVar2;
  return;
}

