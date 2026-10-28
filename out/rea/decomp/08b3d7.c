
undefined1 * __cdecl16far FUN_899d_1a07(int param_1,long param_2)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 in_DX;
  undefined2 extraout_DX;
  int iVar3;
  undefined4 uVar4;
  undefined1 local_42 [32];
  int local_22;
  int local_20;
  int local_1e;
  int local_1c;
  int local_1a;
  int local_18;
  int local_16;
  int local_14;
  int local_12;
  int local_10;
  int local_e;
  int local_4;
  
  uVar1 = thunk_FUN_7e8f_04f0(0xa3);
  FUN_1000_4a70((undefined1 *)&DAT_451b_1d28,0x4125,uVar1,in_DX);
  uVar1 = (undefined2)((ulong)param_2 >> 0x10);
  if ((param_2 == 0) || ((*(uint *)((int)param_2 + 0xc) & 0x1000) == 0)) {
    if (param_1 == 0x1c) {
      if (param_2 != 0) {
        local_4 = thunk_FUN_6a62_0d1a(param_2);
        iVar3 = *(int *)((*(char *)((int)param_2 + 8) + local_4) * 2 + 0xce4);
        iVar2 = thunk_FUN_6a62_0d71(param_2);
        iVar3 = iVar3 + iVar2;
        if (6 < iVar3) {
          iVar3 = 6;
        }
        uVar4 = CONCAT22(iVar3,2);
        goto LAB_899d_1b7b;
      }
    }
    else {
      thunk_FUN_705a_14ac(0x1000,param_1,local_42);
      in_DX = extraout_DX;
    }
    if (local_e == 2) {
      uVar1 = 3;
    }
    else {
      if (local_e != 3) {
        if (local_12 == 0) {
          if ((((local_14 == 0) || (local_16 == 0)) || (local_18 == 0)) || (local_1a == 0)) {
            if (local_e == 1) {
              uVar1 = 6;
              goto LAB_899d_1a41;
            }
            if (local_10 == 0) {
              if (local_14 == 0) {
                if (local_16 == 0) {
                  if (local_18 == 0) {
                    if (local_1a == 0) {
                      if (local_1c == 0) {
                        if (local_1e == 0) {
                          if (local_20 == 0) {
                            if (local_22 == 0) {
                              return (undefined1 *)&DAT_451b_1d28;
                            }
                            uVar4 = CONCAT22(local_22,0xf);
                          }
                          else {
                            uVar4 = CONCAT22(local_20,0xe);
                          }
                        }
                        else {
                          uVar4 = CONCAT22(local_1e,0xd);
                        }
                      }
                      else {
                        uVar4 = CONCAT22(local_1c,0xc);
                      }
                    }
                    else {
                      uVar4 = CONCAT22(local_1a,0xb);
                    }
                  }
                  else {
                    uVar4 = CONCAT22(local_18,10);
                  }
                }
                else {
                  uVar4 = CONCAT22(local_16,9);
                }
              }
              else {
                uVar4 = CONCAT22(local_14,8);
              }
            }
            else {
              uVar4 = CONCAT22(local_10,7);
            }
          }
          else {
            uVar4 = CONCAT22(local_1a,0x10);
          }
        }
        else {
          uVar4 = CONCAT22(local_18,5);
        }
LAB_899d_1b7b:
        uVar1 = thunk_FUN_7e8f_04f0(0xa3,uVar4);
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,uVar1,in_DX);
        return (undefined1 *)&DAT_451b_1d28;
      }
      uVar1 = 4;
    }
  }
  else {
    uVar1 = 1;
  }
LAB_899d_1a41:
  uVar1 = thunk_FUN_7e8f_04f0(0xa3,uVar1);
  FUN_1000_4a70((undefined1 *)&DAT_451b_1d28,0x4125,uVar1,in_DX);
  return (undefined1 *)&DAT_451b_1d28;
}

