// ovl27:09ca ent 5f99a

void __cdecl16far FUN_5efd_09ca(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  int local_14;
  byte abStack_d [7];
  int local_6;
  uint local_4;
  
  local_6 = *(DAT_451b_018e + param_1 * 0x5c + 0x24e);
  for (iVar1 = 0; iVar1 < 6; iVar1 = iVar1 + 1) {
    iVar2 = *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x25a);
    if (iVar2 != -1) {
      local_14 = 0;
      thunk_FUN_5d9f_0656(iVar2,0,abStack_d + 1);
      iVar2 = 6;
      while (iVar3 = iVar2 + -1, iVar2 != 0) {
        local_4 = abStack_d[iVar2];
        iVar2 = iVar3;
        if ((local_4 != 0xff) && (*(local_4 * 0x41 + 0x1592) == local_6)) {
          local_14 = local_14 + 1;
        }
      }
      *(DAT_451b_018e + param_1 * 0x5c + iVar1 * 2 + 0x27e) = local_14;
    }
  }
  return;
}

