
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_85d0_113b(void)

{
  byte *pbVar1;
  undefined1 *puVar2;
  undefined1 uVar3;
  undefined2 in_DX;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined1 *puStack_e;
  int iStack_a;
  int iStack_4;
  
  puVar2 = (undefined1 *)FUN_1d28_069a(DAT_4125_1270);
  _DAT_4125_126c = (undefined1 *)CONCAT22(in_DX,puVar2);
  puStack_e = _DAT_4125_126c;
  if (DAT_3c04_0124 == 0) {
    uVar3 = 0xff;
  }
  else {
    uVar3 = 0;
  }
  for (iVar5 = 0; iVar5 < 0x9c; iVar5 = iVar5 + 1) {
    for (iVar6 = 0; iVar6 < 0x70; iVar6 = iVar6 + 1) {
      *puStack_e = uVar3;
      puStack_e = (undefined1 *)CONCAT22(puStack_e._2_2_,(undefined1 *)puStack_e + 1);
      pbVar1 = (byte *)(iVar5 * 0x70 + iVar6);
      *pbVar1 = *pbVar1 | 0x20;
      pbVar1 = (byte *)(iVar5 * 0x70 + iVar6);
      *pbVar1 = *pbVar1 & 0x7f;
    }
  }
  for (iVar5 = 0; iVar5 < 9; iVar5 = iVar5 + 1) {
    for (iVar6 = 0; iVar6 < 9; iVar6 = iVar6 + 1) {
      ((undefined1 *)&DAT_451b_1f74)[iVar5 * 9 + iVar6] = 0xff;
    }
  }
  for (iStack_4 = 0; iStack_4 < 8; iStack_4 = iStack_4 + 1) {
    for (iStack_a = 0; iStack_a < DAT_3c04_157b; iStack_a = iStack_a + 1) {
      if (*(char *)(iStack_a * 0x41 + 0x1592) == iStack_4) {
        iVar5 = *(int *)(iStack_a * 0x41 + 0x157d);
        iVar6 = *(int *)(iStack_a * 0x41 + 0x157f);
        for (iVar4 = iVar5 + -2; iVar4 <= iVar5 + 3; iVar4 = iVar4 + 1) {
          for (iVar7 = iVar6 + -2; iVar7 <= iVar6 + 3; iVar7 = iVar7 + 1) {
            DAT_4125_126c[iVar4 + iVar7 * 0x70] =
                 DAT_4125_126c[iVar4 + iVar7 * 0x70] | '\x01' << ((byte)iStack_4 & 0x1f);
          }
        }
      }
    }
  }
  FUN_1d28_07a9(DAT_4125_1270);
  return;
}

