
undefined2 __cdecl16far thunk_FUN_7e8f_062a(undefined4 param_1)

{
  char cVar1;
  bool bVar2;
  int iVar3;
  char *pcVar4;
  undefined2 in_DX;
  char *pcStack_c;
  undefined4 uStack_8;
  undefined2 uStack_4;
  
  bVar2 = false;
  iVar3 = FUN_170b_0006((int)param_1,(int)((ulong)param_1 >> 0x10),2);
  if (-1 < iVar3) {
    uStack_4 = FUN_170b_00a9(iVar3);
    pcVar4 = (char *)FUN_1d28_01d5(uStack_4);
    uStack_8 = (char *)CONCAT22(in_DX,pcVar4);
    pcStack_c = uStack_8;
    FUN_170b_006d(iVar3,pcVar4,in_DX,uStack_4);
LAB_7e8f_06c0:
    if (!bVar2) {
      while( true ) {
        pcVar4 = (char *)pcStack_c;
        if (*pcStack_c == '#') break;
        pcStack_c = (char *)CONCAT22(pcStack_c._2_2_,(char *)pcStack_c + 1);
      }
      pcStack_c = (char *)CONCAT22(pcStack_c._2_2_,(char *)pcStack_c + 1);
      cVar1 = *pcStack_c;
      pcStack_c = (char *)CONCAT22(pcStack_c._2_2_,pcVar4 + 2);
      if (cVar1 != 'D') goto code_r0x0007ef94;
      FUN_7e8f_08e9(&pcStack_c);
      goto LAB_7e8f_06bd;
    }
    FUN_1d28_050d((char *)uStack_8,(int)((ulong)uStack_8 >> 0x10));
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

