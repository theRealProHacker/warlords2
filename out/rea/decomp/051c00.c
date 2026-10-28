
undefined2 __cdecl16far FUN_5131_08f0(int param_1)

{
  bool bVar1;
  bool bVar2;
  undefined2 uVar3;
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  bVar2 = false;
  uVar3 = 0;
  local_c = 0;
  local_a = (param_1 % 4) * 0x1c;
  local_8 = (param_1 / 4) * 0x4e;
  local_6 = 0x1c;
  local_4 = 0x4e;
  do {
    if (bVar2) {
      return uVar3;
    }
    uVar3 = thunk_FUN_7e8f_02bf(1,DAT_3c04_157b,0xffff);
    FUN_216d_000e(&local_10);
    if ((((local_10 < local_a) || (local_a + local_6 <= local_10)) || (local_e < local_8)) ||
       (local_8 + local_4 <= local_e)) {
      bVar2 = false;
    }
    else {
      bVar2 = true;
    }
    bVar1 = local_c < 0xc9;
    local_c = local_c + 1;
  } while (bVar1);
  return uVar3;
}

