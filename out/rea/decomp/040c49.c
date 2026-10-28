
uint __cdecl16far thunk_FUN_7e8f_020d(void)

{
  code *pcVar1;
  bool bVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  undefined2 unaff_SS;
  
  bVar2 = false;
  iVar6 = 0;
  uVar5 = 0;
  FUN_1000_1bf0();
  while( true ) {
    while( true ) {
      if (bVar2) {
        DAT_4125_2674 = DAT_4125_2676;
        return uVar5;
      }
      iVar3 = FUN_1000_38dc();
      if (iVar3 != 0) {
        uVar5 = FUN_1000_3708();
        bVar2 = true;
        if (uVar5 == 0) {
          uVar5 = FUN_1000_3708();
          uVar5 = uVar5 | 0x100;
          if (uVar5 == 0x153) {
            uVar5 = 0x1b;
          }
        }
      }
      iVar6 = iVar6 + 1;
      iVar3 = FUN_1000_1bf0();
      if (iVar3 != -1) break;
      if (iVar6 == 1000) {
        DAT_4125_2674 = DAT_4125_2676;
        return uVar5;
      }
    }
    pcVar1 = (code *)swi(0x37);
    uVar4 = (*pcVar1)();
    *(undefined1 *)0x74a1 = (char)(uVar4 >> 8);
    pcVar1 = (code *)swi(0x37);
    (*pcVar1)(0);
    uVar5 = uVar5 + 2;
    pcVar1 = (code *)swi(0x3d);
    (*pcVar1)(iVar3);
    if ((uVar4 & 0x100) != 0) break;
    if (iVar6 == 20000) {
      DAT_4125_2674 = DAT_4125_2676;
      return uVar5;
    }
  }
  DAT_4125_2674 = DAT_4125_2676;
  return uVar5;
}

