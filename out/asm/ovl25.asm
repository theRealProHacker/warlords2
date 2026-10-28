; ovl25 stub 2fdb file_off 0x51050 size 0xdce

ovl25_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  33f6             xor si, si                               
  0006  833e320800       cmp word ptr [0x832], 0                  
  000b  7508             jne 0x15                                 
  000d  6a01             push 1                                   
  000f  90               nop                                      
  0010  0e               push cs                                  
  0011  e8b104           call 0x4c5                               
  0014  59               pop cx                                   
  0015  b8042c           mov ax, 0x2c04                           
  0018  8ec0             mov es, ax                               
  001a  26a11001         mov ax, word ptr es:[0x110]              
  001e  c1e003           shl ax, 3                                
  0021  ba042c           mov dx, 0x2c04                           
  0024  8ec2             mov es, dx                               
  0026  2603061001       add ax, word ptr es:[0x110]              
  002b  ba042c           mov dx, 0x2c04                           
  002e  8bd8             mov bx, ax                               
  0030  8ec2             mov es, dx                               
  0032  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0038  b8042c           mov ax, 0x2c04                           
  003b  8ec0             mov es, ax                               
  003d  26a11001         mov ax, word ptr es:[0x110]              
  0041  c1e003           shl ax, 3                                
  0044  ba042c           mov dx, 0x2c04                           
  0047  8ec2             mov es, dx                               
  0049  2603061001       add ax, word ptr es:[0x110]              
  004e  ba042c           mov dx, 0x2c04                           
  0051  8bd8             mov bx, ax                               
  0053  8ec2             mov es, dx                               
  0055  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  005b  26808f3b1500     or byte ptr es:[bx + 0x153b], 0          
  0061  666a00           push 0                                   
  0064  9a34002031       lcall 0x3120, 0x34                       -> ovl68:0952
  0069  83c404           add sp, 4                                
  006c  90               nop                                      
  006d  0e               push cs                                  
  006e  e87505           call 0x5e6                               
  0071  c70636080100     mov word ptr [0x836], 1                  
  0077  b8042c           mov ax, 0x2c04                           
  007a  8ec0             mov es, ax                               
  007c  268b1e1001       mov bx, word ptr es:[0x110]              
  0081  c1e302           shl bx, 2                                
  0084  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  0089  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  008e  83c404           add sp, 4                                
  0091  8916f040         mov word ptr [0x40f0], dx                
  0095  a3ee40           mov word ptr [0x40ee], ax                
  0098  b8042c           mov ax, 0x2c04                           
  009b  8ec0             mov es, ax                               
  009d  26ff361001       push word ptr es:[0x110]                 
  00a2  1e               push ds                                  
  00a3  683808           push 0x838                                ; "Begin player %d"
  00a6  1e               push ds                                  
  00a7  68885c           push 0x5c88                              
  00aa  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00af  83c40a           add sp, 0xa                              
  00b2  6a00             push 0                                   
  00b4  1e               push ds                                  
  00b5  68885c           push 0x5c88                              
  00b8  90               nop                                      
  00b9  0e               push cs                                  
  00ba  e80c0d           call 0xdc9                               
  00bd  83c406           add sp, 6                                
  00c0  90               nop                                      
  00c1  0e               push cs                                  
  00c2  e8c102           call 0x386                               
  00c5  6a0a             push 0xa                                 
  00c7  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  00cc  59               pop cx                                   
  00cd  6a00             push 0                                   
  00cf  1e               push ds                                  
  00d0  684808           push 0x848                                ; "Diplomacy"
  00d3  90               nop                                      
  00d4  0e               push cs                                  
  00d5  e8f10c           call 0xdc9                               
  00d8  83c406           add sp, 6                                
  00db  9a2000b12f       lcall 0x2fb1, 0x20                       -> ovl18:0000
  00e0  6a00             push 0                                   
  00e2  1e               push ds                                  
  00e3  685208           push 0x852                                ; "move Hero"
  00e6  90               nop                                      
  00e7  0e               push cs                                  
  00e8  e8de0c           call 0xdc9                               
  00eb  83c406           add sp, 6                                
  00ee  9a2f00ef2f       lcall 0x2fef, 0x2f                       -> ovl28:0000
  00f3  6a0f             push 0xf                                 
  00f5  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  00fa  59               pop cx                                   
  00fb  6a00             push 0                                   
  00fd  1e               push ds                                  
  00fe  685c08           push 0x85c                                ; "move Search"
  0101  90               nop                                      
  0102  0e               push cs                                  
  0103  e8c30c           call 0xdc9                               
  0106  83c406           add sp, 6                                
  0109  33c0             xor ax, ax                               
  010b  8ec0             mov es, ax                               
  010d  26a01704         mov al, byte ptr es:[0x417]              
  0111  98               cwde                                     
  0112  a90300           test ax, 3                               
  0115  7534             jne 0x14b                                
  0117  b8042c           mov ax, 0x2c04                           
  011a  8ec0             mov es, ax                               
  011c  268b1e1001       mov bx, word ptr es:[0x110]              
  0121  d1e3             shl bx, 1                                
  0123  b8042c           mov ax, 0x2c04                           
  0126  8ec0             mov es, ax                               
  0128  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  012e  751b             jne 0x14b                                
  0130  b8042c           mov ax, 0x2c04                           
  0133  8ec0             mov es, ax                               
  0135  268b1e1001       mov bx, word ptr es:[0x110]              
  013a  d1e3             shl bx, 1                                
  013c  b8042c           mov ax, 0x2c04                           
  013f  8ec0             mov es, ax                               
  0141  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  0148  be0100           mov si, 1                                
  014b  b8042c           mov ax, 0x2c04                           
  014e  8ec0             mov es, ax                               
  0150  26833e240100     cmp word ptr es:[0x124], 0               
  0156  7405             je 0x15d                                 
  0158  9a2500cb2f       lcall 0x2fcb, 0x25                       -> ovl22:0284
  015d  0bf6             or si, si                                
  015f  7418             je 0x179                                 
  0161  b8042c           mov ax, 0x2c04                           
  0164  8ec0             mov es, ax                               
  0166  268b1e1001       mov bx, word ptr es:[0x110]              
  016b  d1e3             shl bx, 1                                
  016d  b8042c           mov ax, 0x2c04                           
  0170  8ec0             mov es, ax                               
  0172  26c787d0000000   mov word ptr es:[bx + 0xd0], 0           
  0179  6a14             push 0x14                                
  017b  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0180  59               pop cx                                   
  0181  6a00             push 0                                   
  0183  1e               push ds                                  
  0184  686808           push 0x868                                ; "move Explore"
  0187  90               nop                                      
  0188  0e               push cs                                  
  0189  e83d0c           call 0xdc9                               
  018c  83c406           add sp, 6                                
  018f  9a2a00cb2f       lcall 0x2fcb, 0x2a                       -> ovl22:0458
  0194  6a19             push 0x19                                
  0196  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  019b  59               pop cx                                   
  019c  6a00             push 0                                   
  019e  1e               push ds                                  
  019f  687508           push 0x875                                ; "assault"
  01a2  90               nop                                      
  01a3  0e               push cs                                  
  01a4  e8220c           call 0xdc9                               
  01a7  83c406           add sp, 6                                
  01aa  9a2000b52f       lcall 0x2fb5, 0x20                       -> ovl19:0000
  01af  6a1e             push 0x1e                                
  01b1  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  01b6  59               pop cx                                   
  01b7  6a00             push 0                                   
  01b9  1e               push ds                                  
  01ba  687d08           push 0x87d                                ; "move #1"
  01bd  90               nop                                      
  01be  0e               push cs                                  
  01bf  e8070c           call 0xdc9                               
  01c2  83c406           add sp, 6                                
  01c5  9a2000cb2f       lcall 0x2fcb, 0x20                       -> ovl22:0000
  01ca  6a28             push 0x28                                
  01cc  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  01d1  59               pop cx                                   
  01d2  6a00             push 0                                   
  01d4  1e               push ds                                  
  01d5  688508           push 0x885                                ; "rescue"
  01d8  90               nop                                      
  01d9  0e               push cs                                  
  01da  e8ec0b           call 0xdc9                               
  01dd  83c406           add sp, 6                                
  01e0  9a2f00cb2f       lcall 0x2fcb, 0x2f                       -> ovl22:0888
  01e5  6a2d             push 0x2d                                
  01e7  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  01ec  59               pop cx                                   
  01ed  6a00             push 0                                   
  01ef  1e               push ds                                  
  01f0  688c08           push 0x88c                                ; "evaluate"
  01f3  90               nop                                      
  01f4  0e               push cs                                  
  01f5  e8d10b           call 0xdc9                               
  01f8  83c406           add sp, 6                                
  01fb  b8042c           mov ax, 0x2c04                           
  01fe  8ec0             mov es, ax                               
  0200  26ff361001       push word ptr es:[0x110]                 
  0205  9a2a00c52f       lcall 0x2fc5, 0x2a                       -> ovl21:0000
  020a  59               pop cx                                   
  020b  6a32             push 0x32                                
  020d  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0212  59               pop cx                                   
  0213  6a00             push 0                                   
  0215  1e               push ds                                  
  0216  689508           push 0x895                                ; "clean city"
  0219  90               nop                                      
  021a  0e               push cs                                  
  021b  e8ab0b           call 0xdc9                               
  021e  83c406           add sp, 6                                
  0221  9a2000d62f       lcall 0x2fd6, 0x20                       -> ovl24:01f1
  0226  6a37             push 0x37                                
  0228  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  022d  59               pop cx                                   
  022e  6a00             push 0                                   
  0230  1e               push ds                                  
  0231  68a008           push 0x8a0                                ; "neutral"
  0234  90               nop                                      
  0235  0e               push cs                                  
  0236  e8900b           call 0xdc9                               
  0239  83c406           add sp, 6                                
  023c  9a2a00bd2f       lcall 0x2fbd, 0x2a                       -> ovl20:0000
  0241  6a3c             push 0x3c                                
  0243  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0248  59               pop cx                                   
  0249  6a00             push 0                                   
  024b  1e               push ds                                  
  024c  68a808           push 0x8a8                                ; "move #2"
  024f  90               nop                                      
  0250  0e               push cs                                  
  0251  e8750b           call 0xdc9                               
  0254  83c406           add sp, 6                                
  0257  9a2000cb2f       lcall 0x2fcb, 0x20                       -> ovl22:0000
  025c  6a41             push 0x41                                
  025e  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0263  59               pop cx                                   
  0264  6a00             push 0                                   
  0266  1e               push ds                                  
  0267  68b008           push 0x8b0                                ; "quick attack"
  026a  90               nop                                      
  026b  0e               push cs                                  
  026c  e85a0b           call 0xdc9                               
  026f  83c406           add sp, 6                                
  0272  9a2f00e42f       lcall 0x2fe4, 0x2f                       -> ovl26:04ba
  0277  6a00             push 0                                   
  0279  1e               push ds                                  
  027a  68bd08           push 0x8bd                                ; "update hide"
  027d  90               nop                                      
  027e  0e               push cs                                  
  027f  e8470b           call 0xdc9                               
  0282  83c406           add sp, 6                                
  0285  b8042c           mov ax, 0x2c04                           
  0288  8ec0             mov es, ax                               
  028a  26833e240100     cmp word ptr es:[0x124], 0               
  0290  7405             je 0x297                                 
  0292  9a2f00c52f       lcall 0x2fc5, 0x2f                       -> ovl21:0c1c
  0297  6a00             push 0                                   
  0299  1e               push ds                                  
  029a  68c908           push 0x8c9                                ; "assault XX"
  029d  90               nop                                      
  029e  0e               push cs                                  
  029f  e8270b           call 0xdc9                               
  02a2  83c406           add sp, 6                                
  02a5  9a2000e82f       lcall 0x2fe8, 0x20                       -> ovl27:0000
  02aa  6a46             push 0x46                                
  02ac  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  02b1  59               pop cx                                   
  02b2  6a00             push 0                                   
  02b4  1e               push ds                                  
  02b5  68d408           push 0x8d4                                ; "specials"
  02b8  90               nop                                      
  02b9  0e               push cs                                  
  02ba  e80c0b           call 0xdc9                               
  02bd  83c406           add sp, 6                                
  02c0  9a3400cb2f       lcall 0x2fcb, 0x34                       -> ovl22:10e3
  02c5  6a4b             push 0x4b                                
  02c7  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  02cc  59               pop cx                                   
  02cd  6a00             push 0                                   
  02cf  1e               push ds                                  
  02d0  68dd08           push 0x8dd                                ; "rebuilding"
  02d3  90               nop                                      
  02d4  0e               push cs                                  
  02d5  e8f10a           call 0xdc9                               
  02d8  83c406           add sp, 6                                
  02db  90               nop                                      
  02dc  0e               push cs                                  
  02dd  e81208           call 0xaf2                               
  02e0  6a50             push 0x50                                
  02e2  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  02e7  59               pop cx                                   
  02e8  6a00             push 0                                   
  02ea  1e               push ds                                  
  02eb  68e808           push 0x8e8                                ; "last rescue"
  02ee  90               nop                                      
  02ef  0e               push cs                                  
  02f0  e8d60a           call 0xdc9                               
  02f3  83c406           add sp, 6                                
  02f6  9a3e00cb2f       lcall 0x2fcb, 0x3e                       -> ovl22:0b4d
  02fb  6a55             push 0x55                                
  02fd  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0302  59               pop cx                                   
  0303  6a00             push 0                                   
  0305  1e               push ds                                  
  0306  68f408           push 0x8f4                                ; "production"
  0309  90               nop                                      
  030a  0e               push cs                                  
  030b  e8bb0a           call 0xdc9                               
  030e  83c406           add sp, 6                                
  0311  90               nop                                      
  0312  0e               push cs                                  
  0313  e8be03           call 0x6d4                               
  0316  6a5a             push 0x5a                                
  0318  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  031d  59               pop cx                                   
  031e  6a00             push 0                                   
  0320  1e               push ds                                  
  0321  68ff08           push 0x8ff                                ; "vectoring"
  0324  90               nop                                      
  0325  0e               push cs                                  
  0326  e8a00a           call 0xdc9                               
  0329  83c406           add sp, 6                                
  032c  90               nop                                      
  032d  0e               push cs                                  
  032e  e82e05           call 0x85f                               
  0331  6a5f             push 0x5f                                
  0333  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0338  59               pop cx                                   
  0339  9a48034c0a       lcall 0xa4c, 0x348                       -> 0a4c:0348
  033e  6a01             push 1                                   
  0340  1e               push ds                                  
  0341  68885c           push 0x5c88                              
  0344  90               nop                                      
  0345  0e               push cs                                  
  0346  e8800a           call 0xdc9                               
  0349  83c406           add sp, 6                                
  034c  6a64             push 0x64                                
  034e  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0353  59               pop cx                                   
  0354  c70636080000     mov word ptr [0x836], 0                  
  035a  90               nop                                      
  035b  0e               push cs                                  
  035c  e8de02           call 0x63d                               
  035f  b8042c           mov ax, 0x2c04                           
  0362  8ec0             mov es, ax                               
  0364  268b1e1001       mov bx, word ptr es:[0x110]              
  0369  c1e302           shl bx, 2                                
  036c  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  0371  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0376  83c404           add sp, 4                                
  0379  9a5700542f       lcall 0x2f54, 0x57                       -> ovl00:1063
  037e  90               nop                                      
  037f  0e               push cs                                  
  0380  e8db00           call 0x45e                               
  0383  5e               pop si                                   
  0384  5d               pop bp                                   
  0385  cb               retf                                     

