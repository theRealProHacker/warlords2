
void __cdecl16far FUN_544d_0427(void)

{
  int iVar1;
  
  iVar1 = FUN_170b_0006(0x58a,0x4125,1);
  if (-1 < iVar1) {
    FUN_170b_006d(iVar1,(undefined2 *)&DAT_451b_0042,0x4125,8);
    FUN_170b_003a(iVar1);
    for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
      FUN_544d_0579(((undefined2 *)&DAT_451b_0042)[iVar1],(undefined2 *)&DAT_451b_004a + iVar1,
                    0x4125);
    }
  }
  return;
}

