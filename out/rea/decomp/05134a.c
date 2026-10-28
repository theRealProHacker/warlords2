
/* WARNING: Restarted to delay deadcode elimination for space: ram */

void __cdecl16far FUN_5131_003a(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined1 local_112 [256];
  undefined1 local_12 [10];
  undefined2 local_8;
  int local_6;
  int local_4;
  
  iVar3 = 0;
  DAT_3c04_080f = 0x28;
  for (iVar2 = 0; iVar2 < 0x28; iVar2 = iVar2 + 1) {
    *(undefined2 *)(iVar2 * 0x1f + 0x813) = 0xffff;
    *(undefined2 *)(iVar2 * 0x1f + 0x811) = 0xffff;
  }
  for (iVar2 = 0; iVar2 < DAT_3c04_080f; iVar2 = iVar2 + 1) {
    iVar1 = (iVar2 * 10) / DAT_3c04_080f;
    if (iVar3 != iVar1) {
      thunk_FUN_4bea_01ff();
      iVar3 = iVar1;
    }
    FUN_5131_0a77(7,&local_4);
    *(int *)(iVar2 * 0x1f + 0x811) = local_4;
    *(int *)(iVar2 * 0x1f + 0x813) = local_6;
    *(undefined1 *)((int)DAT_451b_002a + local_6 * 0x70 + local_4 + 0x6120) = 0xb;
    if (*(char *)(iVar2 * 0x1f + 0x829) == '\x01') {
      thunk_FUN_7e8f_02bf();
      FUN_1000_4944(local_112);
      FUN_1000_4a70(iVar2 * 0x1f + 0x815,0x3c04,local_112);
    }
    else {
      local_8 = thunk_FUN_7e8f_02bf();
      iVar1 = thunk_FUN_7e8f_02bf();
      thunk_FUN_7e8f_02bf(1,0xffff000a,(int)DAT_451b_002a + iVar1 * 10 + 0xf9c);
      FUN_1000_4944(local_12);
      FUN_1000_4944(local_112);
      FUN_1000_4a70(iVar2 * 0x1f + 0x815,0x3c04,local_112);
    }
    FUN_1000_4944(local_112);
    uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    FUN_1000_4a70((char *)s_print_scanf___floating_point_for_4125_3e8a + 0xc +
                  (int)DAT_451b_002a +
                  *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 9 +
                          (int)DAT_451b_002a),uVar4,local_112);
    iVar1 = FUN_1000_4a99();
    uVar4 = (undefined2)((ulong)DAT_451b_002a >> 0x10);
    *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 9 + (int)DAT_451b_002a) =
         *(int *)((char *)s_A_way_for_armies_to_put_to_sea_4125_105d + 9 + (int)DAT_451b_002a) +
         iVar1;
  }
  return;
}

