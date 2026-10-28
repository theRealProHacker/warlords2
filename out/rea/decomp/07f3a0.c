
/* WARNING: Removing unreachable block (ram,0x0007f3fb) */

void __cdecl16far FUN_7f3a_0000(int param_1)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_SS;
  undefined1 local_58 [20];
  undefined1 local_44 [64];
  int local_4;
  
  FUN_22bf_07a5();
  thunk_FUN_8c81_092f();
  iVar1 = FUN_1000_4a40(0x5da0,0x4125,(char *)s_random_4125_2a67,0x4125);
  if (iVar1 == 0) {
                    /* WARNING: Read-only address (ram,0x00043b18) is written */
    uRam00043b18 = 1;
  }
                    /* WARNING: Read-only address (ram,0x00043b16) is written */
  uRam00043b16 = 1;
  thunk_FUN_79c4_056a(1);
  if (param_1 != 0) {
    thunk_FUN_7ae8_0000(0);
    thunk_FUN_8027_092a(1);
    if (DAT_4125_2a0c == 0) {
      DAT_4125_2a0c = 1;
      iVar1 = 0;
      local_4 = 0;
      while (local_4 == 0) {
        iVar2 = FUN_7f3a_06c8(iVar1,local_58);
        if (iVar2 == 0) {
          local_4 = 1;
                    /* WARNING: Read-only address (ram,0x00043b1e) is written */
          iRam00043b1e = 0;
          FUN_7f3a_06c8(0,local_58);
          FUN_1000_1d02(local_58,unaff_SS,0x5d64,0x4125);
        }
        else {
          iVar2 = FUN_1000_4a40(local_44);
          if (iVar2 == 0) {
                    /* WARNING: Read-only address (ram,0x00043b1e) is written */
            iRam00043b1e = iVar1;
            FUN_1000_1d02(local_58,unaff_SS,0x5d64,0x4125);
            break;
          }
          iVar1 = iVar1 + 1;
        }
      }
    }
  }
  FUN_7f3a_0332(0xffff);
  FUN_7f3a_02bf();
  FUN_7f3a_011e();
  thunk_FUN_7d9f_0000(0);
  if (param_1 != 0) {
    thunk_FUN_7d9f_026f(2);
  }
  DAT_4125_166a = 0;
  FUN_22bf_0757();
  return;
}

