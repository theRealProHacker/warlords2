
void __cdecl16far FUN_4d6c_033a(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  
  for (iVar2 = 0; iVar2 < 0x70; iVar2 = iVar2 + 1) {
    for (iVar3 = 0; iVar3 < 0x9c; iVar3 = iVar3 + 1) {
      uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      if ((*(char *)((int)DAT_451b_002a + iVar3 * 0x70 + iVar2 + 0x6120) != '\x06') &&
         (*(char *)((int)DAT_451b_002a + iVar3 * 0x70 + iVar2 + 0x6120) != '\x05')) {
        iVar1 = thunk_FUN_4c45_11f5(iVar2,iVar3,6);
        if (iVar1 != 0) {
          *(undefined1 *)((int)DAT_451b_002a + iVar3 * 0x70 + iVar2 + 0x6120) = 5;
          thunk_FUN_4bea_03aa(iVar2,iVar3);
        }
      }
    }
  }
  return;
}

