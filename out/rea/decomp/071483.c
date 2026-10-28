
void __cdecl16far FUN_705a_0ee3(int param_1)

{
  int *piVar1;
  char cVar2;
  bool bVar3;
  undefined1 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  
  FUN_705a_1128();
  iVar6 = 0;
  iVar5 = 0;
  while( true ) {
    uVar8 = (undefined2)((ulong)DAT_451b_051c >> 0x10);
    iVar7 = param_1;
    if (0x1b < iVar6) break;
    if (-1 < *(int *)((int)DAT_451b_051c + iVar6 * 0x3e + 0x1e)) {
      iVar7 = iVar6;
      if (iVar5 == param_1) break;
      iVar5 = iVar5 + 1;
    }
    iVar6 = iVar6 + 1;
  }
  cVar2 = *(char *)(DAT_4125_0e98 * 0x41 + 0x15a9);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1593) =
       *(undefined1 *)((int)DAT_451b_051c + iVar7 * 0x3e);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1597) =
       *(undefined1 *)((int)DAT_451b_051c + iVar7 * 0x3e + 0x18);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x15a3) =
       *(undefined1 *)((int)DAT_451b_051c + iVar7 * 0x3e + 0x1a);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x159b) =
       *(undefined1 *)((int)DAT_451b_051c + iVar7 * 0x3e + 0x16);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x159f) =
       *(undefined1 *)((int)DAT_451b_051c + iVar7 * 0x3e + 0x1c);
  uVar4 = FUN_705a_0930(DAT_4125_0e98);
  *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x1591) = uVar4;
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 - *(int *)((int)DAT_451b_051c + iVar7 * 0x3e + 0x1e);
  FUN_705a_11e2();
  if ('\0' < *(char *)(DAT_4125_0e98 * 0x41 + 0x15aa)) {
    bVar3 = false;
    for (iVar5 = 0; iVar5 < 4; iVar5 = iVar5 + 1) {
      if (*(char *)(DAT_4125_0e98 * 0x41 + iVar5 + 0x1593) == cVar2) {
        bVar3 = true;
        break;
      }
    }
    if (!bVar3) {
      *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x15aa) = 0;
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + DAT_4125_0e98 * 0x41) = 0;
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + DAT_4125_0e98 * 0x41) = 0xffff;
      *(undefined2 *)(DAT_4125_0e98 * 0x41 + 0x15b2) = 0xffff;
      *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x15a9) = 0xff;
    }
  }
  if ((DAT_4125_0e86 < 3) && (*(char *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1594) < '\0')) {
    DAT_4125_0e86 = DAT_4125_0e86 + 1;
  }
  if (*(int *)(DAT_3c04_0110 * 2 + 0xd0) == 0) {
    FUN_705a_09da(0);
    FUN_705a_0dae();
  }
  return;
}

