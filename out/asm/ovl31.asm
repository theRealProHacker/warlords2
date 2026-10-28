; ovl31 stub 3005 file_off 0x57af0 size 0xa09

ovl31_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  81eca000         sub sp, 0xa0                             
  0007  56               push si                                  
  0008  57               push di                                  
  0009  8b560e           mov dx, word ptr [bp + 0xe]              
  000c  8b7610           mov si, word ptr [bp + 0x10]             
  000f  b8042c           mov ax, 0x2c04                           
  0012  8ec0             mov es, ax                               
  0014  268b3e1001       mov di, word ptr es:[0x110]              
  0019  c7063e0a0100     mov word ptr [0xa3e], 1                  
  001f  83fa0f           cmp dx, 0xf                              
  0022  7508             jne 0x2c                                 
  0024  8ec0             mov es, ax                               
  0026  26a11001         mov ax, word ptr es:[0x110]              
  002a  eb02             jmp 0x2e                                 
  002c  8bc2             mov ax, dx                               
  002e  a33a0a           mov word ptr [0xa3a], ax                 
  0031  89363c0a         mov word ptr [0xa3c], si                 
  0035  66ff7606         push dword ptr [bp + 6]                  
  0039  66684200ffff     push 0xffff0042                          
  003f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0044  83c404           add sp, 4                                
  0047  52               push dx                                  
  0048  50               push ax                                  
  0049  16               push ss                                  
  004a  8d46b0           lea ax, [bp - 0x50]                      
  004d  50               push ax                                  
  004e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0053  83c40c           add sp, 0xc                              
  0056  66ff760a         push dword ptr [bp + 0xa]                
  005a  66684300ffff     push 0xffff0043                          
  0060  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0065  83c404           add sp, 4                                
  0068  52               push dx                                  
  0069  50               push ax                                  
  006a  16               push ss                                  
  006b  8d8660ff         lea ax, [bp - 0xa0]                      
  006f  50               push ax                                  
  0070  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0075  83c40c           add sp, 0xc                              
  0078  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  007d  6a07             push 7                                   
  007f  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0084  59               pop cx                                   
  0085  666800000300     push 0x30000                             
  008b  666801000f00     push 0xf0001                             
  0091  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0096  83c408           add sp, 8                                
  0099  666a41           push 0x41                                
  009c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00a1  83c404           add sp, 4                                
  00a4  52               push dx                                  
  00a5  50               push ax                                  
  00a6  66ff36400a       push dword ptr [0xa40]                   
  00ab  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00b0  83c408           add sp, 8                                
  00b3  666800000300     push 0x30000                             
  00b9  666802000f00     push 0xf0002                             
  00bf  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  00c4  83c408           add sp, 8                                
  00c7  16               push ss                                  
  00c8  8d46b0           lea ax, [bp - 0x50]                      
  00cb  50               push ax                                  
  00cc  66ff36440a       push dword ptr [0xa44]                   
  00d1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00d6  83c408           add sp, 8                                
  00d9  16               push ss                                  
  00da  8d8660ff         lea ax, [bp - 0xa0]                      
  00de  50               push ax                                  
  00df  66ff36480a       push dword ptr [0xa48]                   
  00e4  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00e9  83c408           add sp, 8                                
  00ec  666841000100     push 0x10041                             
  00f2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00f7  83c404           add sp, 4                                
  00fa  52               push dx                                  
  00fb  50               push ax                                  
  00fc  66ff364c0a       push dword ptr [0xa4c]                   
  0101  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0106  83c408           add sp, 8                                
  0109  666841000200     push 0x20041                             
  010f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0114  83c404           add sp, 4                                
  0117  52               push dx                                  
  0118  50               push ax                                  
  0119  66ff36500a       push dword ptr [0xa50]                   
  011e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0123  83c408           add sp, 8                                
  0126  6a0b             push 0xb                                 
  0128  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  012d  59               pop cx                                   
  012e  c7066a160100     mov word ptr [0x166a], 1                 
  0134  66681c011d01     push 0x11d011c                           
  013a  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  013f  83c404           add sp, 4                                
  0142  66681b011d01     push 0x11d011b                           
  0148  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  014d  83c404           add sp, 4                                
  0150  66681e011d01     push 0x11d011e                           
  0156  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  015b  83c404           add sp, 4                                
  015e  b8042c           mov ax, 0x2c04                           
  0161  8ec0             mov es, ax                               
  0163  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0169  7503             jne 0x16e                                
  016b  e9a200           jmp 0x210                                
  016e  8bdf             mov bx, di                               
  0170  6bdb0c           imul bx, bx, 0xc                         
  0173  b8042c           mov ax, 0x2c04                           
  0176  8ec0             mov es, ax                               
  0178  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  017e  7503             jne 0x183                                
  0180  e98d00           jmp 0x210                                
  0183  8bdf             mov bx, di                               
  0185  6bdb0c           imul bx, bx, 0xc                         
  0188  b8042c           mov ax, 0x2c04                           
  018b  8ec0             mov es, ax                               
  018d  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  0192  6bc016           imul ax, ax, 0x16                        
  0195  ba1d1e           mov dx, 0x1e1d                           
  0198  bb0000           mov bx, 0                                
  019b  81c38088         add bx, 0x8880                           
  019f  03c3             add ax, bx                               
  01a1  3b16605e         cmp dx, word ptr [0x5e60]                
  01a5  7569             jne 0x210                                
  01a7  3b065e5e         cmp ax, word ptr [0x5e5e]                
  01ab  7563             jne 0x210                                
  01ad  8bdf             mov bx, di                               
  01af  6bdb0c           imul bx, bx, 0xc                         
  01b2  b8042c           mov ax, 0x2c04                           
  01b5  8ec0             mov es, ax                               
  01b7  2683bf051105     cmp word ptr es:[bx + 0x1105], 5         
  01bd  7516             jne 0x1d5                                
  01bf  8bdf             mov bx, di                               
  01c1  6bdb0c           imul bx, bx, 0xc                         
  01c4  b8042c           mov ax, 0x2c04                           
  01c7  8ec0             mov es, ax                               
  01c9  2639b70911       cmp word ptr es:[bx + 0x1109], si        
  01ce  7505             jne 0x1d5                                
  01d0  681c01           push 0x11c                               
  01d3  eb30             jmp 0x205                                
  01d5  8bdf             mov bx, di                               
  01d7  6bdb0c           imul bx, bx, 0xc                         
  01da  b8042c           mov ax, 0x2c04                           
  01dd  8ec0             mov es, ax                               
  01df  2683bf051106     cmp word ptr es:[bx + 0x1105], 6         
  01e5  7529             jne 0x210                                
  01e7  56               push si                                  
  01e8  90               nop                                      
  01e9  0e               push cs                                  
  01ea  e8e305           call 0x7d0                               
  01ed  59               pop cx                                   
  01ee  0bc0             or ax, ax                                
  01f0  7405             je 0x1f7                                 
  01f2  681e01           push 0x11e                               
  01f5  eb0e             jmp 0x205                                
  01f7  56               push si                                  
  01f8  90               nop                                      
  01f9  0e               push cs                                  
  01fa  e83706           call 0x834                               
  01fd  59               pop cx                                   
  01fe  0bc0             or ax, ax                                
  0200  740e             je 0x210                                 
  0202  681b01           push 0x11b                               
  0205  681d01           push 0x11d                               
  0208  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  020d  83c404           add sp, 4                                
  0210  66681d010100     push 0x1011d                             
  0216  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  021b  83c404           add sp, 4                                
  021e  56               push si                                  
  021f  90               nop                                      
  0220  0e               push cs                                  
  0221  e81006           call 0x834                               
  0224  59               pop cx                                   
  0225  0bc0             or ax, ax                                
  0227  7404             je 0x22d                                 
  0229  6a01             push 1                                   
  022b  eb02             jmp 0x22f                                
  022d  6a02             push 2                                   
  022f  681b01           push 0x11b                               
  0232  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0237  83c404           add sp, 4                                
  023a  56               push si                                  
  023b  90               nop                                      
  023c  0e               push cs                                  
  023d  e89005           call 0x7d0                               
  0240  59               pop cx                                   
  0241  0bc0             or ax, ax                                
  0243  7404             je 0x249                                 
  0245  6a01             push 1                                   
  0247  eb02             jmp 0x24b                                
  0249  6a02             push 2                                   
  024b  681e01           push 0x11e                               
  024e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0253  83c404           add sp, 4                                
  0256  66681c010100     push 0x1011c                             
  025c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0261  83c404           add sp, 4                                
  0264  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0269  b8042c           mov ax, 0x2c04                           
  026c  8ec0             mov es, ax                               
  026e  26833e2e0100     cmp word ptr es:[0x12e], 0               
  0274  7425             je 0x29b                                 
  0276  833e540a00       cmp word ptr [0xa54], 0                  
  027b  751e             jne 0x29b                                
  027d  c706540a0100     mov word ptr [0xa54], 1                  
  0283  666819000a00     push 0xa0019                             
  0289  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  028e  83c404           add sp, 4                                
  0291  52               push dx                                  
  0292  50               push ax                                  
  0293  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0298  83c404           add sp, 4                                
  029b  5f               pop di                                   
  029c  5e               pop si                                   
  029d  c9               leave                                    
  029e  cb               retf                                     

