
void __cdecl16far thunk_FUN_67a7_1a41(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined2 unaff_SS;
  undefined4 uStack_12;
  undefined4 uStack_e;
  undefined1 auStack_a [8];
  
  thunk_FUN_891f_0227(DAT_3c04_017d,DAT_3c04_017f);
  thunk_FUN_85d0_0053();
  FUN_1997_034a();
  FUN_1000_1d02(param_3 * 8 + 0xd02,0x4125,&uStack_12,unaff_SS);
  iVar1 = (param_1 - DAT_3c04_0177) * 0x28;
  iVar2 = (param_2 - DAT_3c04_0175) * 0x28;
  (*DAT_451b_2a68)(0x1000,0x5731,0x4125,uStack_12,uStack_e,0x6795,0x4125,iVar1,iVar2,0x56f6,0x4125,
                   uStack_12,iVar1,iVar2);
  FUN_216d_002e(auStack_a);
  FUN_24d0_009d(0x6795,0x4125,auStack_a);
  thunk_FUN_85d0_1927();
  return;
}

