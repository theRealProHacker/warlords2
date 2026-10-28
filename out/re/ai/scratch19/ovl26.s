; ovl26 stub 2fe4 file_off 0x51f70 size 0x810

ovl26_0000:  ; ENTRY
0000 push bp
0001 mov bp, sp
0003 sub sp, 2
0006 push si
0007 mov si, word ptr [bp + 6]
000a mov ax, 0x2c04
000d mov es, ax
000f mov bx, word ptr es:[0x110]
0014 shl bx, 1
0016 mov ax, 0x2c04
0019 mov es, ax
001b cmp word ptr es:[bx + 0xd0], 0
0021 je 0x47
0023 mov bx, word ptr [bp + 8]
0026 shl bx, 1
0028 mov es, ax
002a cmp word ptr es:[bx + 0xd0], 0
0030 jne 0x47
0032 les bx, ptr [0x40ee]
0036 cmp word ptr es:[bx + 0x42], 0
003b je 0x47
003d lcall 0x30d7, 0x84 -> ovl61:225b
0042 cmp ax, 0xa
0045 jl 0x4b
0047 xor ax, ax
0049 jmp 0x7d
004b les bx, ptr [0x40ee]
004f cmp word ptr es:[bx + 0x46], si
0053 je 0x47
0055 push si
0056 lcall 0x3005, 0x39 -> ovl31:07d0
005b pop cx
005c mov word ptr [bp - 2], ax
005f cmp word ptr [bp - 2], 0xc8 ; "Quest"
0064 jl 0x6f
0066 push si
0067 lcall 0x2fb5, 0x2f -> ovl19:199c
006c pop cx
006d jmp 0x7a
006f push 0
0071 push si
0072 lcall 0x2fb5, 0x2a -> ovl19:1864
0077 add sp, 4
007a mov ax, 1
007d pop si
007e leave
007f retf

