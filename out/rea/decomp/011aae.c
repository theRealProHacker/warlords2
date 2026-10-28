
/* WARNING: Control flow encountered bad instruction data */

void FUN_1000_1aae(undefined2 param_1,undefined2 param_2,undefined2 param_3,undefined2 param_4,
                  int param_5,int param_6,int param_7,int param_8)

{
  code *pcVar1;
  undefined1 uVar2;
  undefined2 extraout_DX;
  undefined2 extraout_DX_00;
  
  if (param_5 == 0 && param_6 == 0) {
    pcVar1 = (code *)swi(0x35);
    uVar2 = (*pcVar1)();
    out(extraout_DX,uVar2);
  }
  else {
    pcVar1 = (code *)swi(0x3c);
    (*pcVar1)(param_2,param_3,param_4);
  }
  pcVar1 = (code *)swi(0x39);
  (*pcVar1)();
  thunk_FUN_1555_0369();
  if (param_7 == 0 && param_8 == 0) {
    pcVar1 = (code *)swi(0x35);
    uVar2 = (*pcVar1)();
    out(extraout_DX_00,uVar2);
  }
  else {
    pcVar1 = (code *)swi(0x3c);
    (*pcVar1)();
  }
  pcVar1 = (code *)swi(0x39);
  (*pcVar1)();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

