
void __cdecl16far FUN_1b62_0405(void)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  int iVar6;
  int local_8;
  int local_6;
  undefined2 local_4;
  
  bVar1 = false;
  DAT_4125_1178 = 0;
  DAT_4125_2bdc = DAT_4125_2be0;
  iVar2 = thunk_FUN_7e8f_0a7c();
  if (iVar2 == 0) {
    FUN_1000_1bcf();
  }
  FUN_22bf_0af4(&local_8);
  iVar2 = DAT_3c04_0177 + (local_8 + -0x10) / 0x28;
  uVar5 = 0x3c04;
  iVar6 = DAT_3c04_0175 + (local_6 + -0x1e) / 0x28;
  if (DAT_451b_1f02 != (int *)0x0) {
    if ((*DAT_451b_1f02 == iVar2) && (((int *)DAT_451b_1f02)[1] == iVar6)) goto LAB_1b62_048d;
  }
  bVar1 = true;
LAB_1b62_048d:
  if (((bVar1) || (iVar3 = FUN_18a9_01cd(DAT_4125_2bdc,DAT_4125_2be0), iVar3 == 0)) ||
     (DAT_4125_1172 != 0)) {
    FUN_1b62_007d(iVar2,iVar6,&local_4);
    FUN_1b62_09ec(local_4,0);
    DAT_451b_1f02 = DAT_451b_1ebe;
    thunk_FUN_8bc3_06eb(DAT_451b_1ebe);
    thunk_FUN_899d_0356();
    thunk_FUN_8027_0174();
    if (DAT_3c04_012e != 0) {
      if ((DAT_3c04_0134 & 8) == 0) {
        DAT_3c04_0134 = DAT_3c04_0134 | 8;
        uVar4 = thunk_FUN_7e8f_0505(0x30019);
        thunk_FUN_8027_168d(uVar4,uVar5);
      }
      if ((DAT_3c04_0134 & 0x10) == 0) {
        for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
          iVar6 = thunk_FUN_824f_044a(*DAT_451b_1f02 +
                                      *(int *)((int)(undefined2 *)&DAT_4125_2b4b + iVar2 * 2 + 1),
                                      ((int *)DAT_451b_1f02)[1] +
                                      ((undefined2 *)&DAT_4125_2b5c)[iVar2]);
          if ((-1 < iVar6) && (uVar5 = 0x3c04, *(char *)(iVar6 * 0x41 + 0x1592) != DAT_3c04_0110)) {
            DAT_3c04_0134 = DAT_3c04_0134 | 0x10;
            uVar4 = thunk_FUN_7e8f_0505(0x40019);
            thunk_FUN_8027_168d(uVar4,uVar5);
            break;
          }
        }
      }
      if ((DAT_3c04_0134 & 0x80) == 0) {
        uVar4 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        if ((*(char *)(*(byte *)(((int *)DAT_451b_1f02)[1] * 0xe0 + *DAT_451b_1f02 * 2) + 0x710) ==
             '\v') && ((char)((int *)DAT_451b_1f02)[2] == '\x1c')) {
          DAT_3c04_0134 = DAT_3c04_0134 | 0x80;
          uVar4 = thunk_FUN_7e8f_0505(0x50019);
          thunk_FUN_8027_168d(uVar4,uVar5);
        }
      }
    }
  }
  else {
    thunk_FUN_899d_0a55();
  }
  DAT_4125_1172 = 1;
  return;
}

