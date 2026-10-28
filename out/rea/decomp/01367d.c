
undefined4 __cdecl16near FUN_1000_367d(uint param_1,int param_2)

{
  uint uVar1;
  int iVar2;
  undefined2 uVar3;
  int iVar4;
  undefined2 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  
  iVar4 = 0;
  uVar1 = FUN_1000_1df2();
  iVar2 = uVar1 + DAT_4125_008b + param_1;
  uVar1 = iVar4 + (uint)CARRY2(uVar1,DAT_4125_008b) + param_2 +
          (uint)CARRY2(uVar1 + DAT_4125_008b,param_1);
  uVar6 = uVar1 < 0xf;
  uVar7 = uVar1 == 0xf;
  if ((int)uVar1 < 0xf) {
LAB_1000_36ae:
    uVar5 = DAT_4125_008d;
    uVar3 = FUN_1000_1e13();
    FUN_1000_1fd8();
    if (((!(bool)uVar6) && (FUN_1000_1fd8(), (bool)uVar6 || (bool)uVar7)) &&
       (iVar2 = FUN_1000_35c8(uVar3,uVar5), iVar2 != 0)) goto LAB_1000_3704;
  }
  else if ((int)uVar1 < 0x10) {
    uVar6 = iVar2 != -1;
    uVar7 = iVar2 == -1;
    goto LAB_1000_36ae;
  }
  uVar5 = 0xffff;
  uVar3 = 0xffff;
LAB_1000_3704:
  return CONCAT22(uVar5,uVar3);
}

