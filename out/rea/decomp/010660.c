
int __cdecl16far FUN_1000_0660(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  code *pcVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  undefined4 uVar6;
  
  bVar5 = false;
  pcVar1 = (code *)swi(0x21);
  (*pcVar1)();
  if (!bVar5) {
    bVar5 = false;
    pcVar1 = (code *)swi(0x21);
    uVar6 = (*pcVar1)();
    iVar4 = (int)((ulong)uVar6 >> 0x10);
    if (!bVar5) {
      if ((undefined2 *)param_3 != (undefined2 *)0x0) {
        *param_3 = (int)uVar6;
        ((undefined2 *)param_3)[1] = iVar4;
      }
      iVar2 = FUN_255e_07c1(uVar6);
      if ((iVar2 != 0) || (iVar4 != 0)) {
        pcVar1 = (code *)swi(0x21);
        (*pcVar1)();
        iVar4 = -0x8000;
        do {
          pcVar1 = (code *)swi(0x21);
          iVar3 = (*pcVar1)();
        } while (iVar3 == iVar4);
        pcVar1 = (code *)swi(0x21);
        (*pcVar1)();
        return iVar2;
      }
    }
    pcVar1 = (code *)swi(0x21);
    (*pcVar1)();
  }
  return 0;
}

