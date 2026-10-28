
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_6a62_008b(int param_1,int param_2)

{
  bool bVar1;
  char cVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  undefined2 unaff_SS;
  char local_92 [32];
  undefined1 local_72 [32];
  int local_52;
  int local_50;
  int local_4e;
  int local_4c;
  int local_4a;
  int local_48;
  int local_46;
  int local_44;
  int local_40;
  int local_3e;
  char local_35 [9];
  int local_2c;
  int local_2a;
  int local_28;
  int local_26;
  int local_24;
  int local_22;
  int local_20;
  int local_1e;
  int local_1c;
  int local_1a;
  int local_18;
  int local_16;
  int local_14;
  int local_12;
  int local_10;
  int local_e;
  int local_c;
  int local_a;
  int local_8;
  undefined2 local_6;
  undefined2 local_4;
  
  local_e = 0;
  local_12 = 0;
  local_14 = 0;
  local_18 = 0;
  local_1a = 0;
  bVar1 = false;
  local_1e = 0;
  local_20 = 0;
  local_22 = 0;
  local_24 = 0;
  local_26 = 0;
  local_28 = 0;
  local_2a = 0;
  local_2c = FUN_6a62_0000(param_1,param_2);
  DAT_451b_029a = (char)DAT_3c04_0110;
  DAT_451b_029b = *(byte *)(param_2 * 0xe0 + param_1 * 2 + 1) & 0xf;
  if (DAT_451b_029b < 8) {
    local_c = (int)(char)DAT_451b_029b;
  }
  else {
    local_c = 8;
  }
  if (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\n') {
    DAT_451b_0291 = '\x04';
    iVar7 = 0;
    while ((iVar7 < DAT_3c04_157b &&
           (((*(int *)(iVar7 * 0x41 + 0x157d) != param_1 &&
             (*(int *)(iVar7 * 0x41 + 0x157d) != param_1 + -1)) ||
            ((*(int *)(iVar7 * 0x41 + 0x157f) != param_2 &&
             (*(int *)(iVar7 * 0x41 + 0x157f) != param_2 + -1))))))) {
      iVar7 = iVar7 + 1;
    }
    iVar6 = 4;
    while (iVar4 = iVar6 + -1, iVar6 != 0) {
      ((undefined2 *)&DAT_451b_0292)[iVar4] =
           *(undefined2 *)
            ((*(int *)(iVar7 * 0x41 + 0x157f) + *(int *)(iVar4 * 2 + 0xd4e)) * 0xe0 +
            (*(int *)(iVar7 * 0x41 + 0x157d) + *(int *)(iVar4 * 2 + 0xd46)) * 2);
      ((undefined2 *)&DAT_451b_0289)[iVar4] =
           *(int *)(iVar7 * 0x41 + 0x157d) + *(int *)(iVar4 * 2 + 0xd46);
      ((undefined2 *)&DAT_451b_0281)[iVar4] =
           *(int *)(iVar7 * 0x41 + 0x157f) + *(int *)(iVar4 * 2 + 0xd4e);
      iVar6 = iVar4;
    }
    _DAT_451b_027d = CONCAT22(0x3c04,iVar7 * 0x41 + 0x157d);
  }
  else {
    DAT_451b_0291 = '\x01';
    DAT_451b_0292 = *(uint *)(param_2 * 0xe0 + param_1 * 2);
    DAT_451b_0289 = param_1;
    DAT_451b_0281 = param_2;
    _DAT_451b_027d = 0;
  }
  DAT_451b_0364 = (char)DAT_451b_1e9e;
  if (DAT_4125_2bda == 0) {
    DAT_451b_0364 = '\x01';
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
    ((undefined1 *)&DAT_451b_02c4)[iVar7] = 1;
  }
  if (DAT_4125_2bda == 0) {
    DAT_451b_0366 = DAT_451b_1f02;
  }
  else {
    for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
      uVar8 = ((undefined2 *)&DAT_451b_1ede)[iVar7 * 2];
      *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar7 * 4 + 2) =
           *(undefined2 *)((undefined *)&DAT_451b_1ee0 + iVar7 * 4);
      *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar7) = uVar8;
    }
  }
  DAT_451b_0365 = '\0';
  iVar7 = DAT_3c04_0181;
  if (DAT_451b_0291 == '\x04') {
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if ((((*(char *)(iVar6 * 0x16 + -0x777b) != (char)DAT_3c04_0110) &&
           (DAT_451b_0289 <= *(int *)(iVar6 * 0x16 + -0x7780))) &&
          (*(int *)(iVar6 * 0x16 + -0x7780) <= DAT_451b_0289 + 1)) &&
         ((DAT_451b_0281 <= *(int *)(iVar6 * 0x16 + -0x777e) &&
          (*(int *)(iVar6 * 0x16 + -0x777e) <= DAT_451b_0281 + 1)))) {
        iVar4 = (int)DAT_451b_0365;
        ((undefined2 *)&DAT_451b_0388)[iVar4 * 2] = 0x2e1d;
        ((undefined2 *)&DAT_451b_0386)[iVar4 * 2] = iVar6 * 0x16 + -0x7780;
        DAT_451b_0365 = DAT_451b_0365 + '\x01';
      }
    }
  }
  else {
    while (iVar6 = iVar7 + -1, iVar7 != 0) {
      iVar7 = iVar6;
      if (((*(char *)(iVar6 * 0x16 + -0x777b) != (char)DAT_3c04_0110) &&
          (*(int *)(iVar6 * 0x16 + -0x7780) == DAT_451b_0289)) &&
         (*(int *)(iVar6 * 0x16 + -0x777e) == DAT_451b_0281)) {
        iVar4 = (int)DAT_451b_0365;
        ((undefined2 *)&DAT_451b_0388)[iVar4 * 2] = 0x2e1d;
        ((undefined2 *)&DAT_451b_0386)[iVar4 * 2] = iVar6 * 0x16 + -0x7780;
        DAT_451b_0365 = DAT_451b_0365 + '\x01';
      }
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    ((undefined1 *)&DAT_451b_02cc)[iVar7] = 1;
  }
  if (((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x02') ||
      (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x03')) ||
     (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\x06')) {
    bVar1 = true;
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    local_92[iVar7] =
         *(char *)(local_c * 0x1d +
                   (int)*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 4
                                 ) + 0x60b);
    if ((local_28 == 0) &&
       (*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 4) == '\x1c')) {
      local_28 = 1;
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
    local_35[iVar7 + 1] =
         *(char *)(DAT_451b_029a * 0x1d +
                   (int)*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 4) + 0x60b);
    if ((local_2a == 0) && (*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 4) == '\x1c')) {
      local_2a = 1;
    }
  }
  for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
    if ((((bVar1) &&
         (uVar8 = (undefined2)
                  ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) >> 0x10),
         (*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 0xc) & 0x1000)
         == 0)) &&
        (((undefined1 *)&DAT_451b_0664)
         [*(char *)(((undefined2 *)&DAT_451b_0386)[iVar7 * 2] + 4) * 6] != '\0')) && (local_28 != 0)
       ) {
      local_92[iVar7] = local_92[iVar7] + 'P';
      break;
    }
  }
  iVar7 = 0;
  do {
    if (DAT_451b_0364 <= iVar7) {
LAB_6a62_05f1:
      for (iVar7 = 1; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
        iVar6 = iVar7;
        if (local_35[iVar7 + 1] < local_35[iVar7]) {
          for (; (0 < iVar6 && (local_35[iVar6 + 1] < local_35[iVar6])); iVar6 = iVar6 + -1) {
            local_4 = *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar6 * 4 + 2);
            local_6 = *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar6);
            uVar8 = *(undefined2 *)(iVar6 * 4 + 0x42c2);
            *(undefined2 *)((int)(undefined4 *)&DAT_451b_0366 + iVar6 * 4 + 2) =
                 *(undefined2 *)((undefined1 *)&DAT_451b_0364 + iVar6 * 4);
            *(undefined2 *)((undefined4 *)&DAT_451b_0366 + iVar6) = uVar8;
            *(undefined2 *)((undefined1 *)&DAT_451b_0364 + iVar6 * 4) = local_4;
            *(undefined2 *)(iVar6 * 4 + 0x42c2) = local_6;
            cVar2 = local_35[iVar6 + 1];
            local_35[iVar6 + 1] = local_35[iVar6];
            local_35[iVar6] = cVar2;
          }
        }
      }
      for (iVar7 = 1; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
        iVar6 = iVar7;
        if (local_92[iVar7] < local_92[iVar7 + -1]) {
          for (; (0 < iVar6 && (local_92[iVar6] < local_92[iVar6 + -1])); iVar6 = iVar6 + -1) {
            local_4 = ((undefined2 *)&DAT_451b_0388)[iVar6 * 2];
            local_6 = ((undefined2 *)&DAT_451b_0386)[iVar6 * 2];
            uVar8 = *(undefined2 *)((undefined4 *)&DAT_451b_0382 + iVar6);
            ((undefined2 *)&DAT_451b_0388)[iVar6 * 2] =
                 *(undefined2 *)((int)(undefined4 *)&DAT_451b_0382 + iVar6 * 4 + 2);
            ((undefined2 *)&DAT_451b_0386)[iVar6 * 2] = uVar8;
            *(undefined2 *)((int)(undefined4 *)&DAT_451b_0382 + iVar6 * 4 + 2) = local_4;
            *(undefined2 *)((undefined4 *)&DAT_451b_0382 + iVar6) = local_6;
            cVar2 = local_92[iVar6];
            local_92[iVar6] = local_92[iVar6 + -1];
            local_92[iVar6 + -1] = cVar2;
          }
        }
      }
      iVar7 = (int)DAT_451b_0364;
      while (iVar7 != 0) {
        *(undefined1 *)(iVar7 + 0x4273) = 1;
        *(undefined1 *)(iVar7 + 0x424b) =
             *(undefined1 *)((int)((undefined4 *)&DAT_451b_0366)[iVar7 + -1] + 4);
        iVar7 = iVar7 + -1;
      }
      iVar7 = (int)DAT_451b_0365;
      while (iVar7 != 0) {
        ((undefined1 *)&DAT_451b_031b)[iVar7] = 1;
        ((undefined1 *)&DAT_451b_02f3)[iVar7] =
             *(undefined1 *)
              ((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + (iVar7 + -1) * 2) + 4);
        iVar7 = iVar7 + -1;
      }
      iVar7 = 0;
      local_10 = 0;
      uVar8 = 0x6a62;
      for (iVar6 = 0; iVar6 < DAT_451b_0364; iVar6 = iVar6 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02ec)[iVar6],local_72);
        if (((undefined1 *)&DAT_451b_02ec)[iVar6] == '\x1c') {
          iVar4 = (int)*(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar6] + 8);
          iVar5 = FUN_6a62_0d1a((int)((undefined4 *)&DAT_451b_0366)[iVar6],
                                (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar6] >> 0x10));
          iVar4 = iVar4 + iVar5;
          if ((iVar7 < iVar4) && (iVar7 = iVar4, 9 < iVar4)) {
            iVar7 = 9;
          }
        }
        if (local_3e == 1) {
          local_1e = 1;
        }
        if (local_3e == 2) {
          local_20 = 1;
        }
        if (local_3e == 3) {
          local_22 = 1;
        }
        iVar4 = local_1a;
        if ((local_40 != 0) && (iVar4 = local_40, local_1a < local_40)) {
          iVar4 = local_1a;
        }
        local_1a = iVar4;
        iVar4 = local_12;
        if (((local_2c == 0) && (local_4a != 0)) && (iVar4 = local_4a, local_4a < local_12)) {
          iVar4 = local_12;
        }
        local_12 = iVar4;
        iVar4 = local_12;
        if (((local_2c == 1) && (local_48 != 0)) && (iVar4 = local_48, local_48 < local_12)) {
          iVar4 = local_12;
        }
        local_12 = iVar4;
        iVar4 = local_12;
        if (((local_2c == 2) && (local_46 != 0)) && (iVar4 = local_46, local_46 < local_12)) {
          iVar4 = local_12;
        }
        local_12 = iVar4;
        iVar4 = local_12;
        if (((local_2c == 3) && (local_44 != 0)) && (iVar4 = local_44, local_44 < local_12)) {
          iVar4 = local_12;
        }
        local_12 = iVar4;
        if (((undefined1 *)&DAT_451b_02ec)[iVar6] == '\x1c') {
          iVar4 = FUN_6a62_0d71((int)((undefined4 *)&DAT_451b_0366)[iVar6],
                                (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar6] >> 0x10));
          local_10 = local_10 + iVar4;
        }
        uVar8 = 0x4058;
      }
      local_16 = local_10 + *(int *)(iVar7 * 2 + 0xce4);
      iVar7 = 0;
      local_10 = 0;
      for (iVar6 = 0; iVar6 < DAT_451b_0365; iVar6 = iVar6 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02f4)[iVar6],local_72);
        if (((undefined1 *)&DAT_451b_02f4)[iVar6] == '\x1c') {
          iVar4 = (int)*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2) + 8)
          ;
          iVar5 = FUN_6a62_0d1a((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2),
                                (int)((ulong)*(undefined4 *)
                                              ((undefined2 *)&DAT_451b_0386 + iVar6 * 2) >> 0x10));
          iVar4 = iVar4 + iVar5;
          if ((iVar7 < iVar4) && (iVar7 = iVar4, 9 < iVar4)) {
            iVar7 = 9;
          }
        }
        if (local_3e == 2) {
          local_24 = 1;
        }
        if (local_3e == 3) {
          local_26 = 1;
        }
        iVar4 = local_14;
        if ((local_40 != 0) && (iVar4 = local_40, local_14 < local_40)) {
          iVar4 = local_14;
        }
        local_14 = iVar4;
        iVar4 = local_18;
        if (((local_2c == 0) && (local_4a != 0)) && (iVar4 = local_4a, local_4a < local_18)) {
          iVar4 = local_18;
        }
        local_18 = iVar4;
        iVar4 = local_18;
        if (((local_2c == 1) && (local_48 != 0)) && (iVar4 = local_48, local_48 < local_18)) {
          iVar4 = local_18;
        }
        local_18 = iVar4;
        iVar4 = local_18;
        if (((local_2c == 2) && (local_46 != 0)) && (iVar4 = local_46, local_46 < local_18)) {
          iVar4 = local_18;
        }
        local_18 = iVar4;
        iVar4 = local_18;
        if (((local_2c == 3) && (local_44 != 0)) && (iVar4 = local_44, local_44 < local_18)) {
          iVar4 = local_18;
        }
        local_18 = iVar4;
        if (((undefined1 *)&DAT_451b_02f4)[iVar6] == '\x1c') {
          iVar4 = FUN_6a62_0d71((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar6 * 2),
                                (int)((ulong)*(undefined4 *)
                                              ((undefined2 *)&DAT_451b_0386 + iVar6 * 2) >> 0x10));
          local_10 = local_10 + iVar4;
        }
        uVar8 = 0x4058;
      }
      if ((local_1e == 0) && (local_2c == 0)) {
        if ((DAT_451b_0292 >> 8 & 0x20) == 0) {
          if (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) == '\v') {
            local_e = 2;
          }
          else {
            local_e = (int)*(char *)((int)_DAT_451b_027d + 0x14);
          }
        }
        else {
          local_e = 1;
        }
        if (DAT_451b_029b == 0xf) {
          local_e = local_e / 2;
        }
      }
      local_1c = local_10 + *(int *)(iVar7 * 2 + 0xce4);
      local_8 = 0;
      if (local_24 == 0) {
        local_8 = local_16;
      }
      if (local_26 == 0) {
        local_8 = local_8 + local_12;
      }
      if (DAT_3c04_0112 < local_8) {
        local_8 = DAT_3c04_0112;
      }
      local_8 = local_8 + local_14;
      local_a = 0;
      if (local_20 == 0) {
        local_a = local_1c;
      }
      if (local_22 == 0) {
        local_a = local_a + local_18;
      }
      if (local_1e == 0) {
        local_a = local_a + local_e;
      }
      if (DAT_3c04_0112 < local_a) {
        local_a = DAT_3c04_0112;
      }
      local_a = local_a + local_1a;
      for (iVar7 = 0; iVar7 < DAT_451b_0364; iVar7 = iVar7 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02ec)[iVar7],local_72);
        ((undefined1 *)&DAT_451b_029c)[iVar7] = 0;
        if (((*(uint *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 0xc) & 0x1000) == 0) ||
           ((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x02' &&
            (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x03')))) {
          ((undefined1 *)&DAT_451b_033c)[iVar7] =
               *(char *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 8) + (char)local_8;
          if (((undefined1 *)&DAT_451b_02ec)[iVar7] == '\x1c') {
            cVar2 = FUN_6a62_0d1a((int)((undefined4 *)&DAT_451b_0366)[iVar7],
                                  (int)((ulong)((undefined4 *)&DAT_451b_0366)[iVar7] >> 0x10));
            ((undefined1 *)&DAT_451b_033c)[iVar7] = ((undefined1 *)&DAT_451b_033c)[iVar7] + cVar2;
          }
          if ((local_2c == 0) && (local_52 != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)local_52;
          }
          if ((local_2c == 1) && (local_50 != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)local_50;
          }
          if ((local_2c == 2) && (local_4e != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)local_4e;
          }
          if ((local_2c == 3) && (local_4c != 0)) {
            ((undefined1 *)&DAT_451b_033c)[iVar7] =
                 ((undefined1 *)&DAT_451b_033c)[iVar7] + (char)local_4c;
          }
          if ((char)((undefined1 *)&DAT_451b_033c)[iVar7] < '\x10') {
            uVar3 = ((undefined1 *)&DAT_451b_033c)[iVar7];
          }
          else {
            uVar3 = 0xf;
          }
          ((undefined1 *)&DAT_451b_033c)[iVar7] = uVar3;
        }
        else {
          ((undefined1 *)&DAT_451b_033c)[iVar7] = 4;
          ((undefined1 *)&DAT_451b_029c)[iVar7] = 1;
        }
        uVar8 = 0x4058;
      }
      for (iVar7 = 0; iVar7 < DAT_451b_0365; iVar7 = iVar7 + 1) {
        thunk_FUN_705a_14ac(uVar8,(int)(char)((undefined1 *)&DAT_451b_02f4)[iVar7],local_72);
        ((undefined1 *)&DAT_451b_02a4)[iVar7] = 0;
        if (((*(uint *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 0xc) &
             0x1000) == 0) ||
           ((*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x02' &&
            (*(char *)(*(byte *)(param_2 * 0xe0 + param_1 * 2) + 0x710) != '\x03')))) {
          ((undefined1 *)&DAT_451b_0344)[iVar7] =
               *(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2) + 8) +
               (char)local_a;
          if (((undefined1 *)&DAT_451b_02f4)[iVar7] == '\x1c') {
            cVar2 = FUN_6a62_0d1a((int)*(undefined4 *)((undefined2 *)&DAT_451b_0386 + iVar7 * 2),
                                  (int)((ulong)*(undefined4 *)
                                                ((undefined2 *)&DAT_451b_0386 + iVar7 * 2) >> 0x10))
            ;
            ((undefined1 *)&DAT_451b_0344)[iVar7] = ((undefined1 *)&DAT_451b_0344)[iVar7] + cVar2;
          }
          if ((local_2c == 0) && (local_52 != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)local_52;
          }
          if ((local_2c == 1) && (local_50 != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)local_50;
          }
          if ((local_2c == 2) && (local_4e != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)local_4e;
          }
          if ((local_2c == 3) && (local_4c != 0)) {
            ((undefined1 *)&DAT_451b_0344)[iVar7] =
                 ((undefined1 *)&DAT_451b_0344)[iVar7] + (char)local_4c;
          }
          if ((char)((undefined1 *)&DAT_451b_0344)[iVar7] < '\x10') {
            uVar3 = ((undefined1 *)&DAT_451b_0344)[iVar7];
          }
          else {
            uVar3 = 0xf;
          }
          ((undefined1 *)&DAT_451b_0344)[iVar7] = uVar3;
        }
        else {
          ((undefined1 *)&DAT_451b_0344)[iVar7] = 4;
          ((undefined1 *)&DAT_451b_02a4)[iVar7] = 1;
        }
        uVar8 = 0x4058;
      }
      return;
    }
    if (((bVar1) &&
        (uVar8 = (undefined2)((ulong)((undefined4 *)&DAT_451b_0366)[iVar7] >> 0x10),
        (*(uint *)((int)((undefined4 *)&DAT_451b_0366)[iVar7] + 0xc) & 0x1000) == 0)) &&
       ((((undefined1 *)&DAT_451b_0664)
         [*(char *)(*(int *)((undefined4 *)&DAT_451b_0366 + iVar7) + 4) * 6] != '\0' &&
        (local_2a != 0)))) {
      local_35[iVar7 + 1] = local_35[iVar7 + 1] + 'P';
      goto LAB_6a62_05f1;
    }
    iVar7 = iVar7 + 1;
  } while( true );
}

