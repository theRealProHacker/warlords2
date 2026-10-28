
undefined2 __cdecl16far FUN_606a_0cf3(int param_1,undefined4 param_2)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined2 uVar4;
  undefined1 local_1c [16];
  int local_c;
  undefined2 local_a;
  undefined2 local_8;
  undefined2 local_6;
  int local_4;
  
  iVar1 = *(int *)((int)param_2 + param_1 * 2);
  if ((*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 4) ||
     (*(int *)((char *)s_Explored__4125_1105 + DAT_3c04_0110 * 0xc) == 5)) {
    uVar2 = *(uint *)((char *)s_Explored__4125_1105 + 4 + DAT_3c04_0110 * 0xc);
    local_6 = *(undefined2 *)(uVar2 * 0x41 + 0x157d);
    local_8 = *(undefined2 *)(uVar2 * 0x41 + 0x157f);
    if ((*(byte *)((int)DAT_451b_018e + uVar2 + 0x11e) & 1) == 0) {
      if ((*(char *)(uVar2 * 0x41 + 0x1592) == '\x0f') || (iVar3 = thunk_FUN_8027_225b(), iVar3 < 8)
         ) {
        local_c = 1;
      }
      else {
        local_c = 2;
      }
      iVar3 = thunk_FUN_621e_12c9(*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                                  *(undefined2 *)(iVar1 * 0x16 + -0x777e),local_1c);
      if (local_c <= iVar3) {
        if (((*(byte *)(iVar1 * 0x16 + -0x7772) & 0xf) != 1) ||
           (*(byte *)(iVar1 * 0x16 + -0x7771) >> 1 != uVar2)) {
          local_a = FUN_1a8b_0acc(local_6,local_8,*(undefined2 *)(iVar1 * 0x16 + -0x7780),
                                  *(undefined2 *)(iVar1 * 0x16 + -0x777e));
          local_4 = thunk_FUN_621e_15c5(*(undefined2 *)(uVar2 * 0x41 + 0x157d),
                                        *(undefined2 *)(uVar2 * 0x41 + 0x157f));
          if (local_4 < 0x4b) {
            return 0;
          }
        }
        FUN_1000_4944((undefined1 *)&DAT_451b_1d28,0x4125,0x993,0x4125,uVar2 + 1,local_a,
                      DAT_451b_1e9c,DAT_451b_1e9a);
        thunk_FUN_621e_170c((undefined1 *)&DAT_451b_1d28,0x4125,
                            *(undefined2 *)(iVar1 * 0x16 + -0x7780),
                            *(undefined2 *)(iVar1 * 0x16 + -0x777e));
        thunk_FUN_621e_0ae7(local_1c);
        uVar4 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
        FUN_1a8b_0001(*(undefined2 *)((int)DAT_451b_1f02 + 0x12),
                      *(undefined2 *)((int)DAT_451b_1f02 + 0x14),0);
        return 1;
      }
    }
  }
  return 0;
}

