
undefined2 __cdecl16far FUN_7875_03ea(undefined1 *param_1,undefined4 param_2)

{
  int iVar1;
  undefined2 uVar2;
  undefined2 in_DX;
  undefined2 uVar3;
  undefined1 *puVar4;
  int iVar5;
  undefined2 uVar6;
  undefined1 local_cc [200];
  undefined1 local_4;
  undefined1 local_3;
  
  FUN_1000_4a70();
  FUN_1000_4a01();
  iVar1 = FUN_170b_0006(local_cc);
  if (iVar1 != -1) {
    FUN_170b_006d();
    *param_1 = local_4;
    uVar2 = FUN_1d28_011f(local_4,0x20,0,0);
    uVar2 = FUN_1d28_075d(uVar2,in_DX);
    uVar6 = (undefined2)((ulong)param_1 >> 0x10);
    puVar4 = (undefined1 *)param_1;
    *(undefined2 *)(puVar4 + 0x13) = in_DX;
    *(undefined2 *)(puVar4 + 0x11) = uVar2;
    if (*(long *)(puVar4 + 0x11) != 0) {
      uVar2 = FUN_1d28_011f(local_4,0x20,0,0);
      uVar2 = FUN_1d28_075d(uVar2,in_DX);
      *(undefined2 *)(puVar4 + 0x17) = in_DX;
      *(undefined2 *)(puVar4 + 0x15) = uVar2;
      if (*(long *)(puVar4 + 0x15) != 0) {
        FUN_170b_006d();
        puVar4[1] = local_3;
        uVar2 = FUN_7875_0b9d(iVar1);
        *(undefined2 *)(puVar4 + 2) = uVar2;
        *(undefined4 *)(puVar4 + 4) = param_2;
        FUN_170b_006d();
        puVar4[8] = local_3;
        FUN_170b_006d();
        puVar4[9] = local_3;
        FUN_170b_006d();
        puVar4[10] = local_3;
        uVar2 = FUN_7875_0b9d(iVar1);
        *(undefined2 *)(puVar4 + 0xb) = uVar2;
        uVar3 = (undefined2)
                ((ulong)((long)*(int *)(puVar4 + 0xb) * (long)(int)(uint)(byte)puVar4[8]) >> 0x10);
        *(int *)(puVar4 + 0xd) =
             (int)((long)*(int *)(puVar4 + 0xb) * (long)(int)(uint)(byte)puVar4[8]);
        uVar2 = FUN_7875_0b9d(iVar1);
        *(undefined2 *)(puVar4 + 0xf) = uVar2;
        FUN_170b_006d();
        FUN_170b_006d();
        uVar2 = FUN_1d28_011f(*(int *)(puVar4 + 0xf) * 6,0x20,0,0);
        uVar2 = FUN_1d28_075d(uVar2,uVar3);
        *(undefined2 *)(puVar4 + 0x1b) = uVar3;
        *(undefined2 *)(puVar4 + 0x19) = uVar2;
        if (*(long *)(puVar4 + 0x19) != 0) {
          for (iVar5 = 0; iVar5 < *(int *)(puVar4 + 0xf); iVar5 = iVar5 + 1) {
            uVar2 = FUN_7875_0b9d(iVar1);
            *(undefined2 *)((int)*(undefined4 *)(puVar4 + 0x19) + iVar5 * 6) = uVar2;
            uVar2 = FUN_7875_0b9d(iVar1);
            *(undefined2 *)((int)*(undefined4 *)(puVar4 + 0x19) + iVar5 * 6 + 2) = uVar2;
            uVar2 = FUN_7875_0b9d(iVar1);
            *(undefined2 *)((int)*(undefined4 *)(puVar4 + 0x19) + iVar5 * 6 + 4) = uVar2;
          }
          FUN_170b_003a(iVar1);
          return 1;
        }
      }
    }
    FUN_170b_003a(iVar1);
  }
  return 0;
}

