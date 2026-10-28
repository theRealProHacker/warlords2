
void __cdecl16far FUN_6513_08a1(int param_1)

{
  char cVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  undefined4 local_6;
  
  local_8 = -1;
  local_a = -1;
  local_c = -1;
  local_e = -1;
  for (iVar4 = 0; iVar4 < DAT_3c04_080f; iVar4 = iVar4 + 1) {
    iVar5 = local_c;
    iVar6 = local_a;
    iVar3 = local_8;
    if ((((*(char *)(iVar4 * 0x1f + 0x829) == '\x01') && (iVar3 = iVar4, -1 < local_8)) &&
        (iVar6 = iVar4, iVar3 = local_8, -1 < local_a)) &&
       ((iVar5 = iVar4, iVar6 = local_a, -1 < local_c && (iVar5 = local_c, local_e < 0)))) {
      local_e = iVar4;
    }
    local_8 = iVar3;
    local_a = iVar6;
    local_c = iVar5;
  }
  iVar4 = 0;
  for (iVar5 = 0; iVar6 = iVar4, iVar5 < 8; iVar5 = iVar5 + 1) {
    if (DAT_4125_2bda == 0) {
      local_6 = DAT_451b_1f02;
    }
    else {
      in_DX = ((undefined2 *)&DAT_451b_1ede)[iVar5 * 2];
      local_6 = CONCAT22(*(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar5 * 4),in_DX);
    }
    if (local_6 != 0) {
      iVar3 = (int)local_6;
      if (param_1 == local_8) {
        if ((*(uint *)(iVar3 + 0xc) & 2) == 0) {
          FUN_1b62_0005(iVar3,local_6._2_2_,1);
          *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 2;
          cVar1 = *(char *)(iVar3 + 4);
          goto joined_r0x00065b41;
        }
      }
      else if (param_1 == local_a) {
        if ((*(uint *)(iVar3 + 0xc) & 4) == 0) {
          FUN_1b62_0005(iVar3,local_6._2_2_,1);
          *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 4;
          cVar1 = *(char *)(iVar3 + 4);
          goto joined_r0x00065b41;
        }
      }
      else if (param_1 == local_c) {
        if ((*(uint *)(iVar3 + 0xc) & 8) == 0) {
          FUN_1b62_0005(iVar3,local_6._2_2_,1);
          *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 8;
          cVar1 = *(char *)(iVar3 + 4);
joined_r0x00065b41:
          iVar6 = iVar4 + 1;
          if (cVar1 == '\x1c') {
            thunk_FUN_7533_04f1(iVar3,local_6._2_2_,1);
            iVar6 = iVar4 + 1;
          }
        }
      }
      else if ((param_1 == local_e) && ((*(uint *)(iVar3 + 0xc) & 0x10) == 0)) {
        FUN_1b62_0005(iVar3,local_6._2_2_,1);
        *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 0x10;
        cVar1 = *(char *)(iVar3 + 4);
        goto joined_r0x00065b41;
      }
      iVar4 = iVar6;
      if (DAT_4125_2bda == 0) break;
    }
  }
  if (iVar6 == 0) {
    uVar2 = 0x37;
  }
  else {
    if (iVar6 != 1) {
      uVar2 = thunk_FUN_7e8f_04f0(0x38,1,iVar6);
      FUN_1000_4944(0x5c38,0x4125,uVar2,in_DX);
      goto LAB_6513_0a77;
    }
    uVar2 = 0x38;
  }
  uVar2 = thunk_FUN_7e8f_04f0(uVar2,0);
  FUN_1000_4944(0x5c38,0x4125,uVar2,in_DX);
LAB_6513_0a77:
  iVar4 = thunk_FUN_5d9f_09ab();
  if (iVar4 == 0) {
    uVar2 = thunk_FUN_7e8f_04f0(0x38,2);
    thunk_FUN_8027_1160(0x5c38,0x4125,uVar2,in_DX);
  }
  return;
}

