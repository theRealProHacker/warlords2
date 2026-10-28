
void __cdecl16far FUN_6a62_1379(int param_1)

{
  undefined1 uVar1;
  int iVar2;
  int unaff_SI;
  int iVar3;
  int unaff_DI;
  int iVar4;
  
  if (DAT_4125_0d56 != param_1) {
    if (DAT_4125_0d56 < 0) {
      DAT_4125_0d56 = param_1;
      goto LAB_6a62_1466;
    }
    iVar2 = 0;
    while ((iVar3 = unaff_SI, iVar2 < 0x1d &&
           (iVar3 = iVar2, *(char *)(DAT_3c04_0110 * 0x1d + iVar2 + 0x60b) != DAT_4125_0d56))) {
      iVar2 = iVar2 + 1;
    }
    iVar2 = 0;
    while ((iVar4 = unaff_DI, iVar2 < 0x1d &&
           (iVar4 = iVar2, *(char *)(DAT_3c04_0110 * 0x1d + iVar2 + 0x60b) != param_1))) {
      iVar2 = iVar2 + 1;
    }
    uVar1 = *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar3 + 0x60b);
    *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar3 + 0x60b) =
         *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar4 + 0x60b);
    *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar4 + 0x60b) = uVar1;
  }
  DAT_4125_0d56 = -1;
LAB_6a62_1466:
  FUN_6a62_0e4a(1);
  FUN_6a62_1067();
  return;
}

