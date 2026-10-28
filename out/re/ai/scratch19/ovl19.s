; ovl19 stub 2fb5 file_off 0x49200 size 0x1aac

ovl19_0000:  ; ENTRY
0000 push bp
0001 mov bp, sp
0003 push si
0004 les bx, ptr [0x40ee]
0008 cmp word ptr es:[bx], 0
000c jne 0x11
000e jmp 0xc7
0011 lcall 0x2fc5, 0x20 -> ovl21:01b3
0016 mov ax, 0x2c04
0019 mov es, ax
001b mov cx, word ptr es:[0x157b]
0020 jmp 0x56
0022 mov bx, cx
0024 imul bx, bx, 0x41
0027 mov ax, 0x2c04
002a mov es, ax
002c mov al, byte ptr es:[bx + 0x1592]
0031 cwde
0032 mov dx, 0x2c04
0035 mov es, dx
0037 cmp ax, word ptr es:[0x110]
003c jne 0x56
003e les bx, ptr [0x40ee]
0042 add bx, cx
0044 cmp byte ptr es:[bx + 0x56], 7
0049 jne 0x56
004b mov bx, word ptr [0x40ee]
004f add bx, cx
0051 mov byte ptr es:[bx + 0x56], 8
0056 mov ax, cx
0058 dec cx
0059 or ax, ax
005b jne 0x22
005d les bx, ptr [0x40ee]
0061 cmp word ptr es:[bx + 0x24a], 0
0067 je 0xc7
0069 xor si, si
006b jmp 0xbc
006d mov ax, si
006f imul ax, ax, 0x5c
0072 les bx, ptr [0x40ee]
0076 add bx, ax
0078 cmp word ptr es:[bx + 0x24c], 0
007e je 0xbb
0080 mov ax, si
0082 imul ax, ax, 0x5c
0085 mov bx, word ptr [0x40ee]
0089 add bx, ax
008b push es
008c mov ax, word ptr [0x40ee]
008f mov dx, es
0091 pop es
0092 add ax, word ptr es:[bx + 0x250]
0097 mov bx, ax
0099 mov es, dx
009b mov byte ptr es:[bx + 0x56], 7
00a0 push si
00a1 nop
00a2 push cs
00a3 call 0xca
00a6 pop cx
00a7 or ax, ax
00a9 je 0xbb
00ab mov ax, si
00ad imul ax, ax, 0x5c
00b0 les bx, ptr [0x40ee]
00b4 add bx, ax
00b6 inc word ptr es:[bx + 0x24c]
00bb inc si
00bc les bx, ptr [0x40ee]
00c0 cmp word ptr es:[bx + 0x24a], si
00c5 jg 0x6d
00c7 pop si
00c8 pop bp
00c9 retf

ovl19_00ca:  ; ENTRY
00ca push bp
00cb mov bp, sp
00cd sub sp, 2
00d0 push si
00d1 push di
00d2 mov si, word ptr [bp + 6]
00d5 mov ax, 0x2c04
00d8 mov es, ax
00da mov bx, word ptr es:[0x110]
00df imul bx, bx, 0x14
00e2 mov ax, 0x2c04
00e5 mov es, ax
00e7 push word ptr es:[bx + 0x195]
00ec mov ax, 0x2c04
00ef mov es, ax
00f1 mov bx, word ptr es:[0x110]
00f6 imul bx, bx, 0x14
00f9 mov ax, 0x2c04
00fc mov es, ax
00fe push word ptr es:[bx + 0x193]
0103 lcall 0x30e8, 0x39 -> ovl62:044a
0108 add sp, 4
010b mov di, ax
010d mov bx, di
010f imul bx, bx, 0x41
0112 mov ax, 0x2c04
0115 mov es, ax
0117 cmp byte ptr es:[bx + 0x1592], 0xf
011d jne 0x122
011f jmp 0x1af
0122 mov bx, di
0124 imul bx, bx, 0x41
0127 mov es, ax
0129 mov al, byte ptr es:[bx + 0x1592]
012e cwde
012f mov dx, 0x2c04
0132 mov es, dx
0134 cmp ax, word ptr es:[0x110]
0139 je 0x1af
013b mov word ptr [bp - 2], 0
0140 les bx, ptr [0x40ee]
0144 mov cx, word ptr es:[bx + 0x24a]
0149 jmp 0x198
014b mov ax, cx
014d imul ax, ax, 0x5c
0150 les bx, ptr [0x40ee]
0154 add bx, ax
0156 cmp word ptr es:[bx + 0x24c], 0
015c je 0x198
015e mov bx, di
0160 imul bx, bx, 0x41
0163 mov ax, 0x2c04
0166 mov es, ax
0168 mov al, byte ptr es:[bx + 0x1592]
016d cwde
016e mov dx, cx
0170 imul dx, dx, 0x5c
0173 les bx, ptr [0x40ee]
0177 add bx, dx
0179 cmp ax, word ptr es:[bx + 0x24e]
017e je 0x193
0180 mov ax, cx
0182 imul ax, ax, 0x5c
0185 les bx, ptr [0x40ee]
0189 add bx, ax
018b cmp word ptr es:[bx + 0x24c], 0
0191 jne 0x198
0193 mov word ptr [bp - 2], 1
0198 mov ax, cx
019a dec cx
019b or ax, ax
019d jne 0x14b
019f cmp word ptr [bp - 2], 0
01a3 jne 0x1af
01a5 nop
01a6 push cs
01a7 call 0x607
01aa xor ax, ax
01ac jmp 0x2e9
01af push si
01b0 nop
01b1 push cs
01b2 call 0x41c
01b5 pop cx
01b6 or ax, ax
01b8 jne 0x1c7
01ba push 0
01bc push si
01bd nop
01be push cs
01bf call 0x66d
01c2 add sp, 4
01c5 jmp 0x1aa
01c7 push si
01c8 nop
01c9 push cs
01ca call 0x1579
01cd pop cx
01ce xor di, di
01d0 les bx, ptr [0x40ee]
01d4 mov cx, word ptr es:[bx + 0x24a]
01d9 jmp 0x217
01db mov ax, cx
01dd imul ax, ax, 0x5c
01e0 les bx, ptr [0x40ee]
01e4 add bx, ax
01e6 cmp word ptr es:[bx + 0x24c], 0
01ec je 0x217
01ee cmp cx, si
01f0 je 0x217
01f2 mov ax, cx
01f4 imul ax, ax, 0x5c
01f7 mov bx, word ptr [0x40ee]
01fb add bx, ax
01fd mov ax, word ptr es:[bx + 0x250]
0202 mov dx, si
0204 imul dx, dx, 0x5c
0207 mov bx, word ptr [0x40ee]
020b add bx, dx
020d cmp ax, word ptr es:[bx + 0x250]
0212 jne 0x217
0214 mov di, 1
0217 mov ax, cx
0219 dec cx
021a or ax, ax
021c jne 0x1db
021e or di, di
0220 jne 0x24c
0222 mov ax, si
0224 imul ax, ax, 0x5c
0227 les bx, ptr [0x40ee]
022b add bx, ax
022d mov bx, word ptr es:[bx + 0x250]
0232 imul bx, bx, 0x41
0235 mov ax, 0x2c04
0238 mov es, ax
023a mov al, byte ptr es:[bx + 0x1592]
023f cwde
0240 mov dx, 0x2c04
0243 mov es, dx
0245 cmp ax, word ptr es:[0x110]
024a je 0x25a
024c push si
024d nop
024e push cs
024f call 0x2ed
0252 pop cx
0253 or ax, ax
0255 jne 0x25a
0257 jmp 0x1aa
025a push si
025b nop
025c push cs
025d call 0x996
0260 pop cx
0261 mov ax, si
0263 imul ax, ax, 0x5c
0266 les bx, ptr [0x40ee]
026a add bx, ax
026c cmp word ptr es:[bx + 0x24c], 0
0272 jne 0x277
0274 jmp 0x1aa
0277 push 1
0279 mov ax, si
027b imul ax, ax, 0x5c
027e les bx, ptr [0x40ee]
0282 add bx, ax
0284 push word ptr es:[bx + 0x250]
0289 lcall 0x2fd6, 0x25 -> ovl24:023f
028e add sp, 4
0291 push si
0292 nop
0293 push cs
0294 call 0x6e9
0297 pop cx
0298 or ax, ax
029a je 0x2c9
029c mov ax, si
029e imul ax, ax, 0x5c
02a1 les bx, ptr [0x40ee]
02a5 add bx, ax
02a7 cmp word ptr es:[bx + 0x250], 0
02ad jl 0x2c9
02af push 1
02b1 mov ax, si
02b3 imul ax, ax, 0x5c
02b6 mov bx, word ptr [0x40ee]
02ba add bx, ax
02bc push word ptr es:[bx + 0x250]
02c1 lcall 0x2fd6, 0x25 -> ovl24:023f
02c6 add sp, 4
02c9 mov ax, si
02cb imul ax, ax, 0x5c
02ce les bx, ptr [0x40ee]
02d2 add bx, ax
02d4 cmp word ptr es:[bx + 0x24c], 0
02da jne 0x2df
02dc jmp 0x1aa
02df push si
02e0 nop
02e1 push cs
02e2 call 0x16fd
02e5 pop cx
02e6 mov ax, 1
02e9 pop di
02ea pop si
02eb leave
02ec retf

