
void __cdecl16far
thunk_FUN_6d27_1244(int param_1,char param_2,undefined2 param_3,undefined2 param_4,
                   undefined4 param_5)

{
  uint uVar1;
  
  if (*(char *)(param_1 * 0x2b + 0x13e3) < '\x02') {
    uVar1 = (uint)*(char *)(param_1 * 0x2b + 0x13e3);
    *(char *)(param_1 * 0x2b + 0x13e3) = *(char *)(param_1 * 0x2b + 0x13e3) + '\x01';
  }
  else {
    uVar1 = (uint)(*(char *)(param_1 * 0x2b + 0x13e4) <= *(char *)(param_1 * 0x2b + 0x13e5));
    if (*(char *)(param_1 * 0x2b + uVar1 + 0x13e4) <= param_2) {
      return;
    }
  }
  *(char *)(param_1 * 0x2b + uVar1 + 0x13e4) = param_2;
  *(undefined2 *)(param_1 * 0x2b + uVar1 * 2 + 0x13e6) = param_3;
  *(undefined2 *)(param_1 * 0x2b + uVar1 * 2 + 0x13ea) = param_4;
  FUN_1000_4a70(param_1 * 0x2b + uVar1 * 0x10 + 0x13ee,0x3c04,param_5);
  return;
}

