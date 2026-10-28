// ovl19:00ca ent 5636a

undefined2 __cdecl16far FUN_562a_00ca(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  
  iVar2 = thunk_FUN_824f_044a(*(DAT_3c04_0110 * 0x14 + 0x193),
                              *(DAT_3c04_0110 * 0x14 + 0x195));
  if ((*(iVar2 * 0x41 + 0x1592) != '\x0f') &&
     (*(iVar2 * 0x41 + 0x1592) != DAT_3c04_0110)) {
    bVar1 = false;
    uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar4 = DAT_451b_018e;
    iVar5 = *(iVar4 + 0x24a);
    while (iVar3 = iVar5 + -1, iVar5 != 0) {
      iVar5 = iVar3;
      if ((*(iVar4 + iVar3 * 0x5c + 0x24c) != 0) &&
         ((*(iVar2 * 0x41 + 0x1592) == *(iVar4 + iVar3 * 0x5c + 0x24e) ||
          (*(iVar4 + iVar3 * 0x5c + 0x24c) == 0)))) {
        bVar1 = true;
      }
    }
    if (!bVar1) {
      FUN_562a_0607();
      return 0;
    }
  }
  iVar2 = FUN_562a_041c(param_1);
  if (iVar2 == 0) {
    FUN_562a_066d(param_1,0);
  }
  else {
    FUN_562a_1579(param_1);
    bVar1 = false;
    uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar5 = DAT_451b_018e;
    iVar2 = *(iVar5 + 0x24a);
    while (iVar4 = iVar2 + -1, iVar2 != 0) {
      iVar2 = iVar4;
      if (((*(iVar5 + iVar4 * 0x5c + 0x24c) != 0) && (iVar4 != param_1)) &&
         (*(iVar5 + iVar4 * 0x5c + 0x250) == *(iVar5 + param_1 * 0x5c + 0x250))) {
        bVar1 = true;
      }
    }
    if (((!bVar1) &&
        (*(*(iVar5 + param_1 * 0x5c + 0x250) * 0x41 + 0x1592) == DAT_3c04_0110)) ||
       (iVar2 = FUN_562a_02ed(param_1), iVar2 != 0)) {
      FUN_562a_0996(param_1);
      uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (*(DAT_451b_018e + param_1 * 0x5c + 0x24c) != 0) {
        thunk_FUN_5c8e_023f(*(DAT_451b_018e + param_1 * 0x5c + 0x250),1);
        iVar2 = FUN_562a_06e9(param_1);
        if (iVar2 != 0) {
          uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
          if (-1 < *(DAT_451b_018e + param_1 * 0x5c + 0x250)) {
            thunk_FUN_5c8e_023f(*(DAT_451b_018e + param_1 * 0x5c + 0x250),1);
          }
        }
        if (*(DAT_451b_018e + param_1 * 0x5c + 0x24c) != 0) {
          FUN_562a_16fd(param_1);
          return 1;
        }
      }
    }
  }
  return 0;
}

