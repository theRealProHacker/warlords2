
void __cdecl16far thunk_FUN_8c81_0952(int param_1,int param_2)

{
  undefined1 *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  int aiStack_68 [7];
  uint auStack_5a [9];
  undefined2 auStack_48 [8];
  int aiStack_38 [8];
  undefined1 auStack_28 [20];
  int iStack_14;
  int iStack_12;
  int iStack_10;
  undefined4 uStack_e;
  undefined1 auStack_a [8];
  
  iVar4 = 0;
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    if (*(int *)(iVar2 * 2 + 0x137) != 0) {
      iVar4 = iVar4 + 1;
    }
  }
  if (iVar4 == 0) {
    return;
  }
  for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
    aiStack_38[iVar2] = 0;
    auStack_48[iVar2] = 0xffff;
    auStack_5a[iVar2 + 1] = 0;
    aiStack_68[iVar2] = 0;
  }
  iVar2 = 0;
  iStack_14 = iVar4;
  for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
    if (*(int *)(*(int *)(iVar3 * 2 + 0x163) * 2 + 0x137) != 0) {
      auStack_48[iVar2] = *(undefined2 *)(iVar3 * 2 + 0x163);
      aiStack_38[iVar2] = ((8 - iVar4) + iVar2) * 0x10 + 0x200;
      if (*(int *)(iVar3 * 2 + 0x163) == DAT_3c04_0110) {
        iStack_12 = iVar2;
      }
      iVar2 = iVar2 + 1;
    }
  }
  iVar2 = iStack_14;
  if ((iStack_12 == 0) || (iVar4 == 1)) {
    auStack_5a[1] = (uint)(iVar4 != 1);
  }
  else {
    if (iStack_14 + -1 == iStack_12) {
      auStack_5a[iStack_14] = (uint)(1 < iVar4);
      puVar1 = &stack0xff94;
      goto LAB_8c81_0aae;
    }
    auStack_5a[iStack_12 + 1] = (uint)(1 < iVar4);
    iVar2 = iStack_12;
  }
  puVar1 = &stack0xff96;
LAB_8c81_0aae:
  *(undefined2 *)(puVar1 + iVar2 * 2) = 1;
  FUN_22bf_07a5();
  if (param_1 != 0) {
    FUN_24d0_0002();
    FUN_216d_0288(0x3256,0x4125);
    thunk_FUN_7875_06ae(2,0x3000f);
    thunk_FUN_8027_225b();
    FUN_1000_4944(auStack_28);
    thunk_FUN_7e8f_0103((8 - iVar4) * 0x10 + 0x1fc,0,auStack_28);
    for (iVar2 = 0; iVar2 < iStack_14; iVar2 = iVar2 + 1) {
      FUN_216d_000e(&uStack_e);
      FUN_216d_002e(auStack_a);
      FUN_1000_1e79(uStack_e);
      FUN_1997_027e();
    }
  }
  iVar2 = -1;
  iStack_10 = -1;
  for (iVar4 = 0; iVar4 < iStack_14; iVar4 = iVar4 + 1) {
    if (aiStack_68[iVar4] != 0) {
      iVar2 = iVar4;
    }
  }
  for (iVar4 = 0; iVar4 < iStack_14; iVar4 = iVar4 + 1) {
    if (auStack_5a[iVar4 + 1] != 0) {
      iStack_10 = iVar4;
    }
  }
  if (((param_1 == 0) && (-1 < iVar2)) && (param_2 == 0)) {
    FUN_24d0_0002();
    FUN_216d_002e(auStack_a);
    FUN_216d_0288(auStack_a);
    FUN_216d_000e(&uStack_e);
    FUN_216d_002e(auStack_a);
    FUN_1000_1e79(uStack_e);
    FUN_1997_027e();
  }
  if (((param_1 == 0) && (-1 < iStack_10)) && (param_2 == 0)) {
    FUN_24d0_0002();
    FUN_216d_002e(auStack_a);
    FUN_216d_0288(auStack_a);
    FUN_216d_000e(&uStack_e);
    FUN_216d_002e(auStack_a);
    FUN_1000_1e79(uStack_e);
    FUN_1997_027e();
  }
  FUN_22bf_0757();
  return;
}

