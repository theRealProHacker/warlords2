
uint __cdecl16far
FUN_5c3a_026b(undefined4 param_1,int param_2,undefined2 param_3,uint param_4,undefined2 param_5)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  byte local_38 [50];
  uint local_6;
  char local_4;
  byte local_3;
  
  iVar1 = 0x32;
  while (iVar1 != 0) {
    local_38[iVar1 + -1] = 0;
    iVar1 = iVar1 + -1;
  }
  FUN_1000_4a70(local_38);
  FUN_5c3a_0000(param_2,param_3,local_38);
  local_3 = 0;
  local_4 = '\0';
  uVar4 = 0;
LAB_5c3a_02ba:
  do {
    local_3 = local_3 ^ 1;
    FUN_5c3a_0144(param_2 + uVar4,param_3,local_38[uVar4],param_5,local_3);
    local_6 = thunk_FUN_7e8f_020d(0);
    FUN_5c3a_0144(param_2 + uVar4,param_3,local_38[uVar4],param_5,0);
    uVar5 = (undefined2)((ulong)param_1 >> 0x10);
    if ((((local_6 == 0x1b) || (local_6 == 0x148)) || (local_6 == 9)) ||
       ((local_6 == 0x150 || (local_6 == 0x10f)))) goto LAB_5c3a_0446;
    if (local_6 == 0xd) {
      if ((uVar4 != 0) && (param_4 - 1 != uVar4)) {
        for (; uVar4 < param_4; uVar4 = uVar4 + 1) {
          local_38[uVar4] = 0;
        }
      }
      for (uVar4 = 0; uVar4 < param_4; uVar4 = uVar4 + 1) {
        *(byte *)((int)param_1 + uVar4) = local_38[uVar4];
      }
LAB_5c3a_0446:
      for (uVar4 = 0; uVar4 < param_4; uVar4 = uVar4 + 1) {
        FUN_5c3a_0144(param_2 + uVar4,param_3,(int)*(char *)((int)param_1 + uVar4),param_5,0);
      }
      return local_6;
    }
    if (local_6 == 0x14d) {
      local_6 = (uint)local_38[uVar4];
    }
    uVar3 = param_4;
    if (local_6 == 0x14f) {
      do {
        uVar2 = uVar3;
        uVar3 = uVar2 - 1;
        if (uVar2 == 0) goto LAB_5c3a_02ba;
      } while (local_38[uVar2 - 1] == 0);
      local_3 = 0;
      uVar4 = uVar2;
      if (param_4 - 1 == uVar3) {
        uVar4 = uVar3;
      }
    }
    else {
      uVar3 = uVar4;
      if (local_6 == 0x153) {
        for (; uVar3 < param_4; uVar3 = uVar3 + 1) {
          local_38[uVar3] = local_38[uVar3 + 1];
          FUN_5c3a_0144(param_2 + uVar3,param_3,local_38[uVar3],param_5,0);
        }
      }
      else if (local_6 == 0x147) {
        local_3 = 0;
        uVar4 = 0;
      }
      else if ((local_6 == 0x14b) || (local_6 == 8)) {
        local_3 = 0;
        if (uVar4 != 0) {
          uVar4 = uVar4 - 1;
        }
      }
      else if (0x13 < local_6) {
        local_3 = 0;
        local_38[uVar4] = (byte)local_6;
        FUN_5c3a_0144(param_2 + uVar4,param_3,local_38[uVar4],param_5,0);
        if (param_4 - 1 == uVar4) {
          if (local_4 == '\0') {
            local_4 = '\x01';
          }
        }
        else {
          uVar4 = uVar4 + 1;
        }
      }
    }
  } while( true );
}

