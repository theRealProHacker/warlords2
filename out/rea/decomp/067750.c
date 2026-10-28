
void __cdecl16far FUN_66b0_0c50(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  undefined2 unaff_SS;
  int local_32 [22];
  int local_6;
  int local_4;
  
  local_6 = 0;
  for (iVar3 = 8; iVar3 < 0x16; iVar3 = iVar3 + 1) {
    local_32[local_6] = iVar3;
    local_6 = local_6 + 1;
  }
  for (iVar3 = 1; iVar2 = iVar3, iVar3 < local_6; iVar3 = iVar3 + 1) {
    for (; ((*(char *)(local_32[iVar2] * 0x1d + 0xcfd) <
             *(char *)(local_32[iVar2 + -1] * 0x1d + 0xcfd) ||
            ((*(char *)(local_32[iVar2] * 0x1d + 0xcfd) ==
              *(char *)(local_32[iVar2 + -1] * 0x1d + 0xcfd) &&
             (*(char *)(local_32[iVar2] * 0x1d + 0xcfe) <
              *(char *)(local_32[iVar2 + -1] * 0x1d + 0xcfe))))) && (0 < iVar2)); iVar2 = iVar2 + -1
        ) {
      local_4 = local_32[iVar2];
      local_32[iVar2] = local_32[iVar2 + -1];
      local_32[iVar2 + -1] = local_4;
    }
    in_DX = 0x3c04;
  }
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0xa6);
  thunk_FUN_7e8f_00d6(0x340140,uVar1,in_DX);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0xa7);
  thunk_FUN_7e8f_00d6(0x17e0140,uVar1,in_DX);
  thunk_FUN_7875_06ae(0x70002,0x30000);
  for (iVar3 = 0; iVar3 < local_6; iVar3 = iVar3 + 1) {
    thunk_FUN_7e8f_0103(0x130,iVar3 * 0x14 + 0x5a,local_32[iVar3] * 0x1d + 0xce9,0x3c04);
    uVar1 = thunk_FUN_7e8f_04f0();
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar1,in_DX);
    thunk_FUN_7e8f_00bf();
  }
  return;
}