ovl19_02ed:  ; ENTRY
02ed push bp
02ee mov bp, sp
02f0 sub sp, 0x16
02f3 push si
02f4 push di
02f5 mov si, word ptr [bp + 6]
02f8 mov word ptr [bp - 4], 0xffff
02fd mov word ptr [bp - 6], 0x3e8
0302 mov ax, si
0304 imul ax, ax, 0x5c
0307 les bx, ptr [0x40ee]
030b add bx, ax
030d mov bx, word ptr es:[bx + 0x250]
0312 imul bx, bx, 0x41
0315 mov ax, 0x2c04
0318 mov es, ax
031a mov ax, word ptr es:[bx + 0x157d]
031f mov word ptr [bp - 8], ax
0322 mov ax, si
0324 imul ax, ax, 0x5c
0327 les bx, ptr [0x40ee]
032b add bx, ax
032d mov bx, word ptr es:[bx + 0x250]
0332 imul bx, bx, 0x41
0335 mov ax, 0x2c04
0338 mov es, ax
033a mov ax, word ptr es:[bx + 0x157f]
033f mov word ptr [bp - 0xa], ax
0342 push ss
0343 lea ax, [bp - 0x16]
0346 push ax
0347 push ss
0348 lea ax, [bp - 0x10]
034b push ax
034c push 0
034e mov ax, si
0350 imul ax, ax, 0x5c
0353 les bx, ptr [0x40ee]
0357 add bx, ax
0359 push word ptr es:[bx + 0x250]
035e lcall 0x2fdb, 0x5c -> ovl25:0656
0363 add sp, 0xc
0366 mov word ptr [bp - 2], 6
036b jmp 0x3e1
036d lea ax, [bp - 0x10]
0370 mov bx, word ptr [bp - 2]
0373 add bx, ax
0375 mov al, byte ptr ss:[bx]
0378 mov ah, 0
037a mov di, ax
037c cmp ax, 0xff
037f je 0x3e1
0381 mov bx, di
0383 imul bx, bx, 0x41
0386 mov ax, 0x2c04
0389 mov es, ax
038b mov al, byte ptr es:[bx + 0x1592]
0390 cwde
0391 mov dx, 0x2c04
0394 mov es, dx
0396 cmp ax, word ptr es:[0x110]
039b jne 0x3e1
039d push di
039e lcall 0x2fe8, 0x25 -> ovl27:07f8
03a3 pop cx
03a4 or ax, ax
03a6 jne 0x3e1
03a8 push word ptr [bp - 0xa]
03ab push word ptr [bp - 8]
03ae mov bx, di
03b0 imul bx, bx, 0x41
03b3 mov ax, 0x2c04
03b6 mov es, ax
03b8 push word ptr es:[bx + 0x157f]
03bd mov bx, di
03bf imul bx, bx, 0x41
03c2 mov ax, 0x2c04
03c5 mov es, ax
03c7 push word ptr es:[bx + 0x157d]
03cc lcall 0xa8b, 0xacc -> 0a8b:0acc
03d1 add sp, 8
03d4 mov dx, ax
03d6 cmp dx, word ptr [bp - 6]
03d9 jge 0x3e1
03db mov word ptr [bp - 6], dx
03de mov word ptr [bp - 4], di
03e1 mov ax, word ptr [bp - 2]
03e4 dec word ptr [bp - 2]
03e7 or ax, ax
03e9 jne 0x36d
03eb cmp word ptr [bp - 4], -1
03ef je 0x406
03f1 mov ax, si
03f3 imul ax, ax, 0x5c
03f6 les bx, ptr [0x40ee]
03fa add bx, ax
03fc mov ax, word ptr [bp - 4]
03ff mov word ptr es:[bx + 0x250], ax
0404 jmp 0x415
0406 push 1
0408 push si
0409 nop
040a push cs
040b call 0x66d
040e add sp, 4
0411 xor ax, ax
0413 jmp 0x418
0415 mov ax, 1
0418 pop di
0419 pop si
041a leave
041b retf

ovl19_041c:  ; ENTRY
041c push bp
041d mov bp, sp
041f sub sp, 0x16
0422 push si
0423 push di
0424 mov si, word ptr [bp + 6]
0427 mov word ptr [bp - 2], 0
042c mov ax, si
042e imul ax, ax, 0x5c
0431 les bx, ptr [0x40ee]
0435 add bx, ax
0437 mov ax, word ptr es:[bx + 0x24e]
043c mov word ptr [bp - 4], ax
043f mov ax, si
0441 imul ax, ax, 0x5c
0444 mov bx, word ptr [0x40ee]
0448 add bx, ax
044a mov ax, word ptr es:[bx + 0x250]
044f mov word ptr [bp - 6], ax
0452 xor dx, dx
0454 jmp 0x4ae
0456 mov ax, si
0458 imul ax, ax, 0x5c
045b les bx, ptr [0x40ee]
045f add bx, ax
0461 mov ax, dx
0463 shl ax, 1
0465 add bx, ax
0467 mov cx, word ptr es:[bx + 0x25a]
046c cmp cx, -1
046f je 0x4ad
0471 les bx, ptr [0x40ee]
0475 cmp word ptr es:[bx + 0x46], cx
0479 je 0x495
047b mov bx, cx
047d imul bx, bx, 0x41
0480 mov ax, 0x2c04
0483 mov es, ax
0485 mov al, byte ptr es:[bx + 0x1592]
048a cwde
048b cmp ax, word ptr [bp - 4]
048e jne 0x495
0490 inc word ptr [bp - 2]
0493 jmp 0x4ad
0495 mov ax, si
0497 imul ax, ax, 0x5c
049a les bx, ptr [0x40ee]
049e add bx, ax
04a0 mov ax, dx
04a2 shl ax, 1
04a4 add bx, ax
04a6 mov word ptr es:[bx + 0x25a], 0xffff
04ad inc dx
04ae cmp dx, 6
04b1 jl 0x456
04b3 push ss
04b4 lea ax, [bp - 0x14]
04b7 push ax
04b8 push ss
04b9 lea ax, [bp - 0xe]
04bc push ax
04bd push 0
04bf push word ptr [bp - 6]
04c2 lcall 0x2fdb, 0x5c -> ovl25:0656
04c7 add sp, 0xc
04ca mov di, 6
04cd jmp 0x5f6
04d0 mov al, byte ptr [bp + di - 0xe]
04d3 mov ah, 0
04d5 mov word ptr [bp - 8], ax
04d8 cmp ax, 0xff
04db jne 0x4e0
04dd jmp 0x5f6
04e0 mov bx, word ptr [bp - 8]
04e3 imul bx, bx, 0x41
04e6 mov ax, 0x2c04
04e9 mov es, ax
04eb mov al, byte ptr es:[bx + 0x1592]
04f0 cwde
04f1 cmp ax, word ptr [bp - 4]
04f4 je 0x4f9
04f6 jmp 0x5f6
04f9 les bx, ptr [0x40ee]
04fd add bx, word ptr [bp - 8]
0500 test byte ptr es:[bx + 0x11e], 1
0506 je 0x50b
0508 jmp 0x5f6
050b mov cx, 1
050e mov dx, 6
0511 jmp 0x530
0513 mov ax, si
0515 imul ax, ax, 0x5c
0518 les bx, ptr [0x40ee]
051c add bx, ax
051e mov ax, dx
0520 shl ax, 1
0522 add bx, ax
0524 mov ax, word ptr es:[bx + 0x25a]
0529 cmp ax, word ptr [bp - 8]
052c jne 0x530
052e xor cx, cx
0530 mov ax, dx
0532 dec dx
0533 or ax, ax
0535 jne 0x513
0537 or cx, cx
0539 jne 0x53e
053b jmp 0x5f6
053e inc word ptr [bp - 2]
0541 mov cx, 0xffff
0544 mov word ptr [bp - 0x16], 0
0549 mov dx, 6
054c jmp 0x5a6
054e mov ax, si
0550 imul ax, ax, 0x5c
0553 les bx, ptr [0x40ee]
0557 add bx, ax
0559 mov ax, dx
055b shl ax, 1
055d add bx, ax
055f cmp word ptr es:[bx + 0x25a], -1
0565 jne 0x570
0567 mov cx, dx
0569 mov word ptr [bp - 0x16], 0xffff
056e jmp 0x5ad
0570 mov ax, si
0572 imul ax, ax, 0x5c
0575 les bx, ptr [0x40ee]
0579 add bx, ax
057b mov ax, dx
057d shl ax, 1
057f add bx, ax
0581 mov ax, word ptr es:[bx + 0x272]
0586 cmp ax, word ptr [bp - 0x16]
0589 jle 0x5a6
058b mov cx, dx
058d mov ax, si
058f imul ax, ax, 0x5c
0592 mov bx, word ptr [0x40ee]
0596 add bx, ax
0598 mov ax, dx
059a shl ax, 1
059c add bx, ax
059e mov ax, word ptr es:[bx + 0x272]
05a3 mov word ptr [bp - 0x16], ax
05a6 mov ax, dx
05a8 dec dx
05a9 or ax, ax
05ab jne 0x54e
05ad cmp cx, -1
05b0 je 0x5f6
05b2 cmp word ptr [bp - 0x16], -1
05b6 je 0x5c2
05b8 mov al, byte ptr [bp + di - 0x14]
05bb mov ah, 0
05bd cmp ax, word ptr [bp - 0x16]
05c0 jge 0x5f6
05c2 mov ax, si
05c4 imul ax, ax, 0x5c
05c7 les bx, ptr [0x40ee]
05cb add bx, ax
05cd mov ax, cx
05cf shl ax, 1
05d1 add bx, ax
05d3 mov ax, word ptr [bp - 8]
05d6 mov word ptr es:[bx + 0x25a], ax
05db mov al, byte ptr [bp + di - 0x14]
05de mov ah, 0
05e0 mov dx, si
05e2 imul dx, dx, 0x5c
05e5 mov bx, word ptr [0x40ee]
05e9 add bx, dx
05eb mov dx, cx
05ed shl dx, 1
05ef add bx, dx
05f1 mov word ptr es:[bx + 0x272], ax
05f6 mov ax, di
05f8 dec di
05f9 or ax, ax
05fb je 0x600
05fd jmp 0x4d0
0600 mov ax, word ptr [bp - 2]
0603 pop di
0604 pop si
0605 leave
0606 retf

ovl19_0607:  ; ENTRY
0607 push bp
0608 mov bp, sp
060a push si
060b mov cx, 0xffff
060e mov si, 0xffff
0611 les bx, ptr [0x40ee]
0615 mov dx, word ptr es:[bx + 0x24a]
061a jmp 0x653
061c mov ax, dx
061e imul ax, ax, 0x5c
0621 les bx, ptr [0x40ee]
0625 add bx, ax
0627 cmp word ptr es:[bx + 0x24c], 0
062d je 0x653
062f mov ax, dx
0631 imul ax, ax, 0x5c
0634 mov bx, word ptr [0x40ee]
0638 add bx, ax
063a cmp word ptr es:[bx + 0x24c], si
063f jle 0x653
0641 mov ax, dx
0643 imul ax, ax, 0x5c
0646 mov bx, word ptr [0x40ee]
064a add bx, ax
064c mov si, word ptr es:[bx + 0x24c]
0651 mov cx, dx
0653 mov ax, dx
0655 dec dx
0656 or ax, ax
0658 jne 0x61c
065a cmp cx, -1
065d je 0x66a
065f push 2
0661 push cx
0662 nop
0663 push cs
0664 call 0x66d
0667 add sp, 4
066a pop si
066b pop bp
066c retf

ovl19_066d:  ; ENTRY
066d push bp
066e mov bp, sp
0670 push si
0671 mov cx, word ptr [bp + 6]
0674 mov ax, cx
0676 imul ax, ax, 0x5c
0679 les bx, ptr [0x40ee]
067d add bx, ax
067f push es
0680 mov ax, word ptr [0x40ee]
0683 mov dx, es
0685 pop es
0686 add ax, word ptr es:[bx + 0x250]
068b mov bx, ax
068d mov es, dx
068f mov byte ptr es:[bx + 0x56], 8
0694 mov si, 4
0697 jmp 0x6d8
0699 mov ax, cx
069b imul ax, ax, 0x5c
069e les bx, ptr [0x40ee]
06a2 add bx, ax
06a4 mov ax, si
06a6 shl ax, 1
06a8 add bx, ax
06aa cmp word ptr es:[bx + 0x252], -1
06b0 je 0x6d8
06b2 mov ax, cx
06b4 imul ax, ax, 0x5c
06b7 mov bx, word ptr [0x40ee]
06bb add bx, ax
06bd mov ax, si
06bf shl ax, 1
06c1 add bx, ax
06c3 push es
06c4 mov ax, word ptr [0x40ee]
06c7 mov dx, es
06c9 pop es
06ca add ax, word ptr es:[bx + 0x252]
06cf mov bx, ax
06d1 mov es, dx
06d3 mov byte ptr es:[bx + 0x56], 8
06d8 mov ax, si
06da dec si
06db or ax, ax
06dd jne 0x699
06df push cx
06e0 lcall 0x2fe8, 0x34 -> ovl27:08ba
06e5 pop cx
06e6 pop si
06e7 pop bp
06e8 retf

