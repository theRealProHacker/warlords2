
void switchD_7000:2482::caseD_0(void)

{
  byte *pbVar1;
  int in_CX;
  int *in_BX;
  int unaff_SI;
  undefined2 unaff_ES;
  
  if (in_CX != 0) {
    *(undefined2 *)(((int)in_BX + -1) * 0x1d + 0xd04) = *(undefined2 *)(unaff_SI + 2);
    *(undefined1 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xcff) = 1;
    *(undefined2 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xd00) = 0;
    pbVar1 = (byte *)(((int *)DAT_451b_1efe)[1] * 0x70 + *DAT_451b_1efe);
    *pbVar1 = *pbVar1 | 0x40;
    thunk_FUN_85d0_006c();
    FUN_7533_0b3f();
    return;
  }
  if ((*(byte *)(in_BX[1] * 0x70 + *in_BX) & 0x40) == 0) {
    thunk_FUN_7938_03d9(2,0,(int *)DAT_451b_1efe);
    if (0 < DAT_451b_08ce) {
      FUN_7533_0a96();
      return;
    }
    thunk_FUN_8027_0174();
  }
  return;
}