ovl31_029f:  ; ENTRY
  029f  55               push bp                                  
  02a0  8bec             mov bp, sp                               
  02a2  83ec50           sub sp, 0x50                             
  02a5  a13c0a           mov ax, word ptr [0xa3c]                 
  02a8  6bc041           imul ax, ax, 0x41                        
  02ab  058115           add ax, 0x1581                           
  02ae  68042c           push 0x2c04                              
  02b1  50               push ax                                  
  02b2  1e               push ds                                  
  02b3  68560a           push 0xa56                                ; "%s is in ruins!"
  02b6  16               push ss                                  
  02b7  8d46b0           lea ax, [bp - 0x50]                      
  02ba  50               push ax                                  
  02bb  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02c0  83c40c           add sp, 0xc                              
  02c3  16               push ss                                  
  02c4  8d46b0           lea ax, [bp - 0x50]                      
  02c7  50               push ax                                  
  02c8  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  02cd  83c404           add sp, 4                                
  02d0  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  02d5  833e3e0a00       cmp word ptr [0xa3e], 0                  
  02da  7404             je 0x2e0                                 
  02dc  33c0             xor ax, ax                               
  02de  eb03             jmp 0x2e3                                
  02e0  b80100           mov ax, 1                                
  02e3  50               push ax                                  
  02e4  8b1e3c0a         mov bx, word ptr [0xa3c]                 
  02e8  6bdb41           imul bx, bx, 0x41                        
  02eb  b8042c           mov ax, 0x2c04                           
  02ee  8ec0             mov es, ax                               
  02f0  26ffb77f15       push word ptr es:[bx + 0x157f]           
  02f5  8b1e3c0a         mov bx, word ptr [0xa3c]                 
  02f9  6bdb41           imul bx, bx, 0x41                        
  02fc  b8042c           mov ax, 0x2c04                           
  02ff  8ec0             mov es, ax                               
  0301  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0306  9a34000b30       lcall 0x300b, 0x34                       -> ovl32:016b
  030b  83c406           add sp, 6                                
  030e  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0313  666a01           push 1                                   
  0316  6a01             push 1                                   
  0318  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  031d  83c406           add sp, 6                                
  0320  c7063e0a0000     mov word ptr [0xa3e], 0                  
  0326  666a0f           push 0xf                                 
  0329  6a01             push 1                                   
  032b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0330  83c406           add sp, 6                                
  0333  050a00           add ax, 0xa                              
  0336  ba042c           mov dx, 0x2c04                           
  0339  8ec2             mov es, dx                               
  033b  268b1e1001       mov bx, word ptr es:[0x110]              
  0340  d1e3             shl bx, 1                                
  0342  ba042c           mov dx, 0x2c04                           
  0345  8ec2             mov es, dx                               
  0347  260187e310       add word ptr es:[bx + 0x10e3], ax        
  034c  666a00           push 0                                   
  034f  666a00           push 0                                   
  0352  6a02             push 2                                   
  0354  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  0359  83c40a           add sp, 0xa                              
  035c  c9               leave                                    
  035d  cb               retf                                     

