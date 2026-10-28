
void __cdecl16far thunk_FUN_6a0f_0094(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  int iStack_6;
  int iStack_4;
  
  iStack_4 = 0;
  iStack_6 = 0;
  iVar2 = 1;
  for (iVar3 = 0; iVar3 < DAT_451b_0254; iVar3 = iVar3 + 1) {
    iVar1 = FUN_1000_38dc();
    if (iVar1 != 0) {
      iVar1 = FUN_1000_3708();
      if (iVar1 == 0) {
        iVar1 = FUN_1000_3708();
      }
      if (iVar1 == 0x20) {
        iVar2 = 0;
      }
    }
    if (((undefined1 *)&DAT_451b_0255)[iVar3] == '\x01') {
      if (iVar2 != 0) {
        thunk_FUN_7d9f_0181(0);
      }
      FUN_6a0f_0000(*(undefined2 *)(iStack_4 * 2 + 0x43f8),*(undefined2 *)(iStack_4 * 2 + 0x43a8),
                    iVar2);
      iStack_4 = iStack_4 + 1;
    }
    else {
      if (iVar2 != 0) {
        thunk_FUN_7d9f_0181(1);
      }
      FUN_6a0f_0000(((undefined2 *)&DAT_451b_0458)[iStack_6],
                    ((undefined2 *)&DAT_451b_0408)[iStack_6],iVar2);
      iStack_6 = iStack_6 + 1;
    }
    if (iVar2 == 0) {
      uVar4 = 3;
    }
    else {
      thunk_FUN_7e8f_0000(3);
      uVar4 = 5;
    }
    thunk_FUN_7e8f_0000(uVar4);
  }
  thunk_FUN_7e8f_01f1();
  return;
}

