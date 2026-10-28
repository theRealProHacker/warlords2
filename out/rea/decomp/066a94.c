
void __cdecl16far FUN_6513_1964(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int local_4;
  
  thunk_FUN_54e4_069c();
  uVar1 = FUN_1b62_007d(DAT_451b_01ca,DAT_451b_01c8,&local_4);
  DAT_451b_1f02 = CONCAT22(in_DX,uVar1);
  if (DAT_451b_1efe != 0) {
    DAT_451b_1f02 = DAT_451b_1efe;
  }
  if (0 < local_4) {
    FUN_1b62_09ec(local_4,0);
    thunk_FUN_8bc3_06eb(DAT_451b_1f02);
  }
  thunk_FUN_8027_011f(1,0x10000);
  return;
}

