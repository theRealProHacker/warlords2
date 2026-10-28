
void __cdecl16far FUN_7b71_0bab(void)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 unaff_SI;
  int iVar4;
  undefined2 unaff_DI;
  int iVar5;
  undefined2 unaff_SS;
  undefined4 uVar6;
  int local_10;
  int local_e;
  undefined1 local_8 [4];
  int local_4;
  
  uVar6 = CONCAT22(unaff_SI,unaff_DI);
  iVar2 = ((DAT_4125_23b4 * 4 + DAT_4125_23b6 * 4 + DAT_4125_23b8 * 3 + DAT_4125_23ba * 4) -
          DAT_4125_23bc) + DAT_4125_23be;
  if (0x13 < iVar2) {
    iVar2 = 0x14;
  }
  iVar5 = 0;
  iVar4 = 0;
  for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
    if (((*(int *)(iVar3 * 2 + 0x137) != 0) && (*(int *)(iVar3 * 2 + 0xd0) == 1)) &&
       (*(int *)(iVar3 * 2 + 0xc0) != 3)) {
      iVar5 = iVar5 + *(int *)(iVar3 * 2 + 0xc0) + 1;
      iVar4 = iVar4 + 1;
    }
  }
  if (iVar4 == 0) {
    iVar3 = 0x50;
  }
  else {
    iVar3 = (iVar5 * 0x50) / (iVar4 * 3);
  }
  if (0x4d < iVar3) {
    iVar3 = 0x50;
  }
  iVar2 = iVar3 + iVar2;
  local_4 = iVar2;
  uVar1 = thunk_FUN_7e8f_04f0(6,0,iVar2);
  FUN_1000_4944(0x5938,0x4125,uVar1,iVar3,iVar2,uVar6);
  thunk_FUN_7875_06ae(2,0xf,0,3);
  FUN_22bf_07a5();
  FUN_216d_000e(local_8);
  FUN_1000_1d02((undefined4 *)&DAT_4125_24e4,0x4125,&local_10,unaff_SS);
  local_10 = local_10 + -0x10;
  local_e = local_e + -0x157;
  FUN_1000_1e79(local_8._0_2_,local_8._2_2_);
  FUN_1997_0129(0x19);
  local_e = 0x4125;
  local_10 = 0x5938;
  thunk_FUN_7e8f_00d6(DAT_4125_24e0);
  local_e = 0x40c1;
  local_10 = -0x3c00;
  FUN_22bf_0757();
  return;
}

