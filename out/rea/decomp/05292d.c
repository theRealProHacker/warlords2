
void __cdecl16far FUN_5131_161d(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  bool bVar9;
  undefined1 local_6;
  int local_4;
  
  iVar7 = 0;
  iVar2 = (*(int *)(param_1 * 0x41 + 0x157d) << 2) / 0x70 +
          ((*(int *)(param_1 * 0x41 + 0x157f) << 1) / 0x9c) * 4;
  local_4 = thunk_FUN_7e8f_02bf(1);
  local_4 = param_2 / 2 + local_4;
  if (DAT_4125_02d8 != 0) {
    local_4 = local_4 + 1;
  }
  if (DAT_4125_02dc != 0) {
    local_4 = local_4 + 1;
  }
  if (3 < local_4) {
    local_4 = 4;
  }
  if (local_4 < 1) {
    local_4 = 0;
  }
  thunk_FUN_705a_1128();
  for (iVar6 = 0; iVar6 < 0x1d; iVar6 = iVar6 + 1) {
    thunk_FUN_705a_142c(*(undefined2 *)
                         ((char *)s_Signpost_4125_1d81 + 1 + (int)DAT_451b_002a + iVar6 * 0x10),
                        (int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8c,DAT_451b_002a._2_2_,
                        (int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8a,DAT_451b_002a._2_2_,
                        (int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8e,DAT_451b_002a._2_2_,
                        (char *)s_Resign_4125_1d90 + (int)DAT_451b_002a + iVar6 * 0x10,
                        DAT_451b_002a._2_2_);
  }
  thunk_FUN_705a_11e2();
  iVar6 = 0;
  while( true ) {
    uVar8 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    if ((0x1c < iVar6) || (local_4 <= iVar7)) break;
    iVar5 = *(int *)((char *)s_Signpost_4125_1d81 + 1 + (int)DAT_451b_002a + iVar6 * 0x10);
    if (((undefined1 *)&DAT_451b_0668)[iVar5 * 6] == '\0') {
      iVar1 = thunk_FUN_7e8f_02bf(1,0xffff000a);
      uVar8 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar3 = (int)DAT_451b_002a;
      iVar4 = iVar3 + iVar6 * 0x10;
      if (iVar1 < *(int *)((char *)s_Signpost_4125_1d81 + 3 + iVar4)) {
        bVar9 = *(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar4) == 7;
        if ((*(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar3 + iVar6 * 0x10) == 4) &&
           (DAT_4125_02d8 != 0)) {
          bVar9 = true;
        }
        if ((*(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar3 + iVar6 * 0x10) == 5) &&
           (DAT_4125_02dc != 0)) {
          bVar9 = true;
        }
        if ((*(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar3 + iVar6 * 0x10) == 3) &&
           (DAT_4125_02d6 != 0)) {
          bVar9 = true;
        }
        if (*(int *)((char *)s_Signpost_4125_1d81 + 5 + iVar3 + iVar6 * 0x10) ==
            *(int *)(iVar3 + iVar2 * 2 + 0x1d72)) {
          bVar9 = true;
        }
        if ((iVar5 == 5) && (DAT_4125_02d6 == 0)) {
          bVar9 = false;
        }
        if (bVar9) {
          local_6 = (undefined1)iVar5;
          *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x1593) = local_6;
          *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x1597) =
               *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8c);
          *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x15a3) =
               *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8e);
          *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x159b) =
               *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8a);
          *(char *)(param_1 * 0x41 + iVar7 + 0x159f) =
               ((char *)s_Resign_4125_1d90)[(int)DAT_451b_002a + iVar6 * 0x10];
          iVar7 = iVar7 + 1;
        }
      }
    }
    iVar6 = iVar6 + 1;
  }
  if (iVar7 == 0) {
    *(char *)(param_1 * 0x41 + 0x1593) = ((char *)s_Signpost_4125_1d81 + 1)[(int)DAT_451b_002a];
    *(undefined1 *)(param_1 * 0x41 + 0x1597) = *(undefined1 *)((int)DAT_451b_002a + 0x1d8c);
    *(undefined1 *)(param_1 * 0x41 + 0x15a3) = *(undefined1 *)((int)DAT_451b_002a + 0x1d8e);
    *(undefined1 *)(param_1 * 0x41 + 0x159b) = *(undefined1 *)((int)DAT_451b_002a + 0x1d8a);
    *(char *)(param_1 * 0x41 + 0x159f) = ((char *)s_Resign_4125_1d90)[(int)DAT_451b_002a];
    iVar7 = 1;
  }
  if (((6 < param_2) && (iVar6 = thunk_FUN_7e8f_02bf(1,0xffff000a), iVar6 < 5)) && (iVar7 < 4)) {
    iVar6 = 0;
    while ((iVar5 = local_4, iVar6 < iVar7 &&
           (iVar5 = iVar7,
           ((undefined1 *)&DAT_451b_0664)[*(char *)(param_1 * 0x41 + iVar6 + 0x1593) * 6] == '\0')))
    {
      iVar6 = iVar6 + 1;
    }
    local_4 = iVar5;
    iVar6 = 0;
    while( true ) {
      if ((0x1c < iVar6) || (local_4 <= iVar7)) goto LAB_5131_1b36;
      uVar8 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar5 = (int)DAT_451b_002a;
      if (((((undefined1 *)&DAT_451b_0664)
            [*(int *)((char *)s_Signpost_4125_1d81 + 1 + iVar5 + iVar6 * 0x10) * 6] != '\0') &&
          (((undefined1 *)&DAT_451b_0668)
           [*(int *)((char *)s_Signpost_4125_1d81 + 1 + iVar5 + iVar6 * 0x10) * 6] == '\0')) &&
         ((((*(int *)((char *)s_Signpost_4125_1d81 + 5 + iVar5 + iVar6 * 0x10) ==
             *(int *)(iVar5 + iVar2 * 2 + 0x1d72) ||
            (iVar1 = iVar5 + iVar6 * 0x10, *(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar1) == 7))
           || ((*(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar1) == 4 && (DAT_4125_02d8 != 0))))
          || ((*(int *)((char *)s_Signpost_4125_1d81 + 7 + iVar5 + iVar6 * 0x10) == 5 &&
              (DAT_4125_02dc != 0)))))) break;
      iVar6 = iVar6 + 1;
    }
    *(char *)(param_1 * 0x41 + iVar7 + 0x1593) =
         ((char *)s_Signpost_4125_1d81 + 1)[iVar5 + iVar6 * 0x10];
    *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x1597) =
         *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8c);
    *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x15a3) =
         *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8e);
    *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x159b) =
         *(undefined1 *)((int)DAT_451b_002a + iVar6 * 0x10 + 0x1d8a);
    *(char *)(param_1 * 0x41 + iVar7 + 0x159f) =
         ((char *)s_Resign_4125_1d90)[(int)DAT_451b_002a + iVar6 * 0x10];
    iVar7 = iVar7 + 1;
  }
LAB_5131_1b36:
  for (; iVar7 < 4; iVar7 = iVar7 + 1) {
    *(undefined1 *)(param_1 * 0x41 + iVar7 + 0x1593) = 0xff;
  }
  return;
}

