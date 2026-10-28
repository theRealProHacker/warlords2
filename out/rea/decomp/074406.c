
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_73de_0626(int param_1)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 unaff_SS;
  undefined4 uVar3;
  int in_stack_0000000e;
  undefined1 local_3e [50];
  int local_c;
  undefined4 local_a;
  undefined4 local_6;
  
  if (param_1 != -1) {
    FUN_73de_1486(&local_a);
    iVar1 = FUN_2012_01fe(0x4494,0x4125,local_6);
    if (iVar1 != 0) {
      FUN_22bf_07a5();
      if ((DAT_451b_053e != 0) && ((DAT_451b_0569 & 10) == 0)) {
        for (local_c = 0; local_c < (int)(uint)DAT_451b_0568; local_c = local_c + 1) {
          uVar2 = FUN_1d28_069a(((undefined4 *)&DAT_451b_053e)[local_c]);
          ((undefined2 *)&DAT_451b_0550)[local_c * 2] = in_DX;
          ((undefined2 *)&DAT_451b_054e)[local_c * 2] = uVar2;
        }
      }
      (*DAT_451b_2a74)();
      if ((DAT_451b_053e != 0) && ((DAT_451b_0569 & 10) == 0)) {
        for (local_c = 0; local_c < (int)(uint)DAT_451b_0568; local_c = local_c + 1) {
          FUN_1d28_07a9(((undefined4 *)&DAT_451b_053e)[local_c]);
        }
      }
      _DAT_451b_0530 = local_a;
      FUN_1000_1d02(&local_a,unaff_SS,(undefined2 *)&DAT_451b_0528,0x4125);
      FUN_1997_034a();
      (*DAT_451b_2a68)(0x1997,0x54a8,0x4125,DAT_4125_1050,DAT_4125_1054,0x342a,0x4125,_DAT_451b_0530
                       ,0x546d,0x4125,DAT_4125_1050);
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      if (param_1 == 0x1c) {
        uVar3 = CONCAT22(0x3c04,in_stack_0000000e * 0x14 + 0x223);
      }
      else {
        uVar3 = FUN_4058_0089(0x408a,param_1);
      }
      thunk_FUN_7e8f_00d6(DAT_451b_0530 + 0x70,DAT_451b_0532 + 8,uVar3);
      thunk_FUN_85d0_08be(param_1,DAT_3c04_0110,0x342a,0x4125,DAT_451b_0530 + 0x60,
                          DAT_451b_0532 + 0x1f,0,0,0x10000,0);
      if ((param_1 != 0x1c) && (0 < in_stack_0000000e)) {
        (*DAT_451b_2a74)();
        if (1 < in_stack_0000000e) {
          (*DAT_451b_2a74)();
        }
        if (2 < in_stack_0000000e) {
          (*DAT_451b_2a74)();
        }
        if (3 < in_stack_0000000e) {
          (*DAT_451b_2a74)();
        }
      }
      thunk_FUN_7875_06ae(0xf0002,0x30000);
      FUN_1000_4944();
      thunk_FUN_7e8f_0103(DAT_451b_0530 + 0x68,DAT_451b_0532 + 0x42,local_3e);
      FUN_1000_4944();
      thunk_FUN_7e8f_00bf(DAT_451b_0530 + 0x78,DAT_451b_0532 + 0x42,local_3e);
      FUN_1000_4944();
      thunk_FUN_7e8f_0103(DAT_451b_0530 + 0x68,DAT_451b_0532 + 0x56,local_3e);
      FUN_1000_4944();
      thunk_FUN_7e8f_00bf(DAT_451b_0530 + 0x78,DAT_451b_0532 + 0x56,local_3e);
      if (((((undefined1 *)&DAT_451b_0664)[param_1 * 6] != '\0') ||
          (((((undefined1 *)&DAT_451b_0665)[param_1 * 6] != '\0' &&
            (((undefined1 *)&DAT_451b_0666)[param_1 * 6] != '\0')) ||
           (((undefined1 *)&DAT_451b_0665)[param_1 * 6] != '\0')))) ||
         (((undefined1 *)&DAT_451b_0666)[param_1 * 6] != '\0')) {
        (*DAT_451b_2a74)();
      }
    }
  }
  return;
}

