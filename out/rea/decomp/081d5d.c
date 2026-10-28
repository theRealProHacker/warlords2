
void __cdecl16far FUN_8027_1aed(void)

{
  bool bVar1;
  bool bVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined1 local_58 [80];
  int local_8;
  int local_6;
  int local_4;
  
  local_4 = 0;
  thunk_FUN_824f_03f9();
  for (iVar6 = 0; iVar6 < DAT_3c04_157b; iVar6 = iVar6 + 1) {
    if (*(char *)(*(byte *)(*(int *)(iVar6 * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(iVar6 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
      local_4 = local_4 + 1;
    }
  }
  local_6 = 0;
  iVar5 = 0;
  bVar1 = true;
  bVar2 = false;
  iVar6 = 8;
  while (iVar4 = iVar6 + -1, iVar6 != 0) {
    if (*(int *)(iVar4 * 2 + 0x137) != 0) {
      bVar1 = false;
    }
    if ((*(int *)(iVar4 * 2 + 0xd0) == 0) && (*(int *)(iVar4 * 2 + 0x137) == 0)) {
      bVar2 = true;
      *(undefined2 *)(iVar4 * 2 + 0xd0) = 1;
    }
    if ((*(int *)(iVar4 * 2 + 0x137) != 0) && (*(int *)(iVar4 * 2 + 0xd0) == 0)) {
      bVar2 = true;
      iVar5 = iVar5 + 1;
      local_8 = iVar4;
    }
    iVar6 = iVar4;
    if ((*(int *)(iVar4 * 2 + 0x137) != 0) && (*(int *)(iVar4 * 2 + 0xd0) == 1)) {
      local_6 = local_6 + 1;
    }
  }
  if (bVar1) {
    uVar3 = thunk_FUN_7e8f_04f0(0x1000c);
    uVar3 = thunk_FUN_7e8f_04f0(0xc,uVar3,iVar4);
    FUN_8027_1160(uVar3,iVar4);
    uVar3 = thunk_FUN_7e8f_04f0(0x3000c);
    uVar3 = thunk_FUN_7e8f_04f0(0x2000c,uVar3,iVar4);
    FUN_8027_1160(uVar3,iVar4);
    FUN_1a4c_02b5();
  }
  if (((DAT_3c04_015b == 0) && (iVar5 == 0)) && (bVar2)) {
    uVar3 = thunk_FUN_7e8f_04f0(0x1000d);
    uVar3 = thunk_FUN_7e8f_04f0(0xd,uVar3,iVar4);
    FUN_8027_1160(uVar3,iVar4);
    uVar3 = thunk_FUN_7e8f_04f0(0x3000d);
    uVar3 = thunk_FUN_7e8f_04f0(0x2000d,uVar3,iVar4);
    FUN_8027_1160(uVar3,iVar4);
  }
  if (((DAT_3c04_015b == 0) && (iVar5 == 1)) &&
     ((local_6 == 0 && (local_4 / 2 < (int)((undefined2 *)&DAT_451b_1e8a)[local_8])))) {
    DAT_3c04_015b = 1;
    thunk_FUN_6d27_1244(local_8,7,local_8,0,0x2b01,0x4125);
  }
  if (((DAT_3c04_015b == 0) && (iVar5 == 0)) && (local_6 == 1)) {
    DAT_3c04_015b = 1;
    iVar6 = 0;
    while ((iVar6 < 8 && (*(int *)(iVar6 * 2 + 0x137) == 0))) {
      iVar6 = iVar6 + 1;
    }
    thunk_FUN_7e8f_04f0(0xf,iVar6 * 0x14,0x3c04);
    FUN_1000_4944(local_58);
    FUN_8027_10fb(local_58);
    *(undefined2 *)(iVar6 * 2 + 0xd0) = 0;
    thunk_FUN_6d27_1244(iVar6,7,iVar6,0,0x2b02,0x4125);
  }
  if ((((DAT_3c04_015b == 0) && (iVar5 == 1)) && (0 < local_6)) && (DAT_3c04_015d == 0)) {
    iVar6 = 0;
    for (iVar5 = 0; iVar5 < 8; iVar5 = iVar5 + 1) {
      if (((*(int *)(iVar5 * 2 + 0x137) != 0) && (*(int *)(iVar5 * 2 + 0xd0) == 1)) &&
         (iVar6 < (int)((undefined2 *)&DAT_451b_1e8a)[iVar5])) {
        iVar6 = ((undefined2 *)&DAT_451b_1e8a)[iVar5];
      }
    }
    if ((DAT_3c04_157b / 2 < (int)((undefined2 *)&DAT_451b_1e8a)[local_8]) &&
       (iVar6 + DAT_3c04_157b / 8 < (int)((undefined2 *)&DAT_451b_1e8a)[local_8])) {
      DAT_3c04_015d = 1;
    }
  }
  return;
}

