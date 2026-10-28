
void FUN_40e8_009f(int *param_1,int param_2)

{
  int iVar1;
  byte in_AL;
  byte bVar2;
  char cVar3;
  int *piVar4;
  undefined2 uVar5;
  int in_BX;
  int unaff_SI;
  int iVar6;
  int iVar7;
  undefined2 unaff_SS;
  byte in_AF;
  undefined1 auStack_20 [8];
  undefined4 uStack_18;
  undefined4 uStack_14;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  
  bVar2 = in_AL + (9 < (in_AL & 0xf) | in_AF) * -6 & 0xf;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + bVar2;
  cVar3 = bVar2 + (char)*(undefined2 *)(in_BX + unaff_SI) + 'v';
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  *(char *)(in_BX + unaff_SI) = *(char *)(in_BX + unaff_SI) + cVar3;
  piVar4 = (int *)param_1;
  uVar5 = param_1._2_2_;
  if (param_1 == (int *)0x0) {
    piVar4 = (int *)0x2a88;
    uVar5 = 0x4125;
  }
  FUN_1000_1d02(piVar4,uVar5,&iStack_10,unaff_SS);
  iStack_10 = iStack_10 + -3;
  iStack_c = iStack_c + 4;
  iStack_e = iStack_e + -3;
  iStack_a = iStack_a + 4;
  if (param_1 == (int *)0x0) {
    FUN_1000_1d02(0x2a88,0x4125,&uStack_18,unaff_SS);
    FUN_216d_002e(auStack_20);
  }
  else {
    FUN_1000_1d02(param_1,auStack_20,unaff_SS);
    uStack_18 = CONCAT22(((int *)param_1)[1] << 1,*param_1 << 1);
    uStack_14 = CONCAT22(((int *)param_1)[3] << 1,((int *)param_1)[2] << 1);
  }
  FUN_1997_034a();
  if (DAT_3c04_0124 == 0) {
    (*DAT_451b_2a74)();
  }
  else {
    FUN_24d0_0497();
    (*DAT_451b_2a68)(0x24d0,0x581d,0x4125,uStack_18,uStack_14,0x6795,0x4125,uStack_18,0x54e3,0x4125,
                     uStack_18);
  }
  for (iStack_6 = 0; iStack_6 < DAT_3c04_080f; iStack_6 = iStack_6 + 1) {
    iVar6 = *(int *)(iStack_6 * 0x1f + 0x811);
    iVar1 = *(int *)(iStack_6 * 0x1f + 0x813);
    if (((((iStack_10 <= iVar6) && (iVar6 < iStack_10 + iStack_c)) && (iStack_e <= iVar1)) &&
        ((iVar1 < iStack_e + iStack_a &&
         ((DAT_3c04_0124 == 0 || ((*(byte *)(iVar1 * 0x70 + iVar6) & 0x20) != 0)))))) &&
       ((*(uint *)(iStack_6 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) != 0)) {
      if (*(char *)(iStack_6 * 0x1f + 0x829) == '\x01') {
        iStack_8 = 2;
      }
      else if ((*(byte *)(iVar1 * 0xe0 + iVar6 * 2 + 1) & 0x40) == 0) {
        if (*(int *)(iStack_6 * 0x1f + 0x82c) == 0) {
          iStack_8 = 0;
        }
        else {
          iStack_8 = 3;
        }
      }
      else {
        iStack_8 = 1;
      }
      iVar7 = iVar1 * 2 + -1;
      iVar6 = (iVar6 * 2 + 3 >> 3) * 8;
      FUN_1997_034a();
      FUN_1997_060a();
      (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iStack_8 * 8 + 0xf28),
                       *(undefined2 *)(iStack_8 * 8 + 0xf2a),*(undefined2 *)(iStack_8 * 8 + 0xf2c),
                       *(undefined2 *)(iStack_8 * 8 + 0xf2e),0x6795,0x4125,iVar6,iVar7,0x576c,0x4125
                       ,*(undefined2 *)(iStack_8 * 8 + 0xf28),*(undefined2 *)(iStack_8 * 8 + 0xf2a))
      ;
      if (iStack_6 == param_2) {
        FUN_2012_0bb7(0x6795,0x4125,iVar6,iVar7,0xf000c);
        FUN_2012_0bb7(0x6795,0x4125,iVar6,iVar1 * 2 + 8,0xf000c);
        FUN_2012_0f08(0x6795,0x4125,iVar6,iVar7,0xf000a);
        FUN_2012_0f08();
      }
      FUN_1997_06bb();
    }
  }
  return;
}

