
void __cdecl16far FUN_85d0_08be(int param_1,int param_2,undefined4 param_3,int param_4,int param_5)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  int in_stack_00000018;
  int in_stack_0000001a;
  int in_stack_0000001c;
  undefined4 local_44;
  undefined2 uStack_40;
  undefined2 uStack_3e;
  int iStack_3c;
  int local_1c [8];
  undefined4 local_c;
  undefined4 local_8;
  int local_4;
  
  if (param_2 == 0xf) {
    param_2 = 8;
  }
  FUN_1997_034a();
  for (iVar4 = 0; iVar4 < 4; iVar4 = iVar4 + 1) {
    local_1c[iVar4 * 2] = param_4;
    if (iVar4 < 2) {
      iVar3 = 0;
    }
    else {
      iVar3 = 0x24;
    }
    local_1c[iVar4 * 2 + 1] = param_5 + iVar4 * 10 + iVar3;
    if (in_stack_0000001a == 2) {
      local_1c[iVar4 * 2 + 1] = local_1c[iVar4 * 2 + 1] + -0x14;
    }
  }
  if (in_stack_0000001a != 0) {
    FUN_1000_4944();
    FUN_1000_4944();
    FUN_1000_4944();
    FUN_1000_4944();
    for (iVar4 = 0; iVar4 < 4; iVar4 = iVar4 + 1) {
      if (in_stack_0000001a == 2) {
        if (2 < iVar4) {
          local_1c[iVar4 * 2] = local_1c[iVar4 * 2] + 8;
          local_1c[iVar4 * 2 + 1] = local_1c[iVar4 * 2 + 1] + -0xf;
          for (iVar3 = 0; iVar2 = FUN_1000_4a99((int)&local_44 + iVar4 * 10), iVar3 < iVar2;
              iVar3 = iVar3 + 1) {
            FUN_1000_1e79(*(undefined4 *)(local_1c + iVar4 * 2));
            FUN_1997_0129();
            local_1c[iVar4 * 2] = local_1c[iVar4 * 2] + 8;
          }
        }
      }
      else {
        FUN_1000_1e79(*(undefined4 *)(local_1c + iVar4 * 2));
        FUN_1997_0129();
        local_1c[iVar4 * 2] = local_1c[iVar4 * 2] + 8;
        local_44 = *(undefined4 *)(local_1c + iVar4 * 2);
        FUN_1000_1e79();
        FUN_1997_0129(8);
        local_1c[iVar4 * 2] = local_1c[iVar4 * 2] + 8;
        iVar3 = 0;
        while( true ) {
          _iStack_3c = CONCAT22(unaff_SS,(int)&local_44 + iVar4 * 10);
          uStack_3e = 0x1997;
          uStack_40 = 0x67e5;
          iVar2 = FUN_1000_4a99();
          if (iVar2 <= iVar3) break;
          _iStack_3c = *(undefined4 *)(local_1c + iVar4 * 2);
          uStack_3e = 0x1000;
          uStack_40 = 0x67bb;
          FUN_1000_1e79();
          uStack_3e = 8;
          uStack_40 = 0x1000;
          local_44 = CONCAT22(0x67c2,(undefined2)local_44);
          FUN_1997_0129();
          local_1c[iVar4 * 2] = local_1c[iVar4 * 2] + 8;
          iVar3 = iVar3 + 1;
        }
      }
    }
  }
  if (in_stack_00000018 != 0) {
    FUN_1997_034a();
    if (in_stack_0000001a == 1) {
      iVar4 = 0x14;
    }
    else {
      iVar4 = 0;
    }
    (*DAT_451b_2a74)(0x1997,0x57e2,0x4125,(in_stack_00000018 + -1) * 0x20,0,0x1e0020,param_3,param_4
                     ,param_5 + iVar4);
  }
  if (-1 < param_1) {
    if (in_stack_0000001c == 0) {
      local_4 = param_2 + 0x10;
      iVar4 = param_2 * 0x3b + 0x4f20;
    }
    else {
      local_4 = 0x2a;
      iVar4 = 0x525a;
    }
    local_8 = CONCAT22(0x4125,iVar4);
    if (in_stack_0000001c == 0) {
      uVar1 = 0x4ee5;
    }
    else {
      uVar1 = 0x521f;
    }
    local_c = CONCAT22(0x4125,uVar1);
    FUN_1997_034a();
    iVar3 = param_1 % 0x10 << 5;
    iVar4 = (param_1 / 0x10) * 0x1e;
    FUN_1997_060a();
    if (in_stack_0000001a == 1) {
      iVar2 = 0x14;
    }
    else {
      iVar2 = 0;
    }
    (*DAT_451b_2a68)(0x1997,local_8,iVar3,iVar4,0x1d0020,param_3,param_4,param_5 + iVar2,local_c,
                     iVar3,iVar4);
    FUN_1997_06bb();
  }
  return;
}

