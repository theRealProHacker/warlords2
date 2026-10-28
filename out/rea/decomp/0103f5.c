
uint __cdecl16far FUN_1000_03f5(undefined4 param_1)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  
  uVar3 = (uint)param_1;
  uVar1 = FUN_1000_06f7(uVar3,(int)((ulong)param_1 >> 0x10),0,0,0x3eb,0x1000);
  if (uVar3 != 0) {
                    /* WARNING: Read-only address (ram,0x000103e7) is written */
                    /* WARNING: Read-only address (ram,0x000103e9) is written */
    UINT_1000_03e7 = uVar1;
    UINT_1000_03e9 = uVar3;
                    /* WARNING: Read-only address (ram,0x000103ef) is written */
    if ((((cRam00000003 == 'D') && (cRam00000004 == 'I')) && (cRam00000005 == 'G')) &&
       (((cRam00000006 == 'P' && (cRam00000007 == 'A')) &&
        ((cRam00000008 == 'K' &&
         (UINT_1000_03ef = 0xfff0, DAT_1000_03f3 = 0xfff0,
         iVar2 = (*(code *)s_A_Signpost__4125_03eb._2_2_)(0x1000), iVar2 == 0)))))) {
      uVar1 = 1;
    }
    else {
      FUN_255e_07ea(0,0);
      uVar1 = 0;
                    /* WARNING: Read-only address (ram,0x000103eb) is written */
      UINT_1000_03eb = 0;
    }
  }
  return uVar1;
}

