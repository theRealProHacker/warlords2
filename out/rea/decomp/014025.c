
int __cdecl16far FUN_1000_4025(void)

{
  int iVar1;
  int iVar2;
  undefined2 local_6;
  
  iVar2 = 0;
  local_6 = 0x3b6c;
  iVar1 = DAT_4125_3cfc;
  while (iVar1 != 0) {
    if ((*(uint *)(local_6 + 2) & 3) != 0) {
      FUN_1000_3f58(local_6,0x4125);
      iVar2 = iVar2 + 1;
    }
    local_6 = local_6 + 0x14;
    iVar1 = iVar1 + -1;
  }
  return iVar2;
}

