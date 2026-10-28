
void __cdecl16far FUN_66b0_091e(void)

{
  bool bVar1;
  int iVar2;
  int in_CX;
  int iVar3;
  
  iVar2 = DAT_3c04_080f * 3;
  for (iVar3 = 0; iVar3 < DAT_3c04_080f; iVar3 = iVar3 + 1) {
    *(undefined2 *)(iVar3 * 0x1f + 0x82c) = 0;
    *(undefined2 *)(iVar3 * 0x1f + 0x82e) = 0xff;
  }
  for (iVar3 = 0; iVar3 < iVar2 / 10; iVar3 = iVar3 + 1) {
    bVar1 = false;
    while (!bVar1) {
      in_CX = thunk_FUN_7e8f_02bf(1,DAT_3c04_080f,0xffff);
      if ((*(char *)(in_CX * 0x1f + 0x829) != '\x01') && (*(int *)(in_CX * 0x1f + 0x82c) == 0)) {
        bVar1 = true;
      }
    }
    *(undefined2 *)(in_CX * 0x1f + 0x82c) = 1;
    if (DAT_3c04_011e != 0) {
      *(undefined2 *)(in_CX * 0x1f + 0x82e) = 0;
    }
  }
  return;
}

