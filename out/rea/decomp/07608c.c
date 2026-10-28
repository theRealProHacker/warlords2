
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_7533_0d5c(void)

{
  undefined2 in_DX;
  undefined2 unaff_SS;
  undefined2 uVar1;
  undefined4 local_ea;
  undefined4 *puStack_e6;
  undefined1 local_b8 [50];
  undefined1 local_86 [50];
  undefined1 local_54 [80];
  int local_4;
  
  FUN_22bf_07a5();
  local_4 = thunk_FUN_8027_225b();
  DAT_4125_166a = 1;
  thunk_FUN_54e4_0000(2);
  thunk_FUN_830b_0000(1,1,0,0);
  thunk_FUN_830b_1f5f(*(undefined2 *)(DAT_451b_058c * 0x41 + 0x157d),
                      *(undefined2 *)(DAT_451b_058c * 0x41 + 0x157f),1);
  thunk_FUN_830b_04d3(0,0);
  FUN_7533_0c67();
  if (local_4 == 1) {
    if (DAT_451b_0570 == 0) {
      thunk_FUN_7e8f_04f0(0x61,0);
      FUN_1000_4944(local_54);
      thunk_FUN_7e8f_04f0(0x61,1);
      FUN_1000_4944(local_86);
      thunk_FUN_7e8f_04f0(0x61,2);
      FUN_1000_4944(local_b8);
      thunk_FUN_7e8f_04f0(0x61,3,DAT_451b_058c * 0x41 + 0x1581,0x3c04);
      FUN_1000_4944(&local_ea);
    }
    else {
      thunk_FUN_7e8f_04f0(0x61,8);
      FUN_1000_4944(local_54);
      thunk_FUN_7e8f_04f0(0x61,9);
      FUN_1000_4944(local_86);
      thunk_FUN_7e8f_04f0(0x61,10);
      FUN_1000_4944(local_b8);
      thunk_FUN_7e8f_04f0(0x61,0xb,DAT_451b_058c * 0x41 + 0x1581,0x3c04);
      FUN_1000_4944(&local_ea);
    }
  }
  else {
    if (DAT_451b_0570 == 0) {
      thunk_FUN_7e8f_04f0(0x61,4,DAT_451b_058c * 0x41 + 0x1581,0x3c04);
      FUN_1000_4944(local_54);
      thunk_FUN_7e8f_04f0(0x61,5,DAT_4125_1110);
      FUN_1000_4944(local_86);
      thunk_FUN_7e8f_04f0(0x61,6,*(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x185));
      FUN_1000_4944(local_b8);
      uVar1 = 7;
    }
    else {
      thunk_FUN_7e8f_04f0(0x61,0xc,DAT_451b_058c * 0x41 + 0x1581,0x3c04);
      FUN_1000_4944(local_54);
      thunk_FUN_7e8f_04f0(0x61,0xd,DAT_4125_1110);
      FUN_1000_4944(local_86);
      thunk_FUN_7e8f_04f0(0x61,0xe,*(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x185));
      FUN_1000_4944(local_b8);
      uVar1 = 0xf;
    }
    thunk_FUN_7e8f_04f0(0x61,uVar1);
    FUN_1000_4944(&local_ea);
  }
  thunk_FUN_7875_06ae(1,0xf,0,3);
  uVar1 = thunk_FUN_7e8f_04f0(0x5f,0);
  thunk_FUN_7e8f_00d6((int)DAT_4125_1126,(int)((ulong)DAT_4125_1126 >> 0x10),uVar1,in_DX);
  uVar1 = (undefined2)((ulong)DAT_4125_111a >> 0x10);
  if (DAT_451b_0570 == 0) {
    FUN_1000_1e79((int)DAT_4125_111a,uVar1);
    uVar1 = 0x21;
  }
  else {
    FUN_1000_1e79((int)DAT_4125_111a,uVar1);
    uVar1 = 0x22;
  }
  FUN_1997_0129(uVar1);
  _puStack_e6 = (undefined4 *)0x1997;
  local_ea = CONCAT22(0x63b3,(undefined2)local_ea);
  FUN_24d0_0002();
  _puStack_e6 = (undefined4 *)0x4125111e;
  local_ea = 0x24d063bd;
  FUN_216d_01fd();
  _puStack_e6 = (undefined4 *)0x3000e;
  local_ea = 0xf0002;
  thunk_FUN_7875_06ae();
  _puStack_e6 = (undefined4 *)CONCAT22(unaff_SS,local_54);
  local_ea = DAT_4125_112a;
  thunk_FUN_7e8f_00d6();
  _puStack_e6 = (undefined4 *)CONCAT22(unaff_SS,local_86);
  local_ea = DAT_4125_112e;
  thunk_FUN_7e8f_00d6();
  _puStack_e6 = (undefined4 *)CONCAT22(unaff_SS,local_b8);
  local_ea = DAT_4125_1132;
  thunk_FUN_7e8f_00d6();
  _puStack_e6 = (undefined4 *)CONCAT22(unaff_SS,&local_ea);
  local_ea = DAT_4125_1136;
  thunk_FUN_7e8f_00d6();
  _puStack_e6 = (undefined4 *)0x30000;
  local_ea = 0xf0002;
  thunk_FUN_7875_06ae();
  _puStack_e6 = (undefined4 *)0x412544d2;
  local_ea = _DAT_4125_113e;
  thunk_FUN_7e8f_0058((int)DAT_4125_113a,(int)((ulong)DAT_4125_113a >> 0x10));
  _puStack_e6 = (undefined4 *)0x40c1;
  local_ea = CONCAT22(0x6450,(undefined2)local_ea);
  FUN_24d0_0002();
  _puStack_e6 = (undefined4 *)0x41251142;
  local_ea = 0x24d0645a;
  FUN_216d_01fd();
  _puStack_e6 = (undefined4 *)DAT_4125_114a;
  local_ea = 0x216d6480;
  FUN_1000_1e79();
  local_ea = 0x81000;
  FUN_1997_0129();
  FUN_1000_1e79();
  _puStack_e6 = (undefined4 *)CONCAT22(0x64b4,puStack_e6);
  FUN_1997_0129();
  thunk_FUN_7e8f_04f0();
  thunk_FUN_7e8f_0103();
  thunk_FUN_7e8f_04f0();
  thunk_FUN_7e8f_0103();
  thunk_FUN_79c4_056a();
  FUN_7533_120c();
  FUN_22bf_0757();
  if ((DAT_3c04_012e != 0) && ((DAT_3c04_0134 & 1) == 0)) {
    DAT_3c04_0134 = DAT_3c04_0134 | 1;
    thunk_FUN_7e8f_0505();
    thunk_FUN_8027_168d();
  }
  return;
}

