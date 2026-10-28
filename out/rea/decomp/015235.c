
undefined2 __cdecl16far FUN_1000_5235(int param_1)

{
  uint *puVar1;
  code *pcVar2;
  bool bVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  
  bVar3 = false;
  if ((*(uint *)(param_1 * 2 + 0x3cfe) & 1) == 0) {
    uVar5 = 0x4125;
    pcVar2 = (code *)swi(0x21);
    uVar4 = (*pcVar2)();
    if (!bVar3) {
      puVar1 = (uint *)(param_1 * 2 + 0x3cfe);
      *puVar1 = *puVar1 | 0x1000;
      return uVar4;
    }
  }
  else {
    uVar4 = 5;
  }
  uVar4 = FUN_1000_1e9a(uVar4);
  return uVar4;
}

