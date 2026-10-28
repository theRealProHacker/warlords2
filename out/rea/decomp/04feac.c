
/* WARNING: Instruction at (ram,0x000400b8) overlaps instruction at (ram,0x000400b7)
    */
/* WARNING: Unable to track spacebase fully for stack */

uint FUN_4fe5_005c(void)

{
  byte *pbVar1;
  int *piVar2;
  uint uVar3;
  code *pcVar4;
  byte bVar5;
  byte bVar6;
  char in_AL;
  int iVar7;
  uint uVar8;
  undefined2 uVar9;
  char cVar12;
  int iVar10;
  int iVar11;
  byte bVar13;
  char cVar14;
  undefined2 in_CX;
  byte bVar15;
  undefined2 in_DX;
  int iVar16;
  byte *pbVar17;
  char *in_BX;
  uint *unaff_DI;
  undefined2 unaff_ES;
  undefined2 unaff_SS;
  byte in_AF;
  undefined4 uVar18;
  int in_stack_00000000;
  undefined2 auStack_18 [3];
  undefined4 uStack_12;
  undefined4 uStack_e;
  undefined2 auStack_a [2];
  
  cVar12 = (char)((uint)in_CX >> 8);
  bVar15 = (char)in_DX + cVar12;
  *in_BX = *in_BX + in_AL;
  iVar7 = ((uint)&stack0xfffe & 3) - (bVar15 & 3);
  pbVar17 = (byte *)(CONCAT11((char)((uint)in_BX >> 8),(char)in_BX + bVar15) +
                    CONCAT11((char)((uint)in_DX >> 8),bVar15) + (uint)(0 < iVar7) * iVar7);
  (&stack0xfffe)[(int)unaff_DI] = (&stack0xfffe)[(int)unaff_DI] + '\x01';
  uVar8 = *unaff_DI;
  pbVar1 = pbVar17;
  *pbVar1 = *pbVar1 << 1 | (char)*pbVar1 < '\0';
  bVar5 = (char)uVar8 * -0x26 ^ 8;
  LOCK();
  bVar15 = pbVar17[(int)unaff_DI];
  pbVar17[(int)unaff_DI] = (byte)in_CX;
  UNLOCK();
  iVar10 = CONCAT11(cVar12,bVar15) + 1;
  *(byte *)unaff_DI = (byte)*unaff_DI | bVar5;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar5;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar5;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar5;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar5;
  pcVar4 = (code *)swi(0x3f);
  uVar18 = (*pcVar4)();
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + (char)uVar18;
  iVar7 = (int)uVar18 + 1;
  iVar11 = iVar10 + -1;
  if (iVar11 == 0 || iVar7 != 0) {
    (pbVar17 + (int)unaff_DI)[3] = (pbVar17 + (int)unaff_DI)[3] + (char)iVar11;
    *(byte *)unaff_DI = (byte)*unaff_DI + (char)in_stack_00000000;
    pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + (char)in_stack_00000000;
    iVar7 = in_stack_00000000;
  }
  else {
    iVar11 = iVar10 + -2;
    pbVar17 = pbVar17 + *(int *)(pbVar17 + (int)unaff_DI);
  }
  bVar15 = (byte)iVar7;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  cVar12 = (char)((uint)iVar11 >> 8);
  pbVar1 = pbVar17 + (int)unaff_DI;
  *pbVar1 = *pbVar1 + bVar15;
  if ((POPCOUNT(*pbVar1) & 1U) == 0) {
    auStack_a[1] = 1;
    auStack_a[0] = 0x647b;
    uStack_e._2_2_ = 0x481e;
    iVar7 = thunk_FUN_7e8f_02bf();
    piVar2 = (int *)(DAT_3c04_0110 * 2 + 0x10e3);
    *piVar2 = *piVar2 + iVar7 + 0x19;
    auStack_a[1] = DAT_451b_01c2;
    auStack_a[0] = 0x40c1;
    uStack_e._2_2_ = 0x4849;
    FUN_647b_00fe();
    thunk_FUN_824f_03f9();
    thunk_FUN_824f_02bf();
    thunk_FUN_824f_0372();
    if (DAT_451b_01c4 == 0) {
      auStack_a[1] = 0;
      auStack_a[0] = 0x40e8;
      uStack_e._2_2_ = 0x487e;
      uVar8 = thunk_FUN_71d6_0000();
    }
    else {
      auStack_a[1] = 0x40e8;
      auStack_a[0] = 0x486a;
      uVar8 = thunk_FUN_8027_0000();
    }
    return uVar8;
  }
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar15;
  bVar5 = (byte)iVar11;
  bVar13 = cVar12 + bVar5;
  in_AF = 9 < (bVar15 & 0xf) | in_AF;
  bVar15 = bVar15 + in_AF * -6;
  bVar6 = bVar15 & 0xf;
  pbVar17[(int)unaff_DI] = pbVar17[(int)unaff_DI] + bVar6;
  iVar10 = CONCAT11((char)((uint)pbVar17 >> 8),(byte)pbVar17 >> 1);
  cVar14 = bVar13 + bVar5;
  *(uint *)(&stack0x1500 + (int)unaff_DI) =
       (*(int *)(&stack0x1500 + (int)unaff_DI) - CONCAT11(cVar14,bVar5)) -
       (uint)CARRY1(bVar13,bVar5);
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  *(byte *)(iVar10 + (int)unaff_DI) = *(byte *)(iVar10 + (int)unaff_DI) + bVar6;
  pbVar1 = (byte *)(iVar10 + (int)unaff_DI);
  bVar5 = *pbVar1;
  *pbVar1 = *pbVar1 + bVar6;
  uVar3 = (uint)CARRY1(bVar5,bVar6);
  uVar8 = unaff_DI[-0xb];
  *unaff_DI = CONCAT11((char)((uint)iVar7 >> 8) - in_AF,bVar15) & 0xff0f;
  *(int *)(&stack0xfffe + (int)(unaff_DI + 1)) =
       *(int *)(&stack0xfffe + (int)(unaff_DI + 1)) +
       CONCAT11((char)((ulong)uVar18 >> 0x18),(char)((ulong)uVar18 >> 0x10) + cVar12 + cVar14);
  *(undefined1 **)(&stack0xfffe + uVar3 + uVar8) = &stack0xfffe;
  *(undefined2 *)((int)auStack_a + uVar3 + uVar8 + 2) = unaff_DI;
  *(undefined2 *)((int)auStack_a + uVar3 + uVar8) = unaff_DI + 1;
  *(undefined4 *)((int)auStack_18 + uVar3 + uVar8 + 10) = DAT_451b_1efe;
  *(undefined4 *)((int)auStack_18 + uVar3 + uVar8 + 6) = 0;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8 + 4) = 2;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8 + 2) = 0x6513;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8) = 0x58f4;
  thunk_FUN_7938_03d9();
  iVar10 = 0;
  for (iVar7 = 0; iVar7 < DAT_451b_08ce; iVar7 = iVar7 + 1) {
    if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar7] * 0x1d + 0xcfd) == '\x01') {
      iVar10 = iVar10 + *(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar7] * 0x1d + 0xcfe);
    }
  }
  iVar11 = 0;
  iVar7 = DAT_3c04_0181;
  while (iVar16 = iVar7 + -1, iVar7 != 0) {
    iVar7 = iVar16;
    if ((*(int *)(iVar16 * 0x16 + -0x7780) == *DAT_451b_1efe) &&
       (*(int *)(iVar16 * 0x16 + -0x777e) == ((int *)DAT_451b_1efe)[1])) {
      iVar11 = iVar11 + 1;
    }
  }
  *(undefined4 *)((int)auStack_18 + uVar3 + uVar8 + 10) = 100;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8 + 8) = 1;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8 + 6) = 0x4090;
  *(undefined2 *)((int)auStack_18 + uVar3 + uVar8 + 4) = 0x5985;
  uVar9 = thunk_FUN_7e8f_02bf();
  *(undefined2 *)(&stack0xfffa + uVar3 + uVar8) = uVar9;
  uVar18 = *(undefined4 *)(&stack0x0004 + uVar3 + uVar8);
  *(int *)((int)auStack_a + uVar3 + uVar8 + -2) = (char)((int *)DAT_451b_1efe)[4] + iVar10;
  *(int *)(&stack0xfffc + uVar3 + uVar8) =
       iVar11 * 3 +
       (*(int *)((int)auStack_a + uVar3 + uVar8 + -2) -
       *(int *)((char *)s_Rename_City_4125_1003 + 4 + *(char *)((int)uVar18 + 0x1a) * 2)) * 5 + 0x5a
  ;
  return (uint)(*(int *)(&stack0xfffc + uVar3 + uVar8) < *(int *)(&stack0xfffa + uVar3 + uVar8));
}

