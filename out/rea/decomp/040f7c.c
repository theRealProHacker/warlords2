
void __cdecl16far thunk_FUN_830b_2785(int param_1,int param_2,int param_3)

{
  char cVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 uVar3;
  bool bVar4;
  int iStack_8;
  uint uStack_4;
  
  if (param_1 != 0) {
    FUN_830b_2a11();
  }
  DAT_451b_1f06 = DAT_451b_1f12;
  uVar3 = 0x1997;
  FUN_1997_034a();
  if ((DAT_451b_18c7 != 0) && ((DAT_451b_18f2 & 10) == 0)) {
    for (iStack_8 = 0; iStack_8 < (int)(uint)DAT_451b_18f1; iStack_8 = iStack_8 + 1) {
      uVar3 = 0x1d28;
      uVar2 = FUN_1d28_069a(((undefined4 *)&DAT_451b_18c7)[iStack_8]);
      ((undefined2 *)&DAT_451b_18d9)[iStack_8 * 2] = in_DX;
      ((undefined2 *)&DAT_451b_18d7)[iStack_8 * 2] = uVar2;
    }
  }
  uStack_4 = (uint)*(byte *)(param_3 * 0xe0 + param_2 * 2);
  bVar4 = (*(byte *)(param_3 * 0x70 + param_2) & 0x1f) != 0;
  if (bVar4) {
    uStack_4 = (*(byte *)(param_3 * 0x70 + param_2) & 0x1f) - 1;
  }
  if (((int)uStack_4 < 0x50) || (0x5f < (int)uStack_4)) {
    if (bVar4) {
      cVar1 = *(char *)((int)DAT_451b_1f22 + uStack_4);
    }
    else {
      cVar1 = *(char *)((int)DAT_451b_1f32 + uStack_4);
    }
    (*DAT_451b_2a70)(uVar3,0x581d,0x4125,param_2 << 1,param_3 << 1,
                     *(undefined2 *)((int)DAT_451b_1f06 + cVar1 * 2));
    if (bVar4) {
      cVar1 = *(char *)((int)DAT_451b_1f1e + uStack_4);
    }
    else {
      cVar1 = *(char *)((int)DAT_451b_1f2e + uStack_4);
    }
    (*DAT_451b_2a70)(uVar3,0x581d,0x4125,param_2 * 2 + 1,param_3 << 1,
                     *(undefined2 *)((int)DAT_451b_1f06 + cVar1 * 2));
    if (bVar4) {
      cVar1 = *(char *)((int)DAT_451b_1f1a + uStack_4);
    }
    else {
      cVar1 = *(char *)((int)DAT_451b_1f2a + uStack_4);
    }
    (*DAT_451b_2a70)(uVar3,0x581d,0x4125,param_2 << 1,param_3 * 2 + 1,
                     *(undefined2 *)((int)DAT_451b_1f06 + cVar1 * 2));
    if (bVar4) {
      cVar1 = *(char *)((int)DAT_451b_1f16 + uStack_4);
    }
    else {
      cVar1 = *(char *)((int)DAT_451b_1f26 + uStack_4);
    }
    (*DAT_451b_2a70)(uVar3,0x581d,0x4125,param_2 * 2 + 1,param_3 * 2 + 1,
                     *(undefined2 *)((int)DAT_451b_1f06 + cVar1 * 2));
    if (param_1 != 0) {
      FUN_830b_2bb6();
    }
  }
  else {
    uVar3 = thunk_FUN_7e8f_02bf(1,0x10003);
    (*DAT_451b_2a70)(0x40c1,0x581d,0x4125,param_2 << 1,param_3 << 1,uVar3);
    uVar3 = thunk_FUN_7e8f_02bf(1,0x10003);
    (*DAT_451b_2a70)(0x40c1,0x581d,0x4125,param_2 * 2 + 1,param_3 << 1,uVar3);
    uVar3 = thunk_FUN_7e8f_02bf(1,0x10003);
    (*DAT_451b_2a70)(0x40c1,0x581d,0x4125,param_2 << 1,param_3 * 2 + 1,uVar3);
    uVar3 = thunk_FUN_7e8f_02bf(1,0x10003);
    (*DAT_451b_2a70)(0x40c1,0x581d,0x4125,param_2 * 2 + 1,param_3 * 2 + 1,uVar3);
  }
  return;
}

