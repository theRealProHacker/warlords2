
void __cdecl16far FUN_53ff_0000(int param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  undefined1 local_be [80];
  int local_6e;
  int local_6c;
  undefined1 local_6a [50];
  char local_38 [50];
  int local_6;
  int local_4;
  
  local_6 = 0;
  FUN_1000_4944(local_be);
  iVar1 = FUN_170b_0006();
  if (-1 < iVar1) {
    FUN_170b_006d(iVar1,&local_4);
    iVar2 = 0;
    do {
      FUN_170b_006d(iVar1,&local_6e);
      if ((local_6e == param_1) && (local_6c == param_2)) {
        local_6 = 1;
      }
      iVar2 = iVar2 + 1;
    } while ((local_6 == 0) && (iVar2 < local_4));
    FUN_170b_003a(iVar1);
    if (local_6 == 0) {
      FUN_1000_4a70(param_3,0x3be,0x4125);
      pcVar3 = (char *)s_current_sgn_4125_03b2 + 0xd;
    }
    else {
      FUN_1000_4a70(param_3,local_6a);
      pcVar3 = local_38;
    }
    FUN_1000_4a70(param_4,pcVar3);
    iVar1 = FUN_1000_4a40(param_3,0x3c0,0x4125);
    if ((iVar1 == 0) && (iVar1 = FUN_1000_4a40(param_4,0x3c1,0x4125), iVar1 == 0)) {
      FUN_1000_4944(param_3,0x3c2,0x4125,param_1,param_2);
    }
  }
  return;
}

