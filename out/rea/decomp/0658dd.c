
bool __cdecl16far FUN_6513_07ad(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  thunk_FUN_7938_03d9(2,0,DAT_451b_1efe);
  iVar3 = 0;
  for (iVar1 = 0; iVar1 < DAT_451b_08ce; iVar1 = iVar1 + 1) {
    if (*(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar1] * 0x1d + 0xcfd) == '\x01') {
      iVar3 = iVar3 + *(char *)(((undefined2 *)&DAT_451b_0c9c)[iVar1] * 0x1d + 0xcfe);
    }
  }
  iVar4 = 0;
  iVar1 = DAT_3c04_0181;
  while (iVar2 = iVar1 + -1, iVar1 != 0) {
    iVar1 = iVar2;
    if ((*(int *)(iVar2 * 0x16 + -0x7780) == *DAT_451b_1efe) &&
       (*(int *)(iVar2 * 0x16 + -0x777e) == ((int *)DAT_451b_1efe)[1])) {
      iVar4 = iVar4 + 1;
    }
  }
  iVar1 = thunk_FUN_7e8f_02bf();
  return iVar4 * 3 +
         (((char)((int *)DAT_451b_1efe)[4] + iVar3) -
         *(int *)((char *)s_Rename_City_4125_1003 + 4 + *(char *)((int)param_1 + 0x1a) * 2)) * 5 +
         0x5a < iVar1;
}

