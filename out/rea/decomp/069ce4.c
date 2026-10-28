
void __cdecl16far FUN_67a7_2274(int param_1)

{
  char cVar1;
  bool bVar2;
  bool bVar3;
  char cVar4;
  undefined2 uVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  undefined2 uVar11;
  undefined4 uVar12;
  undefined2 local_8;
  undefined2 uStack_6;
  
  iVar9 = 0;
  bVar2 = false;
  for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
    if (((undefined2 *)&DAT_451b_1ede)[iVar6 * 2] != 0 ||
        *(int *)((undefined *)&DAT_451b_1ee0 + iVar6 * 4) != 0) {
      uVar11 = (undefined2)
               ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar6 * 2) >> 0x10);
      if ((*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar6 * 2) + 4) != '\x1c')
         && (((undefined1 *)&DAT_451b_0668)
             [*(char *)(((undefined2 *)&DAT_451b_1ede)[iVar6 * 2] + 4) * 6] == '\0')) {
        iVar9 = iVar9 + 1;
      }
      if ((*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar6 * 2) + 0xc) & 0x1000)
          != 0) {
        bVar2 = true;
      }
    }
  }
  iVar10 = 0;
  iVar6 = DAT_3c04_0181;
  while (iVar7 = iVar6 + -1, iVar6 != 0) {
    iVar6 = iVar7;
    if ((((*(char *)(iVar7 * 0x16 + -0x777b) == DAT_3c04_0110) &&
         (*(char *)(iVar7 * 0x16 + -0x777c) != '\x1c')) &&
        (((undefined1 *)&DAT_451b_0668)[*(char *)(iVar7 * 0x16 + -0x777c) * 6] == '\0')) &&
       ('\0' < *(char *)(iVar7 * 0x16 + -0x7776))) {
      iVar10 = iVar10 + 1;
    }
  }
  if (iVar10 * -5 + 0x28 < 0xc) {
    iVar6 = 0xc;
  }
  else {
    iVar6 = iVar10 * -5 + 0x28;
  }
  if ((DAT_451b_0364 < '\x02') || (DAT_451b_0365 < '\x02')) {
    bVar3 = false;
  }
  else {
    bVar3 = true;
  }
  iVar10 = thunk_FUN_8027_225b();
  if (((iVar10 < 0x14) && (!bVar3)) && (('\0' < DAT_451b_0365 && ('\x03' < DAT_451b_0344)))) {
    bVar3 = true;
  }
  if ((((!bVar2) && (param_1 == 1)) && (bVar3)) &&
     (((0 < iVar9 && (iVar9 = thunk_FUN_7e8f_02bf(), iVar9 < iVar6)) && (DAT_451b_1efe != 0)))) {
    iVar9 = thunk_FUN_7e8f_02bf();
    iVar6 = 0;
    for (iVar10 = 0; iVar10 < 8; iVar10 = iVar10 + 1) {
      iVar7 = iVar6;
      if (((((undefined2 *)&DAT_451b_1ede)[iVar10 * 2] != 0 ||
            *(int *)((undefined *)&DAT_451b_1ee0 + iVar10 * 4) != 0) &&
          (uVar11 = (undefined2)
                    ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar10 * 2) >> 0x10),
          *(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar10 * 2) + 4) != '\x1c'))
         && ((((undefined1 *)&DAT_451b_0668)
              [*(char *)(((undefined2 *)&DAT_451b_1ede)[iVar10 * 2] + 4) * 6] == '\0' &&
             (iVar7 = iVar6 + 1, iVar6 == iVar9)))) {
        _local_8 = CONCAT22(*(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar10 * 4),
                            ((undefined2 *)&DAT_451b_1ede)[iVar10 * 2]);
        break;
      }
      iVar6 = iVar7;
    }
    uVar11 = (undefined2)((ulong)_local_8 >> 0x10);
    iVar6 = (int)_local_8;
    if (*(char *)(iVar6 + 10) < '\x04') {
      *(char *)(iVar6 + 10) = *(char *)(iVar6 + 10) + '\x01';
      bVar2 = '\x0e' < *(char *)(iVar6 + 8);
      if (bVar2) {
        *(char *)(iVar6 + 6) = *(char *)(iVar6 + 6) + '\x01';
      }
      else {
        FUN_1b62_0005();
      }
      uVar8 = 0x3c04;
      if (*(int *)(DAT_451b_029a * 2 + 0xd0) == 0) {
        thunk_FUN_7d9f_0000();
        FUN_22bf_07a5();
        thunk_FUN_54e4_0000();
        thunk_FUN_85d0_08be((int)*(char *)(iVar6 + 4),(int)*(char *)(iVar6 + 5),0x342a,0x4125,0xb0,
                            0x9b,0,0,0);
        thunk_FUN_7875_06ae(0xf0002,0x30000);
        uVar5 = thunk_FUN_7e8f_04f0(0xffff009e);
        thunk_FUN_7e8f_00bf(0x9b00d8,uVar5,uVar8);
        uVar12 = FUN_4058_0089(0x40c1,(int)*(char *)(iVar6 + 4));
        uVar5 = (undefined2)((ulong)uVar12 >> 0x10);
        uVar8 = thunk_FUN_7e8f_04f0(0x9f,uVar12);
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar8,uVar5);
        thunk_FUN_7e8f_00bf(0xaf00d8,(undefined1 *)&DAT_451b_1d28,0x4125);
        uVar8 = thunk_FUN_7e8f_04f0(0xffff00a0);
        thunk_FUN_7e8f_00bf(0xc300b0,uVar8,uVar5);
        uVar8 = thunk_FUN_7e8f_04f0(0xa1,*(char *)(iVar6 + 10) + -1);
        thunk_FUN_7e8f_00bf(0xd700b0,uVar8,uVar5);
        if (bVar2) {
          uVar8 = thunk_FUN_7e8f_04f0(0x100a2);
          thunk_FUN_7e8f_00bf(0xf500b0,uVar8,uVar5);
          cVar1 = *(char *)(iVar6 + 6);
          cVar4 = *(char *)(iVar6 + 6);
        }
        else {
          uVar8 = thunk_FUN_7e8f_04f0(0xa2);
          thunk_FUN_7e8f_00bf(0xf500b0,uVar8,uVar5);
          cVar1 = *(char *)(iVar6 + 8);
          cVar4 = *(char *)(iVar6 + 8);
        }
        uVar11 = thunk_FUN_7e8f_04f0(0x200a2,cVar4 + -1,(int)cVar1);
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar11,uVar5);
        thunk_FUN_7e8f_00bf(0x10900b0,(undefined1 *)&DAT_451b_1d28,0x4125);
        FUN_22bf_0757();
        thunk_FUN_8027_10fb(0);
        thunk_FUN_54e4_069c();
        thunk_FUN_7d9f_0000();
      }
    }
  }
  return;
}

