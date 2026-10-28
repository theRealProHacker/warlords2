
int __cdecl16far FUN_1a8b_07f9(int *param_1)

{
  int *piVar1;
  undefined4 uVar2;
  char cVar3;
  int iVar4;
  uint uVar5;
  int *piVar6;
  int iVar8;
  undefined2 uVar9;
  undefined2 unaff_SS;
  byte local_7c [100];
  uint local_18;
  int local_16;
  char local_13;
  int local_12;
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  int *piVar7;
  
  uVar9 = (undefined2)((ulong)param_1 >> 0x10);
  local_4 = *param_1;
  local_6 = ((int *)param_1)[1];
  local_8 = 0;
  local_a = 0;
  local_c = 0;
  local_10 = DAT_451b_1ea0;
  local_e = DAT_451b_1e9e;
  if (DAT_4125_2bda == 0) {
    local_e = 1;
    local_10 = (int)*(char *)((int)DAT_451b_1f02 + 7);
  }
  DAT_451b_1e64 = 0;
  DAT_4125_2eaa = FUN_1555_18be(param_1,local_10,local_7c);
  local_12 = DAT_4125_2eaa;
  iVar8 = 0;
  do {
    if (local_12 <= iVar8) {
LAB_1a8b_09d1:
      if (local_8 != 0) {
        local_18 = (uint)local_7c[local_8 + -1];
        FUN_1a8b_04c8(param_1,local_8);
        if (DAT_4125_2bda == 0) {
          uVar9 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
          local_13 = *(char *)((int)DAT_451b_1f02 + 7);
          if ((int)local_13 < (int)local_18) {
            local_13 = '\0';
          }
          else {
            local_13 = local_13 - (char)local_18;
          }
          *(char *)((int)DAT_451b_1f02 + 7) = local_13;
        }
        else {
          local_16 = DAT_451b_1ea0 - local_18;
          if (DAT_451b_1ea0 < (int)local_18) {
            local_16 = 0;
          }
          iVar8 = 8;
          piVar6 = (int *)&DAT_451b_1efe;
          DAT_451b_1ea0 = local_16;
          while( true ) {
            piVar7 = piVar6 + -2;
            iVar4 = iVar8 + -1;
            if (iVar8 == 0) break;
            piVar1 = piVar6 + -1;
            iVar8 = iVar4;
            piVar6 = piVar7;
            if (*piVar7 != 0 || *piVar1 != 0) {
              if ((int)*(char *)((int)*(undefined4 *)piVar7 + 7) < (int)local_18) {
                cVar3 = '\0';
              }
              else {
                cVar3 = *(char *)((int)*(undefined4 *)piVar7 + 7) - (char)local_18;
              }
              *(char *)((int)*(undefined4 *)piVar7 + 7) = cVar3;
            }
          }
        }
      }
      iVar8 = DAT_451b_1ea0;
      if (DAT_4125_2bda == 0) {
        iVar8 = (int)*(char *)((int)DAT_451b_1f02 + 7);
      }
      if ((iVar8 < 2) ||
         (((local_8 != 0 && (local_c != 5)) &&
          ((local_c != 3 && ((local_7c[local_8] != 0xff && (iVar8 < (int)(uint)local_7c[local_8]))))
          )))) {
        local_c = 2;
      }
      return local_c;
    }
    uVar2 = *(undefined4 *)((int *)param_1 + 6);
    if ((*(char *)((int)uVar2 + iVar8) == -1) || (iVar4 = FUN_1a8b_0b4d(&local_4), iVar4 == 0)) {
      local_c = 4;
      goto LAB_1a8b_09d1;
    }
    iVar4 = local_6 * 0xe0;
    uVar5 = *(byte *)(iVar4 + local_4 * 2 + 1) & 0xf;
    if ((*(char *)(*(byte *)(iVar4 + local_4 * 2) + 0x710) == '\n') && (DAT_3c04_0110 != uVar5)) {
      local_c = 5;
      DAT_451b_1e68 = local_4;
      DAT_451b_1e66 = local_6;
      goto LAB_1a8b_09d1;
    }
    if ((((*(byte *)(iVar4 + local_4 * 2 + 1) & 0x10) != 0) && (DAT_3c04_0110 != uVar5)) &&
       ((*(byte *)(DAT_3c04_0110 * 8 + uVar5 + 0x153b) & 3) != 0)) {
      local_c = 3;
      DAT_451b_1e68 = local_4;
      DAT_451b_1e66 = local_6;
      goto LAB_1a8b_09d1;
    }
    FUN_1b62_007d();
    if (((int)(local_e + local_18) < 9) &&
       (((*(byte *)(local_6 * 0xe0 + local_4 * 2 + 1) & 0x10) == 0 || (DAT_3c04_0110 == uVar5)))) {
      local_8 = local_8 + local_a + 1;
      local_a = 0;
    }
    else {
      local_a = local_a + 1;
    }
    iVar8 = iVar8 + 1;
  } while( true );
}

