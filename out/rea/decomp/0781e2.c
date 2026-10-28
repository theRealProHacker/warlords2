
/* WARNING: Removing unreachable block (ram,0x000781ff) */
/* WARNING: Removing unreachable block (ram,0x00078214) */
/* WARNING: Removing unreachable block (ram,0x00078206) */

void __cdecl16far FUN_76ef_12f2(int param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  
  if (param_1 == -1) {
    thunk_FUN_7f3a_0000();
  }
  else {
    DAT_4125_128c = param_1;
    DAT_4125_1290 = param_1;
    FUN_76ef_0414();
    uVar1 = thunk_FUN_7e8f_0505(0x1b);
    uVar1 = thunk_FUN_7e8f_0505(0x1a,param_1,uVar1,in_DX);
    FUN_76ef_0d61(uVar1,in_DX);
    thunk_FUN_824f_03f9();
    thunk_FUN_824f_02bf();
    thunk_FUN_824f_0372();
    FUN_1555_0d9e(DAT_3c04_0110,1);
    thunk_FUN_7b71_0000(0x10000,0x10000);
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
    uRam00043b16 = 0;
    DAT_4125_2a86 = 0;
    thunk_FUN_824f_0af3();
    thunk_FUN_7d9f_0000();
  }
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
  return;
}

