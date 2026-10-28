
void __cdecl16far FUN_5127_0014(void)

{
  int iVar1;
  int iVar2;
  
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    iVar1 = thunk_FUN_7e8f_02bf(1,0xffff0005);
    FUN_1000_4a70(iVar2 * 0x14,0x3c04,(int)DAT_451b_002a + iVar2 * 100 + iVar1 * 0x14 + 0x764,
                  DAT_451b_002a._2_2_);
  }
  return;
}

