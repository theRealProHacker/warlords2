
void __cdecl16far
FUN_57d5_06c7(uint param_1,char param_2,undefined4 param_3,undefined4 param_4,undefined2 *param_5)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  undefined2 uVar7;
  undefined2 unaff_SS;
  byte abStack_13 [7];
  uint local_c;
  int local_a;
  int local_8;
  uint local_6;
  int local_4;
  
  local_a = 100;
  local_c = param_1;
  while( true ) {
    iVar1 = 8;
    while (iVar5 = iVar1 + -1, iVar1 != 0) {
      uVar7 = (undefined2)((ulong)param_4 >> 0x10);
      iVar2 = (int)param_4;
      iVar1 = iVar5;
      if ((*(int *)(iVar2 + iVar5 * 2) != -1) &&
         (*(char *)(*(int *)(iVar2 + iVar5 * 2) * 0x16 + -0x777b) != DAT_3c04_0110)) {
        *(undefined2 *)(iVar2 + iVar5 * 2) = 0xffff;
      }
    }
    if (DAT_3c04_011a != 0) {
      thunk_FUN_621e_14d3(param_4);
    }
    local_4 = 1000;
    iVar1 = FUN_57d5_01f6(local_c,abStack_13 + 1);
    if (iVar1 == 0) {
      return;
    }
    iVar1 = 6;
    uVar6 = 0xffff;
    while( true ) {
      iVar5 = iVar1;
      iVar1 = iVar5 + -1;
      uVar7 = (undefined2)((ulong)param_3 >> 0x10);
      if (iVar5 == 0) break;
      local_6 = (uint)abStack_13[iVar5];
      if (((local_6 != 0xff) && ((*(byte *)((int)DAT_451b_018e + local_6 + 0x11e) & 1) == 0)) &&
         (*param_5 = 0, *(char *)((int)param_3 + local_6) < '\x03')) {
        if (DAT_3c04_011a != 0) {
          local_a = thunk_FUN_621e_15c5();
        }
        if (0x4a < local_a) {
          iVar2 = thunk_FUN_7e8f_02bf(1);
          if ((byte)(&stack0xffe7)[iVar5] < 0x29) {
            iVar3 = 0;
          }
          else {
            iVar3 = 10;
          }
          if ((byte)(&stack0xffe7)[iVar5] < 0x33) {
            iVar4 = 0;
          }
          else {
            iVar4 = 0x1e;
          }
          iVar5 = iVar2 + (uint)(byte)(&stack0xffe7)[iVar5] + *(char *)((int)param_3 + local_6) * 10
                  + iVar3 + iVar4 + (100 - local_a);
          if (iVar5 < local_4) {
            local_4 = iVar5;
            local_8 = local_a;
            uVar6 = local_6;
          }
        }
      }
    }
    if (uVar6 == 0xffff) break;
    *(char *)((int)param_3 + uVar6) = *(char *)((int)param_3 + uVar6) + param_2;
    DAT_451b_0160 = param_1;
    DAT_4125_07c6 = uVar6;
    thunk_FUN_621e_0ae7(param_4,1,uVar6,0x80);
    uVar7 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                  *(undefined2 *)((int)DAT_451b_1f02 + 0x14));
    if (*(char *)(uVar6 * 0x41 + 0x1592) != DAT_3c04_0110) {
      return;
    }
    if (*(int *)((int)DAT_451b_018e + 0x48) != 0) {
      return;
    }
    local_c = uVar6;
    iVar1 = FUN_57d5_0a3e(*(undefined2 *)(uVar6 * 0x41 + 0x157d),
                          *(undefined2 *)(uVar6 * 0x41 + 0x157f));
    if (iVar1 < 10) {
      return;
    }
  }
  if (((DAT_3c04_0124 != 0) && (DAT_451b_0160 == param_1)) && (DAT_4125_07c6 != 0xffff)) {
    thunk_FUN_621e_0ae7(param_4,1,DAT_4125_07c6,0x80);
  }
  return;
}

