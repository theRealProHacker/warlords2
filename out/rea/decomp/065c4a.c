
void __cdecl16far FUN_6513_0b1a(void)

{
  int *piVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  
  FUN_22bf_07a5();
  iVar2 = thunk_FUN_7e8f_02bf(3,500,500);
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 + iVar2;
  uVar3 = thunk_FUN_7e8f_04f0(0x3b,0);
  FUN_6513_15d5(uVar3,in_DX);
  uVar3 = thunk_FUN_7e8f_04f0(0x3b,1,iVar2);
  FUN_1000_4944(0x5c38,0x4125,uVar3,in_DX);
  FUN_6513_15d5(0x5c38,0x4125);
  thunk_FUN_54e4_070b(8,0x116,0xf0,0x17);
  FUN_18a9_03b3(0x118);
  FUN_18a9_03b3(0x119);
  FUN_18a9_03b3(0x117);
  FUN_18a9_066e(0x11a,1);
  FUN_22bf_0757();
  return;
}

