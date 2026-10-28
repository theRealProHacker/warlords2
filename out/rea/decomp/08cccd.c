
void __cdecl16far FUN_8c81_04bd(int param_1)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  
  iVar1 = thunk_FUN_8027_225b();
  if ((DAT_3c04_015b == 0) || (DAT_3c04_0157 != 0)) {
    if ((DAT_3c04_015d == 0) || (DAT_3c04_015f != 0)) {
      if (param_1 < 1) {
        thunk_FUN_7533_0579();
        iVar2 = thunk_FUN_7533_0000();
        if (iVar2 != 0) {
          if (DAT_3c04_015b == 0) {
            thunk_FUN_7d9f_0000();
          }
          thunk_FUN_7533_0d5c();
          return;
        }
        if (DAT_3c04_015b == 0) {
          thunk_FUN_7d9f_0000();
        }
      }
      if ((param_1 < 2) && (iVar1 == 1)) {
        thunk_FUN_71d6_0000(2,*(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x189),
                            *(undefined2 *)(DAT_3c04_0110 * 0x14 + 0x18b));
      }
      else {
        if ((param_1 < 3) && (iVar2 = thunk_FUN_6f60_0000(), iVar2 != 0)) {
          thunk_FUN_6f60_06bd();
        }
        thunk_FUN_899d_0356();
        thunk_FUN_8027_0174();
        if (((DAT_3c04_012e != 0) && (iVar1 == 2)) && ((DAT_3c04_0134 & 0x40) == 0)) {
          DAT_3c04_0134 = DAT_3c04_0134 | 0x40;
          uVar3 = thunk_FUN_7e8f_0505(0x70019);
          thunk_FUN_8027_168d(uVar3,in_DX);
        }
      }
    }
    else {
      thunk_FUN_8027_1f68();
    }
  }
  else {
    thunk_FUN_8027_1fbd();
  }
  return;
}

