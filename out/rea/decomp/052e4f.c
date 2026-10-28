
void __cdecl16far FUN_5131_1b3f(void)

{
  int iVar1;
  int iVar2;
  undefined2 uVar3;
  undefined1 local_30;
  undefined1 local_2e;
  undefined1 local_2c;
  undefined1 local_2a;
  undefined1 local_8;
  int local_6;
  int local_4;
  
  local_4 = thunk_FUN_7e8f_02bf(2,3);
  local_6 = 0;
  while ((0 < local_4 && (local_6 < 100))) {
    local_6 = local_6 + 1;
    iVar1 = thunk_FUN_7e8f_02bf(1,DAT_3c04_157b,0xffff);
    iVar2 = thunk_FUN_705a_094f();
    if (iVar2 < 4) {
      uVar3 = thunk_FUN_7533_1a9b();
      thunk_FUN_705a_14ac(0x4073,uVar3);
      local_8 = (undefined1)uVar3;
      *(undefined1 *)(iVar1 * 0x41 + iVar2 + 0x1593) = local_8;
      *(undefined1 *)(iVar1 * 0x41 + iVar2 + 0x1597) = local_2e;
      *(undefined1 *)(iVar1 * 0x41 + iVar2 + 0x15a3) = local_2c;
      *(undefined1 *)(iVar1 * 0x41 + iVar2 + 0x159b) = local_30;
      *(undefined1 *)(iVar1 * 0x41 + iVar2 + 0x159f) = local_2a;
      local_4 = local_4 + -1;
    }
  }
  return;
}