ovl19_06e9:  ; ENTRY
06e9 push bp
06ea mov bp, sp
06ec sub sp, 0x1c
06ef push si
06f0 push di
06f1 mov di, word ptr [bp + 6]
06f4 mov ax, di
06f6 imul ax, ax, 0x5c
06f9 les bx, ptr [0x40ee]
06fd add bx, ax
06ff mov dx, word ptr es:[bx + 0x250]
0704 mov word ptr [bp - 4], 0xffff
0709 mov word ptr [bp - 6], 0xffff
070e push 0
0710 push ss
0711 lea ax, [bp - 0x1c]
0714 push ax
0715 mov bx, dx
0717 imul bx, bx, 0x41
071a mov ax, 0x2c04
071d mov es, ax
071f push word ptr es:[bx + 0x157f]
0724 mov bx, dx
0726 imul bx, bx, 0x41
0729 mov ax, 0x2c04
072c mov es, ax
072e mov ax, word ptr es:[bx + 0x157d]
0733 inc ax
0734 push ax
0735 lcall 0x2ff7, 0x52 -> ovl29:12c9
073a add sp, 0xa
073d mov word ptr [bp - 8], ax
0740 or ax, ax
0742 jne 0x749
0744 xor ax, ax
0746 jmp 0x8ae
0749 xor si, si
074b jmp 0x838
074e mov ax, di
0750 imul ax, ax, 0x5c
0753 les bx, ptr [0x40ee]
0757 add bx, ax
0759 mov ax, si
075b shl ax, 1
075d add bx, ax
075f mov ax, word ptr es:[bx + 0x25a]
0764 mov word ptr [bp - 0xc], ax
0767 cmp word ptr [bp - 0xc], -1
076b jne 0x770
076d jmp 0x837
0770 mov ax, di
0772 imul ax, ax, 0x5c
0775 les bx, ptr [0x40ee]
0779 add bx, ax
077b mov ax, si
077d shl ax, 1
077f add bx, ax
0781 mov ax, word ptr es:[bx + 0x272]
0786 push ax
0787 mov ax, word ptr [0x5e00]
078a add ax, 0xfffe
078d cmp ax, 1
0790 jge 0x797
0792 mov ax, 1
0795 jmp 0x79d
0797 mov ax, word ptr [0x5e00]
079a add ax, 0xfffe
079d mov bx, ax
079f pop ax
07a0 cdq
07a1 idiv bx
07a3 inc ax
07a4 mov word ptr [bp - 2], ax
07a7 mov bx, word ptr [bp - 0xc]
07aa imul bx, bx, 0x41
07ad mov ax, 0x2c04
07b0 mov es, ax
07b2 push word ptr es:[bx + 0x157f]
07b7 mov bx, word ptr [bp - 0xc]
07ba imul bx, bx, 0x41
07bd mov ax, 0x2c04
07c0 mov es, ax
07c2 push word ptr es:[bx + 0x157d]
07c7 lcall 0x2ff7, 0x61 -> ovl29:15c5
07cc add sp, 4
07cf mov word ptr [bp - 0xa], ax
07d2 push 4
07d5 push 1
07d7 lcall 0x30c1, 0x3e -> ovl59:02bf
07dc add sp, 6
07df mov dx, di
07e1 imul dx, dx, 0x5c
07e4 les bx, ptr [0x40ee]
07e8 add bx, dx
07ea mov dx, si
07ec shl dx, 1
07ee add bx, dx
07f0 push ax
07f1 push es
07f2 push bx
07f3 mov ax, 0xa
07f6 sub ax, word ptr [bp - 2]
07f9 jge 0x7ff
07fb xor ax, ax
07fd jmp 0x805
07ff mov ax, 0xa
0802 sub ax, word ptr [bp - 2]
0805 add ax, word ptr [bp - 0xa]
0808 pop bx
0809 pop es
080a add ax, word ptr es:[bx + 0x27e]
080f pop dx
0810 add ax, dx
0812 mov dx, ax
0814 cmp word ptr [bp - 2], 1
0818 jne 0x81d
081a add dx, 0x64
081d cmp word ptr [bp - 0xa], 0x4b
0821 jg 0x829
0823 cmp word ptr [bp - 8], 8
0827 jl 0x837
0829 cmp dx, word ptr [bp - 6]
082c jle 0x837
082e mov word ptr [bp - 6], dx
0831 mov ax, word ptr [bp - 0xc]
0834 mov word ptr [bp - 4], ax
0837 inc si
0838 cmp si, 6
083b jge 0x840
083d jmp 0x74e
0840 cmp word ptr [bp - 4], -1
0844 jne 0x849
0846 jmp 0x744
0849 push ss
084a lea ax, [bp - 0x1c]
084d push ax
084e push di
084f nop
0850 push cs
0851 call 0x8b2
0854 add sp, 6
0857 mov si, 8
085a jmp 0x893
085c mov bx, si
085e shl bx, 1
0860 lea ax, [bp - 0x1c]
0863 add bx, ax
0865 cmp word ptr ss:[bx], -1
0869 je 0x893
086b mov ax, di
086d inc ax
086e and ax, 7
0871 mov bx, si
0873 shl bx, 1
0875 lea dx, [bp - 0x1c]
0878 add bx, dx
087a mov bx, word ptr ss:[bx]
087d imul bx, bx, 0x16
0880 mov dx, 0x1e1d
0883 mov es, dx
0885 and byte ptr es:[bx - 0x7772], 0x8f
088b shl al, 4
088e or byte ptr es:[bx - 0x7772], al
0893 mov ax, si
0895 dec si
0896 or ax, ax
0898 jne 0x85c
089a push word ptr [bp - 4]
089d push ss
089e lea ax, [bp - 0x1c]
08a1 push ax
08a2 push di
08a3 nop
08a4 push cs
08a5 call 0xf1b
08a8 add sp, 8
08ab mov ax, 1
08ae pop di
08af pop si
08b0 leave
08b1 retf

ovl19_08b2:  ; ENTRY
08b2 push bp
08b3 mov bp, sp
08b5 sub sp, 2
08b8 push si
08b9 push di
08ba mov di, word ptr [bp + 6]
08bd mov cx, 4
08c0 jmp 0x988
08c3 mov ax, di
08c5 imul ax, ax, 0x5c
08c8 les bx, ptr [0x40ee]
08cc add bx, ax
08ce mov ax, cx
08d0 shl ax, 1
08d2 add bx, ax
08d4 cmp word ptr es:[bx + 0x28a], -1
08da je 0x8df
08dc jmp 0x988
08df mov si, 0xffff
08e2 mov word ptr [bp - 2], 0xffff
08e7 mov dx, 8
08ea jmp 0x964
08ec mov ax, dx
08ee shl ax, 1
08f0 les bx, ptr [bp + 8]
08f3 add bx, ax
08f5 cmp word ptr es:[bx], -1
08f9 je 0x964
08fb mov ax, dx
08fd shl ax, 1
08ff les bx, ptr [bp + 8]
0902 add bx, ax
0904 mov bx, word ptr es:[bx]
0907 imul bx, bx, 0x16
090a mov ax, 0x1e1d
090d mov es, ax
090f cmp byte ptr es:[bx - 0x777c], 0x1c
0915 jne 0x925
0917 mov ax, dx
0919 shl ax, 1
091b les bx, ptr [bp + 8]
091e add bx, ax
0920 mov si, word ptr es:[bx]
0923 jmp 0x96b
0925 mov ax, dx
0927 shl ax, 1
0929 les bx, ptr [bp + 8]
092c add bx, ax
092e mov bx, word ptr es:[bx]
0931 imul bx, bx, 0x16
0934 mov ax, 0x1e1d
0937 mov es, ax
0939 mov al, byte ptr es:[bx - 0x7778]
093e cwde
093f cmp ax, word ptr [bp - 2]
0942 jle 0x964
0944 mov ax, dx
0946 shl ax, 1
0948 les bx, ptr [bp + 8]
094b add bx, ax
094d mov si, word ptr es:[bx]
0950 mov bx, word ptr es:[bx]
0953 imul bx, bx, 0x16
0956 mov ax, 0x1e1d
0959 mov es, ax
095b mov al, byte ptr es:[bx - 0x7778]
0960 cwde
0961 mov word ptr [bp - 2], ax
0964 mov ax, dx
0966 dec dx
0967 or ax, ax
0969 jne 0x8ec
096b cmp si, -1
096e je 0x992
0970 mov ax, di
0972 imul ax, ax, 0x5c
0975 les bx, ptr [0x40ee]
0979 add bx, ax
097b mov ax, cx
097d shl ax, 1
097f add bx, ax
0981 mov word ptr es:[bx + 0x28a], si
0986 jmp 0x992
0988 mov ax, cx
098a dec cx
098b or ax, ax
098d je 0x992
098f jmp 0x8c3
0992 pop di
0993 pop si
0994 leave
0995 retf