ovl31_035e:  ; ENTRY
  035e  55               push bp                                  
  035f  8bec             mov bp, sp                               
  0361  56               push si                                  
  0362  ff363c0a         push word ptr [0xa3c]                    
  0366  90               nop                                      
  0367  0e               push cs                                  
  0368  e86504           call 0x7d0                               
  036b  59               pop cx                                   
  036c  8bf0             mov si, ax                               
  036e  ff363c0a         push word ptr [0xa3c]                    
  0372  90               nop                                      
  0373  0e               push cs                                  
  0374  e8ca05           call 0x941                               
  0377  59               pop cx                                   
  0378  b8042c           mov ax, 0x2c04                           
  037b  8ec0             mov es, ax                               
  037d  268b1e1001       mov bx, word ptr es:[0x110]              
  0382  6bdb14           imul bx, bx, 0x14                        
  0385  b8042c           mov ax, 0x2c04                           
  0388  8ec0             mov es, ax                               
  038a  2601b78501       add word ptr es:[bx + 0x185], si         
  038f  b8042c           mov ax, 0x2c04                           
  0392  8ec0             mov es, ax                               
  0394  268b1e1001       mov bx, word ptr es:[0x110]              
  0399  d1e3             shl bx, 1                                
  039b  b8042c           mov ax, 0x2c04                           
  039e  8ec0             mov es, ax                               
  03a0  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  03a6  751e             jne 0x3c6                                
  03a8  6a01             push 1                                   
  03aa  90               nop                                      
  03ab  0e               push cs                                  
  03ac  e85901           call 0x508                               
  03af  59               pop cx                                   
  03b0  666800000100     push 0x10000                             
  03b6  6a00             push 0                                   
  03b8  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  03bd  83c406           add sp, 6                                
  03c0  c7063e0a0000     mov word ptr [0xa3e], 0                  
  03c6  666a0a           push 0xa                                 
  03c9  6a01             push 1                                   
  03cb  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  03d0  83c406           add sp, 6                                
  03d3  050500           add ax, 5                                
  03d6  ba042c           mov dx, 0x2c04                           
  03d9  8ec2             mov es, dx                               
  03db  268b1e1001       mov bx, word ptr es:[0x110]              
  03e0  d1e3             shl bx, 1                                
  03e2  ba042c           mov dx, 0x2c04                           
  03e5  8ec2             mov es, dx                               
  03e7  260187e310       add word ptr es:[bx + 0x10e3], ax        
  03ec  666a00           push 0                                   
  03ef  56               push si                                  
  03f0  666a01           push 1                                   
  03f3  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  03f8  83c40a           add sp, 0xa                              
  03fb  5e               pop si                                   
  03fc  5d               pop bp                                   
  03fd  cb               retf                                     

