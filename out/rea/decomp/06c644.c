
void __cdecl16far FUN_6bf2_0724(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  uint unaff_SI;
  int iVar2;
  undefined4 uVar3;
  ulong uVar4;
  undefined4 local_e;
  undefined1 local_a [8];
  
  uVar4 = (ulong)unaff_SI;
  DAT_4125_0d6c =
       (uint)(*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcff) != '\x03');
  FUN_24d0_0002();
  uVar1 = FUN_216d_002e(local_a);
  FUN_216d_0288(uVar1,in_DX,uVar4);
  FUN_24d0_02e5(local_a);
  uVar3 = 0x40002;
  uVar1 = FUN_216d_002e(local_a);
  FUN_24d0_02e5(uVar1,in_DX,uVar3);
  thunk_FUN_54e4_070b(0x970018,0x1400c8);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  if (DAT_4125_0d6c == 0) {
    uVar1 = 8;
  }
  else {
    uVar1 = 7;
  }
  uVar1 = thunk_FUN_7e8f_04f0(0x83,uVar1);
  thunk_FUN_7e8f_00d6(0xd301b0,uVar1,in_DX);
  for (iVar2 = 0; iVar2 < 3; iVar2 = iVar2 + 1) {
    if (-1 < (int)((undefined2 *)&DAT_451b_04a8)[iVar2]) {
      if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[((undefined2 *)&DAT_451b_04a8)[iVar2]] * 0x1d +
                   0xcff) == '\x01') {
        uVar1 = 10;
      }
      else if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[((undefined2 *)&DAT_451b_04a8)[iVar2]] *
                         0x1d + 0xcff) == '\0') {
        uVar1 = 5;
      }
      else {
        uVar1 = 7;
      }
      thunk_FUN_7875_06ae(2,uVar1,0x30000);
      thunk_FUN_7e8f_00bf(0x178,iVar2 * 0x16 + 0xee,
                          ((undefined2 *)&DAT_451b_04a8)[iVar2] * 0x20 + 0x483c,0x4125);
    }
  }
  FUN_24d0_0002();
  uVar1 = FUN_216d_002e(local_a);
  FUN_216d_0288(uVar1,in_DX);
  if (DAT_451b_04aa < 0) goto LAB_6bf2_0a71;
  if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\b') {
LAB_6bf2_08fb:
    FUN_1000_4944(&stack0xffde);
  }
  else if ((*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x02') ||
          (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x01')) {
LAB_6bf2_09f7:
    FUN_1000_4944();
  }
  else {
    if ((*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x05') ||
       (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\x06'))
    goto LAB_6bf2_08fb;
    if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[DAT_451b_04aa] * 0x1d + 0xcfd) == '\a')
    goto LAB_6bf2_09f7;
  }
  thunk_FUN_7875_06ae(2);
  thunk_FUN_7e8f_00d6(0x1040154,&stack0xffde);
LAB_6bf2_0a71:
  FUN_216d_000e(&local_e);
  FUN_1000_1e79(local_e);
  FUN_1997_0129();
  thunk_FUN_7875_06ae(0x70002);
  thunk_FUN_7e8f_00bf(0x1390150);
  FUN_216d_000e(&local_e);
  FUN_1000_1e79();
  FUN_1997_0129();
  thunk_FUN_7875_06ae();
  thunk_FUN_7e8f_00bf();
  return;
}