ovl19_0996:  ; ENTRY
0996 push bp
0997 mov bp, sp
0999 sub sp, 0x18
099c push si
099d push di
099e mov si, word ptr [bp + 6]
09a1 mov word ptr [bp - 6], 0xf
09a6 mov word ptr [bp - 4], 4
09ab jmp 0xb35
09ae mov word ptr [bp - 2], 1
09b3 push si
09b4 nop
09b5 push cs
09b6 call 0x1251
09b9 pop cx
09ba mov ax, si
09bc imul ax, ax, 0x5c
09bf les bx, ptr [0x40ee]
09c3 add bx, ax
09c5 mov ax, word ptr [bp - 4]
09c8 shl ax, 1
09ca add bx, ax
09cc cmp word ptr es:[bx + 0x28a], -1
09d2 jne 0x9d7
09d4 jmp 0xb35
09d7 mov ax, si
09d9 imul ax, ax, 0x5c
09dc les bx, ptr [0x40ee]
09e0 add bx, ax
09e2 mov ax, word ptr [bp - 4]
09e5 shl ax, 1
09e7 add bx, ax
09e9 mov di, word ptr es:[bx + 0x28a]
09ee push 0
09f0 mov bx, di
09f2 imul bx, bx, 0x16
09f5 mov ax, 0x1e1d
09f8 mov es, ax
09fa mov al, byte ptr es:[bx - 0x7772]
09ff and ax, 0xf
0a02 push ax
0a03 mov bx, di
0a05 imul bx, bx, 0x16
0a08 mov ax, 0x1e1d
0a0b mov es, ax
0a0d mov al, byte ptr es:[bx - 0x7772]
0a12 shr ax, 4
0a15 and ax, 7
0a18 push ax
0a19 push ss
0a1a lea ax, [bp - 0x18]
0a1d push ax
0a1e mov bx, di
0a20 imul bx, bx, 0x16
0a23 mov ax, 0x1e1d
0a26 mov es, ax
0a28 push word ptr es:[bx - 0x777e]
0a2d mov bx, di
0a2f imul bx, bx, 0x16
0a32 mov ax, 0x1e1d
0a35 mov es, ax
0a37 push word ptr es:[bx - 0x7780]
0a3c lcall 0x2ff7, 0x57 -> ovl29:13b2
0a41 add sp, 0xe
0a44 or ax, ax
0a46 jne 0xa4b
0a48 jmp 0xb35
0a4b lcall 0xc8c, 0x529 -> 0c8c:0529
0a50 push word ptr [0x5dfa]
0a54 push word ptr [0x5dfc]
0a58 mov bx, di
0a5a imul bx, bx, 0x16
0a5d mov ax, 0x1e1d
0a60 mov es, ax
0a62 push word ptr es:[bx - 0x777e]
0a67 mov bx, di
0a69 imul bx, bx, 0x16
0a6c mov ax, 0x1e1d
0a6f mov es, ax
0a71 push word ptr es:[bx - 0x7780]
0a76 push word ptr [bp - 6]
0a79 lcall 0x555, 0x1ab9 -> 0555:1ab9
0a7e add sp, 0xa
0a81 push word ptr [bp - 6]
0a84 mov ax, si
0a86 imul ax, ax, 0x5c
0a89 les bx, ptr [0x40ee]
0a8d add bx, ax
0a8f push word ptr es:[bx + 0x24e]
0a94 push ss
0a95 lea ax, [bp - 0x18]
0a98 push ax
0a99 push si
0a9a nop
0a9b push cs
0a9c call 0xb49
0a9f add sp, 0xa
0aa2 mov word ptr [bp - 8], ax
0aa5 or ax, ax
0aa7 je 0xab5
0aa9 cmp ax, 1
0aac je 0xb27
0aae cmp ax, 3
0ab1 jne 0xb2c
0ab3 jmp 0xb27
0ab5 mov cx, 0xffff
0ab8 mov dx, 8
0abb jmp 0xb0c
0abd mov bx, dx
0abf shl bx, 1
0ac1 lea ax, [bp - 0x18]
0ac4 add bx, ax
0ac6 cmp word ptr ss:[bx], -1
0aca je 0xb0c
0acc mov bx, dx
0ace shl bx, 1
0ad0 add bx, ax
0ad2 mov bx, word ptr ss:[bx]
0ad5 imul bx, bx, 0x16
0ad8 mov ax, 0x1e1d
0adb mov es, ax
0add mov al, byte ptr es:[bx - 0x7772]
0ae2 and ax, 0xf
0ae5 cmp ax, 1
0ae8 jne 0xb13
0aea mov bx, dx
0aec shl bx, 1
0aee lea ax, [bp - 0x18]
0af1 add bx, ax
0af3 mov bx, word ptr ss:[bx]
0af6 imul bx, bx, 0x16
0af9 mov ax, 0x1e1d
0afc mov es, ax
0afe mov al, byte ptr es:[bx - 0x7771]
0b03 shr ax, 1
0b05 and ax, 0x7f
0b08 mov cx, ax
0b0a jmp 0xb13
0b0c mov ax, dx
0b0e dec dx
0b0f or ax, ax
0b11 jne 0xabd
0b13 cmp cx, -1
0b16 je 0xb27
0b18 push cx
0b19 push ss
0b1a lea ax, [bp - 0x18]
0b1d push ax
0b1e push si
0b1f nop
0b20 push cs
0b21 call 0xf1b
0b24 add sp, 8
0b27 mov word ptr [bp - 2], 0
0b2c cmp word ptr [bp - 2], 0
0b30 je 0xb35
0b32 jmp 0x9ae
0b35 mov ax, word ptr [bp - 4]
0b38 dec word ptr [bp - 4]
0b3b or ax, ax
0b3d je 0xb42
0b3f jmp 0x9ae
0b42 mov ax, 1
0b45 pop di
0b46 pop si
0b47 leave
0b48 retf

ovl19_0b49:  ; ENTRY
0b49 push bp
0b4a mov bp, sp
0b4c sub sp, 0xe
0b4f push si
0b50 push di
0b51 lcall 0x555, 0x1b0a -> 0555:1b0a
0b56 mov word ptr [bp - 2], dx
0b59 mov word ptr [bp - 4], ax
0b5c mov word ptr [bp - 0xc], 0xffff
0b61 mov word ptr [bp - 0xe], 0x3e8
0b66 mov ax, 0x2c04
0b69 mov es, ax
0b6b mov si, word ptr es:[0x157b]
0b70 jmp 0xbe7
0b72 mov bx, si
0b74 imul bx, bx, 0x41
0b77 mov ax, 0x2c04
0b7a mov es, ax
0b7c mov al, byte ptr es:[bx + 0x1592]
0b81 cwde
0b82 cmp ax, word ptr [bp + 0xc]
0b85 jne 0xbe7
0b87 push 0
0b89 push dword ptr [bp - 4]
0b8d push ss
0b8e lea ax, [bp - 8]
0b91 push ax
0b92 push ss
0b93 lea ax, [bp - 6]
0b96 push ax
0b97 push si
0b98 lcall 0x2fc5, 0x39 -> ovl21:0a85
0b9d add sp, 0x10
0ba0 mov di, ax
0ba2 cmp di, 0x32
0ba5 jge 0xbe7
0ba7 cmp di, word ptr [0x5e00]
0bab jge 0xbe7
0bad mov bx, si
0baf imul bx, bx, 0x41
0bb2 mov ax, 0x2c04
0bb5 mov es, ax
0bb7 push word ptr es:[bx + 0x157f]
0bbc mov bx, si
0bbe imul bx, bx, 0x41
0bc1 mov ax, 0x2c04
0bc4 mov es, ax
0bc6 push word ptr es:[bx + 0x157d]
0bcb lcall 0x2ff7, 0x61 -> ovl29:15c5
0bd0 add sp, 4
0bd3 mov word ptr [bp - 0xa], ax
0bd6 cmp word ptr [bp - 0xa], 0x4b
0bda jle 0xbe7
0bdc cmp di, word ptr [bp - 0xe]
0bdf jge 0xbe7
0be1 mov word ptr [bp - 0xc], si
0be4 mov word ptr [bp - 0xe], di
0be7 mov ax, si
0be9 dec si
0bea or ax, ax
0bec jne 0xb72
0bee push dword ptr [bp - 4]
0bf2 push word ptr [bp + 0xe]
0bf5 push word ptr [bp + 0xc]
0bf8 push dword ptr [bp + 8]
0bfc push word ptr [bp + 6]
0bff nop
0c00 push cs
0c01 call 0xc32
0c04 add sp, 0xe
0c07 mov si, ax
0c09 or si, si
0c0b je 0xc27
0c0d cmp word ptr [bp - 0xc], -1
0c11 je 0xc27
0c13 push word ptr [bp - 0xc]
0c16 push dword ptr [bp + 8]
0c1a push word ptr [bp + 6]
0c1d nop
0c1e push cs
0c1f call 0xf1b
0c22 add sp, 8
0c25 mov si, ax
0c27 lcall 0x555, 0x1b2e -> 0555:1b2e
0c2c mov ax, si
0c2e pop di
0c2f pop si
0c30 leave
0c31 retf

