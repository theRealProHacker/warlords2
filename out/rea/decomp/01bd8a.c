
void __cdecl16far FUN_1b62_076a(void)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  
  if (DAT_4125_2bda == 0) {
    uVar4 = (undefined2)((ulong)DAT_451b_1f02 >> 0x10);
    puVar1 = (undefined2 *)DAT_451b_1f02;
    if (*(char *)(puVar1 + 2) == '\x1c') {
      thunk_FUN_67a7_16cd(puVar1,uVar4,*DAT_451b_1f02,puVar1[1]);
    }
    FUN_1b62_03be(DAT_451b_1f02);
  }
  else {
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      if (((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] != 0 ||
          *(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) != 0) {
        uVar4 = (undefined2)
                ((ulong)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2) >> 0x10);
        if ((*(char *)((int)*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2) + 4) == '\x1c'
            ) && (thunk_FUN_67a7_16cd(*(undefined4 *)((undefined2 *)&DAT_451b_1ede + iVar3 * 2),
                                      *(undefined2 *)((undefined2 *)&DAT_451b_1ede)[iVar3 * 2],
                                      *(undefined2 *)(((undefined2 *)&DAT_451b_1ede)[iVar3 * 2] + 2)
                                     ),
                 *(int *)((char *)s_Unexplored__4125_10f9 + 10 + DAT_3c04_0110 * 0xc) != 0)) {
          if ((*(int *)((undefined *)&DAT_451b_1ee0 + iVar3 * 4) == 0x2e1d) &&
             (*(int *)((char *)s_Explored__4125_1105 + 2 + DAT_3c04_0110 * 0xc) * 0x16 + -0x7780 ==
              ((undefined2 *)&DAT_451b_1ede)[iVar3 * 2])) {
            iVar2 = DAT_3c04_0110 * 0xc;
            ((char *)s_Unexplored__4125_10f9 + 10 + iVar2)[0] = '\0';
            ((char *)s_Unexplored__4125_10f9 + 10 + iVar2)[1] = '\0';
          }
        }
        FUN_1b62_03be();
      }
    }
  }
  DAT_451b_1f02 = (undefined2 *)0x0;
  DAT_451b_1efe = 0;
  DAT_4125_2bda = 0;
  thunk_FUN_824f_0000();
  thunk_FUN_824f_02bf();
  thunk_FUN_824f_0af3();
  thunk_FUN_8027_0000(0);
  return;
}

