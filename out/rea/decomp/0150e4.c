
int __cdecl16far FUN_1000_50e4(uint param_1,char *param_2,undefined2 param_3,int param_4)

{
  uint *puVar1;
  char *pcVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  undefined2 unaff_SS;
  char local_90 [130];
  undefined4 local_e;
  char local_9;
  int local_8;
  char *local_6;
  undefined2 uVar7;
  
  if (param_1 < DAT_4125_3cfc) {
    if (param_4 + 1U < 2) {
      iVar5 = 0;
    }
    else {
      if ((*(uint *)(param_1 * 2 + 0x3cfe) & 0x800) != 0) {
        FUN_1000_1f98(param_1,0,0,2);
      }
      if ((*(uint *)(param_1 * 2 + 0x3cfe) & 0x4000) == 0) {
        iVar5 = FUN_1000_5235(param_1,param_2,param_3,param_4);
      }
      else {
        puVar1 = (uint *)(param_1 * 2 + 0x3cfe);
        *puVar1 = *puVar1 & 0xfdff;
        local_e = (char *)CONCAT22(param_3,param_2);
        local_8 = param_4;
        do {
          _local_6 = (char *)CONCAT22(unaff_SS,local_90);
          do {
            pcVar4 = local_e;
            if (local_8 == 0) {
              iVar5 = (int)local_6 - (int)local_90;
              if (iVar5 == 0) {
                return param_4;
              }
              iVar6 = FUN_1000_5235(param_1,local_90);
              if (iVar6 == iVar5) {
                return param_4;
              }
              if (iVar6 == -1) goto LAB_1000_51d4;
              goto LAB_1000_5226;
            }
            local_8 = local_8 + -1;
            local_e = (char *)CONCAT22(local_e._2_2_,(char *)local_e + 1);
            local_9 = *pcVar4;
            if (local_9 == '\n') {
              *_local_6 = '\r';
              uVar7 = (undefined2)((ulong)_local_6 >> 0x10);
              _local_6 = (char *)CONCAT22(uVar7,local_6 + 1);
            }
            *_local_6 = local_9;
            pcVar2 = local_6 + 1;
            uVar7 = (undefined2)((ulong)_local_6 >> 0x10);
            _local_6 = (char *)CONCAT22(uVar7,pcVar2);
            uVar3 = (uint)(pcVar2 < local_90);
          } while (((int)-uVar3 < 0) ||
                  ((uVar3 == 0 && ((uint)((int)pcVar2 - (int)local_90) < 0x80))));
          iVar5 = (int)pcVar2 - (int)local_90;
          iVar6 = FUN_1000_5235(param_1,local_90);
        } while (iVar6 == iVar5);
        if (iVar6 == -1) {
LAB_1000_51d4:
          iVar5 = -1;
        }
        else {
          param_4 = param_4 - local_8;
LAB_1000_5226:
          iVar5 = (param_4 + iVar6) - iVar5;
        }
      }
    }
  }
  else {
    iVar5 = FUN_1000_1e9a(6);
  }
  return iVar5;
}

