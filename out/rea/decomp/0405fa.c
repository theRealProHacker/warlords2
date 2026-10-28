
void __cdecl16far
thunk_FUN_705a_142c(int param_1,undefined2 *param_2,undefined2 *param_3,undefined2 *param_4,
                   undefined2 *param_5)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_705a_1128();
  iVar1 = 0;
  do {
    if (0x1c < iVar1) {
LAB_705a_14a6:
      FUN_705a_11e2();
      return;
    }
    uVar2 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    if (*(int *)((int)DAT_451b_051c + iVar1 * 0x3e) == param_1) {
      *param_2 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x18);
      *param_3 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x16);
      *param_4 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1a);
      *param_5 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1c);
      goto LAB_705a_14a6;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

