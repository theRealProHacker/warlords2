
void __cdecl16far
FUN_8027_106f(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
             undefined4 param_5)

{
  int iVar1;
  int iVar2;
  
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  iVar1 = DAT_4125_2a96;
  iVar2 = DAT_4125_2a94 + DAT_4125_2a98 / 2;
  thunk_FUN_7e8f_00d6(iVar2,DAT_4125_2a96 + 4,param_1);
  thunk_FUN_7e8f_00d6(iVar2,iVar1 + 0x18,param_2);
  thunk_FUN_7e8f_00d6(iVar2,iVar1 + 0x2c,param_3);
  thunk_FUN_7e8f_00d6(iVar2,iVar1 + 0x40,param_4);
  thunk_FUN_7e8f_00d6(iVar2,iVar1 + 0x54,param_5);
  return;
}

