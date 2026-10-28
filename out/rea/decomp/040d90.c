
void __cdecl16far thunk_FUN_8027_0000(int param_1,int param_2)

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 0;
  if (param_1 != 0) {
    FUN_8027_092a();
    FUN_2372_132f();
  }
  if (param_2 != 0) {
    FUN_8027_1732();
    FUN_8027_17f6();
    thunk_FUN_8c81_0952(0x10001);
    thunk_FUN_79c4_0000();
  }
  DAT_4125_2a86 = 1;
  DAT_4125_166a = 0;
  thunk_FUN_79c4_056a();
  FUN_22bf_07a5();
  if (param_2 == 0) {
    thunk_FUN_85d0_006c();
    thunk_FUN_830b_0000(0x10001,0);
  }
  FUN_8027_0aeb();
  FUN_8027_0a9d();
  FUN_8027_0174();
  FUN_2372_132f();
  if (param_2 == 0) {
    thunk_FUN_899d_0356();
  }
  FUN_22bf_0757();
  if (param_2 != 0) {
    FUN_8027_0418();
    if (DAT_3c04_0124 == 0) {
      thunk_FUN_830b_0000(0x10001,0);
    }
    for (iVar2 = 0; iVar2 < 8; iVar2 = iVar2 + 1) {
      if ((*(int *)(iVar2 * 2 + 0x137) != 0) && (*(int *)(iVar2 * 2 + 0xd0) == 0)) {
        iVar3 = iVar3 + 1;
      }
    }
    if (iVar3 == 0) {
      uVar1 = thunk_FUN_7e8f_04f0(0x1000e);
      uVar1 = thunk_FUN_7e8f_04f0(0xe,uVar1,iVar2);
      FUN_8027_1160(uVar1,iVar2);
    }
    FUN_8027_2123();
  }
  return;
}

