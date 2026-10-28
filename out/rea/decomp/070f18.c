
void __cdecl16far FUN_705a_0978(void)

{
  int iVar1;
  
  iVar1 = 4;
  do {
    DAT_4125_0e86 = iVar1 + -1;
    if ((iVar1 == 0) || (DAT_4125_0e86 == 0)) break;
    iVar1 = DAT_4125_0e86;
  } while ((-1 < *(char *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1593)) ||
          (*(char *)(DAT_4125_0e98 * 0x41 + DAT_4125_0e86 + 0x1592) < '\0'));
  thunk_FUN_54e4_0000(0xb);
  FUN_705a_09da(0);
  thunk_FUN_79c4_056a(0x17);
  FUN_705a_0dae();
  return;
}