ovl25_0386:  ; ENTRY
  0386  55               push bp                                  
  0387  8bec             mov bp, sp                               
  0389  56               push si                                  
  038a  c41eee40         les bx, ptr [0x40ee]                     
  038e  268b4738         mov ax, word ptr es:[bx + 0x38]          
  0392  ba042c           mov dx, 0x2c04                           
  0395  8ec2             mov es, dx                               
  0397  268b1e1001       mov bx, word ptr es:[0x110]              
  039c  d1e3             shl bx, 1                                
  039e  8987f240         mov word ptr [bx + 0x40f2], ax           
  03a2  b8042c           mov ax, 0x2c04                           
  03a5  8ec0             mov es, ax                               
  03a7  268b367b15       mov si, word ptr es:[0x157b]             
  03ac  e9a200           jmp 0x451                                
  03af  8bde             mov bx, si                               
  03b1  6bdb41           imul bx, bx, 0x41                        
  03b4  b8042c           mov ax, 0x2c04                           
  03b7  8ec0             mov es, ax                               
  03b9  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  03be  98               cwde                                     
  03bf  ba042c           mov dx, 0x2c04                           
  03c2  8ec2             mov es, dx                               
  03c4  263b061001       cmp ax, word ptr es:[0x110]              
  03c9  7403             je 0x3ce                                 
  03cb  e98300           jmp 0x451                                
  03ce  c41eee40         les bx, ptr [0x40ee]                     
  03d2  03de             add bx, si                               
  03d4  26807f560d       cmp byte ptr es:[bx + 0x56], 0xd         
  03d9  740d             je 0x3e8                                 
  03db  8b1eee40         mov bx, word ptr [0x40ee]                
  03df  03de             add bx, si                               
  03e1  26807f560b       cmp byte ptr es:[bx + 0x56], 0xb         
  03e6  751a             jne 0x402                                
  03e8  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  03ed  3d0500           cmp ax, 5                                
  03f0  7d04             jge 0x3f6                                
  03f2  b004             mov al, 4                                
  03f4  eb02             jmp 0x3f8                                
  03f6  b008             mov al, 8                                
  03f8  c41eee40         les bx, ptr [0x40ee]                     
  03fc  03de             add bx, si                               
  03fe  26884756         mov byte ptr es:[bx + 0x56], al          
  0402  b8042c           mov ax, 0x2c04                           
  0405  8ec0             mov es, ax                               
  0407  26833e280100     cmp word ptr es:[0x128], 0               
  040d  7436             je 0x445                                 
  040f  8ec0             mov es, ax                               
  0411  26833e240100     cmp word ptr es:[0x124], 0               
  0417  742c             je 0x445                                 
  0419  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  041e  3d0100           cmp ax, 1                                
  0421  750d             jne 0x430                                
  0423  c41eee40         les bx, ptr [0x40ee]                     
  0427  03de             add bx, si                               
  0429  26c647560d       mov byte ptr es:[bx + 0x56], 0xd         
  042e  eb15             jmp 0x445                                
  0430  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0435  3d0300           cmp ax, 3                                
  0438  7d0b             jge 0x445                                
  043a  c41eee40         les bx, ptr [0x40ee]                     
  043e  03de             add bx, si                               
  0440  26c647560b       mov byte ptr es:[bx + 0x56], 0xb         
  0445  c41eee40         les bx, ptr [0x40ee]                     
  0449  03de             add bx, si                               
  044b  2680a71e01fb     and byte ptr es:[bx + 0x11e], 0xfb       
  0451  8bc6             mov ax, si                               
  0453  4e               dec si                                   
  0454  0bc0             or ax, ax                                
  0456  7403             je 0x45b                                 
  0458  e954ff           jmp 0x3af                                
  045b  5e               pop si                                   
  045c  5d               pop bp                                   
  045d  cb               retf                                     

