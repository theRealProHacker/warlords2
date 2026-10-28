
undefined2 __cdecl16far FUN_1b62_0ea0(int param_1,int param_2)

{
  int *piVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 unaff_SS;
  long lVar6;
  undefined2 local_38 [8];
  int local_28 [16];
  uint local_8;
  int local_6;
  int local_4;
  
  local_8 = 0;
  for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
    local_38[iVar4] = 1;
  }
  piVar1 = (int *)(int)*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710);
  if ((((param_1 < 0) || (param_2 < 0)) || (piVar1 == (int *)&DAT_4125_0002)) ||
     ((*(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0x80) != 0)) {
    if ((param_1 < 0) || (param_2 < 0)) {
      local_6 = DAT_3c04_0181;
      while (local_6 = local_6 + -1, local_6 != 0) {
        piVar1 = (int *)0x8880;
        iVar4 = *(int *)(local_6 * 0x16 + -0x7780);
        local_4 = *(int *)(local_6 * 0x16 + -0x777e);
        if (((-1 < iVar4) && (-1 < local_4)) &&
           ((piVar1 = (int *)0x3c04, *(char *)(local_6 * 0x16 + -0x777b) == DAT_3c04_0110 &&
            ((((piVar1 = (int *)(int)*(char *)(*(byte *)(local_4 * 0xe0 + iVar4 * 2) + 0x710),
               iVar4 < 0 || (local_4 < 0)) || (piVar1 == (int *)&DAT_4125_0002)) ||
             ((*(byte *)(local_4 * 0xe0 + iVar4 * 2 + 1) & 0x80) != 0)))))) {
          iVar5 = 0;
          iVar3 = DAT_3c04_0181;
          while (iVar3 = iVar3 + -1, iVar3 != 0) {
            if (((*(int *)(iVar3 * 0x16 + -0x7780) == iVar4) &&
                (*(int *)(iVar3 * 0x16 + -0x777e) == local_4)) &&
               (piVar1 = (int *)0x3c04, *(char *)(iVar3 * 0x16 + -0x777b) == DAT_3c04_0110)) {
              piVar1 = local_28;
              local_28[iVar5 * 2 + 1] = 0x2e1d;
              piVar1[iVar5 * 2] = iVar3 * 0x16 + -0x7780;
              iVar5 = iVar5 + 1;
            }
          }
          iVar4 = FUN_1c8c_07fa(local_28);
          if (iVar4 == 0) {
            for (iVar4 = 0; iVar4 < iVar5; iVar4 = iVar4 + 1) {
              uVar2 = (undefined2)((ulong)*(undefined4 *)(local_28 + iVar4 * 2) >> 0x10);
              if ((((*(uint *)((int)*(undefined4 *)(local_28 + iVar4 * 2) + 0xc) & 0x1000) == 0) &&
                  (*(char *)(local_28[iVar4 * 2] + 4) != '\x1c')) &&
                 (((undefined1 *)&DAT_451b_0664)[*(char *)(local_28[iVar4 * 2] + 4) * 6] == '\0')) {
                local_8 = local_8 + 1;
                FUN_1b62_03be(*(undefined4 *)(local_28 + iVar4 * 2));
              }
            }
          }
        }
      }
    }
    else {
      iVar3 = 0;
      iVar4 = DAT_3c04_0181;
      while (iVar5 = iVar4 + -1, iVar4 != 0) {
        iVar4 = iVar5;
        if (((*(int *)(iVar5 * 0x16 + -0x7780) == param_1) &&
            (*(int *)(iVar5 * 0x16 + -0x777e) == param_2)) &&
           (piVar1 = (int *)0x3c04, *(char *)(iVar5 * 0x16 + -0x777b) == DAT_3c04_0110)) {
          piVar1 = local_28;
          local_28[iVar3 * 2 + 1] = 0x2e1d;
          piVar1[iVar3 * 2] = iVar5 * 0x16 + -0x7780;
          iVar3 = iVar3 + 1;
        }
      }
      iVar4 = FUN_1c8c_07fa(local_28);
      if (iVar4 == 0) {
        for (iVar4 = 0; iVar4 < iVar3; iVar4 = iVar4 + 1) {
          uVar2 = (undefined2)((ulong)*(undefined4 *)(local_28 + iVar4 * 2) >> 0x10);
          if ((((*(uint *)((int)*(undefined4 *)(local_28 + iVar4 * 2) + 0xc) & 0x1000) == 0) &&
              (*(char *)(local_28[iVar4 * 2] + 4) != '\x1c')) &&
             (((undefined1 *)&DAT_451b_0664)[*(char *)(local_28[iVar4 * 2] + 4) * 6] == '\0')) {
            local_8 = local_8 + 1;
            FUN_1b62_03be(*(undefined4 *)(local_28 + iVar4 * 2));
          }
        }
      }
    }
    if (0 < (int)local_8) {
      thunk_FUN_7d9f_023d();
      DAT_451b_1efe = 0;
      DAT_451b_1f02 = 0;
      for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
        *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar4 * 4) = 0;
        ((undefined2 *)&DAT_451b_1ede)[iVar4 * 2] = 0;
      }
      DAT_4125_2bda = 0;
      DAT_451b_1e9e = 0;
      thunk_FUN_824f_0000();
      thunk_FUN_85d0_006c();
      if (local_8 == 1) {
        lVar6 = 0x10002;
      }
      else {
        lVar6 = (ulong)local_8 << 0x10;
      }
      uVar2 = thunk_FUN_7e8f_04f0(0xa8,lVar6);
      FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar2,piVar1);
      uVar2 = thunk_FUN_7e8f_04f0(0x100a8);
      thunk_FUN_8027_1160((undefined1 *)&DAT_451b_1d28,0x4125,uVar2,piVar1);
      if ((-1 < param_1) && (-1 < param_2)) {
        thunk_FUN_85d0_0629(param_1,param_2);
      }
    }
    if ((int)local_8 < 1) {
      uVar2 = 0;
    }
    else {
      uVar2 = 1;
    }
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}

