
void __cdecl16far FUN_7b71_1650(int param_1)

{
  if (param_1 == 0) {
    DAT_4125_23b4 = (DAT_4125_23b4 + 1) % 3;
  }
  else {
    ((undefined2 *)&DAT_4125_23b4)[param_1] = (uint)(((undefined2 *)&DAT_4125_23b4)[param_1] == 0);
  }
  FUN_7b71_12ca(param_1);
  FUN_7b71_15cd();
  return;
}

