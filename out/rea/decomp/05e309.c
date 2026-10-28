
int __cdecl16far FUN_5d9f_0919(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 local_4;
  
  local_4 = 0;
  iVar3 = DAT_3c04_157b;
  do {
    do {
      iVar4 = iVar3 + -1;
      if (iVar3 == 0) {
        return param_1;
      }
      iVar3 = iVar4;
    } while (*(char *)(iVar4 * 0x41 + 0x1592) != DAT_3c04_0110);
    iVar1 = 0;
    uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
    iVar2 = (int)DAT_451b_018e;
    if (*(char *)(iVar2 + iVar4 + 0x56) == '\a') {
      uVar5 = 100;
LAB_5d9f_0984:
      iVar1 = thunk_FUN_7e8f_02bf(0x640001,uVar5);
    }
    else {
      if (*(char *)(iVar2 + iVar4 + 0x56) == '\x02') {
        uVar5 = 0x32;
        goto LAB_5d9f_0984;
      }
      if (*(char *)(iVar2 + iVar4 + 0x56) == '\x03') {
        uVar5 = 0;
        goto LAB_5d9f_0984;
      }
    }
    if (local_4 < iVar1) {
      param_1 = iVar4;
      local_4 = iVar1;
    }
  } while( true );
}

