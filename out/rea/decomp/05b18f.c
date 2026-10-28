
undefined2 __cdecl16far FUN_5ab9_05ff(void)

{
  byte *pbVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  undefined2 unaff_SS;
  byte abStack_15 [7];
  int local_e;
  int local_c;
  undefined2 local_a;
  undefined2 local_8;
  int local_6;
  uint local_4;
  
  uVar7 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
  uVar2 = (uint)(*(byte *)((int)(undefined2 *)DAT_451b_1f02 + 0xf) >> 1);
  local_8 = *DAT_451b_1f02;
  local_a = ((undefined2 *)DAT_451b_1f02)[1];
  local_c = 100;
  local_e = thunk_FUN_557a_0851(uVar2);
  iVar3 = thunk_FUN_824f_044a(local_8,local_a);
  if (*(char *)(uVar2 * 0x41 + 0x1592) == DAT_3c04_0110) {
    if ((iVar3 < 0) || (iVar3 = thunk_FUN_57d5_01f6(iVar3,abStack_15 + 1), iVar3 == 0)) {
      thunk_FUN_57d5_01f6(uVar2,abStack_15 + 1);
    }
    local_4 = 0xffff;
    local_6 = 1000;
    iVar3 = 6;
    while (iVar5 = iVar3 + -1, iVar3 != 0) {
      uVar2 = (uint)abStack_15[iVar3];
      iVar3 = iVar5;
      if ((uVar2 != 0xff) && ((*(byte *)((int)DAT_451b_018e + uVar2 + 0x11e) & 1) == 0)) {
        if (DAT_3c04_011a != 0) {
          local_c = thunk_FUN_621e_15c5(*(undefined2 *)(uVar2 * 0x41 + 0x157d),
                                        *(undefined2 *)(uVar2 * 0x41 + 0x157f));
        }
        if ((0x4a < local_c) &&
           (iVar5 = FUN_1a8b_0acc(local_8,local_a,*(undefined2 *)(uVar2 * 0x41 + 0x157d),
                                  *(undefined2 *)(uVar2 * 0x41 + 0x157f)), iVar5 < local_6)) {
          local_6 = iVar5;
          local_4 = uVar2;
        }
      }
    }
    if (local_4 == 0xffff) {
      if ((DAT_3c04_0124 != 0) && (iVar3 = thunk_FUN_8027_225b(), iVar3 < 10)) {
        iVar3 = 0;
        do {
          if (7 < iVar3) {
            return 0;
          }
          if (((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] != 0 ||
              *(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) != 0) {
            iVar5 = DAT_3c04_0181;
            do {
              iVar4 = iVar5 + -1;
              iVar6 = -1;
              if (iVar5 == 0) break;
              iVar5 = iVar4;
            } while ((*(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) != 0x2e1d) ||
                    (iVar6 = iVar4,
                    iVar4 * 0x16 + -0x7780 != ((undefined2 *)&DAT_451b_1ede)[iVar3 * 2]));
            if (iVar6 != -1) {
              thunk_FUN_57d5_0e4b(iVar6,0xffff);
            }
          }
          iVar3 = iVar3 + 1;
        } while( true );
      }
    }
    else {
      for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
        if (((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] != 0 ||
            *(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) != 0) {
          uVar7 = (undefined2)
                  ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2) >> 0x10);
          iVar5 = (int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2);
          pbVar1 = (byte *)(iVar5 + 0xe);
          *pbVar1 = *pbVar1 & 0xf0;
          pbVar1 = (byte *)(iVar5 + 0xe);
          *pbVar1 = *pbVar1 | 1;
          iVar5 = ((undefined2 *)&DAT_451b_1ede)[iVar3 * 2];
          pbVar1 = (byte *)(iVar5 + 0xf);
          *pbVar1 = *pbVar1 & 1;
          pbVar1 = (byte *)(iVar5 + 0xf);
          *pbVar1 = *pbVar1 | (char)local_4 << 1;
          thunk_FUN_621e_0c7e(*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2),1,local_4);
        }
      }
    }
  }
  else if (local_e == 0) {
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if (((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] != 0 ||
          *(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) != 0) {
        uVar7 = (undefined2)
                ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2) >> 0x10);
        pbVar1 = (byte *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2) + 0xe);
        *pbVar1 = *pbVar1 & 0xf0;
        pbVar1 = (byte *)(((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] + 0xf);
        *pbVar1 = *pbVar1 & 1;
        *(undefined2 *)(((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] + 0x14) = 0xffff;
        *(undefined2 *)(((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] + 0x12) = 0xffff;
      }
    }
    return 0;
  }
  return 1;
}

