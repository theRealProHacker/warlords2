
void FUN_705a_1544(undefined2 param_1,int param_2)

{
  undefined1 uVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined2 unaff_SS;
  undefined1 auStack_54 [30];
  uint uStack_36;
  int aiStack_14 [8];
  int iStack_4;
  
  if (-1 < *(char *)(param_2 * 0x41 + 0x1593)) {
    for (iVar4 = 0;
        (iVar4 < 4 &&
        (aiStack_14[iVar4] = (int)*(char *)(param_2 * 0x41 + iVar4 + 0x1593), -1 < aiStack_14[iVar4]
        )); iVar4 = iVar4 + 1) {
      FUN_705a_14ac((undefined2 *)&DAT_451b_30fa,aiStack_14[iVar4],auStack_54);
      aiStack_14[iVar4 + 4] = (uStack_36 ^ (int)uStack_36 >> 0xf) - ((int)uStack_36 >> 0xf);
    }
    for (iVar5 = 1; iVar3 = iVar5, iVar5 < iVar4; iVar5 = iVar5 + 1) {
      while ((0 < iVar3 && (aiStack_14[iVar3 + 4] < aiStack_14[iVar3 + 3]))) {
        iStack_4 = aiStack_14[iVar3 + 4];
        aiStack_14[iVar3 + 4] = aiStack_14[iVar3 + 3];
        aiStack_14[iVar3 + 3] = iStack_4;
        uVar1 = *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1593);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1593) =
             *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1592);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1592) = uVar1;
        uVar1 = *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159b);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159b) =
             *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159a);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159a) = uVar1;
        uVar1 = *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x15a3);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x15a3) =
             *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x15a2);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x15a2) = uVar1;
        uVar1 = *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159f);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159f) =
             *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159e);
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x159e) = uVar1;
        cVar2 = *(char *)(param_2 * 0x41 + iVar3 + 0x1597);
        iStack_4 = (int)cVar2;
        *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1597) =
             *(undefined1 *)(param_2 * 0x41 + iVar3 + 0x1596);
        *(char *)(param_2 * 0x41 + iVar3 + 0x1596) = cVar2;
        iVar3 = iVar3 + -1;
      }
    }
  }
  return;
}

