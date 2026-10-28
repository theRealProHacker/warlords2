// ovl19:0996 ent 56c36

undefined2 __cdecl16far FUN_562a_0996(int param_1)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 unaff_SS;
  bool bVar5;
  int local_1a [8];
  int local_a;
  undefined2 local_8;
  int local_6;
  int local_4;
  
  local_8 = 0xf;
  local_6 = 4;
  do {
    bVar5 = local_6 == 0;
    local_6 = local_6 + -1;
    if (bVar5) {
      return 1;
    }
    do {
      local_4 = 1;
      FUN_562a_1251(param_1);
      uVar4 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (*(DAT_451b_018e + param_1 * 0x5c + local_6 * 2 + 0x28a) == -1) break;
      iVar3 = *(DAT_451b_018e + param_1 * 0x5c + local_6 * 2 + 0x28a);
      iVar1 = thunk_FUN_621e_13b2(*(iVar3 * 0x16 + -0x7780),
                                  *(iVar3 * 0x16 + -0x777e),local_1a);
      if (iVar1 == 0) break;
      FUN_1c8c_0529();
      FUN_1555_1ab9(local_8,*(iVar3 * 0x16 + -0x7780),
                    *(iVar3 * 0x16 + -0x777e),DAT_451b_1e9c,DAT_451b_1e9a);
      local_a = FUN_562a_0b49(param_1,local_1a);
      if (local_a == 0) {
        uVar2 = 0xffff;
        iVar3 = 8;
        do {
          iVar1 = iVar3 + -1;
          if (iVar3 == 0) goto LAB_562a_0b13;
          iVar3 = iVar1;
        } while (local_1a[iVar1] == -1);
        if ((*(local_1a[iVar1] * 0x16 + -0x7772) & 0xf) == 1) {
          uVar2 = (*(local_1a[iVar1] * 0x16 + -0x7771) >> 1);
        }
LAB_562a_0b13:
        if (uVar2 != 0xffff) {
          FUN_562a_0f1b(param_1,local_1a);
        }
LAB_562a_0b27:
        local_4 = 0;
      }
      else if ((local_a == 1) || (local_a == 3)) goto LAB_562a_0b27;
    } while (local_4 != 0);
  } while( true );
}

