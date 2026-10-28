
void __cdecl16far thunk_FUN_7533_0579(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  
  iVar2 = DAT_3c04_0181;
  while( true ) {
    do {
      iVar3 = iVar2 + -1;
      if (iVar2 == 0) {
        return;
      }
      iVar2 = iVar3;
    } while ((*(char *)(iVar3 * 0x16 + -0x777c) != '\x1c') ||
            (*(char *)(iVar3 * 0x16 + -0x777b) != DAT_3c04_0110));
    iVar1 = (int)*(char *)(iVar3 * 0x16 + -0x7776);
    if (((*(byte *)(iVar1 + 0x5e3) & 3) == 0) && (0xe < *(byte *)(iVar1 + 0x5e3) >> 2)) break;
    if (((*(byte *)(iVar1 + 0x5e3) & 3) == 1) && (0x1d < *(byte *)(iVar1 + 0x5e3) >> 2)) {
      uVar4 = 0x110066;
      goto LAB_7533_065b;
    }
    if (((*(byte *)(iVar1 + 0x5e3) & 3) == 2) && (0x3b < *(byte *)(iVar1 + 0x5e3) >> 2)) {
      uVar4 = 0x120067;
LAB_7533_065b:
      FUN_7533_0672(iVar3,uVar4);
    }
  }
  uVar4 = 0x100065;
  goto LAB_7533_065b;
}

