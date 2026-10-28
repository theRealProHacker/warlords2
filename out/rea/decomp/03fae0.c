
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_54e4_0000(int param_1)

{
  int *piVar1;
  ulong uVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 extraout_DX;
  int iVar5;
  undefined2 unaff_SI;
  undefined2 uVar6;
  undefined2 unaff_DI;
  undefined2 uVar7;
  undefined2 unaff_SS;
  undefined4 uVar8;
  int *piStack_20;
  int in_stack_0000ffe2;
  int iStack_1c;
  int iStack_1a;
  undefined4 uStack_18;
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int aiStack_c [4];
  int iStack_4;
  
  iVar3 = DAT_4125_0636;
  uVar8 = CONCAT22(unaff_SI,unaff_DI);
  if (2 < DAT_4125_0636) {
    return;
  }
  iStack_4 = DAT_4125_0636;
  iVar5 = DAT_4125_0636 * 2;
  DAT_4125_0636 = DAT_4125_0636 + 1;
  *(int *)(iVar5 + 0x3fb2) = param_1;
  FUN_1000_1d02(param_1 * 8 + 0x6a8,0x4125,iVar3 * 8 + 0x3fc4,0x4125);
  piVar1 = (int *)(iStack_4 * 8 + 0x3fc4);
  *piVar1 = *piVar1 + -0x10;
  piVar1 = (int *)(iStack_4 * 8 + 0x3fc6);
  *piVar1 = *piVar1 + -1;
  piVar1 = (int *)(iStack_4 * 8 + 0x3fc8);
  *piVar1 = *piVar1 + 0x20;
  piVar1 = (int *)(iStack_4 * 8 + 0x3fca);
  *piVar1 = *piVar1 + 4;
  *(undefined4 *)(iStack_4 * 4 + 0x3fb8) = *(undefined4 *)(param_1 * 4 + 0x638);
  piVar1 = (int *)(iStack_4 * 4 + 0x3fb8);
  *piVar1 = *piVar1 + -0x10;
  piVar1 = (int *)(iStack_4 * 4 + 0x3fba);
  *piVar1 = *piVar1 + -1;
  uVar6 = extraout_DX;
  iVar3 = FUN_2012_01fe(iStack_4 * 0x3b + 0x3fdc,0x4125,*(undefined2 *)(iStack_4 * 8 + 0x3fc8),
                        *(undefined2 *)(iStack_4 * 8 + 0x3fca),uVar8);
  if (iVar3 == 0) {
    return;
  }
  uVar7 = 0x22bf;
  FUN_22bf_07a5();
  if ((*(int *)(iStack_4 * 0x3b + 0x3fe6) != 0 || *(int *)(iStack_4 * 0x3b + 0x3fe8) != 0) &&
     ((*(uint *)(iStack_4 * 0x3b + 0x4011) & 10) == 0)) {
    for (iStack_1a = 0; iStack_1a < (int)(uint)*(byte *)(iStack_4 * 0x3b + 0x4010);
        iStack_1a = iStack_1a + 1) {
      uVar8 = *(undefined4 *)(iStack_4 * 0x3b + iStack_1a * 4 + 0x3fe6);
      uVar7 = 0x1d28;
      uVar4 = FUN_1d28_069a((int)uVar8,(int)((ulong)uVar8 >> 0x10));
      iVar3 = iStack_4 * 0x3b + iStack_1a * 4;
      *(undefined2 *)(iVar3 + 0x3ff8) = uVar6;
      *(undefined2 *)(iVar3 + 0x3ff6) = uVar4;
    }
  }
  (*DAT_451b_2a74)(uVar7,0x342a,0x4125,*(undefined2 *)(iStack_4 * 8 + 0x3fc4),
                   *(undefined2 *)(iStack_4 * 8 + 0x3fc6),*(undefined2 *)(iStack_4 * 8 + 0x3fc8),
                   *(undefined2 *)(iStack_4 * 8 + 0x3fca),iStack_4 * 0x3b + 0x3fdc,0x4125,0,0);
  if ((*(int *)(iStack_4 * 0x3b + 0x3fe6) != 0 || *(int *)(iStack_4 * 0x3b + 0x3fe8) != 0) &&
     ((*(uint *)(iStack_4 * 0x3b + 0x4011) & 10) == 0)) {
    for (iVar3 = 0; iVar3 < (int)(uint)*(byte *)(iStack_4 * 0x3b + 0x4010); iVar3 = iVar3 + 1) {
      uVar8 = *(undefined4 *)(iStack_4 * 0x3b + iVar3 * 4 + 0x3fe6);
      FUN_1d28_07a9((int)uVar8,(int)((ulong)uVar8 >> 0x10));
    }
  }
  FUN_1000_1d02(param_1 * 8 + 0x6a8,0x4125,aiStack_c,unaff_SS);
  aiStack_c[0] = 0;
  aiStack_c[1] = 0;
  uStack_18 = *(undefined4 *)(param_1 * 4 + 0x638);
  if (param_1 == 2) {
    aiStack_c[0] = DAT_4125_2a8c;
    aiStack_c[2] = aiStack_c[2] - DAT_4125_2a8c;
    uVar2 = (ulong)uStack_18 >> 0x10;
    uStack_18 = CONCAT22((int)uVar2,(int)uStack_18 + DAT_4125_2a8c);
  }
  if (param_1 == 6) {
    uVar6 = 0x1c;
    FUN_1997_034a(0x1c);
    FUN_1997_060a(0x1c);
    FUN_216d_002e(&piStack_20);
    FUN_2012_0bb7(0x5893,0x4125,piStack_20,in_stack_0000ffe2,iStack_1c,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0bb7(0x5893,0x4125,piStack_20,in_stack_0000ffe2 + iStack_1a + -1,iStack_1c,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0f08(0x5893,0x4125,piStack_20,in_stack_0000ffe2,iStack_1a,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0f08(0x5893,0x4125,(int)piStack_20 + iStack_1c + -1,in_stack_0000ffe2,iStack_1a,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    piStack_20 = piStack_20 + 5;
    iVar3 = in_stack_0000ffe2 + 10;
    iVar5 = iStack_1a + -0x14;
    FUN_2012_0bb7(0x5893,0x4125,piStack_20,iVar3,iStack_1c + -0x14,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0bb7(0x5893,0x4125,piStack_20,iVar3 + iVar5 + -1,iStack_1c + -0x14,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0f08(0x5893,0x4125,piStack_20,iVar3,iVar5,*(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_2012_0f08(0x5893,0x4125,(int)piStack_20 + iStack_1c + -0x15,iVar3,iVar5,
                  *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0));
    FUN_216d_002e(&piStack_20);
    FUN_24d0_0497(0x5893,0x4125,&piStack_20);
    FUN_216d_002e(&piStack_20);
    FUN_24d0_0497(0x5893,0x4125,&piStack_20);
    FUN_216d_002e(&piStack_20);
    FUN_24d0_0497(0x5893,0x4125,&piStack_20);
    FUN_216d_002e(&piStack_20);
    FUN_24d0_0497(0x5893,0x4125,&piStack_20);
    FUN_1997_06bb(0x1c);
    goto LAB_54e4_059c;
  }
  if ((param_1 != 8) || (_DAT_451b_027d == 0)) {
    if (param_1 == 7) {
      uVar6 = 0x20;
      goto LAB_54e4_059c;
    }
    if (param_1 == 9) {
      uVar6 = 0x2c;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0xd) {
      uVar6 = 0x45;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x17) {
      uVar6 = 0x46;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x10) {
      uVar6 = 0x38;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x11) {
      uVar6 = 0x39;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x12) {
      uVar6 = 0x3a;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x13) {
      uVar6 = 0x3b;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x14) {
      uVar6 = 0xc;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x15) {
      uVar6 = 0xe;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x16) {
      uVar6 = 0xd;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x18) {
      uVar6 = 0x40;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x19) {
      uVar6 = 0x41;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x1a) {
      uVar6 = 0x42;
      goto LAB_54e4_059c;
    }
    if (param_1 == 0x1b) {
      uVar6 = 0x43;
      goto LAB_54e4_059c;
    }
  }
  uVar6 = 0x19;
LAB_54e4_059c:
  uVar7 = (undefined2)((ulong)uStack_18 >> 0x10);
  if ((param_1 == 0xd) || (param_1 == 0x17)) {
    FUN_1000_1e79((int)uStack_18,uVar7);
    FUN_1997_027e(uVar6);
  }
  else {
    FUN_1000_1e79((int)uStack_18,uVar7);
    FUN_1997_0129(uVar6);
    piStack_20 = (int *)0x1997;
    FUN_24d0_0002();
    piStack_20 = &iStack_14;
    FUN_1000_1d02(param_1 * 8 + 0x6a8,0x4125);
    iStack_14 = iStack_14 + -1;
    iStack_12 = iStack_12 + -1;
    iStack_10 = iStack_10 + 2;
    iStack_e = iStack_e + 2;
    piStack_20 = &iStack_14;
    FUN_216d_01fd();
    piStack_20 = (int *)(iStack_12 + iStack_e);
    FUN_2133_02fe();
    piStack_20 = (int *)(iStack_12 + iStack_e + 1);
    FUN_2133_02fe();
    piStack_20 = (int *)(iStack_12 + 2);
    FUN_2133_0344();
    piStack_20 = (int *)(iStack_12 + 2);
    FUN_2133_0344();
  }
  if (param_1 == 2) {
    piStack_20 = (int *)0x0;
    thunk_FUN_830b_0000(0x10000);
  }
  piStack_20 = (int *)0x54d8;
  FUN_22bf_0757();
  return;
}

