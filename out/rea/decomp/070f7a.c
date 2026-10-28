
void __cdecl16far FUN_705a_09da(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 in_DX;
  int iVar4;
  undefined2 uVar5;
  undefined2 uVar6;
  undefined1 local_5c [80];
  int local_c;
  int local_a;
  int local_8;
  
  FUN_22bf_07a5();
  if (param_1 == 0) {
    thunk_FUN_7875_06ae(1,0xf,0,3);
    uVar5 = thunk_FUN_7e8f_04f0(0x70,0);
    thunk_FUN_7e8f_00d6(0x140,0x40,uVar5,in_DX);
    thunk_FUN_85d0_0bf7(DAT_3c04_0110,0,0x342a,0x4125,0x58,0x40);
    thunk_FUN_85d0_0bf7(DAT_3c04_0110,0,0x342a,0x4125,0x200,0x40);
    thunk_FUN_7875_06ae(2,0xf,0,3);
    thunk_FUN_7e8f_04f0(0x70,1,DAT_3c04_0110 * 0x14,0x3c04,DAT_4125_0e98 * 0x41 + 0x1581,0x3c04);
    FUN_1000_4944(local_5c);
    thunk_FUN_7e8f_00d6(0x140,0x68,local_5c);
    thunk_FUN_54e4_070b(0xc4,0x131,0x98,0x14);
    thunk_FUN_7875_06ae(2,0xf,0,3);
    thunk_FUN_7e8f_04f0(0x70,2,*(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x185));
    FUN_1000_4944(local_5c);
    thunk_FUN_7e8f_00d6(0x160,0x16d,local_5c);
    uVar5 = thunk_FUN_7e8f_04f0(0x70,3);
    thunk_FUN_7e8f_00d6(0xb0,0x15c,uVar5,in_DX);
  }
  for (iVar4 = 0; iVar4 < 4; iVar4 = iVar4 + 1) {
    if (*(char *)(DAT_4125_0e98 * 0x41 + iVar4 + 0x1593) < '\0') {
      iVar1 = 1;
      iVar2 = -1;
    }
    else {
      iVar1 = DAT_3c04_0110 + 2;
      iVar2 = (int)*(char *)(DAT_4125_0e98 * 0x41 + iVar4 + 0x1593);
    }
    thunk_FUN_85d0_08be(iVar2,DAT_3c04_0110,0x342a,0x4125,iVar4 * 0x28 + 0x68,0x172,0,0,0,0,iVar1,0,
                        0);
    FUN_216d_002e(&local_a);
    if (DAT_4125_0e86 == iVar4) {
      FUN_24d0_0002(0);
      FUN_216d_01fd(&local_a);
      local_a = local_a + -1;
      local_8 = local_8 + -1;
      FUN_24d0_0002(9);
    }
    else {
      FUN_24d0_0002(3);
      FUN_216d_01fd(&local_a);
      local_a = local_a + -1;
      local_8 = local_8 + -1;
    }
    FUN_216d_01fd(&local_a);
  }
  FUN_705a_1128();
  thunk_FUN_7875_06ae(2,0xf,0,3);
  iVar4 = 0;
  iVar1 = 0;
  do {
    if (0x1b < iVar4) {
      FUN_705a_11e2();
      FUN_22bf_0757();
      return;
    }
    uVar5 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    iVar2 = (int)DAT_451b_051c;
    if (-1 < *(int *)(iVar2 + iVar4 * 0x3e + 0x1e)) {
      local_c = 0;
      for (iVar3 = 0; iVar3 < 4; iVar3 = iVar3 + 1) {
        if ((int)*(char *)(DAT_4125_0e98 * 0x41 + iVar3 + 0x1593) == *(int *)(iVar2 + iVar4 * 0x3e))
        {
          local_c = 1;
          break;
        }
      }
      if ((*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < *(int *)(iVar2 + iVar4 * 0x3e + 0x1e)) ||
         (local_c != 0)) {
        uVar6 = 1;
      }
      else {
        uVar6 = 0;
      }
      thunk_FUN_85d0_08be(*(undefined2 *)(iVar2 + iVar4 * 0x3e),DAT_3c04_0110,0x342a,0x4125,
                          (iVar1 % 4) * 0x78 + 0x58,(iVar1 / 4) * 0x1f + 0x88,0,0,0,0,1,0,uVar6);
      if (param_1 == 0) {
        FUN_1000_4944(local_5c);
        thunk_FUN_7e8f_00bf((iVar1 % 4) * 0x78 + 0x80,(iVar1 / 4) * 0x1f + 0x8e,local_5c);
      }
      iVar1 = iVar1 + 1;
    }
    iVar4 = iVar4 + 1;
  } while( true );
}

