
undefined2 __cdecl16far FUN_621e_0e5a(int param_1,undefined2 param_2,int param_3,undefined2 param_4)

{
  int iVar1;
  int iVar2;
  
  iVar1 = thunk_FUN_705a_0000(param_1,param_2);
  if ((*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < *(char *)(param_1 * 0x41 + iVar1 + 0x15a3) + 0x1e)
     && (iVar2 = thunk_FUN_8027_225b(), 5 < iVar2)) {
    return 0;
  }
  *(undefined1 *)(param_1 * 0x41 + 0x15a9) = (undefined1)param_2;
  *(undefined1 *)(param_1 * 0x41 + 0x15aa) = *(undefined1 *)(param_1 * 0x41 + iVar1 + 0x1597);
  if (param_3 == 0) {
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + param_1 * 0x41) = 0;
  }
  else {
    FUN_621e_0f10(param_1,param_4);
  }
  return 1;
}

