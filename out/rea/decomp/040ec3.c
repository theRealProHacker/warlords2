
int __cdecl16far thunk_FUN_824f_06fd(undefined2 param_1,undefined2 param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uStack_4;
  
  iVar3 = -1;
  uStack_4 = 1000;
  iVar2 = 0;
  do {
    if (DAT_3c04_080f <= iVar2) {
      return iVar3;
    }
    if ((*(uint *)(iVar2 * 0x1f + 0x82e) & 1 << ((byte)DAT_3c04_0110 & 0x1f)) != 0) {
      if ((DAT_3c04_0124 != 0) && (param_3 != 0)) {
        iVar1 = thunk_FUN_85d0_15ff(1,*(undefined2 *)(iVar2 * 0x1f + 0x811),
                                    *(undefined2 *)(iVar2 * 0x1f + 0x813));
        if (iVar1 == 0) goto LAB_824f_07a9;
      }
      iVar1 = FUN_1a8b_0acc(param_1,param_2,*(undefined2 *)(iVar2 * 0x1f + 0x811),
                            *(undefined2 *)(iVar2 * 0x1f + 0x813));
      if (iVar1 < uStack_4) {
        iVar3 = iVar2;
        uStack_4 = iVar1;
      }
    }
LAB_824f_07a9:
    iVar2 = iVar2 + 1;
  } while( true );
}

