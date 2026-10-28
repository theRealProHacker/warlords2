
void __cdecl16far thunk_FUN_830b_232b(void)

{
  byte bVar1;
  char cVar2;
  undefined2 uVar3;
  uint uVar4;
  undefined2 in_DX;
  int iVar5;
  int iVar6;
  undefined2 *puVar7;
  undefined2 unaff_SS;
  char acStack_10c [256];
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_8 = thunk_FUN_54e4_08bf();
  if (iStack_8 == 0) {
    thunk_FUN_54e4_0000();
  }
  else {
    thunk_FUN_54e4_08f6(&iStack_4);
    thunk_FUN_54e4_070b(200 - iStack_4,0xaf - iStack_6,0x6900f8);
  }
  uVar3 = thunk_FUN_7e8f_04f0(0x60089);
  uVar3 = thunk_FUN_7e8f_04f0(0x50089,uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x40089,uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x30089,uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x20089,uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x10089,uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x89,uVar3,in_DX);
  thunk_FUN_8027_1471(uVar3,in_DX);
  thunk_FUN_4bea_01b5();
  thunk_FUN_4bea_01ff();
  FUN_830b_2a11();
  DAT_451b_1f06 = DAT_451b_1f12;
  if (DAT_3c04_0161 == 1) {
    DAT_451b_1f06 = DAT_451b_1f0e;
  }
  if (DAT_3c04_0161 == 2) {
    DAT_451b_1f06 = DAT_451b_1f0a;
  }
  puVar7 = (undefined2 *)0x1997;
  iVar6 = DAT_3c04_0161;
  FUN_1997_034a();
  if ((DAT_451b_18c7 != 0) && ((DAT_451b_18f2 & 10) == 0)) {
    for (iVar5 = 0; iVar5 < (int)(uint)DAT_451b_18f1; iVar5 = iVar5 + 1) {
      puVar7 = (undefined2 *)0x1d28;
      uVar3 = FUN_1d28_069a(((undefined4 *)&DAT_451b_18c7)[iVar5]);
      ((undefined2 *)&DAT_451b_18d9)[iVar5 * 2] = iVar6;
      ((undefined2 *)&DAT_451b_18d7)[iVar5 * 2] = uVar3;
    }
  }
  for (iVar6 = 0; iVar6 < 0x100; iVar6 = iVar6 + 1) {
    puVar7 = (undefined2 *)0x40c1;
    cVar2 = thunk_FUN_7e8f_02bf();
    acStack_10c[iVar6] = cVar2;
  }
  iVar6 = 0;
  iStack_a = 0;
  for (iStack_4 = 0; iStack_4 < 0x70; iStack_4 = iStack_4 + 1) {
    iStack_c = (iStack_4 * 10) / 0x70;
    if (iStack_a < iStack_c) {
      iStack_a = iStack_a + 1;
      puVar7 = (undefined2 *)&DAT_451b_0002;
      thunk_FUN_4bea_01ff();
    }
    for (iStack_6 = 0; iStack_6 < 0x9c; iStack_6 = iStack_6 + 1) {
      uVar4 = (uint)*(byte *)(iStack_6 * 0xe0 + iStack_4 * 2);
      bVar1 = *(byte *)(iStack_6 * 0x70 + iStack_4);
      if ((bVar1 & 0x1f) != 0) {
        uVar4 = (*(byte *)(iStack_6 * 0x70 + iStack_4) & 0x1f) - 1;
      }
      if (((int)uVar4 < 0x50) || (0x5f < (int)uVar4)) {
        if ((bVar1 & 0x1f) == 0) {
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 << 1);
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 * 2 + 1,iStack_6 << 1);
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 * 2 + 1);
        }
        else {
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 << 1);
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 * 2 + 1,iStack_6 << 1);
          (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 * 2 + 1);
        }
        (*DAT_451b_2a70)();
      }
      else {
        (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 << 1,(int)acStack_10c[iVar6]);
        (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 * 2 + 1,iStack_6 << 1);
        (*DAT_451b_2a70)(puVar7,0x581d,0x4125,iStack_4 << 1,iStack_6 * 2 + 1);
        iVar6 = iVar6 + 4;
        (*DAT_451b_2a70)();
        if (0xff < iVar6) {
          iVar6 = 0;
        }
      }
    }
  }
  if ((DAT_451b_18c7 != 0) && ((DAT_451b_18f2 & 10) == 0)) {
    for (iVar6 = 0; iVar6 < (int)(uint)DAT_451b_18f1; iVar6 = iVar6 + 1) {
      FUN_1d28_07a9(((undefined4 *)&DAT_451b_18c7)[iVar6]);
    }
  }
  FUN_830b_2bb6();
  if (iStack_8 == 0) {
    thunk_FUN_54e4_069c();
  }
  return;
}

