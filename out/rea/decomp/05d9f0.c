
void __cdecl16far FUN_5d9f_0000(void)

{
  byte *pbVar1;
  undefined1 *puVar2;
  bool bVar3;
  int iVar4;
  undefined2 uVar5;
  
  bVar3 = false;
  if (DAT_4125_0832 == 0) {
    FUN_5d9f_04c5();
  }
  pbVar1 = (byte *)(DAT_3c04_0110 * 9 + 0x153b);
  *pbVar1 = *pbVar1 & 0xf3;
  iVar4 = DAT_3c04_0110 * 9;
  uVar5 = 0x3c04;
  pbVar1 = (byte *)(iVar4 + 0x153b);
  *pbVar1 = *pbVar1 & 0xfc;
  puVar2 = (undefined1 *)(iVar4 + 0x153b);
  *puVar2 = *puVar2;
  thunk_FUN_8c81_0952(0);
  FUN_5d9f_05e6();
  DAT_4125_0836 = 1;
  DAT_451b_018e._0_2_ = FUN_1d28_069a(*(undefined4 *)(DAT_3c04_0110 * 4 + 0x40ca));
  DAT_451b_018e._2_2_ = uVar5;
  FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x838,0x4125,DAT_3c04_0110);
  FUN_5d9f_0dc9((undefined1 *)&DAT_451b_1d28,0x4125,0);
  FUN_5d9f_0386();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x848,0x4125,0);
  thunk_FUN_557a_0000();
  FUN_5d9f_0dc9(0x852,0x4125,0);
  thunk_FUN_606a_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x85c,0x4125,0);
  if (((bRam00000417 & 3) == 0) && (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0)) {
    *(undefined2 *)(DAT_3c04_0110 * 2 + 0xd0) = 1;
    bVar3 = true;
  }
  if (DAT_3c04_0124 != 0) {
    thunk_FUN_5ab9_0284();
  }
  if (bVar3) {
    *(undefined2 *)(DAT_3c04_0110 * 2 + 0xd0) = 0;
  }
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x868,0x4125,0);
  thunk_FUN_5ab9_0458();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x875,0x4125,0);
  thunk_FUN_562a_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x87d,0x4125,0);
  thunk_FUN_5ab9_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x885,0x4125,0);
  thunk_FUN_5ab9_0888();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x88c,0x4125,0);
  thunk_FUN_59a9_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x895,0x4125,0);
  thunk_FUN_5c8e_01f1();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8a0,0x4125,0);
  thunk_FUN_57d5_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8a8,0x4125,0);
  thunk_FUN_5ab9_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8b0,0x4125,0);
  thunk_FUN_5e7c_04ba();
  FUN_5d9f_0dc9(0x8bd,0x4125,0);
  if (DAT_3c04_0124 != 0) {
    thunk_FUN_59a9_0c1c();
  }
  FUN_5d9f_0dc9(0x8c9,0x4125,0);
  thunk_FUN_5efd_0000();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8d4,0x4125,0);
  thunk_FUN_5ab9_10e3();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8dd,0x4125,0);
  FUN_5d9f_0af2();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8e8,0x4125,0);
  thunk_FUN_5ab9_0b4d();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8f4,0x4125,0);
  FUN_5d9f_06d4();
  thunk_FUN_8027_131b();
  FUN_5d9f_0dc9(0x8ff,0x4125,0);
  FUN_5d9f_085f();
  thunk_FUN_8027_131b();
  FUN_1a4c_0348();
  FUN_5d9f_0dc9((undefined1 *)&DAT_451b_1d28,0x4125,1);
  thunk_FUN_8027_131b();
  DAT_4125_0836 = 0;
  FUN_5d9f_063d();
  FUN_1d28_07a9(*(undefined4 *)(DAT_3c04_0110 * 4 + 0x40ca));
  thunk_FUN_484d_1063();
  FUN_5d9f_045e();
  return;
}

