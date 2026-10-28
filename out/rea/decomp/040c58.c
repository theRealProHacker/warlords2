
void __cdecl16far thunk_FUN_7e8f_0000(int param_1)

{
  int iVar1;
  long lStack_a;
  long lStack_6;
  
  iVar1 = FUN_7e8f_0a7c();
  if (iVar1 == 0) {
    FUN_1000_1bcf(0,&lStack_6);
    lStack_a = lStack_6;
    do {
      if (lStack_6 + param_1 <= lStack_a) {
        return;
      }
      iVar1 = FUN_7e8f_0a7c();
      if (iVar1 != 0) {
        return;
      }
      iVar1 = FUN_1000_1bcf(0,&lStack_a);
    } while (iVar1 == 0);
  }
  return;
}

