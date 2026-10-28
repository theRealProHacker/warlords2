
void __cdecl16far thunk_FUN_63da_0000(undefined4 param_1,undefined4 param_2,int param_3,int param_4)

{
  undefined2 uVar1;
  int iVar2;
  undefined1 auStack_a2 [80];
  undefined1 auStack_52 [80];
  
  iVar2 = DAT_3c04_0110;
  DAT_4125_0a3e = 1;
  DAT_4125_0a3a = param_3;
  if (param_3 == 0xf) {
    DAT_4125_0a3a = DAT_3c04_0110;
  }
  DAT_4125_0a3c = param_4;
  thunk_FUN_7e8f_04f0(0xffff0042,param_1);
  FUN_1000_4944(auStack_52);
  thunk_FUN_7e8f_04f0(0xffff0043,param_2);
  FUN_1000_4944(auStack_a2);
  FUN_22bf_07a5();
  thunk_FUN_54e4_0000();
  thunk_FUN_7875_06ae(0xf0001,0x30000);
  uVar1 = thunk_FUN_7e8f_04f0(0x41);
  thunk_FUN_7e8f_00d6(DAT_4125_0a40,uVar1,param_3);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  thunk_FUN_7e8f_00d6(DAT_4125_0a44,auStack_52);
  thunk_FUN_7e8f_00d6(DAT_4125_0a48,auStack_a2);
  uVar1 = thunk_FUN_7e8f_04f0(0x10041);
  thunk_FUN_7e8f_00d6(DAT_4125_0a4c,uVar1,param_3);
  uVar1 = thunk_FUN_7e8f_04f0(0x20041);
  thunk_FUN_7e8f_00d6(DAT_4125_0a50,uVar1,param_3);
  thunk_FUN_79c4_056a();
  DAT_4125_166a = 1;
  FUN_17be_0001(0x11d011c);
  FUN_17be_0001(0x11d011b);
  FUN_17be_0001(0x11d011e);
  if ((DAT_3c04_011e != 0) && (*(int *)((char *)s_Unexplored__4125_10f9 + 10 + iVar2 * 0xc) != 0)) {
    param_3 = 0x2e1d;
    if ((DAT_451b_1efe._2_2_ == 0x2e1d) &&
       (*(int *)((char *)s_Explored__4125_1105 + 2 + iVar2 * 0xc) * 0x16 + -0x7780 ==
        (int)DAT_451b_1efe)) {
      if ((*(int *)((char *)s_Explored__4125_1105 + iVar2 * 0xc) == 5) &&
         (*(int *)((char *)s_Explored__4125_1105 + 4 + iVar2 * 0xc) == param_4)) {
        uVar1 = 0x11c;
      }
      else {
        if (*(int *)((char *)s_Explored__4125_1105 + iVar2 * 0xc) != 6) goto LAB_63da_0210;
        iVar2 = FUN_63da_07d0();
        if (iVar2 == 0) {
          iVar2 = FUN_63da_0834();
          if (iVar2 == 0) goto LAB_63da_0210;
          uVar1 = 0x11b;
        }
        else {
          uVar1 = 0x11e;
        }
      }
      FUN_17be_0001(0x11d,uVar1);
    }
  }
LAB_63da_0210:
  FUN_18a9_066e(0x1011d);
  iVar2 = FUN_63da_0834();
  if (iVar2 == 0) {
    uVar1 = 2;
  }
  else {
    uVar1 = 1;
  }
  FUN_18a9_066e(0x11b,uVar1);
  iVar2 = FUN_63da_07d0();
  if (iVar2 == 0) {
    uVar1 = 2;
  }
  else {
    uVar1 = 1;
  }
  FUN_18a9_066e(0x11e,uVar1);
  FUN_18a9_066e(0x1011c);
  FUN_22bf_0757();
  if ((DAT_3c04_012e != 0) && (DAT_4125_0a54 == 0)) {
    DAT_4125_0a54 = 1;
    uVar1 = thunk_FUN_7e8f_0505(0xa0019);
    thunk_FUN_8027_168d(uVar1,param_3);
  }
  return;
}

