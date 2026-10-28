; ovl42 stub 304c file_off 0x638d0 size 0x974

ovl42_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  8b4606           mov ax, word ptr [bp + 6]                
  0006  a3f60d           mov word ptr [0xdf6], ax                 
  0009  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  000e  6a01             push 1                                   
  0010  90               nop                                      
  0011  0e               push cs                                  
  0012  e81b00           call 0x30                                
  0015  59               pop cx                                   
  0016  c7066a160100     mov word ptr [0x166a], 1                 
  001c  6a07             push 7                                   
  001e  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0023  59               pop cx                                   
  0024  90               nop                                      
  0025  0e               push cs                                  
  0026  e84302           call 0x26c                               
  0029  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  002e  5d               pop bp                                   
  002f  cb               retf                                     

ovl42_0030:  ; ENTRY
  0030  55               push bp                                  
  0031  8bec             mov bp, sp                               
  0033  83ec50           sub sp, 0x50                             
  0036  56               push si                                  
  0037  837e0600         cmp word ptr [bp + 6], 0                 
  003b  743c             je 0x79                                  
  003d  833e6a1600       cmp word ptr [0x166a], 0                 
  0042  7427             je 0x6b                                  
  0044  666800001001     push 0x1100000                           
  004a  666a00           push 0                                   
  004d  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0052  83c408           add sp, 8                                
  0055  666800001e00     push 0x1e0000                            
  005b  666800005800     push 0x580000                            
  0061  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0066  83c408           add sp, 8                                
  0069  eb0e             jmp 0x79                                 
  006b  c7066a160100     mov word ptr [0x166a], 1                 
  0071  6a02             push 2                                   
  0073  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0078  59               pop cx                                   
  0079  666800000300     push 0x30000                             
  007f  666801000f00     push 0xf0001                             
  0085  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  008a  83c408           add sp, 8                                
  008d  ff36f60d         push word ptr [0xdf6]                    
  0091  6a49             push 0x49                                
  0093  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0098  83c404           add sp, 4                                
  009b  52               push dx                                  
  009c  50               push ax                                  
  009d  66ff36f80d       push dword ptr [0xdf8]                   
  00a2  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00a7  83c408           add sp, 8                                
  00aa  666800000300     push 0x30000                             
  00b0  666802000f00     push 0xf0002                             
  00b6  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  00bb  83c408           add sp, 8                                
  00be  ff36f60d         push word ptr [0xdf6]                    
  00c2  6a4a             push 0x4a                                
  00c4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00c9  83c404           add sp, 4                                
  00cc  52               push dx                                  
  00cd  50               push ax                                  
  00ce  66ff36fc0d       push dword ptr [0xdfc]                   
  00d3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00d8  83c408           add sp, 8                                
  00db  90               nop                                      
  00dc  0e               push cs                                  
  00dd  e81b02           call 0x2fb                               
  00e0  8bf0             mov si, ax                               
  00e2  90               nop                                      
  00e3  0e               push cs                                  
  00e4  e81805           call 0x5ff                               
  00e7  6a03             push 3                                   
  00e9  b8042c           mov ax, 0x2c04                           
  00ec  8ec0             mov es, ax                               
  00ee  268b1e1001       mov bx, word ptr es:[0x110]              
  00f3  d1e3             shl bx, 1                                
  00f5  b8042c           mov ax, 0x2c04                           
  00f8  8ec0             mov es, ax                               
  00fa  26ffb7b000       push word ptr es:[bx + 0xb0]             
  00ff  b8042c           mov ax, 0x2c04                           
  0102  8ec0             mov es, ax                               
  0104  268b1e1001       mov bx, word ptr es:[0x110]              
  0109  d1e3             shl bx, 1                                
  010b  b8042c           mov ax, 0x2c04                           
  010e  8ec0             mov es, ax                               
  0110  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0115  6a02             push 2                                   
  0117  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  011c  83c408           add sp, 8                                
  011f  1e               push ds                                  
  0120  68420e           push 0xe42                               
  0123  16               push ss                                  
  0124  8d46b0           lea ax, [bp - 0x50]                      
  0127  50               push ax                                  
  0128  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  012d  83c408           add sp, 8                                
  0130  8b1ef60d         mov bx, word ptr [0xdf6]                 
  0134  83fb04           cmp bx, 4                                
  0137  7603             jbe 0x13c                                
  0139  e91101           jmp 0x24d                                
  013c  d1e3             shl bx, 1                                
  013e  2effa76202       jmp word ptr cs:[bx + 0x262]             
