
void __cdecl16far thunk_FUN_6f60_06bd(void)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  
  FUN_6f60_076d();
  for (iVar2 = 0; uVar3 = (undefined2)((ulong)DAT_451b_0504 >> 0x10), iVar1 = (int)DAT_451b_0504,
      iVar2 < *(char *)(iVar1 + 800); iVar2 = iVar2 + 1) {
    if (*(char *)(iVar1 + iVar2) != '\0') {
      iVar1 = thunk_FUN_705a_0000((int)*(char *)(iVar1 + iVar2 + 200),
                                  (int)*(char *)(*(char *)(iVar1 + iVar2 + 200) * 0x41 + 0x15a9));
      uVar3 = (undefined2)((ulong)DAT_451b_0504 >> 0x10);
      *(undefined1 *)(*(char *)((int)DAT_451b_0504 + iVar2 + 200) * 0x41 + 0x15aa) =
           *(undefined1 *)(*(char *)((int)DAT_451b_0504 + iVar2 + 200) * 0x41 + iVar1 + 0x1597);
    }
  }
  FUN_6f60_07d3();
  thunk_FUN_824f_0000();
  thunk_FUN_85d0_006c();
  return;
}

