
/* WARNING: Instruction at (ram,0x0004c6d6) overlaps instruction at (ram,0x0004c6d5)
    */

void __cdecl16far FUN_4c45_0206(void)

{
  undefined4 uVar1;
  code *pcVar2;
  undefined1 uVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  undefined2 extraout_DX_01;
  undefined2 extraout_DX_02;
  undefined2 uVar8;
  char cVar9;
  char cVar10;
  int in_stack_0000000e;
  int in_stack_00000018;
  undefined2 uVar11;
  
  uVar11 = 0x38;
  for (iVar6 = 0; iVar6 < 4; iVar6 = iVar6 + 1) {
    iVar7 = (iVar6 + 1) % 4;
    uVar8 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    pcVar2 = (code *)swi(0x3b);
    uVar3 = (*pcVar2)();
    out(extraout_DX,uVar3);
    pcVar2 = (code *)swi(0x3b);
    uVar3 = (*pcVar2)(uVar11);
    out(extraout_DX_00,uVar3);
    pcVar2 = (code *)swi(0x3a);
    (*pcVar2)();
    pcVar2 = (code *)swi(0x35);
    (*pcVar2)();
    pcVar2 = (code *)swi(0x3d);
    iVar4 = (*pcVar2)();
    iVar4 = (int)DAT_451b_002a + iVar4;
    pcVar2 = (code *)swi(0x3b);
    uVar3 = (*pcVar2)();
    out(extraout_DX_01,uVar3);
    uVar5 = 0x4e - *(int *)(iVar4 + 0x246);
    pcVar2 = (code *)swi(0x3b);
    uVar3 = (*pcVar2)();
    out(extraout_DX_02,uVar3);
    pcVar2 = (code *)swi(0x3a);
    (*pcVar2)();
    do {
      pcVar2 = (code *)swi(0x35);
      (*pcVar2)();
      pcVar2 = (code *)swi(0x35);
      (*pcVar2)();
      cVar10 = SCARRY2(in_stack_0000000e,1);
      cVar9 = in_stack_0000000e + 1 < 0;
      uVar3 = in_stack_0000000e == -1;
      pcVar2 = (code *)swi(0x34);
      (*pcVar2)();
      pcVar2 = (code *)swi(0x39);
      (*pcVar2)();
    } while ((bool)uVar3 || cVar10 != cVar9);
    pcVar2 = (code *)swi(0x3d);
    (*pcVar2)();
    if ((uVar5 & 0x100) == 0 && (uVar5 & 0x4000) == 0) {
      uVar1 = *(undefined4 *)((int)DAT_451b_002a + in_stack_00000018 * 4 + 0x254);
      *(undefined4 *)((int)DAT_451b_002a + in_stack_00000018 * 4 + 0x254) =
           *(undefined4 *)((int)DAT_451b_002a + iVar7 * 4 + 0x244);
      *(undefined4 *)((int)DAT_451b_002a + iVar7 * 4 + 0x244) = uVar1;
    }
  }
  return;
}