ovl31_03fe:  ; ENTRY
  03fe  55               push bp                                  
  03ff  8bec             mov bp, sp                               
  0401  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0406  666800000100     push 0x10000                             
  040c  6a00             push 0                                   
  040e  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  0413  83c406           add sp, 6                                
  0416  c7063e0a0000     mov word ptr [0xa3e], 0                  
  041c  680530           push 0x3005                              
  041f  684d00           push 0x4d                                
  0422  666a00           push 0                                   
  0425  6a04             push 4                                   
  0427  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  042c  83c40a           add sp, 0xa                              
  042f  0bc0             or ax, ax                                
  0431  7505             jne 0x438                                
  0433  90               nop                                      
  0434  0e               push cs                                  
  0435  e80200           call 0x43a                               
  0438  5d               pop bp                                   
  0439  cb               retf                                     

ovl31_043a:  ; ENTRY
  043a  55               push bp                                  
  043b  8bec             mov bp, sp                               
  043d  8b1e3c0a         mov bx, word ptr [0xa3c]                 
  0441  6bdb41           imul bx, bx, 0x41                        
  0444  b8042c           mov ax, 0x2c04                           
  0447  8ec0             mov es, ax                               
  0449  26ffb77f15       push word ptr es:[bx + 0x157f]           
  044e  8b1e3c0a         mov bx, word ptr [0xa3c]                 
  0452  6bdb41           imul bx, bx, 0x41                        
  0455  b8042c           mov ax, 0x2c04                           
  0458  8ec0             mov es, ax                               
  045a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  045f  6a02             push 2                                   
  0461  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  0466  83c406           add sp, 6                                
  0469  5d               pop bp                                   
  046a  cb               retf                                     

ovl31_046b:  ; ENTRY
  046b  55               push bp                                  
  046c  8bec             mov bp, sp                               
  046e  56               push si                                  
  046f  ff363c0a         push word ptr [0xa3c]                    
  0473  90               nop                                      
  0474  0e               push cs                                  
  0475  e8bc03           call 0x834                               
  0478  59               pop cx                                   
  0479  8bf0             mov si, ax                               
  047b  b8042c           mov ax, 0x2c04                           
  047e  8ec0             mov es, ax                               
  0480  268b1e1001       mov bx, word ptr es:[0x110]              
  0485  6bdb14           imul bx, bx, 0x14                        
  0488  b8042c           mov ax, 0x2c04                           
  048b  8ec0             mov es, ax                               
  048d  2601b78501       add word ptr es:[bx + 0x185], si         
  0492  ff363c0a         push word ptr [0xa3c]                    
  0496  90               nop                                      
  0497  0e               push cs                                  
  0498  e8eb03           call 0x886                               
  049b  59               pop cx                                   
  049c  b8042c           mov ax, 0x2c04                           
  049f  8ec0             mov es, ax                               
  04a1  268b1e1001       mov bx, word ptr es:[0x110]              
  04a6  d1e3             shl bx, 1                                
  04a8  b8042c           mov ax, 0x2c04                           
  04ab  8ec0             mov es, ax                               
  04ad  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  04b3  751e             jne 0x4d3                                
  04b5  6a00             push 0                                   
  04b7  90               nop                                      
  04b8  0e               push cs                                  
  04b9  e84c00           call 0x508                               
  04bc  59               pop cx                                   
  04bd  666800000100     push 0x10000                             
  04c3  6a00             push 0                                   
  04c5  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  04ca  83c406           add sp, 6                                
  04cd  c7063e0a0000     mov word ptr [0xa3e], 0                  
  04d3  666a05           push 5                                   
  04d6  6a01             push 1                                   
  04d8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04dd  83c406           add sp, 6                                
  04e0  ba042c           mov dx, 0x2c04                           
  04e3  8ec2             mov es, dx                               
  04e5  268b1e1001       mov bx, word ptr es:[0x110]              
  04ea  d1e3             shl bx, 1                                
  04ec  ba042c           mov dx, 0x2c04                           
  04ef  8ec2             mov es, dx                               
  04f1  260187e310       add word ptr es:[bx + 0x10e3], ax        
  04f6  666a00           push 0                                   
  04f9  56               push si                                  
  04fa  666a01           push 1                                   
  04fd  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  0502  83c40a           add sp, 0xa                              
  0505  5e               pop si                                   
  0506  5d               pop bp                                   
  0507  cb               retf                                     

