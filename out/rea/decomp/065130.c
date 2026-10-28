
void __cdecl16far FUN_6513_0000(void)

{
  byte *pbVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int local_e;
  undefined2 uStack_c;
  int local_a;
  
  if (DAT_451b_1f02 != (int *)0x0) {
    uVar6 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    if ('\0' < *(char *)((int)(int *)DAT_451b_1f02 + 7)) {
      iVar5 = *DAT_451b_1f02;
      iVar3 = ((int *)DAT_451b_1f02)[1];
      cVar2 = *(char *)(*(byte *)(iVar3 * 0xe0 + iVar5 * 2) + 0x710);
      local_e = 0;
      uStack_c = 0;
      DAT_451b_01c8 = iVar3;
      DAT_451b_01ca = iVar5;
      if (cVar2 == '\v') {
        iVar4 = thunk_FUN_824f_04b5(iVar5,iVar3);
        if (iVar4 < 0) {
          cVar2 = '\a';
        }
        else {
          local_e = iVar4 * 0x1f + 0x811;
          uStack_c = 0x3c04;
          local_a = iVar4;
        }
      }
      if (DAT_451b_1efe == 0) {
        if (cVar2 != '\v') {
          return;
        }
        if (*(char *)(local_e + 0x18) != '\x01') {
          return;
        }
      }
      else {
        if (cVar2 != '\v') {
          return;
        }
        if ((*(byte *)(iVar3 * 0xe0 + iVar5 * 2 + 1) & 0x40) != 0) {
          return;
        }
        if (*(char *)(local_e + 0x18) == '\x03') {
          thunk_FUN_7533_04f1((int)DAT_451b_1efe,(int)((ulong)DAT_451b_1efe >> 0x10),3);
          thunk_FUN_6d27_1244(DAT_3c04_0110,6,0x65,0,
                              *(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223,0x3c04);
          iVar4 = thunk_FUN_5d9f_09ab();
          if (iVar4 == 0) {
            FUN_6513_0aa0(local_a);
          }
          else {
            thunk_FUN_5e7c_0080(local_a);
          }
          pbVar1 = (byte *)(iVar3 * 0xe0 + iVar5 * 2 + 1);
          *pbVar1 = *pbVar1 | 0x40;
          return;
        }
        if (*(char *)(local_e + 0x18) != '\x01') {
          FUN_6513_01ab(local_e,uStack_c,iVar5,iVar3);
          return;
        }
        iVar5 = thunk_FUN_5d9f_09ab();
        if (iVar5 == 0) {
          thunk_FUN_4974_0000();
          return;
        }
      }
      FUN_6513_08a1(local_a);
    }
  }
  return;
}

