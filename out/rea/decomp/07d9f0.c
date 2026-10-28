
void __cdecl16far FUN_7d9f_0000(int param_1)

{
  bool bVar1;
  char cVar2;
  undefined2 uVar3;
  undefined2 in_DX;
  int iVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  
  if (DAT_4125_0bee == 0) {
    return;
  }
  if (param_1 == DAT_4125_2632) {
    cVar2 = FUN_255e_04a8();
    if (cVar2 != '\0') {
      return;
    }
    FUN_255e_040b();
  }
  DAT_4125_2632 = param_1;
  cVar2 = FUN_255e_04a8();
  if (cVar2 != '\0') {
    FUN_255e_0466();
    FUN_255e_040b();
  }
  if (param_1 == 0) {
    puVar5 = (undefined1 *)0x8;
  }
  else if (param_1 == 3) {
    puVar5 = (undefined1 *)0xffff0009;
  }
  else if (param_1 == 1) {
    puVar5 = (undefined1 *)0xffff000a;
  }
  else {
    if (param_1 == 2) {
      bVar1 = true;
      for (iVar4 = 0; iVar4 < 8; iVar4 = iVar4 + 1) {
        if ((*(int *)(iVar4 * 2 + 0x137) != 0) && (*(int *)(iVar4 * 2 + 0xd0) == 0)) {
          bVar1 = false;
          break;
        }
      }
      if (bVar1) {
        iVar4 = thunk_FUN_7e8f_02bf();
        if (iVar4 < 6) {
          uVar6 = 0xffff000c;
        }
        else {
          if (iVar4 < 0x35) goto LAB_7d9f_00f6;
          uVar6 = 0xffff000a;
        }
      }
      else {
LAB_7d9f_00f6:
        uVar6 = 0xffff000b;
      }
      uVar3 = thunk_FUN_7e8f_0505(uVar6);
      uVar3 = thunk_FUN_7e8f_0505(7,uVar3,iVar4);
      FUN_255e_032f(uVar3,iVar4);
      uVar3 = 0;
      goto LAB_7d9f_0067;
    }
    if (param_1 == 4) {
      puVar5 = (undefined1 *)0xc;
    }
    else if (param_1 == 5) {
      puVar5 = (undefined1 *)0xffff000d;
    }
    else if (param_1 == 6) {
      puVar5 = &DAT_f000_fffe;
    }
    else if (param_1 == 7) {
      puVar5 = (undefined1 *)0xf;
    }
    else if (param_1 == 8) {
      puVar5 = (undefined1 *)0x10;
    }
    else if (param_1 == 9) {
      puVar5 = (undefined1 *)0x11;
    }
    else if (param_1 == 10) {
      puVar5 = (undefined1 *)0x12;
    }
    else {
      if (param_1 != 0xb) {
        return;
      }
      puVar5 = (undefined1 *)0x13;
    }
  }
  uVar3 = thunk_FUN_7e8f_0505(puVar5);
  uVar3 = thunk_FUN_7e8f_0505(7,uVar3,in_DX);
  FUN_255e_032f(uVar3,in_DX);
  uVar3 = 1;
LAB_7d9f_0067:
  FUN_255e_0412(0,uVar3);
  return;
}

