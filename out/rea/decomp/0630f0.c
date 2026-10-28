
void __cdecl16far FUN_621e_0f10(int param_1,int param_2)

{
  int iVar1;
  
  iVar1 = FUN_621e_0fd5(param_1);
  if (iVar1 == 0) {
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + param_1 * 0x41) = 0;
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + param_1 * 0x41) = 0xffff;
    *(undefined2 *)(param_1 * 0x41 + 0x15b2) = 0xffff;
  }
  else {
    if (param_1 < 100) {
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + param_1 * 0x41) =
           *(undefined2 *)(param_2 * 0x41 + 0x157d);
      *(undefined2 *)(param_1 * 0x41 + 0x15b2) = *(undefined2 *)(param_2 * 0x41 + 0x157f);
    }
    else {
      *(undefined2 *)((int)(undefined2 *)&DAT_4125_15b0 + param_1 * 0x41) = 0xfffe;
      *(undefined2 *)(param_1 * 0x41 + 0x15b2) = 0xfffe;
    }
    *(undefined2 *)((int)(undefined2 *)&DAT_4125_15ae + param_1 * 0x41) = 1;
  }
  return;
}

