
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint __cdecl16far FUN_22bf_002b(int param_1)

{
  int iVar1;
  uint uVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  
  if (DAT_4125_3682 != 0) {
    FUN_2012_09cf(0x357e,0x4125);
  }
  iVar1 = FUN_2012_01fe(0x357e,0x4125,DAT_4125_35b9 + 0x1fU & 0xffe0,DAT_4125_35bb + 0xfU & 0xfff0);
  if (iVar1 == 0) {
    FUN_1000_43ac((char *)s_Cannot_allocate_saveBM_4125_3684,0x4125);
    uVar2 = 0;
  }
  else {
    if ((_DAT_4125_3588 != 0) && ((DAT_4125_35b3 & 10) == 0)) {
      for (iVar1 = 0; iVar1 < (int)(uint)DAT_4125_35b2; iVar1 = iVar1 + 1) {
        uVar3 = FUN_1d28_069a(((undefined2 *)&DAT_4125_3588)[iVar1 * 2],
                              *(undefined2 *)((undefined *)&DAT_4125_358a + iVar1 * 4));
        ((undefined2 *)&DAT_4125_359a)[iVar1 * 2] = in_DX;
        ((undefined2 *)&DAT_4125_3598)[iVar1 * 2] = uVar3;
      }
    }
    if (DAT_4125_3682 != 0) {
      FUN_2012_09cf(0x35bd,0x4125);
    }
    iVar1 = FUN_2012_01fe(0x35bd,0x4125,(DAT_4125_35b9 + 8) * 8,DAT_4125_35bb);
    if (iVar1 == 0) {
      FUN_1000_43ac((char *)s_Cannot_allocate_mouse_bitmap_4125_369c,0x4125);
    }
    if ((_DAT_4125_35c7 != 0) && ((DAT_4125_35f2 & 10) == 0)) {
      for (iVar1 = 0; iVar1 < (int)(uint)DAT_4125_35f1; iVar1 = iVar1 + 1) {
        uVar3 = FUN_1d28_069a(((undefined2 *)&DAT_4125_35c7)[iVar1 * 2],
                              *(undefined2 *)((undefined *)&DAT_4125_35c9 + iVar1 * 4));
        ((undefined2 *)&DAT_4125_35d9)[iVar1 * 2] = in_DX;
        ((undefined2 *)&DAT_4125_35d7)[iVar1 * 2] = uVar3;
      }
    }
    iVar1 = FUN_2012_0232(0x3633,0x4125,(DAT_4125_35b9 + 8) * 8,DAT_4125_35bb,1);
    if (iVar1 == 0) {
      FUN_1000_43ac((char *)s_Cannot_allocate_mouse_mask_bitma_4125_36ba,0x4125);
    }
    if ((_DAT_4125_363d != 0) && ((DAT_4125_3668 & 10) == 0)) {
      for (iVar1 = 0; iVar1 < (int)(uint)DAT_4125_3667; iVar1 = iVar1 + 1) {
        uVar3 = FUN_1d28_069a(((undefined2 *)&DAT_4125_363d)[iVar1 * 2],
                              *(undefined2 *)((undefined *)&DAT_4125_363f + iVar1 * 4));
        ((undefined2 *)&DAT_4125_364f)[iVar1 * 2] = in_DX;
        ((undefined2 *)&DAT_4125_364d)[iVar1 * 2] = uVar3;
      }
    }
    FUN_2012_09e3(0x3633,0x4125,1);
    if (param_1 == 0) {
      iVar1 = FUN_1ea3_01d2();
      DAT_4125_3574 = (uint)(iVar1 != 0);
    }
    else {
      DAT_4125_3574 = 0;
    }
    FUN_22bf_036f(0);
    DAT_4125_356a = 0;
    DAT_4125_3568 = 0;
    FUN_1ec0_0046(0,0);
    if (DAT_4125_3574 == 0) {
      DAT_4125_356a = 0;
      DAT_4125_3568 = 0;
    }
    else {
      FUN_22bf_0abd((undefined2 *)&DAT_4125_3568,0x4125,(undefined2 *)&DAT_4125_356a,0x4125);
    }
    DAT_4125_3570 = 1;
    FUN_22bf_0757();
    uVar2 = DAT_4125_3574;
  }
  return uVar2;
}

