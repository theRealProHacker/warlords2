
undefined2 __cdecl16far FUN_6f60_0d4f(int param_1,int param_2,int param_3)

{
  int iVar1;
  undefined2 uVar2;
  
  iVar1 = thunk_FUN_824f_044a(param_2,param_3);
  if ((iVar1 < 0) || (*(char *)(iVar1 * 0x41 + 0x1592) == DAT_3c04_0110)) {
    if (((undefined1 *)&DAT_451b_0664)[param_1 * 6] == '\0') {
      if (*(int *)(*(char *)(*(byte *)(param_3 * 0xe0 + param_2 * 2) + 0x710) * 2 + 0x1274) < 1) {
        uVar2 = 0;
      }
      else {
        uVar2 = 1;
      }
    }
    else {
      uVar2 = 1;
    }
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}

