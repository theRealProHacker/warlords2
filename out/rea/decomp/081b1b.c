
void __cdecl16far FUN_8027_18ab(void)

{
  byte *pbVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  undefined1 local_56 [80];
  undefined2 local_6;
  int local_4;
  
  thunk_FUN_824f_03f9();
  bVar2 = false;
  local_4 = 0;
  do {
    if (7 < local_4) {
LAB_8027_18f3:
      for (local_4 = 0; local_4 < 8; local_4 = local_4 + 1) {
        if ((*(int *)(local_4 * 2 + 0x137) != 0) &&
           (iVar3 = DAT_3c04_0181, ((undefined2 *)&DAT_451b_1e8a)[local_4] == 0)) {
          while (iVar4 = iVar3 + -1, iVar3 != 0) {
            iVar3 = iVar4;
            if (*(char *)(iVar4 * 0x16 + -0x777b) == (char)local_4) {
              if (*(char *)(iVar4 * 0x16 + -0x777c) == '\x1c') {
                local_6 = DAT_3c04_0110;
                DAT_3c04_0110 = (int)*(char *)(iVar4 * 0x16 + -0x777b);
                thunk_FUN_67a7_16cd(iVar4 * 0x16 + -0x7780,0x2e1d,
                                    *(undefined2 *)(iVar4 * 0x16 + -0x7780),
                                    *(undefined2 *)(iVar4 * 0x16 + -0x777e));
                DAT_3c04_0110 = local_6;
              }
              FUN_1b62_03be(iVar4 * 0x16 + -0x7780,0x2e1d);
            }
          }
          thunk_FUN_6d27_1244(local_4,4,local_4,0,0x2b00,0x4125);
          thunk_FUN_7e8f_04f0(0xffff000b,local_4 * 0x14,0x3c04);
          FUN_1000_4944(local_56);
          if ((*(int *)(local_4 * 2 + 0xd0) == 0) || (bVar2)) {
            FUN_8027_10fb(local_56);
          }
          else {
            FUN_8027_11d1();
          }
          *(undefined2 *)(local_4 * 2 + 0x137) = 0;
          *(undefined2 *)(local_4 * 0x14 + 0x185) = 0;
          for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
            iVar4 = local_4 * 8 + iVar3;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 & 0xf3;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 | 4;
            iVar4 = local_4 * 8 + iVar3;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 & 0xfc;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 | 1;
            iVar4 = iVar3 * 8 + local_4;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 & 0xf3;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 | 4;
            iVar4 = iVar3 * 8 + local_4;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 & 0xfc;
            pbVar1 = (byte *)(iVar4 + 0x153b);
            *pbVar1 = *pbVar1 | 1;
          }
        }
      }
      return;
    }
    if ((*(int *)(local_4 * 2 + 0x137) != 0) && (*(int *)(local_4 * 2 + 0xd0) == 0)) {
      bVar2 = true;
      goto LAB_8027_18f3;
    }
    local_4 = local_4 + 1;
  } while( true );
}