ovl26_0080:  ; ENTRY
0080 push bp
0081 mov bp, sp
0083 sub sp, 0x1e
0086 push si
0087 push di
0088 push 0x1f401f4
008e push 3
0090 lcall 0x30c1, 0x3e -> ovl59:02bf
0095 add sp, 6
0098 mov word ptr [bp - 2], ax
009b mov word ptr [bp - 4], 0xffff
00a0 mov word ptr [bp - 6], 0xffff
00a5 mov word ptr [bp - 8], 0xffff
00aa mov word ptr [bp - 0xa], 0
00af mov ax, 0x2c04
00b2 mov es, ax
00b4 mov di, word ptr es:[0x157b]
00b9 jmp 0x279
00bc mov bx, di
00be imul bx, bx, 0x41
00c1 mov ax, 0x2c04
00c4 mov es, ax
00c6 cmp byte ptr es:[bx + 0x1592], 0xf
00cc je 0xd1
00ce jmp 0x279
00d1 les bx, ptr [0x40ee]
00d5 add bx, di
00d7 mov al, byte ptr es:[bx + 0x11e]
00dc mov ah, 0
00de test ax, 1
00e1 jne 0xe6
00e3 jmp 0x279
00e6 push ss
00e7 lea ax, [bp - 0x16]
00ea push ax
00eb push ss
00ec lea ax, [bp - 0x10]
00ef push ax
00f0 push 0
00f2 push di
00f3 lcall 0x2fdb, 0x5c -> ovl25:0656
00f8 add sp, 0xc
00fb xor cx, cx
00fd mov si, 6
0100 jmp 0x12c
0102 cmp byte ptr [bp + si - 0x10], 0xff
0106 je 0x12c
0108 mov al, byte ptr [bp + si - 0x10]
010b mov ah, 0
010d imul ax, ax, 0x41
0110 mov dx, 0x2c04
0113 mov bx, ax
0115 mov es, dx
0117 mov al, byte ptr es:[bx + 0x1592]
011c cwde
011d mov dx, 0x2c04
0120 mov es, dx
0122 cmp ax, word ptr es:[0x110]
0127 jne 0x12c
0129 mov cx, 1
012c mov ax, si
012e dec si
012f or ax, ax
0131 jne 0x102
0133 or cx, cx
0135 jne 0x13a
0137 jmp 0x279
013a mov bx, di
013c imul bx, bx, 0x41
013f mov ax, 0x2c04
0142 mov es, ax
0144 mov ax, word ptr es:[bx + 0x157d]
0149 mov word ptr [bp - 0x18], ax
014c mov bx, di
014e imul bx, bx, 0x41
0151 mov ax, 0x2c04
0154 mov es, ax
0156 mov ax, word ptr es:[bx + 0x157f]
015b mov word ptr [bp - 0x1a], ax
015e mov word ptr [bp - 0x1c], 0
0163 mov word ptr [bp - 0x1e], 0x3e8
0168 mov ax, 0x2c04
016b mov es, ax
016d mov si, word ptr es:[0x157b]
0172 jmp 0x224
0175 mov bx, si
0177 imul bx, bx, 0x41
017a mov ax, 0x2c04
017d mov es, ax
017f cmp byte ptr es:[bx + 0x1592], 0xf
0185 jne 0x1d2
0187 les bx, ptr [0x40ee]
018b add bx, si
018d mov al, byte ptr es:[bx + 0x11e]
0192 mov ah, 0
0194 test ax, 1
0197 jne 0x19c
0199 jmp 0x224
019c mov bx, si
019e imul bx, bx, 0x41
01a1 mov ax, 0x2c04
01a4 mov es, ax
01a6 push word ptr es:[bx + 0x157f]
01ab mov bx, si
01ad imul bx, bx, 0x41
01b0 mov ax, 0x2c04
01b3 mov es, ax
01b5 push word ptr es:[bx + 0x157d]
01ba push word ptr [bp - 0x1a]
01bd push word ptr [bp - 0x18]
01c0 lcall 0xa8b, 0xacc -> 0a8b:0acc
01c5 add sp, 8
01c8 cmp ax, 0x14
01cb jge 0x224
01cd inc word ptr [bp - 0x1c]
01d0 jmp 0x224
01d2 mov bx, si
01d4 imul bx, bx, 0x41
01d7 mov ax, 0x2c04
01da mov es, ax
01dc mov al, byte ptr es:[bx + 0x1592]
01e1 cwde
01e2 mov dx, 0x2c04
01e5 mov es, dx
01e7 cmp ax, word ptr es:[0x110]
01ec jne 0x224
01ee mov bx, si
01f0 imul bx, bx, 0x41
01f3 mov ax, 0x2c04
01f6 mov es, ax
01f8 push word ptr es:[bx + 0x157f]
01fd mov bx, si
01ff imul bx, bx, 0x41
0202 mov ax, 0x2c04
0205 mov es, ax
0207 push word ptr es:[bx + 0x157d]
020c push word ptr [bp - 0x1a]
020f push word ptr [bp - 0x18]
0212 lcall 0xa8b, 0xacc -> 0a8b:0acc
0217 add sp, 8
021a mov dx, ax
021c cmp word ptr [bp - 0x1e], dx
021f jle 0x224
0221 mov word ptr [bp - 0x1e], dx
0224 mov ax, si
0226 dec si
0227 or ax, ax
0229 je 0x22e
022b jmp 0x175
022e cmp word ptr [bp - 0x1c], 4
0232 jl 0x279
0234 mov ax, word ptr [bp - 0x1c]
0237 cmp ax, word ptr [bp - 8]
023a jg 0x249
023c cmp ax, word ptr [bp - 8]
023f jne 0x279
0241 mov ax, word ptr [bp - 0x1e]
0244 cmp ax, word ptr [bp - 0xa]
0247 jle 0x279
0249 mov ax, word ptr [bp - 0x1e]
024c mov word ptr [bp - 0xa], ax
024f mov ax, word ptr [bp - 0x1c]
0252 mov word ptr [bp - 8], ax
0255 mov bx, di
0257 imul bx, bx, 0x41
025a mov ax, 0x2c04
025d mov es, ax
025f mov ax, word ptr es:[bx + 0x157d]
0264 mov word ptr [bp - 4], ax
0267 mov bx, di
0269 imul bx, bx, 0x41
026c mov ax, 0x2c04
026f mov es, ax
0271 mov ax, word ptr es:[bx + 0x157f]
0276 mov word ptr [bp - 6], ax
0279 mov ax, di
027b dec di
027c or ax, ax
027e je 0x283
0280 jmp 0xbc
0283 mov ax, 0x2c04
0286 mov es, ax
0288 cmp word ptr es:[0x124], 0
028e jne 0x293
0290 jmp 0x36f
0293 cmp word ptr [bp - 4], -1
0297 jne 0x29c
0299 jmp 0x36f
029c push 0xfffa000b
02a2 push 1
02a4 lcall 0x30c1, 0x3e -> ovl59:02bf
02a9 add sp, 6
02ac mov si, ax
02ae push 0xfffa000b
02b4 push 1
02b6 lcall 0x30c1, 0x3e -> ovl59:02bf
02bb add sp, 6
02be mov dx, ax
02c0 mov ax, word ptr [bp - 4]
02c3 add ax, si
02c5 jge 0x2cb
02c7 xor ax, ax
02c9 jmp 0x2d0
02cb mov ax, word ptr [bp - 4]
02ce add ax, si
02d0 mov word ptr [bp - 4], ax
02d3 mov ax, word ptr [bp - 6]
02d6 add ax, dx
02d8 jge 0x2de
02da xor ax, ax
02dc jmp 0x2e3
02de mov ax, word ptr [bp - 6]
02e1 add ax, dx
02e3 mov word ptr [bp - 6], ax
02e6 cmp word ptr [bp - 4], 0x6f
02ea jge 0x2f1
02ec mov ax, word ptr [bp - 4]
02ef jmp 0x2f4
02f1 mov ax, 0x6f
02f4 mov word ptr [bp - 4], ax
02f7 cmp word ptr [bp - 6], 0x9b
02fc jge 0x303
02fe mov ax, word ptr [bp - 6]
0301 jmp 0x306
0303 mov ax, 0x9b
0306 mov word ptr [bp - 6], ax
0309 push ax
030a push word ptr [bp - 4]
030d lcall 0x3014, 0x48 -> ovl34:0cd6
0312 add sp, 4
0315 mov ax, 0x2c04
0318 mov es, ax
031a cmp word ptr es:[0x159], 0
0320 je 0x329
0322 cmp word ptr [0x3254], 0
0327 je 0x342
0329 mov ax, 0x2c04
032c mov es, ax
032e mov bx, word ptr es:[0x110]
0333 shl bx, 1
0335 mov ax, 0x2c04
0338 mov es, ax
033a cmp word ptr es:[bx + 0xd0], 0
0340 jne 0x389
0342 mov ax, 0x2c04
0345 mov es, ax
0347 push word ptr es:[0x110]
034c lcall 0x30f2, 0x52 -> ovl63:2200
0351 pop cx
0352 lcall 0x12bf, 0x7a5 -> 12bf:07a5
0357 push 0
035a push 0x10001
0360 lcall 0x30f2, 0x20 -> ovl63:0000
0365 add sp, 8
0368 lcall 0x12bf, 0x757 -> 12bf:0757
036d jmp 0x389
036f mov ax, 0x2c04
0372 mov es, ax
0374 mov bx, word ptr es:[0x110]
0379 imul bx, bx, 0x14
037c mov ax, 0x2c04
037f mov dx, word ptr [bp - 2]
0382 mov es, ax
0384 add word ptr es:[bx + 0x185], dx
0389 pop di
038a pop si
038b leave
038c retf

