
void __cdecl16far thunk_FUN_5e7c_0080(void)

{
  int *piVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  bool bVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined2 unaff_SS;
  int iStack_20;
  int iStack_1e;
  byte abStack_13 [7];
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_4 = thunk_FUN_7e8f_02bf();
  iStack_6 = -1;
  iStack_8 = -1;
  iStack_a = -1;
  iStack_c = 0;
  iVar5 = DAT_3c04_157b;
  while (iVar8 = iVar5 + -1, iVar5 != 0) {
    iVar5 = iVar8;
    if ((*(char *)(iVar8 * 0x41 + 0x1592) == '\x0f') &&
       ((*(byte *)((int)DAT_451b_018e + iVar8 + 0x11e) & 1) != 0)) {
      thunk_FUN_5d9f_0656(iVar8,0,abStack_13 + 1);
      bVar4 = false;
      iVar6 = 6;
      while (iVar7 = iVar6, iVar6 = iVar7 + -1, iVar7 != 0) {
        if ((abStack_13[iVar7] != 0xff) &&
           (*(char *)((uint)abStack_13[iVar7] * 0x41 + 0x1592) == DAT_3c04_0110)) {
          bVar4 = true;
        }
      }
      if (bVar4) {
        uVar2 = *(undefined2 *)(iVar8 * 0x41 + 0x157d);
        uVar3 = *(undefined2 *)(iVar8 * 0x41 + 0x157f);
        iStack_1e = 0;
        iStack_20 = 1000;
        iVar6 = DAT_3c04_157b;
        while (iVar7 = iVar6 + -1, iVar6 != 0) {
          iVar6 = iVar7;
          if (*(char *)(iVar7 * 0x41 + 0x1592) == '\x0f') {
            if (((*(byte *)((int)DAT_451b_018e + iVar7 + 0x11e) & 1) != 0) &&
               (iVar7 = FUN_1a8b_0acc(uVar2,uVar3,*(undefined2 *)(iVar7 * 0x41 + 0x157d),
                                      *(undefined2 *)(iVar7 * 0x41 + 0x157f)), iVar7 < 0x14)) {
              iStack_1e = iStack_1e + 1;
            }
          }
          else if ((*(char *)(iVar7 * 0x41 + 0x1592) == DAT_3c04_0110) &&
                  (iVar7 = FUN_1a8b_0acc(uVar2,uVar3,*(undefined2 *)(iVar7 * 0x41 + 0x157d),
                                         *(undefined2 *)(iVar7 * 0x41 + 0x157f)), iVar7 < iStack_20)
                  ) {
            iStack_20 = iVar7;
          }
        }
        if ((3 < iStack_1e) &&
           ((iStack_a < iStack_1e || ((iStack_1e == iStack_a && (iStack_c < iStack_20)))))) {
          iStack_c = iStack_20;
          iStack_a = iStack_1e;
          iStack_6 = *(int *)(iVar8 * 0x41 + 0x157d);
          iStack_8 = *(int *)(iVar8 * 0x41 + 0x157f);
        }
      }
    }
  }
  if ((DAT_3c04_0124 == 0) || (iStack_6 == -1)) {
    piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
    *piVar1 = *piVar1 + iStack_4;
  }
  else {
    iVar5 = thunk_FUN_7e8f_02bf();
    iVar8 = thunk_FUN_7e8f_02bf();
    if (SCARRY2(iStack_6,iVar5) == iStack_6 + iVar5 < 0) {
      iStack_6 = iStack_6 + iVar5;
    }
    else {
      iStack_6 = 0;
    }
    if (SCARRY2(iStack_8,iVar8) == iStack_8 + iVar8 < 0) {
      iStack_8 = iStack_8 + iVar8;
    }
    else {
      iStack_8 = 0;
    }
    if (0x6e < iStack_6) {
      iStack_6 = 0x6f;
    }
    if (0x9a < iStack_8) {
      iStack_8 = 0x9b;
    }
    thunk_FUN_6513_0cd6(iStack_6,iStack_8);
    if (((DAT_3c04_0159 != 0) && (DAT_4125_3254 == 0)) || (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0))
    {
      thunk_FUN_830b_2200();
      FUN_22bf_07a5();
      thunk_FUN_830b_0000(0x10001,0);
      FUN_22bf_0757();
    }
  }
  return;
}

