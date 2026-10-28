
/* WARNING: Removing unreachable block (ram,0x000783d6) */
/* WARNING: Removing unreachable block (ram,0x000783ea) */
/* WARNING: Removing unreachable block (ram,0x000783dd) */

void __cdecl16far FUN_76ef_1463(undefined4 param_1)

{
  undefined1 local_52 [40];
  undefined1 local_2a [40];
  
  ((undefined1 *)&DAT_451b_0712)[DAT_4125_128c] = 1;
  FUN_1000_4a70(DAT_4125_128c * 0xf + 0x467c,0x4125,param_1);
  FUN_76ef_1116();
  thunk_FUN_7e8f_0505(0x1a,DAT_4125_128c);
  FUN_1000_4a70(local_2a);
  thunk_FUN_7e8f_0505(0x1b);
  FUN_1000_4a70(local_52);
  FUN_76ef_0d61(local_52);
  thunk_FUN_7f3a_0000();
  return;
}

