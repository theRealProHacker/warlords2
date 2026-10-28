
undefined2 __cdecl16far switchD_7000:e223::caseD_0(void)

{
  undefined2 uVar1;
  int in_BX;
  int unaff_BP;
  int unaff_SI;
  int unaff_DI;
  undefined2 unaff_SS;
  
  if (*(char *)(in_BX + 0x1592) == DAT_3c04_0110) {
    if (((undefined1 *)&DAT_451b_0664)[*(int *)(unaff_BP + 6) * 6] == '\0') {
      if (*(int *)(*(char *)(*(byte *)(unaff_DI * 0xe0 + unaff_SI * 2) + 0x710) * 2 + 0x1274) < 1) {
        uVar1 = 0;
      }
      else {
        uVar1 = 1;
      }
    }
    else {
      uVar1 = 1;
    }
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}

