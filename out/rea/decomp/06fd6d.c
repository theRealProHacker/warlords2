
void __cdecl16far FUN_6f60_076d(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  
  if (DAT_4125_0e4c == 0) {
    uVar1 = FUN_1d28_011f(0x321,0,0x156);
    DAT_4125_0e4c = CONCAT22(in_DX,uVar1);
    iVar2 = FUN_1d28_069a(uVar1,in_DX);
    DAT_451b_0504 = CONCAT22(in_DX,iVar2);
    *(undefined1 *)(iVar2 + 800) = 0;
    FUN_1d28_07a9(DAT_4125_0e4c);
  }
  uVar1 = FUN_1d28_069a(DAT_4125_0e4c);
  DAT_451b_0504 = CONCAT22(in_DX,uVar1);
  return;
}