ovl25_045e:  ; ENTRY
  045e  55               push bp                                  
  045f  8bec             mov bp, sp                               
  0461  33c0             xor ax, ax                               
  0463  8ec0             mov es, ax                               
  0465  26f606170408     test byte ptr es:[0x417], 8              
  046b  750a             jne 0x477                                
  046d  8ec0             mov es, ax                               
  046f  26f606170403     test byte ptr es:[0x417], 3              
  0475  7408             je 0x47f                                 
  0477  6a00             push 0                                   
  0479  9a20000f30       lcall 0x300f, 0x20                       -> ovl33:0000
  047e  59               pop cx                                   
  047f  5d               pop bp                                   
  0480  cb               retf                                     

ovl25_0481:  ; ENTRY
  0481  55               push bp                                  
  0482  8bec             mov bp, sp                               
  0484  ba0800           mov dx, 8                                
  0487  eb2e             jmp 0x4b7                                
  0489  8bda             mov bx, dx                               
  048b  d1e3             shl bx, 1                                
  048d  b8042c           mov ax, 0x2c04                           
  0490  8ec0             mov es, ax                               
  0492  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0498  741d             je 0x4b7                                 
  049a  8bda             mov bx, dx                               
  049c  d1e3             shl bx, 1                                
  049e  b8042c           mov ax, 0x2c04                           
  04a1  53               push bx                                  
  04a2  50               push ax                                  
  04a3  837e0600         cmp word ptr [bp + 6], 0                 
  04a7  7405             je 0x4ae                                 
  04a9  b80100           mov ax, 1                                
  04ac  eb02             jmp 0x4b0                                
  04ae  33c0             xor ax, ax                               
  04b0  07               pop es                                   
  04b1  5b               pop bx                                   
  04b2  268987d000       mov word ptr es:[bx + 0xd0], ax          
  04b7  8bc2             mov ax, dx                               
  04b9  4a               dec dx                                   
  04ba  0bc0             or ax, ax                                
  04bc  75cb             jne 0x489                                
  04be  5d               pop bp                                   
  04bf  cb               retf                                     

ovl25_04c0:  ; ENTRY
  04c0  55               push bp                                  
  04c1  8bec             mov bp, sp                               
  04c3  5d               pop bp                                   
  04c4  cb               retf                                     

ovl25_04c5:  ; ENTRY
  04c5  55               push bp                                  
  04c6  8bec             mov bp, sp                               
  04c8  56               push si                                  
  04c9  c70632080100     mov word ptr [0x832], 1                  
  04cf  be0800           mov si, 8                                
  04d2  eb30             jmp 0x504                                
  04d4  666a00           push 0                                   
  04d7  6a00             push 0                                   
  04d9  66682c040000     push 0x42c                               
  04df  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  04e4  83c40a           add sp, 0xa                              
  04e7  8bde             mov bx, si                               
  04e9  c1e302           shl bx, 2                                
  04ec  8997cc40         mov word ptr [bx + 0x40cc], dx           
  04f0  8987ca40         mov word ptr [bx + 0x40ca], ax           
  04f4  0bc2             or ax, dx                                
  04f6  750c             jne 0x504                                
  04f8  1e               push ds                                  
  04f9  680909           push 0x909                                ; "No room AI memory"
  04fc  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0501  83c404           add sp, 4                                
  0504  8bc6             mov ax, si                               
  0506  4e               dec si                                   
  0507  0bc0             or ax, ax                                
  0509  75c9             jne 0x4d4                                
  050b  837e0600         cmp word ptr [bp + 6], 0                 
  050f  7405             je 0x516                                 
  0511  90               nop                                      
  0512  0e               push cs                                  
  0513  e80300           call 0x519                               
  0516  5e               pop si                                   
  0517  5d               pop bp                                   
  0518  cb               retf                                     

ovl25_0519:  ; ENTRY
  0519  55               push bp                                  
  051a  8bec             mov bp, sp                               
  051c  56               push si                                  
  051d  833e320800       cmp word ptr [0x832], 0                  
  0522  7507             jne 0x52b                                
  0524  6a00             push 0                                   
  0526  0e               push cs                                  
  0527  e89bff           call 0x4c5                               
  052a  59               pop cx                                   
  052b  be0800           mov si, 8                                
  052e  eb32             jmp 0x562                                
  0530  8bde             mov bx, si                               
  0532  c1e302           shl bx, 2                                
  0535  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  053a  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  053f  83c404           add sp, 4                                
  0542  8916f040         mov word ptr [0x40f0], dx                
  0546  a3ee40           mov word ptr [0x40ee], ax                
  0549  56               push si                                  
  054a  9a2500c52f       lcall 0x2fc5, 0x25                       -> ovl21:084d
  054f  59               pop cx                                   
  0550  8bde             mov bx, si                               
  0552  c1e302           shl bx, 2                                
  0555  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  055a  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  055f  83c404           add sp, 4                                
  0562  8bc6             mov ax, si                               
  0564  4e               dec si                                   
  0565  0bc0             or ax, ax                                
  0567  75c7             jne 0x530                                
  0569  5e               pop si                                   
  056a  5d               pop bp                                   
  056b  cb               retf                                     

