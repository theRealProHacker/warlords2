
void __cdecl16far FUN_8027_1732(void)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  if (DAT_3c04_0122 == 0) {
    for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
      *(int *)(iVar4 * 2 + 0x163) = iVar4;
    }
  }
  else {
    for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
      *(int *)(iVar4 * 2 + 0x163) = iVar4;
    }
    for (iVar4 = 0; iVar4 < 0x14; iVar4 = iVar4 + 1) {
      iVar2 = thunk_FUN_7e8f_02bf(1,0xffff0008);
      iVar3 = thunk_FUN_7e8f_02bf(1,0xffff0008);
      uVar1 = *(undefined2 *)(iVar3 * 2 + 0x163);
      *(undefined2 *)(iVar3 * 2 + 0x163) = *(undefined2 *)(iVar2 * 2 + 0x163);
      *(undefined2 *)(iVar2 * 2 + 0x163) = uVar1;
    }
  }
  DAT_3c04_0173 = 0;
  return;
}

