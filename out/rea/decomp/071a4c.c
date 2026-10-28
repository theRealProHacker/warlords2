
void FUN_705a_14ac(undefined2 param_1,int param_2,undefined4 param_3)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_705a_1128();
  iVar1 = 0;
  do {
    if (0x1c < iVar1) {
LAB_705a_14ee:
      FUN_705a_11e2();
      return;
    }
    uVar2 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    if (*(int *)((int)DAT_451b_051c + iVar1 * 0x3e) == param_2) {
      FUN_1000_1d02((int)DAT_451b_051c + iVar1 * 0x3e,uVar2,param_3);
      goto LAB_705a_14ee;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

