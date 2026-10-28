
bool __cdecl16far FUN_1000_1b83(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  bool bVar2;
  
  bVar2 = DAT_4125_3a5c != 0x20;
  if (bVar2) {
    iVar1 = DAT_4125_3a5c * 4;
    *(undefined2 *)(iVar1 + 0x70d8) = param_2;
    *(undefined2 *)(iVar1 + 0x70d6) = param_1;
    DAT_4125_3a5c = DAT_4125_3a5c + 1;
  }
  return !bVar2;
}

