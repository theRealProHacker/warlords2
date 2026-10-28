
/* WARNING: Removing unreachable block (ram,0x000771e2) */
/* WARNING: Removing unreachable block (ram,0x000771f7) */
/* WARNING: Removing unreachable block (ram,0x000771e9) */
/* WARNING: Removing unreachable block (ram,0x00077245) */

void __cdecl16far FUN_76ef_02d3(int param_1)

{
  undefined1 local_54 [80];
  int local_4;
  
  if (param_1 == -1) {
    thunk_FUN_7f3a_0000();
  }
  else {
    DAT_4125_128e = param_1;
    DAT_4125_128c = param_1;
    local_4 = FUN_76ef_0414();
    thunk_FUN_76e4_0000();
    if ((DAT_4125_2a86 != 0) && (local_4 != 0)) {
      thunk_FUN_8027_0a6e();
      thunk_FUN_891f_0698();
    }
    thunk_FUN_891f_0000();
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
    thunk_FUN_824f_03f9();
    thunk_FUN_824f_02bf();
    thunk_FUN_824f_0372();
    thunk_FUN_66b0_09f2();
    thunk_FUN_824f_0000();
    FUN_1555_0d9e(DAT_3c04_0110,1);
    thunk_FUN_8027_0000(1,0);
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
    uRam00043b16 = 0;
    thunk_FUN_8c81_0952(1);
    thunk_FUN_8c81_0952(0);
    thunk_FUN_7e8f_04f0(0x1002f,DAT_3c04_0110 * 0x14,0x3c04);
    FUN_1000_4944(local_54);
    thunk_FUN_8027_10fb(local_54);
    thunk_FUN_85d0_006c();
    thunk_FUN_824f_0af3();
    thunk_FUN_7d9f_0000();
  }
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
  return;
}

