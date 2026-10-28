
void __cdecl16far FUN_1997_03a9(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined2 uVar3;
  undefined1 *in_DX;
  undefined2 unaff_SS;
  undefined1 local_a8 [52];
  undefined1 local_74;
  undefined2 local_73;
  undefined1 local_6c [50];
  undefined1 local_3a [50];
  uint local_8;
  undefined1 *local_6;
  
  FUN_1000_4a70(local_6c);
  if ((((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 3) == 1) {
    FUN_1000_4944(local_6c);
  }
  else if ((((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 3) == 2) {
    FUN_1000_4944(local_6c);
  }
  else {
    FUN_1000_4a70(local_6c);
  }
  if ((((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 0x10) == 0) {
    unaff_SS = *(undefined2 *)(param_1 * 0xc + 0x1f59);
    in_DX = (undefined1 *)*(int *)(param_1 * 0xc + 0x1f57);
    local_6 = in_DX;
  }
  else {
    local_74 = 0;
    local_73 = 0;
    local_6 = local_a8;
  }
  thunk_FUN_7e8f_0505(3,param_1);
  iVar2 = FUN_197b_0005(local_6,unaff_SS,local_6c);
  if (iVar2 == 0) {
    uVar3 = thunk_FUN_7e8f_0505(3,param_1);
    thunk_FUN_7e8f_051a(1,0,uVar3,in_DX);
    FUN_1000_4944(local_3a);
    thunk_FUN_79a9_0000(local_3a);
  }
  ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] = ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] | 4;
  if ((((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 0x20) != 0) {
    local_8 = ((byte)((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 0x40) >> 6;
    FUN_251d_00cf();
    ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] =
         ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 0xbf;
    ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] =
         ((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] | ((byte)local_8 & 1) << 6;
  }
  if ((((undefined1 *)&DAT_4125_1f56)[param_1 * 0xc] & 0x10) != 0) {
    uVar1 = *(undefined4 *)(param_1 * 0xc + 0x1f57);
    FUN_2012_09cf((int)uVar1,(int)((ulong)uVar1 >> 0x10));
    uVar1 = *(undefined4 *)(param_1 * 0xc + 0x1f57);
    FUN_2012_01fe((int)uVar1,(int)((ulong)uVar1 >> 0x10),(int)local_a8._4_4_,SUB42(local_a8._4_4_,2)
                 );
    (*DAT_451b_2a74)(0x2012,local_a8);
    FUN_2012_0975(local_a8);
  }
  return;
}

