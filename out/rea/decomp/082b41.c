
int __cdecl16far FUN_824f_0651(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  int iVar2;
  int local_a;
  undefined2 local_8;
  undefined2 local_6;
  int local_4;
  
  local_4 = FUN_824f_04fa(param_1,param_2,DAT_3c04_0110,0);
  iVar1 = thunk_FUN_7533_0b47(DAT_3c04_0110,&local_6);
  local_a = local_4;
  if (iVar1 != 0) {
    iVar1 = FUN_1a8b_0acc(param_1,param_2,*(undefined2 *)(local_4 * 0x41 + 0x157d),
                          *(undefined2 *)(local_4 * 0x41 + 0x157f));
    iVar2 = FUN_1a8b_0acc(param_1,param_2,local_6,local_8);
    if (iVar2 < iVar1) {
      local_a = DAT_3c04_0110 + 100;
    }
  }
  return local_a;
}

