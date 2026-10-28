
void __cdecl16far thunk_FUN_76e4_0000(void)

{
  int iVar1;
  undefined2 uVar2;
  undefined1 auStack_40 [48];
  undefined1 uStack_10;
  undefined1 uStack_c;
  undefined1 uStack_a;
  undefined1 uStack_8;
  undefined1 uStack_6;
  undefined1 uStack_4;
  
  uVar2 = 0x76e4;
  for (iVar1 = 0; iVar1 < 0x1d; iVar1 = iVar1 + 1) {
    thunk_FUN_705a_14ac(uVar2,iVar1,auStack_40);
    ((undefined1 *)&DAT_451b_0664)[iVar1 * 6] = uStack_a;
    ((undefined1 *)&DAT_451b_0665)[iVar1 * 6] = uStack_8;
    ((undefined1 *)&DAT_451b_0666)[iVar1 * 6] = uStack_6;
    ((undefined1 *)&DAT_451b_0667)[iVar1 * 6] = uStack_4;
    ((undefined1 *)&DAT_451b_0669)[iVar1 * 6] = uStack_c;
    ((undefined1 *)&DAT_451b_0668)[iVar1 * 6] = uStack_10;
    uVar2 = 0x4058;
  }
  return;
}

