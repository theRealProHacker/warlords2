
void __cdecl16far FUN_5ab9_0c5b(int param_1)

{
  bool bVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  int local_1e [8];
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  bVar1 = false;
  local_c = thunk_FUN_57d5_0981(*(undefined2 *)(param_1 * 0x16 + -0x7780),
                                *(undefined2 *)(param_1 * 0x16 + -0x777e),DAT_3c04_0110);
  if ((*(char *)(param_1 * 0x16 + -0x7778) < '\x03') || (*(char *)(param_1 * 0x16 + -0x777a) < '\b')
     ) {
    bVar1 = true;
  }
  if ((((undefined1 *)&DAT_451b_0664)[*(char *)(param_1 * 0x16 + -0x777c) * 6] == '\0') && (bVar1))
  {
    thunk_FUN_5c8e_015e(param_1,1);
  }
  else {
    local_4 = thunk_FUN_621e_12c9(*(undefined2 *)(param_1 * 0x16 + -0x7780),
                                  *(undefined2 *)(param_1 * 0x16 + -0x777e),local_1e);
    if (local_4 != 0) {
      bVar2 = false;
      iVar3 = 8;
      while (iVar4 = iVar3 + -1, iVar3 != 0) {
        local_e = local_1e[iVar4];
        iVar3 = iVar4;
        if ((local_e != -1) && (*(char *)(local_e * 0x16 + -0x7779) < '\b')) {
          local_1e[iVar4] = -1;
          bVar2 = true;
        }
      }
      local_a = 0;
      local_8 = 0;
      local_6 = 0;
      iVar3 = 8;
      while (iVar4 = iVar3 + -1, iVar3 != 0) {
        local_e = local_1e[iVar4];
        iVar3 = iVar4;
        if (local_e != -1) {
          if (((undefined1 *)&DAT_451b_0664)[*(char *)(local_e * 0x16 + -0x777c) * 6] == '\0') {
            if (*(char *)(local_e * 0x16 + -0x777c) == '\x1c') {
              local_8 = local_8 + 1;
            }
            else {
              local_a = local_a + 1;
            }
          }
          else {
            local_6 = local_6 + 1;
          }
        }
      }
      if (((local_6 != 0) && (local_8 != 0)) && (local_a != 0)) {
        iVar3 = 8;
        while (iVar4 = iVar3 + -1, iVar3 != 0) {
          local_e = local_1e[iVar4];
          iVar3 = iVar4;
          if (((local_e != -1) &&
              (((undefined1 *)&DAT_451b_0664)[*(char *)(local_e * 0x16 + -0x777c) * 6] == '\0')) &&
             (*(char *)(local_e * 0x16 + -0x777c) != '\x1c')) {
            local_1e[iVar4] = -1;
            bVar2 = true;
          }
        }
      }
      if (bVar2) {
        thunk_FUN_621e_14d3(local_1e);
      }
      if ((local_4 < 2) && (bVar1)) {
        thunk_FUN_5c8e_015e(param_1,1);
      }
      else {
        FUN_1c8c_0529();
        if (DAT_451b_1efe == 0) {
          iVar3 = ((int)*(char *)(param_1 * 0x16 + -0x7778) / 2) * 10;
        }
        else {
          iVar3 = 0x32;
        }
        if (local_c + 10 < iVar3) {
          iVar3 = local_c + 10;
        }
        FUN_1555_1ab9(iVar3,*(undefined2 *)(param_1 * 0x16 + -0x7780),
                      *(undefined2 *)(param_1 * 0x16 + -0x777e),DAT_451b_1e9c,DAT_451b_1e9a);
        iVar3 = FUN_5ab9_0f3c(local_4);
        if (iVar3 == -1) {
          thunk_FUN_5c8e_00ca(local_1e);
        }
        else {
          thunk_FUN_621e_0ae7(local_1e);
          uVar5 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
          FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                        *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
        }
      }
    }
  }
  return;
}

