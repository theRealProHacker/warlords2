
void __cdecl16far FUN_899d_1b9c(undefined4 param_1)

{
  int *piVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  undefined2 uVar9;
  undefined1 local_52 [32];
  int local_32;
  int local_30;
  int local_2e;
  int local_2c;
  int local_2a;
  int local_28;
  int local_26;
  int local_24;
  int local_14;
  int local_12;
  int local_10;
  int local_e;
  undefined4 local_c;
  int local_8;
  int local_6;
  int local_4;
  
  iVar7 = 0;
  local_e = 0;
  local_10 = 0;
  local_12 = 0;
  local_14 = 0;
  uVar9 = 0x4030;
  local_6 = thunk_FUN_6a62_0000(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1]);
  for (iVar6 = 0; iVar6 < DAT_4125_30f6; iVar6 = iVar6 + 1) {
    if (((undefined2 *)&DAT_451b_28e2)[iVar6] != 0) {
      uVar2 = ((undefined2 *)&DAT_451b_2904)[iVar6 * 2];
      iVar4 = ((undefined2 *)&DAT_451b_2902)[iVar6 * 2];
      local_c = CONCAT22(uVar2,iVar4);
      local_4 = (int)*(char *)(iVar4 + 4);
      if ((*(uint *)(iVar4 + 0xc) & 0x1000) == 0) {
        if (local_4 != 0x1c) {
          thunk_FUN_705a_14ac(uVar9,local_4,local_52);
          uVar9 = 0x4058;
        }
        if (local_4 == 0x1c) {
          local_8 = thunk_FUN_6a62_0d1a(local_c);
          uVar9 = (undefined2)((ulong)local_c >> 0x10);
          if (*(char *)((int)local_c + 8) + local_8 < 9) {
            local_8 = *(char *)((int)local_c + 8) + local_8;
          }
          else {
            local_8 = 9;
          }
          iVar4 = *(int *)(local_8 * 2 + 0xce4);
          uVar9 = 0x4030;
          iVar3 = thunk_FUN_6a62_0d71(local_c);
          iVar7 = iVar7 + iVar4 + iVar3;
        }
        else if (((local_24 == 0) || (local_6 != 3)) || (local_24 <= local_e)) {
          if (((local_26 == 0) || (local_6 != 2)) || (local_26 <= local_10)) {
            if (((local_28 == 0) || (local_6 != 1)) || (local_28 <= local_12)) {
              if (((local_2a != 0) && (local_6 == 0)) && (local_14 < local_2a)) {
                iVar7 = iVar7 + (local_2a - local_14);
                local_14 = local_2a;
              }
            }
            else {
              iVar7 = iVar7 + (local_28 - local_12);
              local_12 = local_28;
            }
          }
          else {
            iVar7 = iVar7 + (local_26 - local_10);
            local_10 = local_26;
          }
        }
        else {
          iVar7 = iVar7 + (local_24 - local_e);
          local_e = local_24;
        }
      }
    }
  }
  if (DAT_3c04_0112 < iVar7) {
    iVar7 = DAT_3c04_0112;
  }
  iVar6 = 0;
  do {
    if (DAT_4125_30f6 <= iVar6) {
      return;
    }
    if (((undefined2 *)&DAT_451b_28e2)[iVar6] != 0) {
      uVar2 = ((undefined2 *)&DAT_451b_2904)[iVar6 * 2];
      iVar4 = ((undefined2 *)&DAT_451b_2902)[iVar6 * 2];
      local_c = CONCAT22(uVar2,iVar4);
      local_4 = (int)*(char *)(iVar4 + 4);
      uVar8 = (undefined2)((ulong)param_1 >> 0x10);
      iVar3 = (int)param_1;
      *(int *)(iVar3 + iVar6 * 2) = (int)*(char *)(iVar4 + 8);
      if (local_4 != 0x1c) {
        thunk_FUN_705a_14ac(uVar9,local_4,local_52);
        uVar9 = 0x4058;
      }
      if ((*(uint *)((int)local_c + 0xc) & 0x1000) == 0) {
        if (local_4 == 0x1c) {
          uVar9 = 0x4030;
          iVar4 = thunk_FUN_6a62_0d1a(local_c);
          piVar5 = (int *)(iVar3 + iVar6 * 2);
        }
        else if ((local_2c == 0) || (local_6 != 3)) {
          if ((local_2e == 0) || (local_6 != 2)) {
            if ((local_30 == 0) || (local_6 != 1)) {
              if ((local_32 == 0) || (local_6 != 0)) goto LAB_899d_1e07;
              piVar5 = (int *)(iVar3 + iVar6 * 2);
              iVar4 = local_32;
            }
            else {
              piVar5 = (int *)(iVar3 + iVar6 * 2);
              iVar4 = local_30;
            }
          }
          else {
            piVar5 = (int *)(iVar3 + iVar6 * 2);
            iVar4 = local_2e;
          }
        }
        else {
          piVar5 = (int *)(iVar3 + iVar6 * 2);
          iVar4 = local_2c;
        }
        *piVar5 = *piVar5 + iVar4;
      }
      else {
        *(undefined2 *)(iVar3 + iVar6 * 2) = 4;
      }
LAB_899d_1e07:
      piVar5 = (int *)(iVar3 + iVar6 * 2);
      if (*piVar5 < 9) {
        iVar4 = *piVar5;
      }
      else {
        iVar4 = 9;
      }
      piVar5 = (int *)(iVar3 + iVar6 * 2);
      *piVar5 = iVar4;
      piVar1 = piVar5;
      *piVar1 = *piVar1 + iVar7;
    }
    iVar6 = iVar6 + 1;
  } while( true );
}

