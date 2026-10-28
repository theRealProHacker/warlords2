
void __cdecl16far FUN_6d27_0d60(void)

{
  undefined1 uVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  undefined2 unaff_SS;
  undefined1 local_170 [220];
  undefined1 local_94 [16];
  undefined2 local_84 [8];
  undefined1 local_74 [100];
  undefined2 local_10;
  int local_e;
  undefined4 local_c;
  long local_8;
  int local_4;
  
  iVar2 = thunk_FUN_8027_225b();
  if (iVar2 == 2) {
    uVar3 = thunk_FUN_7e8f_0505(6,0,9);
    iVar2 = FUN_170b_0006(uVar3,in_DX);
    if (iVar2 < 0) {
      return;
    }
    local_8 = 4;
    FUN_170b_004e(iVar2,&local_8);
    FUN_170b_003a(iVar2);
  }
  else {
    iVar2 = thunk_FUN_8027_225b();
    if (0xc9 < iVar2) {
      return;
    }
  }
  uVar3 = thunk_FUN_7e8f_0505(6,0,2);
  uVar3 = FUN_170b_0006(uVar3,in_DX);
  FUN_170b_006d(uVar3,&local_8);
  FUN_170b_003a(uVar3);
  uVar3 = FUN_1d28_01d5((undefined2)local_8);
  local_c = CONCAT22(in_DX,uVar3);
  if (local_c != 0) {
    uVar3 = thunk_FUN_7e8f_0505(6,0,1);
    uVar3 = FUN_170b_0006(uVar3,in_DX);
    FUN_170b_006d(uVar3,&local_8);
    FUN_170b_006d(uVar3,(int)local_c,(int)((ulong)local_c >> 0x10),(undefined2)local_8);
    FUN_1d28_050d((int)local_c,(int)((ulong)local_c >> 0x10));
    for (iVar2 = 0; iVar2 < DAT_3c04_157b; iVar2 = iVar2 + 1) {
      if (*(char *)(*(byte *)(*(int *)(iVar2 * 0x41 + 0x157f) * 0xe0 +
                             *(int *)(iVar2 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
        uVar1 = *(undefined1 *)(iVar2 * 0x41 + 0x1592);
      }
      else {
        uVar1 = 0xff;
      }
      local_74[iVar2] = uVar1;
    }
    for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
      local_84[iVar2] = *(undefined2 *)(iVar2 * 0x14 + 0x185);
    }
    thunk_FUN_6ec8_0947(local_94);
    thunk_FUN_824f_03f9();
    local_10 = FUN_6d27_132f(local_170);
    local_4 = DAT_3c04_157b + local_e + 0x34;
    if ((DAT_3c04_157b != 0) && (DAT_3c04_157b / 2 == (DAT_3c04_157b + -1) / 2)) {
      local_4 = DAT_3c04_157b + local_e + 0x35;
    }
    FUN_170b_004e(uVar3,&local_4);
    FUN_170b_004e(uVar3,local_84);
    FUN_170b_004e(uVar3,local_94);
    FUN_170b_004e(uVar3,(undefined2 *)&DAT_451b_1e8a,0x4125,0x10);
    FUN_170b_004e(uVar3,local_74);
    FUN_170b_004e(uVar3,&local_10);
    FUN_170b_004e(uVar3,local_170);
    local_8 = local_8 + local_4;
    FUN_170b_008c(uVar3,0,0,0);
    FUN_170b_004e(uVar3,&local_8);
    FUN_170b_003a(uVar3);
    FUN_6d27_1225();
  }
  return;
}

