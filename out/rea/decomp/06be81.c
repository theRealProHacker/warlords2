
void __cdecl16far FUN_6bb0_0381(int param_1)

{
  byte *pbVar1;
  int iVar2;
  undefined2 in_DX;
  
  iVar2 = thunk_FUN_6f60_0dd7(param_1,*(undefined2 *)(param_1 * 0x41 + 0x157d),
                              *(undefined2 *)(param_1 * 0x41 + 0x157f),0xffff);
  *(undefined1 *)(iVar2 + 7) = 0;
  *(undefined1 *)(param_1 * 0x41 + 0x15a9) = 0xff;
  *(undefined1 *)(param_1 * 0x41 + 0x15aa) = 0;
  pbVar1 = (byte *)(*(int *)(param_1 * 0x41 + 0x157f) * 0xe0 + *(int *)(param_1 * 0x41 + 0x157d) * 2
                   + 1);
  *pbVar1 = *pbVar1 | 0x10;
  return;
}

