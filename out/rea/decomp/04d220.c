
/* WARNING: Removing unreachable block (ram,0x0004d41a) */
/* WARNING: Removing unreachable block (ram,0x0004d3ed) */
/* WARNING: Removing unreachable block (ram,0x0004d3bf) */
/* WARNING: Removing unreachable block (ram,0x0004d35a) */
/* WARNING: Removing unreachable block (ram,0x0004d32d) */
/* WARNING: Removing unreachable block (ram,0x0004d376) */
/* WARNING: Removing unreachable block (ram,0x0004d2ff) */

void __cdecl16far FUN_4c45_0dd0(int param_1,int param_2,int param_3,int param_4,undefined4 param_5)

{
  code *pcVar1;
  undefined1 uVar2;
  uint uVar3;
  undefined1 *unaff_DI;
  undefined2 unaff_ES;
  undefined2 uVar4;
  undefined2 uVar5;
  
  if (param_3 == param_1) {
    if (param_2 != param_4) {
      if (param_2 <= param_4) {
        if (param_4 <= param_2) {
          uRam0004df52 = 0x9a;
          return;
        }
        goto LAB_4c45_0f40;
      }
      goto LAB_4c45_0fe6;
    }
LAB_4c45_0de6:
    uVar5 = 0;
  }
  else {
    if (param_4 == param_2) {
      if (param_1 != param_3) {
        if (param_3 < param_1) {
          uRam0004df52 = 0x9a;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
          uVar5 = 0;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
          uVar4 = 0xffff;
        }
        else {
          if (param_3 <= param_1) {
            uRam0004df52 = 0x9a;
            return;
          }
          uVar5 = 0;
          uRam0004df52 = 0x9a;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
          uVar4 = 1;
        }
        goto LAB_4c45_0dea;
      }
      goto LAB_4c45_0de6;
    }
    pcVar1 = (code *)swi(0x3b);
    uVar3 = (*pcVar1)();
    pcVar1 = (code *)swi(0x3b);
    (*pcVar1)();
    pcVar1 = (code *)swi(0x39);
    (*pcVar1)();
    pcVar1 = (code *)swi(0x3d);
    (*pcVar1)();
    if (param_3 < param_1) {
      pcVar1 = (code *)swi(0x39);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x3d);
      (*pcVar1)();
      if ((uVar3 & 0x100) != 0) {
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        (*pcVar1)();
        uVar4 = 0x4125;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        if ((uVar3 & 0x100) != 0) {
          pcVar1 = (code *)swi(0x39);
          (*pcVar1)();
          pcVar1 = (code *)swi(0x38);
          (*pcVar1)(uVar4);
          FUN_899d_16c2();
        }
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        (*pcVar1)();
        FUN_899d_16c2();
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uRam0004df52 = (*pcVar1)();
        uVar4 = 0x4125;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uRam0004df52 = (*pcVar1)(uVar4);
        uVar4 = 0x4125;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uVar2 = (*pcVar1)(uVar4);
        uVar4 = 0x4125;
        *unaff_DI = uVar2;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uVar2 = (*pcVar1)(uVar4);
        unaff_DI[1] = uVar2;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        goto LAB_4c45_0f40;
      }
LAB_4c45_0fe6:
      uVar5 = 0xffff;
    }
    else {
      pcVar1 = (code *)swi(0x39);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x38);
      (*pcVar1)();
      pcVar1 = (code *)swi(0x3d);
      (*pcVar1)();
      if ((uVar3 & 0x100) != 0) {
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        (*pcVar1)();
        uVar4 = 0x4125;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        if ((uVar3 & 0x100) != 0) {
          pcVar1 = (code *)swi(0x39);
          (*pcVar1)();
          pcVar1 = (code *)swi(0x38);
          (*pcVar1)(uVar4);
          FUN_899d_16c2();
        }
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        (*pcVar1)();
        FUN_899d_16c2();
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uRam0004df52 = (*pcVar1)();
        uVar4 = 0x4125;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uRam0004df52 = (*pcVar1)(uVar4);
        uVar4 = 0x4125;
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uVar2 = (*pcVar1)(uVar4);
        uVar4 = 0x4125;
        *unaff_DI = uVar2;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
        pcVar1 = (code *)swi(0x39);
        (*pcVar1)();
        pcVar1 = (code *)swi(0x38);
        uVar2 = (*pcVar1)(uVar4);
        unaff_DI[1] = uVar2;
        pcVar1 = (code *)swi(0x3d);
        (*pcVar1)();
        goto LAB_4c45_0fe6;
      }
LAB_4c45_0f40:
      uVar5 = 1;
    }
  }
  uVar4 = 0;
LAB_4c45_0dea:
  FUN_216d_000e(param_5,uVar4,uVar5);
                    /* WARNING: Read-only address (ram,0x0004df52) is written */
  return;
}

