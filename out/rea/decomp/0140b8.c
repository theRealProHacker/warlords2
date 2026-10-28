
int switchD_1000:8b0c::caseD_0(void)

{
  int *piVar1;
  char *pcVar2;
  int in_CX;
  int iVar3;
  int unaff_BP;
  int unaff_SI;
  undefined2 uVar4;
  undefined2 unaff_SS;
  
  piVar1 = (int *)*(undefined4 *)(unaff_BP + 4);
  uVar4 = (undefined2)((ulong)piVar1 >> 0x10);
  iVar3 = ((int *)piVar1)[6];
  *(int *)(unaff_BP + -2) = ((int *)piVar1)[7];
  *(int *)(unaff_BP + -4) = iVar3;
  if (*piVar1 < 0) {
    while (iVar3 = in_CX + -1, in_CX != 0) {
      *(int *)(unaff_BP + -4) = *(int *)(unaff_BP + -4) + -1;
      in_CX = iVar3;
      if (*(char *)*(undefined4 *)(unaff_BP + -4) == '\n') {
        unaff_SI = unaff_SI + 1;
      }
    }
  }
  else {
    while (iVar3 = in_CX + -1, in_CX != 0) {
      pcVar2 = (char *)*(undefined4 *)(unaff_BP + -4);
      *(int *)(unaff_BP + -4) = *(int *)(unaff_BP + -4) + 1;
      in_CX = iVar3;
      if (*pcVar2 == '\n') {
        unaff_SI = unaff_SI + 1;
      }
    }
  }
  return unaff_SI;
}

