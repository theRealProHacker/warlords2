
int __cdecl16far FUN_255e_04e9(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  char *pcVar7;
  int iVar8;
  
  if (DAT_4125_37a2 == '\0') {
    return -1;
  }
  if (DAT_4125_37ab != '\0') {
    return 0;
  }
  iVar5 = 0;
  pcVar7 = (char *)&DAT_451b_3108;
  do {
    iVar8 = iVar5;
    if (*pcVar7 == '\0') break;
    pcVar7 = pcVar7 + 0xb;
    iVar5 = iVar5 + 1;
    iVar8 = -1;
  } while (pcVar7 != (char *)0x70d6);
  if (-1 < iVar8) {
    iVar1 = FUN_170b_0006(param_1,param_2,2);
    if (iVar1 < 0) {
      return -1;
    }
    uVar2 = FUN_170b_00a9(iVar1);
    uVar3 = FUN_1d28_011f(uVar2,iVar5,0,0xd,0);
    uVar6 = (undefined2)((ulong)((long)iVar8 * 0xb) >> 0x10);
    iVar4 = (int)((long)iVar8 * 0xb);
    *(int *)((int)(undefined2 *)&DAT_451b_3111 + iVar4) = iVar5;
    *(undefined2 *)((int)(undefined2 *)&DAT_451b_310f + iVar4) = uVar3;
    uVar3 = FUN_1d28_069a(*(undefined2 *)((int)(undefined2 *)&DAT_451b_310f + iVar4),
                          *(undefined2 *)((int)(undefined2 *)&DAT_451b_3111 + iVar4));
    iVar5 = iVar8 * 0xb;
    *(undefined2 *)((int)(undefined2 *)&DAT_451b_310d + iVar5) = uVar6;
    *(undefined2 *)((int)(undefined2 *)&DAT_451b_310b + iVar5) = uVar3;
    ((undefined1 *)&DAT_451b_3108)[iVar5] = 1;
    *(undefined2 *)((int)(undefined2 *)&DAT_451b_3109 + iVar5) = uVar2;
    FUN_170b_006d(iVar1,*(undefined2 *)((int)(undefined2 *)&DAT_451b_310b + iVar5),
                  *(undefined2 *)((int)(undefined2 *)&DAT_451b_310d + iVar5),uVar2);
    DAT_451b_3106 = 11000;
    DAT_451b_3104 = 0x4125;
    DAT_451b_3102 = 0x704e;
    iVar5 = iVar8 * 0xb;
    DAT_451b_3100 = *(undefined2 *)((int)(undefined2 *)&DAT_451b_3109 + iVar5);
    DAT_451b_30fe = *(undefined2 *)((int)(undefined2 *)&DAT_451b_310d + iVar5);
    DAT_451b_30fc = *(undefined2 *)((int)(undefined2 *)&DAT_451b_310b + iVar5);
    FUN_1000_02bb((undefined2 *)&DAT_451b_30fc,0x4125);
    FUN_170b_003a(iVar1);
  }
  return iVar8;
}

