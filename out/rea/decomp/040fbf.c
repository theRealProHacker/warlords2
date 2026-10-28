
void __cdecl16far thunk_FUN_85d0_0000(void)

{
  int iVar1;
  
  DAT_451b_2509 = DAT_451b_2509 & 0xfe;
  DAT_451b_2263 = DAT_451b_2263 & 0xfe;
  FUN_2012_09cf(0x6795,0x4125);
  iVar1 = FUN_2012_01fe(0x6795,0x4125,0x1680168);
  if (iVar1 == 0) {
    thunk_FUN_79a9_0000((char *)s_Can_t_allocate_OS_bitmap_4125_2f1c,0x4125);
  }
  thunk_FUN_79a9_0054();
  return;
}

