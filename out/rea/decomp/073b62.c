
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __cdecl16far FUN_71d6_1e02(int param_1)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined1 local_66 [50];
  undefined1 local_34 [50];
  
  if (DAT_4125_0fc0 != param_1) {
    if (DAT_4125_0fc2 == 0) {
      DAT_4125_0fc2 = 1;
      uVar1 = FUN_1d28_011f(8000,0,0,0x29d,0);
      DAT_451b_0524 = CONCAT22(in_DX,uVar1);
    }
    uVar1 = FUN_1d28_069a((int)DAT_451b_0524,(int)((ulong)DAT_451b_0524 >> 0x10));
    _DAT_451b_0520 = CONCAT22(in_DX,uVar1);
    DAT_4125_0fc0 = param_1;
    thunk_FUN_7e8f_0505(0x16,param_1 + -1,0x5da0,0x4125,0x5da0,0x4125);
    FUN_1000_4944(local_34);
    iVar2 = FUN_170b_0006(local_34);
    if (iVar2 < 0) {
      thunk_FUN_7e8f_051a(1,0,local_34);
      FUN_1000_4944(local_66);
      thunk_FUN_79a9_0000(local_66);
    }
    FUN_170b_006d(iVar2,(int)_DAT_451b_0520,(int)((ulong)_DAT_451b_0520 >> 0x10),8000);
    FUN_170b_003a(iVar2);
    for (iVar2 = 0; iVar2 < 8000; iVar2 = iVar2 + 1) {
      uVar1 = (undefined2)((ulong)_DAT_451b_0520 >> 0x10);
      if (*(char *)((int)_DAT_451b_0520 + iVar2) == '|') {
        *(undefined1 *)((int)_DAT_451b_0520 + iVar2) = 0;
      }
    }
    FUN_1d28_07a9((int)DAT_451b_0524,(int)((ulong)DAT_451b_0524 >> 0x10));
  }
  return;
}

