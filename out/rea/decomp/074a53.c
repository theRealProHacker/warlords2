
void __cdecl16far FUN_73de_0c73(int param_1)

{
  undefined2 uVar1;
  int unaff_SS;
  undefined2 uVar2;
  int iVar3;
  int *piVar4;
  int local_c;
  int *piStack_a;
  
  if (*(char *)(param_1 * 0x41 + 0x1592) == '\x0f') {
    uVar1 = *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0);
    uVar2 = *(undefined2 *)(DAT_3c04_0110 * 2 + 0xa0);
  }
  else {
    uVar1 = *(undefined2 *)(*(char *)(param_1 * 0x41 + 0x1592) * 2 + 0xb0);
    uVar2 = *(undefined2 *)(*(char *)(param_1 * 0x41 + 0x1592) * 2 + 0xa0);
  }
  thunk_FUN_7875_06ae(2,uVar2,CONCAT22(3,uVar1));
  thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,DAT_451b_052a + 0xb,
                      param_1 * 0x41 + 0x1581,0x3c04);
  if (*(char *)(*(byte *)(*(int *)(param_1 * 0x41 + 0x157f) * 0xe0 +
                         *(int *)(param_1 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
    if (*(char *)(param_1 * 0x41 + 0x1592) < '\b') {
      thunk_FUN_85d0_0bf7((int)*(char *)(param_1 * 0x41 + 0x1592),3,0x342a,0x4125,
                          DAT_451b_0528 + 0x18,DAT_451b_052a + 10);
      thunk_FUN_85d0_0bf7((int)*(char *)(param_1 * 0x41 + 0x1592),3,0x342a,0x4125,
                          DAT_451b_0528 + DAT_451b_052c + -0x30,DAT_451b_052a + 10);
    }
    iVar3 = DAT_4125_1042 + DAT_451b_0532;
    FUN_1000_1e79(CONCAT22(iVar3,DAT_4125_1040 + DAT_451b_0530));
    FUN_1997_0129(8);
    FUN_1000_4944();
    thunk_FUN_7e8f_00bf(unaff_SS + 0x20,iVar3 + -3,&local_c);
    FUN_1000_1e79(DAT_4125_1044 + DAT_451b_0530,iVar3);
    FUN_1997_0129(8);
    piStack_a = (int *)0x4125;
    local_c = 0x10e2;
    piVar4 = &local_c;
    FUN_1000_4944(piVar4);
    piStack_a = &local_c;
    local_c = unaff_SS + -3;
    thunk_FUN_7e8f_00bf(piVar4 + 0x10);
  }
  else {
    thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,DAT_451b_052a + 0x23,0x10d8,0x4125);
  }
  iVar3 = 0;
  while( true ) {
    if (7 < iVar3) {
      return;
    }
    if ((*(int *)(iVar3 * 0x14 + 0x193) == *(int *)(param_1 * 0x41 + 0x157d)) &&
       (*(int *)(iVar3 * 0x14 + 0x195) == *(int *)(param_1 * 0x41 + 0x157f))) break;
    iVar3 = iVar3 + 1;
  }
  if (*(char *)(*(byte *)(*(int *)(param_1 * 0x41 + 0x157f) * 0xe0 +
                         *(int *)(param_1 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
    piStack_a = (int *)(DAT_451b_0528 + DAT_451b_052c / 2 + -0x18);
  }
  else {
    piStack_a = (int *)(DAT_451b_0528 + 0x10);
    local_c = 0x4125;
    thunk_FUN_85d0_0bf7(iVar3,4,0x342a);
    piStack_a = (int *)(DAT_451b_0528 + DAT_451b_052c + -0x38);
  }
  local_c = 0x4125;
  thunk_FUN_85d0_0bf7(iVar3,4,0x342a);
  return;
}

