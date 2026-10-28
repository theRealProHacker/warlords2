
void __cdecl16far FUN_7f3a_0512(int param_1)

{
  int local_6 [2];
  
  if (*(int *)(param_1 * 2 + 0x28d8) == 0) {
    *(undefined2 *)(param_1 * 2 + 0x28d8) = 1;
  }
  else {
    FUN_22bf_0af4(local_6);
    *(int *)(param_1 * 2 + 0x28d0) =
         ((local_6[0] - *(int *)(param_1 * 8 + 0x29ac)) * 7) / *(int *)(param_1 * 8 + 0x29b0);
  }
  FUN_7f3a_0332(param_1);
  FUN_7f3a_011e();
  return;
}

