
void __cdecl16far FUN_8027_2074(void)

{
  int iVar1;
  int iVar2;
  
  if (DAT_3c04_015b == 0) {
    thunk_FUN_484d_1063();
    FUN_22bf_07a5();
    FUN_8027_0418();
    thunk_FUN_85d0_0e68();
    DAT_451b_1efe = 0;
    DAT_451b_1f02 = 0;
    for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
      *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar1 * 4) = 0;
      ((undefined2 *)&DAT_451b_1ede)[iVar1 * 2] = 0;
    }
    thunk_FUN_824f_0af3();
    thunk_FUN_85d0_006c();
    FUN_8027_0aeb();
    iVar1 = 0;
    for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
      if ((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xd0) == 0)) {
        iVar1 = iVar1 + 1;
      }
    }
    if ((1 < iVar1) && (DAT_3c04_0124 != 0)) {
      FUN_8027_0a6e();
    }
    FUN_22bf_0757();
    FUN_8027_17f6();
    FUN_8027_2123();
  }
  return;
}

