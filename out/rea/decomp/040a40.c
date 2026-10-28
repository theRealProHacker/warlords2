
/* WARNING: Restarted to delay deadcode elimination for space: stack */

void __cdecl16far thunk_FUN_7ae8_0000(int param_1)

{
  code *pcVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  char *pcVar6;
  undefined2 auStack_8c [6];
  undefined2 uStack_80;
  undefined2 uStack_7e;
  undefined2 auStack_6c [16];
  undefined2 auStack_4c [16];
  char acStack_2c [40];
  undefined2 uStack_4;
  
  uVar5 = 0x7ae8;
  if (param_1 == 0) {
    pcVar6 = (char *)s_standard_pal_4125_1f14;
  }
  else if (param_1 == 1) {
    uVar5 = 0x1000;
    FUN_1000_4944(acStack_2c);
    pcVar6 = acStack_2c;
  }
  else {
    if (param_1 != 2) goto LAB_7ae8_007f;
    pcVar6 = (char *)s_black_pal_4125_1f21;
  }
  FUN_7ae8_0229(pcVar6);
LAB_7ae8_007f:
  for (iVar3 = 0x10; iVar4 = iVar3 + -1, iVar3 != 0; iVar3 = iVar3 + 2) {
    if (iVar4 == 6) {
      uStack_4 = uStack_80;
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      auStack_8c[2] = 0xaf2d;
      auStack_8c[3] = uVar5;
      auStack_8c[3] = FUN_1000_1b57();
      uStack_4 = auStack_6c[iVar3];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uStack_7e = 0x1000;
      uStack_80 = 0xaf50;
      uStack_7e = FUN_1000_1b57();
      uStack_4 = auStack_4c[iVar3 + 1];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uVar2 = FUN_1000_1b57();
      iVar4 = iVar3 + 0x10;
    }
    else if (iVar4 < 8) {
      uStack_4 = auStack_8c[iVar4];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      auStack_8c[2] = 0xb016;
      auStack_8c[3] = uVar5;
      auStack_8c[3] = FUN_1000_1b57();
      uStack_4 = auStack_6c[iVar3];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uStack_7e = 0x1000;
      uStack_80 = 0xb039;
      uStack_7e = FUN_1000_1b57();
      uStack_4 = auStack_4c[iVar3 + 1];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      iVar4 = iVar3 + 2;
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uVar2 = FUN_1000_1b57();
    }
    else {
      uStack_4 = auStack_8c[iVar4];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      auStack_8c[2] = 0xafa5;
      auStack_8c[3] = uVar5;
      auStack_8c[3] = FUN_1000_1b57();
      uStack_4 = auStack_6c[iVar3];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uStack_7e = 0x1000;
      uStack_80 = 45000;
      uStack_7e = FUN_1000_1b57();
      uStack_4 = auStack_4c[iVar3 + 1];
      pcVar1 = (code *)swi(0x3b);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      uVar2 = FUN_1000_1b57();
      iVar4 = iVar3 + 0x32;
    }
    uVar5 = 0x1000;
    FUN_7ae8_01f3(iVar4,uVar2);
  }
  return;
}

