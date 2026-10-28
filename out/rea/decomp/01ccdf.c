
void __cdecl16far FUN_1c8c_041f(void)

{
  int iVar1;
  int iVar2;
  undefined2 *puVar3;
  undefined2 uVar4;
  undefined2 local_4;
  
  local_4 = *DAT_451b_1f02;
  uVar4 = ((undefined2 *)DAT_451b_1f02)[1];
  FUN_1a8b_0b4d(&local_4);
  iVar1 = FUN_1c8c_01fd(local_4,uVar4);
  if ((iVar1 == 3) || (iVar1 == 5)) {
    thunk_FUN_67a7_0000(local_4,uVar4);
  }
  if (DAT_4125_2bda != 0) {
    iVar1 = 8;
    while (iVar2 = iVar1 + -1, iVar1 != 0) {
      iVar1 = iVar2;
      if (((undefined2 *)&DAT_451b_1ede)[iVar2 * 2] != 0 ||
          *(int *)((undefined *)&DAT_451b_1ee0 + iVar2 * 4) != 0) {
        uVar4 = (undefined2)
                ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar2 * 2) >> 0x10);
        *(undefined2 *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar2 * 2) + 0x12) =
             0xffff;
        *(undefined2 *)(((undefined2 *)&DAT_451b_1ede)[iVar2 * 2] + 0x14) = 0xffff;
      }
    }
  }
  uVar4 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
  puVar3 = (undefined2 *)DAT_451b_1f02;
  puVar3[9] = 0xffff;
  puVar3[10] = 0xffff;
  return;
}

