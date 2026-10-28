// ovl26:04ba ent 5ec7a

void __cdecl16far FUN_5e7c_04ba(void)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined2 uVar7;
  
  iVar5 = DAT_3c04_157b;
  if (*(DAT_451b_018e + 0x48) == 0) {
    while (iVar6 = iVar5 + -1, iVar5 != 0) {
      iVar5 = iVar6;
      if (*(iVar6 * 0x41 + 0x1592) == DAT_3c04_0110) {
        bVar1 = false;
        iVar3 = 0;
        while( true ) {
          uVar7 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
          if (*(iVar3 * 2 + 0x932) == -1) break;
          iVar2 = iVar3 + 1;
          iVar4 = iVar3 * 2;
          iVar3 = iVar2;
          if (*(DAT_451b_018e + iVar6 + 0x56) == *(iVar4 + 0x932)) {
            bVar1 = true;
          }
        }
        if ((bVar1) && (3 < *(DAT_451b_018e + iVar6 + 0x182))) {
          FUN_5e7c_053f(iVar6);
        }
      }
    }
  }
  return;
}