ovl19_0c32:  ; ENTRY
0c32 push bp
0c33 mov bp, sp
0c35 sub sp, 0x18
0c38 push si
0c39 push di
0c3a les bx, ptr [bp + 8]
0c3d mov ax, word ptr es:[bx]
0c40 mov word ptr [bp - 2], ax
0c43 mov bx, word ptr [bp - 2]
0c46 imul bx, bx, 0x16
0c49 mov ax, 0x1e1d
0c4c mov dx, 0
0c4f add dx, 0x8880
0c53 add bx, dx
0c55 mov es, ax
0c57 mov ax, word ptr es:[bx]
0c5a mov word ptr [bp - 4], ax
0c5d mov bx, word ptr [bp - 2]
0c60 imul bx, bx, 0x16
0c63 mov ax, 0x1e1d
0c66 mov es, ax
0c68 mov ax, word ptr es:[bx - 0x777e]
0c6d mov word ptr [bp - 6], ax
0c70 mov bx, word ptr [bp - 2]
0c73 imul bx, bx, 0x16
0c76 mov ax, 0x1e1d
0c79 mov es, ax
0c7b mov ax, word ptr es:[bx - 0x7774]
0c80 and ax, 0x1000
0c83 mov word ptr [bp - 8], ax
0c86 mov word ptr [bp - 0x12], 0xffff
0c8b mov word ptr [bp - 0x14], 0xffff
0c90 mov word ptr [bp - 0x16], 0
0c95 mov word ptr [bp - 0x18], 0
0c9a cmp word ptr [bp - 8], 0
0c9e je 0xca3
0ca0 jmp 0xf14
0ca3 mov si, word ptr [bp - 4]
0ca6 sub si, word ptr [bp + 0xe]
0ca9 jmp 0xdf0
0cac mov di, word ptr [bp - 6]
0caf sub di, word ptr [bp + 0xe]
0cb2 jmp 0xde2
0cb5 or si, si
0cb7 jge 0xcbc
0cb9 jmp 0xde1
0cbc or di, di
0cbe jge 0xcc3
0cc0 jmp 0xde1
0cc3 cmp si, 0x70
0cc6 jl 0xccb
0cc8 jmp 0xde1
0ccb cmp di, 0x9c
0ccf jl 0xcd4
0cd1 jmp 0xde1
0cd4 mov bx, di
0cd6 imul bx, bx, 0xe0
0cda mov ax, si
0cdc shl ax, 1
0cde add bx, ax
0ce0 mov ax, 0x1e1d
0ce3 mov es, ax
0ce5 mov al, byte ptr es:[bx + 1]
0cea shr ax, 4
0ced and ax, 1
0cf0 or ax, ax
0cf2 jne 0xcf7
0cf4 jmp 0xde1
0cf7 mov bx, di
0cf9 imul bx, bx, 0xe0
0cfd mov ax, si
0cff shl ax, 1
0d01 add bx, ax
0d03 mov ax, 0x1e1d
0d06 mov es, ax
0d08 mov al, byte ptr es:[bx + 1]
0d0d and ax, 0xf
0d10 mov word ptr [bp - 0xa], ax
0d13 cmp ax, word ptr [bp + 0xc]
0d16 je 0xd1b
0d18 jmp 0xde1
0d1b mov bx, di
0d1d imul bx, bx, 0xe0
0d21 mov ax, si
0d23 shl ax, 1
0d25 add bx, ax
0d27 mov ax, 0x1e1d
0d2a mov es, ax
0d2c mov bl, byte ptr es:[bx]
0d31 and bx, 0xff
0d35 mov ax, 0x2c04
0d38 mov es, ax
0d3a mov al, byte ptr es:[bx + 0x710]
0d3f cwde
0d40 mov dx, ax
0d42 cmp dx, 0xa
0d45 jne 0xd4a
0d47 jmp 0xde1
0d4a cmp dx, 3
0d4d jne 0xd52
0d4f jmp 0xde1
0d52 cmp dx, 2
0d55 jne 0xd5a
0d57 jmp 0xde1
0d5a mov ax, si
0d5c imul ax, ax, 0x138
0d60 les bx, ptr [bp + 0x10]
0d63 add bx, ax
0d65 mov ax, di
0d67 shl ax, 1
0d69 add bx, ax
0d6b mov ax, word ptr es:[bx]
0d6e cdq
0d6f xor ax, dx
0d71 sub ax, dx
0d73 mov dx, word ptr [0x5e00]
0d77 dec dx
0d78 cmp ax, dx
0d7a jg 0xde1
0d7c mov bx, di
0d7e imul bx, bx, 0x70
0d81 add bx, si
0d83 mov ax, 0x19d9
0d86 mov es, ax
0d88 mov al, byte ptr es:[bx]
0d8d shr ax, 5
0d90 and ax, 1
0d93 or ax, ax
0d95 je 0xde1
0d97 push ss
0d98 lea ax, [bp - 0x10]
0d9b push ax
0d9c push ss
0d9d lea ax, [bp - 0xe]
0da0 push ax
0da1 push ss
0da2 lea ax, [bp - 0xc]
0da5 push ax
0da6 push di
0da7 push si
0da8 lcall 0x2ff7, 0x66 -> ovl29:1626
0dad add sp, 0x10
0db0 push di
0db1 push si
0db2 lcall 0x2ff7, 0x61 -> ovl29:15c5
0db7 add sp, 4
0dba mov dx, ax
0dbc cmp dx, 0x4b
0dbf jle 0xde1
0dc1 cmp word ptr [bp - 0xc], 2
0dc5 jle 0xdcd
0dc7 cmp word ptr [bp - 0xe], 0xa
0dcb jg 0xdd3
0dcd cmp word ptr [bp - 0x10], 0
0dd1 je 0xde1
0dd3 cmp dx, word ptr [bp - 0x16]
0dd6 jle 0xde1
0dd8 mov word ptr [bp - 0x12], si
0ddb mov word ptr [bp - 0x14], di
0dde mov word ptr [bp - 0x16], dx
0de1 inc di
0de2 mov ax, word ptr [bp - 6]
0de5 add ax, word ptr [bp + 0xe]
0de8 cmp ax, di
0dea jle 0xdef
0dec jmp 0xcb5
0def inc si
0df0 mov ax, word ptr [bp - 4]
0df3 add ax, word ptr [bp + 0xe]
0df6 cmp ax, si
0df8 jle 0xdfd
0dfa jmp 0xcac
0dfd cmp word ptr [bp - 0x12], -1
0e01 jne 0xe06
0e03 jmp 0xf14
0e06 mov bx, word ptr [bp - 2]
0e09 imul bx, bx, 0x16
0e0c mov ax, 0x1e1d
0e0f mov es, ax
0e11 mov al, byte ptr es:[bx - 0x7772]
0e16 and ax, 0xf
0e19 cmp ax, 1
0e1c jne 0xe35
0e1e mov bx, word ptr [bp - 2]
0e21 imul bx, bx, 0x16
0e24 mov ax, 0x1e1d
0e27 mov es, ax
0e29 mov al, byte ptr es:[bx - 0x7771]
0e2e shr ax, 1
0e30 and ax, 0x7f
0e33 jmp 0xe38
0e35 mov ax, 0xffff
0e38 mov si, ax
0e3a push 0x200000
0e40 push 4
0e42 push dword ptr [bp + 8]
0e46 lcall 0x2ff7, 0x2a -> ovl29:0ae7
0e4b add sp, 0xa
0e4e les bx, ptr [0x5e62]
0e52 mov ax, word ptr [bp - 0x12]
0e55 mov word ptr es:[bx + 0x12], ax
0e59 mov ax, word ptr [bp - 0x14]
0e5c mov word ptr es:[bx + 0x14], ax
0e60 push 0
0e62 push ax
0e63 push word ptr [bp - 0x12]
0e66 lcall 0xa8b, 1 -> 0a8b:0001
0e6b add sp, 6
0e6e xor cx, cx
0e70 jmp 0xf07
0e73 mov ax, cx
0e75 shl ax, 1
0e77 les bx, ptr [bp + 8]
0e7a add bx, ax
0e7c cmp word ptr es:[bx], -1
0e80 jne 0xe85
0e82 jmp 0xf06
0e85 mov ax, cx
0e87 shl ax, 1
0e89 les bx, ptr [bp + 8]
0e8c add bx, ax
0e8e mov bx, word ptr es:[bx]
0e91 imul bx, bx, 0x16
0e94 mov ax, 0x1e1d
0e97 mov es, ax
0e99 mov al, byte ptr es:[bx - 0x777b]
0e9e cwde
0e9f mov dx, 0x2c04
0ea2 mov es, dx
0ea4 cmp ax, word ptr es:[0x110]
0ea9 je 0xebb
0eab mov ax, cx
0ead shl ax, 1
0eaf les bx, ptr [bp + 8]
0eb2 add bx, ax
0eb4 mov word ptr es:[bx], 0xffff
0eb9 jmp 0xf06
0ebb cmp si, -1
0ebe je 0xf06
0ec0 mov ax, cx
0ec2 shl ax, 1
0ec4 les bx, ptr [bp + 8]
0ec7 add bx, ax
0ec9 mov bx, word ptr es:[bx]
0ecc imul bx, bx, 0x16
0ecf mov ax, 0x1e1d
0ed2 mov es, ax
0ed4 and byte ptr es:[bx - 0x7772], 0xf0
0eda or byte ptr es:[bx - 0x7772], 1
0ee0 mov ax, si
0ee2 and ax, 0x7f
0ee5 mov dx, cx
0ee7 shl dx, 1
0ee9 les bx, ptr [bp + 8]
0eec add bx, dx
0eee mov bx, word ptr es:[bx]
0ef1 imul bx, bx, 0x16
0ef4 mov dx, 0x1e1d
0ef7 mov es, dx
0ef9 and byte ptr es:[bx - 0x7771], 1
0eff shl al, 1
0f01 or byte ptr es:[bx - 0x7771], al
0f06 inc cx
0f07 cmp cx, 8
0f0a jge 0xf0f
0f0c jmp 0xe73
0f0f mov word ptr [bp - 0x18], 2
0f14 mov ax, word ptr [bp - 0x18]
0f17 pop di
0f18 pop si
0f19 leave
0f1a retf

