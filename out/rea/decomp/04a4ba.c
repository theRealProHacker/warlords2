
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Instruction at (ram,0x00040001) overlaps instruction at (ram,0x00040000)
    */
/* WARNING: Removing unreachable block (ram,0x0004a544) */
/* WARNING: Removing unreachable block (ram,0x0004a516) */
/* WARNING: Removing unreachable block (ram,0x0004a51b) */
/* WARNING: Removing unreachable block (ram,0x0004a520) */
/* WARNING: Removing unreachable block (ram,0x0004a54b) */
/* WARNING: Removing unreachable block (ram,0x00063dc4) */

void __cdecl16far FUN_4974_0d7a(int param_1)

{
  char *pcVar1;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  int iVar5;
  undefined1 auStack_bc [80];
  undefined1 auStack_6c [66];
  undefined2 uStack_2a;
  undefined2 uStack_28;
  int iStack_26;
  undefined2 uStack_24;
  undefined4 uStack_22;
  undefined4 uStack_1e;
  undefined4 uStack_16;
  undefined4 uStack_12;
  int iStack_c;
  uint local_4;
  
  uStack_16 = CONCAT22(10,(undefined2)uStack_16);
  uStack_1e = CONCAT22(0x3c04,*(char *)((int)DAT_451b_1efe + 10) * 0x14 + 0x223);
  uStack_22 = 0;
  uStack_24 = 3;
  iStack_26 = DAT_3c04_0110;
  uStack_28 = 0x4974;
  uStack_2a = 0xa4f3;
  thunk_FUN_6d27_1244();
  uVar4 = 1;
  uStack_1e = DAT_451b_1efe;
  uStack_22 = 0x4042a503;
  iVar2 = FUN_1b62_0044();
  if (param_1 == 0) {
    uStack_1e = 0xffff000a;
    uStack_22 = 0x11b62;
    uStack_24 = 0xa55e;
    iVar5 = thunk_FUN_7e8f_02bf();
    local_4 = *(uint *)(iVar5 * 2 + 0xa0);
  }
  else {
    uStack_1e = 0xffff0005;
    uStack_22 = 0x11b62;
    uStack_24 = 0xa52f;
    iVar5 = thunk_FUN_7e8f_02bf();
    if (iVar5 == 0) {
      local_4 = 5;
    }
    else {
      local_4 = 4;
    }
  }
  iVar5 = DAT_3c04_0110 * 0xc;
  ((char *)s_Unexplored__4125_10f9 + 10 + iVar5)[0] = '\x01';
  ((char *)s_Unexplored__4125_10f9 + 10 + iVar5)[1] = '\0';
  *(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) = iVar2;
  *(uint *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) = local_4;
  if (6 < local_4) {
    return;
  }
  switch(local_4) {
  case 0:
    break;
  default:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  case 2:
  case 4:
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  pcVar1 = (char *)(local_4 * 2 + iVar2);
  *pcVar1 = *pcVar1 + '\x04';
  iVar2 = DAT_3c04_0110;
  uStack_1e = CONCAT22(&stack0xfffe,(undefined2)uStack_1e);
  DAT_4125_0a3e = 1;
  DAT_4125_0a3a = 1;
  DAT_4125_0a3c = iStack_c;
  thunk_FUN_7e8f_04f0(0xffff0042,uStack_16);
  FUN_1000_4944(auStack_6c);
  thunk_FUN_7e8f_04f0(0xffff0043,uStack_12);
  FUN_1000_4944(auStack_bc);
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  uVar3 = thunk_FUN_7e8f_04f0(0x41);
  thunk_FUN_7e8f_00d6(DAT_4125_0a40,uVar3,uVar4);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  thunk_FUN_7e8f_00d6(DAT_4125_0a44,auStack_6c);
  thunk_FUN_7e8f_00d6(DAT_4125_0a48,auStack_bc);
  uVar3 = thunk_FUN_7e8f_04f0(0x10041);
  thunk_FUN_7e8f_00d6(DAT_4125_0a4c,uVar3,uVar4);
  uVar3 = thunk_FUN_7e8f_04f0(0x20041);
  thunk_FUN_7e8f_00d6(DAT_4125_0a50,uVar3,uVar4);
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  FUN_17be_0001(0x11d011c);
  FUN_17be_0001(0x11d011b);
  FUN_17be_0001(0x11d011e);
  if ((DAT_3c04_011e != 0) && (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + iVar2 * 0xc) != 0)) {
    uVar4 = 0x2e1d;
    if ((DAT_451b_1efe._2_2_ == 0x2e1d) &&
       (*(int *)((char *)s_Explored__4125_1105 + 2 + iVar2 * 0xc) * 0x16 + -0x7780 ==
        (int)DAT_451b_1efe)) {
      if ((*(int *)((char *)s_Explored__4125_1105 + iVar2 * 0xc) == 5) &&
         (*(int *)((char *)s_Explored__4125_1105 + 4 + iVar2 * 0xc) == iStack_c)) {
        uVar3 = 0x11c;
      }
      else {
        if (*(int *)((char *)s_Explored__4125_1105 + iVar2 * 0xc) != 6) goto LAB_63da_0210;
        iVar2 = FUN_63da_07d0();
        if (iVar2 == 0) {
          iVar2 = FUN_63da_0834();
          if (iVar2 == 0) goto LAB_63da_0210;
          uVar3 = 0x11b;
        }
        else {
          uVar3 = 0x11e;
        }
      }
      FUN_17be_0001(0x11d,uVar3);
    }
  }
LAB_63da_0210:
  FUN_18a9_066e(0x1011d);
  iVar2 = FUN_63da_0834();
  if (iVar2 == 0) {
    uVar3 = 2;
  }
  else {
    uVar3 = 1;
  }
  FUN_18a9_066e(0x11b,uVar3);
  iVar2 = FUN_63da_07d0();
  if (iVar2 == 0) {
    uVar3 = 2;
  }
  else {
    uVar3 = 1;
  }
  FUN_18a9_066e(0x11e,uVar3);
  FUN_18a9_066e(0x1011c);
  FUN_22bf_0757();
  if ((DAT_3c04_012e != 0) && (DAT_4125_0a54 == 0)) {
    DAT_4125_0a54 = 1;
    uVar3 = thunk_FUN_7e8f_0505(0xa0019);
    thunk_FUN_8027_168d(uVar3,uVar4);
  }
  return;
}

