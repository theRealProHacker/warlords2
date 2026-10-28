
void __cdecl16far thunk_FUN_6513_0cd6(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_a = thunk_FUN_7e8f_02bf();
  iStack_a = param_1 - iStack_a;
  iStack_8 = thunk_FUN_7e8f_02bf();
  iStack_8 = param_2 - iStack_8;
  iStack_6 = thunk_FUN_7e8f_02bf();
  iStack_4 = thunk_FUN_7e8f_02bf();
  if (iStack_a < 0) {
    iStack_a = 0;
  }
  if (iStack_8 < 0) {
    iStack_8 = 0;
  }
  if (0x6f < iStack_a + iStack_6) {
    iStack_6 = 0x6f - iStack_a;
  }
  if (0x9b < iStack_8 + iStack_4) {
    iStack_4 = 0x9b - iStack_8;
  }
  iStack_12 = iStack_a * 2 + 0x50;
  iStack_10 = iStack_8 * 2 + 0x3c;
  iStack_e = iStack_6 << 1;
  iStack_c = iStack_4 << 1;
  FUN_22bf_07a5();
  for (iVar1 = iStack_a; iVar2 = iStack_8, iVar1 < iStack_a + iStack_6; iVar1 = iVar1 + 1) {
    for (; iVar2 < iStack_8 + iStack_4; iVar2 = iVar2 + 1) {
      thunk_FUN_85d0_1298();
    }
  }
  FUN_22bf_0757();
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    thunk_FUN_830b_2200();
    FUN_22bf_07a5();
    FUN_24d0_0002();
    FUN_216d_01fd(&iStack_12);
    thunk_FUN_7e8f_0000();
    thunk_FUN_830b_0000(0x10001,0);
    thunk_FUN_54e4_070b(0x1160008,0x1700f0);
    FUN_18a9_03b3();
    FUN_18a9_03b3();
    FUN_18a9_03b3();
    FUN_18a9_0839();
    FUN_18a9_066e(0x1011a);
    FUN_22bf_0757();
  }
  return;
}

