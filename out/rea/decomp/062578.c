
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: ram */

void __cdecl16far FUN_621e_0398(void)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  undefined2 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined2 uVar9;
  undefined2 local_4;
  
  uVar4 = DAT_3c04_0110;
  local_4 = 0;
  iVar8 = 100;
  while (iVar7 = iVar8 + -1, iVar8 != 0) {
    iVar5 = 6;
    while (iVar6 = iVar5 + -1, iVar8 = iVar7, iVar5 != 0) {
      uVar9 = (undefined2)((ulong)_DAT_451b_018a >> 0x10);
      *(undefined1 *)((int)_DAT_451b_018a + iVar7 * 6 + iVar6) = 0xff;
      *(undefined1 *)(DAT_451b_018a + iVar7 * 6 + iVar6 + 600) = 0;
      iVar5 = iVar6;
    }
  }
  DAT_3c04_0110 = 0;
  FUN_1555_0d9e();
  for (iVar8 = 0; iVar8 < DAT_3c04_157b; iVar8 = iVar8 + 1) {
    bVar2 = *(byte *)(iVar8 * 0x41 + 0x1592);
    iVar7 = (iVar8 * 0x14) / DAT_3c04_157b;
    if (local_4 != iVar7) {
      thunk_FUN_8027_1463();
      local_4 = iVar7;
    }
    *(undefined1 *)(iVar8 * 0x41 + 0x1592) = (undefined1)DAT_3c04_0110;
    bVar3 = (byte)DAT_3c04_0110;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 1);
    *pbVar1 = *pbVar1 | bVar3 & 0xf;
    bVar3 = (byte)DAT_3c04_0110;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 0xe3);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 0xe3);
    *pbVar1 = *pbVar1 | bVar3 & 0xf;
    bVar3 = (byte)DAT_3c04_0110;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 0xe1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 0xe1);
    *pbVar1 = *pbVar1 | bVar3 & 0xf;
    bVar3 = (byte)DAT_3c04_0110;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 3);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 3);
    *pbVar1 = *pbVar1 | bVar3 & 0xf;
    FUN_1555_1ab9(0x2d,*(undefined2 *)(iVar8 * 0x41 + 0x157d),*(undefined2 *)(iVar8 * 0x41 + 0x157f)
                  ,1);
    iVar7 = FUN_621e_0749(iVar8,DAT_451b_018a + iVar8 * 6,DAT_451b_018c);
    if (iVar7 == 0) {
      FUN_1555_1ab9(0x3c,*(undefined2 *)(iVar8 * 0x41 + 0x157d),
                    *(undefined2 *)(iVar8 * 0x41 + 0x157f),1);
      FUN_621e_0749(iVar8,DAT_451b_018a + iVar8 * 6,DAT_451b_018c);
    }
    *(byte *)(iVar8 * 0x41 + 0x1592) = bVar2;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 1);
    *pbVar1 = *pbVar1 | bVar2 & 0xf;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 0xe3);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 0xe3);
    *pbVar1 = *pbVar1 | bVar2 & 0xf;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 0xe1);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 0xe1);
    *pbVar1 = *pbVar1 | bVar2 & 0xf;
    iVar7 = *(int *)(iVar8 * 0x41 + 0x157f) * 0xe0 + *(int *)(iVar8 * 0x41 + 0x157d) * 2;
    pbVar1 = (byte *)(iVar7 + 3);
    *pbVar1 = *pbVar1 & 0xf0;
    pbVar1 = (byte *)(iVar7 + 3);
    *pbVar1 = *pbVar1 | bVar2 & 0xf;
  }
  thunk_FUN_8027_1463();
  DAT_3c04_0110 = uVar4;
  return;
}

