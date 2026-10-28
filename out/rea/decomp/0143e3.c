
uint __cdecl16far FUN_1000_43e3(byte param_1,int *param_2)

{
  byte *pbVar1;
  int iVar2;
  int *piVar3;
  undefined2 uVar4;
  
  DAT_451b_31fc = param_1;
  uVar4 = (undefined2)((ulong)param_2 >> 0x10);
  piVar3 = (int *)param_2;
  if (*param_2 < -1) {
    *param_2 = *param_2 + 1;
    iVar2 = piVar3[7];
    pbVar1 = (byte *)piVar3[6];
    piVar3[6] = piVar3[6] + 1;
    *pbVar1 = DAT_451b_31fc;
    if (((piVar3[1] & 8U) == 0) || ((DAT_451b_31fc != 10 && (DAT_451b_31fc != 0xd))))
    goto LAB_1000_4570;
    iVar2 = FUN_1000_3f58(piVar3,uVar4);
joined_r0x0001443c:
    if (iVar2 == 0) {
LAB_1000_4570:
      return (uint)DAT_451b_31fc;
    }
  }
  else {
    if (((piVar3[1] & 0x90U) == 0) && ((piVar3[1] & 2U) != 0)) {
      piVar3[1] = piVar3[1] | 0x100;
      if (piVar3[3] != 0) {
        if ((*param_2 != 0) && (iVar2 = FUN_1000_3f58(piVar3,uVar4), iVar2 != 0)) {
          return 0xffff;
        }
        *param_2 = -piVar3[3];
        iVar2 = piVar3[7];
        pbVar1 = (byte *)piVar3[6];
        piVar3[6] = piVar3[6] + 1;
        *pbVar1 = DAT_451b_31fc;
        if (((piVar3[1] & 8U) == 0) || ((DAT_451b_31fc != 10 && (DAT_451b_31fc != 0xd))))
        goto LAB_1000_4570;
        iVar2 = FUN_1000_3f58(piVar3,uVar4);
        goto joined_r0x0001443c;
      }
      if ((*(uint *)((char)piVar3[2] * 2 + 0x3cfe) & 0x800) != 0) {
        FUN_1000_1f98((int)(char)piVar3[2],0,0,2);
      }
      if (((((DAT_451b_31fc != 10) || ((piVar3[1] & 0x40U) != 0)) ||
           (iVar2 = FUN_1000_5235((int)(char)piVar3[2],0x3ed4,0x4125,1), iVar2 == 1)) &&
          (iVar2 = FUN_1000_5235((int)(char)piVar3[2],(undefined1 *)&DAT_451b_31fc,0x4125,1),
          iVar2 == 1)) || ((piVar3[1] & 0x200U) != 0)) goto LAB_1000_4570;
    }
    piVar3[1] = piVar3[1] | 0x10;
  }
  return 0xffff;
}