ovl31_0508:  ; ENTRY
  0508  55               push bp                                  
  0509  8bec             mov bp, sp                               
  050b  81ec9600         sub sp, 0x96                             
  050f  56               push si                                  
  0510  8b7606           mov si, word ptr [bp + 6]                
  0513  6a0c             push 0xc                                 
  0515  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  051a  59               pop cx                                   
  051b  666800000300     push 0x30000                             
  0521  666801000f00     push 0xf0001                             
  0527  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  052c  83c408           add sp, 8                                
  052f  56               push si                                  
  0530  6a44             push 0x44                                
  0532  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0537  83c404           add sp, 4                                
  053a  52               push dx                                  
  053b  50               push ax                                  
  053c  666840014000     push 0x400140                            
  0542  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0547  83c408           add sp, 8                                
  054a  666800000300     push 0x30000                             
  0550  666802000f00     push 0xf0002                             
  0556  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  055b  83c408           add sp, 8                                
  055e  a13c0a           mov ax, word ptr [0xa3c]                 
  0561  6bc041           imul ax, ax, 0x41                        
  0564  058115           add ax, 0x1581                           
  0567  68042c           push 0x2c04                              
  056a  50               push ax                                  
  056b  56               push si                                  
  056c  6a45             push 0x45                                
  056e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0573  83c404           add sp, 4                                
  0576  52               push dx                                  
  0577  50               push ax                                  
  0578  16               push ss                                  
  0579  8d46a8           lea ax, [bp - 0x58]                      
  057c  50               push ax                                  
  057d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0582  83c40c           add sp, 0xc                              
  0585  16               push ss                                  
  0586  8d46a8           lea ax, [bp - 0x58]                      
  0589  50               push ax                                  
  058a  666840017300     push 0x730140                            
  0590  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0595  83c408           add sp, 8                                
  0598  ff361441         push word ptr [0x4114]                   
  059c  666a46           push 0x46                                
  059f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05a4  83c404           add sp, 4                                
  05a7  52               push dx                                  
  05a8  50               push ax                                  
  05a9  16               push ss                                  
  05aa  8d46a8           lea ax, [bp - 0x58]                      
  05ad  50               push ax                                  
  05ae  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  05b3  83c40a           add sp, 0xa                              
  05b6  16               push ss                                  
  05b7  8d46a8           lea ax, [bp - 0x58]                      
  05ba  50               push ax                                  
  05bb  666840018700     push 0x870140                            
  05c1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  05c6  83c408           add sp, 8                                
  05c9  ff361841         push word ptr [0x4118]                   
  05cd  833e184101       cmp word ptr [0x4118], 1                 
  05d2  7405             je 0x5d9                                 
  05d4  b80100           mov ax, 1                                
  05d7  eb02             jmp 0x5db                                
  05d9  33c0             xor ax, ax                               
  05db  50               push ax                                  
  05dc  6a47             push 0x47                                
  05de  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05e3  83c404           add sp, 4                                
  05e6  52               push dx                                  
  05e7  50               push ax                                  
  05e8  16               push ss                                  
  05e9  8d46a8           lea ax, [bp - 0x58]                      
  05ec  50               push ax                                  
  05ed  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  05f2  83c40a           add sp, 0xa                              
  05f5  16               push ss                                  
  05f6  8d46a8           lea ax, [bp - 0x58]                      
  05f9  50               push ax                                  
  05fa  66684001a500     push 0xa50140                            
  0600  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0605  83c408           add sp, 8                                
  0608  ff361641         push word ptr [0x4116]                   
  060c  833e164101       cmp word ptr [0x4116], 1                 
  0611  7405             je 0x618                                 
  0613  b80100           mov ax, 1                                
  0616  eb02             jmp 0x61a                                
  0618  33c0             xor ax, ax                               
  061a  50               push ax                                  
  061b  6a48             push 0x48                                
  061d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0622  83c404           add sp, 4                                
  0625  52               push dx                                  
  0626  50               push ax                                  
  0627  16               push ss                                  
  0628  8d46a8           lea ax, [bp - 0x58]                      
  062b  50               push ax                                  
  062c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0631  83c40a           add sp, 0xa                              
  0634  16               push ss                                  
  0635  8d46a8           lea ax, [bp - 0x58]                      
  0638  50               push ax                                  
  0639  66684001b900     push 0xb90140                            
  063f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0644  83c408           add sp, 8                                
  0647  666804000200     push 0x20004                             
  064d  666810018200     push 0x820110                            
  0653  6668b800dc00     push 0xdc00b8                            
  0659  16               push ss                                  
  065a  8d46f8           lea ax, [bp - 8]                         
  065d  50               push ax                                  
  065e  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0663  83c40c           add sp, 0xc                              
  0666  52               push dx                                  
  0667  50               push ax                                  
  0668  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  066d  83c408           add sp, 8                                
  0670  666802000400     push 0x40002                             
  0676  66680e018000     push 0x80010e                            
  067c  6668b900dd00     push 0xdd00b9                            
  0682  16               push ss                                  
  0683  8d46f8           lea ax, [bp - 8]                         
  0686  50               push ax                                  
  0687  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  068c  83c40c           add sp, 0xc                              
  068f  52               push dx                                  
  0690  50               push ax                                  
  0691  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  0696  83c408           add sp, 8                                
  0699  666844000200     push 0x20044                             
  069f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  06a4  83c404           add sp, 4                                
  06a7  52               push dx                                  
  06a8  50               push ax                                  
  06a9  6668c000e600     push 0xe600c0                            
  06af  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  06b4  83c408           add sp, 8                                
  06b7  666844000300     push 0x30044                             
  06bd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  06c2  83c404           add sp, 4                                
  06c5  52               push dx                                  
  06c6  50               push ax                                  
  06c7  66687001e600     push 0xe60170                            
  06cd  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  06d2  83c408           add sp, 8                                
  06d5  33f6             xor si, si                               
  06d7  e99b00           jmp 0x775                                
  06da  666a00           push 0                                   
  06dd  666800000100     push 0x10000                             
  06e3  666a00           push 0                                   
  06e6  6a00             push 0                                   
  06e8  8bc6             mov ax, si                               
  06ea  6bc01e           imul ax, ax, 0x1e                        
  06ed  05fa00           add ax, 0xfa                             
  06f0  50               push ax                                  
  06f1  68d000           push 0xd0                                
  06f4  1e               push ds                                  
  06f5  682a34           push 0x342a                              
  06f8  b8042c           mov ax, 0x2c04                           
  06fb  8ec0             mov es, ax                               
  06fd  26ff361001       push word ptr es:[0x110]                 
  0702  8bde             mov bx, si                               
  0704  d1e3             shl bx, 1                                
  0706  ffb71a41         push word ptr [bx + 0x411a]              
  070a  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  070f  83c41a           add sp, 0x1a                             
  0712  16               push ss                                  
  0713  8d866aff         lea ax, [bp - 0x96]                      
  0717  50               push ax                                  
  0718  8bde             mov bx, si                               
  071a  d1e3             shl bx, 1                                
  071c  ffb71a41         push word ptr [bx + 0x411a]              
  0720  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0725  83c406           add sp, 6                                
  0728  16               push ss                                  
  0729  8d866cff         lea ax, [bp - 0x94]                      
  072d  50               push ax                                  
  072e  8bc6             mov ax, si                               
  0730  6bc01e           imul ax, ax, 0x1e                        
  0733  050001           add ax, 0x100                            
  0736  50               push ax                                  
  0737  68f800           push 0xf8                                
  073a  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  073f  83c408           add sp, 8                                
  0742  8bde             mov bx, si                               
  0744  d1e3             shl bx, 1                                
  0746  ffb70e41         push word ptr [bx + 0x410e]              
  074a  1e               push ds                                  
  074b  68660a           push 0xa66                                ; "%d gp"
  074e  16               push ss                                  
  074f  8d46a8           lea ax, [bp - 0x58]                      
  0752  50               push ax                                  
  0753  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0758  83c40a           add sp, 0xa                              
  075b  16               push ss                                  
  075c  8d46a8           lea ax, [bp - 0x58]                      
  075f  50               push ax                                  
  0760  8bc6             mov ax, si                               
  0762  6bc01e           imul ax, ax, 0x1e                        
  0765  050001           add ax, 0x100                            
  0768  50               push ax                                  
  0769  687001           push 0x170                               
  076c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0771  83c408           add sp, 8                                
  0774  46               inc si                                   
  0775  3b361841         cmp si, word ptr [0x4118]                
  0779  7d03             jge 0x77e                                
  077b  e95cff           jmp 0x6da                                
  077e  eb33             jmp 0x7b3                                
  0780  666a00           push 0                                   
  0783  666800000100     push 0x10000                             
  0789  666a00           push 0                                   
  078c  6a00             push 0                                   
  078e  8bc6             mov ax, si                               
  0790  6bc01e           imul ax, ax, 0x1e                        
  0793  05fa00           add ax, 0xfa                             
  0796  50               push ax                                  
  0797  68d000           push 0xd0                                
  079a  1e               push ds                                  
  079b  682a34           push 0x342a                              
  079e  b8042c           mov ax, 0x2c04                           
  07a1  8ec0             mov es, ax                               
  07a3  26ff361001       push word ptr es:[0x110]                 
  07a8  6aff             push -1                                  
  07aa  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  07af  83c41a           add sp, 0x1a                             
  07b2  46               inc si                                   
  07b3  83fe03           cmp si, 3                                
  07b6  7cc8             jl 0x780                                 
  07b8  666a00           push 0                                   
  07bb  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  07c0  83c404           add sp, 4                                
  07c3  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  07c8  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  07cd  5e               pop si                                   
  07ce  c9               leave                                    
  07cf  cb               retf                                     

