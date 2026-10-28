
void __cdecl16far FUN_8027_1ecd(void)

{
  int iVar1;
  int iVar2;
  
  FUN_22bf_07a5();
  thunk_FUN_54e4_069c();
  thunk_FUN_7d9f_0000();
  thunk_FUN_54e4_0000();
  thunk_FUN_79c4_056a();
  FUN_18a9_066e(0x101e4);
  FUN_22bf_0757();
  for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
    if (*(int *)(iVar1 * 2 + 0x137) != 0) {
      for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
        if ((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xd0) == 0)) {
          *(undefined2 *)((char *)s_Blessings___Quests__4125_10e5 + 0xe + iVar1 * 2) = DAT_3c04_0110
          ;
        }
      }
    }
  }
  return;
}

