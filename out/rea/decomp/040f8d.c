
void FUN_40f2_006d(void)

{
  byte *pbVar1;
  undefined1 uVar2;
  byte bVar3;
  bool bVar4;
  byte bVar5;
  char cVar6;
  undefined2 in_AX;
  undefined2 uVar7;
  int iVar8;
  undefined2 uVar9;
  char in_CL;
  char in_CH;
  char cVar10;
  undefined2 in_DX;
  int *in_BX;
  char *unaff_SI;
  undefined1 *unaff_DI;
  undefined2 unaff_ES;
  byte in_AF;
  int iVar11;
  
  bVar5 = (byte)in_AX;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  bVar3 = 9 < (bVar5 & 0xf) | in_AF;
  *(char *)((int)in_BX + (int)unaff_SI) =
       *(char *)((int)in_BX + (int)unaff_SI) + (bVar5 + bVar3 * -6 & 0xf);
  *unaff_SI = *unaff_SI + ((char)((uint)in_AX >> 8) - bVar3);
  uVar7 = in(in_DX);
  bVar5 = (byte)uVar7 ^ 0xfc;
  *in_BX = (int)(&stack0x0000 + *in_BX);
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + bVar5;
  cVar10 = (byte)in_DX + in_CH + in_CL;
  iVar11 = CONCAT11((char)((uint)in_DX >> 8),cVar10);
  bVar4 = 0x99 < bVar5 || CARRY1((byte)in_DX,in_CH + in_CL);
  iVar8 = (CONCAT11((char)((uint)uVar7 >> 8),
                    bVar5 + (9 < (bVar5 & 0xf) | bVar3) * '\x06' + bVar4 * '`') - iVar11) -
          (uint)bVar4;
  *(uint *)((int)in_BX + (int)unaff_DI) = *(uint *)((int)in_BX + (int)unaff_DI) ^ (uint)in_BX;
  pbVar1 = unaff_DI + 0x53ea;
  *pbVar1 = *pbVar1 << 1 | (char)*pbVar1 < '\0';
  cVar6 = (char)iVar8 + cVar10;
  *(char *)((int)in_BX + (int)unaff_SI) = *(char *)((int)in_BX + (int)unaff_SI) + cVar6;
  pbVar1 = unaff_DI + 0x42ea;
  *pbVar1 = *pbVar1 << 1 | (char)*pbVar1 < '\0';
  uVar2 = in(iVar11);
  *unaff_DI = uVar2;
                    /* WARNING: Read-only address (ram,0x00049820) is written */
  iRam00049820 = 1 - CONCAT11((char)((uint)iVar8 >> 8),cVar6 + cVar10 * '\x02');
  uVar9 = DAT_3c04_017f;
  uVar7 = DAT_3c04_017d;
  if (DAT_451b_1f02 != (undefined2 *)0x0) {
    uVar9 = ((undefined2 *)DAT_451b_1f02)[1];
    uVar7 = *DAT_451b_1f02;
  }
  FUN_85d0_0629(uVar7,uVar9,uVar9);
  return;
}

