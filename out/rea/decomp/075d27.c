
void __cdecl16far FUN_7533_09f7(void)

{
  char cVar1;
  undefined2 uVar2;
  
  uVar2 = (undefined2)((ulong)DAT_451b_1efe >> 0x10);
  cVar1 = *(char *)(*(byte *)(((int *)DAT_451b_1efe)[1] * 0xe0 + *DAT_451b_1efe * 2) + 0x710);
  if ((((DAT_451b_1efe != (int *)0x0) && (cVar1 != '\x02')) && (cVar1 != '\x03')) &&
     (((cVar1 != '\n' && (cVar1 != '\v')) &&
      ((*(byte *)(((int *)DAT_451b_1efe)[1] * 0x70 + *DAT_451b_1efe) & 0x40) == 0)))) {
    thunk_FUN_7938_03d9(2,0,DAT_451b_1efe);
    if (0 < DAT_451b_08ce) {
      FUN_7533_0a96();
      return;
    }
    thunk_FUN_8027_0174();
  }
  return;
}