ovl42_0143:  ; case
  0143  666a00           push 0                                   
  0146  666801000100     push 0x10001                             
  014c  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0151  83c408           add sp, 8                                
  0154  666800000100     push 0x10000                             
  015a  666aff           push -1                                  
  015d  666a00           push 0                                   
  0160  9a3400f230       lcall 0x30f2, 0x34                       -> ovl63:158d
  0165  83c40c           add sp, 0xc                              
  0168  666a00           push 0                                   
  016b  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  0170  83c404           add sp, 4                                
  0173  83fe01           cmp si, 1                                
  0176  7506             jne 0x17e                                
  0178  666a4b           push 0x4b                                
  017b  e9b800           jmp 0x236                                
  017e  56               push si                                  
  017f  66684b000100     push 0x1004b                             
  0185  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  018a  83c404           add sp, 4                                
  018d  52               push dx                                  
  018e  50               push ax                                  
  018f  16               push ss                                  
  0190  8d46b0           lea ax, [bp - 0x50]                      
  0193  50               push ax                                  
  0194  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0199  83c40a           add sp, 0xa                              
  019c  e9ae00           jmp 0x24d                                
ovl42_019f:  ; case
  019f  666a00           push 0                                   
  01a2  666801000100     push 0x10001                             
  01a8  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  01ad  83c408           add sp, 8                                
  01b0  83fe01           cmp si, 1                                
  01b3  7505             jne 0x1ba                                
  01b5  666a4c           push 0x4c                                
  01b8  eb7c             jmp 0x236                                
  01ba  56               push si                                  
  01bb  66684c000100     push 0x1004c                             
  01c1  ebc2             jmp 0x185                                
ovl42_01c3:  ; case
  01c3  666a00           push 0                                   
  01c6  666801000100     push 0x10001                             
  01cc  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  01d1  83c408           add sp, 8                                
  01d4  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  01d9  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  01de  56               push si                                  
  01df  666a4d           push 0x4d                                
  01e2  eba1             jmp 0x185                                
ovl42_01e4:  ; case
  01e4  666a00           push 0                                   
  01e7  666800000100     push 0x10000                             
  01ed  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  01f2  83c408           add sp, 8                                
  01f5  66680000ffff     push 0xffff0000                          
  01fb  6a00             push 0                                   
  01fd  9a4800f230       lcall 0x30f2, 0x48                       -> ovl63:1817
  0202  83c406           add sp, 6                                
  0205  666a00           push 0                                   
  0208  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  020d  83c404           add sp, 4                                
  0210  83fe01           cmp si, 1                                
  0213  7505             jne 0x21a                                
  0215  56               push si                                  
  0216  6a01             push 1                                   
  0218  eb03             jmp 0x21d                                
  021a  56               push si                                  
  021b  6a00             push 0                                   
  021d  6a4e             push 0x4e                                
  021f  e963ff           jmp 0x185                                
ovl42_0222:  ; case
  0222  666a00           push 0                                   
  0225  666801000100     push 0x10001                             
  022b  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0230  83c408           add sp, 8                                
  0233  56               push si                                  
  0234  6a4f             push 0x4f                                
  0236  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  023b  83c404           add sp, 4                                
  023e  52               push dx                                  
  023f  50               push ax                                  
  0240  16               push ss                                  
  0241  8d46b0           lea ax, [bp - 0x50]                      
  0244  50               push ax                                  
  0245  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  024a  83c408           add sp, 8                                
  024d  16               push ss                                  
  024e  8d46b0           lea ax, [bp - 0x50]                      
  0251  50               push ax                                  
  0252  66ff36000e       push dword ptr [0xe00]                   
  0257  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  025c  83c408           add sp, 8                                
  025f  5e               pop si                                   
  0260  c9               leave                                    
  0261  cb               retf                                     
  0262  43019f01c301e401 dw 0143,019f,01c3,01e4,0222              jump table

ovl42_026c:  ; ENTRY
  026c  55               push bp                                  
  026d  8bec             mov bp, sp                               
  026f  56               push si                                  
  0270  33f6             xor si, si                               
  0272  eb1b             jmp 0x28f                                
  0274  3936f60d         cmp word ptr [0xdf6], si                 
  0278  7504             jne 0x27e                                
  027a  6a00             push 0                                   
  027c  eb02             jmp 0x280                                
  027e  6a01             push 1                                   
  0280  8bc6             mov ax, si                               
  0282  05da00           add ax, 0xda                             
  0285  50               push ax                                  
  0286  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  028b  83c404           add sp, 4                                
  028e  46               inc si                                   
  028f  83fe05           cmp si, 5                                
  0292  7ce0             jl 0x274                                 
  0294  833ef60d03       cmp word ptr [0xdf6], 3                  
  0299  7507             jne 0x2a2                                
  029b  9a52005130       lcall 0x3051, 0x52                       -> ovl43:0a33
  02a0  eb24             jmp 0x2c6                                
  02a2  68d000           push 0xd0                                
  02a5  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  02aa  59               pop cx                                   
  02ab  68ce00           push 0xce                                 ; "%s's Quest"
  02ae  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  02b3  59               pop cx                                   
  02b4  68cf00           push 0xcf                                
  02b7  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  02bc  59               pop cx                                   
  02bd  68d100           push 0xd1                                
  02c0  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  02c5  59               pop cx                                   
  02c6  6668df000100     push 0x100df                             
  02cc  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02d1  83c404           add sp, 4                                
  02d4  5e               pop si                                   
  02d5  5d               pop bp                                   
  02d6  cb               retf                                     

