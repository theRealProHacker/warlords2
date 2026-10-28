
void __cdecl16far FUN_76ef_1608(int param_1)

{
  byte *pbVar1;
  undefined2 uVar2;
  int in_DX;
  int iVar3;
  int iVar4;
  
  thunk_FUN_54e4_069c();
  DAT_4125_166a = 0;
  if (param_1 == 0) {
    uVar2 = thunk_FUN_7e8f_04f0(0x600a5);
    thunk_FUN_8027_10fb(uVar2,in_DX);
    uVar2 = thunk_FUN_7e8f_04f0(0x700a5);
    thunk_FUN_8027_10fb(uVar2,in_DX);
    uVar2 = thunk_FUN_7e8f_04f0(0x800a5);
    thunk_FUN_8027_10fb(uVar2,in_DX);
    uVar2 = thunk_FUN_7e8f_04f0(0xa00a5);
    uVar2 = thunk_FUN_7e8f_04f0(0x900a5,uVar2,in_DX);
    thunk_FUN_8027_1160(uVar2,in_DX);
    thunk_FUN_85d0_006c();
  }
  for (iVar3 = 0; iVar4 = DAT_3c04_0181, iVar3 < DAT_3c04_157b; iVar3 = iVar3 + 1) {
    in_DX = 0x3c04;
    if (*(char *)(iVar3 * 0x41 + 0x1592) == DAT_3c04_0110) {
      thunk_FUN_647b_016b();
    }
  }
  while (iVar3 = iVar4 + -1, iVar4 != 0) {
    in_DX = 0x3c04;
    iVar4 = iVar3;
    if (*(char *)(iVar3 * 0x16 + -0x777b) == DAT_3c04_0110) {
      if (*(char *)(iVar3 * 0x16 + -0x777c) == '\x1c') {
        thunk_FUN_67a7_16cd(iVar3 * 0x16 + -0x7780,0x2e1d,*(undefined2 *)(iVar3 * 0x16 + -0x7780),
                            *(undefined2 *)(iVar3 * 0x16 + -0x777e));
      }
      in_DX = iVar3 * 0x16 + -0x7780;
      FUN_1b62_03be();
    }
  }
  if (DAT_3c04_0124 != 0) {
    for (in_DX = 0; in_DX < 0x70; in_DX = in_DX + 1) {
      for (iVar3 = 0; iVar3 < 0x9c; iVar3 = iVar3 + 1) {
        pbVar1 = (byte *)(iVar3 * 0x70 + in_DX);
        *pbVar1 = *pbVar1 | 0x20;
      }
    }
    thunk_FUN_830b_2200();
  }
  DAT_451b_1efe = 0;
  DAT_451b_1f02 = 0;
  for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
    *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) = 0;
    ((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] = 0;
  }
  thunk_FUN_824f_0000();
  thunk_FUN_824f_0af3();
  thunk_FUN_8027_011f();
  if (param_1 == 1) {
    uVar2 = thunk_FUN_7e8f_04f0(0x500a5);
    uVar2 = thunk_FUN_7e8f_04f0(0x400a5,uVar2,in_DX);
    thunk_FUN_8027_1160(uVar2,in_DX);
  }
  return;
}

