
void __cdecl16far FUN_7533_0672(int param_1,undefined2 param_2)

{
  byte bVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  undefined1 local_30 [40];
  undefined2 local_8;
  int local_6;
  int local_4;
  
  local_6 = -(int)*(char *)(param_1 * 0x16 + -0x7778);
  iVar2 = (int)*(char *)(param_1 * 0x16 + -0x7776);
  bVar1 = *(byte *)(iVar2 + 0x5e3);
  *(byte *)(iVar2 + 0x5e3) = *(byte *)(iVar2 + 0x5e3) & 0xfc;
  *(byte *)(iVar2 + 0x5e3) = *(byte *)(iVar2 + 0x5e3) | (bVar1 & 3) + 1 & 3;
  FUN_1b62_0005();
  local_6 = local_6 + *(char *)(param_1 * 0x16 + -0x7778);
  local_8 = 2;
  uVar5 = 0x2e1d;
  *(char *)(param_1 * 0x16 + -0x777a) = *(char *)(param_1 * 0x16 + -0x777a) + '\x02';
  iVar3 = thunk_FUN_5d9f_09ab();
  if (iVar3 == 0) {
    thunk_FUN_7d9f_0000();
    FUN_22bf_07a5();
    thunk_FUN_54e4_0000();
    if (*(int *)(iVar2 * 2 + 0x593) == 0) {
      local_4 = 0;
    }
    else {
      local_4 = 6;
    }
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    uVar4 = thunk_FUN_7e8f_04f0(param_2,local_4);
    thunk_FUN_7e8f_00d6(0x5d0140,uVar4,uVar5);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    thunk_FUN_7e8f_00d6(0x8c0140,iVar2 * 0x14 + 0x223,0x3c04);
    uVar4 = thunk_FUN_7e8f_04f0(param_2,local_4 + 1);
    thunk_FUN_7e8f_00d6(0xa00140,uVar4,uVar5);
    uVar4 = thunk_FUN_7e8f_04f0(param_2,local_4 + 2);
    thunk_FUN_7e8f_00d6(0xb40140,uVar4,uVar5);
    uVar4 = thunk_FUN_7e8f_04f0(param_2,local_4 + 3);
    thunk_FUN_7e8f_00d6(0xc80140,uVar4,uVar5);
    uVar4 = thunk_FUN_7e8f_04f0(param_2,local_4 + 4);
    thunk_FUN_7e8f_00d6(0xe80140,uVar4,uVar5);
    thunk_FUN_7e8f_04f0(param_2,local_4 + 5,(*(byte *)(iVar2 + 0x5e3) & 3) + 1,
                        (int)*(char *)(param_1 * 0x16 + -0x7778),local_6,
                        (int)*(char *)(param_1 * 0x16 + -0x777a),local_8);
    FUN_1000_4944(local_30);
    thunk_FUN_7e8f_00d6(0xfc0140,local_30);
    FUN_22bf_0757();
    DAT_4125_166a = 1;
    thunk_FUN_7e8f_0142();
    DAT_4125_166a = 0;
    thunk_FUN_54e4_069c();
  }
  return;
}