ovl42_02d7:  ; ENTRY
  02d7  55               push bp                                  
  02d8  8bec             mov bp, sp                               
  02da  ff7606           push word ptr [bp + 6]                   
  02dd  0e               push cs                                  
  02de  e81ffd           call 0                                   
  02e1  59               pop cx                                   
  02e2  5d               pop bp                                   
  02e3  cb               retf                                     

ovl42_02e4:  ; ENTRY
  02e4  55               push bp                                  
  02e5  8bec             mov bp, sp                               
  02e7  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  02ec  666a00           push 0                                   
  02ef  6a00             push 0                                   
  02f1  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  02f6  83c406           add sp, 6                                
  02f9  5d               pop bp                                   
  02fa  cb               retf                                     

ovl42_02fb:  ; ENTRY
  02fb  55               push bp                                  
  02fc  8bec             mov bp, sp                               
  02fe  56               push si                                  
  02ff  57               push di                                  
  0300  33f6             xor si, si                               
  0302  c706400e0000     mov word ptr [0xe40], 0                  
  0308  33c9             xor cx, cx                               
  030a  eb32             jmp 0x33e                                
  030c  8bd9             mov bx, cx                               
  030e  d1e3             shl bx, 1                                
  0310  b8042c           mov ax, 0x2c04                           
  0313  8ec0             mov es, ax                               
  0315  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  031b  740c             je 0x329                                 
  031d  8bd9             mov bx, cx                               
  031f  d1e3             shl bx, 1                                
  0321  c78740440000     mov word ptr [bx + 0x4440], 0            
  0327  eb0a             jmp 0x333                                
  0329  8bd9             mov bx, cx                               
  032b  d1e3             shl bx, 1                                
  032d  c78740440100     mov word ptr [bx + 0x4440], 1            
  0333  8bd9             mov bx, cx                               
  0335  d1e3             shl bx, 1                                
  0337  c78750440000     mov word ptr [bx + 0x4450], 0            
  033d  41               inc cx                                   
  033e  83f908           cmp cx, 8                                
  0341  7cc9             jl 0x30c                                 
  0343  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0348  8b1ef60d         mov bx, word ptr [0xdf6]                 
  034c  83fb04           cmp bx, 4                                
  034f  7603             jbe 0x354                                
  0351  e99b02           jmp 0x5ef                                
  0354  d1e3             shl bx, 1                                
  0356  2effa7f505       jmp word ptr cs:[bx + 0x5f5]             
ovl42_035b:  ; case
  035b  b8042c           mov ax, 0x2c04                           
  035e  8ec0             mov es, ax                               
  0360  268b0e8101       mov cx, word ptr es:[0x181]              
  0365  eb36             jmp 0x39d                                
  0367  8bd9             mov bx, cx                               
  0369  6bdb16           imul bx, bx, 0x16                        
  036c  b81d1e           mov ax, 0x1e1d                           
  036f  8ec0             mov es, ax                               
  0371  2680bf858808     cmp byte ptr es:[bx - 0x777b], 8         
  0377  7d24             jge 0x39d                                
  0379  8bd9             mov bx, cx                               
  037b  6bdb16           imul bx, bx, 0x16                        
  037e  8ec0             mov es, ax                               
  0380  2680bf858800     cmp byte ptr es:[bx - 0x777b], 0         
  0386  7c15             jl 0x39d                                 
  0388  8bd9             mov bx, cx                               
  038a  6bdb16           imul bx, bx, 0x16                        
  038d  8ec0             mov es, ax                               
  038f  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0394  98               cwde                                     
  0395  d1e0             shl ax, 1                                
  0397  8bd8             mov bx, ax                               
  0399  ff875044         inc word ptr [bx + 0x4450]               
  039d  8bc1             mov ax, cx                               
  039f  49               dec cx                                   
  03a0  0bc0             or ax, ax                                
  03a2  75c3             jne 0x367                                
  03a4  33c9             xor cx, cx                               
  03a6  eb1b             jmp 0x3c3                                
  03a8  8bd9             mov bx, cx                               
  03aa  d1e3             shl bx, 1                                
  03ac  8b875044         mov ax, word ptr [bx + 0x4450]           
  03b0  3b06400e         cmp ax, word ptr [0xe40]                 
  03b4  7e06             jle 0x3bc                                
  03b6  8bd9             mov bx, cx                               
  03b8  d1e3             shl bx, 1                                
  03ba  eb03             jmp 0x3bf                                
  03bc  a1400e           mov ax, word ptr [0xe40]                 
  03bf  a3400e           mov word ptr [0xe40], ax                 
  03c2  41               inc cx                                   
  03c3  83f908           cmp cx, 8                                
  03c6  7ce0             jl 0x3a8                                 
  03c8  833e400e00       cmp word ptr [0xe40], 0                  
  03cd  741b             je 0x3ea                                 
  03cf  a1400e           mov ax, word ptr [0xe40]                 
  03d2  99               cdq                                      
  03d3  2bc2             sub ax, dx                               
  03d5  d1f8             sar ax, 1                                
  03d7  50               push ax                                  
  03d8  a1400e           mov ax, word ptr [0xe40]                 
  03db  48               dec ax                                   
  03dc  99               cdq                                      
  03dd  2bc2             sub ax, dx                               
  03df  d1f8             sar ax, 1                                
  03e1  5a               pop dx                                   
  03e2  3bd0             cmp dx, ax                               
  03e4  7504             jne 0x3ea                                
  03e6  ff06400e         inc word ptr [0xe40]                     
  03ea  b8042c           mov ax, 0x2c04                           
  03ed  8ec0             mov es, ax                               
  03ef  268b1e1001       mov bx, word ptr es:[0x110]              
  03f4  d1e3             shl bx, 1                                
  03f6  8bb75044         mov si, word ptr [bx + 0x4450]           
  03fa  e9f201           jmp 0x5ef                                
