
void __cdecl16far thunk_FUN_85d0_175c(void)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  undefined2 uVar6;
  uint uStack_10;
  
  bVar1 = true;
  iVar5 = 0;
  uStack_10 = 0;
  if (DAT_3c04_0124 != 0) {
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if ((*(int *)(iVar3 * 2 + 0xd0) == 0) && (*(int *)(iVar3 * 2 + 0x137) != 0)) {
        iVar5 = iVar5 + 1;
      }
      if (*(int *)(iVar3 * 2 + 0x137) == 0) {
        uStack_10 = uStack_10 | 1 << ((byte)iVar3 & 0x1f);
      }
    }
    DAT_4125_126c = FUN_1d28_069a((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
      if (*(char *)(*(byte *)(*(int *)(iVar2 * 0x41 + 0x157f) * 0xe0 +
                             *(int *)(iVar2 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
        pbVar4 = (byte *)(DAT_4125_126c + *(int *)(iVar2 * 0x41 + 0x157f) * 0x70 +
                         *(int *)(iVar2 * 0x41 + 0x157d));
        if ((byte)(*pbVar4 | pbVar4[1] | pbVar4[0x70] | pbVar4[0x71] | (byte)uStack_10) != 0xff) {
          bVar1 = false;
          break;
        }
      }
    }
    DAT_4125_126e = iVar3;
    FUN_1d28_07a9((int)DAT_4125_1270,(int)((ulong)DAT_4125_1270 >> 0x10));
    if (bVar1) {
      DAT_3c04_0124 = 0;
      FUN_85d0_15da();
      if (iVar5 < 1) {
        uVar6 = 0xf;
      }
      else {
        uVar6 = 0x19;
      }
      uVar6 = thunk_FUN_7e8f_04f0(0x12,0,uVar6);
      thunk_FUN_8027_11d1(uVar6,iVar3);
    }
  }
  return;
}

