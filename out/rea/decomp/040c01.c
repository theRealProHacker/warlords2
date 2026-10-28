
/* WARNING: Instruction at (ram,0x0007ff6b) overlaps instruction at (ram,0x0007ff6a)
    */

int __cdecl16far thunk_FUN_7d9f_026f(uint param_1)

{
  int *piVar1;
  char cVar2;
  int in_AX;
  int iVar3;
  undefined2 uVar4;
  undefined2 uVar5;
  int iVar6;
  int in_DX;
  int *piVar7;
  int iVar8;
  int unaff_SI;
  undefined4 *puVar9;
  undefined2 unaff_SS;
  undefined1 uStack_24;
  
  if (DAT_4125_26c8 != 0) {
    return in_AX;
  }
  thunk_FUN_7e8f_0a1b();
  iVar3 = DAT_3c04_0110;
  if (param_1 != 5) goto LAB_7d9f_071b;
  if (0x27 < (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110]) {
    return 0x3c04;
  }
  unaff_SI = 0;
  iVar6 = DAT_3c04_0181;
  while (iVar8 = iVar6 + -1, iVar6 != 0) {
    iVar6 = iVar8;
    if ((*(char *)(iVar8 * 0x16 + -0x777c) == '\x1c') &&
       (*(char *)(iVar8 * 0x16 + -0x777b) == DAT_3c04_0110)) {
      unaff_SI = unaff_SI + 1;
    }
  }
  if (((*(char *)(DAT_3c04_0110 + 0x100) == '\x02') &&
      ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < (int)*(char *)(DAT_3c04_0110 + 0x108)))
     || ((*(char *)(DAT_3c04_0110 + 0x100) != '\x02' &&
         ((int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110] < (int)*(char *)(DAT_3c04_0110 + 0x108)
         )))) {
    iVar6 = ((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110];
    iVar8 = (iVar6 / 5) * 5;
    *(undefined1 *)(DAT_3c04_0110 + 0x100) = 2;
    uStack_24 = (undefined1)iVar8;
    in_DX = CONCAT11((char)((uint)(iVar6 % 5) >> 8),uStack_24);
    *(undefined1 *)(iVar3 + 0x108) = uStack_24;
    iVar3 = 6;
    piVar7 = (int *)0xb3b;
    do {
      if (*piVar7 == iVar8 + 5) {
                    /* WARNING: Could not recover jumptable at 0x0007ddc2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        iVar3 = (*(code *)piVar7[6])();
        return iVar3;
      }
      piVar7 = piVar7 + 1;
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
LAB_7d9f_03e3:
    thunk_FUN_7e8f_0505();
    FUN_1000_4a70();
  }
  else {
    if (((*(char *)(DAT_3c04_0110 + 0x100) == '\x02') &&
        (*(char *)(DAT_3c04_0110 + 0x108) + 5 <= (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110])
        ) || ((*(char *)(DAT_3c04_0110 + 0x100) != '\x02' &&
              (*(char *)(DAT_3c04_0110 + 0x108) + 5 <=
               (int)((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110])))) {
      iVar6 = ((undefined2 *)&DAT_451b_1e8a)[DAT_3c04_0110];
      iVar8 = (iVar6 / 5) * 5;
      *(undefined1 *)(DAT_3c04_0110 + 0x100) = 1;
      uStack_24 = (undefined1)iVar8;
      in_DX = CONCAT11((char)((uint)(iVar6 % 5) >> 8),uStack_24);
      *(undefined1 *)(iVar3 + 0x108) = uStack_24;
      iVar3 = 6;
      piVar7 = (int *)0xb23;
      do {
        if (*piVar7 == iVar8) {
                    /* WARNING: Could not recover jumptable at 0x0007df56. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          iVar3 = (*(code *)piVar7[6])();
          return iVar3;
        }
        piVar7 = piVar7 + 1;
        iVar3 = iVar3 + -1;
      } while (iVar3 != 0);
      goto LAB_7d9f_03e3;
    }
    iVar3 = thunk_FUN_8027_225b();
    in_DX = iVar3 % 7;
    if (in_DX != 0) {
      return iVar3 / 7;
    }
    if ((((*(int *)(DAT_3c04_0110 * 0x14 + 0x185) < 100) ||
         (0xaf0 < *(int *)(DAT_3c04_0110 * 0x14 + 0x185))) || (unaff_SI < 1)) || (4 < unaff_SI))
    goto LAB_7d9f_03e3;
    iVar3 = thunk_FUN_7e8f_02bf();
    if (iVar3 != 1) {
      return iVar3;
    }
    thunk_FUN_7e8f_0505();
    FUN_1000_4944();
  }
  iVar3 = thunk_FUN_8027_225b();
  if (iVar3 == 1) {
    return 1;
  }
LAB_7d9f_071b:
  FUN_22bf_07a5();
  FUN_255e_0736();
  FUN_216d_002e();
  FUN_216d_000e();
  iVar3 = FUN_2012_01fe();
  if (iVar3 == 0) {
    iVar3 = 0;
  }
  else {
    if ((DAT_4125_263e != 0) && ((DAT_4125_2669 & 10) == 0)) {
      for (unaff_SI = 0; unaff_SI < (int)(uint)DAT_4125_2668; unaff_SI = unaff_SI + 1) {
        uVar4 = FUN_1d28_069a();
        ((undefined2 *)&DAT_4125_2650)[unaff_SI * 2] = in_DX;
        ((undefined2 *)&DAT_4125_264e)[unaff_SI * 2] = uVar4;
      }
    }
    (*DAT_451b_2a74)();
    if ((DAT_4125_263e != 0) && ((DAT_4125_2669 & 10) == 0)) {
      for (unaff_SI = 0; unaff_SI < (int)(uint)DAT_4125_2668; unaff_SI = unaff_SI + 1) {
        FUN_1d28_07a9();
      }
    }
    FUN_1000_1d02();
    FUN_1e68_000a();
    iVar6 = 8;
    uVar4 = unaff_SS;
    FUN_1000_1e79();
    iVar3 = FUN_1997_027e();
    if (param_1 < 6) {
      iVar8 = param_1 * 2;
      switch(param_1) {
      case 0:
        if (*(char *)(iVar8 + 0x1592) == DAT_3c04_0110) {
          if (((undefined1 *)&DAT_451b_0664)[param_1 * 6] == '\0') {
            if (*(int *)(*(char *)(*(byte *)(unaff_SI * 2 + 0x3400) + 0x710) * 2 + 0x1274) < 1) {
              iVar3 = 0;
            }
            else {
              iVar3 = 1;
            }
          }
          else {
            iVar3 = 1;
          }
        }
        else {
          iVar3 = 0;
        }
        return iVar3;
      case 1:
        FUN_1d28_07a9();
        iVar3 = DAT_4125_267a * 0x50;
        DAT_4125_267a = (DAT_4125_267a + 1) % 8;
        return iVar3 + 0x59a8;
      case 2:
        DAT_4974_1298 = 0;
        *(undefined1 *)(param_1 * 0x82 + 0x15aa) = *(undefined1 *)(DAT_4125_0e98 * 0x41 + 0x162f);
        FUN_22bf_07a5();
        thunk_FUN_54e4_07e4();
        thunk_FUN_71d6_06de();
        thunk_FUN_71d6_1a9b();
        thunk_FUN_71d6_03a9();
        iVar3 = FUN_22bf_0757();
        return iVar3;
      case 3:
        return iVar3;
      case 5:
        do {
          piVar1 = (int *)((int)DAT_451b_1d82 + iVar3);
          *piVar1 = *piVar1 + -1;
          iVar3 = iVar6;
          while( true ) {
            iVar6 = iVar3 + -1;
            iVar8 = (int)DAT_451b_1d82;
            uVar4 = (undefined2)((ulong)DAT_451b_1d82 >> 0x10);
            if (iVar3 == 0) {
              DAT_451b_1d86 = DAT_451b_1d86 + 1;
              if (6 < DAT_451b_1d86) {
                DAT_451b_1d86 = 6;
                DAT_4125_2a49 = *(undefined2 *)(iVar8 + 0xc);
                FUN_7f3a_0996();
              }
              FUN_6f60_0ae5();
              iVar3 = FUN_7f3a_0a86();
              return iVar3;
            }
            if (iVar6 < 1) break;
            *(undefined2 *)(iVar8 + iVar6 * 2) = *(undefined2 *)(iVar8 + (iVar3 + -2) * 2);
            iVar3 = iVar6;
          }
          iVar3 = iVar6 * 2;
        } while( true );
      }
      if ((int)param_1 < 0 == iVar8 < 0) {
        *(char *)(iVar8 + unaff_SI) = *(char *)(iVar8 + unaff_SI) + (char)uVar4;
        iVar3 = thunk_FUN_7e8f_00bf();
        puVar9 = (undefined4 *)(unaff_SI + 1);
        if ((int)puVar9 < DAT_4125_0e52) {
          *(int *)(iVar8 + 0x160) = *(int *)(iVar8 + 0x160) + iVar3;
          (&stack0x066c)[(int)puVar9] = (&stack0x066c)[(int)puVar9] + (char)iVar8;
          return (int)*puVar9;
        }
        iVar3 = FUN_7f3a_0a33();
        return iVar3;
      }
      if (DAT_451b_0500 < 0x97) {
        FUN_18a9_05f0();
      }
      else {
        FUN_18a9_05f0();
      }
      FUN_18a9_05f0();
      if (DAT_451b_0502 < 1) {
        FUN_18a9_05f0();
      }
      else {
        FUN_18a9_05f0();
      }
      iVar3 = FUN_18a9_05f0();
      return iVar3;
    }
    iVar3 = thunk_FUN_7e8f_02bf();
    while ((cVar2 = FUN_255e_075a(), cVar2 != '\0' && (DAT_4125_37a4 != 0))) {
      thunk_FUN_7e8f_0000();
      iVar3 = iVar3 + 1;
      if (0x28 < iVar3) {
        FUN_216d_000e();
        iVar3 = 0;
        FUN_1e68_000a();
        FUN_216d_002e();
        FUN_1000_1e79();
        FUN_1997_0129();
        thunk_FUN_7e8f_0000();
        FUN_1e68_000a();
        FUN_216d_002e();
        FUN_1000_1e79();
        FUN_1997_0129();
        thunk_FUN_7e8f_0000();
        FUN_1e68_000a();
        FUN_216d_002e();
        FUN_1000_1e79();
        FUN_1997_0129();
        thunk_FUN_7e8f_0000();
        FUN_1e68_000a();
        FUN_216d_002e();
        uVar4 = unaff_SS;
        FUN_1000_1e79();
        FUN_1997_0129();
      }
    }
    FUN_255e_0736();
    if (DAT_4125_37a4 != 0) {
      thunk_FUN_7e8f_0000();
    }
    if ((DAT_4125_263e != 0) && ((DAT_4125_2669 & 10) == 0)) {
      for (iVar3 = 0; iVar3 < (int)(uint)DAT_4125_2668; iVar3 = iVar3 + 1) {
        uVar5 = FUN_1d28_069a();
        ((undefined2 *)&DAT_4125_2650)[iVar3 * 2] = uVar4;
        ((undefined2 *)&DAT_4125_264e)[iVar3 * 2] = uVar5;
      }
    }
    FUN_1e68_000a();
    (*DAT_451b_2a74)();
    FUN_2012_0975();
    FUN_22bf_0757();
    iVar3 = thunk_FUN_7e8f_0a1b();
  }
  return iVar3;
}

