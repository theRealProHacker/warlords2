
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_73de_0a1c(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 unaff_SS;
  undefined1 local_7e [50];
  undefined1 local_4c [66];
  undefined4 local_a;
  undefined4 local_6;
  
  FUN_73de_131a();
  iVar1 = FUN_2012_01fe(0x4494,0x4125,local_6);
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
    _DAT_451b_0530 = local_a;
    FUN_1000_1d02(&local_a,unaff_SS,(undefined2 *)&DAT_451b_0528,0x4125);
    FUN_1997_034a();
    (*DAT_451b_2a68)(0x1997,0x54a8,0x4125,DAT_4125_1048,DAT_4125_104c,0x342a,0x4125,_DAT_451b_0530,
                     0x546d,0x4125,DAT_4125_1048);
    thunk_FUN_53ff_0000(param_1,param_2,local_4c);
    thunk_FUN_7875_06ae(0xf0002,0x30000);
    thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,DAT_451b_052a + 0xb,local_4c);
    thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,DAT_451b_052a + 0x23,local_7e);
  }
  return;
}

