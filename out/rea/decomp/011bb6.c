
undefined2 __cdecl16far FUN_1000_1bb6(void)

{
  code *pcVar1;
  undefined2 extraout_DX;
  
  pcVar1 = (code *)swi(0x1a);
  (*pcVar1)();
  return extraout_DX;
}

