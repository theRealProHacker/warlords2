
void __cdecl16far FUN_1000_0a43(int param_1,int param_2,int param_3,undefined1 param_4)

{
  int iVar1;
  undefined1 *puVar2;
  
  iVar1 = param_2 * 0xa0 + param_1 * 2;
  do {
    puVar2 = (undefined1 *)(iVar1 + 1);
    iVar1 = iVar1 + 2;
    *puVar2 = param_4;
    param_3 = param_3 + -1;
  } while (param_3 != 0);
  return;
}

