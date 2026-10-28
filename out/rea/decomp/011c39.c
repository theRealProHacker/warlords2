
void __cdecl16far FUN_1000_1c39(undefined1 *param_1)

{
  code *pcVar1;
  undefined1 uVar2;
  undefined2 in_CX;
  undefined1 extraout_DL;
  undefined1 extraout_DH;
  undefined1 *puVar3;
  undefined2 uVar4;
  
  pcVar1 = (code *)swi(0x21);
  uVar2 = (*pcVar1)();
  uVar4 = (undefined2)((ulong)param_1 >> 0x10);
  puVar3 = (undefined1 *)param_1;
  puVar3[4] = uVar2;
  *param_1 = extraout_DL;
  puVar3[1] = extraout_DH;
  *(undefined2 *)(puVar3 + 2) = in_CX;
  return;
}