ovl25_056c:  ; ENTRY
  056c  55               push bp                                  
  056d  8bec             mov bp, sp                               
  056f  56               push si                                  
  0570  8b7606           mov si, word ptr [bp + 6]                
  0573  833e320800       cmp word ptr [0x832], 0                  
  0578  7507             jne 0x581                                
  057a  6a01             push 1                                   
  057c  0e               push cs                                  
  057d  e845ff           call 0x4c5                               
  0580  59               pop cx                                   
  0581  833e360800       cmp word ptr [0x836], 0                  
  0586  7415             je 0x59d                                 
  0588  b8042c           mov ax, 0x2c04                           
  058b  8ec0             mov es, ax                               
  058d  2639361001       cmp word ptr es:[0x110], si              
  0592  7509             jne 0x59d                                
  0594  8b16f040         mov dx, word ptr [0x40f0]                
  0598  a1ee40           mov ax, word ptr [0x40ee]                
  059b  eb19             jmp 0x5b6                                
  059d  8bde             mov bx, si                               
  059f  c1e302           shl bx, 2                                
  05a2  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  05a7  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  05ac  83c404           add sp, 4                                
  05af  8916c440         mov word ptr [0x40c4], dx                
  05b3  a3c240           mov word ptr [0x40c2], ax                
  05b6  5e               pop si                                   
  05b7  5d               pop bp                                   
  05b8  cb               retf                                     

ovl25_05b9:  ; ENTRY
  05b9  55               push bp                                  
  05ba  8bec             mov bp, sp                               
  05bc  8b5606           mov dx, word ptr [bp + 6]                
  05bf  833e360800       cmp word ptr [0x836], 0                  
  05c4  740c             je 0x5d2                                 
  05c6  b8042c           mov ax, 0x2c04                           
  05c9  8ec0             mov es, ax                               
  05cb  2639161001       cmp word ptr es:[0x110], dx              
  05d0  7412             je 0x5e4                                 
  05d2  8bda             mov bx, dx                               
  05d4  c1e302           shl bx, 2                                
  05d7  66ffb7ca40       push dword ptr [bx + 0x40ca]             
  05dc  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  05e1  83c404           add sp, 4                                
  05e4  5d               pop bp                                   
  05e5  cb               retf                                     

ovl25_05e6:  ; ENTRY
  05e6  55               push bp                                  
  05e7  8bec             mov bp, sp                               
  05e9  833e340800       cmp word ptr [0x834], 0                  
  05ee  7530             jne 0x620                                
  05f0  666a00           push 0                                   
  05f3  6a00             push 0                                   
  05f5  6668b0040000     push 0x4b0                               
  05fb  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0600  83c40a           add sp, 0xa                              
  0603  8916c840         mov word ptr [0x40c8], dx                
  0607  a3c640           mov word ptr [0x40c6], ax                
  060a  0bc2             or ax, dx                                
  060c  750c             jne 0x61a                                
  060e  1e               push ds                                  
  060f  681b09           push 0x91b                                ; "No room AI Data memory"
  0612  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0617  83c404           add sp, 4                                
  061a  c70634080100     mov word ptr [0x834], 1                  
  0620  833e360800       cmp word ptr [0x836], 0                  
  0625  7514             jne 0x63b                                
  0627  66ff36c640       push dword ptr [0x40c6]                  
  062c  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0631  83c404           add sp, 4                                
  0634  8916ec40         mov word ptr [0x40ec], dx                
  0638  a3ea40           mov word ptr [0x40ea], ax                
  063b  5d               pop bp                                   
  063c  cb               retf                                     

ovl25_063d:  ; ENTRY
  063d  55               push bp                                  
  063e  8bec             mov bp, sp                               
  0640  833e360800       cmp word ptr [0x836], 0                  
  0645  750d             jne 0x654                                
  0647  66ff36c640       push dword ptr [0x40c6]                  
  064c  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0651  83c404           add sp, 4                                
  0654  5d               pop bp                                   
  0655  cb               retf                                     

ovl25_0656:  ; ENTRY
  0656  55               push bp                                  
  0657  8bec             mov bp, sp                               
  0659  56               push si                                  
  065a  57               push di                                  
  065b  8b7606           mov si, word ptr [bp + 6]                
  065e  33ff             xor di, di                               
  0660  0e               push cs                                  
  0661  e882ff           call 0x5e6                               
  0664  ba0600           mov dx, 6                                
  0667  eb5a             jmp 0x6c3                                
  0669  8bc6             mov ax, si                               
  066b  6bc006           imul ax, ax, 6                           
  066e  c41eea40         les bx, ptr [0x40ea]                     
  0672  03d8             add bx, ax                               
  0674  03da             add bx, dx                               
  0676  268a07           mov al, byte ptr es:[bx]                 
  0679  b400             mov ah, 0                                
  067b  3b4608           cmp ax, word ptr [bp + 8]                
  067e  7503             jne 0x683                                
  0680  bf0100           mov di, 1                                
  0683  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  0688  7418             je 0x6a2                                 
  068a  8bc6             mov ax, si                               
  068c  6bc006           imul ax, ax, 6                           
  068f  c41eea40         les bx, ptr [0x40ea]                     
  0693  03d8             add bx, ax                               
  0695  03da             add bx, dx                               
  0697  268a07           mov al, byte ptr es:[bx]                 
  069a  c45e0a           les bx, ptr [bp + 0xa]                   
  069d  03da             add bx, dx                               
  069f  268807           mov byte ptr es:[bx], al                 
  06a2  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  06a7  741a             je 0x6c3                                 
  06a9  8bc6             mov ax, si                               
  06ab  6bc006           imul ax, ax, 6                           
  06ae  c41eea40         les bx, ptr [0x40ea]                     
  06b2  03d8             add bx, ax                               
  06b4  03da             add bx, dx                               
  06b6  268a875802       mov al, byte ptr es:[bx + 0x258]         
  06bb  c45e0e           les bx, ptr [bp + 0xe]                   
  06be  03da             add bx, dx                               
  06c0  268807           mov byte ptr es:[bx], al                 
  06c3  8bc2             mov ax, dx                               
  06c5  4a               dec dx                                   
  06c6  0bc0             or ax, ax                                
  06c8  759f             jne 0x669                                
  06ca  0e               push cs                                  
  06cb  e86fff           call 0x63d                               
  06ce  8bc7             mov ax, di                               
  06d0  5f               pop di                                   
  06d1  5e               pop si                                   
  06d2  5d               pop bp                                   
  06d3  cb               retf                                     

