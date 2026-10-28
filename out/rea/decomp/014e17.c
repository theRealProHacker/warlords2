
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_1000_4e17(void)

{
  char *pcVar1;
  uint uVar2;
  int in_DX;
  int iVar3;
  undefined4 uVar4;
  undefined4 local_6;
  
  pcVar1 = (char *)FUN_1000_4265(0x3f0e,0x4125);
  local_6 = (char *)CONCAT22(in_DX,pcVar1);
  if (((((pcVar1 == (char *)0x0 && in_DX == 0) || (uVar2 = FUN_1000_4a99(pcVar1,in_DX), uVar2 < 4))
       || ((*(byte *)(*local_6 + 0x3a5f) & 0xc) == 0)) ||
      ((((*(byte *)(pcVar1[1] + 0x3a5f) & 0xc) == 0 || ((*(byte *)(pcVar1[2] + 0x3a5f) & 0xc) == 0))
       || ((pcVar1[3] != '-' && ((pcVar1[3] != '+' && ((*(byte *)(pcVar1[3] + 0x3a5f) & 2) == 0)))))
       ))) || (((*(byte *)(pcVar1[3] + 0x3a5f) & 2) == 0 &&
               ((*(byte *)(pcVar1[4] + 0x3a5f) & 2) == 0)))) {
    DAT_4125_3f0c = 1;
    DAT_4125_3f0a = 0;
    DAT_4125_3f08 = 18000;
    FUN_1000_4a70(DAT_4125_3f00,DAT_4125_3f02,0x3f11,0x4125);
    FUN_1000_4a70(DAT_4125_3f04,_DAT_4125_3f06,0x3f15,0x4125);
    uVar4 = CONCAT22(DAT_4125_3f0a,DAT_4125_3f08);
  }
  else {
    FUN_1000_438d(DAT_4125_3f04,_DAT_4125_3f06,0,4);
    FUN_1000_4ab8(DAT_4125_3f00,DAT_4125_3f02,pcVar1,in_DX,3);
    *(undefined1 *)((int)_DAT_4125_3f00 + 3) = 0;
    FUN_1000_3ed2(pcVar1 + 3,in_DX);
    uVar4 = FUN_1000_1fc1();
    DAT_4125_3f0a = (undefined2)((ulong)uVar4 >> 0x10);
    DAT_4125_3f08 = (undefined2)uVar4;
    DAT_4125_3f0c = 0;
    for (iVar3 = 3; pcVar1[iVar3] != '\0'; iVar3 = iVar3 + 1) {
      if ((*(byte *)(pcVar1[iVar3] + 0x3a5f) & 0xc) != 0) {
        uVar2 = FUN_1000_4a99(pcVar1 + iVar3,in_DX);
        uVar4 = CONCAT22(DAT_4125_3f0a,DAT_4125_3f08);
        if (((2 < uVar2) &&
            (uVar4 = CONCAT22(DAT_4125_3f0a,DAT_4125_3f08),
            (*(byte *)(pcVar1[iVar3 + 1] + 0x3a5f) & 0xc) != 0)) &&
           (uVar4 = CONCAT22(DAT_4125_3f0a,DAT_4125_3f08),
           (*(byte *)(pcVar1[iVar3 + 2] + 0x3a5f) & 0xc) != 0)) {
          FUN_1000_4ab8(DAT_4125_3f04,_DAT_4125_3f06,pcVar1 + iVar3,in_DX,3);
          *(undefined1 *)((int)_DAT_4125_3f04 + 3) = 0;
          uVar4 = CONCAT22(DAT_4125_3f0a,DAT_4125_3f08);
          DAT_4125_3f0c = 1;
        }
        break;
      }
    }
  }
  DAT_4125_3f0a = (undefined2)((ulong)uVar4 >> 0x10);
  DAT_4125_3f08 = (undefined2)uVar4;
  return;
}

