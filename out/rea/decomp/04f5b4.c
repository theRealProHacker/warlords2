
void __cdecl16far FUN_4f57_0044(int param_1)

{
  bool bVar1;
  undefined2 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 local_16;
  int local_12;
  int local_10;
  undefined4 local_e;
  undefined4 local_a;
  undefined4 local_6;
  
  uVar2 = thunk_FUN_7e8f_02bf();
  local_6 = CONCAT22(local_6._2_2_,uVar2);
  uVar2 = thunk_FUN_7e8f_02bf();
  local_6 = CONCAT22(uVar2,(int)local_6);
  uVar2 = thunk_FUN_7e8f_02bf();
  local_a = CONCAT22(local_a._2_2_,uVar2);
  iVar3 = thunk_FUN_7e8f_02bf();
  local_a = CONCAT22(iVar3,(int)local_a);
  local_e = local_6;
  if (((int)local_6 == (int)local_a) && (local_6._2_2_ == iVar3)) {
    bVar1 = true;
  }
  else {
    bVar1 = false;
  }
  while (!bVar1) {
    thunk_FUN_4c45_0dd0(local_e,local_a,&local_12);
    iVar4 = 0;
    iVar3 = -1;
    while( true ) {
      uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      if (7 < iVar4) break;
      iVar5 = (int)DAT_451b_002a + iVar4 * 4;
      if ((*(int *)(iVar5 + 0xbc) == local_12) && (*(int *)(iVar5 + 0xbe) == local_10)) {
        iVar3 = iVar4;
      }
      iVar4 = iVar4 + 1;
    }
    iVar4 = (iVar3 + 1) % 8;
    iVar3 = (iVar3 + 7) % 8;
    if (param_1 != 0) {
      if ((*(char *)((int)DAT_451b_002a + local_e._2_2_ * 0x70 + (int)local_e + 0x6120) == '\x06')
         || (*(char *)((int)DAT_451b_002a + local_e._2_2_ * 0x70 + (int)local_e + 0x6120) == '\x05')
         ) {
        local_16 = local_e;
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 7;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar4 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe),
                            (int)local_e + *(int *)(iVar5 + 0xbc));
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 7;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar3 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe),
                            (int)local_e + *(int *)(iVar5 + 0xbc));
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 7;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar4 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe) * 2,
                            (int)local_e + *(int *)(iVar5 + 0xbc) * 2);
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 7;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar3 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe) * 2,
                            (int)local_e + *(int *)(iVar5 + 0xbc) * 2);
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 7;
        thunk_FUN_4bea_03aa(local_16);
      }
    }
    if (param_1 == 0) {
      if (*(char *)((int)DAT_451b_002a + local_e._2_2_ * 0x70 + (int)local_e + 0x6120) == '\x06') {
        local_16 = local_e;
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 5;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar4 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe),
                            (int)local_e + *(int *)(iVar5 + 0xbc));
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 5;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar5 = (int)DAT_451b_002a + iVar3 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar5 + 0xbe),
                            (int)local_e + *(int *)(iVar5 + 0xbc));
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 5;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar4 = (int)DAT_451b_002a + iVar4 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe) * 2,
                            (int)local_e + *(int *)(iVar4 + 0xbc) * 2);
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 5;
        thunk_FUN_4bea_03aa(local_16);
        uVar2 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
        iVar3 = (int)DAT_451b_002a + iVar3 * 4;
        local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar3 + 0xbe) * 2,
                            (int)local_e + *(int *)(iVar3 + 0xbc) * 2);
        thunk_FUN_4bea_0470(&local_16);
        *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 5;
        thunk_FUN_4bea_03aa(local_16);
      }
    }
    iVar3 = (int)local_e + local_12;
    local_e._2_2_ = local_e._2_2_ + local_10;
    local_e = CONCAT22(local_e._2_2_,iVar3);
    if ((iVar3 == (int)local_a) && (local_e._2_2_ == local_a._2_2_)) {
      bVar1 = true;
    }
  }
  return;
}

