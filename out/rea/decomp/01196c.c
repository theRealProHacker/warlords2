
/* WARNING: Instruction at (ram,0x000119f1) overlaps instruction at (ram,0x000119ef)
    */

uint FUN_1000_196c(int param_1)

{
  code *pcVar1;
  undefined1 uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  undefined1 extraout_AH;
  undefined1 extraout_AH_00;
  uint uVar6;
  int in_CX;
  undefined2 extraout_DX;
  int in_BX;
  undefined2 *puVar7;
  undefined2 *puVar8;
  uint unaff_SI;
  int unaff_DI;
  undefined2 unaff_SS;
  char cVar9;
  undefined4 uVar10;
  
  puVar7 = (undefined2 *)&stack0xfffe;
  puVar8 = (undefined2 *)&stack0xfffe;
  if (param_1 < -0x1344) {
    pcVar1 = (code *)swi(0x35);
    uVar10 = (*pcVar1)();
    out((int)((ulong)uVar10 >> 0x10),(char)uVar10);
    return (uint)uVar10;
  }
  if (0x1344 < param_1) {
    pcVar1 = (code *)swi(0x35);
    uVar3 = (*pcVar1)();
    return uVar3;
  }
  if (param_1 != 0) {
    unaff_SI = 7;
  }
  pcVar1 = (code *)swi(0x35);
  (*pcVar1)();
  uVar3 = FUN_1a8b_0ccd();
  (&stack0xfffe)[unaff_DI] = (&stack0xfffe)[unaff_DI] + (char)in_CX;
  *(char *)(unaff_DI + 2) = *(char *)(unaff_DI + 2) >> 0x17;
  uVar3 = unaff_SI & uVar3;
  pcVar1 = (code *)swi(0x35);
  (*pcVar1)();
  uVar4 = func_0x0001027e();
  uVar5 = uVar4 >> 2;
  cVar9 = uVar5 == 0;
  if ((uVar4 >> 1 & 1) == 0) {
LAB_1000_19b8:
    if ((bool)cVar9) goto LAB_1000_1a25;
    uVar4 = uVar5 >> 1;
    if ((uVar5 & 1) != 0) {
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uVar2 = in(0x39);
      uVar4 = CONCAT11(extraout_AH,uVar2);
    }
    uVar5 = uVar4 >> 1;
    if ((uVar4 & 1) != 0) {
      pcVar1 = (code *)swi(0x37);
      (*pcVar1)();
      uVar2 = in(extraout_DX);
      uVar5 = CONCAT11(extraout_AH_00,uVar2);
    }
    uVar4 = uVar5 >> 1;
    puVar7 = (undefined2 *)&stack0xfffe;
    if ((uVar5 & 1) != 0) {
      pcVar1 = (code *)swi(0x37);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x3a);
      uVar4 = (*pcVar1)();
      puVar7 = (undefined2 *)0x1994;
    }
    uVar6 = uVar4 >> 1;
    if ((uVar4 & 1) != 0) {
      pcVar1 = (code *)swi(0x37);
      (*pcVar1)();
      *(char *)(puVar7 + uVar3 * 2) = *(char *)(puVar7 + uVar3 * 2) + (char)((uint)in_BX >> 8);
      pcVar1 = (code *)swi(0x3a);
      uVar6 = (*pcVar1)();
      puVar7 = (undefined2 *)*puVar7;
    }
    uVar5 = uVar6 >> 1;
    if ((uVar6 & 1) != 0) {
      pcVar1 = (code *)swi(0x37);
      (*pcVar1)();
      in_BX = CONCAT11((byte)((uint)in_BX >> 8) | *(byte *)(puVar7 + uVar3 * 2),(char)in_BX);
      pcVar1 = (code *)swi(0x3a);
      uVar5 = (*pcVar1)();
      puVar7 = (undefined2 *)*puVar7;
    }
  }
  else {
    pcVar1 = (code *)swi(0x34);
    uVar5 = (*pcVar1)();
    if (in_CX == 1 || cVar9 != '\0') goto LAB_1000_19b8;
  }
  uVar4 = uVar5 >> 1;
  puVar8 = puVar7;
  if ((uVar5 & 1) != 0) {
    pcVar1 = (code *)swi(0x37);
    (*pcVar1)();
    pcVar1 = (code *)swi(0x3a);
    uVar4 = (*pcVar1)();
    puVar8 = (undefined2 *)*puVar7;
  }
  uVar5 = uVar4 >> 1;
  if ((uVar4 & 1) != 0) {
    pcVar1 = (code *)swi(0x37);
    uVar5 = (*pcVar1)();
  }
  uVar4 = uVar5 >> 1;
  if ((uVar5 & 1) != 0) {
    pcVar1 = (code *)swi(0x37);
    (*pcVar1)();
    *(char *)(puVar8 + uVar3 * 2) = *(char *)(puVar8 + uVar3 * 2) - (char)((uint)in_BX >> 8);
    pcVar1 = (code *)swi(0x3a);
    uVar4 = (*pcVar1)();
    puVar8 = (undefined2 *)*puVar8;
  }
  uVar5 = uVar4 >> 1;
  if ((uVar4 & 1) != 0) {
    pcVar1 = (code *)swi(0x37);
    (*pcVar1)();
    in_BX = CONCAT11((byte)((uint)in_BX >> 8) ^ *(byte *)(puVar8 + uVar3 * 2),(char)in_BX);
    pcVar1 = (code *)swi(0x3a);
    uVar5 = (*pcVar1)();
    puVar8 = (undefined2 *)*puVar8;
  }
LAB_1000_1a25:
  if ((*(byte *)((int)puVar8 + 5) & 0x80) != 0) {
    pcVar1 = (code *)swi(0x34);
    uVar5 = (*pcVar1)();
    *(char *)(in_BX + unaff_DI) = *(char *)(in_BX + unaff_DI) >> 0x1e;
  }
  return uVar5;
}

