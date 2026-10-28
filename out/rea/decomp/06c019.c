
void __cdecl16far FUN_6bf2_00f9(void)

{
  undefined2 uVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  undefined1 local_62 [80];
  int local_12;
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  FUN_22bf_07a5();
  uVar3 = 0x8880;
  uVar2 = *(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780);
  uVar1 = *(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x777e);
  FUN_1b62_007d(uVar2,uVar1,&local_4);
  local_8 = thunk_FUN_824f_044a(uVar2,uVar1);
  local_6 = thunk_FUN_824f_04fa(uVar2,uVar1,0x1000e);
  if (DAT_4125_166a == 0) {
    DAT_4125_166a = 1;
    thunk_FUN_54e4_0000();
    FUN_24d0_0002();
    uVar2 = FUN_216d_002e(&local_12);
    FUN_216d_01fd(uVar2,uVar3);
    local_12 = local_12 + -1;
    local_10 = local_10 + -1;
    local_e = local_e + 2;
    local_c = local_c + 2;
    FUN_24d0_02e5(&local_12);
  }
  else {
    thunk_FUN_54e4_070b(0,0x910100);
    thunk_FUN_54e4_070b(0x11e0000,0x150048);
  }
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  thunk_FUN_7e8f_00d6(0x3e01b0,*(char *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 +
                                        -0x7776) * 0x14 + 0x223,0x3c04);
  thunk_FUN_85d0_08be(0x1c,DAT_3c04_0110,0x342a,0x4125,0x130,0x6e,0,0x10000,0);
  iVar5 = 1;
  for (iVar4 = 0; iVar4 < local_4; iVar4 = iVar4 + 1) {
    uVar3 = 0x2e1d;
    if ((*(int *)((int)(undefined4 *)&DAT_451b_1ebe + iVar4 * 4 + 2) != 0x2e1d) ||
       (((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780 !=
        *(int *)((undefined4 *)&DAT_451b_1ebe + iVar4))) {
      thunk_FUN_85d0_08be((int)*(char *)((int)((undefined4 *)&DAT_451b_1ebe)[iVar4] + 4),
                          DAT_3c04_0110,0x342a,0x4125,iVar5 * 0x20 + 0x130,0x6e,0,0x10000,0);
      iVar5 = iVar5 + 1;
    }
  }
  for (; iVar5 < 8; iVar5 = iVar5 + 1) {
    thunk_FUN_85d0_08be(0xffff,DAT_3c04_0110,0x342a,0x4125,iVar5 * 0x20 + 0x130,0x6e,0,0x10000,0);
  }
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  uVar2 = thunk_FUN_7e8f_04f0(0x83,-1 < local_8);
  thunk_FUN_7e8f_0103(0x910180,uVar2,uVar3);
  uVar2 = thunk_FUN_7e8f_04f0(0x20083);
  thunk_FUN_7e8f_0103(0xa50180,uVar2,uVar3);
  uVar2 = thunk_FUN_7e8f_04f0(0x30083);
  thunk_FUN_7e8f_0103(0xb90180,uVar2,uVar3);
  uVar2 = thunk_FUN_7e8f_04f0(0x40083);
  thunk_FUN_7e8f_0103(0xa50210,uVar2,uVar3);
  uVar2 = thunk_FUN_7e8f_04f0(0x50083);
  thunk_FUN_7e8f_0103(0xb90210,uVar2);
  thunk_FUN_7e8f_04f0(0x60083,DAT_4125_0d6a + 1);
  FUN_1000_4944(local_62);
  thunk_FUN_7e8f_00bf(0x15b0138,local_62);
  iVar4 = (int)*(char *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7778);
  iVar5 = thunk_FUN_6a62_0d1a();
  iVar4 = iVar4 + iVar5;
  if (9 < iVar4) {
    iVar4 = 9;
  }
  local_a = thunk_FUN_6a62_0d71(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780,
                                0x2e1d);
  local_a = *(int *)(iVar4 * 2 + 0xce4) + local_a;
  thunk_FUN_7e8f_00bf(0x910188,local_6 * 0x41 + 0x1581,0x3c04);
  thunk_FUN_6a62_0d1a(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780,0x2e1d);
  FUN_1000_4944();
  thunk_FUN_7e8f_00bf(0xa50188,local_62);
  FUN_1000_4944();
  thunk_FUN_7e8f_00bf(0xb90188,local_62);
  FUN_1000_4944();
  thunk_FUN_7e8f_00bf(0xa50218,local_62);
  FUN_1000_4944();
  thunk_FUN_7e8f_00bf(0xb90218,local_62);
  thunk_FUN_7938_03d9();
  if (DAT_451b_08ce == 0) {
    DAT_4125_0d6c = 0;
  }
  else {
    DAT_4125_0d6c = (uint)(*(char *)(DAT_451b_0c9c * 0x1d + 0xcff) == '\x01');
  }
  DAT_451b_04a8 = 0xffff;
  if (DAT_451b_08ce < 1) {
    DAT_451b_04aa = 0xffff;
  }
  else {
    DAT_451b_04aa = 0;
  }
  if (DAT_451b_08ce < 2) {
    DAT_451b_04ac = 0xffff;
  }
  else {
    DAT_451b_04ac = 1;
  }
  FUN_6bf2_0724();
  FUN_22bf_0757();
  FUN_18a9_0345();
  return;
}

