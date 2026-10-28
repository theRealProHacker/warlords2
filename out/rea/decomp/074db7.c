
void __cdecl16far FUN_73de_0fd7(int param_1)

{
  int iVar1;
  char *pcVar2;
  
  thunk_FUN_7875_06ae(2,*(undefined2 *)(DAT_3c04_0110 * 2 + 0xa0),
                      *(undefined2 *)(DAT_3c04_0110 * 2 + 0xb0),3);
  thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,DAT_451b_052a + 0xb,
                      param_1 * 0x1f + 0x815,0x3c04);
  thunk_FUN_7875_06ae(0xf0002,0x30000);
  if (*(char *)(param_1 * 0x1f + 0x829) == '\x01') {
    pcVar2 = s_Blessings___Quests__4125_10e5;
  }
  else {
    if ((*(byte *)(*(int *)(param_1 * 0x1f + 0x813) * 0xe0 + *(int *)(param_1 * 0x1f + 0x811) * 2 +
                  1) & 0x40) != 0) {
      pcVar2 = s_Explored__4125_1105;
      iVar1 = DAT_451b_052a + 0x21;
      goto LAB_73de_1074;
    }
    pcVar2 = s_Unexplored__4125_10f9;
  }
  iVar1 = DAT_451b_052a + 0x23;
LAB_73de_1074:
  thunk_FUN_7e8f_00d6(DAT_451b_0528 + DAT_451b_052c / 2 + -8,iVar1,pcVar2);
  return;
}

