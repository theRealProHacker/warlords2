
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far thunk_FUN_54e4_070b(int param_1,int param_2,undefined2 param_3,undefined2 param_4)

{
  int iVar1;
  undefined4 uStack_e;
  int iStack_a;
  int iStack_8;
  undefined2 uStack_6;
  undefined2 uStack_4;
  
  if (-1 < DAT_4125_0636 + -1) {
    iVar1 = *(int *)((DAT_4125_0636 + -1) * 2 + 0x3fb2);
    FUN_216d_002e(&iStack_a);
    uStack_e = *(undefined4 *)(iVar1 * 4 + 0x638);
    if ((iVar1 == 2) || (iVar1 == 10)) {
      iStack_a = iStack_a + DAT_4125_2a8c;
      uStack_e._2_2_ = (int)((ulong)uStack_e >> 0x10);
      uStack_e = CONCAT22(uStack_e._2_2_,(int)uStack_e + DAT_4125_2a8c);
    }
    iStack_a = iStack_a + param_1;
    uStack_6 = param_3;
    iStack_8 = iStack_8 + param_2;
    uStack_4 = param_4;
    uStack_e = CONCAT22(uStack_e._2_2_ + param_2,(int)uStack_e + param_1);
    FUN_1000_1e79(uStack_e);
    FUN_1997_0129();
  }
  return;
}

