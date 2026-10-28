
void __cdecl16far FUN_705a_0dae(void)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 local_4;
  
  FUN_705a_1128();
  FUN_18a9_066e(0x1018c);
  if (*(char *)(DAT_4125_0e98 * 0x41 + 0x1596) < '\0') {
    for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
      FUN_18a9_066e(iVar1 + 0x18d,2);
    }
  }
  else {
    for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
      FUN_18a9_066e(iVar1 + 0x18d,1);
    }
  }
  iVar1 = 0;
  local_4 = 0;
  do {
    if (0x1b < iVar1) {
      FUN_705a_11e2();
      return;
    }
    uVar3 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    if (-1 < *(int *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1e)) {
      for (iVar2 = 0; iVar2 < 4; iVar2 = iVar2 + 1) {
        if ((int)*(char *)(DAT_4125_0e98 * 0x41 + iVar2 + 0x1593) ==
            *(int *)((int)DAT_451b_051c + iVar1 * 0x3e)) {
          FUN_18a9_066e(local_4 + 0x191,2);
          break;
        }
      }
      if (3 < iVar2) {
        if (*(int *)(DAT_3c04_0110 * 0x14 + 0x185) <
            *(int *)((int)DAT_451b_051c + iVar1 * 0x3e + 0x1e)) {
          uVar3 = 2;
        }
        else {
          uVar3 = 1;
        }
        FUN_18a9_066e(local_4 + 0x191,uVar3);
      }
      local_4 = local_4 + 1;
    }
    iVar1 = iVar1 + 1;
  } while( true );
}

