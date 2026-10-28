
void __cdecl16far FUN_76ef_093b(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  
  DAT_451b_08ce = 10;
  for (iVar2 = 0; iVar2 < 10; iVar2 = iVar2 + 1) {
    ((undefined2 *)&DAT_451b_0c9c)[iVar2] = iVar2;
    FUN_1000_4a70(iVar2 * 0x20 + 0x483c,0x4125,iVar2 * 0xf + 0x471c,0x4125);
  }
  uVar1 = thunk_FUN_7e8f_04f0(0x2e,DAT_4125_128e);
  thunk_FUN_7938_0000(0x8e,0x407f,uVar1,in_DX);
  return;
}

