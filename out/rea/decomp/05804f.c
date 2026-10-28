
void __cdecl16far FUN_57d5_02ff(void)

{
  bool bVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  undefined2 unaff_SS;
  undefined1 local_8 [6];
  
  iVar4 = DAT_3c04_157b;
  while (iVar5 = iVar4 + -1, iVar4 != 0) {
    iVar4 = iVar5;
    if ((*(char *)(iVar5 * 0x41 + 0x1592) == (char)DAT_3c04_0110) &&
       (*(char *)((int)DAT_451b_018e + iVar5 + 0x56) == '\x03')) {
      iVar2 = FUN_57d5_01f6(iVar5,local_8);
      if (iVar2 != 0) {
        bVar1 = false;
        iVar2 = 6;
        while (iVar6 = iVar2 + -1, uVar7 = (undefined2)((ulong)DAT_451b_018e >> 0x10), iVar2 != 0) {
          uVar3 = (uint)(byte)(&stack0xfff7)[iVar2];
          iVar2 = iVar6;
          if (((uVar3 != 0xff) && (*(char *)(uVar3 * 0x41 + 0x1592) == '\x0f')) &&
             ((*(byte *)((int)DAT_451b_018e + uVar3 + 0x11e) & 1) == 0)) {
            bVar1 = true;
          }
        }
        if (!bVar1) {
          *(undefined1 *)((int)DAT_451b_018e + iVar5 + 0x56) = 2;
        }
      }
    }
  }
  return;
}

