
void FUN_7533_0a96(void)

{
  byte *pbVar1;
  int in_CX;
  int *piVar2;
  
  if (((undefined2 *)&DAT_451b_0c9c)[in_CX] != DAT_3c04_0110) {
    FUN_7533_0b35();
    return;
  }
  piVar2 = (int *)DAT_451b_1efe;
  *(int *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xd02) = *DAT_451b_1efe;
  *(int *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xd04) = piVar2[1];
  *(undefined1 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xcff) = 1;
  *(undefined2 *)(((undefined2 *)&DAT_451b_0c9c)[in_CX] * 0x1d + 0xd00) = 0;
  pbVar1 = (byte *)(((int *)DAT_451b_1efe)[1] * 0x70 + *DAT_451b_1efe);
  *pbVar1 = *pbVar1 | 0x40;
  thunk_FUN_85d0_006c();
  FUN_7533_0b3f();
  return;
}