ovl31_07d0:  ; ENTRY
  07d0  55               push bp                                  
  07d1  8bec             mov bp, sp                               
  07d3  83ec42           sub sp, 0x42                             
  07d6  56               push si                                  
  07d7  57               push di                                  
  07d8  33ff             xor di, di                               
  07da  ff7606           push word ptr [bp + 6]                   
  07dd  9a9d005830       lcall 0x3058, 0x9d                       -> ovl44:094f
  07e2  59               pop cx                                   
  07e3  8946fe           mov word ptr [bp - 2], ax                
  07e6  837efe01         cmp word ptr [bp - 2], 1                 
  07ea  7f04             jg 0x7f0                                 
  07ec  33c0             xor ax, ax                               
  07ee  eb40             jmp 0x830                                
  07f0  be0100           mov si, 1                                
  07f3  eb34             jmp 0x829                                
  07f5  16               push ss                                  
  07f6  8d46be           lea ax, [bp - 0x42]                      
  07f9  50               push ax                                  
  07fa  8b5e06           mov bx, word ptr [bp + 6]                
  07fd  6bdb41           imul bx, bx, 0x41                        
  0800  03de             add bx, si                               
  0802  b8042c           mov ax, 0x2c04                           
  0805  8ec0             mov es, ax                               
  0807  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  080c  98               cwde                                     
  080d  50               push ax                                  
  080e  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0813  83c406           add sp, 6                                
  0816  8b46dc           mov ax, word ptr [bp - 0x24]             
  0819  99               cdq                                      
  081a  33c2             xor ax, dx                               
  081c  2bc2             sub ax, dx                               
  081e  8946fc           mov word ptr [bp - 4], ax                
  0821  99               cdq                                      
  0822  2bc2             sub ax, dx                               
  0824  d1f8             sar ax, 1                                
  0826  03f8             add di, ax                               
  0828  46               inc si                                   
  0829  3b76fe           cmp si, word ptr [bp - 2]                
  082c  7cc7             jl 0x7f5                                 
  082e  8bc7             mov ax, di                               
  0830  5f               pop di                                   
  0831  5e               pop si                                   
  0832  c9               leave                                    
  0833  cb               retf                                     