ovl25_06d4:  ; ENTRY
  06d4  55               push bp                                  
  06d5  8bec             mov bp, sp                               
  06d7  56               push si                                  
  06d8  9a2a00e82f       lcall 0x2fe8, 0x2a                       -> ovl27:0aed
  06dd  b8042c           mov ax, 0x2c04                           
  06e0  8ec0             mov es, ax                               
  06e2  26833e240100     cmp word ptr es:[0x124], 0               
  06e8  7405             je 0x6ef                                 
  06ea  9a2500bd2f       lcall 0x2fbd, 0x25                       -> ovl20:02ff
  06ef  b8042c           mov ax, 0x2c04                           
  06f2  8ec0             mov es, ax                               
  06f4  268b367b15       mov si, word ptr es:[0x157b]             
  06f9  e93e01           jmp 0x83a                                
  06fc  8bde             mov bx, si                               
  06fe  6bdb41           imul bx, bx, 0x41                        
  0701  b8042c           mov ax, 0x2c04                           
  0704  8ec0             mov es, ax                               
  0706  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  070b  ba042c           mov dx, 0x2c04                           
  070e  8ec2             mov es, dx                               
  0710  263a061001       cmp al, byte ptr es:[0x110]              
  0715  7403             je 0x71a                                 
  0717  e92001           jmp 0x83a                                
  071a  8bde             mov bx, si                               
  071c  6bdb41           imul bx, bx, 0x41                        
  071f  b8042c           mov ax, 0x2c04                           
  0722  8ec0             mov es, ax                               
  0724  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  072b  8bde             mov bx, si                               
  072d  6bdb41           imul bx, bx, 0x41                        
  0730  b8042c           mov ax, 0x2c04                           
  0733  8ec0             mov es, ax                               
  0735  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  073c  8bde             mov bx, si                               
  073e  6bdb41           imul bx, bx, 0x41                        
  0741  b8042c           mov ax, 0x2c04                           
  0744  8ec0             mov es, ax                               
  0746  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  074d  56               push si                                  
  074e  9a4d00f72f       lcall 0x2ff7, 0x4d                       -> ovl29:0fd5
  0753  59               pop cx                                   
  0754  0bc0             or ax, ax                                
  0756  7403             je 0x75b                                 
  0758  e9df00           jmp 0x83a                                
  075b  b8042c           mov ax, 0x2c04                           
  075e  8ec0             mov es, ax                               
  0760  268b1e1001       mov bx, word ptr es:[0x110]              
  0765  6bdb14           imul bx, bx, 0x14                        
  0768  b8042c           mov ax, 0x2c04                           
  076b  8ec0             mov es, ax                               
  076d  2683bf850128     cmp word ptr es:[bx + 0x185], 0x28       
  0773  7d25             jge 0x79a                                
  0775  b8042c           mov ax, 0x2c04                           
  0778  8ec0             mov es, ax                               
  077a  268b1e1001       mov bx, word ptr es:[0x110]              
  077f  d1e3             shl bx, 1                                
  0781  8b87ca5d         mov ax, word ptr [bx + 0x5dca]           
  0785  ba042c           mov dx, 0x2c04                           
  0788  8ec2             mov es, dx                               
  078a  268b1e1001       mov bx, word ptr es:[0x110]              
  078f  d1e3             shl bx, 1                                
  0791  3b87da5d         cmp ax, word ptr [bx + 0x5dda]           
  0795  7d03             jge 0x79a                                
  0797  e9aa00           jmp 0x844                                
  079a  c41eee40         les bx, ptr [0x40ee]                     
  079e  03de             add bx, si                               
  07a0  268a4756         mov al, byte ptr es:[bx + 0x56]          
  07a4  b400             mov ah, 0                                
  07a6  2d0200           sub ax, 2                                
  07a9  8bd8             mov bx, ax                               
  07ab  83fb0b           cmp bx, 0xb                              
  07ae  7779             ja 0x829                                 
  07b0  d1e3             shl bx, 1                                
  07b2  2effa74708       jmp word ptr cs:[bx + 0x847]             
ovl25_07b7:  ; case
  07b7  c41eee40         les bx, ptr [0x40ee]                     
  07bb  03de             add bx, si                               
  07bd  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  07c2  b400             mov ah, 0                                
  07c4  a90200           test ax, 2                               
  07c7  7507             jne 0x7d0                                
  07c9  56               push si                                  
  07ca  9a6b00f72f       lcall 0x2ff7, 0x6b                       -> ovl29:11d5
  07cf  59               pop cx                                   
  07d0  6668ffff0000     push 0xffff                              
  07d6  6a04             push 4                                   
  07d8  eb57             jmp 0x831                                
ovl25_07da:  ; case
  07da  c41eee40         les bx, ptr [0x40ee]                     
  07de  03de             add bx, si                               
  07e0  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  07e5  b400             mov ah, 0                                
  07e7  a90200           test ax, 2                               
  07ea  75e4             jne 0x7d0                                
  07ec  ebdb             jmp 0x7c9                                
  07ee  ebe0             jmp 0x7d0                                
ovl25_07f0:  ; case
  07f0  b8042c           mov ax, 0x2c04                           
  07f3  8ec0             mov es, ax                               
  07f5  26833e1a0100     cmp word ptr es:[0x11a], 0               
  07fb  7402             je 0x7ff                                 
  07fd  eb0a             jmp 0x809                                
  07ff  6668ffff0000     push 0xffff                              
  0805  6a01             push 1                                   
  0807  eb28             jmp 0x831                                
ovl25_0809:  ; case
  0809  6668ffff0000     push 0xffff                              
  080f  6a02             push 2                                   
  0811  eb1e             jmp 0x831                                
ovl25_0813:  ; case
  0813  eb14             jmp 0x829                                
ovl25_0815:  ; case
  0815  8bde             mov bx, si                               
  0817  6bdb41           imul bx, bx, 0x41                        
  081a  b8042c           mov ax, 0x2c04                           
  081d  8ec0             mov es, ax                               
  081f  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  0825  eb13             jmp 0x83a                                
ovl25_0827:  ; case
  0827  eba7             jmp 0x7d0                                
ovl25_0829:  ; case
  0829  6668ffff0000     push 0xffff                              
  082f  6a03             push 3                                   
  0831  56               push si                                  
  0832  9a4800f72f       lcall 0x2ff7, 0x48                       -> ovl29:103d
  0837  83c408           add sp, 8                                
  083a  8bc6             mov ax, si                               
  083c  4e               dec si                                   
  083d  0bc0             or ax, ax                                
  083f  7403             je 0x844                                 
  0841  e9b8fe           jmp 0x6fc                                
  0844  5e               pop si                                   
  0845  5d               pop bp                                   
  0846  cb               retf                                     
  0847  da07f00709081308 dw 07da,07f0,0809,0813,0813,0813,0815,0829,0829,0827,0829,07b7 jump table

ovl25_085f:  ; ENTRY
  085f  55               push bp                                  
  0860  8bec             mov bp, sp                               
  0862  83ec02           sub sp, 2                                
  0865  56               push si                                  
  0866  57               push di                                  
  0867  c41eee40         les bx, ptr [0x40ee]                     
  086b  268bb74a02       mov si, word ptr es:[bx + 0x24a]         
  0870  e99800           jmp 0x90b                                
  0873  8bc6             mov ax, si                               
  0875  6bc05c           imul ax, ax, 0x5c                        
  0878  c41eee40         les bx, ptr [0x40ee]                     
  087c  03d8             add bx, ax                               
  087e  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0884  7503             jne 0x889                                
  0886  e98200           jmp 0x90b                                
  0889  8bc6             mov ax, si                               
  088b  6bc05c           imul ax, ax, 0x5c                        
  088e  8b1eee40         mov bx, word ptr [0x40ee]                
  0892  03d8             add bx, ax                               
  0894  268bbf5002       mov di, word ptr es:[bx + 0x250]         
  0899  83ffff           cmp di, -1                               
  089c  746d             je 0x90b                                 
  089e  8bdf             mov bx, di                               
  08a0  6bdb41           imul bx, bx, 0x41                        
  08a3  b8042c           mov ax, 0x2c04                           
  08a6  8ec0             mov es, ax                               
  08a8  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  08ad  98               cwde                                     
  08ae  ba042c           mov dx, 0x2c04                           
  08b1  8ec2             mov es, dx                               
  08b3  263b061001       cmp ax, word ptr es:[0x110]              
  08b8  7551             jne 0x90b                                
  08ba  c41eee40         les bx, ptr [0x40ee]                     
  08be  03df             add bx, di                               
  08c0  26c6475607       mov byte ptr es:[bx + 0x56], 7           
  08c5  c746fe0400       mov word ptr [bp - 2], 4                 
  08ca  eb35             jmp 0x901                                
  08cc  8bc6             mov ax, si                               
  08ce  6bc05c           imul ax, ax, 0x5c                        
  08d1  c41eee40         les bx, ptr [0x40ee]                     
  08d5  03d8             add bx, ax                               
  08d7  8b46fe           mov ax, word ptr [bp - 2]                
  08da  d1e0             shl ax, 1                                
  08dc  03d8             add bx, ax                               
  08de  268b975202       mov dx, word ptr es:[bx + 0x252]         
  08e3  8bc2             mov ax, dx                               
  08e5  3dffff           cmp ax, 0xffff                           
  08e8  7417             je 0x901                                 
  08ea  c41eee40         les bx, ptr [0x40ee]                     
  08ee  03da             add bx, dx                               
  08f0  26807f5606       cmp byte ptr es:[bx + 0x56], 6           
  08f5  750a             jne 0x901                                
  08f7  57               push di                                  
  08f8  52               push dx                                  
  08f9  9a4300f72f       lcall 0x2ff7, 0x43                       -> ovl29:0f10
  08fe  83c404           add sp, 4                                
  0901  8b46fe           mov ax, word ptr [bp - 2]                
  0904  ff4efe           dec word ptr [bp - 2]                    
  0907  0bc0             or ax, ax                                
  0909  75c1             jne 0x8cc                                
  090b  8bc6             mov ax, si                               
  090d  4e               dec si                                   
  090e  0bc0             or ax, ax                                
  0910  7403             je 0x915                                 
  0912  e95eff           jmp 0x873                                
  0915  5f               pop di                                   
  0916  5e               pop si                                   
  0917  c9               leave                                    
  0918  cb               retf                                     

