
void __cdecl16far FUN_67a7_1f19(undefined2 param_1,undefined2 param_2)

{
  undefined2 uVar1;
  undefined2 in_DX;
  undefined2 local_e;
  undefined2 uStack_c;
  undefined2 local_a [4];
  
  if (DAT_3c04_012c != 0) {
    FUN_22bf_07a5();
    thunk_FUN_54e4_0000();
    thunk_FUN_7875_06ae(0xf0001,0x30000);
    uVar1 = thunk_FUN_7e8f_04f0(0x7b);
    thunk_FUN_7e8f_00d6(0x430140,uVar1,in_DX);
    thunk_FUN_79c4_056a();
    DAT_4125_166a = 1;
    FUN_216d_002e(local_a);
    FUN_216d_000e(&local_e);
    FUN_1000_1e79(CONCAT22(uStack_c,local_e));
    FUN_1997_0129();
    uStack_c = 0x1a8;
    local_a[0] = 1;
    local_e = 0x1997;
    FUN_18a9_066e();
    local_a[0] = param_2;
    uStack_c = param_1;
    local_e = 0x18a9;
    FUN_67a7_2065();
    uStack_c = 0;
    local_a[0] = 3;
    local_e = 0xf;
    thunk_FUN_7875_06ae(2);
    uStack_c = 0x7c;
    local_a[0] = 0xffff;
    local_e = 0x408a;
    uStack_c = thunk_FUN_7e8f_04f0();
    local_e = 0x102;
    thunk_FUN_7e8f_00d6(0x140);
    uStack_c = 0x7d;
    local_a[0] = 0xffff;
    local_e = 0x40c1;
    uStack_c = thunk_FUN_7e8f_04f0();
    uVar1 = 0x140;
    local_e = 0x116;
    thunk_FUN_7e8f_00d6(0x140);
    uStack_c = 0x7e;
    local_e = 0x40c1;
    local_a[0] = uVar1;
    uStack_c = thunk_FUN_7e8f_04f0();
    local_e = 0x12a;
    thunk_FUN_7e8f_00d6(0x140);
    local_a[0] = 0x40c1;
    uStack_c = 0x9abe;
    FUN_22bf_0757();
  }
  return;
}

