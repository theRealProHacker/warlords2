
/* WARNING: Type propagation algorithm not settling */

uint FUN_1000_458c(int *param_1,uint param_2,byte *param_3)

{
  byte bVar1;
  byte *pbVar2;
  byte *pbVar3;
  int iVar4;
  uint uVar5;
  uint uVar6;
  int *piVar7;
  undefined2 uVar8;
  
  uVar8 = (undefined2)((ulong)param_1 >> 0x10);
  piVar7 = (int *)param_1;
  uVar6 = param_2;
  if ((piVar7[1] & 8U) == 0) {
    if ((piVar7[1] & 0x40U) == 0) {
      if (piVar7[3] != 0) {
        do {
          if (uVar6 == 0) {
            return param_2;
          }
          iVar4 = *param_1;
          *param_1 = *param_1 + 1;
          if (SCARRY2(iVar4,1) == *param_1 < 0) {
            uVar5 = FUN_1000_43c7(*param_3,piVar7,uVar8);
          }
          else {
            iVar4 = piVar7[7];
            pbVar2 = (byte *)piVar7[6];
            piVar7[6] = piVar7[6] + 1;
            bVar1 = *param_3;
            *pbVar2 = bVar1;
            uVar5 = (uint)bVar1;
          }
          param_3 = (byte *)CONCAT22(param_3._2_2_,(byte *)param_3 + 1);
          uVar6 = uVar6 - 1;
        } while (uVar5 != 0xffff);
        return 0;
      }
      uVar6 = FUN_1000_50e4((int)(char)piVar7[2],(byte *)param_3,param_3._2_2_,param_2);
    }
    else if (piVar7[3] == 0) {
      if ((*(uint *)((char)piVar7[2] * 2 + 0x3cfe) & 0x800) != 0) {
        FUN_1000_1f98((int)(char)piVar7[2],0,0,2);
      }
      uVar6 = FUN_1000_5235((int)(char)piVar7[2],(byte *)param_3,param_3._2_2_,param_2);
    }
    else {
      if (param_2 <= (uint)piVar7[3]) {
        if (SCARRY2(*param_1,param_2) == (int)(*param_1 + param_2) < 0) {
          if (*param_1 == 0) {
            *param_1 = -1 - piVar7[3];
          }
          else {
            iVar4 = FUN_1000_3f58(piVar7,uVar8);
            if (iVar4 != 0) {
              return 0;
            }
          }
        }
        FUN_1000_4345(piVar7[6],piVar7[7],(byte *)param_3,param_3._2_2_,param_2);
        *param_1 = *param_1 + param_2;
        piVar7[6] = piVar7[6] + param_2;
        return param_2;
      }
      if ((*param_1 != 0) && (iVar4 = FUN_1000_3f58(piVar7,uVar8), iVar4 != 0)) {
        return 0;
      }
      if ((*(uint *)((char)piVar7[2] * 2 + 0x3cfe) & 0x800) != 0) {
        FUN_1000_1f98((int)(char)piVar7[2],0,0,2);
      }
      uVar6 = FUN_1000_5235((int)(char)piVar7[2],(byte *)param_3,param_3._2_2_,param_2);
    }
    if (uVar6 == param_2) {
      return param_2;
    }
  }
  else {
    do {
      pbVar3 = param_3;
      if (uVar6 == 0) {
        return param_2;
      }
      param_3 = (byte *)CONCAT22(param_3._2_2_,(byte *)param_3 + 1);
      iVar4 = FUN_1000_43e3((int)(char)*pbVar3,piVar7,uVar8);
      uVar6 = uVar6 - 1;
    } while (iVar4 != -1);
  }
  return 0;
}

