
int __cdecl16far FUN_824f_04fa(undefined2 param_1,undefined2 param_2,int param_3,int param_4)

{
  int iVar1;
  int iVar2;
  int local_6;
  int local_4;
  
  local_4 = -1;
  local_6 = 1000;
  for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
    if ((((((DAT_3c04_0124 == 0) || (param_4 == 0)) ||
          (iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                                       *(undefined2 *)(iVar2 * 0x41 + 0x157f)), iVar1 != 0)) ||
         ((iVar1 = thunk_FUN_85d0_15ff(1,*(int *)(iVar2 * 0x41 + 0x157d) + 1,
                                       *(undefined2 *)(iVar2 * 0x41 + 0x157f)), iVar1 != 0 ||
          (iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                                       *(int *)(iVar2 * 0x41 + 0x157f) + 1), iVar1 != 0)))) ||
        (iVar1 = thunk_FUN_85d0_15ff(1,*(int *)(iVar2 * 0x41 + 0x157d) + 1,
                                     *(int *)(iVar2 * 0x41 + 0x157f) + 1), iVar1 != 0)) &&
       ((iVar1 = FUN_1a8b_0acc(param_1,param_2,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                               *(undefined2 *)(iVar2 * 0x41 + 0x157f)), iVar1 < local_6 &&
        ((param_3 == 0xe || (*(char *)(iVar2 * 0x41 + 0x1592) == param_3)))))) {
      local_6 = iVar1;
      local_4 = iVar2;
    }
  }
  return local_4;
}

