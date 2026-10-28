
void __cdecl16far FUN_85d0_18e8(void)

{
  int iVar1;
  int iVar2;
  
  FUN_1000_1d02((undefined2 *)&DAT_451b_1fc5,0x4125,(undefined2 *)&DAT_451b_226b,0x4125);
  DAT_451b_2509 = DAT_451b_2509 | 1;
  for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
    for (iVar1 = 0; iVar1 < 9; iVar1 = iVar1 + 1) {
      ((undefined1 *)&DAT_451b_2281)[iVar2 * 0x48 + iVar1 * 8] =
           ((undefined1 *)&DAT_451b_2281)[iVar2 * 0x48 + iVar1 * 8] | 1;
    }
  }
  return;
}

