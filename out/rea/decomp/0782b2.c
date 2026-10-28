
/* WARNING: Removing unreachable block (ram,0x000782cf) */
/* WARNING: Removing unreachable block (ram,0x000782e3) */
/* WARNING: Removing unreachable block (ram,0x000782d6) */

void __cdecl16far FUN_76ef_13c2(int param_1)

{
  undefined2 uVar1;
  
  if (param_1 == -1) {
    thunk_FUN_7f3a_0000();
  }
  else {
    DAT_4125_128c = param_1;
    DAT_4125_1290 = param_1;
    uVar1 = thunk_FUN_7e8f_04f0(0x20030,param_1 * 0xf + 0x467c,0x4125,0xa7,0x407f,0x57,0x4014,1,
                                0xa0000f);
    uVar1 = thunk_FUN_7e8f_04f0(0x10030,uVar1,param_1);
    uVar1 = thunk_FUN_7e8f_04f0(0x30,uVar1,param_1);
    thunk_FUN_7b13_0000(uVar1,param_1);
  }
  return;
}

