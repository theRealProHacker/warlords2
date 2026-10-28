
void __cdecl16far thunk_FUN_484d_0db3(void)

{
  byte *pbVar1;
  byte bVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  
  iVar3 = DAT_3c04_0110;
  iVar6 = 0;
  do {
    if (7 < iVar6) {
      return;
    }
    if ((iVar6 != iVar3) &&
       ((*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 3) !=
        (*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 0xc) >> 2)) {
      if ((*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 3) <
          (*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 0xc) >> 2) {
        bVar2 = *(byte *)(iVar3 * 8 + iVar6 + 0x153b);
        iVar5 = iVar3 * 8 + iVar6;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 & 0xfc;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 | (byte)((bVar2 & 0xc) >> 2);
        bVar2 = *(byte *)(iVar3 * 8 + iVar6 + 0x153b);
        iVar5 = iVar6 * 8 + iVar3;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 & 0xfc;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 | (byte)((bVar2 & 0xc) >> 2);
        uVar4 = *(byte *)(iVar6 * 8 + iVar3 + 0x153b) & 3;
        if ((*(byte *)(iVar6 * 8 + iVar3 + 0x153b) & 0xc) >> 2 < uVar4) {
          bVar2 = *(byte *)(iVar6 * 8 + iVar3 + 0x153b);
          iVar5 = iVar6 * 8 + iVar3;
          uVar4 = 0x3c04;
          pbVar1 = (byte *)(iVar5 + 0x153b);
          *pbVar1 = *pbVar1 & 0xf3;
          pbVar1 = (byte *)(iVar5 + 0x153b);
          *pbVar1 = *pbVar1 | (bVar2 & 3) << 2;
        }
        if ((((*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 0xc) == 8) &&
            (thunk_FUN_6d27_1244(iVar3,9,iVar3,iVar6,0), DAT_3c04_0159 != 0)) &&
           (iVar5 = thunk_FUN_5d9f_09ab(), iVar5 != 0)) {
          uVar7 = 1;
LAB_484d_0f47:
          uVar7 = thunk_FUN_7e8f_04f0(0x6f,uVar7,CONCAT22(0x3c04,iVar6 * 0x14));
          FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar7,uVar4);
          thunk_FUN_8027_11d1((undefined1 *)&DAT_451b_1d28,0x4125,0x14);
        }
      }
      else if ((*(byte *)(iVar6 * 8 + iVar3 + 0x153b) & 0xc) >> 2 <=
               (*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 0xc) >> 2) {
        bVar2 = *(byte *)(iVar3 * 8 + iVar6 + 0x153b);
        iVar5 = iVar3 * 8 + iVar6;
        uVar4 = 0x3c04;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 & 0xfc;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 | (byte)((bVar2 & 0xc) >> 2);
        bVar2 = *(byte *)(iVar3 * 8 + iVar6 + 0x153b);
        iVar5 = iVar6 * 8 + iVar3;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 & 0xfc;
        pbVar1 = (byte *)(iVar5 + 0x153b);
        *pbVar1 = *pbVar1 | (byte)((bVar2 & 0xc) >> 2);
        if ((((*(byte *)(iVar3 * 8 + iVar6 + 0x153b) & 0xc) == 0) &&
            (thunk_FUN_6d27_1244(iVar3,10,iVar3,iVar6,0), DAT_3c04_0159 != 0)) &&
           (iVar5 = thunk_FUN_5d9f_09ab(), iVar5 != 0)) {
          uVar7 = 0;
          goto LAB_484d_0f47;
        }
      }
    }
    iVar6 = iVar6 + 1;
  } while( true );
}

