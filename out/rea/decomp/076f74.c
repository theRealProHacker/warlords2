
void __cdecl16far FUN_76ef_0084(void)

{
  undefined2 uVar1;
  undefined2 uVar2;
  undefined1 local_fe [80];
  undefined1 local_ae [80];
  undefined1 local_5e [80];
  ulong local_e;
  ulong local_a;
  ulong local_6;
  
  thunk_FUN_7e8f_0a1b();
  FUN_1d28_0805(&local_6);
  thunk_FUN_7e8f_04f0(0x4008b,local_6 / 1000);
  FUN_1000_4944(local_5e);
  thunk_FUN_7e8f_04f0(0x5008b,local_a / 1000);
  FUN_1000_4944(local_ae);
  uVar2 = (undefined2)(local_e % 1000);
  thunk_FUN_7e8f_04f0(0x6008b,local_e / 1000);
  FUN_1000_4944(local_fe);
  thunk_FUN_54e4_0000();
  uVar1 = thunk_FUN_7e8f_04f0(0x3008b,local_5e);
  uVar1 = thunk_FUN_7e8f_04f0(0x1008b,(char *)s_Version_1_02_4125_1292,0x4125,uVar1,uVar2);
  uVar1 = thunk_FUN_7e8f_04f0(0x8b,uVar1,uVar2);
  thunk_FUN_8027_1471(uVar1,uVar2);
  thunk_FUN_8027_10fb(0);
  thunk_FUN_54e4_069c();
  return;
}

