
void FUN_899d_000a(undefined2 param_1,int param_2)

{
  uint *puVar1;
  bool bVar2;
  undefined1 uVar3;
  uint uVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined2 uVar9;
  undefined2 unaff_SS;
  uint auStack_50 [8];
  int aiStack_40 [8];
  uint auStack_30 [8];
  uint auStack_20 [8];
  int iStack_10;
  int iStack_e;
  int iStack_c;
  int iStack_a;
  int local_8;
  int local_6;
  int local_4;
  
  uVar9 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
  local_4 = *(int *)((int)DAT_451b_1f02 + 0x12);
  local_6 = *(int *)((int)DAT_451b_1f02 + 0x14);
  local_8 = DAT_4125_2eaa;
  DAT_451b_1f02 = (undefined2 *)0x0;
  for (iVar7 = 0; iVar7 < 8; iVar7 = iVar7 + 1) {
    *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar7 * 4) = 0;
    ((undefined2 *)&DAT_451b_1ede)[iVar7 * 2] = 0;
  }
  DAT_451b_1e9e = 0;
  for (iVar7 = 0; iVar7 < DAT_4125_30f6; iVar7 = iVar7 + 1) {
    if (((undefined2 *)&DAT_451b_28e2)[iVar7] != 0) {
      if (DAT_451b_1f02 == (undefined2 *)0x0) {
        DAT_451b_1f02 =
             (undefined2 *)
             CONCAT22(((undefined2 *)&DAT_451b_2904)[iVar7 * 2],
                      (undefined2 *)((undefined2 *)&DAT_451b_2902)[iVar7 * 2]);
      }
      uVar9 = ((undefined2 *)&DAT_451b_2902)[iVar7 * 2];
      *(undefined2 *)((undefined *)&DAT_451b_1ee0 + DAT_451b_1e9e * 4) =
           ((undefined2 *)&DAT_451b_2904)[iVar7 * 2];
      ((undefined2 *)&DAT_451b_1ede)[DAT_451b_1e9e * 2] = uVar9;
      DAT_451b_1e9e = DAT_451b_1e9e + 1;
      puVar1 = (uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0xc);
      *puVar1 = *puVar1 | 1;
    }
  }
  DAT_4125_2bda = (uint)(1 < DAT_451b_1e9e);
  for (iVar7 = 1; iVar7 < DAT_451b_1e9e; iVar7 = iVar7 + 1) {
    *(undefined2 *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar7 * 2) + 0x12) =
         ((undefined2 *)DAT_451b_1f02)[9];
    *(undefined2 *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar7 * 2) + 0x14) =
         ((undefined2 *)DAT_451b_1f02)[10];
  }
  iStack_e = 0;
  iVar7 = 0;
  do {
    if (DAT_4125_30f6 <= iVar7) {
      iStack_10 = -1;
      for (iVar7 = 0; iVar7 < DAT_4125_30f6; iVar7 = iVar7 + 1) {
        if ((iVar7 == 0) ||
           (((undefined2 *)&DAT_451b_28f2)[iVar7] != ((undefined2 *)&DAT_451b_28f0)[iVar7])) {
          iStack_c = 1;
        }
        else {
          iStack_c = 0;
        }
        if (iStack_c != 0) {
          iStack_10 = iStack_10 + 1;
          uVar9 = (undefined2)
                  ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) >> 0x10);
          auStack_50[iStack_10] =
               (uint)*(byte *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0x11
                              );
          aiStack_40[iStack_10] = 0;
          auStack_30[iStack_10] = *(uint *)(((undefined2 *)&DAT_451b_2902)[iVar7 * 2] + 0xc) & 1;
        }
        aiStack_40[iStack_10] = aiStack_40[iStack_10] + 1;
      }
      iStack_10 = iStack_10 + 1;
      for (iVar7 = 0; iVar7 < iStack_10; iVar7 = iVar7 + 1) {
        if (aiStack_40[iVar7] == 1) {
          if (auStack_30[iVar7] == 0) {
            uVar4 = 2;
          }
          else {
            uVar4 = 0;
          }
        }
        else if (auStack_30[iVar7] == 0) {
          uVar4 = 3;
        }
        else {
          uVar4 = 1;
        }
        auStack_30[iVar7] = uVar4;
      }
      iVar7 = 0;
      for (iVar8 = 0; iVar6 = iStack_e, iVar8 < iStack_10; iVar8 = iVar8 + 1) {
        if ((auStack_30[iVar8] == 2) || (auStack_30[iVar8] == 0)) {
          uVar3 = 0;
        }
        else if (auStack_30[iVar8] == 3) {
          uVar3 = 1;
        }
        else {
          iStack_e = iStack_e + -1;
          if (iStack_e == 0 || iVar6 < 1) {
            uVar3 = FUN_1b62_0cde();
          }
          else {
            uVar3 = (undefined1)auStack_20[iStack_e];
          }
        }
        iStack_a = iVar7 + aiStack_40[iVar8];
        iVar6 = iVar7;
        for (; iVar7 < iStack_a; iVar7 = iVar7 + 1) {
          *(undefined1 *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar6 * 2) + 0x11) =
               uVar3;
          iVar6 = iVar6 + 1;
        }
        iVar7 = iVar6;
      }
      FUN_1c8c_0529();
      if (param_2 == 0) {
        uVar9 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        puVar5 = (undefined2 *)DAT_451b_1f02;
        if (((puVar5[9] == local_4) && (puVar5[10] == local_6)) && (DAT_4125_2eaa == local_8)) {
          thunk_FUN_85d0_0238(*DAT_451b_1f02,puVar5[1]);
          uVar9 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
          if (1 < DAT_451b_1e9e) {
            thunk_FUN_824f_0b27(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1]);
            return;
          }
          thunk_FUN_824f_0afd(*DAT_451b_1f02,((undefined2 *)DAT_451b_1f02)[1]);
          return;
        }
      }
      thunk_FUN_85d0_006c();
      return;
    }
    if ((*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0x11) != '\0')
       && (*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0x11) !=
           '\x01')) {
      bVar2 = false;
      for (iVar8 = 0; iVar8 < iStack_e; iVar8 = iVar8 + 1) {
        if ((uint)*(byte *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0x11)
            == auStack_20[iVar8]) {
          bVar2 = true;
          break;
        }
      }
      if (!bVar2) {
        auStack_20[iStack_e] =
             (uint)*(byte *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + iVar7 * 2) + 0x11);
        iStack_e = iStack_e + 1;
      }
    }
    iVar7 = iVar7 + 1;
  } while( true );
}

