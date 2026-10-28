
/* WARNING: Removing unreachable block (ram,0x0001a6c9) */
/* WARNING: Removing unreachable block (ram,0x0001a64a) */

void __cdecl16far FUN_1a4c_000b(int param_1,undefined4 param_2)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 *puVar5;
  int *piVar6;
  undefined2 uVar7;
  undefined4 local_c;
  
  DAT_4125_3286 = 0x1a4c;
  DAT_4125_3284 = 0x388;
  iVar2 = FUN_1ea3_0000();
  if (iVar2 == -1) {
    FUN_1000_43ac((char *)s_Sorry__not_enough_memory_to_load_4125_26ce,0x4125);
    FUN_1000_1cc7();
  }
  FUN_152a_0251();
  DAT_4125_3384 = 1;
  DAT_4125_338c = 0;
  if (1 < param_1) {
    for (iVar2 = 1; iVar2 < param_1; iVar2 = iVar2 + 1) {
      uVar7 = (undefined2)((ulong)param_2 >> 0x10);
      puVar5 = (undefined2 *)((int)param_2 + iVar2 * 4);
      local_c = (char *)CONCAT22(puVar5[1],(char *)*puVar5);
      while ((*local_c == '-' || (*local_c == '/'))) {
        local_c = (char *)CONCAT22(local_c._2_2_,(char *)local_c + 1);
      }
      iVar3 = FUN_1000_288d();
      iVar4 = 0x10;
      piVar6 = (int *)((char *)s_Random_data_not_found_4125_0274 + 1);
      do {
        if (*piVar6 == iVar3) {
                    /* WARNING: Could not recover jumptable at 0x0001a577. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)piVar6[0x10])();
          return;
        }
        piVar6 = piVar6 + 1;
        iVar4 = iVar4 + -1;
      } while (iVar4 != 0);
      FUN_1000_478f((char *)s__x__Use_extended_memory_4125_2703,0x4125);
      FUN_1000_478f((char *)s__h__Do_not_use_expanded_or_exten_4125_271d);
      FUN_1000_478f((char *)s__s__Use_alternate_army_names_4125_2748);
      FUN_1000_478f((char *)s__m__Mono_version__for_laptop_use_4125_2765);
      FUN_1000_478f((char *)s__v__No_talking_advisor_4125_2786);
      FUN_1000_478f((char *)s__n__No_startup_animation_4125_279d);
      FUN_1000_1cc7();
    }
  }
  FUN_25de_08ef();
  DAT_451b_1d7c = 4;
  FUN_1ea3_008c();
  FUN_2012_0043();
  FUN_251d_0009();
  thunk_FUN_7e8f_03a0();
  cVar1 = FUN_255e_0005();
  if (cVar1 == '\0') {
    FUN_1000_43ac(0x27b7,0x4125);
    FUN_1a4c_02b5();
  }
  thunk_FUN_7d9f_0bc5();
  thunk_FUN_79c4_02cd();
  thunk_FUN_85d0_0000();
  DAT_451b_1d7d = 1;
  FUN_1e8f_004b();
  FUN_1e8f_0093();
  FUN_1e8f_00f8();
  thunk_FUN_7e8f_0356();
  DAT_451b_1d7e = 6;
  thunk_FUN_7ae8_0000();
  thunk_FUN_8027_092a();
  thunk_FUN_7ae8_0000();
  thunk_FUN_76ef_0e5f();
  thunk_FUN_76ef_1029();
  thunk_FUN_85d0_0ccf();
  thunk_FUN_7875_0000();
  thunk_FUN_7ab1_0052();
  FUN_18a9_000e();
  return;
}

