
void __cdecl16far FUN_484d_1063(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar2 = DAT_3c04_0110;
  iVar4 = 0;
  do {
    if (7 < iVar4) {
      return;
    }
    if (((iVar4 != iVar2) &&
        ((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 0xc) >> 2 <
         (*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 3))) &&
       ((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 0xc) >> 2 <
        (*(byte *)(iVar4 * 8 + iVar2 + 0x153b) & 0xc) >> 2)) {
      if (((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 0xc) == 0) &&
         ((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 3) == 1)) {
LAB_484d_1194:
        iVar3 = thunk_FUN_7e8f_02bf(1,2);
        iVar3 = iVar3 + 1;
      }
      else {
        if (((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 0xc) != 0) ||
           ((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 3) != 2)) {
          if (((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 0xc) != 4) ||
             ((*(byte *)(iVar2 * 8 + iVar4 + 0x153b) & 3) != 2)) goto LAB_484d_11b0;
          goto LAB_484d_1194;
        }
        iVar3 = thunk_FUN_7e8f_02bf(1,10);
        iVar3 = iVar3 + 10;
      }
      piVar1 = (int *)(iVar2 * 2 + 0x10e3);
      *piVar1 = *piVar1 + iVar3;
    }
LAB_484d_11b0:
    iVar4 = iVar4 + 1;
  } while( true );
}