ovl25_0919:  ; ENTRY
  0919  55               push bp                                  
  091a  8bec             mov bp, sp                               
  091c  83ec02           sub sp, 2                                
  091f  56               push si                                  
  0920  57               push di                                  
  0921  8b7e06           mov di, word ptr [bp + 6]                
  0924  c746fe0000       mov word ptr [bp - 2], 0                 
  0929  b8042c           mov ax, 0x2c04                           
  092c  8ec0             mov es, ax                               
  092e  268b367b15       mov si, word ptr es:[0x157b]             
  0933  eb69             jmp 0x99e                                
  0935  8bde             mov bx, si                               
  0937  6bdb41           imul bx, bx, 0x41                        
  093a  b8042c           mov ax, 0x2c04                           
  093d  8ec0             mov es, ax                               
  093f  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0944  98               cwde                                     
  0945  ba042c           mov dx, 0x2c04                           
  0948  8ec2             mov es, dx                               
  094a  263b061001       cmp ax, word ptr es:[0x110]              
  094f  754d             jne 0x99e                                
  0951  33d2             xor dx, dx                               
  0953  c41eee40         les bx, ptr [0x40ee]                     
  0957  03de             add bx, si                               
  0959  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  095e  7504             jne 0x964                                
  0960  6a64             push 0x64                                
  0962  eb20             jmp 0x984                                
  0964  c41eee40         les bx, ptr [0x40ee]                     
  0968  03de             add bx, si                               
  096a  26807f5602       cmp byte ptr es:[bx + 0x56], 2           
  096f  7504             jne 0x975                                
  0971  6a32             push 0x32                                
  0973  eb0f             jmp 0x984                                
  0975  c41eee40         les bx, ptr [0x40ee]                     
  0979  03de             add bx, si                               
  097b  26807f5603       cmp byte ptr es:[bx + 0x56], 3           
  0980  7512             jne 0x994                                
  0982  6a00             push 0                                   
  0984  666801006400     push 0x640001                            
  098a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  098f  83c406           add sp, 6                                
  0992  8bd0             mov dx, ax                               
  0994  3b56fe           cmp dx, word ptr [bp - 2]                
  0997  7e05             jle 0x99e                                
  0999  8956fe           mov word ptr [bp - 2], dx                
  099c  8bfe             mov di, si                               
  099e  8bc6             mov ax, si                               
  09a0  4e               dec si                                   
  09a1  0bc0             or ax, ax                                
  09a3  7590             jne 0x935                                
  09a5  8bc7             mov ax, di                               
  09a7  5f               pop di                                   
  09a8  5e               pop si                                   
  09a9  c9               leave                                    
  09aa  cb               retf                                     

ovl25_09ab:  ; ENTRY
  09ab  55               push bp                                  
  09ac  8bec             mov bp, sp                               
  09ae  b8042c           mov ax, 0x2c04                           
  09b1  8ec0             mov es, ax                               
  09b3  268b1e1001       mov bx, word ptr es:[0x110]              
  09b8  d1e3             shl bx, 1                                
  09ba  b8042c           mov ax, 0x2c04                           
  09bd  8ec0             mov es, ax                               
  09bf  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  09c5  7407             je 0x9ce                                 
  09c7  833e360800       cmp word ptr [0x836], 0                  
  09cc  7405             je 0x9d3                                 
  09ce  b80100           mov ax, 1                                
  09d1  eb02             jmp 0x9d5                                
  09d3  33c0             xor ax, ax                               
  09d5  5d               pop bp                                   
  09d6  cb               retf                                     

ovl25_09d7:  ; ENTRY
  09d7  55               push bp                                  
  09d8  8bec             mov bp, sp                               
  09da  83ec0c           sub sp, 0xc                              
  09dd  56               push si                                  
  09de  57               push di                                  
  09df  8b7606           mov si, word ptr [bp + 6]                
  09e2  c746f80000       mov word ptr [bp - 8], 0                 
  09e7  33ff             xor di, di                               
  09e9  833e320800       cmp word ptr [0x832], 0                  
  09ee  7507             jne 0x9f7                                
  09f0  6a01             push 1                                   
  09f2  0e               push cs                                  
  09f3  e8cffa           call 0x4c5                               
  09f6  59               pop cx                                   
  09f7  8b5e08           mov bx, word ptr [bp + 8]                
  09fa  69dbe000         imul bx, bx, 0xe0                        
  09fe  8bc6             mov ax, si                               
  0a00  d1e0             shl ax, 1                                
  0a02  03d8             add bx, ax                               
  0a04  b81d1e           mov ax, 0x1e1d                           
  0a07  8ec0             mov es, ax                               
  0a09  268a870100       mov al, byte ptr es:[bx + 1]             
  0a0e  250f00           and ax, 0xf                              
  0a11  8946fe           mov word ptr [bp - 2], ax                
  0a14  837efe0f         cmp word ptr [bp - 2], 0xf               
  0a18  7503             jne 0xa1d                                
  0a1a  e9d100           jmp 0xaee                                
  0a1d  8b5e08           mov bx, word ptr [bp + 8]                
  0a20  69dbe000         imul bx, bx, 0xe0                        
  0a24  8bc6             mov ax, si                               
  0a26  d1e0             shl ax, 1                                
  0a28  03d8             add bx, ax                               
  0a2a  b81d1e           mov ax, 0x1e1d                           
  0a2d  8ec0             mov es, ax                               
  0a2f  268a9f0000       mov bl, byte ptr es:[bx]                 
  0a34  81e3ff00         and bx, 0xff                             
  0a38  b8042c           mov ax, 0x2c04                           
  0a3b  8ec0             mov es, ax                               
  0a3d  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0a43  7505             jne 0xa4a                                
  0a45  b80100           mov ax, 1                                
  0a48  eb02             jmp 0xa4c                                
  0a4a  33c0             xor ax, ax                               
  0a4c  8946fc           mov word ptr [bp - 4], ax                
  0a4f  33f6             xor si, si                               
  0a51  eb2b             jmp 0xa7e                                
  0a53  8bc6             mov ax, si                               
  0a55  c1e002           shl ax, 2                                
  0a58  c45e0a           les bx, ptr [bp + 0xa]                   
  0a5b  03d8             add bx, ax                               
  0a5d  26c41f           les bx, ptr es:[bx]                      
  0a60  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0a65  750c             jne 0xa73                                
  0a67  8a842c42         mov al, byte ptr [si + 0x422c]           
  0a6b  98               cwde                                     
  0a6c  0bc0             or ax, ax                                
  0a6e  7503             jne 0xa73                                
  0a70  ff46f8           inc word ptr [bp - 8]                    
  0a73  8a842c42         mov al, byte ptr [si + 0x422c]           
  0a77  98               cwde                                     
  0a78  0bc0             or ax, ax                                
  0a7a  7501             jne 0xa7d                                
  0a7c  47               inc di                                   
  0a7d  46               inc si                                   
  0a7e  a0c542           mov al, byte ptr [0x42c5]                
  0a81  98               cwde                                     
  0a82  3bc6             cmp ax, si                               
  0a84  7fcd             jg 0xa53                                 
  0a86  c45e0e           les bx, ptr [bp + 0xe]                   
  0a89  26c41f           les bx, ptr es:[bx]                      
  0a8c  268a4705         mov al, byte ptr es:[bx + 5]             
  0a90  98               cwde                                     
  0a91  8bf0             mov si, ax                               
  0a93  a0c542           mov al, byte ptr [0x42c5]                
  0a96  98               cwde                                     
  0a97  3bc7             cmp ax, di                               
  0a99  7505             jne 0xaa0                                
  0a9b  b80100           mov ax, 1                                
  0a9e  eb02             jmp 0xaa2                                
  0aa0  33c0             xor ax, ax                               
  0aa2  8946fa           mov word ptr [bp - 6], ax                
  0aa5  ff76fe           push word ptr [bp - 2]                   
  0aa8  0e               push cs                                  
  0aa9  e8c0fa           call 0x56c                               
  0aac  59               pop cx                                   
  0aad  8956f6           mov word ptr [bp - 0xa], dx              
  0ab0  8946f4           mov word ptr [bp - 0xc], ax              
  0ab3  8bc6             mov ax, si                               
  0ab5  d1e0             shl ax, 1                                
  0ab7  c45ef4           les bx, ptr [bp - 0xc]                   
  0aba  03d8             add bx, ax                               
  0abc  8b46f8           mov ax, word ptr [bp - 8]                
  0abf  260187bc03       add word ptr es:[bx + 0x3bc], ax         
  0ac4  2601bfcc03       add word ptr es:[bx + 0x3cc], di         
  0ac9  26ff87dc03       inc word ptr es:[bx + 0x3dc]             
  0ace  8b46fa           mov ax, word ptr [bp - 6]                
  0ad1  260187ec03       add word ptr es:[bx + 0x3ec], ax         
  0ad6  837efc00         cmp word ptr [bp - 4], 0                 
  0ada  740a             je 0xae6                                 
  0adc  26ff87fc03       inc word ptr es:[bx + 0x3fc]             
  0ae1  2601870c04       add word ptr es:[bx + 0x40c], ax         
  0ae6  ff76fe           push word ptr [bp - 2]                   
  0ae9  0e               push cs                                  
  0aea  e8ccfa           call 0x5b9                               
  0aed  59               pop cx                                   
  0aee  5f               pop di                                   
  0aef  5e               pop si                                   
  0af0  c9               leave                                    
  0af1  cb               retf                                     

