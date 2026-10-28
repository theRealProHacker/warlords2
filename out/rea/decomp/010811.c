
undefined2 __cdecl16far FUN_1000_0811(undefined2 param_1,int param_2)

{
  code *pcVar1;
  
  if (param_2 >> 4 == 0) {
    pcVar1 = (code *)swi(0x21);
    (*pcVar1)();
  }
  return 0;
}

