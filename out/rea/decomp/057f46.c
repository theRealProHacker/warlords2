
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __cdecl16far FUN_57d5_01f6(int param_1,long param_2,long param_3)

{
  byte bVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 uVar6;
  undefined2 uVar7;
  
  iVar4 = 0;
  for (iVar3 = 0; iVar3 < 6; iVar3 = iVar3 + 1) {
    uVar7 = (undefined2)((ulong)param_2 >> 0x10);
    if (param_2 != 0) {
      *(undefined1 *)((int)param_2 + iVar3) = 0xff;
    }
    uVar5 = (undefined2)((ulong)param_3 >> 0x10);
    if (param_3 != 0) {
      *(undefined1 *)((int)param_3 + iVar3) = 0;
    }
    uVar6 = (undefined2)((ulong)_DAT_451b_018a >> 0x10);
    bVar1 = *(byte *)((int)_DAT_451b_018a + param_1 * 6 + iVar3);
    uVar2 = (uint)bVar1;
    if ((((uVar2 != 0xff) && (*(uint *)((int)DAT_451b_018e + 0x46) != uVar2)) &&
        (*(char *)(*(byte *)(*(int *)(uVar2 * 0x41 + 0x157f) * 0xe0 +
                            *(int *)(uVar2 * 0x41 + 0x157d) * 2) + 0x710) == '\n')) &&
       ((*(char *)(uVar2 * 0x41 + 0x1592) == '\x0f' &&
        (((iVar4 == 0 || (iVar3 < 2)) ||
         (*(byte *)((int)_DAT_451b_018a + param_1 * 6 + iVar3 + 600) < 0x14)))))) {
      if (param_2 != 0) {
        *(byte *)((int)param_2 + iVar3) = bVar1;
      }
      if (param_3 != 0) {
        *(undefined1 *)((int)param_3 + iVar3) =
             *(undefined1 *)((int)_DAT_451b_018a + param_1 * 6 + iVar3 + 600);
      }
      iVar4 = iVar4 + 1;
    }
  }
  return iVar4;
}