ovl42_03fd:  ; case
  03fd  33c9             xor cx, cx                               
  03ff  eb2b             jmp 0x42c                                
  0401  8bd9             mov bx, cx                               
  0403  d1e3             shl bx, 1                                
  0405  8b87ea5d         mov ax, word ptr [bx + 0x5dea]           
  0409  8bd9             mov bx, cx                               
  040b  d1e3             shl bx, 1                                
  040d  89875044         mov word ptr [bx + 0x4450], ax           
  0411  8bd9             mov bx, cx                               
  0413  d1e3             shl bx, 1                                
  0415  8b875044         mov ax, word ptr [bx + 0x4450]           
  0419  3b06400e         cmp ax, word ptr [0xe40]                 
  041d  7e06             jle 0x425                                
  041f  8bd9             mov bx, cx                               
  0421  d1e3             shl bx, 1                                
  0423  eb03             jmp 0x428                                
  0425  a1400e           mov ax, word ptr [0xe40]                 
  0428  a3400e           mov word ptr [0xe40], ax                 
  042b  41               inc cx                                   
  042c  83f908           cmp cx, 8                                
  042f  7cd0             jl 0x401                                 
  0431  833e400e00       cmp word ptr [0xe40], 0                  
  0436  74b2             je 0x3ea                                 
  0438  a1400e           mov ax, word ptr [0xe40]                 
  043b  99               cdq                                      
  043c  2bc2             sub ax, dx                               
  043e  d1f8             sar ax, 1                                
  0440  50               push ax                                  
  0441  a1400e           mov ax, word ptr [0xe40]                 
  0444  48               dec ax                                   
  0445  99               cdq                                      
  0446  2bc2             sub ax, dx                               
  0448  d1f8             sar ax, 1                                
  044a  5a               pop dx                                   
  044b  3bd0             cmp dx, ax                               
  044d  759b             jne 0x3ea                                
  044f  eb95             jmp 0x3e6                                
  0451  eb97             jmp 0x3ea                                
ovl42_0453:  ; case
  0453  33c9             xor cx, cx                               
  0455  eb32             jmp 0x489                                
  0457  8bd9             mov bx, cx                               
  0459  6bdb14           imul bx, bx, 0x14                        
  045c  b8042c           mov ax, 0x2c04                           
  045f  8ec0             mov es, ax                               
  0461  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0466  8bd9             mov bx, cx                               
  0468  d1e3             shl bx, 1                                
  046a  89875044         mov word ptr [bx + 0x4450], ax           
  046e  8bd9             mov bx, cx                               
  0470  d1e3             shl bx, 1                                
  0472  8b875044         mov ax, word ptr [bx + 0x4450]           
  0476  3b06400e         cmp ax, word ptr [0xe40]                 
  047a  7e06             jle 0x482                                
  047c  8bd9             mov bx, cx                               
  047e  d1e3             shl bx, 1                                
  0480  eb03             jmp 0x485                                
  0482  a1400e           mov ax, word ptr [0xe40]                 
  0485  a3400e           mov word ptr [0xe40], ax                 
  0488  41               inc cx                                   
  0489  83f908           cmp cx, 8                                
  048c  7cc9             jl 0x457                                 
  048e  833e400e00       cmp word ptr [0xe40], 0                  
  0493  7503             jne 0x498                                
  0495  e952ff           jmp 0x3ea                                
  0498  a1400e           mov ax, word ptr [0xe40]                 
  049b  99               cdq                                      
  049c  2bc2             sub ax, dx                               
  049e  d1f8             sar ax, 1                                
  04a0  50               push ax                                  
  04a1  a1400e           mov ax, word ptr [0xe40]                 
  04a4  48               dec ax                                   
  04a5  99               cdq                                      
  04a6  2bc2             sub ax, dx                               
  04a8  d1f8             sar ax, 1                                
  04aa  5a               pop dx                                   
  04ab  3bd0             cmp dx, ax                               
  04ad  7403             je 0x4b2                                 
  04af  e938ff           jmp 0x3ea                                
  04b2  e931ff           jmp 0x3e6                                
  04b5  e932ff           jmp 0x3ea                                
ovl42_04b8:  ; case
  04b8  9a4d005130       lcall 0x3051, 0x4d                       -> ovl43:07e5
  04bd  8bf0             mov si, ax                               
  04bf  e92d01           jmp 0x5ef                                
