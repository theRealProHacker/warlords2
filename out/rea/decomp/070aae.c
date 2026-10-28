
void __cdecl16far FUN_705a_050e(int param_1)

{
  undefined2 local_c;
  undefined1 local_a [8];
  
  if (param_1 == 2) {
    DAT_4125_0e96 = (uint)(DAT_4125_0e96 == 0);
    FUN_705a_08e4();
    goto LAB_705a_0631;
  }
  if (param_1 == 0) {
    if (DAT_4125_0e94 == 0) {
      DAT_4125_0e94 = 1;
      thunk_FUN_830b_08df(0,DAT_4125_0e98,0xffff);
      thunk_FUN_830b_04d3(0);
    }
    else if (DAT_4125_0e94 == 1) {
      DAT_4125_0e94 = 0;
      FUN_705a_08e4();
    }
    else {
      if (DAT_4125_0e94 != 2) goto LAB_705a_0631;
      DAT_4125_0e94 = 1;
LAB_705a_0583:
      thunk_FUN_830b_08df(0,DAT_4125_0e98);
      thunk_FUN_830b_04d3(0);
      FUN_705a_0638();
    }
  }
  else {
    if (param_1 != 1) goto LAB_705a_0631;
    if (DAT_4125_0e94 == 0) {
      DAT_4125_0e94 = 2;
      FUN_705a_0410(DAT_4125_0e98,local_a);
      thunk_FUN_830b_08df(0,DAT_4125_0e98,local_c);
      thunk_FUN_830b_04d3(0);
    }
    else {
      if (DAT_4125_0e94 == 1) {
        DAT_4125_0e94 = 2;
        FUN_705a_0410(DAT_4125_0e98,local_a);
        goto LAB_705a_0583;
      }
      if (DAT_4125_0e94 != 2) goto LAB_705a_0631;
      DAT_4125_0e94 = 0;
      FUN_705a_08e4();
    }
  }
  FUN_705a_0638();
LAB_705a_0631:
  thunk_FUN_71d6_03a9();
  return;
}