ovl25_0af2:  ; ENTRY
  0af2  55               push bp                                  
  0af3  8bec             mov bp, sp                               
  0af5  83ec04           sub sp, 4                                
  0af8  56               push si                                  
  0af9  c41eee40         les bx, ptr [0x40ee]                     
  0afd  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b01  ba042c           mov dx, 0x2c04                           
  0b04  8ec2             mov es, dx                               
  0b06  26f72e7b15       imul word ptr es:[0x157b]                
  0b0b  bb5000           mov bx, 0x50                             
  0b0e  99               cdq                                      
  0b0f  f7fb             idiv bx                                  
  0b11  3d0500           cmp ax, 5                                
  0b14  7d05             jge 0xb1b                                
  0b16  b80500           mov ax, 5                                
  0b19  eb18             jmp 0xb33                                
  0b1b  c41eee40         les bx, ptr [0x40ee]                     
  0b1f  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b23  ba042c           mov dx, 0x2c04                           
  0b26  8ec2             mov es, dx                               
  0b28  26f72e7b15       imul word ptr es:[0x157b]                
  0b2d  bb5000           mov bx, 0x50                             
  0b30  99               cdq                                      
  0b31  f7fb             idiv bx                                  
  0b33  8946fc           mov word ptr [bp - 4], ax                
  0b36  c41eee40         les bx, ptr [0x40ee]                     
  0b3a  26837f0e05       cmp word ptr es:[bx + 0xe], 5            
  0b3f  7d0d             jge 0xb4e                                
  0b41  26f76f0e         imul word ptr es:[bx + 0xe]              
  0b45  263b4702         cmp ax, word ptr es:[bx + 2]             
  0b49  7d03             jge 0xb4e                                
  0b4b  e98000           jmp 0xbce                                
  0b4e  b8042c           mov ax, 0x2c04                           
  0b51  8ec0             mov es, ax                               
  0b53  268b1e1001       mov bx, word ptr es:[0x110]              
  0b58  6bdb14           imul bx, bx, 0x14                        
  0b5b  b8042c           mov ax, 0x2c04                           
  0b5e  8ec0             mov es, ax                               
  0b60  2681bf8501f401   cmp word ptr es:[bx + 0x185], 0x1f4      
  0b67  7c65             jl 0xbce                                 
  0b69  b8042c           mov ax, 0x2c04                           
  0b6c  8ec0             mov es, ax                               
  0b6e  268b1e1001       mov bx, word ptr es:[0x110]              
  0b73  6bdb14           imul bx, bx, 0x14                        
  0b76  b8042c           mov ax, 0x2c04                           
  0b79  8ec0             mov es, ax                               
  0b7b  2681bf8501d007   cmp word ptr es:[bx + 0x185], 0x7d0      
  0b82  7e0a             jle 0xb8e                                
  0b84  c41eee40         les bx, ptr [0x40ee]                     
  0b88  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0b8c  eb08             jmp 0xb96                                
  0b8e  c41eee40         les bx, ptr [0x40ee]                     
  0b92  268b4710         mov ax, word ptr es:[bx + 0x10]          
  0b96  8bf0             mov si, ax                               
  0b98  50               push ax                                  
  0b99  90               nop                                      
  0b9a  0e               push cs                                  
  0b9b  e8e500           call 0xc83                               
  0b9e  59               pop cx                                   
  0b9f  8946fe           mov word ptr [bp - 2], ax                
  0ba2  3dffff           cmp ax, 0xffff                           
  0ba5  7427             je 0xbce                                 
  0ba7  b8042c           mov ax, 0x2c04                           
  0baa  8ec0             mov es, ax                               
  0bac  268b1e1001       mov bx, word ptr es:[0x110]              
  0bb1  6bdb14           imul bx, bx, 0x14                        
  0bb4  b8042c           mov ax, 0x2c04                           
  0bb7  8ec0             mov es, ax                               
  0bb9  2681bf8501f401   cmp word ptr es:[bx + 0x185], 0x1f4      
  0bc0  7c0c             jl 0xbce                                 
  0bc2  ff76fe           push word ptr [bp - 2]                   
  0bc5  56               push si                                  
  0bc6  90               nop                                      
  0bc7  0e               push cs                                  
  0bc8  e80600           call 0xbd1                               
  0bcb  83c404           add sp, 4                                
  0bce  5e               pop si                                   
  0bcf  c9               leave                                    
  0bd0  cb               retf                                     

ovl25_0bd1:  ; ENTRY
  0bd1  55               push bp                                  
  0bd2  8bec             mov bp, sp                               
  0bd4  83ec0e           sub sp, 0xe                              
  0bd7  56               push si                                  
  0bd8  57               push di                                  
  0bd9  8b7608           mov si, word ptr [bp + 8]                
  0bdc  33ff             xor di, di                               
  0bde  9a70005830       lcall 0x3058, 0x70                       -> ovl44:1128
  0be3  16               push ss                                  
  0be4  8d46f6           lea ax, [bp - 0xa]                       
  0be7  50               push ax                                  
  0be8  16               push ss                                  
  0be9  8d46f8           lea ax, [bp - 8]                         
  0bec  50               push ax                                  
  0bed  16               push ss                                  
  0bee  8d46fa           lea ax, [bp - 6]                         
  0bf1  50               push ax                                  
  0bf2  16               push ss                                  
  0bf3  8d46fc           lea ax, [bp - 4]                         
  0bf6  50               push ax                                  
  0bf7  16               push ss                                  
  0bf8  8d46fe           lea ax, [bp - 2]                         
  0bfb  50               push ax                                  
  0bfc  ff7606           push word ptr [bp + 6]                   
  0bff  9a8e005830       lcall 0x3058, 0x8e                       -> ovl44:138f
  0c04  83c416           add sp, 0x16                             
  0c07  8946f4           mov word ptr [bp - 0xc], ax              
  0c0a  8346f81e         add word ptr [bp - 8], 0x1e              
  0c0e  b8042c           mov ax, 0x2c04                           
  0c11  8ec0             mov es, ax                               
  0c13  268b1e1001       mov bx, word ptr es:[0x110]              
  0c18  6bdb14           imul bx, bx, 0x14                        
  0c1b  b8042c           mov ax, 0x2c04                           
  0c1e  8ec0             mov es, ax                               
  0c20  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0c25  3b46f8           cmp ax, word ptr [bp - 8]                
  0c28  7e4e             jle 0xc78                                
  0c2a  bf0100           mov di, 1                                
  0c2d  56               push si                                  
  0c2e  9a8900f72f       lcall 0x2ff7, 0x89                       -> ovl29:1ae9
  0c33  59               pop cx                                   
  0c34  8946f2           mov word ptr [bp - 0xe], ax              
  0c37  ff76f4           push word ptr [bp - 0xc]                 
  0c3a  50               push ax                                  
  0c3b  56               push si                                  
  0c3c  9a93005830       lcall 0x3058, 0x93                       -> ovl44:1299
  0c41  83c406           add sp, 6                                
  0c44  c41eee40         les bx, ptr [0x40ee]                     
  0c48  26ff4716         inc word ptr es:[bx + 0x16]              
  0c4c  8bde             mov bx, si                               
  0c4e  6bdb41           imul bx, bx, 0x41                        
  0c51  b8042c           mov ax, 0x2c04                           
  0c54  8ec0             mov es, ax                               
  0c56  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  0c5c  8bde             mov bx, si                               
  0c5e  6bdb41           imul bx, bx, 0x41                        
  0c61  b8042c           mov ax, 0x2c04                           
  0c64  8ec0             mov es, ax                               
  0c66  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0c6d  c41eee40         les bx, ptr [0x40ee]                     
  0c71  03de             add bx, si                               
  0c73  26c6475605       mov byte ptr es:[bx + 0x56], 5           
  0c78  9a75005830       lcall 0x3058, 0x75                       -> ovl44:11e2
  0c7d  8bc7             mov ax, di                               
  0c7f  5f               pop di                                   
  0c80  5e               pop si                                   
  0c81  c9               leave                                    
  0c82  cb               retf                                     

