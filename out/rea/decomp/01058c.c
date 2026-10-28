
undefined2 __cdecl16far
FUN_1000_058c(undefined2 param_1,undefined2 param_2,uint param_3,int param_4)

{
  code *pcVar1;
  uint uVar2;
  uint uVar3;
  bool bVar4;
  
  while( true ) {
    bVar4 = false;
    uVar3 = 0x8000;
    if ((param_4 == 0) && (bVar4 = 0x8000 < param_3, param_3 < 0x8000)) {
      uVar3 = param_3;
    }
    pcVar1 = (code *)swi(0x21);
    uVar2 = (*pcVar1)();
    if ((bVar4) || (uVar3 != uVar2)) break;
    bVar4 = param_3 < uVar3;
    param_3 = param_3 - uVar3;
    param_4 = param_4 - (uint)bVar4;
    if ((param_3 == 0) && (param_4 == 0)) {
      return 1;
    }
  }
  return 0;
}

