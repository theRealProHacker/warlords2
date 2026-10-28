
int __cdecl16far thunk_FUN_824f_0651(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  int iVar2;
  int iStack_a;
  undefined2 uStack_8;
  undefined2 uStack_6;
  int iStack_4;
  
  iStack_4 = FUN_824f_04fa(param_1,param_2,DAT_3c04_0110,0);
  iVar1 = thunk_FUN_7533_0b47(DAT_3c04_0110,&uStack_6);
  iStack_a = iStack_4;
  if (iVar1 != 0) {
    iVar1 = FUN_1a8b_0acc(param_1,param_2,*(undefined2 *)(iStack_4 * 0x41 + 0x157d),
                          *(undefined2 *)(iStack_4 * 0x41 + 0x157f));
    iVar2 = FUN_1a8b_0acc(param_1,param_2,uStack_6,uStack_8);
    if (iVar2 < iVar1) {
      iStack_a = DAT_3c04_0110 + 100;
    }
  }
  return iStack_a;
}

