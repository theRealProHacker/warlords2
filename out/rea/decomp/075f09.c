
void __cdecl16far FUN_7533_0bd9(void)

{
  int iVar1;
  undefined1 local_6 [4];
  
  iVar1 = FUN_7533_0b47(DAT_3c04_0110,local_6);
  if (iVar1 == 0) {
    for (iVar1 = 0; iVar1 < DAT_3c04_157b; iVar1 = iVar1 + 1) {
      if (((*(char *)(iVar1 * 0x41 + 0x1592) == DAT_3c04_0110) &&
          (*(int *)((int)(undefined2 *)&DAT_4125_15ae + iVar1 * 0x41) != 0)) &&
         (*(int *)((int)(undefined2 *)&DAT_4125_15b0 + iVar1 * 0x41) == -2)) {
        *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + iVar1 * 0x41) = 0;
      }
    }
  }
  return;
}

