
void __cdecl16far thunk_FUN_621e_0c7e(int *param_1,int param_2,int param_3)

{
  int *piVar1;
  undefined2 uVar2;
  int iStack_6;
  int iStack_4;
  
  iStack_4 = -1;
  iStack_6 = -1;
  if (param_2 != 4) {
    piVar1 = (int *)param_1;
    uVar2 = (undefined2)((ulong)param_1 >> 0x10);
    if (param_2 == 1) {
      iStack_4 = *(int *)(param_3 * 0x41 + 0x157d);
      iStack_6 = *(int *)(param_3 * 0x41 + 0x157f);
      if (*(char *)(param_3 * 0x41 + 0x1592) == DAT_3c04_0110) {
        iStack_4 = iStack_4 + 1;
        iStack_6 = iStack_6 + 1;
      }
      else {
        FUN_621e_0d88(*param_1,piVar1[1],&iStack_4);
      }
    }
    else if (param_2 == 2) {
      iStack_4 = *(int *)(param_3 * 0x1d + 0xd02);
      iStack_6 = *(int *)(param_3 * 0x1d + 0xd04);
    }
    else if (param_2 == 3) {
      iStack_4 = *(int *)(param_3 * 0x1f + 0x811);
      iStack_6 = *(int *)(param_3 * 0x1f + 0x813);
    }
    if (iStack_4 == -1) {
      iStack_4 = *param_1;
    }
    piVar1[9] = iStack_4;
    if (iStack_6 == -1) {
      iStack_6 = piVar1[1];
    }
    piVar1[10] = iStack_6;
  }
  return;
}

