
undefined2 __cdecl16far thunk_FUN_7533_0000(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iStack_6;
  
  iVar3 = 0;
  iVar4 = 0;
  DAT_4125_1110 = 0;
  if (DAT_3c04_015d == 0) {
    iVar1 = thunk_FUN_8027_225b();
    if (iVar1 == 1) {
      DAT_451b_058a = *(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x189);
      DAT_451b_0588 = *(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x18b);
      DAT_451b_058c = thunk_FUN_824f_044a(DAT_451b_058a,DAT_451b_0588);
      return 1;
    }
    iStack_6 = 5;
    thunk_FUN_824f_03f9();
    if (0x27 < (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110]) {
      iStack_6 = 6;
    }
    DAT_451b_0586 = 0;
    iVar1 = DAT_3c04_0181;
    while (iVar2 = iVar1 + -1, iVar1 != 0) {
      iVar1 = iVar2;
      if (*(char *)(iVar2 * 0x16 + -0x777c) == '\x1c') {
        iVar3 = iVar3 + 1;
        if (*(char *)(iVar2 * 0x16 + -0x777b) == (char)DAT_3c04_0110) {
          DAT_451b_0586 = 1;
          iVar4 = iVar4 + 1;
        }
      }
    }
    if ((iVar3 < 0x28) && (iVar4 < iStack_6)) {
      if (DAT_451b_0586 == 0) {
        DAT_4125_1110 = thunk_FUN_7e8f_02bf(1,0x12c0190);
      }
      else {
        DAT_4125_1110 = thunk_FUN_7e8f_02bf(1,0x3e80258);
      }
      if ((DAT_4125_1110 <= *(int *)(DAT_3c04_0110 * 0x14 + 0x185)) &&
         (iVar3 = thunk_FUN_7e8f_02bf(1,0x1e), iVar3 < 7)) {
        iVar3 = -1;
        iVar1 = thunk_FUN_7e8f_02bf(1,((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110],0);
        iVar2 = 0;
        iVar4 = 1;
        while ((iVar2 < DAT_3c04_157b &&
               ((iVar5 = iVar4, *(char *)(iVar2 * 0x41 + 0x1592) != (char)DAT_3c04_0110 ||
                (iVar5 = iVar4 + 1, iVar3 = iVar2, iVar4 != iVar1))))) {
          iVar2 = iVar2 + 1;
          iVar4 = iVar5;
        }
        if (iVar3 != -1) {
          DAT_451b_058c = iVar3;
          iVar4 = thunk_FUN_5d9f_09ab();
          if (iVar4 == 0) {
            DAT_451b_058c = iVar3;
            return 1;
          }
          DAT_451b_058c = thunk_FUN_5d9f_0919();
          return 1;
        }
      }
    }
  }
  return 0;
}

