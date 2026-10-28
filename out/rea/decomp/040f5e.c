
void __cdecl16far thunk_FUN_830b_08df(int *param_1,int param_2,int param_3)

{
  bool bVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 unaff_SS;
  uint uStack_30;
  int iStack_2e;
  int aiStack_2c [4];
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined1 auStack_1c [8];
  int iStack_14;
  int iStack_12;
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  bVar1 = false;
  if (param_1 == (int *)0x0) {
    FUN_1000_1d02(0x2a88,0x4125,&uStack_24,unaff_SS);
    FUN_216d_002e(auStack_1c);
  }
  else {
    FUN_1000_1d02(param_1,auStack_1c,unaff_SS);
    uVar5 = (undefined2)((ulong)param_1 >> 0x10);
    piVar3 = (int *)param_1;
    uStack_24 = CONCAT22(piVar3[1] << 1,*param_1 << 1);
    uStack_20 = CONCAT22(piVar3[3] << 1,piVar3[2] << 1);
  }
  FUN_1997_034a();
  FUN_1997_060a();
  if (DAT_3c04_0124 == 0) {
    (*DAT_451b_2a74)();
  }
  else {
    FUN_24d0_0497();
    (*DAT_451b_2a68)(0x24d0,0x581d,0x4125,uStack_24,uStack_20,0x6795,0x4125,uStack_24,0x54e3,0x4125,
                     uStack_24);
  }
  FUN_1997_06bb();
  iStack_4 = 0;
  do {
    if (DAT_3c04_157b <= iStack_4) {
      if (-1 < param_2) {
        if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + param_2 * 0x41) != 0) &&
           (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + param_2 * 0x41) == -2)) {
          bVar1 = true;
          iVar2 = thunk_FUN_7533_0b47();
          if (iVar2 != 0) {
            iStack_a = iStack_12 << 1;
            iStack_e = iStack_14 << 1;
            FUN_830b_1f5f();
            FUN_24d0_0002();
            FUN_2133_00b8(0x6795,0x4125,iStack_8,iStack_c,iStack_a,iStack_e,0);
          }
        }
        if ((*(int *)((int)(undefined2 *)&DAT_4125_15ae + param_2 * 0x41) != 0) &&
           (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + param_2 * 0x41) != -2)) {
          iVar2 = thunk_FUN_824f_044a(*(undefined2 *)
                                       ((int)(undefined2 *)&DAT_4125_15b0 + param_2 * 0x41),
                                      *(undefined2 *)(param_2 * 0x41 + 0x15b2));
          iVar4 = *(int *)(iVar2 * 0x41 + 0x157d) * 2;
          iStack_e = *(int *)(iVar2 * 0x41 + 0x157f) * 2;
          iStack_6 = iStack_e + -1;
          iStack_a = iVar4 + 2;
          iStack_e = iStack_e + 2;
          if (*(char *)(iVar2 * 0x41 + 0x15aa) < '\x01') {
            iVar2 = 5;
          }
          else {
            iVar2 = 1;
          }
          uStack_30 = iVar4 - 2U & 7;
          if (uStack_30 == 7) {
            uStack_30 = 6;
          }
          FUN_1997_034a();
          (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,*(undefined2 *)(iVar2 * 8 + 0x2c76),
                           *(int *)(iVar2 * 8 + 0x2c78) + uStack_30 * *(int *)(iVar2 * 8 + 0x2c7c),
                           *(undefined2 *)(iVar2 * 8 + 0x2c7a),*(undefined2 *)(iVar2 * 8 + 0x2c7c));
          FUN_24d0_0002();
          FUN_2133_00b8(0x6795,0x4125,iStack_8,iStack_c,iStack_a,iStack_e,0);
        }
        thunk_FUN_705a_0410();
        for (iStack_4 = 0; iStack_4 < iStack_2e; iStack_4 = iStack_4 + 1) {
          iVar2 = *(int *)(aiStack_2c[iStack_4] * 0x41 + 0x157d) * 2;
          iStack_e = *(int *)(aiStack_2c[iStack_4] * 0x41 + 0x157f) * 2;
          iStack_6 = iStack_e + -1;
          iStack_a = iVar2 + 2;
          iStack_e = iStack_e + 2;
          uStack_30 = iVar2 - 2U & 7;
          if (uStack_30 == 7) {
            uStack_30 = 6;
          }
          FUN_1997_034a();
          (*DAT_451b_2a68)(0x1997,0x57a7,0x4125,DAT_4125_2c86,
                           DAT_4125_2c88 + uStack_30 * DAT_4125_2c8c,DAT_4125_2c8a,DAT_4125_2c8c);
          FUN_24d0_0002();
          FUN_2133_00b8(0x6795,0x4125,iStack_8,iStack_c,iStack_a,iStack_e,0);
        }
      }
      iStack_10 = thunk_FUN_7533_0b47();
      if ((iStack_10 != 0) && (!bVar1)) {
        FUN_830b_1f5f();
      }
      return;
    }
    if (*(char *)(iStack_4 * 0x41 + 0x1592) == DAT_3c04_0110) {
      if (param_3 == -1) {
        thunk_FUN_705a_0410();
        iVar2 = iStack_2e + 1;
joined_r0x00083af6:
        if ((4 < iVar2) && (iStack_4 != param_2)) goto LAB_830b_0b5d;
      }
      else if (-1 < param_3) {
        thunk_FUN_705a_0410();
        iVar2 = iStack_2e + param_3;
        goto joined_r0x00083af6;
      }
      iVar2 = *(int *)(iStack_4 * 0x41 + 0x157f) * 2;
      iStack_6 = iVar2 + -1;
      if ((-1 < param_2) && (param_2 == iStack_4)) {
        iStack_8 = *(int *)(iStack_4 * 0x41 + 0x157d) * 2 + 2;
        iStack_c = iVar2 + 2;
      }
      FUN_1997_034a();
      (*DAT_451b_2a68)(0x1997,0x57a7,0x4125);
    }
LAB_830b_0b5d:
    iStack_4 = iStack_4 + 1;
  } while( true );
}