ovl19_0f1b:  ; ENTRY
0f1b push bp
0f1c mov bp, sp
0f1e sub sp, 0xa
0f21 push si
0f22 push di
0f23 les bx, ptr [bp + 8]
0f26 mov ax, word ptr es:[bx]
0f29 mov word ptr [bp - 4], ax
0f2c cmp word ptr [bp - 4], -1
0f30 jne 0xf35
0f32 jmp 0x1063
0f35 mov bx, word ptr [bp + 0xc]
0f38 imul bx, bx, 0x41
0f3b mov ax, 0x2c04
0f3e mov es, ax
0f40 mov bx, word ptr es:[bx + 0x157f]
0f45 imul bx, bx, 0xe0
0f49 mov si, word ptr [bp + 0xc]
0f4c imul si, si, 0x41
0f4f mov ax, 0x2c04
0f52 mov es, ax
0f54 mov ax, word ptr es:[si + 0x157d]
0f59 shl ax, 1
0f5b add bx, ax
0f5d mov ax, 0x1e1d
0f60 mov es, ax
0f62 mov bl, byte ptr es:[bx]
0f67 and bx, 0xff
0f6b mov ax, 0x2c04
0f6e mov es, ax
0f70 cmp byte ptr es:[bx + 0x710], 0xa
0f76 jne 0xf7b
0f78 jmp 0x1063
0f7b mov word ptr [bp - 8], 0x3e8
0f80 mov word ptr [bp - 0xa], 0xffff
0f85 xor di, di
0f87 jmp 0x104f
0f8a mov ax, word ptr [bp + 6]
0f8d imul ax, ax, 0x5c
0f90 les bx, ptr [0x40ee]
0f94 add bx, ax
0f96 mov ax, di
0f98 shl ax, 1
0f9a add bx, ax
0f9c mov ax, word ptr es:[bx + 0x25a]
0fa1 mov word ptr [bp - 6], ax
0fa4 cmp ax, 0xffff
0fa7 jne 0xfac
0fa9 jmp 0x104e
0fac mov bx, word ptr [bp - 6]
0faf imul bx, bx, 0x41
0fb2 mov ax, 0x2c04
0fb5 mov es, ax
0fb7 push word ptr es:[bx + 0x157f]
0fbc mov bx, word ptr [bp - 6]
0fbf imul bx, bx, 0x41
0fc2 mov ax, 0x2c04
0fc5 mov es, ax
0fc7 push word ptr es:[bx + 0x157d]
0fcc mov bx, word ptr [bp - 4]
0fcf imul bx, bx, 0x16
0fd2 mov ax, 0x1e1d
0fd5 mov es, ax
0fd7 push word ptr es:[bx - 0x777e]
0fdc mov bx, word ptr [bp - 4]
0fdf imul bx, bx, 0x16
0fe2 mov ax, 0x1e1d
0fe5 mov dx, 0
0fe8 add dx, 0x8880
0fec add bx, dx
0fee mov es, ax
0ff0 push word ptr es:[bx]
0ff3 lcall 0xa8b, 0xacc -> 0a8b:0acc
0ff8 add sp, 8
0ffb mov dx, ax
0ffd cmp dx, word ptr [bp - 8]
1000 jge 0x104e
1002 mov bx, word ptr [bp - 6]
1005 imul bx, bx, 0x41
1008 mov ax, 0x2c04
100b mov es, ax
100d mov bx, word ptr es:[bx + 0x157f]
1012 imul bx, bx, 0xe0
1016 mov si, word ptr [bp - 6]
1019 imul si, si, 0x41
101c mov ax, 0x2c04
101f mov es, ax
1021 mov ax, word ptr es:[si + 0x157d]
1026 shl ax, 1
1028 add bx, ax
102a mov ax, 0x1e1d
102d mov es, ax
102f mov bl, byte ptr es:[bx]
1034 and bx, 0xff
1038 mov ax, 0x2c04
103b mov es, ax
103d cmp byte ptr es:[bx + 0x710], 0xa
1043 jne 0x104e
1045 mov ax, word ptr [bp - 6]
1048 mov word ptr [bp - 0xa], ax
104b mov word ptr [bp - 8], dx
104e inc di
104f cmp di, 6
1052 jge 0x1057
1054 jmp 0xf8a
1057 cmp word ptr [bp - 0xa], -1
105b je 0x1063
105d mov ax, word ptr [bp - 0xa]
1060 mov word ptr [bp + 0xc], ax
1063 xor si, si
1065 xor di, di
1067 jmp 0x1085
1069 mov ax, word ptr [bp + 6]
106c imul ax, ax, 0x5c
106f les bx, ptr [0x40ee]
1073 add bx, ax
1075 mov ax, di
1077 shl ax, 1
1079 add bx, ax
107b cmp word ptr es:[bx + 0x25a], -1
1081 je 0x1084
1083 inc si
1084 inc di
1085 cmp di, 6
1088 jl 0x1069
108a xor di, di
108c jmp 0x10ce
108e mov ax, di
1090 shl ax, 1
1092 les bx, ptr [bp + 8]
1095 add bx, ax
1097 mov ax, word ptr es:[bx]
109a mov word ptr [bp - 4], ax
109d cmp ax, 0xffff
10a0 je 0x10cd
10a2 mov bx, word ptr [bp - 4]
10a5 imul bx, bx, 0x16
10a8 mov ax, 0x1e1d
10ab mov es, ax
10ad mov al, byte ptr es:[bx - 0x777b]
10b2 cwde
10b3 mov dx, 0x2c04
10b6 mov es, dx
10b8 cmp ax, word ptr es:[0x110]
10bd je 0x10cd
10bf mov ax, di
10c1 shl ax, 1
10c3 les bx, ptr [bp + 8]
10c6 add bx, ax
10c8 mov word ptr es:[bx], 0xffff
10cd inc di
10ce cmp di, 8
10d1 jl 0x108e
10d3 mov bx, word ptr [bp + 0xc]
10d6 imul bx, bx, 0x41
10d9 mov ax, 0x2c04
10dc mov es, ax
10de mov al, byte ptr es:[bx + 0x1592]
10e3 cwde
10e4 mov word ptr [bp - 2], ax
10e7 push 0
10e9 push word ptr [bp + 0xc]
10ec push 1
10ee push dword ptr [bp + 8]
10f2 lcall 0x2ff7, 0x2a -> ovl29:0ae7
10f7 add sp, 0xa
10fa push 0
10fc les bx, ptr [0x5e62]
1100 push word ptr es:[bx + 0x14]
1104 push word ptr es:[bx + 0x12]
1108 lcall 0xa8b, 1 -> 0a8b:0001
110d add sp, 6
1110 cmp ax, 1
1113 jne 0x112c
1115 push 1
1117 lcall 0x2fd6, 0x39 -> ovl24:0000
111c pop cx
111d push word ptr [bp + 6]
1120 nop
1121 push cs
1122 call 0x1251
1125 pop cx
1126 mov ax, 3
1129 jmp 0x124d
112c push word ptr [bp + 6]
112f nop
1130 push cs
1131 call 0x1251
1134 pop cx
1135 mov bx, word ptr [bp + 0xc]
1138 imul bx, bx, 0x41
113b mov ax, 0x2c04
113e mov es, ax
1140 mov al, byte ptr es:[bx + 0x1592]
1145 cwde
1146 mov dx, 0x2c04
1149 mov es, dx
114b cmp ax, word ptr es:[0x110]
1150 jne 0x1126
1152 mov ax, 0x2c04
1155 mov es, ax
1157 mov ax, word ptr es:[0x110]
115b cmp ax, word ptr [bp - 2]
115e je 0x1126
1160 mov bx, word ptr [bp + 0xc]
1163 imul bx, bx, 0x41
1166 mov ax, 0x2c04
1169 mov es, ax
116b mov ax, word ptr es:[bx + 0x157d]
1170 mov es, dx
1172 mov bx, word ptr es:[0x110]
1177 imul bx, bx, 0x14
117a mov dx, 0x2c04
117d mov es, dx
117f cmp ax, word ptr es:[bx + 0x193]
1184 jne 0x11b4
1186 mov bx, word ptr [bp + 0xc]
1189 imul bx, bx, 0x41
118c mov ax, 0x2c04
118f mov es, ax
1191 mov ax, word ptr es:[bx + 0x157f]
1196 mov dx, 0x2c04
1199 mov es, dx
119b mov bx, word ptr es:[0x110]
11a0 imul bx, bx, 0x14
11a3 mov dx, 0x2c04
11a6 mov es, dx
11a8 cmp ax, word ptr es:[bx + 0x195]
11ad jne 0x11b4
11af mov ax, 1
11b2 jmp 0x11b6
11b4 xor ax, ax
11b6 mov dx, ax
11b8 or dx, dx
11ba jne 0x11f1
11bc cmp si, 1
11bf jle 0x11f1
11c1 mov ax, word ptr [bp + 6]
11c4 imul ax, ax, 0x5c
11c7 les bx, ptr [0x40ee]
11cb add bx, ax
11cd test word ptr es:[bx + 0x2a6], 1
11d4 je 0x11f1
11d6 push 0
11d8 push word ptr [bp + 0xc]
11db nop
11dc push cs
11dd call 0x1864
11e0 add sp, 4
11e3 mov word ptr [bp + 0xc], ax
11e6 cmp word ptr [bp + 0xc], -1
11ea je 0x11ef
11ec jmp 0x1063
11ef jmp 0x1244
11f1 or dx, dx
11f3 jne 0x1214
11f5 mov ax, word ptr [bp + 6]
11f8 imul ax, ax, 0x5c
11fb les bx, ptr [0x40ee]
11ff add bx, ax
1201 test word ptr es:[bx + 0x2a6], 2
1208 je 0x1214
120a push word ptr [bp + 0xc]
120d nop
120e push cs
120f call 0x199c
1212 jmp 0x1235
1214 or dx, dx
1216 jne 0x1236
1218 mov ax, word ptr [bp + 6]
121b imul ax, ax, 0x5c
121e les bx, ptr [0x40ee]
1222 add bx, ax
1224 test word ptr es:[bx + 0x2a6], 4
122b je 0x1236
122d push word ptr [bp + 0xc]
1230 nop
1231 push cs
1232 call 0x1a2a
1235 pop cx
1236 push word ptr [bp + 0xc]
1239 push word ptr [bp + 6]
123c nop
123d push cs
123e call 0x134c
1241 add sp, 4
1244 mov ax, 1
1247 jmp 0x1129
124a jmp 0x1126
124d pop di
124e pop si
124f leave
1250 retf

ovl19_1251:  ; ENTRY
1251 push bp
1252 mov bp, sp
1254 sub sp, 0x10
1257 push si
1258 push di
1259 mov si, word ptr [bp + 6]
125c mov cx, 4
125f jmp 0x133e
1262 mov bx, cx
1264 shl bx, 1
1266 lea ax, [bp - 0x10]
1269 add bx, ax
126b mov ax, 0xffff
126e mov word ptr ss:[bx], ax
1271 mov bx, cx
1273 shl bx, 1
1275 lea dx, [bp - 8]
1278 add bx, dx
127a mov word ptr ss:[bx], ax
127d mov ax, si
127f imul ax, ax, 0x5c
1282 les bx, ptr [0x40ee]
1286 add bx, ax
1288 mov ax, cx
128a shl ax, 1
128c add bx, ax
128e cmp word ptr es:[bx + 0x28a], -1
1294 jne 0x1299
1296 jmp 0x133e
1299 mov ax, si
129b imul ax, ax, 0x5c
129e les bx, ptr [0x40ee]
12a2 add bx, ax
12a4 mov ax, cx
12a6 shl ax, 1
12a8 add bx, ax
12aa mov di, word ptr es:[bx + 0x28a]
12af mov bx, di
12b1 imul bx, bx, 0x16
12b4 mov ax, 0x1e1d
12b7 mov es, ax
12b9 mov al, byte ptr es:[bx - 0x777b]
12be cwde
12bf mov dx, 0x2c04
12c2 mov es, dx
12c4 cmp ax, word ptr es:[0x110]
12c9 jne 0x1326
12cb mov ax, si
12cd inc ax
12ce mov bx, di
12d0 imul bx, bx, 0x16
12d3 mov dx, 0x1e1d
12d6 mov es, dx
12d8 mov dl, byte ptr es:[bx - 0x7772]
12dd shr dx, 4
12e0 and dx, 7
12e3 cmp ax, dx
12e5 jne 0x1326
12e7 mov bx, di
12e9 imul bx, bx, 0x16
12ec mov ax, 0x1e1d
12ef mov dx, 0
12f2 add dx, 0x8880
12f6 add bx, dx
12f8 mov es, ax
12fa mov ax, word ptr es:[bx]
12fd mov bx, cx
12ff shl bx, 1
1301 lea dx, [bp - 8]
1304 add bx, dx
1306 mov word ptr ss:[bx], ax
1309 mov bx, di
130b imul bx, bx, 0x16
130e mov ax, 0x1e1d
1311 mov es, ax
1313 mov ax, word ptr es:[bx - 0x777e]
1318 mov bx, cx
131a shl bx, 1
131c lea dx, [bp - 0x10]
131f add bx, dx
1321 mov word ptr ss:[bx], ax
1324 jmp 0x133e
1326 mov ax, si
1328 imul ax, ax, 0x5c
132b les bx, ptr [0x40ee]
132f add bx, ax
1331 mov ax, cx
1333 shl ax, 1
1335 add bx, ax
1337 mov word ptr es:[bx + 0x28a], 0xffff
133e mov ax, cx
1340 dec cx
1341 or ax, ax
1343 je 0x1348
1345 jmp 0x1262
1348 pop di
1349 pop si
134a leave
134b retf