ovl25_0c83:  ; ENTRY
  0c83  55               push bp                                  
  0c84  8bec             mov bp, sp                               
  0c86  83ec08           sub sp, 8                                
  0c89  56               push si                                  
  0c8a  57               push di                                  
  0c8b  c746faffff       mov word ptr [bp - 6], 0xffff            
  0c90  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  0c95  b8042c           mov ax, 0x2c04                           
  0c98  8ec0             mov es, ax                               
  0c9a  268b367b15       mov si, word ptr es:[0x157b]             
  0c9f  e9fc00           jmp 0xd9e                                
  0ca2  8bde             mov bx, si                               
  0ca4  6bdb41           imul bx, bx, 0x41                        
  0ca7  b8042c           mov ax, 0x2c04                           
  0caa  8ec0             mov es, ax                               
  0cac  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0cb1  ba042c           mov dx, 0x2c04                           
  0cb4  8ec2             mov es, dx                               
  0cb6  263a061001       cmp al, byte ptr es:[0x110]              
  0cbb  7403             je 0xcc0                                 
  0cbd  e9de00           jmp 0xd9e                                
  0cc0  ba0400           mov dx, 4                                
  0cc3  eb15             jmp 0xcda                                
  0cc5  8bde             mov bx, si                               
  0cc7  6bdb41           imul bx, bx, 0x41                        
  0cca  03da             add bx, dx                               
  0ccc  b8042c           mov ax, 0x2c04                           
  0ccf  8ec0             mov es, ax                               
  0cd1  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0cd6  98               cwde                                     
  0cd7  3b4606           cmp ax, word ptr [bp + 6]                
  0cda  8bc2             mov ax, dx                               
  0cdc  4a               dec dx                                   
  0cdd  0bc0             or ax, ax                                
  0cdf  75e4             jne 0xcc5                                
  0ce1  33ff             xor di, di                               
  0ce3  c746fc0000       mov word ptr [bp - 4], 0                 
  0ce8  c41eee40         les bx, ptr [0x40ee]                     
  0cec  03de             add bx, si                               
  0cee  268a4756         mov al, byte ptr es:[bx + 0x56]          
  0cf2  b400             mov ah, 0                                
  0cf4  2d0200           sub ax, 2                                
  0cf7  8bd8             mov bx, ax                               
  0cf9  83fb0c           cmp bx, 0xc                              
  0cfc  7771             ja 0xd6f                                 
  0cfe  d1e3             shl bx, 1                                
  0d00  2effa7af0d       jmp word ptr cs:[bx + 0xdaf]             
ovl25_0d05:  ; case
  0d05  16               push ss                                  
  0d06  8d46fe           lea ax, [bp - 2]                         
  0d09  50               push ax                                  
  0d0a  56               push si                                  
  0d0b  9a8400f72f       lcall 0x2ff7, 0x84                       -> ovl29:1a4d
  0d10  83c406           add sp, 6                                
  0d13  0bc0             or ax, ax                                
  0d15  7558             jne 0xd6f                                
  0d17  c41eee40         les bx, ptr [0x40ee]                     
  0d1b  03de             add bx, si                               
  0d1d  26c647560e       mov byte ptr es:[bx + 0x56], 0xe         
  0d22  bf0100           mov di, 1                                
  0d25  eb48             jmp 0xd6f                                
ovl25_0d27:  ; case
  0d27  16               push ss                                  
  0d28  8d46fe           lea ax, [bp - 2]                         
  0d2b  50               push ax                                  
  0d2c  56               push si                                  
  0d2d  9a8400f72f       lcall 0x2ff7, 0x84                       -> ovl29:1a4d
  0d32  83c406           add sp, 6                                
  0d35  0bc0             or ax, ax                                
  0d37  74e9             je 0xd22                                 
  0d39  c41eee40         les bx, ptr [0x40ee]                     
  0d3d  03de             add bx, si                               
  0d3f  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  0d44  eb29             jmp 0xd6f                                
  0d46  ebda             jmp 0xd22                                
ovl25_0d48:  ; case
  0d48  c41eee40         les bx, ptr [0x40ee]                     
  0d4c  03de             add bx, si                               
  0d4e  2680bfba0004     cmp byte ptr es:[bx + 0xba], 4           
  0d54  7219             jb 0xd6f                                 
  0d56  c746fc0400       mov word ptr [bp - 4], 4                 
ovl25_0d5b:  ; case
  0d5b  16               push ss                                  
  0d5c  8d46fe           lea ax, [bp - 2]                         
  0d5f  50               push ax                                  
  0d60  56               push si                                  
  0d61  9a8400f72f       lcall 0x2ff7, 0x84                       -> ovl29:1a4d
  0d66  83c406           add sp, 6                                
  0d69  0bc0             or ax, ax                                
  0d6b  7502             jne 0xd6f                                
  0d6d  ebb3             jmp 0xd22                                
ovl25_0d6f:  ; case
  0d6f  0bff             or di, di                                
  0d71  742b             je 0xd9e                                 
  0d73  c41eee40         les bx, ptr [0x40ee]                     
  0d77  03de             add bx, si                               
  0d79  268a87ba00       mov al, byte ptr es:[bx + 0xba]          
  0d7e  b400             mov ah, 0                                
  0d80  2b46fc           sub ax, word ptr [bp - 4]                
  0d83  3b46f8           cmp ax, word ptr [bp - 8]                
  0d86  7e16             jle 0xd9e                                
  0d88  8976fa           mov word ptr [bp - 6], si                
  0d8b  8b1eee40         mov bx, word ptr [0x40ee]                
  0d8f  03de             add bx, si                               
  0d91  268a87ba00       mov al, byte ptr es:[bx + 0xba]          
  0d96  b400             mov ah, 0                                
  0d98  2b46fc           sub ax, word ptr [bp - 4]                
  0d9b  8946f8           mov word ptr [bp - 8], ax                
  0d9e  8bc6             mov ax, si                               
  0da0  4e               dec si                                   
  0da1  0bc0             or ax, ax                                
  0da3  7403             je 0xda8                                 
  0da5  e9fafe           jmp 0xca2                                
  0da8  8b46fa           mov ax, word ptr [bp - 6]                
  0dab  5f               pop di                                   
  0dac  5e               pop si                                   
  0dad  c9               leave                                    
  0dae  cb               retf                                     
  0daf  480d480d5b0d5b0d dw 0d48,0d48,0d5b,0d5b,0d6f,0d6f,0d05,0d6f,0d6f,0d6f,0d6f,0d6f,0d27 jump table

ovl25_0dc9:  ; ENTRY
  0dc9  55               push bp                                  
  0dca  8bec             mov bp, sp                               
  0dcc  5d               pop bp                                   
  0dcd  cb               retf                                     
