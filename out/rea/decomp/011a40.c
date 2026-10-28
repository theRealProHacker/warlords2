
undefined2 __cdecl16far FUN_1000_1a40(int *param_1)

{
  code *pcVar1;
  undefined1 uVar2;
  undefined2 extraout_DX;
  int *piVar3;
  longdouble in_ST0;
  
  piVar3 = (int *)param_1;
  if (*param_1 == 4) {
    pcVar1 = (code *)swi(0x35);
    uVar2 = (*pcVar1)();
    out(extraout_DX,uVar2);
    pcVar1 = (code *)swi(0x3c);
    (*pcVar1)();
    *(double *)(piVar3 + 0xb) = (double)in_ST0;
    pcVar1 = (code *)swi(0x3d);
    (*pcVar1)();
  }
  else if (*param_1 != 5) {
    return 0;
  }
  return 1;
}

