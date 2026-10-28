// ovl29:1885 ent 63a65

int __cdecl16far FUN_621e_1885(int param_1,undefined2 param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int local_a;
  int local_8;
  
  FUN_1555_1b0a();
  local_8 = -1;
  local_a = -1;
  iVar4 = DAT_3c04_157b;
  do {
    do {
      do {
        iVar5 = iVar4 + -1;
        if (iVar4 == 0) {
          FUN_1555_1b2e();
          return local_8;
        }
        iVar4 = iVar5;
      } while (((param_3 != 0) && (*(iVar5 * 0x41 + 0x1592) == DAT_3c04_0110)) ||
              (*(*(*(iVar5 * 0x41 + 0x157f) * 0xe0 +
                                  *(iVar5 * 0x41 + 0x157d) * 2) + 0x710) != '\n'));
      uVar6 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    } while ((((*(DAT_451b_018e + 0x46) == iVar5) ||
              ((*(DAT_451b_018e + iVar5 + 0x11e) & 1) != 0)) ||
             ((*(iVar5 * 0x41 + 0x1592) != '\x0f' &&
              ((*(iVar5 * 0x41 + 0x1592) != DAT_3c04_0110 &&
               ((*(*(iVar5 * 0x41 + 0x1592) * 8 + DAT_3c04_0110 + 0x153b) & 3) != 2)
               ))))) || (iVar1 = thunk_FUN_59a9_0a85(iVar5,&param_1), param_1 == -1));
    if (*(iVar5 * 0x41 + 0x1592) == DAT_3c04_0110) {
      iVar2 = 0xf;
      iVar1 = iVar1 + 0x14;
    }
    else {
      iVar2 = FUN_621e_15c5();
    }
    if ((iVar2 < 0x33) || (DAT_451b_1ea0 <= iVar1)) {
      if (10 < iVar2) {
        iVar2 = iVar2 * 5;
        iVar3 = 100;
        goto LAB_621e_1a14;
      }
      iVar2 = -2;
    }
    else {
      iVar2 = iVar2 * 10;
      iVar3 = 400;
LAB_621e_1a14:
      iVar2 = (iVar3 - iVar1) + iVar2;
    }
    if (local_a < iVar2) {
      local_a = iVar2;
      local_8 = iVar5;
    }
  } while( true );
}

