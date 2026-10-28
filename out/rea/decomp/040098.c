
void __cdecl16far thunk_FUN_63da_0941(int param_1)

{
  undefined1 uVar1;
  int iVar2;
  undefined1 auStack_42 [30];
  uint uStack_24;
  int iStack_4;
  
  DAT_451b_01b8 = 0;
  DAT_451b_01b4 = 0;
  DAT_451b_01b6 = 1;
  iStack_4 = thunk_FUN_705a_094f(param_1);
  if (1 < iStack_4) {
    for (iVar2 = 1; iVar2 < iStack_4; iVar2 = iVar2 + 1) {
      thunk_FUN_705a_14ac(0x4058,(int)*(char *)(param_1 * 0x41 + iVar2 + 0x1593),auStack_42);
      ((undefined2 *)&DAT_451b_01ba)[DAT_451b_01b8] =
           (int)*(char *)(param_1 * 0x41 + iVar2 + 0x1593);
      ((undefined2 *)&DAT_451b_01ae)[DAT_451b_01b8] =
           (int)((uStack_24 ^ (int)uStack_24 >> 0xf) - ((int)uStack_24 >> 0xf)) / 2;
      DAT_451b_01b4 = DAT_451b_01b4 + ((undefined2 *)&DAT_451b_01ae)[DAT_451b_01b8];
      DAT_451b_01b8 = DAT_451b_01b8 + 1;
      *(undefined1 *)(param_1 * 0x41 + iVar2 + 0x1593) = 0xff;
    }
    uVar1 = thunk_FUN_705a_0930(param_1);
    *(undefined1 *)(param_1 * 0x41 + 0x1591) = uVar1;
  }
  return;
}

