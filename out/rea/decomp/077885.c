
void __cdecl16far FUN_76ef_0995(int param_1)

{
  undefined2 uVar1;
  
  if (param_1 < 0) {
    thunk_FUN_8027_0000(0);
  }
  else {
    DAT_4125_128c = param_1;
    DAT_4125_128e = param_1;
    uVar1 = thunk_FUN_7e8f_04f0(0x2002e,param_1 * 0xf + 0x471c,0x4125,0x84,0x407f,0x57,0x4014,1,
                                0xa0000f);
    uVar1 = thunk_FUN_7e8f_04f0(0x1002e,uVar1,param_1);
    uVar1 = thunk_FUN_7e8f_04f0(0x2e,uVar1,param_1);
    thunk_FUN_7b13_0000(uVar1,param_1);
  }
  return;
}

