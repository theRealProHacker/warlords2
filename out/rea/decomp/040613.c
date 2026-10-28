
void __cdecl16far thunk_FUN_705a_1299(int param_1,int param_2,int param_3)

{
  int *piVar1;
  undefined1 uVar2;
  
  FUN_705a_1128();
  *(undefined1 *)(param_1 * 0x41 + param_2 + 0x1593) =
       *(undefined1 *)((int)DAT_451b_051c + param_3 * 0x3e);
  *(undefined1 *)(param_1 * 0x41 + param_2 + 0x1597) =
       *(undefined1 *)((int)DAT_451b_051c + param_3 * 0x3e + 0x18);
  *(undefined1 *)(param_1 * 0x41 + param_2 + 0x15a3) =
       *(undefined1 *)((int)DAT_451b_051c + param_3 * 0x3e + 0x1a);
  *(undefined1 *)(param_1 * 0x41 + param_2 + 0x159b) =
       *(undefined1 *)((int)DAT_451b_051c + param_3 * 0x3e + 0x16);
  *(undefined1 *)(param_1 * 0x41 + param_2 + 0x159f) =
       *(undefined1 *)((int)DAT_451b_051c + param_3 * 0x3e + 0x1c);
  uVar2 = FUN_705a_0930(param_1);
  *(undefined1 *)(param_1 * 0x41 + 0x1591) = uVar2;
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 - *(int *)((int)DAT_451b_051c + param_3 * 0x3e + 0x1e);
  FUN_705a_11e2();
  return;
}

