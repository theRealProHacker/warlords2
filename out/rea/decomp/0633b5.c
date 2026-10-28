
void __cdecl16far FUN_621e_11d5(int param_1)

{
  byte *pbVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  bool bVar6;
  int local_a;
  undefined1 local_4 [2];
  
  uVar2 = FUN_621e_1ae9(param_1);
  thunk_FUN_705a_1128();
  iVar5 = 0;
  do {
    if (0x1c < iVar5) {
LAB_621e_12c0:
      thunk_FUN_705a_11e2();
      return;
    }
    if ((((undefined1 *)&DAT_451b_0664)[iVar5 * 6] != '\0') &&
       (((undefined1 *)&DAT_451b_0668)[iVar5 * 6] == '\0')) {
      iVar4 = 4;
      do {
        bVar6 = iVar4 != 0;
        iVar4 = iVar4 + -1;
      } while (bVar6);
      uVar3 = thunk_FUN_705a_138f(iVar5,local_4);
      local_a = local_a + 0x1e;
      if (local_a <= *(int *)(DAT_3c04_0110 * 0x14 + 0x185)) {
        thunk_FUN_705a_1299(param_1,uVar2,uVar3);
        pbVar1 = (byte *)((int)DAT_451b_018e + param_1 + 0x11e);
        *pbVar1 = *pbVar1 | 2;
        *(undefined1 *)(param_1 * 0x41 + 0x15aa) = 0;
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + param_1 * 0x41) = 0;
        goto LAB_621e_12c0;
      }
    }
    iVar5 = iVar5 + 1;
  } while( true );
}

