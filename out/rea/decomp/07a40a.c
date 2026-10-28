
void __cdecl16far FUN_79c4_07ca(void)

{
  undefined1 uVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 unaff_SS;
  undefined2 local_26 [8];
  undefined2 local_16 [8];
  int local_6;
  int local_4;
  
  local_4 = -1;
  local_6 = 8;
  while( true ) {
    iVar2 = local_6;
    local_6 = local_6 + -1;
    if (iVar2 == 0) break;
    if (*(int *)(local_6 * 2 + 0x137) == 0) {
      *(undefined2 *)(local_6 * 0x14 + 0x193) = 0xffff;
      *(undefined2 *)(local_6 * 0x14 + 0x195) = 0xffff;
    }
    else {
      *(undefined2 *)(local_6 * 0x14 + 0x193) = *(undefined2 *)(local_6 * 0x14 + 0x189);
      *(undefined2 *)(local_6 * 0x14 + 0x195) = *(undefined2 *)(local_6 * 0x14 + 0x18b);
    }
    local_16[local_6] = *(undefined2 *)(local_6 * 0x14 + 0x189);
    local_26[local_6] = *(undefined2 *)(local_6 * 0x14 + 0x18b);
    iVar2 = thunk_FUN_824f_044a(local_16[local_6],local_26[local_6]);
    if (-1 < iVar2) {
      if (*(int *)(local_6 * 2 + 0x137) == 0) {
        thunk_FUN_6bb0_0000(iVar2 * 0x41 + 0x157d);
        *(undefined1 *)(iVar2 * 0x41 + 0x1592) = 0xf;
      }
      else {
        thunk_FUN_6bb0_0000(iVar2 * 0x41 + 0x157d);
        *(undefined1 *)(iVar2 * 0x41 + 0x1592) = (undefined1)local_6;
        local_4 = local_6;
      }
    }
  }
  if ((local_4 != -1) && (DAT_3c04_0128 != 0)) {
    while (iVar2 = thunk_FUN_824f_04fa(local_16[local_4],local_26[local_4],0xf), -1 < iVar2) {
      thunk_FUN_6bb0_0000(iVar2 * 0x41 + 0x157d,0x3c04,local_4);
      *(undefined1 *)(iVar2 * 0x41 + 0x1592) = (undefined1)local_4;
      iVar3 = thunk_FUN_7e8f_02bf(1,0xffff000a);
      if (iVar3 < 5) {
        local_16[local_4] = *(undefined2 *)(local_4 * 0x14 + 0x189);
        uVar4 = *(undefined2 *)(local_4 * 0x14 + 0x18b);
      }
      else {
        local_16[local_4] = *(undefined2 *)(iVar2 * 0x41 + 0x157d);
        uVar4 = *(undefined2 *)(iVar2 * 0x41 + 0x157f);
      }
      local_26[local_4] = uVar4;
      do {
        local_4 = (local_4 + 1) % 8;
      } while (*(int *)(local_4 * 2 + 0x137) == 0);
    }
  }
  FUN_79c4_0a75();
  for (local_6 = 0; local_6 < DAT_3c04_157b; local_6 = local_6 + 1) {
    uVar1 = thunk_FUN_705a_0930();
    *(undefined1 *)(local_6 * 0x41 + 0x1591) = uVar1;
  }
  return;
}

