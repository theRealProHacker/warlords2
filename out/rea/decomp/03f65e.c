
void __cdecl16far thunk_FUN_4bea_04ae(int *param_1,int *param_2,undefined2 param_3,int param_4)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar1 = thunk_FUN_7e8f_02bf();
  iVar2 = thunk_FUN_7e8f_02bf(1,param_3);
  *param_1 = *param_1 + iVar1 * iVar2;
  iVar1 = thunk_FUN_7e8f_02bf();
  iVar2 = thunk_FUN_7e8f_02bf(1,param_3);
  *param_2 = *param_2 + iVar1 * iVar2;
  iVar1 = thunk_FUN_7e8f_02bf();
  if ((iVar1 < 0x1e) && (param_4 != 0)) {
    iVar1 = *param_1;
    iVar2 = *param_2;
    iVar3 = 0x6f - *param_1;
    iVar4 = 0x9b - *param_2;
    if ((iVar1 <= iVar2) && ((iVar1 <= iVar3 && (iVar1 <= iVar4)))) {
      *param_1 = 0;
    }
    if (((iVar2 <= iVar1) && (iVar2 <= iVar3)) && (iVar2 <= iVar4)) {
      *param_2 = 0;
    }
    if (((iVar3 <= iVar2) && (iVar3 <= iVar1)) && (iVar3 <= iVar4)) {
      *param_1 = 0x6f;
    }
    if (((iVar4 <= iVar2) && (iVar4 <= iVar1)) && (iVar4 <= iVar3)) {
      *param_2 = 0x9b;
    }
  }
  FUN_4bea_0470(param_1,param_2);
  return;
}