ovl31_0834:  ; ENTRY
  0834  55               push bp                                  
  0835  8bec             mov bp, sp                               
  0837  83ec42           sub sp, 0x42                             
  083a  56               push si                                  
  083b  8b7606           mov si, word ptr [bp + 6]                
  083e  56               push si                                  
  083f  9a9d005830       lcall 0x3058, 0x9d                       -> ovl44:094f
  0844  59               pop cx                                   
  0845  8bd0             mov dx, ax                               
  0847  83fa01           cmp dx, 1                                
  084a  7d04             jge 0x850                                
  084c  33c0             xor ax, ax                               
  084e  eb33             jmp 0x883                                
  0850  16               push ss                                  
  0851  8d46be           lea ax, [bp - 0x42]                      
  0854  50               push ax                                  
  0855  8bde             mov bx, si                               
  0857  6bdb41           imul bx, bx, 0x41                        
  085a  03da             add bx, dx                               
  085c  b8042c           mov ax, 0x2c04                           
  085f  8ec0             mov es, ax                               
  0861  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0866  98               cwde                                     
  0867  50               push ax                                  
  0868  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  086d  83c406           add sp, 6                                
  0870  8b46dc           mov ax, word ptr [bp - 0x24]             
  0873  99               cdq                                      
  0874  33c2             xor ax, dx                               
  0876  2bc2             sub ax, dx                               
  0878  8946fc           mov word ptr [bp - 4], ax                
  087b  99               cdq                                      
  087c  2bc2             sub ax, dx                               
  087e  d1f8             sar ax, 1                                
  0880  8946fe           mov word ptr [bp - 2], ax                
  0883  5e               pop si                                   
  0884  c9               leave                                    
  0885  cb               retf                                     

ovl31_0886:  ; ENTRY
  0886  55               push bp                                  
  0887  8bec             mov bp, sp                               
  0889  83ec3e           sub sp, 0x3e                             
  088c  56               push si                                  
  088d  57               push di                                  
  088e  8b7606           mov si, word ptr [bp + 6]                
  0891  33c0             xor ax, ax                               
  0893  a31841           mov word ptr [0x4118], ax                
  0896  a31441           mov word ptr [0x4114], ax                
  0899  56               push si                                  
  089a  9a9d005830       lcall 0x3058, 0x9d                       -> ovl44:094f
  089f  59               pop cx                                   
  08a0  8bf8             mov di, ax                               
  08a2  83ff01           cmp di, 1                                
  08a5  7d03             jge 0x8aa                                
  08a7  e99300           jmp 0x93d                                
  08aa  8bc7             mov ax, di                               
  08ac  48               dec ax                                   
  08ad  a31641           mov word ptr [0x4116], ax                
  08b0  16               push ss                                  
  08b1  8d46c2           lea ax, [bp - 0x3e]                      
  08b4  50               push ax                                  
  08b5  8bde             mov bx, si                               
  08b7  6bdb41           imul bx, bx, 0x41                        
  08ba  03df             add bx, di                               
  08bc  b8042c           mov ax, 0x2c04                           
  08bf  8ec0             mov es, ax                               
  08c1  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  08c6  98               cwde                                     
  08c7  50               push ax                                  
  08c8  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  08cd  83c406           add sp, 6                                
  08d0  8bde             mov bx, si                               
  08d2  6bdb41           imul bx, bx, 0x41                        
  08d5  03df             add bx, di                               
  08d7  b8042c           mov ax, 0x2c04                           
  08da  8ec0             mov es, ax                               
  08dc  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  08e1  98               cwde                                     
  08e2  8b1e1841         mov bx, word ptr [0x4118]                
  08e6  d1e3             shl bx, 1                                
  08e8  89871a41         mov word ptr [bx + 0x411a], ax           
  08ec  8b46e0           mov ax, word ptr [bp - 0x20]             
  08ef  99               cdq                                      
  08f0  33c2             xor ax, dx                               
  08f2  2bc2             sub ax, dx                               
  08f4  99               cdq                                      
  08f5  2bc2             sub ax, dx                               
  08f7  d1f8             sar ax, 1                                
  08f9  8b1e1841         mov bx, word ptr [0x4118]                
  08fd  d1e3             shl bx, 1                                
  08ff  89870e41         mov word ptr [bx + 0x410e], ax           
  0903  8b1e1841         mov bx, word ptr [0x4118]                
  0907  d1e3             shl bx, 1                                
  0909  8b870e41         mov ax, word ptr [bx + 0x410e]           
  090d  01061441         add word ptr [0x4114], ax                
  0911  ff061841         inc word ptr [0x4118]                    
  0915  8bde             mov bx, si                               
  0917  6bdb41           imul bx, bx, 0x41                        
  091a  03df             add bx, di                               
  091c  b8042c           mov ax, 0x2c04                           
  091f  8ec0             mov es, ax                               
  0921  26c6879215ff     mov byte ptr es:[bx + 0x1592], 0xff      
  0927  56               push si                                  
  0928  9a98005830       lcall 0x3058, 0x98                       -> ovl44:0930
  092d  59               pop cx                                   
  092e  8bde             mov bx, si                               
  0930  6bdb41           imul bx, bx, 0x41                        
  0933  ba042c           mov dx, 0x2c04                           
  0936  8ec2             mov es, dx                               
  0938  2688879115       mov byte ptr es:[bx + 0x1591], al        
  093d  5f               pop di                                   
  093e  5e               pop si                                   
  093f  c9               leave                                    
  0940  cb               retf                                     

