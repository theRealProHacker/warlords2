
void __cdecl16far FUN_6513_0e85(int param_1)

{
  uint *puVar1;
  int iVar2;
  char *pcVar3;
  undefined2 uVar4;
  undefined2 in_DX;
  uint uVar5;
  int iVar6;
  int iVar7;
  undefined4 uVar8;
  undefined1 local_86 [128];
  char *local_6;
  int local_4;
  
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  if (param_1 < 0) {
    FUN_18a9_03b3();
    if (DAT_451b_08ce < 1) {
      uVar4 = 2;
    }
    else {
      uVar4 = 1;
    }
    FUN_18a9_066e(0x117,uVar4);
    FUN_18a9_066e(0x10118);
    if (DAT_3c04_0124 == 0) {
      uVar4 = 2;
    }
    else {
      uVar4 = 1;
    }
    uVar8 = CONCAT22(uVar4,0x119);
  }
  else {
    local_4 = ((undefined2 *)&DAT_451b_0c9c)[param_1];
    if (local_4 == -1) {
      uVar4 = thunk_FUN_7e8f_04f0(0x2003e);
      FUN_6513_15d5(uVar4,in_DX);
      uVar4 = thunk_FUN_7e8f_04f0(0x1003e);
      FUN_6513_15d5(uVar4,in_DX);
      iVar7 = 0;
      local_6 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
      for (iVar6 = 0; iVar6 < DAT_3c04_080f; iVar6 = iVar6 + 1) {
        if ((((*(int *)(iVar6 * 0x1f + 0x82c) != 0) &&
             ((*(uint *)(iVar6 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) == 0)) &&
            (iVar2 = FUN_1a8b_0acc(*(undefined2 *)(iVar6 * 0x1f + 0x811),
                                   *(undefined2 *)(iVar6 * 0x1f + 0x813),DAT_451b_01ca,DAT_451b_01c8
                                  ), iVar2 < 0x23)) &&
           ((*(char *)(iVar6 * 0x1f + 0x829) == '\x04' &&
            (pcVar3 = (char *)FUN_1a8b_0acc(*(undefined2 *)(iVar6 * 0x1f + 0x811),
                                            *(undefined2 *)(iVar6 * 0x1f + 0x813),DAT_451b_01ca,
                                            DAT_451b_01c8), (int)pcVar3 < (int)local_6)))) {
          iVar7 = iVar6;
          local_6 = pcVar3;
        }
      }
    }
    else if (local_4 == -2) {
      uVar4 = thunk_FUN_7e8f_04f0(0x3003e);
      FUN_6513_15d5(uVar4,in_DX);
      uVar4 = thunk_FUN_7e8f_04f0(0x1003e);
      FUN_6513_15d5(uVar4,in_DX);
      iVar7 = 0;
      local_6 = (char *)s__x__Use_extended_memory_4125_2703 + 0xd;
      for (iVar6 = 0; iVar6 < DAT_3c04_080f; iVar6 = iVar6 + 1) {
        if (((*(int *)(iVar6 * 0x1f + 0x82c) != 0) &&
            ((*(uint *)(iVar6 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) == 0)) &&
           ((iVar2 = FUN_1a8b_0acc(*(undefined2 *)(iVar6 * 0x1f + 0x811),
                                   *(undefined2 *)(iVar6 * 0x1f + 0x813),DAT_451b_01ca,DAT_451b_01c8
                                  ), iVar2 < 0x23 &&
            ((*(char *)(iVar6 * 0x1f + 0x829) == '\x05' &&
             (pcVar3 = (char *)FUN_1a8b_0acc(*(undefined2 *)(iVar6 * 0x1f + 0x811),
                                             *(undefined2 *)(iVar6 * 0x1f + 0x813),DAT_451b_01ca,
                                             DAT_451b_01c8), (int)pcVar3 < (int)local_6)))))) {
          iVar7 = iVar6;
          local_6 = pcVar3;
        }
      }
    }
    else {
      thunk_FUN_7e8f_04f0(0x3e,local_4 * 0x1d + 0xce9,0x3c04);
      FUN_1000_4944(local_86);
      FUN_6513_15d5(local_86);
      uVar4 = thunk_FUN_7e8f_04f0(0x1003e);
      FUN_6513_15d5(uVar4,in_DX);
      iVar7 = 0;
      while ((iVar7 < DAT_3c04_080f && (*(char *)(iVar7 * 0x1f + 0x82a) != (char)local_4))) {
        iVar7 = iVar7 + 1;
      }
    }
    uVar5 = 1 << ((byte)DAT_3c04_0110 & 0x1f);
    puVar1 = (uint *)(iVar7 * 0x1f + 0x82e);
    *puVar1 = *puVar1 | uVar5;
    thunk_FUN_85d0_1298();
    thunk_FUN_830b_2200();
    thunk_FUN_66b0_09f2();
    thunk_FUN_830b_0000(0x10000,0);
    uVar4 = thunk_FUN_7e8f_04f0(0x7003e,iVar7 * 0x1f + 0x815,0x3c04);
    FUN_1000_4944(0x5c38,0x4125,uVar4,uVar5);
    FUN_6513_15d5(0x5c38,0x4125);
    thunk_FUN_824f_0806(iVar7,8);
    thunk_FUN_824f_0868(iVar7,8);
    thunk_FUN_824f_0a3f(*DAT_451b_1efe,((undefined2 *)DAT_451b_1efe)[1],
                        *(undefined2 *)(iVar7 * 0x1f + 0x811),*(undefined2 *)(iVar7 * 0x1f + 0x813),
                        8);
    thunk_FUN_830b_1f5f();
    thunk_FUN_830b_04d3(0);
    thunk_FUN_54e4_070b(0x1160008,0x1700f0);
    FUN_18a9_03b3();
    FUN_18a9_03b3();
    FUN_18a9_03b3();
    uVar8 = 0x1011a;
  }
  FUN_18a9_066e(uVar8);
  return;
}

