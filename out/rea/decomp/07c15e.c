
void __cdecl16far FUN_7b71_0a4e(int param_1)

{
  int *piVar1;
  int iVar2;
  undefined2 unaff_SS;
  undefined2 local_c;
  int local_a;
  int local_6;
  int local_4;
  
  if (*(int *)(param_1 * 2 + 0x137) == 0) {
    FUN_7b71_0416();
  }
  else {
    if (*(int *)(param_1 * 2 + 0xd0) == 0) {
      local_4 = 4;
    }
    else {
      local_4 = *(int *)(param_1 * 2 + 0xc0);
    }
    if (*(int *)(param_1 * 2 + 0xd0) == 0) {
      *(undefined2 *)(param_1 * 2 + 0xd0) = 1;
      *(undefined2 *)(param_1 * 2 + 0xc0) = 0;
    }
    else if (*(int *)(param_1 * 2 + 0xc0) == 2) {
      *(undefined2 *)(param_1 * 2 + 0xc0) = 3;
    }
    else if (*(int *)(param_1 * 2 + 0xc0) == 3) {
      *(undefined2 *)(param_1 * 2 + 0xc0) = 0;
      *(undefined2 *)(param_1 * 2 + 0xd0) = 0;
    }
    else {
      piVar1 = (int *)(param_1 * 2 + 0xc0);
      *piVar1 = *piVar1 + 1;
    }
    *(undefined2 *)(param_1 * 2 + 0xe0) = 0;
    FUN_22bf_07a5();
    for (iVar2 = 1; iVar2 < 4; iVar2 = iVar2 + 1) {
      FUN_1000_1d02(local_4 * 8 + 0x24b8,0x4125,&local_c,unaff_SS);
      local_a = local_a + iVar2 * local_6;
      FUN_1000_1e79();
      FUN_1997_0129(0x1f);
      local_a = 1;
      local_c = 0x1997;
      thunk_FUN_7e8f_0000();
    }
    FUN_7b71_0634(param_1,0);
    FUN_7b71_0bab();
    FUN_7b71_0416();
    FUN_22bf_0757();
  }
  return;
}

