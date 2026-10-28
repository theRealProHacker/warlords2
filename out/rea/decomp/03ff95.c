
void __cdecl16far thunk_FUN_621e_010b(void)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  int iVar4;
  undefined2 unaff_SS;
  int aiStack_38 [8];
  undefined2 auStack_28 [8];
  undefined2 auStack_18 [8];
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iVar4 = 0;
  iStack_8 = 0;
  FUN_22bf_07a5();
  thunk_FUN_8027_137e();
  thunk_FUN_5d9f_05e6();
  FUN_621e_0398();
  thunk_FUN_5d9f_063d();
  thunk_FUN_8027_1452();
  FUN_22bf_0757();
  iStack_4 = 8;
  while( true ) {
    iVar1 = iStack_4;
    iStack_4 = iStack_4 + -1;
    if (iVar1 == 0) break;
    aiStack_38[iStack_4] = 0;
    if (*(int *)(iStack_4 * 2 + 0x137) != 0) {
      if (*(int *)(iStack_4 * 2 + 0xd0) == 0) {
        iVar4 = iVar4 + 1;
      }
      else {
        aiStack_38[iStack_4] = 1;
        iStack_8 = iStack_8 + 1;
      }
      auStack_18[iStack_4] = *(undefined2 *)(iStack_4 * 0x14 + 0x189);
      auStack_28[iStack_4] = *(undefined2 *)(iStack_4 * 0x14 + 0x18b);
      iVar1 = thunk_FUN_824f_044a();
      if (-1 < iVar1) {
        *(undefined1 *)(iVar1 * 0x41 + 0x15ac) = (undefined1)iStack_4;
      }
    }
  }
  if ((iStack_8 == 0) && (iVar4 != 0)) {
    iStack_4 = 8;
    iVar4 = -1;
    iVar1 = 0;
    while (iVar2 = iStack_4 + -1, iStack_4 != 0) {
      iStack_4 = iVar2;
      if (*(int *)(iVar2 * 2 + 0x137) != 0) {
        aiStack_38[iVar2] = 1;
        iVar2 = thunk_FUN_7e8f_02bf(1,100);
        if ((iVar4 == -1) || (iVar1 < iVar2)) {
          iVar4 = iStack_4;
          iVar1 = iVar2;
        }
      }
    }
    if (iVar4 != -1) {
      aiStack_38[iVar4] = 0;
    }
  }
  iStack_6 = -1;
  iStack_4 = 8;
  do {
    iVar4 = iStack_4;
    iStack_4 = iStack_4 + -1;
    if (iVar4 == 0) goto LAB_621e_02b0;
  } while (aiStack_38[iStack_4] == 0);
  iStack_6 = iStack_4;
LAB_621e_02b0:
  if (iStack_6 != -1) {
    while (iVar4 = FUN_621e_0a27(auStack_18[iStack_6],auStack_28[iStack_6],0xf), -1 < iVar4) {
      *(undefined1 *)(iVar4 * 0x41 + 0x15ac) = (undefined1)iStack_6;
      iVar1 = thunk_FUN_7e8f_02bf(1);
      if (iVar1 < 5) {
        auStack_18[iStack_6] = *(undefined2 *)(iStack_6 * 0x14 + 0x189);
        uVar3 = *(undefined2 *)(iStack_6 * 0x14 + 0x18b);
      }
      else {
        auStack_18[iStack_6] = *(undefined2 *)(iVar4 * 0x41 + 0x157d);
        uVar3 = *(undefined2 *)(iVar4 * 0x41 + 0x157f);
      }
      auStack_28[iStack_6] = uVar3;
      do {
        iStack_6 = (iStack_6 + 1) % 8;
      } while (aiStack_38[iStack_6] == 0);
    }
  }
  return;
}

