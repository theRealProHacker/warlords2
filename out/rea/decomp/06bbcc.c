
void __cdecl16far FUN_6bb0_00cc(void)

{
  undefined1 uVar1;
  bool bVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 in_DX;
  int iVar5;
  int iVar6;
  undefined4 local_c;
  int local_6;
  
  iVar5 = DAT_3c04_157b;
  while (iVar6 = iVar5 + -1, iVar5 != 0) {
    iVar5 = iVar6;
    if (*(char *)(*(byte *)(*(int *)(iVar6 * 0x41 + 0x157f) * 0xe0 +
                           *(int *)(iVar6 * 0x41 + 0x157d) * 2) + 0x710) == '\n') {
      bVar2 = false;
      if (*(char *)(iVar6 * 0x41 + 0x1592) == '\x0f') {
        if (DAT_3c04_011a == 0) {
          bVar2 = true;
        }
        else if ((0 < DAT_3c04_011a) &&
                (local_6 = thunk_FUN_7e8f_02bf(1,4,DAT_3c04_011a + -2), 3 < local_6)) {
          local_6 = 3;
        }
      }
      else {
        local_6 = 3;
      }
      if (!bVar2) {
        iVar3 = thunk_FUN_621e_103d(iVar6,*(undefined2 *)(local_6 * 2 + 0xd60),0xffff,0);
        if (iVar3 == 0) {
          bVar2 = true;
        }
        else {
          iVar3 = thunk_FUN_705a_0000(iVar6,(int)*(char *)(iVar6 * 0x41 + 0x15a9));
          uVar1 = *(undefined1 *)(iVar6 * 0x41 + iVar3 + 0x1593);
          in_DX = CONCAT11(0x3c,uVar1);
          *(undefined1 *)(iVar6 * 0x41 + 0x15a9) = uVar1;
          FUN_6bb0_0381(iVar6);
        }
      }
      if (bVar2) {
        puVar4 = (undefined2 *)FUN_1b62_0309();
        local_c = (undefined2 *)CONCAT22(in_DX,puVar4);
        *(undefined1 *)((int)puVar4 + 5) = 0xf;
        *(undefined1 *)(puVar4 + 2) = 0xb;
        *local_c = *(undefined2 *)(iVar6 * 0x41 + 0x157d);
        puVar4[1] = *(undefined2 *)(iVar6 * 0x41 + 0x157f);
        *(undefined1 *)(puVar4 + 4) = 1;
      }
    }
  }
  return;
}

