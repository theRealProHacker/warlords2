
void __cdecl16far FUN_891f_05ec(void)

{
  undefined2 uVar1;
  undefined2 in_DX;
  int iVar2;
  undefined2 uVar3;
  
  uVar3 = 0x891f;
  if (DAT_4125_2f87 == 0) {
    FUN_891f_0000();
  }
  if ((DAT_4125_2f54 != 0) && ((DAT_4125_2f7f & 10) == 0)) {
    for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_2f7e; iVar2 = iVar2 + 1) {
      uVar3 = 0x1d28;
      uVar1 = FUN_1d28_069a(((undefined4 *)&DAT_4125_2f54)[iVar2]);
      ((undefined2 *)&DAT_4125_2f66)[iVar2 * 2] = in_DX;
      ((undefined2 *)&DAT_4125_2f64)[iVar2 * 2] = uVar1;
    }
  }
  (*DAT_451b_2a74)(uVar3,0x2f4a,0x4125,0,0x130020,0x342a,0x4125,DAT_451b_2870 * 2 + 400U & 0xfff8,
                   DAT_451b_2872 * 2 + 0x1e);
  if ((DAT_4125_2f54 != 0) && ((DAT_4125_2f7f & 10) == 0)) {
    for (iVar2 = 0; iVar2 < (int)(uint)DAT_4125_2f7e; iVar2 = iVar2 + 1) {
      FUN_1d28_07a9(((undefined4 *)&DAT_4125_2f54)[iVar2]);
    }
  }
  return;
}

