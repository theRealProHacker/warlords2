
/* WARNING: Removing unreachable block (ram,0x0007f4fe) */
/* WARNING: Removing unreachable block (ram,0x0007f515) */
/* WARNING: Removing unreachable block (ram,0x0007f567) */
/* WARNING: Removing unreachable block (ram,0x0007f535) */
/* WARNING: Removing unreachable block (ram,0x0007f545) */
/* WARNING: Removing unreachable block (ram,0x0007f540) */
/* WARNING: Removing unreachable block (ram,0x0007f547) */
/* WARNING: Removing unreachable block (ram,0x0007f56c) */

void __cdecl16far FUN_7f3a_011e(void)

{
  int iVar1;
  undefined2 uVar2;
  
  FUN_18a9_066e(0x10064);
  FUN_18a9_066e(0x10067);
  iVar1 = thunk_FUN_76ef_0e25();
  if (iVar1 == 0) {
    uVar2 = 2;
  }
  else {
    uVar2 = 1;
  }
  FUN_18a9_066e(0x65,uVar2);
  FUN_18a9_066e(0x66,1);
  FUN_18a9_03b3();
  FUN_18a9_03b3();
  for (iVar1 = 0; iVar1 < 4; iVar1 = iVar1 + 1) {
    FUN_18a9_03b3();
    FUN_18a9_03b3();
  }
  FUN_2372_0eab(0);
  FUN_2372_0ef8(0x1f2);
  FUN_2372_0ef8(500);
  FUN_2372_0ef8(0x1f5);
  FUN_2372_0ef8(0x1f7);
  iVar1 = thunk_FUN_76ef_0e25();
  FUN_2372_0ef8(0x1f6,iVar1 != 0);
  iVar1 = thunk_FUN_76ef_0e42();
  FUN_2372_0ef8(0x1f8,iVar1 != 0);
  FUN_2372_0ef8(0x101f9);
  FUN_2372_0eab(2);
  FUN_2372_0eab(3);
  FUN_2372_0eab(4);
  FUN_2372_0eab(5);
  FUN_2372_0eab(7);
  return;
}

