
void __cdecl16far FUN_5d9f_0af2(void)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  
  uVar3 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar2 = (int)DAT_451b_018e;
  if ((*(int *)(iVar2 + 10) * DAT_3c04_157b) / 0x50 < 5) {
    iVar1 = 5;
  }
  else {
    iVar1 = (*(int *)(iVar2 + 10) * DAT_3c04_157b) / 0x50;
  }
  if (((4 < *(int *)(iVar2 + 0xe)) || (*(int *)(iVar2 + 2) <= iVar1 * *(int *)(iVar2 + 0xe))) &&
     (499 < *(int *)(DAT_3c04_0110 * 0x14 + 0x185))) {
    if (*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < 0x7d1) {
      uVar3 = *(undefined2 *)(iVar2 + 0x10);
    }
    else {
      uVar3 = *(undefined2 *)(iVar2 + 0x12);
    }
    iVar2 = FUN_5d9f_0c83(uVar3);
    if ((iVar2 != -1) && (499 < *(int *)(DAT_3c04_0110 * 0x14 + 0x185))) {
      FUN_5d9f_0bd1(uVar3,iVar2);
    }
  }
  return;
}

