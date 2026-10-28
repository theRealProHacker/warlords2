
int __cdecl16far FUN_57d5_00b5(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined1 local_8 [6];
  
  iVar4 = 0;
  iVar2 = DAT_3c04_157b;
LAB_57d5_01e6:
  do {
    do {
      iVar3 = iVar2 + -1;
      if (iVar2 == 0) {
        return iVar4;
      }
      iVar2 = iVar3;
    } while (*(char *)(iVar3 * 0x41 + 0x1592) != DAT_3c04_0110);
    uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  } while ((param_1 != 0) && (*(char *)((int)DAT_451b_018e + iVar3 + 0x56) != '\x01'));
  if (*(char *)((int)DAT_451b_018e + iVar3 + 0x56) == '\x01') {
    thunk_FUN_5c8e_023f(iVar3,1);
    *(undefined1 *)((int)DAT_451b_018e + iVar3 + 0x56) = 3;
  }
  iVar1 = FUN_57d5_01f6(iVar3,local_8);
  if (iVar1 == 0) goto code_r0x00057e89;
  goto LAB_57d5_0182;
code_r0x00057e89:
  uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
  iVar1 = (int)DAT_451b_018e;
  if ((*(char *)(iVar1 + iVar3 + 0x56) == '\x03') || (*(char *)(iVar1 + iVar3 + 0x56) == '\x02')) {
    *(undefined1 *)(iVar1 + iVar3 + 0x56) = 4;
  }
  if (((DAT_3c04_0128 == 0) && (*(char *)((int)DAT_451b_018e + iVar3 + 0x56) == '\x05')) &&
     (iVar1 = thunk_FUN_8027_225b(), iVar1 < 6)) {
LAB_57d5_0182:
    iVar4 = iVar4 + 1;
    iVar1 = FUN_57d5_03aa(iVar3,param_2);
    if (iVar1 == 0) {
      iVar1 = FUN_57d5_0935(iVar3);
      uVar5 = (undefined2)((ulong)DAT_451b_018e >> 0x10);
      if (iVar1 == 0xff) {
        *(undefined1 *)((int)DAT_451b_018e + iVar3 + 0x56) = 4;
      }
      else {
        *(undefined1 *)((int)DAT_451b_018e + iVar3 + 0x56) = 3;
      }
    }
    else {
      thunk_FUN_8027_225b();
      FUN_57d5_0b19();
      *(undefined1 *)((int)DAT_451b_018e + iVar3 + 0x56) = 2;
    }
  }
  goto LAB_57d5_01e6;
}