ovl26_038d:  ; ENTRY
038d push bp
038e mov bp, sp
0390 push si
0391 xor si, si
0393 mov ax, 0x2c04
0396 mov es, ax
0398 cmp word ptr es:[0x11e], 0
039e jne 0x3a3
03a0 jmp 0x4b7
03a3 mov es, ax
03a5 mov bx, word ptr es:[0x110]
03aa imul bx, bx, 0xc
03ad mov ax, 0x2c04
03b0 mov es, ax
03b2 cmp word ptr es:[bx + 0x1103], 0
03b8 jne 0x3bd
03ba jmp 0x4b7
03bd mov al, byte ptr [0x42c4]
03c0 cwde
03c1 mov cx, ax
03c3 jmp 0x3ff
03c5 mov ax, 0x2c04
03c8 mov es, ax
03ca mov bx, word ptr es:[0x110]
03cf imul bx, bx, 0xc
03d2 mov ax, 0x2c04
03d5 mov es, ax
03d7 mov ax, word ptr es:[bx + 0x1107]
03dc imul ax, ax, 0x16
03df mov dx, 0x1e1d
03e2 mov bx, 0
03e5 add bx, 0x8880
03e9 add ax, bx
03eb mov bx, cx
03ed shl bx, 2
03f0 cmp dx, word ptr [bx + 0x42c8]
03f4 jne 0x3ff
03f6 cmp ax, word ptr [bx + 0x42c6]
03fa jne 0x3ff
03fc mov si, 1
03ff mov ax, cx
0401 dec cx
0402 or ax, ax
0404 jne 0x3c5
0406 or si, si
0408 jne 0x40d
040a jmp 0x4b7
040d mov ax, 0x2c04
0410 mov es, ax
0412 mov bx, word ptr es:[0x110]
0417 imul bx, bx, 0xc
041a mov ax, 0x2c04
041d mov es, ax
041f cmp word ptr es:[bx + 0x1105], 4
0425 je 0x441
0427 mov ax, 0x2c04
042a mov es, ax
042c mov bx, word ptr es:[0x110]
0431 imul bx, bx, 0xc
0434 mov ax, 0x2c04
0437 mov es, ax
0439 cmp word ptr es:[bx + 0x1105], 5
043f jne 0x4b7
0441 push word ptr [bp + 8]
0444 push word ptr [bp + 6]
0447 lcall 0x30e8, 0x39 -> ovl62:044a
044c add sp, 4
044f mov dx, ax
0451 mov ax, 0x2c04
0454 mov es, ax
0456 mov bx, word ptr es:[0x110]
045b imul bx, bx, 0xc
045e mov ax, 0x2c04
0461 mov es, ax
0463 cmp word ptr es:[bx + 0x1109], dx
0468 jne 0x4b7
046a les bx, ptr [0x40ee]
046e inc word ptr es:[bx + 0x4a]
0472 mov word ptr es:[bx + 0x46], 0xffff
0478 mov ax, 0x2c04
047b mov es, ax
047d mov bx, word ptr es:[0x110]
0482 imul bx, bx, 0xc
0485 mov ax, 0x2c04
0488 mov es, ax
048a cmp word ptr es:[bx + 0x1105], 5
0490 jne 0x4a7
0492 push 1
0494 push dx
0495 lcall 0x2fb5, 0x2a -> ovl19:1864
049a add sp, 4
049d push 0
04a0 push 0
04a3 push 2
04a5 jmp 0x4af
04a7 push 0
04aa push 0
04ad push 4
04af lcall 0x2f5b, 0x3e -> ovl01:1ded
04b4 add sp, 0xa
04b7 pop si
04b8 pop bp
04b9 retf

