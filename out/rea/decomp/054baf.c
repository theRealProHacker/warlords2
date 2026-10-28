
void __cdecl16far FUN_54ad_00df(int param_1,undefined2 param_2,undefined2 param_3)

{
  if ((param_1 < 1) || (4 < param_1)) {
    if ((param_1 < 5) || (0x18 < param_1)) {
      if ((param_1 < 0x21) || (0x24 < param_1)) {
        if ((param_1 < 0x25) || (0x2c < param_1)) {
          if (param_1 < 0x2d) {
            return;
          }
          if (0x47 < param_1) {
            return;
          }
          thunk_FUN_6a62_1475(param_1 + -0x2d,param_2,param_3);
        }
        else {
          thunk_FUN_899d_1747(param_1 + -0x25,param_2,param_3);
        }
      }
      else {
        thunk_FUN_544d_03f8(param_1 + -0x21);
        thunk_FUN_73de_1201(param_2,param_3,0);
        thunk_FUN_73de_1158(0x5e6,0x4125,0x5c38,0x4125);
      }
    }
    else {
      thunk_FUN_705a_11f4(1,param_1 + -5);
    }
  }
  else {
    if (*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x1592) < '\0') {
      return;
    }
    thunk_FUN_73de_032a((int)*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x1592),
                        (int)*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x1596),
                        (int)*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x159a),
                        (int)*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x15a2),
                        (int)*(char *)(DAT_4125_0e98 * 0x41 + param_1 + 0x159e),param_2,param_3);
  }
  DAT_4125_1174 = 1;
  return;
}

