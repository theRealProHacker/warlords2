
/* WARNING: Control flow encountered bad instruction data */

void FUN_2012_1199(void)

{
  code *pcVar1;
  undefined1 uVar2;
  
  pcVar1 = (code *)swi(0x3b);
  uVar2 = (*pcVar1)();
  out(0xcd,uVar2);
  pcVar1 = (code *)swi(0x3d);
  (*pcVar1)();
  pcVar1 = (code *)swi(0x3b);
  uVar2 = (*pcVar1)();
  out(0xcd,uVar2);
  pcVar1 = (code *)swi(0x39);
  (*pcVar1)();
  pcVar1 = (code *)swi(0x38);
  (*pcVar1)();
  pcVar1 = (code *)swi(0x39);
  (*pcVar1)();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

