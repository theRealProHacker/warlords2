
void __cdecl16far FUN_71d6_0000(int param_1,undefined2 param_2,undefined2 param_3)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 extraout_DX;
  undefined2 uVar4;
  
  DAT_4125_0e94 = 0;
  if (param_1 == 4) {
    iVar2 = thunk_FUN_824f_06fd(param_2,param_3,1);
    iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x1f + 0x811),
                                *(undefined2 *)(iVar2 * 0x1f + 0x813));
    if (iVar1 == 0) {
      return;
    }
    if (((DAT_4125_0e92 == 4) && (DAT_4125_0e98 == iVar2)) && (DAT_4125_166a != 0))
    goto code_r0x00071dcd;
    DAT_4125_0e9a = *(undefined2 *)(iVar2 * 0x1f + 0x811);
    DAT_4125_0e9c = *(undefined2 *)(iVar2 * 0x1f + 0x813);
    DAT_4125_0e98 = iVar2;
LAB_71d6_021d:
    if (-1 < DAT_4125_0e98) {
      DAT_4125_0e92 = param_1;
      FUN_22bf_07a5();
      FUN_71d6_06de(0x22bf,1);
      uVar4 = extraout_DX;
      FUN_71d6_1a9b();
      thunk_FUN_79c4_056a();
      DAT_4125_166a = 1;
      FUN_71d6_03a9();
      FUN_22bf_0757();
      if (DAT_3c04_012e != 0) {
        if ((DAT_3c04_0134 >> 1 & 1) == 0) {
          DAT_3c04_0134 = DAT_3c04_0134 | 2;
          uVar3 = thunk_FUN_7e8f_0505(0x10019);
          thunk_FUN_8027_168d(uVar3,uVar4);
        }
        if (((DAT_3c04_0134 & 0x20) == 0) &&
           (1 < (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110])) {
          DAT_3c04_0134 = DAT_3c04_0134 | 0x20;
          uVar3 = thunk_FUN_7e8f_0505(0x60019);
          thunk_FUN_8027_168d(uVar3,uVar4);
        }
      }
    }
  }
  else {
    if (param_1 == 0) {
      iVar2 = thunk_FUN_824f_04fa(param_2,param_3,0x1000e);
      iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                                  *(undefined2 *)(iVar2 * 0x41 + 0x157f));
      if (((iVar1 == 0) &&
          (iVar1 = thunk_FUN_85d0_15ff(1,*(int *)(iVar2 * 0x41 + 0x157d) + 1,
                                       *(undefined2 *)(iVar2 * 0x41 + 0x157f)), iVar1 == 0)) &&
         ((iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x41 + 0x157d),
                                       *(int *)(iVar2 * 0x41 + 0x157f) + 1), iVar1 == 0 &&
          (iVar1 = thunk_FUN_85d0_15ff(1,*(int *)(iVar2 * 0x41 + 0x157d) + 1,
                                       *(int *)(iVar2 * 0x41 + 0x157f) + 1), iVar1 == 0)))) {
        return;
      }
      if (((DAT_4125_0e92 != 0) || (DAT_4125_0e98 != iVar2)) || (DAT_4125_166a == 0))
      goto LAB_71d6_01f8;
    }
    else {
      iVar2 = thunk_FUN_824f_04fa(param_2,param_3,DAT_3c04_0110,1);
      if ((((DAT_4125_0e92 != param_1) || (DAT_4125_0e98 != iVar2)) || (DAT_4125_166a == 0)) ||
         (param_1 == 1)) {
        if (*(char *)(iVar2 * 0x41 + 0x15aa) < '\x01') {
          DAT_4125_0e9e = -1;
        }
        else {
          DAT_4125_0e9e = (int)*(char *)(iVar2 * 0x41 + 0x15a9);
        }
LAB_71d6_01f8:
        DAT_4125_0e98 = iVar2;
        DAT_4125_0e9a = *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x157d);
        DAT_4125_0e9c = *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x157f);
        goto LAB_71d6_021d;
      }
    }
code_r0x00071dcd:
    FUN_71d6_03a9();
  }
  return;
}

