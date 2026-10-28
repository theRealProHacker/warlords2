
void __cdecl16far FUN_6ec8_05ff(void)

{
  bool bVar1;
  undefined2 uVar2;
  undefined4 in_EDX;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined1 local_20 [10];
  undefined1 local_16 [8];
  int local_e;
  undefined2 local_c;
  int local_a;
  undefined2 local_8;
  int local_6;
  int local_4;
  
  if (DAT_4125_0df6 == 3) {
    FUN_6ec8_093d();
  }
  else {
    uVar5 = 0x1997;
    FUN_1997_034a();
    if ((DAT_451b_1679 != 0) && ((DAT_451b_16a4 & 10) == 0)) {
      for (iVar3 = 0; iVar3 < (int)(uint)DAT_451b_16a3; iVar3 = iVar3 + 1) {
        uVar5 = 0x1d28;
        uVar2 = FUN_1d28_069a(((undefined4 *)&DAT_451b_1679)[iVar3]);
        ((undefined2 *)&DAT_451b_168b)[iVar3 * 2] = (int)in_EDX;
        ((undefined2 *)&DAT_451b_1689)[iVar3 * 2] = uVar2;
      }
    }
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if (((undefined2 *)&DAT_451b_04e0)[iVar3] == 0) {
        local_c = *(undefined2 *)(iVar3 * 2 + 0xe10);
        local_8 = 8;
        local_e = 0x138;
        if (DAT_4125_0e40 < 1) {
          local_a = 1;
        }
        else {
          if ((int)((undefined2 *)&DAT_451b_04f0)[iVar3] < 0) {
            ((undefined2 *)&DAT_451b_04f0)[iVar3] = 0;
          }
          local_a = (int)(((long)(int)((undefined2 *)&DAT_451b_04f0)[iVar3] * 0xf0) /
                         (long)DAT_4125_0e40);
        }
        if (local_a < 1) {
          local_a = 1;
        }
        iVar4 = 0;
        local_4 = local_a / 8;
        local_6 = local_a % 8;
        bVar1 = false;
        while (!bVar1) {
          if (iVar4 == local_4) {
            bVar1 = true;
            if (0 < local_6) {
              (*DAT_451b_2a74)(uVar5,0x55cf,0x4125,*(undefined2 *)(iVar3 * 4 + 0xe20),
                               *(undefined2 *)(iVar3 * 4 + 0xe22),local_6,8,0x342a,0x4125,
                               local_e + iVar4 * 8,local_c);
            }
          }
          else {
            (*DAT_451b_2a74)(uVar5,0x55cf,0x4125,*(undefined2 *)(iVar3 * 4 + 0xe20),
                             *(undefined2 *)(iVar3 * 4 + 0xe22),0x80008,0x342a,0x4125,
                             local_e + iVar4 * 8,local_c);
            iVar4 = iVar4 + 1;
          }
          FUN_216d_002e(local_16);
          uVar5 = 0x24d0;
          FUN_24d0_02e5();
        }
      }
    }
    FUN_24d0_0002();
    FUN_2133_02fe();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_24d0_0002();
    FUN_2133_02fe();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    FUN_2133_0344();
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    FUN_1000_4944();
    thunk_FUN_7e8f_0103(DAT_4125_0e0c,local_20);
    FUN_1000_4944();
    thunk_FUN_7e8f_00d6(DAT_4125_0e08,local_20);
    thunk_FUN_7e8f_00d6(DAT_4125_0e04,0xe49,0x4125);
    if ((DAT_451b_1679 != 0) && ((DAT_451b_16a4 & 10) == 0)) {
      for (iVar3 = 0; iVar3 < (int)(uint)DAT_451b_16a3; iVar3 = iVar3 + 1) {
        FUN_1d28_07a9(((undefined4 *)&DAT_451b_1679)[iVar3]);
      }
    }
  }
  return;
}

