
void __cdecl16far FUN_1000_1b57(void)

{
  code *pcVar1;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  undefined1 *unaff_SI;
  int unaff_DI;
  undefined2 unaff_SS;
  bool bVar2;
  char cVar3;
  char cVar4;
  char acStack_9bc [2480];
  undefined1 local_c [9];
  byte local_3;
  
  cVar4 = SBORROW2((int)&stack0xfffe,10);
  cVar3 = (int)local_c < 0;
  bVar2 = &stack0x0000 == (char *)s_Borland_C_____Copyright_1991_Bor_4125_0004 + 8;
  pcVar1 = (code *)swi(0x35);
  (*pcVar1)();
  do {
  } while (bVar2 || cVar4 != cVar3);
  pcVar1 = (code *)swi(0x3d);
  (*pcVar1)();
  local_3 = local_3 | 0xc;
  pcVar1 = (code *)swi(0x35);
  local_3 = (*pcVar1)();
  out(*unaff_SI,extraout_DX);
  pcVar1 = (code *)swi(0x35);
  (*pcVar1)();
  out(unaff_SI[1],extraout_DX_00);
  acStack_9bc[unaff_DI] = acStack_9bc[unaff_DI] + -1;
  return;
}

