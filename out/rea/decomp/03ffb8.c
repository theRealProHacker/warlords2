
int __cdecl16far thunk_FUN_621e_103d(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  
  iStack_6 = 0;
  iStack_8 = -1;
  iVar4 = 4;
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    iVar1 = (int)*(char *)(param_1 * 0x41 + iVar5 + 0x1593);
    iVar4 = iVar5;
    if (-1 < iVar1) {
      iVar2 = (int)*(char *)(param_1 * 0x41 + iVar5 + 0x1597);
      if (*(int *)(DAT_3c04_0110 * 2 + 0xf0) == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = 2;
      }
      if (*(char *)(param_1 * 0x41 + iVar5 + 0x159b) + iVar3 < 10) {
        if (*(int *)(DAT_3c04_0110 * 2 + 0xf0) == 0) {
          iStack_a = 0;
        }
        else {
          iStack_a = 2;
        }
        iStack_a = *(char *)(param_1 * 0x41 + iVar5 + 0x159b) + iStack_a;
      }
      else {
        iStack_a = 9;
      }
      if (((undefined1 *)&DAT_451b_0669)[iVar1 * 6] == '\x01') {
        iStack_a = iStack_a + 2;
      }
      if ((param_2 != 6) && (iStack_a < 3)) {
        iVar2 = iVar2 + 1;
      }
      if (10 < iVar2) {
        iVar2 = 10;
      }
      if (((((undefined1 *)&DAT_451b_0664)[iVar1 * 6] != '\0') || (param_2 != 4)) &&
         (iVar5 = (10 - iVar2) * *(int *)(param_2 * 2 + 0xa10) +
                  iStack_a * *(int *)(param_2 * 2 + 0xa1e) +
                  ((int)*(char *)(param_1 * 0x41 + iVar5 + 0x159f) * *(int *)(param_2 * 2 + 0xa2c))
                  / 2, iStack_6 < iVar5)) {
        iStack_8 = iVar1;
        iStack_6 = iVar5;
      }
    }
  }
  if (param_4 == 0) {
    if (iStack_8 == -1) {
      iStack_8 = 0;
    }
    else {
      if (param_3 == -1) {
        uVar6 = 0;
      }
      else {
        uVar6 = CONCAT22(param_3,1);
      }
      FUN_621e_0e5a(param_1,iStack_8,uVar6);
      iStack_8 = 1;
    }
  }
  return iStack_8;
}

