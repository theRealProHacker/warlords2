
void __cdecl16far thunk_FUN_7ab1_0052(undefined2 param_1)

{
  int iVar1;
  int *piVar2;
  undefined2 in_DX;
  undefined2 *puVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  undefined4 uStack_10;
  int iStack_c;
  int iStack_a;
  undefined4 uStack_8;
  int iStack_4;
  
  iVar5 = 8;
  iStack_4 = 8;
  piVar2 = (int *)FUN_7ab1_0198(param_1);
  uStack_8 = (int *)CONCAT22(in_DX,piVar2);
  FUN_7ab1_029c(1);
  for (iVar4 = 0; uVar6 = (undefined2)((ulong)uStack_8 >> 0x10), piVar2 = (int *)uStack_8,
      iVar4 < piVar2[4]; iVar4 = iVar4 + 1) {
    iVar1 = piVar2[1];
    puVar3 = (undefined2 *)(*uStack_8 + iVar4 * 0x2e);
    uStack_10 = (undefined2 *)CONCAT22(iVar1,puVar3);
    uVar6 = ((undefined2 *)&DAT_4125_1adc)[iVar4 * 6];
    puVar3[1] = ((undefined2 *)&DAT_4125_1ade)[iVar4 * 6];
    *uStack_10 = uVar6;
    uVar6 = ((undefined2 *)&DAT_4125_1ae0)[iVar4 * 6];
    puVar3[3] = ((undefined2 *)&DAT_4125_1ae2)[iVar4 * 6];
    puVar3[2] = uVar6;
    puVar3[4] = ((undefined2 *)&DAT_4125_1ae6)[iVar4 * 6];
    puVar3[5] = ((undefined2 *)&DAT_4125_1ae4)[iVar4 * 6];
    FUN_21e2_0ab8(*(undefined4 *)(puVar3 + 2),&iStack_a);
    iStack_a = (iStack_a + 7 >> 3) * 8;
    DAT_451b_0cf0 = iStack_c;
    puVar3[0x16] = iStack_c;
    puVar3[6] = iStack_a + iStack_4;
    puVar3[7] = iVar5;
    puVar3[8] = 0;
    puVar3[9] = iStack_a + iStack_4;
    puVar3[10] = iStack_c + 2;
    puVar3[0xb] = iVar5;
    puVar3[0xc] = iStack_c + 3;
    *(undefined4 *)(puVar3 + 0xd) = 0xffff;
    puVar3[0xf] = 1;
    *(undefined4 *)(puVar3 + 0x10) = 0;
    iVar5 = iVar5 + iStack_a + iStack_4 * 2;
  }
  DAT_451b_0cf2 = iVar5;
  FUN_2372_122f(piVar2,uVar6,0x3e,0x409d);
  return;
}

