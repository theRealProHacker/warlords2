
void __cdecl16far FUN_66b0_04ef(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  char local_632 [19];
  char local_61f [1431];
  int local_88 [22];
  undefined1 local_5c [2];
  undefined1 local_5a;
  int local_c;
  int local_a;
  int local_8;
  char local_5;
  int local_4;
  
  FUN_1000_4944(local_5c);
  local_4 = FUN_170b_0006(local_5c);
  if (-1 < local_4) {
    FUN_170b_006d(local_4,local_5c);
    local_5a = 0;
    FUN_1000_49ba(local_5c);
    FUN_170b_006d(local_4,local_5c);
    for (iVar2 = 0; iVar2 < local_8; iVar2 = iVar2 + 1) {
      FUN_170b_006d(local_4,local_632 + iVar2 * 0x1d);
      local_61f[iVar2 * 0x1d] = '\0';
      FUN_170b_006d(local_4,local_5c);
      FUN_170b_006d(local_4,&local_5);
      local_61f[iVar2 * 0x1d + 1] = local_5 + -0x30;
      FUN_170b_006d(local_4,local_5c);
      FUN_170b_006d(local_4,&local_5);
      local_61f[iVar2 * 0x1d + 2] = local_5 + -0x30;
      FUN_170b_006d(local_4,local_5c);
      for (iVar3 = 0; iVar1 = FUN_1000_4a99(local_632 + iVar2 * 0x1d), iVar3 < iVar1;
          iVar3 = iVar3 + 1) {
        if (local_632[iVar2 * 0x1d + iVar3] == ' ') {
          local_632[iVar2 * 0x1d + iVar3] = '\0';
        }
        if (local_632[iVar2 * 0x1d + iVar3] == '_') {
          local_632[iVar2 * 0x1d + iVar3] = ' ';
        }
      }
    }
    FUN_170b_003a(local_4);
    for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
      local_88[iVar2] = -1;
    }
    iVar2 = 8;
LAB_66b0_07c6:
    if (iVar2 < 0x16) {
LAB_66b0_074c:
      local_c = 0;
      do {
        iVar3 = local_a;
        if (local_c != 0) {
          local_88[iVar2] = local_a;
          FUN_1000_4a70(iVar2 * 0x1d + 0xce9,0x3c04,local_632 + iVar3 * 0x1d);
          *(char *)(iVar2 * 0x1d + 0xcfd) = local_61f[local_a * 0x1d + 1];
          *(char *)(iVar2 * 0x1d + 0xcfe) = local_61f[local_a * 0x1d + 2];
          iVar2 = iVar2 + 1;
          goto LAB_66b0_07c6;
        }
        local_a = thunk_FUN_7e8f_02bf(1,local_8,0xffff);
        local_c = 1;
        for (iVar3 = 0; iVar3 < iVar2; iVar3 = iVar3 + 1) {
          if (local_88[iVar3] == local_a) {
            local_c = 0;
          }
        }
        if (local_c == 0) {
LAB_66b0_071a:
          if (local_c == 0) goto LAB_66b0_074c;
          FUN_1000_1e79();
          iVar3 = FUN_66b0_08f4();
          if ((iVar3 != 0) || (iVar2 < param_1 + 8)) goto LAB_66b0_074c;
        }
        else {
          FUN_1000_1e79();
          iVar3 = FUN_66b0_08f4();
          if ((iVar3 == 0) || (param_1 + 8 <= iVar2)) goto LAB_66b0_071a;
        }
        local_c = 1;
      } while( true );
    }
  }
  return;
}

