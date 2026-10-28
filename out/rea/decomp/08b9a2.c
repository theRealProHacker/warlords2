
void __cdecl16far FUN_899d_1fd2(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 extraout_DX;
  undefined2 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined1 local_4c [2];
  undefined1 local_4a [20];
  undefined2 local_36;
  undefined2 local_30;
  undefined4 local_e;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  if (param_1 == 0) {
    thunk_FUN_7875_06ae(1,0xf,0x30000);
    uVar3 = thunk_FUN_7e8f_04f0(0xa4);
    thunk_FUN_7e8f_00d6(0x140,0x3e,uVar3,in_DX);
    uVar5 = 0x20004;
    uVar3 = FUN_216d_002e(&local_a);
    FUN_24d0_02e5(uVar3,in_DX,uVar5);
    FUN_24d0_0002();
    local_a = local_a + 1;
    local_8 = local_8 + 1;
    local_6 = local_6 + -2;
    local_4 = local_4 + -2;
    FUN_216d_01fd(&local_a);
    FUN_216d_002e(&local_a);
    FUN_216d_000e(&local_e);
    FUN_1000_1e79(local_e);
    FUN_1997_027e(0x2e);
  }
  else {
    thunk_FUN_54e4_070b(0x30,0x58,0xb601a8);
  }
  thunk_FUN_7875_06ae(2,0xf,0x30000);
  for (iVar4 = 0; iVar4 < 6; iVar4 = iVar4 + 1) {
    iVar1 = *(int *)((int)DAT_451b_287a + (DAT_451b_2878 + iVar4) * 2);
    thunk_FUN_85d0_08be(iVar1,DAT_3c04_0110,0x342a,0x4125,0x80,iVar4 * 0x1e + 0x94,0,0,0,0,
                        DAT_3c04_0110 + 2,0);
    thunk_FUN_705a_14ac(0x40f9,iVar1,local_4c);
    uVar3 = extraout_DX;
    thunk_FUN_7e8f_00bf(0xa8,iVar4 * 0x1e + 0x99,local_4a);
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x3249,0x4125,local_36);
    thunk_FUN_7e8f_00bf(0x118,iVar4 * 0x1e + 0x99,(undefined1 *)&DAT_451b_1d28,0x4125);
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x324c,0x4125,local_30);
    thunk_FUN_7e8f_00bf(0x148,iVar4 * 0x1e + 0x99,(undefined1 *)&DAT_451b_1d28,0x4125);
    FUN_216d_000e(&local_e);
    if (((((undefined1 *)&DAT_451b_0664)[iVar1 * 6] != '\0') ||
        (((((undefined1 *)&DAT_451b_0665)[iVar1 * 6] != '\0' &&
          (((undefined1 *)&DAT_451b_0666)[iVar1 * 6] != '\0')) ||
         (((undefined1 *)&DAT_451b_0665)[iVar1 * 6] != '\0')))) ||
       (((undefined1 *)&DAT_451b_0666)[iVar1 * 6] != '\0')) {
      uVar3 = 0x4125;
      FUN_1000_1e79(local_e);
      FUN_1997_0129(8);
    }
    uVar2 = FUN_899d_1a07(iVar1,0);
    thunk_FUN_7e8f_00bf(400,iVar4 * 0x1e + 0x9a,uVar2,uVar3);
  }
  return;
}

