
void __cdecl16far thunk_FUN_6a62_1475(int param_1,undefined2 param_2,undefined2 param_3)

{
  int iVar1;
  undefined1 auStack_40 [22];
  undefined2 uStack_2a;
  undefined2 uStack_28;
  undefined4 uStack_26;
  
  if (DAT_4125_1174 == 0) {
    iVar1 = 0;
    while ((iVar1 < 0x1d && (*(char *)(DAT_3c04_0110 * 0x1d + iVar1 + 0x60b) != param_1))) {
      iVar1 = iVar1 + 1;
    }
    thunk_FUN_705a_14ac(0x6a62,iVar1,auStack_40);
    thunk_FUN_73de_032a(iVar1,uStack_28,uStack_2a,uStack_26,param_2,param_3);
  }
  return;
}

