
void __cdecl16far FUN_7533_01fc(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined1 local_3c [50];
  undefined2 local_a;
  int local_8;
  undefined2 local_6;
  int local_4;
  
  thunk_FUN_830b_0000(1,0,0,0);
  piVar1 = (int *)(DAT_3c04_0110 * 0x14 + 0x185);
  *piVar1 = *piVar1 - DAT_4125_1110;
  DAT_4125_1110 = 0;
  iVar2 = thunk_FUN_8027_225b();
  if (iVar2 != 1) {
    local_4 = 1;
    local_6 = FUN_7533_1a9b();
    iVar2 = thunk_FUN_7e8f_02bf(1,100,0);
    if (iVar2 < 0x46) {
      iVar4 = 1;
    }
    else if (iVar2 < 0x5f) {
      iVar4 = 2;
    }
    else {
      iVar4 = 3;
    }
    if (local_4 != 0) {
      iVar3 = thunk_FUN_5d9f_09ab();
      if (iVar3 == 0) {
        if (iVar4 == 1) {
          thunk_FUN_7e8f_04f0(0x60,0);
          FUN_1000_4944(local_3c);
        }
        else {
          thunk_FUN_7e8f_04f0(0x60,1,iVar4);
          FUN_1000_4944(local_3c);
        }
        thunk_FUN_8027_10fb(local_3c);
      }
      for (iVar3 = 0; iVar3 < iVar4; iVar3 = iVar3 + 1) {
        local_a = thunk_FUN_6513_12e6(local_6,DAT_451b_058a,DAT_451b_0588);
        local_8 = iVar2;
        FUN_1b62_02e2(local_a,iVar2);
      }
    }
  }
  return;
}

