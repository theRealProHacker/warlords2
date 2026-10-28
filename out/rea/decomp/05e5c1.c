
bool __cdecl16far FUN_5d9f_0bd1(undefined2 param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  int local_a;
  undefined1 local_4 [2];
  
  thunk_FUN_705a_1128();
  uVar3 = thunk_FUN_705a_138f(param_1,local_4);
  iVar2 = *(int *)(DAT_3c04_0110 * 0x14 + 0x185);
  if (local_a + 0x1e < iVar2) {
    uVar4 = thunk_FUN_621e_1ae9(param_2);
    thunk_FUN_705a_1299(param_2,uVar4,uVar3);
    piVar1 = (int *)((int)DAT_451b_018e + 0x16);
    *piVar1 = *piVar1 + 1;
    *(undefined1 *)(param_2 * 0x41 + 0x15aa) = 0;
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + param_2 * 0x41) = 0;
    *(undefined1 *)((int)DAT_451b_018e + param_2 + 0x56) = 5;
  }
  thunk_FUN_705a_11e2();
  return local_a + 0x1e < iVar2;
}

