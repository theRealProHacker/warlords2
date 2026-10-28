
void __cdecl16far FUN_6bf2_11dc(int param_1,undefined2 param_2)

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  undefined2 unaff_SS;
  int local_1a [8];
  undefined2 local_a;
  undefined2 uStack_8;
  int local_6;
  int local_4;
  
  if (DAT_4125_1174 == 0) {
    iVar1 = (param_1 + -0x130) / 0x20;
    iVar3 = (param_1 + -0x130) % 0x20;
    if (iVar1 < 0) {
      iVar1 = 0;
    }
    if (7 < iVar1) {
      iVar1 = 7;
    }
    FUN_1b62_007d(*(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780),
                  *(undefined2 *)(((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x777e),
                  &local_4);
    if (iVar1 < local_4) {
      local_6 = 1;
      for (iVar3 = 0; iVar3 < local_4; iVar3 = iVar3 + 1) {
        if ((*(int *)((int)(undefined4 *)&DAT_451b_1ebe + iVar3 * 4 + 2) == 0x2e1d) &&
           (((undefined2 *)&DAT_451b_04ae)[DAT_4125_0d6a] * 0x16 + -0x7780 ==
            *(int *)((undefined4 *)&DAT_451b_1ebe + iVar3))) {
          local_1a[iVar3] = 0;
        }
        else {
          local_1a[iVar3] = local_6;
          local_6 = local_6 + 1;
        }
      }
      for (iVar3 = 0; iVar3 < local_4; iVar3 = iVar3 + 1) {
        if (local_1a[iVar3] == iVar1) {
          _local_a = CONCAT22(*(undefined2 *)((int)(undefined4 *)&DAT_451b_1ebe + iVar3 * 4 + 2),
                              *(undefined2 *)((undefined4 *)&DAT_451b_1ebe + iVar3));
          break;
        }
      }
      uVar2 = (undefined2)((ulong)_local_a >> 0x10);
      iVar1 = (int)_local_a;
      thunk_FUN_73de_0626((int)*(char *)(iVar1 + 4),(int)*(char *)(iVar1 + 6),
                          (int)*(char *)(iVar1 + 8),(int)*(char *)(iVar1 + 0xb),
                          (int)*(char *)(iVar1 + 7),(int)*(char *)(iVar1 + 10),param_1,param_2);
    }
    else {
      thunk_FUN_73de_1201();
      uVar2 = thunk_FUN_7e8f_04f0(0x10084);
      uVar2 = thunk_FUN_7e8f_04f0(0x84,uVar2,iVar3);
      thunk_FUN_73de_10e1(uVar2,iVar3);
    }
    DAT_4125_1174 = 1;
  }
  return;
}

