
int __cdecl16far FUN_66b0_08b4(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  
  iVar2 = 0;
  thunk_FUN_7938_03d9(2,0,param_1);
  for (iVar1 = 0; iVar1 < DAT_451b_08ce; iVar1 = iVar1 + 1) {
    if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar1] * 0x1d + 0xcfd) == '\x05') {
      iVar2 = iVar2 + 1;
    }
  }
  return iVar2;
}

