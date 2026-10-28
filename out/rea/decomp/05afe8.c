
void __cdecl16far FUN_5ab9_0458(void)

{
  uint *puVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined1 local_16 [16];
  int local_6;
  int local_4;
  
  iVar4 = DAT_3c04_0181;
  do {
    do {
      iVar5 = iVar4 + -1;
      if (iVar4 == 0) {
        return;
      }
      iVar4 = iVar5;
    } while ((((*(char *)(iVar5 * 0x16 + -0x777b) != (char)DAT_3c04_0110) ||
              (*(int *)(iVar5 * 0x16 + -0x7780) == -1)) ||
             ((*(uint *)(iVar5 * 0x16 + -0x7774) & 0x100) == 0)) ||
            (puVar1 = (uint *)(iVar5 * 0x16 + -0x7774), *puVar1 = *puVar1 & 0xfeff,
            *(char *)(iVar5 * 0x16 + -0x777c) != '\x1c'));
    bVar2 = true;
    do {
      if (((!bVar2) ||
          (iVar3 = thunk_FUN_621e_13b2(*(undefined2 *)(iVar5 * 0x16 + -0x7780),
                                       *(undefined2 *)(iVar5 * 0x16 + -0x777e),local_16), iVar3 == 0
          )) || (*(char *)(iVar5 * 0x16 + -0x7779) < '\x03')) break;
      local_4 = *(int *)(iVar5 * 0x16 + -0x7780);
      local_6 = *(int *)(iVar5 * 0x16 + -0x777e);
      iVar3 = FUN_5ab9_11a6(local_16);
      if ((iVar3 == 0) || (iVar3 == 1)) {
        bVar2 = false;
      }
    } while (((*(int *)(iVar5 * 0x16 + -0x7780) != local_4) ||
             (*(int *)(iVar5 * 0x16 + -0x777e) != local_6)) ||
            (*(char *)(iVar5 * 0x16 + -0x777a) <= *(char *)(iVar5 * 0x16 + -0x7779)));
  } while( true );
}