ovl19_134c:  ; ENTRY
134c push bp
134d mov bp, sp
134f sub sp, 0x16
1352 push si
1353 push di
1354 mov di, word ptr [bp + 6]
1357 mov word ptr [bp - 6], 0
135c mov ax, di
135e imul ax, ax, 0x5c
1361 les bx, ptr [0x40ee]
1365 add bx, ax
1367 mov ax, word ptr es:[bx + 0x250]
136c mov word ptr [bp - 8], ax
136f mov ax, di
1371 imul ax, ax, 0x5c
1374 mov bx, word ptr [0x40ee]
1378 add bx, ax
137a mov ax, word ptr es:[bx + 0x24e]
137f mov word ptr [bp - 0xa], ax
1382 mov ax, word ptr [bp - 8]
1385 cmp ax, word ptr [bp + 8]
1388 jne 0x138f
138a xor ax, ax
138c jmp 0x1575
138f push 1
1391 push word ptr [bp + 8]
1394 lcall 0x2fd6, 0x25 -> ovl24:023f
1399 add sp, 4
139c xor dx, dx
139e jmp 0x13d6
13a0 mov ax, di
13a2 imul ax, ax, 0x5c
13a5 les bx, ptr [0x40ee]
13a9 add bx, ax
13ab mov ax, dx
13ad shl ax, 1
13af add bx, ax
13b1 mov ax, word ptr es:[bx + 0x25a]
13b6 cmp ax, word ptr [bp + 8]
13b9 jne 0x13d5
13bb mov ax, di
13bd imul ax, ax, 0x5c
13c0 mov bx, word ptr [0x40ee]
13c4 add bx, ax
13c6 mov ax, dx
13c8 shl ax, 1
13ca add bx, ax
13cc mov word ptr es:[bx + 0x25a], 0xffff
13d3 jmp 0x13db
13d5 inc dx
13d6 cmp dx, 6
13d9 jl 0x13a0
13db mov word ptr [bp - 2], 0
13e0 push ss
13e1 lea ax, [bp - 0x16]
13e4 push ax
13e5 push ss
13e6 lea ax, [bp - 0x10]
13e9 push ax
13ea push 0
13ec push word ptr [bp + 8]
13ef lcall 0x2fdb, 0x5c -> ovl25:0656
13f4 add sp, 0xc
13f7 xor si, si
13f9 jmp 0x1441
13fb mov al, byte ptr [bp + si - 0x10]
13fe mov ah, 0
1400 mov dx, ax
1402 cmp ax, 0xff
1405 je 0x1440
1407 mov bx, dx
1409 imul bx, bx, 0x41
140c mov ax, 0x2c04
140f mov es, ax
1411 mov al, byte ptr es:[bx + 0x1592]
1416 cwde
1417 cmp ax, word ptr [bp - 0xa]
141a jne 0x1440
141c cmp byte ptr [bp + si - 0x16], 0xa
1420 jae 0x1425
1422 inc word ptr [bp - 2]
1425 cmp byte ptr [bp + si - 0x16], 0x14
1429 jae 0x142e
142b inc word ptr [bp - 2]
142e cmp byte ptr [bp + si - 0x16], 0x1e
1432 jae 0x1437
1434 inc word ptr [bp - 2]
1437 cmp byte ptr [bp + si - 0x16], 0x32
143b jae 0x1440
143d inc word ptr [bp - 2]
1440 inc si
1441 cmp si, 6
1444 jl 0x13fb
1446 mov word ptr [bp - 4], 0
144b push ss
144c lea ax, [bp - 0x16]
144f push ax
1450 push ss
1451 lea ax, [bp - 0x10]
1454 push ax
1455 push 0
1457 push word ptr [bp - 8]
145a lcall 0x2fdb, 0x5c -> ovl25:0656
145f add sp, 0xc
1462 xor si, si
1464 jmp 0x14ac
1466 mov al, byte ptr [bp + si - 0x10]
1469 mov ah, 0
146b mov dx, ax
146d cmp ax, 0xff
1470 je 0x14ab
1472 mov bx, dx
1474 imul bx, bx, 0x41
1477 mov ax, 0x2c04
147a mov es, ax
147c mov al, byte ptr es:[bx + 0x1592]
1481 cwde
1482 cmp ax, word ptr [bp - 0xa]
1485 jne 0x14ab
1487 cmp byte ptr [bp + si - 0x16], 0xa
148b jae 0x1490
148d inc word ptr [bp - 4]
1490 cmp byte ptr [bp + si - 0x16], 0x14
1494 jae 0x1499
1496 inc word ptr [bp - 4]
1499 cmp byte ptr [bp + si - 0x16], 0x1e
149d jae 0x14a2
149f inc word ptr [bp - 4]
14a2 cmp byte ptr [bp + si - 0x16], 0x32
14a6 jae 0x14ab
14a8 inc word ptr [bp - 4]
14ab inc si
14ac cmp si, 6
14af jl 0x1466
14b1 cmp word ptr [bp - 2], 0
14b5 jne 0x14c2
14b7 cmp word ptr [bp - 4], 0
14bb jne 0x14c2
14bd mov word ptr [bp - 6], 1
14c2 mov ax, word ptr [bp - 2]
14c5 cmp ax, word ptr [bp - 4]
14c8 jle 0x14cf
14ca mov ax, word ptr [bp + 8]
14cd jmp 0x14d2
14cf mov ax, word ptr [bp - 8]
14d2 mov cx, ax
14d4 xor si, si
14d6 xor dx, dx
14d8 jmp 0x14f8
14da mov ax, di
14dc imul ax, ax, 0x5c
14df les bx, ptr [0x40ee]
14e3 add bx, ax
14e5 mov ax, dx
14e7 shl ax, 1
14e9 add bx, ax
14eb cmp word ptr es:[bx + 0x292], cx
14f0 jne 0x14f7
14f2 mov si, 1
14f5 jmp 0x14fd
14f7 inc dx
14f8 cmp dx, 6
14fb jl 0x14da
14fd or si, si
14ff jne 0x153c
1501 xor dx, dx
1503 jmp 0x1537
1505 mov ax, di
1507 imul ax, ax, 0x5c
150a les bx, ptr [0x40ee]
150e add bx, ax
1510 mov ax, dx
1512 shl ax, 1
1514 add bx, ax
1516 cmp word ptr es:[bx + 0x292], -1
151c jne 0x1536
151e mov ax, di
1520 imul ax, ax, 0x5c
1523 mov bx, word ptr [0x40ee]
1527 add bx, ax
1529 mov ax, dx
152b shl ax, 1
152d add bx, ax
152f mov word ptr es:[bx + 0x292], cx
1534 jmp 0x153c
1536 inc dx
1537 cmp dx, 6
153a jl 0x1505
153c cmp word ptr [bp - 6], 0
1540 je 0x154f
1542 push 3
1544 push di
1545 push cs
1546 call 0x66d
1549 add sp, 4
154c jmp 0x138a
154f mov ax, di
1551 imul ax, ax, 0x5c
1554 les bx, ptr [0x40ee]
1558 add bx, ax
155a mov word ptr es:[bx + 0x250], cx
155f mov bx, word ptr [0x40ee]
1563 add bx, word ptr [bp + 8]
1566 mov byte ptr es:[bx + 0x56], 7
156b push di
156c nop
156d push cs
156e call 0x16fd
1571 pop cx
1572 mov ax, 1
1575 pop di
1576 pop si
1577 leave
1578 retf

ovl19_1579:  ; ENTRY
1579 push bp
157a mov bp, sp
157c sub sp, 0x18
157f push si
1580 push di
1581 mov si, word ptr [bp + 6]
1584 mov word ptr [bp - 6], 0
1589 mov word ptr [bp - 8], 0xffff
158e xor cx, cx
1590 mov ax, si
1592 imul ax, ax, 0x5c
1595 les bx, ptr [0x40ee]
1599 add bx, ax
159b mov ax, word ptr es:[bx + 0x250]
15a0 mov word ptr [bp - 0xa], ax
15a3 mov ax, si
15a5 imul ax, ax, 0x5c
15a8 mov bx, word ptr [0x40ee]
15ac add bx, ax
15ae mov ax, word ptr es:[bx + 0x24e]
15b3 mov word ptr [bp - 0xc], ax
15b6 xor dx, dx
15b8 jmp 0x15ee
15ba mov ax, si
15bc imul ax, ax, 0x5c
15bf les bx, ptr [0x40ee]
15c3 add bx, ax
15c5 mov ax, dx
15c7 shl ax, 1
15c9 add bx, ax
15cb cmp word ptr es:[bx + 0x25a], -1
15d1 je 0x15ed
15d3 mov ax, si
15d5 imul ax, ax, 0x5c
15d8 mov bx, word ptr [0x40ee]
15dc add bx, ax
15de mov ax, dx
15e0 shl ax, 1
15e2 add bx, ax
15e4 mov ax, word ptr es:[bx + 0x25a]
15e9 mov word ptr [bp - 4], ax
15ec inc cx
15ed inc dx
15ee cmp dx, 6
15f1 jl 0x15ba
15f3 cmp cx, 1
15f6 je 0x15fb
15f8 jmp 0x16f9
15fb push ss
15fc lea ax, [bp - 0x18]
15ff push ax
1600 push ss
1601 lea ax, [bp - 0x12]
1604 push ax
1605 push 0
1607 push word ptr [bp - 4]
160a lcall 0x2fdb, 0x5c -> ovl25:0656
160f add sp, 0xc
1612 mov word ptr [bp - 2], 0
1617 jmp 0x16d1
161a lea ax, [bp - 0x12]
161d mov bx, word ptr [bp - 2]
1620 add bx, ax
1622 mov al, byte ptr ss:[bx]
1625 mov ah, 0
1627 mov di, ax
1629 cmp ax, 0xff
162c jne 0x1631
162e jmp 0x16ce
1631 les bx, ptr [0x40ee]
1635 add bx, di
1637 test byte ptr es:[bx + 0x11e], 1
163d je 0x1642
163f jmp 0x16ce
1642 mov bx, di
1644 imul bx, bx, 0x41
1647 mov ax, 0x2c04
164a mov es, ax
164c mov al, byte ptr es:[bx + 0x1592]
1651 cwde
1652 cmp ax, word ptr [bp - 0xc]
1655 jne 0x1694
1657 xor dx, dx
1659 jmp 0x168d
165b mov ax, si
165d imul ax, ax, 0x5c
1660 les bx, ptr [0x40ee]
1664 add bx, ax
1666 mov ax, dx
1668 shl ax, 1
166a add bx, ax
166c cmp word ptr es:[bx + 0x25a], -1
1672 jne 0x168c
1674 mov ax, si
1676 imul ax, ax, 0x5c
1679 mov bx, word ptr [0x40ee]
167d add bx, ax
167f mov ax, dx
1681 shl ax, 1
1683 add bx, ax
1685 mov word ptr es:[bx + 0x25a], di
168a jmp 0x16ce
168c inc dx
168d cmp dx, 6
1690 jl 0x165b
1692 jmp 0x16ce
1694 mov bx, di
1696 imul bx, bx, 0x41
1699 mov ax, 0x2c04
169c mov es, ax
169e mov al, byte ptr es:[bx + 0x1592]
16a3 cwde
16a4 mov dx, 0x2c04
16a7 mov es, dx
16a9 cmp ax, word ptr es:[0x110]
16ae jne 0x16ce
16b0 cmp word ptr [bp - 0xa], di
16b3 jne 0x16ba
16b5 mov word ptr [bp - 6], 1
16ba push di
16bb lcall 0x2fe8, 0x25 -> ovl27:07f8
16c0 pop cx
16c1 or ax, ax
16c3 jne 0x16ce
16c5 cmp word ptr [bp - 8], -1
16c9 jne 0x16ce
16cb mov word ptr [bp - 8], di
16ce inc word ptr [bp - 2]
16d1 cmp word ptr [bp - 2], 6
16d5 jge 0x16da
16d7 jmp 0x161a
16da cmp word ptr [bp - 6], 0
16de jne 0x16f9
16e0 cmp word ptr [bp - 8], -1
16e4 je 0x16f9
16e6 mov ax, si
16e8 imul ax, ax, 0x5c
16eb les bx, ptr [0x40ee]
16ef add bx, ax
16f1 mov ax, word ptr [bp - 8]
16f4 mov word ptr es:[bx + 0x250], ax
16f9 pop di
16fa pop si
16fb leave
16fc retf

