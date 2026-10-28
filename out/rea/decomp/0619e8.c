
void __cdecl16far FUN_606a_1348(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  undefined2 uVar6;
  undefined1 local_22 [16];
  int local_12;
  int local_10;
  uint local_e;
  int local_c;
  uint local_a;
  int local_8;
  int local_6;
  int local_4;
  
  uVar6 = (undefined2)((ulong)param_2 >> 0x10);
  iVar3 = (int)param_2;
  local_8 = *(int *)(iVar3 + param_1 * 2);
  local_e = 0xffff;
  local_10 = 0x14;
  local_12 = 0;
  *(undefined2 *)(iVar3 + 0x3a) = 0xffff;
  *(undefined2 *)(iVar3 + 0x38) = 0xffff;
  if ((*(byte *)(local_8 * 0x16 + -0x7772) & 0xf) == 1) {
    local_a = (uint)(*(byte *)(local_8 * 0x16 + -0x7771) >> 1);
  }
  else {
    local_a = 0xffff;
  }
  local_6 = thunk_FUN_621e_13b2(*(undefined2 *)(local_8 * 0x16 + -0x7780),
                                *(undefined2 *)(local_8 * 0x16 + -0x777e),local_22);
  if (local_6 != 0) {
    if (local_6 < 3) {
      local_4 = 0x5f;
      uVar5 = DAT_3c04_157b;
    }
    else {
      local_4 = 0x4b;
      uVar5 = DAT_3c04_157b;
    }
    while (uVar4 = uVar5, uVar5 = uVar4 - 1, uVar4 != 0) {
      if (((((*(char *)(*(byte *)(*(int *)(uVar5 * 0x41 + 0x157f) * 0xe0 +
                                 *(int *)(uVar5 * 0x41 + 0x157d) * 2) + 0x710) == '\n') &&
            ((*(byte *)((int)DAT_451b_018e + uVar5 + 0x11e) & 1) == 0)) &&
           (*(char *)(uVar5 * 0x41 + 0x1592) != '\x0f')) &&
          ((*(byte *)(DAT_3c04_0110 * 8 + (int)*(char *)(uVar5 * 0x41 + 0x1592) + 0x153b) & 3) == 2)
          ) && ((local_c = FUN_1a8b_0acc(*(undefined2 *)(uVar5 * 0x41 + 0x157d),
                                         *(undefined2 *)(uVar5 * 0x41 + 0x157f),
                                         *(undefined2 *)(local_8 * 0x16 + -0x7780),
                                         *(undefined2 *)(local_8 * 0x16 + -0x777e)),
                local_c <= local_10 || (local_a == uVar5)))) {
        iVar1 = thunk_FUN_621e_15c5(*(undefined2 *)(uVar5 * 0x41 + 0x157d),
                                    *(undefined2 *)(uVar5 * 0x41 + 0x157f));
        if (local_a == uVar5) {
          iVar1 = iVar1 + 0x14;
        }
        uVar2 = FUN_1a8b_0acc(*(undefined2 *)(uVar5 * 0x41 + 0x157d),
                              *(undefined2 *)(uVar5 * 0x41 + 0x157f),
                              *(undefined2 *)(local_8 * 0x16 + -0x7780),
                              *(undefined2 *)(local_8 * 0x16 + -0x777e));
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x9ef,0x4125,uVar4,iVar1,uVar2);
        thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,
                            *(undefined2 *)(uVar5 * 0x41 + 0x157d),
                            *(undefined2 *)(uVar5 * 0x41 + 0x157f));
        if ((local_4 <= iVar1) &&
           ((local_12 < iVar1 || ((iVar1 == local_12 && (local_c < local_10)))))) {
          local_10 = local_c;
          local_12 = iVar1;
          local_e = uVar5;
        }
      }
    }
    *(uint *)(iVar3 + 0x38) = local_e;
    *(int *)(iVar3 + 0x3a) = local_10;
  }
  return;
}

