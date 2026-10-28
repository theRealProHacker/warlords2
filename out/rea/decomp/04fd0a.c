
void __cdecl16far FUN_4fc0_010a(void)

{
  bool bVar1;
  int iVar2;
  int unaff_SI;
  int unaff_DI;
  undefined2 local_4;
  
  local_4 = 0;
  bVar1 = false;
  while (!bVar1) {
    unaff_SI = thunk_FUN_7e8f_02bf(1,0x50066);
    unaff_DI = thunk_FUN_7e8f_02bf(1);
    if (*(char *)((int)DAT_451b_002a + unaff_DI * 0x70 + unaff_SI + 0x6120) == '\a') {
      if (local_4 < 4) {
        iVar2 = thunk_FUN_4c45_11f5(unaff_SI,unaff_DI);
        if (iVar2 != 0) {
          bVar1 = true;
        }
        iVar2 = thunk_FUN_4c45_11f5(unaff_SI + 1,unaff_DI);
        if (iVar2 != 0) {
          bVar1 = true;
        }
        iVar2 = thunk_FUN_4c45_11f5(unaff_SI,unaff_DI + 1);
        if (iVar2 != 0) {
          bVar1 = true;
        }
        iVar2 = thunk_FUN_4c45_11f5(unaff_SI + 1);
        if (iVar2 != 0) {
          bVar1 = true;
        }
        local_4 = local_4 + 1;
      }
      else {
        bVar1 = true;
      }
    }
  }
  *(undefined1 *)((int)DAT_451b_002a + unaff_DI * 0x70 + unaff_SI + 0x6120) = 8;
  thunk_FUN_4bea_03aa(unaff_SI,unaff_DI);
  FUN_4fc0_0029(unaff_SI,unaff_DI);
  FUN_4fc0_0029(unaff_SI + 1,unaff_DI + 1);
  FUN_4fc0_0029(unaff_SI + -1,unaff_DI + -1);
  FUN_4fc0_0029(unaff_SI + -1,unaff_DI + 1);
  FUN_4fc0_0029(unaff_SI + 1,unaff_DI + -1);
  return;
}

