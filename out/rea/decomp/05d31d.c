
undefined2 __cdecl16far FUN_5c8e_0a3d(undefined2 param_1)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SS;
  byte abStack_f [7];
  undefined2 local_8;
  int local_6;
  int local_4;
  
  local_4 = 0;
  local_6 = 0;
  local_8 = 2;
  thunk_FUN_5d9f_0656(param_1,0,abStack_f + 1);
  iVar2 = 6;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    uVar1 = (uint)abStack_f[iVar2];
    iVar2 = iVar3;
    if ((((uVar1 != 0xff) && (*(char *)(uVar1 * 0x41 + 0x1592) != '\x0f')) &&
        (*(char *)(uVar1 * 0x41 + 0x1592) != DAT_3c04_0110)) &&
       ((*(char *)(*(byte *)(*(int *)(uVar1 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)(uVar1 * 0x41 + 0x157d) * 2) + 0x710) == '\n' &&
        (local_4 = local_4 + 1,
        (*(byte *)(DAT_3c04_0110 * 8 + (int)*(char *)(uVar1 * 0x41 + 0x1592) + 0x153b) & 3) == 2))))
    {
      local_6 = local_6 + 1;
    }
  }
  if (local_6 == 0) {
    if (local_4 < 2) {
      if (local_4 != 0) {
        local_8 = 3;
      }
    }
    else {
      local_8 = 4;
    }
  }
  else {
    local_8 = 8;
  }
  return local_8;
}

