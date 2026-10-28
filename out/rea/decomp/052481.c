
void __cdecl16far FUN_5131_1171(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  undefined1 local_110 [256];
  int local_10;
  undefined2 uStack_e;
  char *local_c;
  undefined2 uStack_a;
  char *local_8;
  int local_4;
  
  FUN_5131_1468(param_1);
  iVar1 = thunk_FUN_7e8f_02bf(1,8,0);
  *(int *)(param_1 * 0x41 + 0x15a7) = param_2 * 2 + iVar1 + 0xe;
  thunk_FUN_7e8f_02bf(1,3,param_2 + -2);
  iVar1 = thunk_FUN_7e8f_02bf(1,3,param_2 + -2);
  if (iVar1 < 1) {
    iVar1 = 0;
  }
  if (8 < iVar1) {
    iVar1 = 9;
  }
  if ((((DAT_4125_02d8 == 0) && (DAT_4125_02de == 0)) && (DAT_4125_02dc == 0)) ||
     (iVar2 = thunk_FUN_7e8f_02bf(1,100,0), 0x4f < iVar2)) {
    iVar2 = thunk_FUN_7e8f_02bf(1,100,0);
    if (iVar2 < 0x32) {
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      local_8 = (char *)CONCAT22((int)((ulong)DAT_451b_002a >> 0x10),
                                 (char *)s_DATA_AREA_DAT_4125_16a8 +
                                 (int)DAT_451b_002a + iVar2 * 0x10);
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      local_c = (char *)s_Button_file_not_found_4125_1744 + 4 + (int)DAT_451b_002a + iVar2 * 0x10;
      uStack_a = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      iVar2 = (int)DAT_451b_002a + iVar2 * 0x10 + 0x17e8;
      uVar3 = DAT_451b_002a._2_2_;
    }
    else {
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      local_8 = (char *)CONCAT22((int)((ulong)DAT_451b_002a >> 0x10),
                                 (char *)s_Couldn_t_allocate_the_temp_mask_b_4125_14c7 + 1 +
                                 (int)DAT_451b_002a + iVar2 * 0x10);
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      local_c = (char *)((int)DAT_451b_002a + iVar2 * 0x10 + 0x1568);
      uStack_a = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
      iVar2 = (int)DAT_451b_002a + iVar2 * 0x10 + 0x1608;
      uVar3 = DAT_451b_002a._2_2_;
    }
  }
  else {
    if (DAT_4125_02de == 0) {
      if (DAT_4125_02dc == 0) {
        uVar3 = 0xffff;
      }
      else {
        uVar3 = 3;
      }
      uVar4 = 4;
    }
    else {
      uVar4 = 2;
      uVar3 = 7;
    }
    local_4 = thunk_FUN_7e8f_02bf(1,uVar4,uVar3);
    iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
    local_8 = (char *)CONCAT22((int)((ulong)DAT_451b_002a >> 0x10),
                               (char *)((int)DAT_451b_002a + iVar2 * 0x10 + 0x12e8));
    iVar2 = thunk_FUN_7e8f_02bf(1,10,0xffff);
    local_c = (char *)((int)DAT_451b_002a + iVar2 * 0x10 + 5000);
    uStack_a = DAT_451b_002a._2_2_;
    iVar2 = (int)DAT_451b_002a + local_4 * 0x10 + 0x1428;
    uVar3 = DAT_451b_002a._2_2_;
  }
  _local_10 = CONCAT22(uVar3,iVar2);
  thunk_FUN_7e8f_02bf(1,0xffff0003,
                      (int)(undefined4 *)&DAT_4125_1248 + (int)DAT_451b_002a + iVar1 * 0x10,
                      DAT_451b_002a._2_2_,local_8,local_c,uStack_a,iVar2,uVar3);
  FUN_1000_4944(local_110);
  uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
  FUN_1000_4a70((undefined1 *)&DAT_4125_1f56 +
                (int)DAT_451b_002a +
                *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 7 + (int)DAT_451b_002a
                        ),uVar3,local_110);
  iVar1 = FUN_1000_4a99(local_110);
  uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
  *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 7 + (int)DAT_451b_002a) =
       *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 7 + (int)DAT_451b_002a) + iVar1
  ;
  return;
}

