
void __cdecl16far FUN_899d_1747(int param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 uVar1;
  
  if (DAT_4125_1174 == 0) {
    if (param_1 < DAT_4125_30f6) {
      uVar1 = (undefined2)
              ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_2902 + param_1 * 2) >> 0x10);
      thunk_FUN_73de_0626((int)*(char *)(((undefined2 *)&DAT_451b_2902)[param_1 * 2] + 4),
                          (int)*(char *)(((undefined2 *)&DAT_451b_2902)[param_1 * 2] + 6),
                          (int)*(char *)(((undefined2 *)&DAT_451b_2902)[param_1 * 2] + 8),
                          (int)*(char *)(((undefined2 *)&DAT_451b_2902)[param_1 * 2] + 0xb),
                          (int)*(char *)(((undefined2 *)&DAT_451b_2902)[param_1 * 2] + 7),
                          (int)*(char *)((int)*(undefined4 *)
                                               ((undefined2 *)&DAT_451b_2902 + param_1 * 2) + 10),
                          param_2,param_3);
    }
    else {
      thunk_FUN_73de_1201(param_2,param_3,0);
      thunk_FUN_73de_10e1((char *)s_Select_Army_4125_3222,0x4125,
                          (char *)s_Select_armies_when_present_4125_322e,0x4125);
    }
  }
  return;
}

