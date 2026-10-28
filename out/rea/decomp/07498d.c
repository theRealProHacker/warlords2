
void __cdecl16far FUN_73de_0bad(undefined2 param_1,undefined2 param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  int local_4;
  
  FUN_1b62_007d(param_1,param_2,&local_4);
  if (local_4 != 0) {
    FUN_1b62_09ec(local_4,0);
    iVar1 = DAT_451b_052a + 0x10;
    iVar3 = (((DAT_451b_0528 + DAT_451b_052c / 2) - (local_4 * 0x18) / 2) + -0xc >> 3) << 3;
    for (iVar2 = 0; iVar2 < local_4; iVar2 = iVar2 + 1) {
      uVar4 = (undefined2)((ulong)((undefined4 *)&DAT_451b_1ebe)[iVar2] >> 0x10);
      thunk_FUN_85d0_08be((int)*(char *)(*(int *)((undefined4 *)&DAT_451b_1ebe + iVar2) + 4),
                          (int)*(char *)(*(int *)((undefined4 *)&DAT_451b_1ebe + iVar2) + 5),0x342a,
                          0x4125,iVar3,iVar1,0,
                          (int)*(char *)(*(int *)((undefined4 *)&DAT_451b_1ebe + iVar2) + 7),
                          (int)*(char *)((int)((undefined4 *)&DAT_451b_1ebe)[iVar2] + 8),0,0);
      iVar3 = iVar3 + 0x18;
    }
  }
  return;
}