ovl42_04c2:  ; case
  04c2  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  04c7  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  04cc  33c9             xor cx, cx                               
  04ce  e9a500           jmp 0x576                                
  04d1  33ff             xor di, di                               
  04d3  33f6             xor si, si                               
  04d5  eb33             jmp 0x50a                                
  04d7  8bde             mov bx, si                               
  04d9  6bdb41           imul bx, bx, 0x41                        
  04dc  b8042c           mov ax, 0x2c04                           
  04df  8ec0             mov es, ax                               
  04e1  26388f9215       cmp byte ptr es:[bx + 0x1592], cl        
  04e6  7521             jne 0x509                                
  04e8  8bde             mov bx, si                               
  04ea  6bdb41           imul bx, bx, 0x41                        
  04ed  b8042c           mov ax, 0x2c04                           
  04f0  8ec0             mov es, ax                               
  04f2  268a879115       mov al, byte ptr es:[bx + 0x1591]        
  04f7  98               cwde                                     
  04f8  8bde             mov bx, si                               
  04fa  6bdb41           imul bx, bx, 0x41                        
  04fd  ba042c           mov dx, 0x2c04                           
  0500  8ec2             mov es, dx                               
  0502  26f7afa715       imul word ptr es:[bx + 0x15a7]           
  0507  03f8             add di, ax                               
  0509  46               inc si                                   
  050a  b8042c           mov ax, 0x2c04                           
  050d  8ec0             mov es, ax                               
  050f  2639367b15       cmp word ptr es:[0x157b], si             
  0514  7fc1             jg 0x4d7                                 
  0516  8bd9             mov bx, cx                               
  0518  6bdb14           imul bx, bx, 0x14                        
  051b  b8042c           mov ax, 0x2c04                           
  051e  8ec0             mov es, ax                               
  0520  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0525  8bd9             mov bx, cx                               
  0527  d1e3             shl bx, 1                                
  0529  8b97ca5d         mov dx, word ptr [bx + 0x5dca]           
  052d  6bd205           imul dx, dx, 5                           
  0530  03c2             add ax, dx                               
  0532  8bd9             mov bx, cx                               
  0534  d1e3             shl bx, 1                                
  0536  0387da5d         add ax, word ptr [bx + 0x5dda]           
  053a  03c7             add ax, di                               
  053c  bb1e00           mov bx, 0x1e                             
  053f  99               cdq                                      
  0540  f7fb             idiv bx                                  
  0542  8bd9             mov bx, cx                               
  0544  d1e3             shl bx, 1                                
  0546  89875044         mov word ptr [bx + 0x4450], ax           
  054a  8bd9             mov bx, cx                               
  054c  d1e3             shl bx, 1                                
  054e  81bf5044f401     cmp word ptr [bx + 0x4450], 0x1f4        
  0554  7e0a             jle 0x560                                
  0556  8bd9             mov bx, cx                               
  0558  d1e3             shl bx, 1                                
  055a  c7875044f401     mov word ptr [bx + 0x4450], 0x1f4        
  0560  8bd9             mov bx, cx                               
  0562  d1e3             shl bx, 1                                
  0564  83bf504401       cmp word ptr [bx + 0x4450], 1            
  0569  7d0a             jge 0x575                                
  056b  8bd9             mov bx, cx                               
  056d  d1e3             shl bx, 1                                
  056f  c78750440100     mov word ptr [bx + 0x4450], 1            
  0575  41               inc cx                                   
  0576  83f908           cmp cx, 8                                
  0579  7d03             jge 0x57e                                
  057b  e953ff           jmp 0x4d1                                
  057e  33f6             xor si, si                               
  0580  33c9             xor cx, cx                               
  0582  eb1c             jmp 0x5a0                                
  0584  8bd9             mov bx, cx                               
  0586  d1e3             shl bx, 1                                
  0588  8b875044         mov ax, word ptr [bx + 0x4450]           
  058c  ba042c           mov dx, 0x2c04                           
  058f  8ec2             mov es, dx                               
  0591  268b1e1001       mov bx, word ptr es:[0x110]              
  0596  d1e3             shl bx, 1                                
  0598  3b875044         cmp ax, word ptr [bx + 0x4450]           
  059c  7e01             jle 0x59f                                
  059e  46               inc si                                   
  059f  41               inc cx                                   
  05a0  83f908           cmp cx, 8                                
  05a3  7cdf             jl 0x584                                 
  05a5  33c9             xor cx, cx                               
  05a7  eb17             jmp 0x5c0                                
  05a9  8bd9             mov bx, cx                               
  05ab  d1e3             shl bx, 1                                
  05ad  8b875044         mov ax, word ptr [bx + 0x4450]           
  05b1  bb0500           mov bx, 5                                
  05b4  99               cdq                                      
  05b5  f7fb             idiv bx                                  
  05b7  8bd9             mov bx, cx                               
  05b9  d1e3             shl bx, 1                                
  05bb  89875044         mov word ptr [bx + 0x4450], ax           
  05bf  41               inc cx                                   
  05c0  83f908           cmp cx, 8                                
  05c3  7ce4             jl 0x5a9                                 
  05c5  33c9             xor cx, cx                               
  05c7  eb1b             jmp 0x5e4                                
  05c9  8bd9             mov bx, cx                               
  05cb  d1e3             shl bx, 1                                
  05cd  8b875044         mov ax, word ptr [bx + 0x4450]           
  05d1  3b06400e         cmp ax, word ptr [0xe40]                 
  05d5  7e06             jle 0x5dd                                
  05d7  8bd9             mov bx, cx                               
  05d9  d1e3             shl bx, 1                                
  05db  eb03             jmp 0x5e0                                
  05dd  a1400e           mov ax, word ptr [0xe40]                 
  05e0  a3400e           mov word ptr [0xe40], ax                 
  05e3  41               inc cx                                   
  05e4  83f908           cmp cx, 8                                
  05e7  7ce0             jl 0x5c9                                 
  05e9  c706400e6400     mov word ptr [0xe40], 0x64               
  05ef  8bc6             mov ax, si                               
  05f1  5f               pop di                                   
  05f2  5e               pop si                                   
  05f3  5d               pop bp                                   
  05f4  cb               retf                                     
  05f5  5b03fd035304b804 dw 035b,03fd,0453,04b8,04c2              jump table

