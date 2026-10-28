
undefined4 FUN_4058_0089(undefined2 param_1,int param_2)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_705a_1128();
  iVar1 = 0;
  do {
    if (0x1c < iVar1) {
code_r0x00071ad9:
      FUN_705a_11e2();
      return 0x41254468;
    }
    uVar2 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    if (*(int *)((int)DAT_451b_051c + iVar1 * 0x3e) == param_2) {
      FUN_1000_4a70(0x4468,0x4125,(int)DAT_451b_051c + iVar1 * 0x3e + 2,uVar2);
      goto code_r0x00071ad9;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

