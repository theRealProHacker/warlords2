
undefined2 __cdecl16far FUN_1000_2835(undefined2 *param_1)

{
  undefined2 uVar1;
  undefined2 in_DX;
  undefined1 local_a [4];
  undefined1 local_6 [4];
  
  FUN_1000_1d1e(local_6);
  FUN_1000_1d31(local_a);
  uVar1 = FUN_1000_4ae9(local_6);
  if ((undefined2 *)param_1 != (undefined2 *)0x0 || param_1._2_2_ != 0) {
    ((undefined2 *)param_1)[1] = in_DX;
    *param_1 = uVar1;
  }
  return uVar1;
}

