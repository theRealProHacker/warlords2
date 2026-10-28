
/* WARNING: Instruction at (ram,0x00051ec5) overlaps instruction at (ram,0x00051ec4)
    */

uint __cdecl16far
thunk_FUN_59a9_01b3(int param_1,int *param_2,int param_3,int *param_4,int param_5,undefined2 param_6
                   )

{
  byte *pbVar1;
  char cVar2;
  bool bVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  byte *pbVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int unaff_DI;
  int *piVar14;
  int *piVar15;
  undefined2 uVar16;
  undefined2 unaff_SS;
  int aiStack_26 [8];
  int iStack_16;
  uint uStack_14;
  uint uStack_12;
  int iStack_10;
  uint uStack_e;
  uint uStack_c;
  int *piStack_a;
  uint uStack_8;
  int *piStack_6;
  uint uStack_4;
  
  iStack_10 = 0;
  uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar11 = (int)DAT_451b_018e;
  iVar13 = *(int *)(iVar11 + 0x24a);
  while (iVar6 = iVar13 + -1, iVar13 != 0) {
    iVar13 = iVar6;
    if (*(int *)(iVar11 + iVar6 * 0x5c + 0x24c) != 0) {
      iStack_10 = iStack_10 + 1;
    }
  }
  *(undefined2 *)(iVar11 + 0x40) = 0;
  *(undefined2 *)(iVar11 + 0x3e) = 0;
  *(undefined2 *)(iVar11 + 0x3c) = 0;
  *(undefined2 *)(iVar11 + 0x3a) = 0;
  iVar13 = 8;
  while (iVar11 = DAT_3c04_157b, iVar13 != 0) {
    aiStack_26[iVar13 + -1] = 0;
    iVar13 = iVar13 + -1;
  }
  while( true ) {
    iVar13 = iVar11 + -1;
    uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (iVar11 == 0) break;
    iVar11 = iVar13;
    if (*(char *)(iVar13 * 0x41 + 0x1592) == DAT_3c04_0110) {
      pbVar1 = (byte *)((int)DAT_451b_018e + iVar13 + 0x11e);
      *pbVar1 = *pbVar1 & 0x37;
      if ((*(char *)((int)DAT_451b_018e + iVar13 + 0x56) != '\a') &&
         (iVar6 = thunk_FUN_621e_1a4d(iVar13), iVar6 != 0)) {
        piStack_6 = (int *)0xffff;
        iVar6 = (int)*(char *)(iVar13 * 0x41 + uStack_4 + 0x159b);
        if (((undefined1 *)&DAT_451b_0669)[*(char *)(iVar13 * 0x41 + uStack_4 + 0x1593) * 6] ==
            '\x01') {
          iVar6 = iVar6 + 2;
        }
        iVar13 = 8;
        while (iVar8 = iVar13 + -1, iVar13 != 0) {
          if (aiStack_26[iVar8] == 0) {
            aiStack_26[iVar8] = iVar6;
            piStack_6 = (int *)0xffff;
            break;
          }
          iVar13 = iVar8;
          if (aiStack_26[iVar8] < unaff_DI) {
            unaff_DI = aiStack_26[iVar8];
            piStack_6 = (int *)iVar8;
          }
        }
        unaff_DI = iVar6;
        if (piStack_6 != (int *)0xffff) {
          aiStack_26[(int)piStack_6] = iVar6;
        }
      }
    }
  }
  iVar13 = 100;
  iVar11 = 8;
  while (iVar6 = iVar11 + -1, iVar11 != 0) {
    iVar11 = iVar6;
    if ((aiStack_26[iVar6] != 0) && (aiStack_26[iVar6] < iVar13)) {
      iVar13 = aiStack_26[iVar6];
    }
  }
  if (4 < iVar13) {
    iVar13 = 4;
  }
  *(int *)((int)DAT_451b_018e + 0x3a) = iVar13;
  iVar13 = DAT_3c04_157b;
  if (iStack_10 == 4) {
    while (iVar11 = iVar13 + -1, iVar13 != 0) {
      iVar13 = iVar11;
      if ((*(char *)(iVar11 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         (iVar6 = thunk_FUN_5efd_0a7a(), iVar6 != 0)) {
        uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        iVar6 = (int)DAT_451b_018e;
        if ((*(byte *)(iVar6 + iVar11 + 0x11e) & 2) != 0) {
          bVar3 = false;
          iVar8 = 4;
          while (iVar9 = iVar8 + -1, iVar8 != 0) {
            iStack_16 = (int)*(char *)(iVar11 * 0x41 + iVar9 + 0x1593);
            iVar8 = iVar9;
            if (((-1 < iStack_16) && (((undefined1 *)&DAT_451b_0664)[iStack_16 * 6] != '\0')) &&
               ('\x04' < *(char *)(iVar11 * 0x41 + iVar9 + 0x159b))) {
              bVar3 = true;
            }
          }
          if (bVar3) {
            *(int *)(iVar6 + 0x3c) = *(int *)(iVar6 + 0x3c) + 1;
            pbVar1 = (byte *)(iVar6 + iVar11 + 0x11e);
            *pbVar1 = *pbVar1 | 0x40;
          }
        }
      }
    }
  }
  uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar13 = (int)DAT_451b_018e;
  bVar3 = *(int *)(iVar13 + 0x3c) < 4;
  if (bVar3) {
    iVar13 = *(int *)(iVar13 + 0x3c);
  }
  else {
    iVar13 = *(int *)(iVar13 + 0x3c) + -4;
  }
  uStack_8 = (uint)!bVar3;
  iVar11 = DAT_3c04_157b;
  if (2 < iStack_10) {
LAB_59a9_052d:
    iVar6 = iVar11 + -1;
    if (iVar11 != 0) {
      iVar11 = iVar6;
      if ((*(char *)(iVar6 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         (iVar8 = thunk_FUN_5efd_0a7a(), iVar8 != 0)) {
        uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        if ((*(byte *)((int)DAT_451b_018e + iVar6 + 0x11e) & 0x40) != 0) {
          if (iVar13 == 0) goto LAB_59a9_052d;
          pbVar1 = (byte *)((int)DAT_451b_018e + iVar6 + 0x11e);
          *pbVar1 = *pbVar1 & 0xbf;
          iVar13 = iVar13 + -1;
        }
        bVar3 = false;
        iVar8 = 4;
        while( true ) {
          iVar9 = iVar8 + -1;
          iVar12 = (int)DAT_451b_018e;
          uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
          if (iVar8 == 0) break;
          iVar8 = iVar9;
          if (((-1 < *(char *)(iVar6 * 0x41 + iVar9 + 0x1593)) &&
              ((((undefined1 *)&DAT_451b_0669)[*(char *)(iVar6 * 0x41 + iVar9 + 0x1593) * 6] ==
                '\x01' || (*(int *)(iVar12 + 0x3a) <= (int)*(char *)(iVar6 * 0x41 + iVar9 + 0x159b))
               ))) && ('\x0f' < *(char *)(iVar6 * 0x41 + iVar9 + 0x159f))) {
            bVar3 = true;
          }
        }
        if (bVar3) {
          *(int *)(iVar12 + 0x3e) = *(int *)(iVar12 + 0x3e) + 1;
          pbVar1 = (byte *)(iVar12 + iVar6 + 0x11e);
          *pbVar1 = *pbVar1 | 0x80;
        }
      }
      goto LAB_59a9_052d;
    }
  }
  uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar13 = (int)DAT_451b_018e;
  uStack_12 = (uint)(7 < *(int *)(iVar13 + 0x3e));
  uStack_14 = 0;
  bVar3 = *(int *)(iVar13 + 0x3e) < 4;
  if (bVar3) {
    iVar13 = *(int *)(iVar13 + 0x3e);
  }
  else {
    iVar13 = *(int *)(iVar13 + 0x3e) + -4;
  }
  piStack_a = (int *)(uint)!bVar3;
  iVar11 = DAT_3c04_157b;
  if (1 < iStack_10) {
LAB_59a9_0692:
    iVar6 = iVar11 + -1;
    if (iVar11 != 0) {
      iVar11 = iVar6;
      if ((*(char *)(iVar6 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         (iVar8 = thunk_FUN_5efd_0a7a(), iVar8 != 0)) {
        uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
        iVar8 = (int)DAT_451b_018e;
        if ((*(byte *)(iVar8 + iVar6 + 0x11e) & 0x40) == 0) {
          if ((*(byte *)(iVar8 + iVar6 + 0x11e) & 0x80) != 0) {
            if (iVar13 == 0) goto LAB_59a9_0692;
            pbVar1 = (byte *)(iVar8 + iVar6 + 0x11e);
            *pbVar1 = *pbVar1 & 0x7f;
            iVar13 = iVar13 + -1;
          }
          bVar3 = false;
          iVar8 = 4;
          while( true ) {
            iVar9 = iVar8 + -1;
            iVar12 = (int)DAT_451b_018e;
            uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
            if (iVar8 == 0) break;
            iVar8 = iVar9;
            if ((-1 < *(char *)(iVar6 * 0x41 + iVar9 + 0x1593)) &&
               ((((((undefined1 *)&DAT_451b_0669)[*(char *)(iVar6 * 0x41 + iVar9 + 0x1593) * 6] ==
                   '\x01' ||
                  (*(int *)(iVar12 + 0x3a) <= (int)*(char *)(iVar6 * 0x41 + iVar9 + 0x159b))) &&
                 ('\v' < *(char *)(iVar6 * 0x41 + iVar9 + 0x159f))) &&
                ((uStack_14 = uStack_14 + 1, uStack_12 == 0 ||
                 ('\x0f' < *(char *)(iVar6 * 0x41 + iVar9 + 0x159f))))))) {
              bVar3 = true;
            }
          }
          if (bVar3) {
            *(int *)(iVar12 + 0x40) = *(int *)(iVar12 + 0x40) + 1;
            pbVar1 = (byte *)(iVar12 + iVar6 + 0x11e);
            *pbVar1 = *pbVar1 | 8;
          }
        }
      }
      goto LAB_59a9_0692;
    }
  }
  uStack_e = (uint)(7 < (int)uStack_14);
  uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar13 = (int)DAT_451b_018e;
  bVar3 = *(int *)(iVar13 + 0x40) < 4;
  if (bVar3) {
    piVar14 = (int *)*(undefined2 *)(iVar13 + 0x40);
  }
  else {
    piVar14 = (int *)(*(int *)(iVar13 + 0x40) + -4);
  }
  uStack_c = (uint)!bVar3;
  iVar13 = DAT_3c04_157b;
  while( true ) {
    iVar6 = iVar13 + -1;
    iVar11 = (int)DAT_451b_018e;
    uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    if (iVar13 == 0) break;
    iVar13 = iVar6;
    if ((((*(char *)(iVar6 * 0x41 + 0x1592) == DAT_3c04_0110) &&
         ((*(byte *)(iVar11 + iVar6 + 0x11e) & 0xc0) == 0)) &&
        ((*(byte *)(iVar11 + iVar6 + 0x11e) & 8) != 0)) && (piVar14 != (int *)0x0)) {
      pbVar1 = (byte *)(iVar11 + iVar6 + 0x11e);
      *pbVar1 = *pbVar1 & 0xf7;
      piVar14 = (int *)((int)piVar14 + -1);
    }
  }
  uVar5 = *(uint *)(iVar11 + 0x24a);
  do {
    do {
      uVar7 = uVar5 - 1;
      if (uVar5 == 0) {
        return 0;
      }
      uVar16 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      uVar5 = uVar7;
    } while (*(int *)((int)DAT_451b_018e + uVar7 * 0x5c + 0x24c) == 0);
    uVar4 = uVar7 * 0x5c;
    *(undefined2 *)((int)DAT_451b_018e + uVar4 + 0x2a4) = 8;
  } while (3 < uVar7);
  iVar13 = -1;
  uVar5 = uStack_8;
  switch(uVar7) {
  case 0:
    do {
      if (*(char *)((int)DAT_451b_002a + uVar4 + iVar13 + 0x6120) == '\x03') goto LAB_4fe5_04a3;
      while( true ) {
        iVar13 = iVar13 + 1;
        while (0x6f < iVar13) {
          piVar14 = (int *)((int)piVar14 + 1);
          if (0x9b < (int)piVar14) {
            for (iVar13 = 0; iVar13 < 0x9c; iVar13 = iVar13 + 1) {
              for (iVar11 = 0; iVar11 < 0x70; iVar11 = iVar11 + 1) {
                uVar4 = iVar13 * 0x70;
                if (*(char *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) == '\x04') {
                  iVar6 = FUN_4fe5_0d4f();
                  if ((iVar11 + iVar13 == 0) ||
                     ((iVar11 + iVar13) / 2 != (iVar11 + iVar13 + -1) / 2)) {
                    uStack_4 = 1;
                  }
                  else {
                    uStack_4 = 0;
                  }
                  uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                  iVar8 = (int)DAT_451b_002a;
                  if (*(char *)(iVar8 + iVar6 + 0x264) < '\0') {
                    iVar6 = thunk_FUN_7e8f_02bf(1);
                    uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                    if (iVar6 < 6) {
                      uVar16 = *(undefined2 *)((int)DAT_451b_002a + uStack_4 * 2 + 0x624);
                      pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                      *pbVar10 = 0;
                      pbVar1 = pbVar10;
                      *pbVar1 = *pbVar1 | (byte)uVar16;
                      uVar4 = iVar13 * 0x70;
                      *(undefined1 *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) = 7;
                    }
                    else {
                      uVar5 = *(uint *)((int)DAT_451b_002a + uStack_4 * 2 + 0x598);
                      uVar4 = uVar5 & 0xff;
                      pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                      *pbVar10 = 0;
                      pbVar1 = pbVar10;
                      *pbVar1 = *pbVar1 | (byte)uVar5;
                    }
                  }
                  else {
                    uVar16 = *(undefined2 *)
                              (iVar8 + *(char *)(iVar8 + iVar6 + 0x264) * 4 + uStack_4 * 2 + 0x564);
                    pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                    *pbVar10 = 0;
                    pbVar1 = pbVar10;
                    *pbVar1 = *pbVar1 | (byte)uVar16;
                    uVar4 = iVar13 * 0x70;
                    *(undefined1 *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) = 4;
                  }
                }
              }
            }
            for (iVar13 = 0; iVar13 < 0x9c; iVar13 = iVar13 + 1) {
              for (iVar11 = 0; iVar11 < 0x70; iVar11 = iVar11 + 1) {
                if (*(char *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) == '\x06') {
                  iVar6 = FUN_4fe5_0dcb();
                  if ((iVar11 + iVar13 == 0) ||
                     ((iVar11 + iVar13) / 2 != (iVar11 + iVar13 + -1) / 2)) {
                    uStack_4 = 1;
                  }
                  else {
                    uStack_4 = 0;
                  }
                  uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                  iVar8 = (int)DAT_451b_002a;
                  if (*(char *)(iVar8 + iVar6 + 0x264) < '\0') {
                    uVar16 = *(undefined2 *)(iVar8 + uStack_4 * 2 + 0x5a4);
                    pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                    *pbVar10 = 0;
                    pbVar1 = pbVar10;
                    *pbVar1 = *pbVar1 | (byte)uVar16;
                    *(undefined1 *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) = 5;
                  }
                  else {
                    uVar16 = *(undefined2 *)
                              (iVar8 + *(char *)(iVar8 + iVar6 + 0x264) * 4 + uStack_4 * 2 + 0x5e4);
                    pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                    *pbVar10 = 0;
                    pbVar1 = pbVar10;
                    *pbVar1 = *pbVar1 | (byte)uVar16;
                    *(undefined1 *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) = 6;
                  }
                }
                uVar4 = iVar13 * 0x70;
              }
            }
            for (iVar13 = 0; iVar13 < 0x9c; iVar13 = iVar13 + 1) {
              for (iVar11 = 0; iVar11 < 0x70; iVar11 = iVar11 + 1) {
                uVar4 = iVar13 * 0x70;
                if (*(char *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) == '\x05') {
                  iVar6 = FUN_4fe5_0e47();
                  if ((iVar11 + iVar13 == 0) ||
                     ((iVar11 + iVar13) / 2 != (iVar11 + iVar13 + -1) / 2)) {
                    uStack_4 = 1;
                  }
                  else {
                    uStack_4 = 0;
                  }
                  uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                  iVar8 = (int)DAT_451b_002a;
                  if (*(char *)(iVar8 + iVar6 + 0x264) < '\0') {
                    iVar6 = thunk_FUN_7e8f_02bf(1);
                    uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
                    if (iVar6 < 6) {
                      uVar16 = *(undefined2 *)((int)DAT_451b_002a + uStack_4 * 2 + 0x624);
                      pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                      *pbVar10 = 0;
                      pbVar1 = pbVar10;
                      *pbVar1 = *pbVar1 | (byte)uVar16;
                      uVar4 = iVar13 * 0x70;
                      *(undefined1 *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) = 7;
                    }
                    else {
                      *(undefined1 *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) = 5;
                      uVar5 = *(uint *)((int)DAT_451b_002a + uStack_4 * 2 + 0x5d8);
                      uVar4 = uVar5 & 0xff;
                      pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                      *pbVar10 = 0;
                      pbVar1 = pbVar10;
                      *pbVar1 = *pbVar1 | (byte)uVar5;
                    }
                  }
                  else {
                    uVar16 = *(undefined2 *)
                              (iVar8 + *(char *)(iVar8 + iVar6 + 0x264) * 4 + uStack_4 * 2 + 0x5a4);
                    pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                    *pbVar10 = 0;
                    pbVar1 = pbVar10;
                    *pbVar1 = *pbVar1 | (byte)uVar16;
                    uVar4 = iVar13 * 0x70;
                    *(undefined1 *)((int)DAT_451b_002a + uVar4 + iVar11 + 0x6120) = 5;
                  }
                }
              }
            }
            for (iVar13 = 0; iVar13 < 0x9c; iVar13 = iVar13 + 1) {
              for (iVar11 = 0; iVar11 < 0x70; iVar11 = iVar11 + 1) {
                if (*(char *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) == '\b') {
                  if ((iVar11 + iVar13 == 0) ||
                     ((iVar11 + iVar13) / 2 != (iVar11 + iVar13 + -1) / 2)) {
                    uStack_4 = 1;
                  }
                  else {
                    uStack_4 = 0;
                  }
                  iVar6 = thunk_FUN_7e8f_02bf(1);
                  if (iVar6 < 7) {
                    iVar6 = uStack_4 << 1;
                  }
                  else {
                    iVar6 = thunk_FUN_7e8f_02bf(1);
                    iVar6 = iVar6 << 2;
                  }
                  uVar16 = *(undefined2 *)((int)DAT_451b_002a + iVar6 + 0x664);
                  pbVar10 = (byte *)(iVar13 * 0xe0 + iVar11 * 2);
                  *pbVar10 = 0;
                  pbVar1 = pbVar10;
                  *pbVar1 = *pbVar1 | (byte)uVar16;
                  *(undefined1 *)((int)DAT_451b_002a + iVar13 * 0x70 + iVar11 + 0x6120) = 8;
                }
                uVar4 = iVar13 * 0x70;
              }
            }
            return uVar4;
          }
          iVar13 = 0;
        }
        uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        if (*(char *)((int)DAT_451b_002a + (int)piVar14 * 0x70 + iVar13 + 0x6120) != '\x02') break;
LAB_4fe5_04a3:
        iVar11 = FUN_4fe5_0c9d();
        if ((iVar13 + (int)piVar14 == 0) ||
           ((iVar13 + (int)piVar14) / 2 != ((int)piVar14 + iVar13 + -1) / 2)) {
          uStack_4 = 1;
        }
        else {
          uStack_4 = 0;
        }
        uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar6 = (int)DAT_451b_002a;
        if (*(char *)(iVar6 + iVar11 + 0x264) < '\0') {
          *(undefined1 *)(iVar6 + (int)piVar14 * 0x70 + iVar13 + 0x6120) = 8;
          uVar16 = *(undefined2 *)((int)DAT_451b_002a + uStack_4 * 2 + 0x664);
          pbVar10 = (byte *)((int)piVar14 * 0xe0 + iVar13 * 2);
          *pbVar10 = 0;
          pbVar1 = pbVar10;
          *pbVar1 = *pbVar1 | (byte)uVar16;
          thunk_FUN_4fc0_0029();
          uVar4 = 0x2e1d;
          pbVar1 = (byte *)((int)piVar14 * 0xe0 + iVar13 * 2 + 1);
          *pbVar1 = *pbVar1 & 0x7f;
        }
        else {
          *(undefined1 *)(iVar6 + (int)piVar14 * 0x70 + iVar13 + 0x6120) = 2;
          uVar5 = *(uint *)((int)DAT_451b_002a + *(char *)((int)DAT_451b_002a + iVar11 + 0x264) * 4
                            + uStack_4 * 2 + 0x4e4);
          uVar4 = uVar5 & 0xff;
          pbVar10 = (byte *)((int)piVar14 * 0xe0 + iVar13 * 2);
          *pbVar10 = 0;
          pbVar1 = pbVar10;
          *pbVar1 = *pbVar1 | (byte)uVar5;
        }
      }
      uVar4 = (int)piVar14 * 0x70;
    } while( true );
  case 2:
    return uVar4;
  case 3:
    do {
      uStack_8 = uVar5;
      piVar15 = piVar14;
      piStack_6 = piVar14;
      do {
        while( true ) {
          do {
            while (piVar14 = (int *)((int)piVar15 + -1), piVar15 == (int *)0x0) {
              if ((piStack_6 == (int *)0xffff) && (piStack_a == (int *)0xffff)) {
                if ((int)uStack_4 < (int)uStack_14) {
                  uStack_14 = uStack_4;
                }
                return uStack_14;
              }
              if (uVar7 != 0xfff) {
                piVar14 = piStack_6;
                if (piStack_a != (int *)0xffff) {
                  piVar14 = piStack_a;
                }
                iVar13 = *(int *)(param_3 + (int)piVar14 * 2);
                cVar2 = ((undefined1 *)&DAT_451b_0669)[*(char *)(iVar13 * 0x16 + -0x777c) * 6];
                if (*(char *)(iVar13 * 0x16 + -0x777c) == '\x1c') {
                  uVar7 = uVar7 | 1;
                }
                else {
                  if (cVar2 == '\x02') {
                    uVar7 = uVar7 | 2;
                  }
                  if (cVar2 == '\x03') {
                    uVar7 = uVar7 | 4;
                  }
                  if (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0'
                     ) {
                    uVar7 = uVar7 | 0x10;
                  }
                  if (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0'
                     ) {
                    uVar7 = uVar7 | 0x80;
                  }
                  if (cVar2 == '\x01') {
                    uVar7 = uVar7 | 8;
                  }
                  if (((undefined1 *)&DAT_451b_0665)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0'
                     ) {
                    uVar7 = uVar7 | 0x20;
                  }
                  if (((undefined1 *)&DAT_451b_0666)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0'
                     ) {
                    uVar7 = uVar7 | 0x40;
                  }
                }
              }
              if (piStack_a == (int *)0xffff) {
                *(undefined2 *)(param_5 + iStack_10 * 2) =
                     *(undefined2 *)(param_3 + (int)piStack_6 * 2);
                *(undefined2 *)(param_3 + (int)piStack_6 * 2) = 0xffff;
              }
              else {
                *(undefined2 *)(param_5 + iStack_10 * 2) =
                     *(undefined2 *)(param_3 + (int)piStack_a * 2);
                *(undefined2 *)(param_3 + (int)piStack_a * 2) = 0xffff;
                uStack_14 = uStack_14 + 1;
              }
              iStack_10 = iStack_10 + 1;
              uStack_c = 0xffff;
              piStack_a = (int *)0xffff;
              uStack_8 = 0xffff;
              piStack_6 = (int *)0xffff;
              piVar15 = param_2;
            }
            iVar13 = *(int *)(param_3 + (int)piVar14 * 2);
            piVar15 = piVar14;
          } while (iVar13 == -1);
          uVar5 = (uint)*(char *)(iVar13 * 0x16 + -0x7778);
          if (iStack_10 < (int)uStack_4) {
            cVar2 = ((undefined1 *)&DAT_451b_0669)[*(char *)(iVar13 * 0x16 + -0x777c) * 6];
            if (((uVar7 & 1) == 0) && (*(char *)(iVar13 * 0x16 + -0x777c) == '\x1c')) {
              uVar5 = uVar5 + 1000;
            }
            else if ((int)uStack_12 <= (int)*(char *)(iVar13 * 0x16 + -0x777a)) {
              if (((uVar7 & 0x10) == 0) &&
                 (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0')) {
                uVar5 = uVar5 + 900;
              }
              else if (iStack_16 == 0) {
                if (((uVar7 & 2) == 0) && (cVar2 == '\x02')) {
                  uVar5 = uVar5 + 800;
                }
                else if (((uVar7 & 4) == 0) && (cVar2 == '\x03')) {
                  uVar5 = uVar5 + 700;
                }
                else if (((uVar7 & 0x80) == 0) &&
                        (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] !=
                         '\0')) {
                  uVar5 = uVar5 + 600;
                }
                else if (((uVar7 & 8) == 0) && (cVar2 == '\x01')) {
                  uVar5 = uVar5 + 500;
                }
                else if (((uVar7 & 0x20) == 0) &&
                        (((undefined1 *)&DAT_451b_0665)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] !=
                         '\0')) {
                  uVar5 = uVar5 + 400;
                }
                else if (((uVar7 & 0x40) == 0) &&
                        (((undefined1 *)&DAT_451b_0666)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] !=
                         '\0')) {
                  uVar5 = uVar5 + 300;
                }
              }
            }
          }
          else {
            uVar7 = 0xfff;
          }
          if (((uVar7 & 1) != 0) && (*(char *)(iVar13 * 0x16 + -0x777c) == '\x1c')) {
            uVar5 = 1;
          }
          if (((uVar7 & 0x80) != 0) &&
             (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] != '\0')) {
            uVar5 = 2;
          }
          if (((int)*(char *)(iVar13 * 0x16 + -0x777a) < (int)uStack_12) ||
             (((iStack_16 != 0 &&
               (((undefined1 *)&DAT_451b_0664)[*(char *)(iVar13 * 0x16 + -0x777c) * 6] == '\0')) &&
              (*(char *)(iVar13 * 0x16 + -0x777c) != '\x1c')))) break;
          if ((int)uStack_c < (int)uVar5) {
            uStack_c = uVar5;
            piStack_a = piVar14;
          }
        }
      } while ((int)uVar5 <= (int)uStack_8);
    } while( true );
  }
  iVar13 = -1;
  if ((int)uVar7 < 0 || (uVar7 & 0x7fff) == 0) {
    iVar13 = 0;
LAB_5131_0c1b:
    while ((uStack_e == 0 &&
           (uVar5 = uStack_c + 1, bVar3 = (int)uStack_c < 0x32, uStack_c = uVar5, bVar3))) {
      piVar14 = (int *)thunk_FUN_7e8f_02bf(1,0x50066);
      iVar13 = thunk_FUN_7e8f_02bf(1,0x50092);
      if ((*(char *)((int)piVar14 + (int)DAT_451b_002a + iVar13 * 0x70 + 0x6120) == param_1) &&
         ((iVar11 = thunk_FUN_4c45_11f5(piVar14,iVar13,10), iVar11 == 0 &&
          (iVar11 = thunk_FUN_4c45_11f5(piVar14,iVar13,0xb), iVar11 == 0)))) {
        uStack_e = 1;
      }
    }
LAB_5131_0c2c:
    if (uStack_e == 0) {
      piVar14 = (int *)thunk_FUN_7e8f_02bf(1,0x50066);
      iVar13 = thunk_FUN_7e8f_02bf(1,0x50092);
      uStack_c = 0;
      while ((uStack_e == 0 && ((int)uStack_c < 0x32))) {
        uStack_c = uStack_c + 1;
        piVar14 = (int *)thunk_FUN_7e8f_02bf(1,0x50066);
        iVar13 = thunk_FUN_7e8f_02bf(1,0x50092);
        uVar16 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        if ((*(char *)((int)piVar14 + (int)DAT_451b_002a + iVar13 * 0x70 + 0x6120) != '\n') &&
           (*(char *)((int)piVar14 + (int)DAT_451b_002a + iVar13 * 0x70 + 0x6120) != '\v')) {
          uStack_e = 1;
        }
      }
    }
    *(int **)CONCAT22(param_3,param_2) = piVar14;
    *(int *)CONCAT22(param_5,param_4) = iVar13;
    iVar13 = DAT_4125_02d4 + 1;
    DAT_4125_02d4 = iVar13 % 0x10;
    return iVar13 / 0x10;
  }
  do {
    if ((uVar4 == 0) && (iVar11 = thunk_FUN_4c45_11f5(piVar14,iVar13 + 3,0xb), iVar11 == 0)) {
      uStack_e = 1;
    }
    do {
      if ((uStack_e != 0) ||
         (uVar5 = uStack_c + 1, bVar3 = 0x31 < (int)uStack_c, uStack_c = uVar5, bVar3)) {
        if (uStack_e != 0) goto LAB_5131_0c2c;
        uStack_c = 0;
        goto LAB_5131_0c1b;
      }
      piVar14 = (int *)thunk_FUN_7e8f_02bf(1,(int)piStack_6 - uStack_4);
      iVar13 = thunk_FUN_7e8f_02bf(1,(int)piStack_a - uStack_8);
    } while ((((*(char *)((int)piVar14 + (int)DAT_451b_002a + iVar13 * 0x70 + 0x6120) != param_1) ||
              (iVar11 = thunk_FUN_4c45_11f5(piVar14,iVar13,10), iVar11 != 0)) ||
             (iVar11 = thunk_FUN_4c45_11f5(piVar14,iVar13,0xb), iVar11 != 0)) ||
            ((iVar11 = thunk_FUN_4c45_11f5((int)piVar14 + -3,iVar13,0xb), iVar11 != 0 ||
             (iVar11 = thunk_FUN_4c45_11f5((int)piVar14 + 3,iVar13,0xb), iVar11 != 0))));
    uVar4 = thunk_FUN_4c45_11f5(piVar14,iVar13 + -3,0xb);
  } while( true );
}

