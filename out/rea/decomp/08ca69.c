
void __cdecl16far FUN_8c81_0259(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined1 local_34 [50];
  
  bVar1 = true;
  DAT_4125_3254 = 0;
  if (DAT_4125_16a6 != 0) {
    DAT_4125_16a6 = 0;
    for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
      if (*(int *)(iVar2 * 2 + 0x137) != 0) {
        *(undefined2 *)(iVar2 * 2 + 0x147) = 1;
      }
    }
  }
  iVar2 = 0;
  for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
    if ((*(int *)(iVar3 * 2 + 0x137) != 0) && (*(int *)(iVar3 * 2 + 0xd0) == 0)) {
      iVar2 = iVar2 + 1;
    }
  }
  if ((1 < iVar2) && (DAT_3c04_0124 != 0)) {
    bVar1 = false;
  }
  DAT_3c04_0159 = 1;
  thunk_FUN_484d_0db3();
  thunk_FUN_85d0_0d39();
  thunk_FUN_824f_03f9();
  thunk_FUN_824f_0372();
  thunk_FUN_824f_02bf();
  if (DAT_3c04_0124 != 0) {
    thunk_FUN_85d0_1558();
  }
  if (DAT_3c04_0124 != 0) {
    thunk_FUN_830b_2200();
  }
  DAT_4125_325e = param_1;
  if (bVar1) {
    thunk_FUN_830b_0000(0x10001,0);
  }
  thunk_FUN_8027_0aeb();
  FUN_1b62_0d85();
  FUN_8c81_05fb();
  thunk_FUN_8bc3_0000();
  FUN_8c81_0827();
  thunk_FUN_8bc3_0113();
  thunk_FUN_824f_0af3();
  FUN_8c81_0952(0);
  if (bVar1) {
    thunk_FUN_85d0_0629(*(undefined2 *)(param_1 * 0x14 + 0x189),
                        *(undefined2 *)(param_1 * 0x14 + 0x18b));
    thunk_FUN_899d_0356();
  }
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  thunk_FUN_7e8f_00d6(0x550140,DAT_3c04_0110 * 0x14,0x3c04);
  thunk_FUN_8027_225b();
  FUN_1000_4944(local_34);
  thunk_FUN_7e8f_00d6(0x820140,local_34);
  thunk_FUN_7d9f_0b93();
  thunk_FUN_7e8f_01f1();
  FUN_22bf_0757();
  DAT_4125_166a = 1;
  thunk_FUN_7e8f_0142();
  DAT_4125_166a = 0;
  FUN_22bf_07a5();
  thunk_FUN_54e4_069c();
  FUN_255e_0736();
  thunk_FUN_7e8f_0a1b();
  if (!bVar1) {
    thunk_FUN_830b_0000(0x10001,0);
    thunk_FUN_85d0_0629(*(undefined2 *)(param_1 * 0x14 + 0x189),
                        *(undefined2 *)(param_1 * 0x14 + 0x18b));
  }
  thunk_FUN_85d0_006c();
  FUN_22bf_0757();
  FUN_1b62_0ea0(0xffffffff);
  thunk_FUN_4974_1ded(0xffff,0,0);
  thunk_FUN_7d9f_026f();
  FUN_8c81_04bd();
  return;
}

