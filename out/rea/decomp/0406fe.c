
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_73de_032a(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 unaff_SS;
  undefined4 uVar3;
  undefined1 auStack_3c [50];
  undefined4 uStack_a;
  undefined4 uStack_6;
  
  FUN_73de_1486(&uStack_a);
  iVar1 = FUN_2012_01fe(0x4494,0x4125,uStack_6);
  if (iVar1 != 0) {
    FUN_22bf_07a5();
    if ((DAT_451b_053e != 0) && ((DAT_451b_0569 & 10) == 0)) {
      for (iVar1 = 0; iVar1 < (int)(uint)DAT_451b_0568; iVar1 = iVar1 + 1) {
        uVar2 = FUN_1d28_069a(((undefined4 *)&DAT_451b_053e)[iVar1]);
        ((undefined2 *)&DAT_451b_0550)[iVar1 * 2] = in_DX;
        ((undefined2 *)&DAT_451b_054e)[iVar1 * 2] = uVar2;
      }
    }
    (*DAT_451b_2a74)();
    if ((DAT_451b_053e != 0) && ((DAT_451b_0569 & 10) == 0)) {
      for (iVar1 = 0; iVar1 < (int)(uint)DAT_451b_0568; iVar1 = iVar1 + 1) {
        FUN_1d28_07a9(((undefined4 *)&DAT_451b_053e)[iVar1]);
      }
    }
    _DAT_451b_0530 = uStack_a;
    FUN_1000_1d02(&uStack_a,unaff_SS,(undefined2 *)&DAT_451b_0528,0x4125);
    FUN_1997_034a();
    (*DAT_451b_2a68)(0x1997,0x54a8,0x4125,DAT_4125_1050,DAT_4125_1054,0x342a,0x4125,_DAT_451b_0530,
                     0x546d,0x4125,DAT_4125_1050);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    uVar3 = FUN_4058_0089(0x408a,param_1);
    thunk_FUN_7e8f_00d6(DAT_451b_0530 + 0x70,DAT_451b_0532 + 8,uVar3);
    thunk_FUN_85d0_08be(param_1,DAT_3c04_0110,0x342a,0x4125,DAT_451b_0530 + 0x60,
                        DAT_451b_0532 + 0x1f,0,0,0x10000,0);
    FUN_1000_4944();
    thunk_FUN_7e8f_0103(DAT_451b_0530 + 0x68,DAT_451b_0532 + 0x42,auStack_3c);
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf(DAT_451b_0530 + 0x78,DAT_451b_0532 + 0x42,auStack_3c);
    FUN_1000_4944();
    thunk_FUN_7e8f_0103(DAT_451b_0530 + 0x68,DAT_451b_0532 + 0x56,auStack_3c);
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf(DAT_451b_0530 + 0x78,DAT_451b_0532 + 0x56,auStack_3c);
    if (((((undefined1 *)&DAT_451b_0664)[param_1 * 6] != '\0') ||
        (((((undefined1 *)&DAT_451b_0665)[param_1 * 6] != '\0' &&
          (((undefined1 *)&DAT_451b_0666)[param_1 * 6] != '\0')) ||
         (((undefined1 *)&DAT_451b_0665)[param_1 * 6] != '\0')))) ||
       (((undefined1 *)&DAT_451b_0666)[param_1 * 6] != '\0')) {
      (*DAT_451b_2a74)();
    }
  }
  return;
}

