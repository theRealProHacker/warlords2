
void __cdecl16far thunk_FUN_63da_0886(int param_1)

{
  undefined1 uVar1;
  int iVar2;
  undefined1 auStack_40 [30];
  uint uStack_22;
  
  DAT_451b_01b8 = 0;
  DAT_451b_01b4 = 0;
  iVar2 = thunk_FUN_705a_094f(param_1);
  if (0 < iVar2) {
    DAT_451b_01b6 = iVar2 + -1;
    thunk_FUN_705a_14ac(0x4058,(int)*(char *)(param_1 * 0x41 + iVar2 + 0x1592),auStack_40);
    ((undefined2 *)&DAT_451b_01ba)[DAT_451b_01b8] = (int)*(char *)(param_1 * 0x41 + iVar2 + 0x1592);
    ((undefined2 *)&DAT_451b_01ae)[DAT_451b_01b8] =
         (int)((uStack_22 ^ (int)uStack_22 >> 0xf) - ((int)uStack_22 >> 0xf)) / 2;
    DAT_451b_01b4 = DAT_451b_01b4 + ((undefined2 *)&DAT_451b_01ae)[DAT_451b_01b8];
    DAT_451b_01b8 = DAT_451b_01b8 + 1;
    *(undefined1 *)(param_1 * 0x41 + iVar2 + 0x1592) = 0xff;
    uVar1 = thunk_FUN_705a_0930(param_1);
    *(undefined1 *)(param_1 * 0x41 + 0x1591) = uVar1;
  }
  return;
}

