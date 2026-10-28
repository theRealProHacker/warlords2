
void __cdecl16far FUN_67a7_20a8(void)

{
  int *piVar1;
  byte *pbVar2;
  uint uVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 uVar6;
  
  uVar3 = *(byte *)(DAT_451b_01fc * 0xe0 + DAT_451b_01fe * 2 + 1) & 0xf;
  if (uVar3 == 0xf) {
    return;
  }
  if ((*(byte *)(DAT_3c04_0110 * 8 + uVar3 + 0x153b) & 3) == 0) {
    iVar4 = thunk_FUN_7e8f_02bf();
    iVar4 = iVar4 + 100;
  }
  else {
    if ((*(byte *)(DAT_3c04_0110 * 8 + uVar3 + 0x153b) & 3) != 1) goto LAB_67a7_214b;
    iVar4 = thunk_FUN_7e8f_02bf();
    iVar4 = iVar4 + 10;
  }
  piVar1 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
  *piVar1 = *piVar1 + iVar4;
LAB_67a7_214b:
  iVar4 = DAT_3c04_0110 * 8 + uVar3;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 & 0xfc;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 | 2;
  iVar4 = uVar3 * 8 + DAT_3c04_0110;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 & 0xfc;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 | 2;
  iVar4 = DAT_3c04_0110 * 8 + uVar3;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 & 0xf3;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 | 8;
  iVar4 = uVar3 * 8 + DAT_3c04_0110;
  uVar6 = 0x3c04;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 & 0xf3;
  pbVar2 = (byte *)(iVar4 + 0x153b);
  *pbVar2 = *pbVar2 | 8;
  iVar4 = thunk_FUN_5d9f_09ab();
  if (iVar4 == 0) {
    thunk_FUN_8027_011f();
    FUN_67a7_0000(DAT_451b_01fe,DAT_451b_01fc);
  }
  iVar4 = thunk_FUN_5d9f_09ab();
  if ((iVar4 != 0) && (DAT_3c04_0159 != 0)) {
    uVar5 = thunk_FUN_7e8f_04f0(0x2006f,uVar3 * 0x14,0x3c04);
    FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar5,uVar6);
    thunk_FUN_8027_11d1();
  }
  thunk_FUN_6d27_1244(DAT_3c04_0110,8,DAT_3c04_0110,uVar3,0);
  return;
}