ovl19_16fd:  ; ENTRY
16fd push bp
16fe mov bp, sp
1700 sub sp, 0x24
1703 push si
1704 push di
1705 mov ax, word ptr [bp + 6]
1708 imul ax, ax, 0x5c
170b les bx, ptr [0x40ee]
170f add bx, ax
1711 mov ax, word ptr es:[bx + 0x250]
1716 mov word ptr [bp - 6], ax
1719 mov ax, word ptr [bp + 6]
171c imul ax, ax, 0x5c
171f mov bx, word ptr [0x40ee]
1723 add bx, ax
1725 mov ax, word ptr es:[bx + 0x2a4]
172a mov word ptr [bp - 8], ax
172d mov word ptr [bp - 2], 0
1732 jmp 0x1857
1735 mov ax, word ptr [bp + 6]
1738 imul ax, ax, 0x5c
173b les bx, ptr [0x40ee]
173f add bx, ax
1741 mov ax, word ptr [bp - 2]
1744 shl ax, 1
1746 add bx, ax
1748 mov si, word ptr es:[bx + 0x292]
174d mov ax, si
174f cmp ax, 0xffff
1752 jne 0x1757
1754 jmp 0x1854
1757 cmp si, word ptr [bp - 6]
175a jne 0x175f
175c jmp 0x1854
175f mov bx, si
1761 imul bx, bx, 0x41
1764 mov ax, 0x2c04
1767 mov es, ax
1769 mov al, byte ptr es:[bx + 0x1592]
176e cwde
176f mov dx, 0x2c04
1772 mov es, dx
1774 cmp ax, word ptr es:[0x110]
1779 je 0x177e
177b jmp 0x1854
177e push ss
177f lea ax, [bp - 0x14]
1782 push ax
1783 push ss
1784 lea ax, [bp - 0xe]
1787 push ax
1788 push 0
178a push si
178b lcall 0x2fdb, 0x5c -> ovl25:0656
1790 add sp, 0xc
1793 xor cx, cx
1795 mov di, 6
1798 jmp 0x17d8
179a mov al, byte ptr [bp + di - 0xe]
179d mov ah, 0
179f mov dx, ax
17a1 cmp ax, 0xff
17a4 je 0x17d8
17a6 mov bx, dx
17a8 imul bx, bx, 0x41
17ab mov ax, 0x2c04
17ae mov es, ax
17b0 cmp byte ptr es:[bx + 0x1592], 0xf
17b6 je 0x17d8
17b8 mov bx, dx
17ba imul bx, bx, 0x41
17bd mov es, ax
17bf mov al, byte ptr es:[bx + 0x1592]
17c4 cwde
17c5 mov dx, 0x2c04
17c8 mov es, dx
17ca cmp ax, word ptr es:[0x110]
17cf je 0x17d8
17d1 cmp byte ptr [bp + di - 0x14], 0x19
17d5 jae 0x17d8
17d7 inc cx
17d8 mov ax, di
17da dec di
17db or ax, ax
17dd jne 0x179a
17df or cx, cx
17e1 jne 0x1854
17e3 push 1
17e5 push si
17e6 lcall 0x2fd6, 0x25 -> ovl24:023f
17eb add sp, 4
17ee push word ptr [bp - 8]
17f1 push 0
17f4 push ss
17f5 lea ax, [bp - 0x24]
17f8 push ax
17f9 mov bx, si
17fb imul bx, bx, 0x41
17fe mov ax, 0x2c04
1801 mov es, ax
1803 push word ptr es:[bx + 0x157f]
1808 mov bx, si
180a imul bx, bx, 0x41
180d mov ax, 0x2c04
1810 mov es, ax
1812 mov ax, word ptr es:[bx + 0x157d]
1817 inc ax
1818 push ax
1819 lcall 0x2ff7, 0x57 -> ovl29:13b2
181e add sp, 0xe
1821 mov word ptr [bp - 4], ax
1824 cmp word ptr [bp - 4], 3
1828 jle 0x1854
182a push 0
182c push word ptr [bp - 6]
182f push 1
1831 push ss
1832 lea ax, [bp - 0x24]
1835 push ax
1836 lcall 0x2ff7, 0x2a -> ovl29:0ae7
183b add sp, 0xa
183e push 0
1840 les bx, ptr [0x5e62]
1844 push word ptr es:[bx + 0x14]
1848 push word ptr es:[bx + 0x12]
184c lcall 0xa8b, 1 -> 0a8b:0001
1851 add sp, 6
1854 inc word ptr [bp - 2]
1857 cmp word ptr [bp - 2], 6
185b jge 0x1860
185d jmp 0x1735
1860 pop di
1861 pop si
1862 leave
1863 retf

ovl19_1864:  ; ENTRY
1864 push bp
1865 mov bp, sp
1867 sub sp, 0x14
186a push si
186b push di
186c mov si, word ptr [bp + 6]
186f push si
1870 lcall 0x3005, 0x39 -> ovl31:07d0
1875 pop cx
1876 mov word ptr [bp - 4], ax
1879 cmp word ptr [bp + 8], 0
187d jne 0x18e4
187f mov word ptr [bp - 8], 0
1884 push ss
1885 lea ax, [bp - 0x14]
1888 push ax
1889 push ss
188a lea ax, [bp - 0xe]
188d push ax
188e push 0
1890 push si
1891 lcall 0x2fdb, 0x5c -> ovl25:0656
1896 add sp, 0xc
1899 mov di, 6
189c jmp 0x18d1
189e mov al, byte ptr [bp + di - 0xe]
18a1 mov ah, 0
18a3 mov word ptr [bp - 6], ax
18a6 cmp ax, 0xff
18a9 je 0x18d1
18ab mov bx, word ptr [bp - 6]
18ae imul bx, bx, 0x41
18b1 mov ax, 0x2c04
18b4 mov es, ax
18b6 mov al, byte ptr es:[bx + 0x1592]
18bb cwde
18bc mov dx, 0x2c04
18bf mov es, dx
18c1 cmp ax, word ptr es:[0x110]
18c6 jne 0x18d1
18c8 cmp byte ptr [bp + di - 0x14], 0x2d
18cc jae 0x18d1
18ce inc word ptr [bp - 8]
18d1 mov ax, di
18d3 dec di
18d4 or ax, ax
18d6 jne 0x189e
18d8 cmp word ptr [bp - 8], 3
18dc jl 0x18e4
18de mov ax, 0xffff
18e1 jmp 0x1998
18e4 cmp word ptr [bp - 4], 0x190
18e9 jl 0x18f4
18eb push si
18ec nop
18ed push cs
18ee call 0x199c
18f1 pop cx
18f2 jmp 0x18de
18f4 mov ax, si
18f6 imul ax, ax, 0x41
18f9 add ax, 0x1581
18fc push 0x2c04
18ff push ax
1900 push ds
1901 push 0x788 ; "%s is being razed!"
1904 push ds
1905 push 0x5c88
1908 lcall 0, 0x4944 -> 0000:4944
190d add sp, 0xc
1910 push ds
1911 push 0x5c88
1914 lcall 0x3024, 0x43 -> ovl36:16b3
1919 add sp, 4
191c push 1
191e mov bx, si
1920 imul bx, bx, 0x41
1923 mov ax, 0x2c04
1926 mov es, ax
1928 push word ptr es:[bx + 0x157f]
192d mov bx, si
192f imul bx, bx, 0x41
1932 mov ax, 0x2c04
1935 mov es, ax
1937 push word ptr es:[bx + 0x157d]
193c lcall 0x300b, 0x34 -> ovl32:016b
1941 add sp, 6
1944 push 0xf
1947 push 1
1949 lcall 0x30c1, 0x3e -> ovl59:02bf
194e add sp, 6
1951 add ax, 0xa
1954 mov dx, 0x2c04
1957 mov es, dx
1959 mov bx, word ptr es:[0x110]
195e shl bx, 1
1960 mov dx, 0x2c04
1963 mov es, dx
1965 add word ptr es:[bx + 0x10e3], ax
196a mov bx, si
196c imul bx, bx, 0x41
196f mov ax, 0x2c04
1972 mov es, ax
1974 push word ptr es:[bx + 0x157f]
1979 mov bx, si
197b imul bx, bx, 0x41
197e mov ax, 0x2c04
1981 mov es, ax
1983 push word ptr es:[bx + 0x157d]
1988 lcall 0x2fd6, 0x34 -> ovl24:10a1
198d add sp, 4
1990 lcall 0x2ff7, 0x7f -> ovl29:1851
1995 mov word ptr [bp - 2], ax
1998 pop di
1999 pop si
199a leave
199b retf

ovl19_199c:  ; ENTRY
199c push bp
199d mov bp, sp
199f push si
19a0 push di
19a1 mov si, word ptr [bp + 6]
19a4 push si
19a5 lcall 0x3005, 0x39 -> ovl31:07d0
19aa pop cx
19ab mov di, ax
19ad or di, di
19af jne 0x19ba
19b1 push si
19b2 nop
19b3 push cs
19b4 call 0x1a2a
19b7 pop cx
19b8 jmp 0x1a26
19ba mov ax, si
19bc imul ax, ax, 0x41
19bf add ax, 0x1581
19c2 push 0x2c04
19c5 push ax
19c6 push ds
19c7 push 0x79b ; "%s is being sacked!"
19ca push ds
19cb push 0x5c88
19ce lcall 0, 0x4944 -> 0000:4944
19d3 add sp, 0xc
19d6 push ds
19d7 push 0x5c88
19da lcall 0x3024, 0x43 -> ovl36:16b3
19df add sp, 4
19e2 push si
19e3 lcall 0x3005, 0x48 -> ovl31:0941
19e8 pop cx
19e9 push 0xa
19ec push 1
19ee lcall 0x30c1, 0x3e -> ovl59:02bf
19f3 add sp, 6
19f6 add ax, 5
19f9 mov dx, 0x2c04
19fc mov es, dx
19fe mov bx, word ptr es:[0x110]
1a03 shl bx, 1
1a05 mov dx, 0x2c04
1a08 mov es, dx
1a0a add word ptr es:[bx + 0x10e3], ax
1a0f mov ax, 0x2c04
1a12 mov es, ax
1a14 mov bx, word ptr es:[0x110]
1a19 imul bx, bx, 0x14
1a1c mov ax, 0x2c04
1a1f mov es, ax
1a21 add word ptr es:[bx + 0x185], di
1a26 pop di
1a27 pop si
1a28 pop bp
1a29 retf

ovl19_1a2a:  ; ENTRY
1a2a push bp
1a2b mov bp, sp
1a2d push si
1a2e push di
1a2f mov si, word ptr [bp + 6]
1a32 push si
1a33 lcall 0x3005, 0x3e -> ovl31:0834
1a38 pop cx
1a39 mov di, ax
1a3b or di, di
1a3d je 0x1aa8
1a3f mov ax, si
1a41 imul ax, ax, 0x41
1a44 add ax, 0x1581
1a47 push 0x2c04
1a4a push ax
1a4b push ds
1a4c push 0x7af ; "%s is being pillaged!"
1a4f push ds
1a50 push 0x5c88
1a53 lcall 0, 0x4944 -> 0000:4944
1a58 add sp, 0xc
1a5b push ds
1a5c push 0x5c88
1a5f lcall 0x3024, 0x43 -> ovl36:16b3
1a64 add sp, 4
1a67 mov ax, 0x2c04
1a6a mov es, ax
1a6c mov bx, word ptr es:[0x110]
1a71 imul bx, bx, 0x14
1a74 mov ax, 0x2c04
1a77 mov es, ax
1a79 add word ptr es:[bx + 0x185], di
1a7e push si
1a7f lcall 0x3005, 0x43 -> ovl31:0886
1a84 pop cx
1a85 push 5
1a88 push 1
1a8a lcall 0x30c1, 0x3e -> ovl59:02bf
1a8f add sp, 6
1a92 mov dx, 0x2c04
1a95 mov es, dx
1a97 mov bx, word ptr es:[0x110]
1a9c shl bx, 1
1a9e mov dx, 0x2c04
1aa1 mov es, dx
1aa3 add word ptr es:[bx + 0x10e3], ax
1aa8 pop di
1aa9 pop si
1aaa pop bp
1aab retf
