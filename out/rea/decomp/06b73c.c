
void __cdecl16far FUN_6a62_111c(void)

{
  int iVar1;
  
  for (iVar1 = 0; iVar1 < 0x1d; iVar1 = iVar1 + 1) {
    *(undefined1 *)(DAT_3c04_0110 * 0x1d + iVar1 + 0x60b) =
         *(undefined1 *)((int)DAT_4125_0d58 + iVar1);
  }
  FUN_1d28_050d(DAT_4125_0d58);
  thunk_FUN_54e4_069c();
  thunk_FUN_8027_0000(0);
  return;
}

