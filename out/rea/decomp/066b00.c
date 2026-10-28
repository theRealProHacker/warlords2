
void __cdecl16far FUN_66b0_0000(void)

{
  byte *pbVar1;
  bool bVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  int unaff_DI;
  undefined2 unaff_SS;
  int local_66 [11];
  undefined2 uStack_50;
  undefined2 uStack_4e;
  undefined2 local_16;
  undefined2 local_14;
  undefined2 local_12;
  undefined2 local_10;
  undefined2 local_e;
  undefined2 local_c;
  int local_a;
  int local_8;
  int local_6;
  int local_4;
  
  local_a = (DAT_3c04_080f << 1) / 10;
  local_c = 4;
  local_e = 3;
  local_10 = 2;
  local_12 = 3;
  local_14 = 5;
  local_16 = 3;
  FUN_66b0_091e();
  FUN_66b0_04ef();
  iVar4 = thunk_FUN_7e8f_02bf(2,0x10003);
  local_8 = local_a;
  if (iVar4 < local_a) {
    local_8 = iVar4;
  }
  for (local_4 = 0; local_4 < DAT_3c04_080f; local_4 = local_4 + 1) {
    pbVar1 = (byte *)(*(int *)(local_4 * 0x1f + 0x813) * 0xe0 + *(int *)(local_4 * 0x1f + 0x811) * 2
                     + 1);
    *pbVar1 = *pbVar1 & 0xbf;
    local_66[local_4] = 0;
    if (*(char *)(local_4 * 0x1f + 0x829) == '\x01') {
      local_66[local_4] = 1;
    }
  }
  for (local_4 = DAT_3c04_080f; local_4 < 0x28; local_4 = local_4 + 1) {
    local_66[local_4] = 1;
  }
  iVar4 = thunk_FUN_7e8f_02bf(1);
  iVar4 = DAT_3c04_080f / 3 + iVar4 + 8;
  if (0x16 < iVar4) {
    iVar4 = 0x16;
  }
  for (local_4 = 8; local_4 < iVar4; local_4 = local_4 + 1) {
    if ((local_4 < local_8 + 8) || (local_a + 8 <= local_4)) {
      local_6 = 0;
      while (local_6 == 0) {
        unaff_DI = thunk_FUN_7e8f_02bf(1,DAT_3c04_080f);
        FUN_1000_1e79();
        iVar5 = FUN_66b0_08f4();
        if ((iVar5 == 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) != 0)) {
          uStack_4e = 0x1000;
          uStack_50 = 0x6cd1;
          FUN_1000_1e79();
          uStack_4e = 0x1000;
          uStack_50 = 0x6cd6;
          iVar5 = FUN_66b0_08f4();
          if (((iVar5 != 0) || (*(int *)(unaff_DI * 0x1f + 0x82c) == 0)) &&
             (local_66[unaff_DI] == 0)) {
            local_6 = 1;
            local_66[unaff_DI] = 1;
          }
        }
      }
      *(undefined1 *)(local_4 * 0x1d + 0xcff) = 2;
      *(int *)(local_4 * 0x1d + 0xd00) = unaff_DI;
      *(undefined1 *)(unaff_DI * 0x1f + 0x829) = 2;
      *(undefined1 *)(unaff_DI * 0x1f + 0x82a) = (undefined1)local_4;
    }
    else {
      *(undefined1 *)(local_4 * 0x1d + 0xcff) = 0;
    }
  }
  while (local_4 = iVar4, local_4 < 0x16) {
    *(undefined1 *)(local_4 * 0x1d + 0xcff) = 0;
    iVar4 = local_4 + 1;
  }
  local_4 = 0;
  do {
    if (DAT_3c04_080f <= local_4) {
      local_4 = 0;
      do {
        if (DAT_3c04_080f <= local_4) {
          return;
        }
        if (*(char *)(local_4 * 0x1f + 0x829) == '\x01') {
          *(undefined1 *)(local_4 * 0x1f + 0x82b) = 0;
        }
        else {
          if (*(char *)(local_4 * 0x1f + 0x829) == '\x05') {
            if (*(int *)(local_4 * 0x1f + 0x82c) == 0) {
              bVar2 = true;
              for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
                if ((*(int *)(iVar4 * 2 + 0x137) != 0) &&
                   (iVar5 = FUN_1a8b_0acc(*(undefined2 *)(iVar4 * 0x14 + 0x189),
                                          *(undefined2 *)(iVar4 * 0x14 + 0x18b),
                                          *(undefined2 *)(local_4 * 0x1f + 0x811),
                                          *(undefined2 *)(local_4 * 0x1f + 0x813)), iVar5 < 0xf)) {
                  bVar2 = false;
                  break;
                }
              }
              if (bVar2) {
                iVar4 = thunk_FUN_7e8f_02bf(1);
                uVar3 = *(undefined1 *)(iVar4 + 0xc9e);
              }
              else {
                iVar4 = thunk_FUN_7e8f_02bf(1);
                uVar3 = *(undefined1 *)(iVar4 + 0xca2);
              }
            }
            else {
              iVar4 = thunk_FUN_7e8f_02bf(1);
              uVar3 = *(undefined1 *)(iVar4 + 0xc9a);
            }
          }
          else {
            uVar3 = thunk_FUN_7e8f_02bf(1);
          }
          *(undefined1 *)(local_4 * 0x1f + 0x82b) = uVar3;
        }
        local_4 = local_4 + 1;
      } while( true );
    }
    if (local_66[local_4] == 0) {
      if (*(int *)(local_4 * 0x1f + 0x82c) == 0) {
        bVar2 = true;
        for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
          if ((*(int *)(iVar4 * 2 + 0x137) != 0) &&
             (iVar5 = FUN_1a8b_0acc(*(undefined2 *)(iVar4 * 0x14 + 0x189),
                                    *(undefined2 *)(iVar4 * 0x14 + 0x18b),
                                    *(undefined2 *)(local_4 * 0x1f + 0x811),
                                    *(undefined2 *)(local_4 * 0x1f + 0x813)), iVar5 < 0xf)) {
            bVar2 = false;
            break;
          }
        }
        if (bVar2) {
          iVar4 = thunk_FUN_7e8f_02bf(1);
          uVar3 = *(undefined1 *)(iVar4 + 0xca7);
        }
        else {
          iVar4 = thunk_FUN_7e8f_02bf(1);
          uVar3 = *(undefined1 *)(iVar4 + 0xcac);
        }
      }
      else {
        iVar4 = thunk_FUN_7e8f_02bf(1);
        uVar3 = *(undefined1 *)(iVar4 + 0xca4);
      }
      *(undefined1 *)(local_4 * 0x1f + 0x829) = uVar3;
      *(undefined1 *)(local_4 * 0x1f + 0x82a) = 0;
      local_66[local_4] = 1;
    }
    local_4 = local_4 + 1;
  } while( true );
}

