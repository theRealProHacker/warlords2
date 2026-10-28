
/* WARNING: Instruction at (ram,0x0006d9f8) overlaps instruction at (ram,0x0006d9f6)
    */
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Removing unreachable block (ram,0x0006daa9) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_6d27_034a(void)

{
  byte *pbVar1;
  int *piVar2;
  code *pcVar3;
  undefined2 uVar4;
  undefined2 *puVar5;
  int iVar6;
  char cVar7;
  undefined4 in_EDX;
  int iVar8;
  int iVar9;
  undefined2 unaff_SS;
  int local_40 [8];
  int local_30 [8];
  undefined2 local_20;
  undefined1 local_1a [12];
  int local_e;
  int *local_c;
  undefined4 local_8;
  int local_4;
  
  if (DAT_4125_0dc4 == 0) {
    DAT_451b_04c6 = 0x4042;
    DAT_451b_04c4 = (code *)((int)(undefined2 *)&DAT_4125_0083 + 1);
    local_4 = 10;
    for (iVar8 = 1; iVar8 <= DAT_451b_04dc + -1; iVar8 = iVar8 + 1) {
      iVar9 = FUN_6d27_10eb(iVar8);
      uVar4 = (undefined2)in_EDX;
      local_8 = (undefined2 *)CONCAT22(uVar4,iVar9);
      for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
        piVar2 = (int *)(iVar9 + iVar6 * 2);
        local_c = (int *)CONCAT22(uVar4,piVar2);
        if (local_4 <= *piVar2) {
          local_4 = *piVar2;
        }
      }
    }
  }
  else if (DAT_4125_0dc4 == 2) {
    DAT_451b_04c6 = 0x4042;
    DAT_451b_04c4 = (code *)0x93;
    local_4 = 500;
    for (iVar8 = 1; iVar8 <= DAT_451b_04dc + -1; iVar8 = iVar8 + 1) {
      iVar9 = FUN_6d27_119c(iVar8);
      uVar4 = (undefined2)in_EDX;
      local_8 = (undefined2 *)CONCAT22(uVar4,iVar9);
      for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
        piVar2 = (int *)(iVar9 + iVar6 * 2);
        local_c = (int *)CONCAT22(uVar4,piVar2);
        if (local_4 <= *piVar2) {
          local_4 = *piVar2;
        }
      }
    }
  }
  else if (DAT_4125_0dc4 == 3) {
    DAT_451b_04c6 = 0x4042;
    DAT_451b_04c4 = (code *)((int)(undefined2 *)&DAT_4125_008d + 1);
    local_4 = 100;
    for (iVar8 = 1; iVar8 <= DAT_451b_04dc + -1; iVar8 = iVar8 + 1) {
      iVar9 = FUN_6d27_1161(iVar8);
      uVar4 = (undefined2)in_EDX;
      local_8 = (undefined2 *)CONCAT22(uVar4,iVar9);
      for (iVar6 = 0; iVar6 < 8; iVar6 = iVar6 + 1) {
        piVar2 = (int *)(iVar9 + iVar6 * 2);
        local_c = (int *)CONCAT22(uVar4,piVar2);
        if (local_4 <= *piVar2) {
          local_4 = *piVar2;
        }
      }
    }
  }
  FUN_22bf_07a5();
  FUN_24d0_0002(0);
  FUN_2133_0344(DAT_4125_0dc6 + -1,DAT_4125_0dc8 + -1,DAT_4125_0dcc);
  FUN_2133_02fe(DAT_4125_0dc6 + -1,DAT_4125_0dc8 + DAT_4125_0dcc + -2,DAT_4125_0dca);
  FUN_2133_02fe(DAT_4125_0dc6 + -5,DAT_4125_0dc8 + -1,4);
  FUN_2133_02fe(DAT_4125_0dc6 + -5,DAT_4125_0dc8 + DAT_4125_0dcc / 2 + -1,4);
  FUN_2133_02fe(DAT_4125_0dc6 + -5,DAT_4125_0dc8 + DAT_4125_0dcc + -2,4);
  FUN_2133_0344(DAT_4125_0dc6 + -1,DAT_4125_0dc8 + DAT_4125_0dcc + -2,4);
  FUN_2133_0344(DAT_4125_0dc6 + DAT_4125_0dca / 2 + -1,DAT_4125_0dc8 + DAT_4125_0dcc + -2,4);
  FUN_2133_0344(DAT_4125_0dc6 + DAT_4125_0dca + -2,DAT_4125_0dc8 + DAT_4125_0dcc + -2,4);
  FUN_24d0_0002(0xf);
  FUN_2133_0344(_DAT_4125_0dc6,DAT_4125_0dcc);
  FUN_2133_02fe(DAT_4125_0dc6,DAT_4125_0dc8 + DAT_4125_0dcc + -1,DAT_4125_0dca);
  FUN_2133_02fe(DAT_4125_0dc6 + -4,(int)((ulong)_DAT_4125_0dc6 >> 0x10),4);
  FUN_2133_02fe(DAT_4125_0dc6 + -4,DAT_4125_0dc8 + DAT_4125_0dcc / 2,4);
  FUN_2133_02fe(DAT_4125_0dc6 + -4,DAT_4125_0dc8 + DAT_4125_0dcc + -1,4);
  FUN_2133_0344(DAT_4125_0dc6,DAT_4125_0dc8 + DAT_4125_0dcc + -1,4);
  FUN_2133_0344(DAT_4125_0dc6 + DAT_4125_0dca / 2,DAT_4125_0dc8 + DAT_4125_0dcc + -1,4);
  FUN_2133_0344(DAT_4125_0dc6 + DAT_4125_0dca + -1,DAT_4125_0dc8 + DAT_4125_0dcc + -1,4);
  FUN_1000_4944(local_1a);
  thunk_FUN_7e8f_0103(DAT_4125_0dc6 + -8,DAT_4125_0dc8 + DAT_4125_0dcc + -8,0xde9,0x4125);
  thunk_FUN_7e8f_0103(DAT_4125_0dc6 + -8,DAT_4125_0dc8 + -6);
  FUN_1000_4944(local_1a);
  thunk_FUN_7e8f_00d6(DAT_4125_0dc6,DAT_4125_0dc8 + DAT_4125_0dcc + 8,0xdee,0x4125);
  thunk_FUN_7e8f_0103(DAT_4125_0dc6 + DAT_4125_0dca + 8);
  iVar8 = DAT_4125_0dc6 + DAT_4125_0dca / 2;
  thunk_FUN_7e8f_00d6(iVar8,DAT_4125_0dc8 + DAT_4125_0dcc + 8,0xdf0,0x4125);
  for (iVar9 = 0; iVar9 < 8; iVar9 = iVar9 + 1) {
    local_30[iVar9] = DAT_4125_0dc6 + 1;
    local_40[iVar9] = DAT_4125_0dc8 + DAT_4125_0dcc + -2;
  }
  iVar9 = 1;
  if (DAT_451b_04dc + -1 < 1) {
    FUN_22bf_0757();
    return;
  }
  iVar6 = iVar9;
  puVar5 = (undefined2 *)(*DAT_451b_04c4)();
  local_8 = (undefined2 *)CONCAT22(iVar8,puVar5);
  local_e = DAT_4125_0dc6 + DAT_4125_0dca / (DAT_451b_04dc + -1);
  iVar8 = iVar6;
  do {
    while( true ) {
      cVar7 = (char)((ulong)local_8 >> 0x10);
      local_c = local_8;
      local_20 = *local_8;
      pcVar3 = (code *)swi(0x3b);
      puVar5 = (undefined2 *)local_8;
      (*pcVar3)();
      iVar6 = iVar6 + -1;
      if (iVar6 != 0) {
        if (iVar6 != 0) {
          return;
        }
        *(char *)((int)puVar5 + iVar9) = *(char *)((int)puVar5 + iVar9) + cVar7;
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      *(char *)(puVar5 + -0xedd) = *(char *)(puVar5 + -0xedd) + -1;
      pcVar3 = (code *)swi(0x3b);
      (*pcVar3)();
      iVar9 = iVar9 + 3;
      iVar6 = iVar6 + -1;
      if (iVar6 == 0) break;
      pbVar1 = (byte *)(puVar5 + -0x5d5);
      *pbVar1 = *pbVar1 >> 1 | *pbVar1 << 7;
    }
    pcVar3 = (code *)swi(0x35);
    iVar9 = iVar8;
    (*pcVar3)();
    in(0xcd);
    iVar6 = iVar6 + -1;
    iVar8 = iVar9;
  } while (iVar6 != 0);
  pcVar3 = (code *)swi(0x34);
  (*pcVar3)();
  in(0x9a);
  pcVar3 = (code *)swi(3);
  (*pcVar3)();
  return;
}

