
void __cdecl16far FUN_5e7c_038d(undefined2 param_1,undefined2 param_2)

{
  int *piVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  
  bVar2 = false;
  if ((DAT_3c04_011e != 0) &&
     (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) {
    iVar3 = (int)DAT_451b_0364;
    while (iVar4 = iVar3 + -1, iVar3 != 0) {
      iVar3 = iVar4;
      if ((*(int *)((int)(undefined4 *)&DAT_451b_0366 + iVar4 * 4 + 2) == 0x2e1d) &&
         (*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) * 0x16 + -0x7780 ==
          *(int *)((undefined4 *)&DAT_451b_0366 + iVar4))) {
        bVar2 = true;
      }
    }
    if ((bVar2) &&
       (((*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 4 ||
         (*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 5)) &&
        (iVar3 = thunk_FUN_824f_044a(param_1,param_2),
        *(int *)((char *)s_Explored__4125_1105 + 4 + DAT_3c04_0110 * 0xc) == iVar3)))) {
      uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      iVar4 = (int)DAT_451b_018e;
      piVar1 = (int *)(iVar4 + 0x4a);
      *piVar1 = *piVar1 + 1;
      *(undefined2 *)(iVar4 + 0x46) = 0xffff;
      if (*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 5) {
        thunk_FUN_562a_1864(iVar3,1);
        uVar5 = 2;
      }
      else {
        uVar5 = 4;
      }
      thunk_FUN_4974_1ded(uVar5,0,0);
    }
  }
  return;
}

