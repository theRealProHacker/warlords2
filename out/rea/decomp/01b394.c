
undefined2 __cdecl16far FUN_1a8b_0ae4(int param_1,int param_2,int param_3,int param_4)

{
  if ((param_1 == param_3) && (param_2 == param_4)) {
    return 0xff;
  }
  if (param_1 == param_3) {
    if (param_4 < param_2) {
      return 0;
    }
    return 4;
  }
  if (param_2 == param_4) {
    if (param_3 < param_1) {
      return 6;
    }
    return 2;
  }
  if (param_1 <= param_3) {
    if (param_4 < param_2) {
      return 1;
    }
    return 3;
  }
  if (param_4 < param_2) {
    return 7;
  }
  return 5;
}

