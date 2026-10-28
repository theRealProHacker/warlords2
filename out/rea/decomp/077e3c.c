
void __cdecl16far FUN_76ef_0f4c(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  int iVar3;
  int iVar4;
  undefined2 unaff_SS;
  undefined1 local_7c [50];
  undefined1 local_4a [50];
  char local_18 [20];
  undefined2 local_4;
  
  uVar1 = thunk_FUN_7e8f_0505(4,0x10000);
  local_4 = FUN_170b_0006(uVar1,in_DX);
  for (iVar4 = 0; iVar4 < 10; iVar4 = iVar4 + 1) {
    FUN_1000_4a70(local_18);
    iVar3 = 0;
    while( true ) {
      iVar2 = FUN_1000_4a99(local_18);
      if (iVar2 <= iVar3) break;
      if (local_18[iVar3] == ' ') {
        local_18[iVar3] = '_';
      }
      iVar3 = iVar3 + 1;
    }
    FUN_1000_4a99(local_18);
    FUN_1000_4944(local_7c);
    FUN_1000_4a99(local_18);
    FUN_1000_4944(local_4a);
    FUN_1000_4a99(local_4a);
    FUN_170b_004e(local_4,local_4a);
  }
  FUN_170b_003a();
  return;
}

