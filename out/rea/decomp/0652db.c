
void __cdecl16far FUN_6513_01ab(undefined4 param_1,int param_2,int param_3)

{
  byte *pbVar1;
  int *piVar2;
  char cVar3;
  int iVar4;
  undefined2 uVar5;
  int iVar6;
  undefined2 uVar7;
  undefined2 in_DX;
  undefined2 uVar8;
  bool bVar9;
  undefined4 uVar10;
  int local_4;
  
  iVar4 = thunk_FUN_5d9f_09ab();
  bVar9 = iVar4 == 0;
  uVar5 = thunk_FUN_824f_04b5(param_2,param_3);
  thunk_FUN_824f_0af3();
  if (bVar9) {
    FUN_22bf_07a5();
    thunk_FUN_67a7_1a41(*DAT_451b_1efe,((undefined2 *)DAT_451b_1efe)[1],0);
    FUN_6513_175b(uVar5);
    thunk_FUN_7d9f_01a9(0);
    FUN_22bf_0757();
  }
  thunk_FUN_7533_04f1((undefined2 *)DAT_451b_1efe,(int)((ulong)DAT_451b_1efe >> 0x10),3);
  uVar5 = (undefined2)((ulong)param_1 >> 0x10);
  iVar4 = (int)param_1;
  if (*(char *)(iVar4 + 0x18) != '\x05') {
    if (*(char *)(iVar4 + 0x1a) == '\0') {
      if (bVar9) {
        uVar7 = thunk_FUN_7e8f_04f0(0x32,0);
        FUN_6513_17c9(uVar7,in_DX);
        thunk_FUN_8027_10fb(0,0);
      }
    }
    else {
      if (bVar9) {
        uVar7 = thunk_FUN_7e8f_04f0(0x33,0,*(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223
                                    ,0x3c04,*(char *)(iVar4 + 0x1a) * 0x10 + 0xf67,0x3c04);
        FUN_1000_4944(0x5c38,0x4125,uVar7,in_DX);
        FUN_6513_17c9(0x5c38,0x4125);
        thunk_FUN_8027_10fb(0,0);
        thunk_FUN_7d9f_01a9(1);
      }
      iVar6 = FUN_6513_07ad(iVar4,uVar5);
      if (iVar6 != 0) {
        thunk_FUN_6d27_1244(DAT_3c04_0110,1,0xfffe,0,
                            *(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223,0x3c04);
        piVar2 = (int *)(DAT_3c04_0110 * 0x5a + 0x1167);
        *piVar2 = *piVar2 + 1;
        thunk_FUN_7938_03d9(2,0,0,(undefined2 *)DAT_451b_1efe,(int)((ulong)DAT_451b_1efe >> 0x10));
        for (iVar4 = 0; iVar4 < DAT_451b_08ce; iVar4 = iVar4 + 1) {
          if ((int)((undefined2 *)&DAT_451b_0c9c)[iVar4] < 8) {
            piVar2 = (int *)(DAT_3c04_0110 * 0x5a + 0x116b);
            *piVar2 = *piVar2 + 1;
          }
        }
        uVar5 = (undefined2)((ulong)DAT_451b_1efe >> 0x10);
        thunk_FUN_67a7_16cd((undefined2 *)DAT_451b_1efe,uVar5,*DAT_451b_1efe,
                            ((undefined2 *)DAT_451b_1efe)[1]);
        FUN_1b62_03be((undefined2 *)DAT_451b_1efe,(int)((ulong)DAT_451b_1efe >> 0x10));
        DAT_451b_1efe = (undefined2 *)0x0;
        thunk_FUN_824f_0000();
        if (!bVar9) {
          return;
        }
        uVar5 = thunk_FUN_7e8f_04f0(0x33,1);
        FUN_6513_17c9(uVar5,in_DX);
        FUN_6513_1812(0);
        return;
      }
      if (bVar9) {
        uVar7 = thunk_FUN_7e8f_04f0(0x33,2);
        FUN_6513_17c9(uVar7,in_DX);
        thunk_FUN_8027_10fb(0,0);
      }
      *(undefined1 *)(iVar4 + 0x1a) = 0;
    }
  }
  cVar3 = *(char *)(iVar4 + 0x18);
  if (cVar3 == '\x02') {
    if (bVar9) {
      uVar7 = thunk_FUN_7e8f_04f0(0x34,0,*(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223,
                                  0x3c04,*(char *)(iVar4 + 0x19) * 0x1d + 0xce9,0x3c04);
      FUN_1000_4944(0x5c38,0x4125,uVar7,in_DX);
      FUN_6513_17c9(0x5c38,0x4125);
      FUN_6513_1812(1);
      *(undefined1 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xcff) = 1;
      *(undefined2 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd00) = 0;
      *(int *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd02) = param_2;
      *(int *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd04) = param_3;
    }
    else {
      *(undefined1 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xcff) = 3;
      uVar7 = FUN_1b62_0044((undefined2 *)DAT_451b_1efe,(int)((ulong)DAT_451b_1efe >> 0x10));
      *(undefined2 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd00) = uVar7;
      *(undefined2 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd02) = 0;
      *(undefined2 *)(*(char *)(iVar4 + 0x19) * 0x1d + 0xd04) = 0;
    }
    thunk_FUN_6d27_1244(DAT_3c04_0110,6,(int)*(char *)(iVar4 + 0x19),0,
                        *(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223,0x3c04);
    pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
    *pbVar1 = *pbVar1 | 0x40;
    *(undefined1 *)(iVar4 + 0x18) = 0;
  }
  else {
    if (cVar3 == '\x04') {
      if (*(int *)(iVar4 + 0x1b) == 0) {
        iVar4 = thunk_FUN_7e8f_02bf(3,500,500);
      }
      else {
        iVar4 = thunk_FUN_7e8f_02bf(3,1000,1000);
      }
      pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
      *pbVar1 = *pbVar1 | 0x40;
      piVar2 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
      *piVar2 = *piVar2 + iVar4;
      if (bVar9) {
        uVar5 = thunk_FUN_7e8f_04f0(0x35,0,*(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223
                                    ,0x3c04,iVar4);
        FUN_1000_4944(0x5c38,0x4125,uVar5,in_DX);
        FUN_6513_17c9(0x5c38,0x4125);
        FUN_6513_1812(0);
      }
      cVar3 = *(char *)((undefined2 *)DAT_451b_1efe + 5);
      uVar5 = 0x66;
    }
    else {
      if (cVar3 != '\x05') {
        return;
      }
      pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
      *pbVar1 = *pbVar1 | 0x40;
      local_4 = thunk_FUN_7e8f_02bf(1,2,0);
      if (*(int *)(iVar4 + 0x1b) != 0) {
        local_4 = local_4 + 2;
      }
      uVar7 = (undefined2)((ulong)DAT_451b_1efe >> 0x10);
      if (local_4 < 2) {
        uVar10 = FUN_4058_0089(0x40c1,(int)*(char *)(iVar4 + 0x1a),
                               *(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223,0x3c04);
        uVar8 = (undefined2)((ulong)uVar10 >> 0x10);
        uVar7 = thunk_FUN_7e8f_04f0(0x36,0,uVar10);
        FUN_1000_4944(0x5c38,0x4125,uVar7,uVar8);
      }
      else {
        uVar10 = FUN_4058_0089(0x40c1,(int)*(char *)(iVar4 + 0x1a),
                               *(char *)((undefined2 *)DAT_451b_1efe + 5) * 0x14 + 0x223,0x3c04);
        uVar8 = (undefined2)((ulong)uVar10 >> 0x10);
        uVar7 = thunk_FUN_7e8f_04f0(0x36,1,local_4,uVar10);
        FUN_1000_4944(0x5c38,0x4125,uVar7,uVar8);
      }
      if (bVar9) {
        FUN_6513_17c9(0x5c38,0x4125);
        FUN_6513_1812(0);
      }
      pbVar1 = (byte *)(param_3 * 0xe0 + param_2 * 2 + 1);
      *pbVar1 = *pbVar1 | 0x40;
      cVar3 = *(char *)(iVar4 + 0x1a);
      for (iVar4 = 0; iVar4 < local_4; iVar4 = iVar4 + 1) {
        uVar5 = FUN_6513_12e6((int)cVar3,param_2,param_3);
        FUN_1b62_02e2(uVar5,uVar8);
      }
      cVar3 = *(char *)((undefined2 *)DAT_451b_1efe + 5);
      uVar5 = 100;
    }
    thunk_FUN_6d27_1244(DAT_3c04_0110,6,uVar5,0,cVar3 * 0x14 + 0x223,0x3c04);
  }
  return;
}

