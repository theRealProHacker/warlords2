
void __cdecl16far thunk_FUN_7b71_21c1(int param_1,int param_2,undefined4 param_3)

{
  undefined2 uVar1;
  undefined2 unaff_SS;
  char acStack_6 [4];
  
  FUN_1000_4a70(acStack_6);
  if (param_2 == 0) {
    uVar1 = 0x262e;
  }
  else {
    uVar1 = 0x262a;
  }
  FUN_1000_4944(param_3,(char *)s_CARDS__c_03d__s_4125_261a,0x4125,
                (int)acStack_6[*(int *)(param_1 * 2 + 0xc0)],*(undefined2 *)(param_1 * 2 + 0xe0),
                uVar1,0x4125);
  return;
}

