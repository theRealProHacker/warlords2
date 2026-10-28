
bool __cdecl16far FUN_67a7_08a6(void)

{
  int iVar1;
  bool bVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  undefined2 uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  bool bVar10;
  int local_e;
  int local_c;
  
  bVar10 = true;
  iVar9 = 0;
  iVar8 = 0;
  DAT_451b_0254 = '\0';
  DAT_451b_0252 = 0;
  bVar3 = false;
  if ((DAT_451b_0364 == '\0') || (DAT_451b_0365 == '\0')) {
    bVar3 = true;
    DAT_451b_0252 = 1;
  }
  do {
    if (bVar3) {
      return bVar10;
    }
    bVar2 = false;
    local_e = 0;
    if ((char)((undefined1 *)&DAT_451b_0344)[iVar9] < '\x01') {
      iVar4 = 1;
    }
    else {
      iVar4 = (int)(char)((undefined1 *)&DAT_451b_0344)[iVar9];
    }
    if ((char)((undefined1 *)&DAT_451b_033c)[iVar8] < '\x01') {
      iVar5 = 1;
    }
    else {
      iVar5 = (int)(char)((undefined1 *)&DAT_451b_033c)[iVar8];
    }
    while (!bVar2) {
      if (DAT_3c04_0126 == 0) {
        uVar6 = 0x14;
      }
      else {
        uVar6 = 0x18;
      }
      local_c = thunk_FUN_7e8f_02bf(1,uVar6,0);
      if (DAT_3c04_0126 == 0) {
        uVar6 = 0x14;
      }
      else {
        uVar6 = 0x18;
      }
      iVar7 = thunk_FUN_7e8f_02bf(1,uVar6,0);
      iVar1 = local_e + 1;
      if (10000 < local_e) {
        local_c = 0;
        iVar7 = 100;
      }
      local_e = iVar1;
      if (((iVar4 < local_c) || (iVar5 < iVar7)) && ((local_c <= iVar4 || (iVar7 <= iVar5)))) {
        if (((iVar4 < local_c) || (iVar7 <= iVar5)) ||
           ((DAT_3c04_012e != 0 &&
            (((((undefined1 *)&DAT_451b_02ec)[iVar8] == '\x1c' &&
              (*(int *)(DAT_451b_029a * 2 + 0xd0) == 0)) && (DAT_451b_029b == '\x0f')))))) {
          if (((iVar4 < local_c) && (iVar7 <= iVar5)) &&
             (((undefined1 *)&DAT_451b_031c)[iVar9] = ((undefined1 *)&DAT_451b_031c)[iVar9] + -1,
             (char)((undefined1 *)&DAT_451b_031c)[iVar9] < '\0')) {
            ((undefined1 *)&DAT_451b_02cc)[iVar9] = 0;
            iVar9 = iVar9 + 1;
            ((undefined1 *)&DAT_451b_0255)[DAT_451b_0254] = 0;
            goto LAB_67a7_0a20;
          }
        }
        else {
          ((undefined1 *)&DAT_451b_0314)[iVar8] = ((undefined1 *)&DAT_451b_0314)[iVar8] + -1;
          if ((char)((undefined1 *)&DAT_451b_0314)[iVar8] < '\0') {
            ((undefined1 *)&DAT_451b_02c4)[iVar8] = 0;
            iVar8 = iVar8 + 1;
            ((undefined1 *)&DAT_451b_0255)[DAT_451b_0254] = 1;
LAB_67a7_0a20:
            bVar2 = true;
            DAT_451b_0254 = DAT_451b_0254 + '\x01';
          }
        }
        if ((DAT_451b_0365 == iVar9) || (DAT_451b_0364 == iVar8)) {
          bVar3 = true;
          bVar10 = DAT_451b_0365 == iVar9;
        }
      }
    }
  } while( true );
}

