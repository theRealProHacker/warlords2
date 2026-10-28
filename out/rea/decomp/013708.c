
undefined1 __cdecl16far FUN_1000_3708(void)

{
  code *pcVar1;
  undefined1 uVar2;
  
  if (DAT_4125_3ebe == '\0') {
    pcVar1 = (code *)swi(0x21);
    uVar2 = (*pcVar1)();
  }
  else {
    DAT_4125_3ebe = '\0';
    uVar2 = DAT_4125_3ebf;
  }
  return uVar2;
}

