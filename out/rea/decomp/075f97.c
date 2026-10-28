
void __cdecl16far FUN_7533_0c67(void)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 in_DX;
  int iVar5;
  int iVar6;
  undefined4 local_8;
  
  uVar1 = thunk_FUN_7e8f_0505(0x14,DAT_3c04_0110,DAT_3c04_0161);
  FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar1,in_DX);
  uVar1 = FUN_170b_0006((undefined1 *)&DAT_451b_1d28,0x4125,2);
  iVar2 = FUN_170b_00a9();
  iVar3 = FUN_1d28_01d5();
  local_8 = CONCAT22(in_DX,iVar3);
  FUN_170b_006d(uVar1,iVar3,in_DX,iVar2);
  FUN_170b_003a();
  iVar6 = 0;
  iVar4 = thunk_FUN_7e8f_02bf(1,100);
  for (iVar5 = 0; iVar5 < iVar2; iVar5 = iVar5 + 1) {
    if ((*(char *)(iVar3 + iVar5) == '#') && (iVar6 = iVar6 + 1, iVar6 == iVar4)) {
      iVar5 = iVar5 + 1;
      break;
    }
  }
  DAT_451b_0570 = (uint)(*(char *)(iVar3 + iVar5) != '0');
  iVar4 = iVar5 + 2;
  do {
    if (iVar2 <= iVar4) {
LAB_7533_0d4c:
      FUN_1d28_050d(local_8);
      return;
    }
    if (*(char *)(iVar3 + iVar4) < ' ') {
      *(undefined1 *)(iVar3 + iVar4) = 0;
      FUN_1000_4a70(0x44d2,0x4125,iVar3 + iVar5 + 2,in_DX);
      goto LAB_7533_0d4c;
    }
    iVar4 = iVar4 + 1;
  } while( true );
}

