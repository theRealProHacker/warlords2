
void __cdecl16far thunk_FUN_8027_092a(int param_1)

{
  int iVar1;
  undefined2 in_DX;
  undefined2 extraout_DX;
  int iVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  undefined1 auStack_8e [52];
  undefined1 uStack_5a;
  undefined1 auStack_52 [80];
  
  if (param_1 == 0) {
    uVar3 = 0x41;
  }
  else {
    uVar3 = 0x42;
  }
  FUN_22bf_07a5();
  for (iVar2 = 0; iVar2 < 4; iVar2 = iVar2 + 1) {
    uStack_5a = 0;
    thunk_FUN_7e8f_0505(uVar3,iVar2);
    uVar4 = 0x197b;
    iVar1 = FUN_197b_0005(auStack_8e);
    if (iVar1 == 0) {
      uVar4 = thunk_FUN_7e8f_0505(uVar3,iVar2);
      thunk_FUN_7e8f_051a(1,uVar4,in_DX);
      FUN_1000_4944(auStack_52);
      uVar4 = 0x4096;
      thunk_FUN_79a9_0000(auStack_52);
    }
    (*DAT_451b_2a74)(uVar4,auStack_8e);
    in_DX = extraout_DX;
    FUN_2012_0975(auStack_8e);
  }
  FUN_22bf_0757();
  return;
}