ovl31_0941:  ; ENTRY
  0941  55               push bp                                  
  0942  8bec             mov bp, sp                               
  0944  83ec40           sub sp, 0x40                             
  0947  56               push si                                  
  0948  57               push di                                  
  0949  8b7606           mov si, word ptr [bp + 6]                
  094c  33c0             xor ax, ax                               
  094e  a31841           mov word ptr [0x4118], ax                
  0951  a31441           mov word ptr [0x4114], ax                
  0954  c70616410100     mov word ptr [0x4116], 1                 
  095a  56               push si                                  
  095b  9a9d005830       lcall 0x3058, 0x9d                       -> ovl44:094f
  0960  59               pop cx                                   
  0961  8946fe           mov word ptr [bp - 2], ax                
  0964  837efe01         cmp word ptr [bp - 2], 1                 
  0968  7f03             jg 0x96d                                 
  096a  e99800           jmp 0xa05                                
  096d  bf0100           mov di, 1                                
  0970  eb78             jmp 0x9ea                                
  0972  16               push ss                                  
  0973  8d46c0           lea ax, [bp - 0x40]                      
  0976  50               push ax                                  
  0977  8bde             mov bx, si                               
  0979  6bdb41           imul bx, bx, 0x41                        
  097c  03df             add bx, di                               
  097e  b8042c           mov ax, 0x2c04                           
  0981  8ec0             mov es, ax                               
  0983  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0988  98               cwde                                     
  0989  50               push ax                                  
  098a  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  098f  83c406           add sp, 6                                
  0992  8bde             mov bx, si                               
  0994  6bdb41           imul bx, bx, 0x41                        
  0997  03df             add bx, di                               
  0999  b8042c           mov ax, 0x2c04                           
  099c  8ec0             mov es, ax                               
  099e  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  09a3  98               cwde                                     
  09a4  8b1e1841         mov bx, word ptr [0x4118]                
  09a8  d1e3             shl bx, 1                                
  09aa  89871a41         mov word ptr [bx + 0x411a], ax           
  09ae  8b46de           mov ax, word ptr [bp - 0x22]             
  09b1  99               cdq                                      
  09b2  33c2             xor ax, dx                               
  09b4  2bc2             sub ax, dx                               
  09b6  99               cdq                                      
  09b7  2bc2             sub ax, dx                               
  09b9  d1f8             sar ax, 1                                
  09bb  8b1e1841         mov bx, word ptr [0x4118]                
  09bf  d1e3             shl bx, 1                                
  09c1  89870e41         mov word ptr [bx + 0x410e], ax           
  09c5  8b1e1841         mov bx, word ptr [0x4118]                
  09c9  d1e3             shl bx, 1                                
  09cb  8b870e41         mov ax, word ptr [bx + 0x410e]           
  09cf  01061441         add word ptr [0x4114], ax                
  09d3  ff061841         inc word ptr [0x4118]                    
  09d7  8bde             mov bx, si                               
  09d9  6bdb41           imul bx, bx, 0x41                        
  09dc  03df             add bx, di                               
  09de  b8042c           mov ax, 0x2c04                           
  09e1  8ec0             mov es, ax                               
  09e3  26c6879315ff     mov byte ptr es:[bx + 0x1593], 0xff      
  09e9  47               inc di                                   
  09ea  3b7efe           cmp di, word ptr [bp - 2]                
  09ed  7c83             jl 0x972                                 
  09ef  56               push si                                  
  09f0  9a98005830       lcall 0x3058, 0x98                       -> ovl44:0930
  09f5  59               pop cx                                   
  09f6  8bde             mov bx, si                               
  09f8  6bdb41           imul bx, bx, 0x41                        
  09fb  ba042c           mov dx, 0x2c04                           
  09fe  8ec2             mov es, dx                               
  0a00  2688879115       mov byte ptr es:[bx + 0x1591], al        
  0a05  5f               pop di                                   
  0a06  5e               pop si                                   
  0a07  c9               leave                                    
  0a08  cb               retf                                     
