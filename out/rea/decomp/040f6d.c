
void __cdecl16far thunk_FUN_830b_1fed(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  if ((DAT_3c04_0124 != 0) &&
     (((*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0 || (DAT_3c04_0159 != 0)) && (DAT_4125_3254 == 0))))
  {
    uVar4 = 0x216d;
    FUN_216d_002e(&iStack_12);
    if (iStack_12 < 0) {
      iStack_e = iStack_e + iStack_12;
      iStack_12 = 0;
    }
    if (iStack_10 < 0) {
      iStack_c = iStack_c + iStack_10;
      iStack_10 = 0;
    }
    if (0x6f < iStack_12 + iStack_e) {
      iStack_e = 0x6f - iStack_12;
    }
    if (0x9b < iStack_10 + iStack_c) {
      iStack_c = 0x9b - iStack_10;
    }
    iStack_a = iStack_12 << 1;
    iStack_8 = iStack_10 << 1;
    iStack_6 = iStack_e << 1;
    iStack_4 = iStack_c << 1;
    iVar3 = iStack_a;
    if ((DAT_451b_158d != 0) && ((DAT_451b_15b8 & 10) == 0)) {
      for (iVar2 = 0; iVar3 = iStack_a, iVar2 < (int)(uint)DAT_451b_15b7; iVar2 = iVar2 + 1) {
        uVar4 = 0x1d28;
        uVar1 = FUN_1d28_069a(((undefined4 *)&DAT_451b_158d)[iVar2]);
        ((undefined2 *)&DAT_451b_159f)[iVar2 * 2] = param_1;
        ((undefined2 *)&DAT_451b_159d)[iVar2 * 2] = uVar1;
      }
    }
    for (; iVar2 = iStack_8, iVar3 <= iStack_a + iStack_6; iVar3 = iVar3 + 1) {
      for (; iVar2 <= iStack_8 + iStack_4; iVar2 = iVar2 + 1) {
        (*DAT_451b_2a70)(uVar4,0x54e3,0x4125,iVar3,iVar2,0);
      }
    }
    if ((DAT_451b_158d != 0) && ((DAT_451b_15b8 & 10) == 0)) {
      for (iVar3 = 0; iVar3 < (int)(uint)DAT_451b_15b7; iVar3 = iVar3 + 1) {
        FUN_1d28_07a9(((undefined4 *)&DAT_451b_158d)[iVar3]);
      }
    }
    iVar3 = thunk_FUN_54e4_08bf();
    if (iVar3 == 0) {
      thunk_FUN_891f_05ec();
      FUN_830b_0000(param_3,1,&iStack_12);
    }
  }
  return;
}

