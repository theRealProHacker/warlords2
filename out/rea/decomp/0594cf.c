
undefined2 __cdecl16far
FUN_57d5_177f(int param_1,int *param_2,int *param_3,undefined2 *param_4,undefined4 param_5,
             undefined4 param_6)

{
  char cVar1;
  int iVar2;
  int iVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  int local_1a;
  int local_10;
  int local_e;
  undefined2 local_4;
  
  local_4 = 0;
  iVar2 = *(int *)(param_1 * 0x16 + -0x7780);
  iVar3 = *(int *)(param_1 * 0x16 + -0x777e);
  uVar4 = *(undefined2 *)(*(char *)(param_1 * 0x16 + -0x7777) * 0x41 + 0x157d);
  uVar5 = *(undefined2 *)(*(char *)(param_1 * 0x16 + -0x7777) * 0x41 + 0x157f);
  local_e = 0;
  bVar11 = (*(uint *)(param_1 * 0x16 + -0x7774) & 0x1000) != 0;
  *param_4 = 0;
  iVar6 = thunk_FUN_7e8f_02bf();
  if ((((iVar6 == 0) && (*(char *)(*(byte *)(iVar3 * 0xe0 + iVar2 * 2) + 0x710) == '\n')) &&
      (iVar6 = FUN_1555_109d(iVar2,iVar3), iVar6 != 0)) &&
     (*(char *)(param_1 * 0x16 + -0x777c) != '\x1c')) {
    bVar11 = true;
  }
  iVar6 = iVar2 + -5;
  do {
    if (iVar2 + 5 <= iVar6) {
      return local_4;
    }
    for (iVar10 = iVar3 + -5; iVar10 < iVar3 + 5; iVar10 = iVar10 + 1) {
      if (((-1 < iVar6) && (-1 < iVar10)) && ((iVar6 < 0x70 && (iVar10 < 0x9c)))) {
        if ((*(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710) == '\n') &&
           ((*(byte *)(iVar10 * 0xe0 + iVar6 * 2 + 1) & 0xf) != DAT_3c04_0110)) {
          FUN_57d5_1bab(param_1,iVar6,iVar10,param_4,param_5,param_6);
        }
        if (*(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710) == '\v') {
          FUN_57d5_1c9d(param_1,iVar6,iVar10,param_4,param_5,param_6);
        }
        if ((*(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710) != '\n') &&
           (((((DAT_451b_1e9c == 2 || ((*(byte *)(iVar10 * 0x70 + iVar6) & 0x1f) != 0)) ||
              ((DAT_451b_1e9a & 1) != 0)) ||
             (*(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710) != '\x05')) &&
            (((*(byte *)(iVar10 * 0x70 + iVar6) & 0x20) == 0 &&
             ((DAT_451b_1e9c == 2 ||
              (*(int *)(*(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710) * 2 + 0x1274) != 0))
             )))))) {
          local_10 = 0;
          for (iVar9 = iVar6 + -1; iVar9 <= iVar6 + 1; iVar9 = iVar9 + 1) {
            for (iVar8 = iVar10 + -1; iVar8 <= iVar10 + 1; iVar8 = iVar8 + 1) {
              if (((-1 < iVar9) && (-1 < iVar8)) &&
                 ((iVar9 < 0x70 &&
                  ((iVar8 < 0x9c && ((*(byte *)(iVar8 * 0x70 + iVar9) & 0x20) == 0)))))) {
                local_10 = local_10 + 1;
              }
            }
          }
          if (1 < local_10) {
            local_1a = 0;
            cVar1 = *(char *)(*(byte *)(iVar10 * 0xe0 + iVar6 * 2) + 0x710);
            if (bVar11) {
              if ((cVar1 == '\x02') || (cVar1 == '\x03')) {
LAB_57d5_1b01:
                local_1a = local_1a + 200;
              }
            }
            else if ((cVar1 != '\x02') && (cVar1 != '\x03')) {
              if (cVar1 != '\x05') {
                local_1a = 100;
              }
              if ((*(byte *)(iVar10 * 0x70 + iVar6) & 0x1f) != 0) goto LAB_57d5_1b01;
            }
            iVar9 = FUN_1a8b_0acc(iVar6,iVar10,iVar2,iVar3);
            iVar7 = FUN_1a8b_0acc(iVar6,iVar10,uVar4,uVar5);
            iVar8 = thunk_FUN_7e8f_02bf();
            iVar9 = iVar8 + iVar9 * 2 + iVar7 + local_10 * 10 + local_1a;
            if ((bVar11) && (local_1a != 0)) {
              if (0x32 < iVar7) {
                iVar7 = 0x32;
              }
              iVar9 = iVar9 + iVar7 * 10;
            }
            if (local_e < iVar9) {
              *param_2 = iVar6;
              *param_3 = iVar10;
              local_4 = 1;
              local_e = iVar9;
            }
          }
        }
      }
    }
    iVar6 = iVar6 + 1;
  } while( true );
}