ovl42_05ff:  ; ENTRY
  05ff  55               push bp                                  
  0600  8bec             mov bp, sp                               
  0602  83ec20           sub sp, 0x20                             
  0605  56               push si                                  
  0606  57               push di                                  
  0607  833ef60d03       cmp word ptr [0xdf6], 3                  
  060c  7508             jne 0x616                                
  060e  90               nop                                      
  060f  0e               push cs                                  
  0610  e82a03           call 0x93d                               
  0613  e92303           jmp 0x939                                
  0616  6a05             push 5                                   
  0618  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  061d  59               pop cx                                   
  061e  66833ed95500     cmp dword ptr [0x55d9], 0                
  0624  7435             je 0x65b                                 
  0626  f70604560a00     test word ptr [0x5604], 0xa              
  062c  752d             jne 0x65b                                
  062e  33f6             xor si, si                               
  0630  eb20             jmp 0x652                                
  0632  8bde             mov bx, si                               
  0634  c1e302           shl bx, 2                                
  0637  66ffb7d955       push dword ptr [bx + 0x55d9]             
  063c  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0641  83c404           add sp, 4                                
  0644  8bde             mov bx, si                               
  0646  c1e302           shl bx, 2                                
  0649  8997eb55         mov word ptr [bx + 0x55eb], dx           
  064d  8987e955         mov word ptr [bx + 0x55e9], ax           
  0651  46               inc si                                   
  0652  a00356           mov al, byte ptr [0x5603]                
  0655  b400             mov ah, 0                                
  0657  3bc6             cmp ax, si                               
  0659  7fd7             jg 0x632                                 
  065b  33f6             xor si, si                               
  065d  e94d01           jmp 0x7ad                                
  0660  8bde             mov bx, si                               
  0662  d1e3             shl bx, 1                                
  0664  83bf404400       cmp word ptr [bx + 0x4440], 0            
  0669  7403             je 0x66e                                 
  066b  e93e01           jmp 0x7ac                                
  066e  8bde             mov bx, si                               
  0670  d1e3             shl bx, 1                                
  0672  8b87100e         mov ax, word ptr [bx + 0xe10]            
  0676  8946f6           mov word ptr [bp - 0xa], ax              
  0679  c746fa0800       mov word ptr [bp - 6], 8                 
  067e  c746f43801       mov word ptr [bp - 0xc], 0x138           
  0683  833e400e00       cmp word ptr [0xe40], 0                  
  0688  7f07             jg 0x691                                 
  068a  c746f80100       mov word ptr [bp - 8], 1                 
  068f  eb34             jmp 0x6c5                                
  0691  8bde             mov bx, si                               
  0693  d1e3             shl bx, 1                                
  0695  83bf504400       cmp word ptr [bx + 0x4450], 0            
  069a  7d0a             jge 0x6a6                                
  069c  8bde             mov bx, si                               
  069e  d1e3             shl bx, 1                                
  06a0  c78750440000     mov word ptr [bx + 0x4450], 0            
  06a6  8bde             mov bx, si                               
  06a8  d1e3             shl bx, 1                                
  06aa  660fbf875044     movsx eax, word ptr [bx + 0x4450]        
  06b0  6669c0f0000000   imul eax, eax, 0xf0                      
  06b7  660fbf1e400e     movsx ebx, word ptr [0xe40]              
  06bd  6699             cdq                                      
  06bf  66f7fb           idiv ebx                                 
  06c2  8946f8           mov word ptr [bp - 8], ax                
  06c5  837ef801         cmp word ptr [bp - 8], 1                 
  06c9  7d05             jge 0x6d0                                
  06cb  c746f80100       mov word ptr [bp - 8], 1                 
  06d0  33ff             xor di, di                               
  06d2  8b46f8           mov ax, word ptr [bp - 8]                
  06d5  bb0800           mov bx, 8                                
  06d8  99               cdq                                      
  06d9  f7fb             idiv bx                                  
  06db  8946fe           mov word ptr [bp - 2], ax                
  06de  8b46f8           mov ax, word ptr [bp - 8]                
  06e1  99               cdq                                      
  06e2  f7fb             idiv bx                                  
  06e4  8956fc           mov word ptr [bp - 4], dx                
  06e7  c746e00000       mov word ptr [bp - 0x20], 0              
  06ec  e9b400           jmp 0x7a3                                
  06ef  3b7efe           cmp di, word ptr [bp - 2]                
  06f2  7541             jne 0x735                                
  06f4  c746e00100       mov word ptr [bp - 0x20], 1              
  06f9  837efc00         cmp word ptr [bp - 4], 0                 
  06fd  7e6c             jle 0x76b                                
  06ff  ff76f6           push word ptr [bp - 0xa]                 
  0702  8bc7             mov ax, di                               
  0704  c1e003           shl ax, 3                                
  0707  8b56f4           mov dx, word ptr [bp - 0xc]              
  070a  03d0             add dx, ax                               
  070c  52               push dx                                  
  070d  1e               push ds                                  
  070e  682a34           push 0x342a                              
  0711  6a08             push 8                                   
  0713  ff76fc           push word ptr [bp - 4]                   
  0716  8bde             mov bx, si                               
  0718  c1e302           shl bx, 2                                
  071b  ffb7220e         push word ptr [bx + 0xe22]               
  071f  8bde             mov bx, si                               
  0721  c1e302           shl bx, 2                                
  0724  ffb7200e         push word ptr [bx + 0xe20]               
  0728  1e               push ds                                  
  0729  68cf55           push 0x55cf                              
  072c  ff1ed469         lcall [0x69d4]                           
  0730  83c414           add sp, 0x14                             
  0733  eb36             jmp 0x76b                                
  0735  ff76f6           push word ptr [bp - 0xa]                 
  0738  8bc7             mov ax, di                               
  073a  c1e003           shl ax, 3                                
  073d  8b56f4           mov dx, word ptr [bp - 0xc]              
  0740  03d0             add dx, ax                               
  0742  52               push dx                                  
  0743  1e               push ds                                  
  0744  682a34           push 0x342a                              
  0747  666808000800     push 0x80008                             
  074d  8bde             mov bx, si                               
  074f  c1e302           shl bx, 2                                
  0752  ffb7220e         push word ptr [bx + 0xe22]               
  0756  8bde             mov bx, si                               
  0758  c1e302           shl bx, 2                                
  075b  ffb7200e         push word ptr [bx + 0xe20]               
  075f  1e               push ds                                  
  0760  68cf55           push 0x55cf                              
  0763  ff1ed469         lcall [0x69d4]                           
  0767  83c414           add sp, 0x14                             
  076a  47               inc di                                   
  076b  8b46fa           mov ax, word ptr [bp - 6]                
  076e  050200           add ax, 2                                
  0771  50               push ax                                  
  0772  8b46f8           mov ax, word ptr [bp - 8]                
  0775  050200           add ax, 2                                
  0778  50               push ax                                  
  0779  8b46f6           mov ax, word ptr [bp - 0xa]              
  077c  48               dec ax                                   
  077d  50               push ax                                  
  077e  8b46f4           mov ax, word ptr [bp - 0xc]              
  0781  48               dec ax                                   
  0782  50               push ax                                  
  0783  16               push ss                                  
  0784  8d46ec           lea ax, [bp - 0x14]                      
  0787  50               push ax                                  
  0788  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  078d  83c40c           add sp, 0xc                              
  0790  666800000100     push 0x10000                             
  0796  16               push ss                                  
  0797  8d46ec           lea ax, [bp - 0x14]                      
  079a  50               push ax                                  
  079b  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  07a0  83c408           add sp, 8                                
  07a3  837ee000         cmp word ptr [bp - 0x20], 0              
  07a7  7503             jne 0x7ac                                
  07a9  e943ff           jmp 0x6ef                                
  07ac  46               inc si                                   
  07ad  83fe08           cmp si, 8                                
  07b0  7d03             jge 0x7b5                                
  07b2  e9abfe           jmp 0x660                                
  07b5  6a01             push 1                                   
  07b7  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  07bc  59               pop cx                                   
  07bd  6668c400f000     push 0xf000c4                            
  07c3  683801           push 0x138                               
  07c6  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  07cb  83c406           add sp, 6                                
  07ce  6668be000600     push 0x600be                             
  07d4  683801           push 0x138                               
  07d7  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07dc  83c406           add sp, 6                                
  07df  6668c0000400     push 0x400c0                             
  07e5  687401           push 0x174                               
  07e8  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07ed  83c406           add sp, 6                                
  07f0  6668be000600     push 0x600be                             
  07f6  68b001           push 0x1b0                               
  07f9  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07fe  83c406           add sp, 6                                
  0801  6668c0000400     push 0x400c0                             
  0807  68ec01           push 0x1ec                               
  080a  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  080f  83c406           add sp, 6                                
  0812  6668be000600     push 0x600be                             
  0818  682802           push 0x228                               
  081b  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0820  83c406           add sp, 6                                
  0823  6a00             push 0                                   
  0825  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  082a  59               pop cx                                   
  082b  6668c300f000     push 0xf000c3                            
  0831  683701           push 0x137                               
  0834  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0839  83c406           add sp, 6                                
  083c  6668bd000600     push 0x600bd                             
  0842  683701           push 0x137                               
  0845  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  084a  83c406           add sp, 6                                
  084d  6668bf000400     push 0x400bf                             
  0853  687301           push 0x173                               
  0856  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  085b  83c406           add sp, 6                                
  085e  6668bd000600     push 0x600bd                             
  0864  68af01           push 0x1af                               
  0867  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  086c  83c406           add sp, 6                                
  086f  6668bf000400     push 0x400bf                             
  0875  68eb01           push 0x1eb                               
  0878  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  087d  83c406           add sp, 6                                
  0880  6668bd000600     push 0x600bd                             
  0886  682702           push 0x227                               
  0889  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  088e  83c406           add sp, 6                                
  0891  666800000300     push 0x30000                             
  0897  666802000f00     push 0xf0002                             
  089d  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  08a2  83c408           add sp, 8                                
  08a5  ff36400e         push word ptr [0xe40]                    
  08a9  1e               push ds                                  
  08aa  68430e           push 0xe43                               
  08ad  16               push ss                                  
  08ae  8d46e2           lea ax, [bp - 0x1e]                      
  08b1  50               push ax                                  
  08b2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08b7  83c40a           add sp, 0xa                              
  08ba  16               push ss                                  
  08bb  8d46e2           lea ax, [bp - 0x1e]                      
  08be  50               push ax                                  
  08bf  66ff360c0e       push dword ptr [0xe0c]                   
  08c4  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  08c9  83c408           add sp, 8                                
  08cc  a1400e           mov ax, word ptr [0xe40]                 
  08cf  99               cdq                                      
  08d0  2bc2             sub ax, dx                               
  08d2  d1f8             sar ax, 1                                
  08d4  50               push ax                                  
  08d5  1e               push ds                                  
  08d6  68460e           push 0xe46                               
  08d9  16               push ss                                  
  08da  8d46e2           lea ax, [bp - 0x1e]                      
  08dd  50               push ax                                  
  08de  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08e3  83c40a           add sp, 0xa                              
  08e6  16               push ss                                  
  08e7  8d46e2           lea ax, [bp - 0x1e]                      
  08ea  50               push ax                                  
  08eb  66ff36080e       push dword ptr [0xe08]                   
  08f0  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  08f5  83c408           add sp, 8                                
  08f8  1e               push ds                                  
  08f9  68490e           push 0xe49                               
  08fc  66ff36040e       push dword ptr [0xe04]                   
  0901  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0906  83c408           add sp, 8                                
  0909  66833ed95500     cmp dword ptr [0x55d9], 0                
  090f  7428             je 0x939                                 
  0911  f70604560a00     test word ptr [0x5604], 0xa              
  0917  7520             jne 0x939                                
  0919  33f6             xor si, si                               
  091b  eb13             jmp 0x930                                
  091d  8bde             mov bx, si                               
  091f  c1e302           shl bx, 2                                
  0922  66ffb7d955       push dword ptr [bx + 0x55d9]             
  0927  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  092c  83c404           add sp, 4                                
  092f  46               inc si                                   
  0930  a00356           mov al, byte ptr [0x5603]                
  0933  b400             mov ah, 0                                
  0935  3bc6             cmp ax, si                               
  0937  7fe4             jg 0x91d                                 
  0939  5f               pop di                                   
  093a  5e               pop si                                   
  093b  c9               leave                                    
  093c  cb               retf                                     

