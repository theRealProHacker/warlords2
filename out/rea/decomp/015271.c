
void __cdecl16far FUN_1000_5271(void)

{
  int iVar1;
  undefined2 local_6;
  
  local_6 = 0x3b6c;
  for (iVar1 = 4; iVar1 != 0; iVar1 = iVar1 + -1) {
    if ((*(uint *)(local_6 + 2) & 3) != 0) {
      FUN_1000_3f58(local_6,0x4125);
    }
    local_6 = local_6 + 0x14;
  }
  return;
}

