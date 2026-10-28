
undefined2 __cdecl16far FUN_1000_478f(int param_1,int param_2)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  
  if (param_1 == 0 && param_2 == 0) {
    uVar1 = 0;
  }
  else {
    iVar2 = FUN_1000_4a99(param_1,param_2);
    iVar3 = FUN_1000_458c(0x3b80,0x4125,iVar2,param_1,param_2);
    if (iVar3 == iVar2) {
      iVar2 = FUN_1000_43e3(10,0x3b80,0x4125);
      if (iVar2 == 10) {
        uVar1 = 10;
      }
      else {
        uVar1 = 0xffff;
      }
    }
    else {
      uVar1 = 0xffff;
    }
  }
  return uVar1;
}

