
undefined2 __cdecl16far FUN_7e8f_062a(undefined4 param_1)

{
  char cVar1;
  bool bVar2;
  int iVar3;
  char *pcVar4;
  undefined2 in_DX;
  char *local_c;
  undefined4 local_8;
  undefined2 local_4;
  
  bVar2 = false;
  iVar3 = FUN_170b_0006((int)param_1,(int)((ulong)param_1 >> 0x10),2);
  if (-1 < iVar3) {
    local_4 = FUN_170b_00a9(iVar3);
    pcVar4 = (char *)FUN_1d28_01d5(local_4);
    local_8 = (char *)CONCAT22(in_DX,pcVar4);
    local_c = local_8;
    FUN_170b_006d(iVar3,pcVar4,in_DX,local_4);
LAB_7e8f_06c0:
    if (!bVar2) {
      while( true ) {
        pcVar4 = (char *)local_c;
        if (*local_c == '#') break;
        local_c = (char *)CONCAT22(local_c._2_2_,(char *)local_c + 1);
      }
      local_c = (char *)CONCAT22(local_c._2_2_,(char *)local_c + 1);
      cVar1 = *local_c;
      local_c = (char *)CONCAT22(local_c._2_2_,pcVar4 + 2);
      if (cVar1 != 'D') goto code_r0x0007ef94;
      FUN_7e8f_08e9(&local_c);
      goto LAB_7e8f_06bd;
    }
    FUN_1d28_050d((char *)local_8,(int)((ulong)local_8 >> 0x10));
    FUN_170b_003a(iVar3);
  }
  return 0;
code_r0x0007ef94:
  if (cVar1 == 'E') {
LAB_7e8f_06bd:
    bVar2 = true;
  }
  goto LAB_7e8f_06c0;
}

