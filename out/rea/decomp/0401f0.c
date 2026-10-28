
void __cdecl16far thunk_FUN_66b0_0000(void)

{
  byte *pbVar1;
  bool bVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  int unaff_DI;
  undefined2 unaff_SS;
  int aiStack_66 [11];
  undefined2 uStack_50;
  undefined2 uStack_4e;
  undefined2 uStack_16;
  undefined2 uStack_14;
  undefined2 uStack_12;
  undefined2 uStack_10;
  undefined2 uStack_e;
  undefined2 uStack_c;
  int iStack_a;
  int iStack_8;
  int iStack_6;
  int iStack_4;
  
  iStack_a = (DAT_3c04_080f << 1) / 10;
  uStack_c = 4;
  uStack_e = 3;
  uStack_10 = 2;
  uStack_12 = 3;
  uStack_14 = 5;
  uStack_16 = 3;
  FUN_66b0_091e();
  FUN_66b0_04ef();
  iVar4 = thunk_FUN_7e8f_02bf(2,0x10003);
  iStack_8 = iStack_a;
  if (iVar4 < iStack_a) {
    iStack_8 = iVar4;
  }
  for (iStack_4 = 0; iStack_4 < DAT_3c04_080f; iStack_4 = iStack_4 + 1) {
    pbVar1 = (byte *)(*(int *)(iStack_4 * 0x1f + 0x813) * 0xe0 +
                      *(int *)(iStack_4 * 0x1f + 0x811) * 2 + 1);
    *pbVar1 = *pbVar1 & 0xbf;
    aiStack_66[iStack_4] = 0;
    if (*(char *)(iStack_4 * 0x1f + 0x829) == '\x01') {
      aiStack_66[iStack_4] = 1;
    }
  }
  for (iStack_4 = DAT_3c04_080f; iStack_4 < 0x28; iStack_4 = iStack_4 + 1) {
    aiStack_66[iStack_4] = 1;
  }
  iVar4 = thunk_FUN_7e8f_02bf(1);
  iVar4 = DAT_3c04_080f / 3 + iVar4 + 8;
  if (0x16 < iVar4) {
    iVar4 = 0x16;
  }
  for (iStack_4 = 8; iStack_4 < iVar4; iStack_4 = iStack_4 + 1) {
    if ((iStack_4 < iStack_8 + 8) || (iStack_a + 8 <= iStack_4)) {
      iStack_6 = 0;
      while (iStack_6 == 0) {
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
             (aiStack_66[unaff_DI] == 0)) {
            iStack_6 = 1;
            aiStack_66[unaff_DI] = 1;
          }
        }
      }
      *(undefined1 *)(iStack_4 * 0x1d + 0xcff) = 2;
      *(int *)(iStack_4 * 0x1d + 0xd00) = unaff_DI;
      *(undefined1 *)(unaff_DI * 0x1f + 0x829) = 2;
      *(undefined1 *)(unaff_DI * 0x1f + 0x82a) = (undefined1)iStack_4;
    }
    else {
      *(undefined1 *)(iStack_4 * 0x1d + 0xcff) = 0;
    }
  }
  while (iStack_4 = iVar4, iStack_4 < 0x16) {
    *(undefined1 *)(iStack_4 * 0x1d + 0xcff) = 0;
    iVar4 = iStack_4 + 1;
  }
  iStack_4 = 0;
  do {
    if (DAT_3c04_080f <= iStack_4) {
      iStack_4 = 0;
      do {
        if (DAT_3c04_080f <= iStack_4) {
          return;
        }
        if (*(char *)(iStack_4 * 0x1f + 0x829) == '\x01') {
          *(undefined1 *)(iStack_4 * 0x1f + 0x82b) = 0;
        }
        else {
          if (*(char *)(iStack_4 * 0x1f + 0x829) == '\x05') {
            if (*(int *)(iStack_4 * 0x1f + 0x82c) == 0) {
              bVar2 = true;
              for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
                if ((*(int *)(iVar4 * 2 + 0x137) != 0) &&
                   (iVar5 = FUN_1a8b_0acc(*(undefined2 *)(iVar4 * 0x14 + 0x189),
                                          *(undefined2 *)(iVar4 * 0x14 + 0x18b),
                                          *(undefined2 *)(iStack_4 * 0x1f + 0x811),
                                          *(undefined2 *)(iStack_4 * 0x1f + 0x813)), iVar5 < 0xf)) {
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
          *(undefined1 *)(iStack_4 * 0x1f + 0x82b) = uVar3;
        }
        iStack_4 = iStack_4 + 1;
      } while( true );
    }
    if (aiStack_66[iStack_4] == 0) {
      if (*(int *)(iStack_4 * 0x1f + 0x82c) == 0) {
        bVar2 = true;
        for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
          if ((*(int *)(iVar4 * 2 + 0x137) != 0) &&
             (iVar5 = FUN_1a8b_0acc(*(undefined2 *)(iVar4 * 0x14 + 0x189),
                                    *(undefined2 *)(iVar4 * 0x14 + 0x18b),
                                    *(undefined2 *)(iStack_4 * 0x1f + 0x811),
                                    *(undefined2 *)(iStack_4 * 0x1f + 0x813)), iVar5 < 0xf)) {
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
      *(undefined1 *)(iStack_4 * 0x1f + 0x829) = uVar3;
      *(undefined1 *)(iStack_4 * 0x1f + 0x82a) = 0;
      aiStack_66[iStack_4] = 1;
    }
    iStack_4 = iStack_4 + 1;
  } while( true );
}