ovl26_04ba:  ; ENTRY
04ba push bp
04bb mov bp, sp
04bd push si
04be les bx, ptr [0x40ee]
04c2 cmp word ptr es:[bx + 0x48], 0
04c7 jne 0x53c
04c9 mov ax, 0x2c04
04cc mov es, ax
04ce mov si, word ptr es:[0x157b]
04d3 jmp 0x535
04d5 mov bx, si
04d7 imul bx, bx, 0x41
04da mov ax, 0x2c04
04dd mov es, ax
04df mov al, byte ptr es:[bx + 0x1592]
04e4 cwde
04e5 mov dx, 0x2c04
04e8 mov es, dx
04ea cmp ax, word ptr es:[0x110]
04ef jne 0x535
04f1 xor cx, cx
04f3 xor dx, dx
04f5 jmp 0x511
04f7 les bx, ptr [0x40ee]
04fb add bx, si
04fd mov al, byte ptr es:[bx + 0x56]
0501 mov ah, 0
0503 mov bx, dx
0505 inc dx
0506 shl bx, 1
0508 cmp ax, word ptr [bx + 0x932]
050c jne 0x511
050e mov cx, 1
0511 mov bx, dx
0513 shl bx, 1
0515 cmp word ptr [bx + 0x932], -1
051a jne 0x4f7
051c or cx, cx
051e je 0x535
0520 les bx, ptr [0x40ee]
0524 add bx, si
0526 cmp byte ptr es:[bx + 0x182], 4
052c jb 0x535
052e push si
052f nop
0530 push cs
0531 call 0x53f
0534 pop cx
0535 mov ax, si
0537 dec si
0538 or ax, ax
053a jne 0x4d5
053c pop si
053d pop bp
053e retf

