
void __cdecl16far FUN_8c81_0827(void)

{
  int *piVar1;
  
  thunk_FUN_824f_0372();
  thunk_FUN_824f_02bf();
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 + (((undefined2 *)&DAT_451b_1e6a)[DAT_3c04_0110] -
                      ((undefined2 *)&DAT_451b_1e7a)[DAT_3c04_0110]);
  if (*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < 0) {
    *(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x185) = 0;
  }
  return;
}