ovl42_093d:  ; ENTRY
  093d  55               push bp                                  
  093e  8bec             mov bp, sp                               
  0940  9a2f005130       lcall 0x3051, 0x2f                       -> ovl43:0805
  0945  5d               pop bp                                   
  0946  cb               retf                                     

ovl42_0947:  ; ENTRY
  0947  55               push bp                                  
  0948  8bec             mov bp, sp                               
  094a  c706f60d0400     mov word ptr [0xdf6], 4                  
  0950  0e               push cs                                  
  0951  e8a7f9           call 0x2fb                               
  0954  33c9             xor cx, cx                               
  0956  eb15             jmp 0x96d                                
  0958  8bd9             mov bx, cx                               
  095a  d1e3             shl bx, 1                                
  095c  8b875044         mov ax, word ptr [bx + 0x4450]           
  0960  8bd1             mov dx, cx                               
  0962  d1e2             shl dx, 1                                
  0964  c45e06           les bx, ptr [bp + 6]                     
  0967  03da             add bx, dx                               
  0969  268907           mov word ptr es:[bx], ax                 
  096c  41               inc cx                                   
  096d  83f908           cmp cx, 8                                
  0970  7ce6             jl 0x958                                 
  0972  5d               pop bp                                   
  0973  cb               retf                                     
