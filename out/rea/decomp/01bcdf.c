
void __cdecl16far FUN_1b62_06bf(void)

{
  bool bVar1;
  int iVar2;
  undefined1 local_34 [50];
  
  bVar1 = false;
  if (DAT_451b_1f02 != 0) {
    if (DAT_4125_2bda == 0) {
      if (*(char *)((int)DAT_451b_1f02 + 4) == '\x1c') {
        bVar1 = true;
      }
    }
    else {
      for (iVar2 = 0; iVar2 < DAT_451b_1e9e; iVar2 = iVar2 + 1) {
        if (*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar2 * 2) + 4) == '\x1c')
        {
          bVar1 = true;
        }
      }
    }
    FUN_1000_4a70(local_34);
    if (bVar1) {
      FUN_1000_4a70(local_34);
    }
    thunk_FUN_7b13_0088((char *)s_Disband_4125_2bf8,0x4125,(char *)s_Are_you_sure_you_4125_2c00,
                        0x4125,(char *)s_want_to_disband_this_4125_2c11,0x4125,
                        (undefined2 *)&DAT_4125_2c26,0x4125,local_34);
  }
  return;
}

