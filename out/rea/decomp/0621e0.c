
void __cdecl16far FUN_621e_0000(void)

{
  undefined1 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = 100;
  while (iVar3 = iVar2 + -1, iVar2 != 0) {
    *(undefined1 *)(iVar3 * 0x41 + 0x15aa) = 0;
    *(undefined1 *)(iVar3 * 0x41 + 0x15ab) = 0;
    *(undefined1 *)(iVar3 * 0x41 + 0x15a9) = 0;
    *(undefined2 *)(iVar3 * 0x41 + 0x15b2) = 0;
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + iVar3 * 0x41) = 0;
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar3 * 0x41) = 0;
    *(undefined1 *)(iVar3 * 0x41 + 0x15b5) = 0;
    *(undefined1 *)(iVar3 * 0x41 + 0x15b4) = 0;
    puVar1 = (undefined1 *)(iVar3 * 0x41 + 0x15b4);
    *puVar1 = *puVar1;
    *(undefined2 *)(iVar3 * 0x41 + 0x15bc) = 0;
    *(undefined2 *)(iVar3 * 0x41 + 0x15ba) = 0;
    *(undefined2 *)(iVar3 * 0x41 + 0x15b8) = 0;
    *(undefined2 *)(iVar3 * 0x41 + 0x15b6) = 0;
    *(undefined1 *)(iVar3 * 0x41 + 0x15ac) = *(undefined1 *)(iVar3 * 0x41 + 0x1592);
    *(undefined1 *)(iVar3 * 0x41 + 0x15ad) = 0;
    iVar2 = iVar3;
  }
  return;
}

