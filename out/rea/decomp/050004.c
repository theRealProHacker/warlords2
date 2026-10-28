
/* WARNING: Control flow encountered bad instruction data */

void __cdecl16far FUN_4fe5_01b4(void)

{
  byte *pbVar1;
  undefined2 uVar2;
  int in_CX;
  int in_BX;
  byte *pbVar3;
  int unaff_SI;
  int iVar4;
  
  uVar2 = *(undefined2 *)(in_BX + 0x724);
  pbVar3 = (byte *)(unaff_SI * 0xe0 + in_CX * 2);
  *pbVar3 = 0;
  pbVar1 = pbVar3;
  *pbVar1 = *pbVar1 | (byte)uVar2;
  if (in_CX + 1 < 0x70) {
    FUN_5efd_0eeb();
    return;
  }
  if (unaff_SI + 1 < 0x9c) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
    uVar2 = *(undefined2 *)((int)DAT_451b_002a + 0x728);
    pbVar3 = (byte *)(*(int *)(iVar4 * 0x1f + 0x813) * 0xe0 + *(int *)(iVar4 * 0x1f + 0x811) * 2);
    *pbVar3 = 0;
    pbVar1 = pbVar3;
    *pbVar1 = *pbVar1 | (byte)uVar2;
  }
  return;
}

