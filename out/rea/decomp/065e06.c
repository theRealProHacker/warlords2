
void __cdecl16far FUN_6513_0cd6(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int local_12;
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  local_a = thunk_FUN_7e8f_02bf();
  local_a = param_1 - local_a;
  local_8 = thunk_FUN_7e8f_02bf();
  local_8 = param_2 - local_8;
  local_6 = thunk_FUN_7e8f_02bf();
  local_4 = thunk_FUN_7e8f_02bf();
  if (local_a < 0) {
    local_a = 0;
  }
  if (local_8 < 0) {
    local_8 = 0;
  }
  if (0x6f < local_a + local_6) {
    local_6 = 0x6f - local_a;
  }
  if (0x9b < local_8 + local_4) {
    local_4 = 0x9b - local_8;
  }
  local_12 = local_a * 2 + 0x50;
  local_10 = local_8 * 2 + 0x3c;
  local_e = local_6 << 1;
  local_c = local_4 << 1;
  FUN_22bf_07a5();
  for (iVar1 = local_a; iVar2 = local_8, iVar1 < local_a + local_6; iVar1 = iVar1 + 1) {
    for (; iVar2 < local_8 + local_4; iVar2 = iVar2 + 1) {
      thunk_FUN_85d0_1298();
    }
  }
  FUN_22bf_0757();
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    thunk_FUN_830b_2200();
    FUN_22bf_07a5();
    FUN_24d0_0002();
    FUN_216d_01fd(&local_12);
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

