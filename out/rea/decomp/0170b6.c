
undefined2 __cdecl16far FUN_170b_0006(undefined2 param_1,undefined2 param_2,uint param_3)

{
  code *pcVar1;
  undefined2 uVar2;
  bool bVar3;
  
  if ((param_3 & 8) != 0) {
    bVar3 = false;
    pcVar1 = (code *)swi(0x21);
    uVar2 = (*pcVar1)();
    if (!bVar3) {
      return uVar2;
    }
  }
  bVar3 = false;
  pcVar1 = (code *)swi(0x21);
  uVar2 = (*pcVar1)();
  if (bVar3) {
    uVar2 = 0xffff;
  }
  return uVar2;
}

