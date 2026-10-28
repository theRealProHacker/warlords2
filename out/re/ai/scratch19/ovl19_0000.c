// ovl19:0000 ent 562a0

void __cdecl16far FUN_562a_0000(void)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  undefined2 uVar4;
  
  if (*DAT_451b_018e != 0) {
    thunk_FUN_59a9_01b3();
    iVar2 = DAT_3c04_157b;
    while( true ) {
      iVar1 = iVar2;
      iVar2 = iVar1 + -1;
      piVar3 = DAT_451b_018e;
      uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (iVar1 == 0) break;
      if ((*(iVar2 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         (*(piVar3 + iVar1 + 0x55) == '\a')) {
        *(piVar3 + iVar1 + 0x55) = 8;
      }
    }
    if (piVar3[0x125] != 0) {
      iVar2 = 0;
      while( true ) {
        uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        piVar3 = DAT_451b_018e;
        if (piVar3[0x125] <= iVar2) break;
        if (piVar3[iVar2 * 0x2e + 0x126] != 0) {
          *(piVar3 + piVar3[iVar2 * 0x2e + 0x128] + 0x56) = 7;
          iVar1 = FUN_562a_00ca(iVar2);
          if (iVar1 != 0) {
            (DAT_451b_018e)[iVar2 * 0x2e + 0x126] =
                 (DAT_451b_018e)[iVar2 * 0x2e + 0x126] + 1;
          }
        }
        iVar2 = iVar2 + 1;
      }
    }
  }
  return;
}

