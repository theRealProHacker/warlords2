
void __cdecl16far FUN_6513_1610(void)

{
  bool bVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  
  iVar4 = 0;
  bVar1 = false;
  bVar2 = false;
  iVar5 = 0;
  do {
    if (DAT_3c04_080f <= iVar5) {
      DAT_451b_08ce = iVar4;
      return;
    }
    if (((*(int *)(iVar5 * 0x1f + 0x82c) != 0) &&
        ((*(uint *)(iVar5 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) == 0)) &&
       (iVar3 = FUN_1a8b_0acc(*(undefined2 *)(iVar5 * 0x1f + 0x811),
                              *(undefined2 *)(iVar5 * 0x1f + 0x813),DAT_451b_01ca,DAT_451b_01c8),
       iVar3 < 0x23)) {
      if (*(char *)(iVar5 * 0x1f + 0x829) == '\x04') {
        if (!bVar1) {
          bVar1 = true;
          ((undefined2 *)&DAT_451b_0c9c)[iVar4] = 0xffff;
          uVar6 = 0x4125;
          iVar3 = 0xc84;
          goto LAB_6513_1730;
        }
      }
      else if (*(char *)(iVar5 * 0x1f + 0x829) == '\x05') {
        if (!bVar2) {
          bVar2 = true;
          ((undefined2 *)&DAT_451b_0c9c)[iVar4] = 0xfffe;
          uVar6 = 0x4125;
          iVar3 = 0xc89;
LAB_6513_1730:
          FUN_1000_4a70(iVar4 * 0x20 + 0x483c,0x4125,iVar3,uVar6);
          iVar4 = iVar4 + 1;
        }
      }
      else if (*(char *)(iVar5 * 0x1f + 0x829) == '\x02') {
        ((undefined2 *)&DAT_451b_0c9c)[iVar4] = (int)*(char *)(iVar5 * 0x1f + 0x82a);
        iVar3 = ((undefined2 *)&DAT_451b_0c9c)[iVar4] * 0x1d + 0xce9;
        uVar6 = 0x3c04;
        goto LAB_6513_1730;
      }
    }
    iVar5 = iVar5 + 1;
  } while( true );
}

