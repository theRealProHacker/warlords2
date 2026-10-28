
undefined2 __cdecl16far FUN_562a_1864(int param_1,int param_2)

{
  int *piVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  byte abStack_11 [7];
  int local_a;
  uint local_8;
  int local_6;
  
  local_6 = thunk_FUN_63da_07d0();
  if (param_2 == 0) {
    local_a = 0;
    thunk_FUN_5d9f_0656(param_1,0,abStack_11 + 1);
    iVar4 = 6;
    while (iVar3 = iVar4, iVar4 = iVar3 + -1, iVar3 != 0) {
      local_8 = (uint)abStack_11[iVar3];
      if (((local_8 != 0xff) && (*(char *)(local_8 * 0x41 + 0x1592) == DAT_3c04_0110)) &&
         ((byte)(&stack0xffe9)[iVar3] < 0x2d)) {
        local_a = local_a + 1;
      }
    }
    if (2 < local_a) {
      return 0xffff;
    }
  }
  if (399 < local_6) {
    FUN_562a_199c();
    return 0xffff;
  }
  FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x788,0x4125,param_1 * 0x41 + 0x1581,0x3c04);
  thunk_FUN_67a7_16b3((undefined1 *)&DAT_451b_1d28,0x4125);
  thunk_FUN_647b_016b(*(undefined2 *)(param_1 * 0x41 + 0x157d),
                      *(undefined2 *)(param_1 * 0x41 + 0x157f),1);
  iVar4 = thunk_FUN_7e8f_02bf(1,0xf);
  piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
  *piVar1 = *piVar1 + iVar4 + 10;
  thunk_FUN_5c8e_10a1(*(undefined2 *)(param_1 * 0x41 + 0x157d),
                      *(undefined2 *)(param_1 * 0x41 + 0x157f));
  uVar2 = thunk_FUN_621e_1851();
  return uVar2;
}

