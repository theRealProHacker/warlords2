
void __cdecl16far FUN_5131_1c1d(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int local_34;
  int local_c;
  int local_a;
  
  iVar4 = 0;
  do {
    if (7 < iVar4) {
      return;
    }
    iVar1 = thunk_FUN_824f_044a(*(undefined2 *)(iVar4 * 0x14 + 0x189),
                                *(undefined2 *)(iVar4 * 0x14 + 0x18b));
    if (-1 < iVar1) {
      iVar2 = 4;
      do {
        iVar3 = iVar2 + -1;
        if (iVar2 == 0) break;
        iVar2 = iVar3;
      } while (-1 < *(char *)(iVar1 * 0x41 + iVar3 + 0x1593));
      if (iVar3 < 0) {
        iVar3 = 3;
      }
      local_a = 0;
      do {
        do {
          if (0x27 < local_a) goto LAB_5131_1d01;
          local_c = thunk_FUN_7e8f_02bf(1);
        } while ((local_c == 5) || (((undefined1 *)&DAT_451b_0668)[local_c * 6] != '\0'));
        local_a = local_a + 1;
        iVar2 = 0;
        while ((iVar2 < 4 && (*(char *)(iVar1 * 0x41 + iVar2 + 0x1593) != local_c))) {
          iVar2 = iVar2 + 1;
        }
      } while ((iVar2 < 4) || (thunk_FUN_705a_14ac(0x40c1,local_c), local_34 < 5));
LAB_5131_1d01:
      if (local_a < 0x28) {
        *(undefined1 *)(iVar1 * 0x41 + iVar3 + 0x1593) = (undefined1)local_c;
      }
    }
    iVar4 = iVar4 + 1;
  } while( true );
}

