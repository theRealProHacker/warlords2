
void __cdecl16far FUN_6513_186e(void)

{
  undefined2 *puVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  undefined2 local_4;
  
  iVar2 = DAT_3c04_0181;
  do {
    iVar3 = iVar2 + -1;
    if (iVar2 == 0) break;
    in_DX = 0x2e1d;
    iVar2 = iVar3;
  } while ((DAT_451b_1efe._2_2_ != 0x2e1d) ||
          ((undefined2 *)(iVar3 * 0x16 + -0x7780) != (undefined2 *)DAT_451b_1efe));
  thunk_FUN_7938_03d9(3,*DAT_451b_1efe,((undefined2 *)DAT_451b_1efe)[1],0);
  for (iVar2 = 0; iVar2 < DAT_451b_08ce; iVar2 = iVar2 + 1) {
    *(int *)(((undefined2 *)&DAT_451b_0c9c)[iVar2] * 0x1d + 0xd00) = iVar3;
    *(undefined1 *)(((undefined2 *)&DAT_451b_0c9c)[iVar2] * 0x1d + 0xcff) = 3;
  }
  thunk_FUN_54e4_069c();
  puVar1 = (undefined2 *)FUN_1b62_007d(*DAT_451b_1efe,((undefined2 *)DAT_451b_1efe)[1],&local_4);
  DAT_451b_1f02 = (undefined2 *)CONCAT22(in_DX,puVar1);
  if (DAT_451b_1efe != (undefined2 *)0x0) {
    DAT_451b_1f02 = DAT_451b_1efe;
  }
  FUN_1b62_09ec(local_4,0);
  thunk_FUN_8bc3_06eb(DAT_451b_1f02);
  thunk_FUN_8027_011f();
  thunk_FUN_4974_1ded(3,0,0);
  return;
}

