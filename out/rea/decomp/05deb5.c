
void __cdecl16far FUN_5d9f_04c5(int param_1)

{
  int iVar1;
  int in_DX;
  int iVar2;
  int iVar3;
  
  DAT_4125_0832 = 1;
  iVar2 = 8;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    iVar1 = FUN_1d28_011f(0x42c,0,0);
    *(int *)(iVar3 * 4 + 0x40cc) = in_DX;
    *(int *)(iVar3 * 4 + 0x40ca) = iVar1;
    iVar2 = iVar3;
    if (iVar1 == 0 && in_DX == 0) {
      thunk_FUN_79a9_0000(0x909,0x4125);
    }
  }
  if (param_1 != 0) {
    FUN_5d9f_0519();
  }
  return;
}

