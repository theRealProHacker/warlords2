
void __cdecl16far FUN_8027_1e4e(void)

{
  int iVar1;
  
  for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
    if ((*(int *)(iVar1 * 2 + 0x137) != 0) && (*(int *)(iVar1 * 2 + 0xd0) == 1)) {
      *(undefined2 *)(iVar1 * 2 + 0x137) = 0;
    }
  }
  DAT_3c04_015b = 1;
  thunk_FUN_6d27_1244(DAT_3c04_0110,7,DAT_3c04_0110,0,0x2b03,0x4125);
  FUN_22bf_07a5();
  thunk_FUN_54e4_069c();
  FUN_8027_1fbd();
  FUN_22bf_0757();
  return;
}