ovl26_053f:  ; ENTRY
053f push bp
0540 mov bp, sp
0542 sub sp, 0x32
0545 push si
0546 push di
0547 mov si, word ptr [bp + 6]
054a mov word ptr [bp - 6], 0xffff
054f mov word ptr [bp - 8], 0
0554 mov word ptr [bp - 0xa], 0x64
0559 mov word ptr [bp - 0xe], 0
055e mov bx, si
0560 imul bx, bx, 0x41
0563 mov ax, 0x2c04
0566 mov es, ax
0568 mov cx, word ptr es:[bx + 0x157d]
056d mov bx, si
056f imul bx, bx, 0x41
0572 mov ax, 0x2c04
0575 mov es, ax
0577 mov ax, word ptr es:[bx + 0x157f]
057c mov word ptr [bp - 0x10], ax
057f les bx, ptr [0x40ee]
0583 add bx, si
0585 cmp byte ptr es:[bx + 0x56], 7
058a je 0x58d
058c inc cx
058d les bx, ptr [0x40ee]
0591 add bx, si
0593 cmp byte ptr es:[bx + 0x56], 7
0598 jne 0x5ab
059a mov bx, word ptr [0x40ee]
059e add bx, si
05a0 cmp byte ptr es:[bx + 0x182], 0xc
05a6 jae 0x5ab
05a8 jmp 0x80c
05ab mov ax, 0x2c04
05ae mov es, ax
05b0 mov bx, word ptr es:[0x110]
05b5 imul bx, bx, 0x14
05b8 mov ax, 0x2c04
05bb mov es, ax
05bd cmp word ptr es:[bx + 0x185], 0x28
05c3 jge 0x5ec
05c5 mov ax, 0x2c04
05c8 mov es, ax
05ca mov bx, word ptr es:[0x110]
05cf shl bx, 1
05d1 mov ax, word ptr [bx + 0x5dca]
05d5 mov dx, 0x2c04
05d8 mov es, dx
05da mov bx, word ptr es:[0x110]
05df shl bx, 1
05e1 cmp ax, word ptr [bx + 0x5dda]
05e5 jge 0x5ec
05e7 mov ax, 0x41
05ea jmp 0x5ef
05ec mov ax, 0x55
05ef mov word ptr [bp - 0xc], ax
05f2 push 8
05f4 push ss
05f5 lea ax, [bp - 0x32]
05f8 push ax
05f9 push word ptr [bp - 0x10]
05fc push cx
05fd lcall 0x2ff7, 0x52 -> ovl29:12c9
0602 add sp, 0xa
0605 mov word ptr [bp - 4], ax
0608 or ax, ax
060a jne 0x60f
060c jmp 0x80c
060f cmp word ptr [bp - 4], 4
0613 jge 0x635
0615 les bx, ptr [0x40ee]
0619 add bx, si
061b cmp byte ptr es:[bx + 0x56], 6
0620 jne 0x625
0622 jmp 0x80c
0625 mov bx, word ptr [0x40ee]
0629 add bx, si
062b cmp byte ptr es:[bx + 0x56], 7
0630 jne 0x635
0632 jmp 0x80c
0635 push ss
0636 lea ax, [bp - 0x1c]
0639 push ax
063a push ss
063b lea ax, [bp - 0x16]
063e push ax
063f push 0
0641 push si
0642 lcall 0x2fdb, 0x5c -> ovl25:0656
0647 add sp, 0xc
064a mov di, 6
064d jmp 0x7cc
0650 mov byte ptr [bp + di - 0x22], 0
0654 mov al, byte ptr [bp + di - 0x16]
0657 mov ah, 0
0659 mov word ptr [bp - 2], ax
065c cmp ax, 0xff
065f jne 0x664
0661 jmp 0x7cc
0664 les bx, ptr [0x40ee]
0668 add bx, word ptr [bp - 2]
066b test byte ptr es:[bx + 0x11e], 1
0671 je 0x676
0673 jmp 0x7cc
0676 mov bx, word ptr [bp - 2]
0679 imul bx, bx, 0x41
067c mov ax, 0x2c04
067f mov es, ax
0681 mov al, byte ptr es:[bx + 0x1592]
0686 cwde
0687 mov dx, 0x2c04
068a mov es, dx
068c cmp ax, word ptr es:[0x110]
0691 jne 0x696
0693 jmp 0x7cc
0696 mov bx, word ptr [bp - 2]
0699 imul bx, bx, 0x41
069c mov ax, 0x2c04
069f mov es, ax
06a1 mov bx, word ptr es:[bx + 0x157f]
06a6 imul bx, bx, 0xe0
06aa mov si, word ptr [bp - 2]
06ad imul si, si, 0x41
06b0 mov ax, 0x2c04
06b3 mov es, ax
06b5 mov ax, word ptr es:[si + 0x157d]
06ba shl ax, 1
06bc add bx, ax
06be mov ax, 0x1e1d
06c1 mov es, ax
06c3 mov bl, byte ptr es:[bx]
06c8 and bx, 0xff
06cc mov ax, 0x2c04
06cf mov es, ax
06d1 cmp byte ptr es:[bx + 0x710], 0xa
06d7 je 0x6dc
06d9 jmp 0x7cc
06dc les bx, ptr [0x40ee]
06e0 mov ax, word ptr es:[bx + 0x46]
06e4 cmp ax, word ptr [bp - 2]
06e7 jne 0x6ec
06e9 jmp 0x7cc
06ec mov bx, word ptr [bp - 2]
06ef imul bx, bx, 0x41
06f2 mov ax, 0x2c04
06f5 mov es, ax
06f7 cmp byte ptr es:[bx + 0x1592], 0xf
06fd je 0x731
06ff mov bx, word ptr [bp - 2]
0702 imul bx, bx, 0x41
0705 mov es, ax
0707 mov al, byte ptr es:[bx + 0x1592]
070c cwde
070d mov dx, 0x2c04
0710 mov es, dx
0712 mov bx, word ptr es:[0x110]
0717 shl bx, 3
071a add bx, ax
071c mov ax, 0x2c04
071f mov es, ax
0721 mov al, byte ptr es:[bx + 0x153b]
0726 and ax, 3
0729 cmp ax, 2
072c je 0x731
072e jmp 0x7cc
0731 mov bx, word ptr [bp - 2]
0734 imul bx, bx, 0x41
0737 mov ax, 0x2c04
073a mov es, ax
073c push word ptr es:[bx + 0x157f]
0741 mov bx, word ptr [bp - 2]
0744 imul bx, bx, 0x41
0747 mov ax, 0x2c04
074a mov es, ax
074c push word ptr es:[bx + 0x157d]
0751 lcall 0x2ff7, 0x61 -> ovl29:15c5
0756 add sp, 4
0759 mov byte ptr [bp + di - 0x22], al
075c mov ah, 0
075e mov cx, ax
0760 or cx, cx
0762 jne 0x787
0764 cmp word ptr [bp - 4], 4
0768 jge 0x770
076a cmp byte ptr [bp + di - 0x1c], 0x19
076e jb 0x77c
0770 cmp word ptr [bp - 4], 6
0774 jge 0x7cc
0776 cmp byte ptr [bp + di - 0x1c], 0xf
077a jae 0x7cc
077c mov word ptr [bp - 0xe], 1
0781 mov byte ptr [bp + di - 0x22], 0xff
0785 jmp 0x7cc
0787 cmp cx, word ptr [bp - 0xc]
078a jl 0x7cc
078c mov al, byte ptr [bp + di - 0x1c]
078f mov ah, 0
0791 push ax
0792 mov ax, word ptr [0x5e00]
0795 add ax, 0xfffe
0798 cmp ax, 1
079b jge 0x7a2
079d mov ax, 1
07a0 jmp 0x7a8
07a2 mov ax, word ptr [0x5e00]
07a5 add ax, 0xfffe
07a8 mov bx, ax
07aa pop ax
07ab cdq
07ac idiv bx
07ae inc ax
07af mov dx, ax
07b1 cmp dx, word ptr [bp - 0xa]
07b4 jl 0x7c0
07b6 cmp dx, word ptr [bp - 0xa]
07b9 jne 0x7cc
07bb cmp cx, word ptr [bp - 8]
07be jle 0x7cc
07c0 mov ax, word ptr [bp - 2]
07c3 mov word ptr [bp - 6], ax
07c6 mov word ptr [bp - 8], cx
07c9 mov word ptr [bp - 0xa], dx
07cc mov ax, di
07ce dec di
07cf or ax, ax
07d1 je 0x7d6
07d3 jmp 0x650
07d6 cmp word ptr [bp - 0xe], 0
07da jne 0x80c
07dc cmp word ptr [bp - 6], -1
07e0 je 0x80c
07e2 push 0
07e4 push word ptr [bp - 6]
07e7 push 1
07e9 push ss
07ea lea ax, [bp - 0x32]
07ed push ax
07ee lcall 0x2ff7, 0x2a -> ovl29:0ae7
07f3 add sp, 0xa
07f6 push 0
07f8 les bx, ptr [0x5e62]
07fc push word ptr es:[bx + 0x14]
0800 push word ptr es:[bx + 0x12]
0804 lcall 0xa8b, 1 -> 0a8b:0001
0809 add sp, 6
080c pop di
080d pop si
080e leave
080f retf
