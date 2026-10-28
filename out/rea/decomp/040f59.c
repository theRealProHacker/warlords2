
void __cdecl16far thunk_FUN_830b_05e4(int *param_1,int param_2)

{
  int iVar1;
  int *piVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  undefined2 unaff_SS;
  undefined1 auStack_1e [8];
  undefined4 uStack_16;
  undefined4 uStack_12;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  piVar2 = (int *)param_1;
  uVar3 = param_1._2_2_;
  if (param_1 == (int *)0x0) {
    piVar2 = (int *)0x2a88;
    uVar3 = 0x4125;
  }
  FUN_1000_1d02(piVar2,uVar3,&iStack_e,unaff_SS);
  iStack_e = iStack_e + -3;
  iStack_a = iStack_a + 4;
  iStack_c = iStack_c + -3;
  iStack_8 = iStack_8 + 4;
  if (param_1 == (int *)0x0) {
    FUN_1000_1d02(0x2a88,0x4125,&uStack_16,unaff_SS);
    FUN_216d_002e(auStack_1e);
  }
  else {
    FUN_1000_1d02(param_1,auStack_1e,unaff_SS);
    uStack_16 = CONCAT22(((int *)param_1)[1] << 1,*param_1 << 1);
    uStack_12 = CONCAT22(((int *)param_1)[3] << 1,((int *)param_1)[2] << 1);
  }
  FUN_1997_034a();
  if (DAT_3c04_0124 == 0) {
    (*DAT_451b_2a74)();
  }
  else {
    FUN_24d0_0497();
    (*DAT_451b_2a68)(0x24d0,0x581d,0x4125,uStack_16,uStack_12,0x6795,0x4125,uStack_16,0x54e3,0x4125,
                     uStack_16);
  }
  for (iStack_4 = 0; iStack_4 < DAT_3c04_080f; iStack_4 = iStack_4 + 1) {
    iVar4 = *(int *)(iStack_4 * 0x1f + 0x811);
    iVar1 = *(int *)(iStack_4 * 0x1f + 0x813);
    if (((((iStack_e <= iVar4) && (iVar4 < iStack_e + iStack_a)) && (iStack_c <= iVar1)) &&
        ((iVar1 < iStack_c + iStack_8 &&
         ((DAT_3c04_0124 == 0 || ((*(byte *)(iVar1 * 0x70 + iVar4) & 0x20) != 0)))))) &&
       ((*(uint *)(iStack_4 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) != 0)) {
      if (*(char *)(iStack_4 * 0x1f + 0x829) == '\x01') {
        iStack_6 = 2;
      }
      else if ((*(byte *)(iVar1 * 0xe0 + iVar4 * 2 + 1) & 0x40) == 0) {
        if (*(int *)(iStack_4 * 0x1f + 0x82c) == 0) {
          iStack_6 = 0;
        }
        else {
          iStack_6 = 3;
        }
      }
      else {
        iStack_6 = 1;
      }
      iVar5 = iVar1 * 2 + -1;
      iVar4 = (iVar4 * 2 + 3 >> 3) * 8;
      FUN_1997_034a();
      FUN_1997_060a();
      (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iStack_6 * 8 + 0xf28),
                       *(undefined2 *)(iStack_6 * 8 + 0xf2a),*(undefined2 *)(iStack_6 * 8 + 0xf2c),
                       *(undefined2 *)(iStack_6 * 8 + 0xf2e),0x6795,0x4125,iVar4,iVar5,0x576c,0x4125
                       ,*(undefined2 *)(iStack_6 * 8 + 0xf28),*(undefined2 *)(iStack_6 * 8 + 0xf2a))
      ;
      if (iStack_4 == param_2) {
        FUN_2012_0bb7(0x6795,0x4125,iVar4,iVar5,0xf000c);
        FUN_2012_0bb7(0x6795,0x4125,iVar4,iVar1 * 2 + 8,0xf000c);
        FUN_2012_0f08(0x6795,0x4125,iVar4,iVar5,0xf000a);
        FUN_2012_0f08();
      }
      FUN_1997_06bb();
    }
  }
  return;
}

