
void __cdecl16far FUN_7b71_2051(void)

{
  undefined2 uVar1;
  int iVar2;
  
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if (((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xd0) == 1)) &&
       (*(int *)(iVar2 * 2 + 0xc0) != 3)) {
      thunk_FUN_7938_03d9(7,*(undefined2 *)(iVar2 * 2 + 0xc0),0xffff,0);
      uVar1 = thunk_FUN_7e8f_02bf(1,DAT_451b_08ce + -1,0);
      *(undefined2 *)(iVar2 * 2 + 0xe0) = uVar1;
      FUN_7b71_0634(iVar2,0);
    }
  }
  FUN_7b71_0416();
  return;
}

