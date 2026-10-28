
void __cdecl16far FUN_7f3a_058d(void)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined1 local_56 [20];
  undefined1 local_42 [64];
  
  iVar3 = 0;
  bVar1 = false;
  while (!bVar1) {
    iVar2 = FUN_7f3a_06c8(iVar3,local_56);
    if (iVar2 == 0) {
      bVar1 = true;
      DAT_451b_08ce = iVar3;
    }
    else {
      ((undefined2 *)&DAT_451b_0c9c)[iVar3] = iVar3;
      FUN_1000_4a70(iVar3 * 0x20 + 0x483c,0x4125,local_42);
      iVar3 = iVar3 + 1;
    }
  }
  FUN_7f3a_0725();
  return;
}

