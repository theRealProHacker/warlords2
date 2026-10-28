// ovl26:0080 ent 5e840

void __cdecl16far FUN_5e7c_0080(void)

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
  int local_20;
  int local_1e;
  byte abStack_13 [7];
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  local_4 = thunk_FUN_7e8f_02bf();
  local_6 = -1;
  local_8 = -1;
  local_a = -1;
  local_c = 0;
  iVar5 = DAT_3c04_157b;
  while (iVar8 = iVar5 + -1, iVar5 != 0) {
    iVar5 = iVar8;
    if ((*(iVar8 * 0x41 + 0x1592) == '\x0f') &&
       ((*(DAT_451b_018e + iVar8 + 0x11e) & 1) != 0)) {
      thunk_FUN_5d9f_0656(iVar8,0,abStack_13 + 1);
      bVar4 = false;
      iVar6 = 6;
      while (iVar7 = iVar6, iVar6 = iVar7 + -1, iVar7 != 0) {
        if ((abStack_13[iVar7] != 0xff) &&
           (*(abStack_13[iVar7] * 0x41 + 0x1592) == DAT_3c04_0110)) {
          bVar4 = true;
        }
      }
      if (bVar4) {
        uVar2 = *(iVar8 * 0x41 + 0x157d);
        uVar3 = *(iVar8 * 0x41 + 0x157f);
        local_1e = 0;
        local_20 = 1000;
        iVar6 = DAT_3c04_157b;
        while (iVar7 = iVar6 + -1, iVar6 != 0) {
          iVar6 = iVar7;
          if (*(iVar7 * 0x41 + 0x1592) == '\x0f') {
            if (((*(DAT_451b_018e + iVar7 + 0x11e) & 1) != 0) &&
               (iVar7 = FUN_1a8b_0acc(uVar2,uVar3,*(iVar7 * 0x41 + 0x157d),
                                      *(iVar7 * 0x41 + 0x157f)), iVar7 < 0x14)) {
              local_1e = local_1e + 1;
            }
          }
          else if ((*(iVar7 * 0x41 + 0x1592) == DAT_3c04_0110) &&
                  (iVar7 = FUN_1a8b_0acc(uVar2,uVar3,*(iVar7 * 0x41 + 0x157d),
                                         *(iVar7 * 0x41 + 0x157f)), iVar7 < local_20))
          {
            local_20 = iVar7;
          }
        }
        if ((3 < local_1e) &&
           ((local_a < local_1e || ((local_1e == local_a && (local_c < local_20)))))) {
          local_c = local_20;
          local_a = local_1e;
          local_6 = *(iVar8 * 0x41 + 0x157d);
          local_8 = *(iVar8 * 0x41 + 0x157f);
        }
      }
    }
  }
  if ((DAT_3c04_0124 == 0) || (local_6 == -1)) {
    piVar1 = (DAT_3c04_0110 * 0x14 + 0x185);
    *piVar1 = *piVar1 + local_4;
  }
  else {
    iVar5 = thunk_FUN_7e8f_02bf();
    iVar8 = thunk_FUN_7e8f_02bf();
    if (SCARRY2(local_6,iVar5) == local_6 + iVar5 < 0) {
      local_6 = local_6 + iVar5;
    }
    else {
      local_6 = 0;
    }
    if (SCARRY2(local_8,iVar8) == local_8 + iVar8 < 0) {
      local_8 = local_8 + iVar8;
    }
    else {
      local_8 = 0;
    }
    if (0x6e < local_6) {
      local_6 = 0x6f;
    }
    if (0x9a < local_8) {
      local_8 = 0x9b;
    }
    thunk_FUN_6513_0cd6(local_6,local_8);
    if (((DAT_3c04_0159 != 0) && (DAT_4125_3254 == 0)) || (*(DAT_3c04_0110 * 2 + 0xd0) == 0))
    {
      thunk_FUN_830b_2200();
      FUN_22bf_07a5();
      thunk_FUN_830b_0000(0x10001,0);
      FUN_22bf_0757();
    }
  }
  return;
}

