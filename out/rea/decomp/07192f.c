
int __cdecl16far
FUN_705a_138f(int param_1,undefined2 *param_2,undefined2 *param_3,undefined2 *param_4,
             undefined2 *param_5,undefined2 *param_6)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_705a_1128();
  iVar1 = 0;
  do {
    if (0x1c < iVar1) {
LAB_705a_1423:
      FUN_705a_11e2();
      return iVar1;
    }
    uVar2 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    if (*(int *)((int)DAT_451b_051c + iVar1 * 0x3e) == param_1) {
      *param_5 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1e);
      *param_2 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x18);
      *param_3 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x16);
      *param_4 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1a);
      *param_6 = *(undefined2 *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1c);
      goto LAB_705a_1423;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

