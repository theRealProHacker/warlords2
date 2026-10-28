
void __cdecl16far FUN_4eb0_005d(int param_1,int param_2,int param_3)

{
  bool bVar1;
  bool bVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined4 local_16;
  int local_12;
  int local_10;
  undefined4 local_e;
  undefined4 local_a;
  undefined4 local_6;
  
  bVar1 = false;
  if (param_3 == 0) {
    for (iVar4 = 0; iVar4 < 200; iVar4 = iVar4 + 1) {
      uVar3 = thunk_FUN_7e8f_02bf();
      local_6 = CONCAT22(local_6._2_2_,uVar3);
      iVar10 = thunk_FUN_7e8f_02bf();
      local_6 = CONCAT22(iVar10,(int)local_6);
      uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      if ((*(char *)((int)DAT_451b_002a + iVar10 * 0x70 + (int)local_6 + 0x6120) == '\x05') ||
         (*(char *)((int)DAT_451b_002a + iVar10 * 0x70 + (int)local_6 + 0x6120) == '\x06')) break;
    }
    for (iVar4 = 0; iVar4 < 200; iVar4 = iVar4 + 1) {
      uVar3 = thunk_FUN_7e8f_02bf();
      local_a = CONCAT22(local_a._2_2_,uVar3);
      iVar10 = thunk_FUN_7e8f_02bf();
      local_a = CONCAT22(iVar10,(int)local_a);
      uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      if ((*(char *)((int)DAT_451b_002a + iVar10 * 0x70 + (int)local_a + 0x6120) == '\x02') ||
         (*(char *)((int)DAT_451b_002a + iVar10 * 0x70 + (int)local_a + 0x6120) == '\x03')) break;
    }
  }
  else {
    local_6 = local_6 & 0xffff0000;
    uVar3 = thunk_FUN_7e8f_02bf();
    local_6 = CONCAT22(uVar3,(int)local_6);
    local_a = CONCAT22(local_a._2_2_,0x6f);
    uVar3 = thunk_FUN_7e8f_02bf();
    local_a = CONCAT22(uVar3,(int)local_a);
  }
  local_e = local_6;
  if ((int)local_6 == (int)local_a) {
    if (local_6._2_2_ == local_a._2_2_) {
      bVar2 = true;
      goto LAB_4eb0_05ff;
    }
  }
  bVar2 = false;
LAB_4eb0_05ff:
  if (bVar2) {
    return;
  }
  thunk_FUN_4c45_0dd0(local_e,local_a);
  iVar10 = 0;
  iVar4 = -1;
  while( true ) {
    iVar8 = (int)DAT_451b_002a;
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    if (7 < iVar10) break;
    iVar8 = iVar8 + iVar10 * 4;
    if ((*(int *)(iVar8 + 0xbc) == local_12) && (*(int *)(iVar8 + 0xbe) == local_10)) {
      iVar4 = iVar10;
    }
    iVar10 = iVar10 + 1;
  }
  iVar5 = (iVar4 + 1) % 8;
  iVar6 = (iVar4 + 7) % 8;
  iVar10 = (iVar4 + 2) % 8;
  iVar7 = (iVar4 + 6) % 8;
  if (param_2 != 0) {
    iVar9 = iVar8 + iVar4 * 4;
    if ((*(char *)(iVar8 + (local_e._2_2_ + *(int *)(iVar9 + 0xbe)) * 0x70 + (int)local_e +
                   *(int *)(iVar9 + 0xbc) + 0x6120) == '\x02') && (bVar1)) {
      bVar2 = true;
    }
    iVar4 = iVar8 + iVar4 * 4;
    if ((*(char *)(iVar8 + (local_e._2_2_ + *(int *)(iVar4 + 0xbe)) * 0x70 + (int)local_e +
                   *(int *)(iVar4 + 0xbc) + 0x6120) == '\x02') && (!bVar1)) {
      bVar1 = true;
    }
  }
  if (param_1 == 0) {
    local_16 = local_e;
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar5 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe),(int)local_e + *(int *)(iVar4 + 0xbc)
                       );
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar6 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe),(int)local_e + *(int *)(iVar4 + 0xbc)
                       );
LAB_4eb0_0551:
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
  }
  else {
    local_16 = local_e;
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar5 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe),(int)local_e + *(int *)(iVar4 + 0xbc)
                       );
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar6 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe),(int)local_e + *(int *)(iVar4 + 0xbc)
                       );
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar5 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe) * 2,
                        (int)local_e + *(int *)(iVar4 + 0xbc) * 2);
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    iVar4 = (int)DAT_451b_002a + iVar6 * 4;
    local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe) * 2,
                        (int)local_e + *(int *)(iVar4 + 0xbc) * 2);
    thunk_FUN_4bea_0470(&local_16);
    *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
    thunk_FUN_4bea_03aa(local_16);
    if (param_3 != 0) {
      uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar4 = (int)DAT_451b_002a + iVar5 * 4;
      local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe) * 3,
                          (int)local_e + *(int *)(iVar4 + 0xbc) * 3);
      thunk_FUN_4bea_0470(&local_16);
      *(undefined1 *)((int)DAT_451b_002a + local_16._2_2_ * 0x70 + (int)local_16 + 0x6120) = 2;
      thunk_FUN_4bea_03aa(local_16);
      uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
      iVar4 = (int)DAT_451b_002a + iVar6 * 4;
      local_16 = CONCAT22(local_e._2_2_ + *(int *)(iVar4 + 0xbe) * 3,
                          (int)local_e + *(int *)(iVar4 + 0xbc) * 3);
      goto LAB_4eb0_0551;
    }
  }
  iVar4 = (int)local_e + local_12;
  local_e._2_2_ = local_e._2_2_ + local_10;
  local_e = CONCAT22(local_e._2_2_,iVar4);
  if ((iVar4 == (int)local_a) && (local_e._2_2_ == local_a._2_2_)) {
    bVar2 = true;
  }
  iVar4 = thunk_FUN_7e8f_02bf();
  iVar8 = (int)DAT_451b_002a;
  uVar3 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
  if (iVar4 != 2) goto code_r0x0004f0b7;
  iVar4 = *(int *)(iVar8 + iVar10 * 4 + 0xbc);
  goto LAB_4eb0_05ee;
code_r0x0004f0b7:
  if (iVar4 == 3) {
    iVar4 = *(int *)(iVar8 + iVar7 * 4 + 0xbc);
    iVar10 = iVar7;
LAB_4eb0_05ee:
    local_e = CONCAT22(local_e._2_2_ + *(int *)(iVar8 + iVar10 * 4 + 0xbe),(int)local_e + iVar4);
  }
  goto LAB_4eb0_05ff;
}

