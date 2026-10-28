; ovl53 stub 3099 file_off 0x6f800 size 0xec9

ovl53_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  33d2             xor dx, dx                               
  0007  b90100           mov cx, 1                                
  000a  b8042c           mov ax, 0x2c04                           
  000d  8ec0             mov es, ax                               
  000f  26c70618010000   mov word ptr es:[0x118], 0               
  0016  8ec0             mov es, ax                               
  0018  26c7065d010000   mov word ptr es:[0x15d], 0               
  001f  8ec0             mov es, ax                               
  0021  26c70635010100   mov word ptr es:[0x135], 1               
  0028  8ec0             mov es, ax                               
  002a  26c70681010a00   mov word ptr es:[0x181], 0xa             
  0031  8ec0             mov es, ax                               
  0033  26c70657010000   mov word ptr es:[0x157], 0               
  003a  33f6             xor si, si                               
  003c  eb13             jmp 0x51                                 
  003e  8bde             mov bx, si                               
  0040  d1e3             shl bx, 1                                
  0042  b8042c           mov ax, 0x2c04                           
  0045  8ec0             mov es, ax                               
  0047  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  004d  7501             jne 0x50                                 
  004f  42               inc dx                                   
  0050  46               inc si                                   
  0051  83fe08           cmp si, 8                                
  0054  7ce8             jl 0x3e                                  
  0056  b8042c           mov ax, 0x2c04                           
  0059  8ec0             mov es, ax                               
  005b  26833e240100     cmp word ptr es:[0x124], 0               
  0061  7407             je 0x6a                                  
  0063  83fa01           cmp dx, 1                                
  0066  7c02             jl 0x6a                                  
  0068  33c9             xor cx, cx                               
  006a  b8042c           mov ax, 0x2c04                           
  006d  8ec0             mov es, ax                               
  006f  26833e240100     cmp word ptr es:[0x124], 0               
  0075  740b             je 0x82                                  
  0077  83fa01           cmp dx, 1                                
  007a  7506             jne 0x82                                 
  007c  c706a6160100     mov word ptr [0x16a6], 1                 
  0082  33f6             xor si, si                               
  0084  eb31             jmp 0xb7                                 
  0086  8bde             mov bx, si                               
  0088  d1e3             shl bx, 1                                
  008a  b8042c           mov ax, 0x2c04                           
  008d  8ec0             mov es, ax                               
  008f  26898f4701       mov word ptr es:[bx + 0x147], cx         
  0094  8bde             mov bx, si                               
  0096  d1e3             shl bx, 1                                
  0098  b8042c           mov ax, 0x2c04                           
  009b  8ec0             mov es, ax                               
  009d  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00a3  7511             jne 0xb6                                 
  00a5  8bde             mov bx, si                               
  00a7  6bdb14           imul bx, bx, 0x14                        
  00aa  b8042c           mov ax, 0x2c04                           
  00ad  8ec0             mov es, ax                               
  00af  26c78785010000   mov word ptr es:[bx + 0x185], 0          
  00b6  46               inc si                                   
  00b7  83fe08           cmp si, 8                                
  00ba  7cca             jl 0x86                                  
  00bc  9a20001d30       lcall 0x301d, 0x20                       -> ovl35:0000
  00c1  bee803           mov si, 0x3e8                            
  00c4  eb33             jmp 0xf9                                 
  00c6  8bde             mov bx, si                               
  00c8  6bdb16           imul bx, bx, 0x16                        
  00cb  b81d1e           mov ax, 0x1e1d                           
  00ce  8ec0             mov es, ax                               
  00d0  26c6878588ff     mov byte ptr es:[bx - 0x777b], 0xff      
  00d6  8bde             mov bx, si                               
  00d8  6bdb16           imul bx, bx, 0x16                        
  00db  ba0000           mov dx, 0                                
  00de  81c28088         add dx, 0x8880                           
  00e2  03da             add bx, dx                               
  00e4  8ec0             mov es, ax                               
  00e6  26c707ffff       mov word ptr es:[bx], 0xffff             
  00eb  8bde             mov bx, si                               
  00ed  6bdb16           imul bx, bx, 0x16                        
  00f0  8ec0             mov es, ax                               
  00f2  26c7878288ffff   mov word ptr es:[bx - 0x777e], 0xffff    
  00f9  8bc6             mov ax, si                               
  00fb  4e               dec si                                   
  00fc  0bc0             or ax, ax                                
  00fe  75c6             jne 0xc6                                 
  0100  6633c0           xor eax, eax                             
  0103  66a35e5e         mov dword ptr [0x5e5e], eax              
  0107  66a3625e         mov dword ptr [0x5e62], eax              
  010b  33f6             xor si, si                               
  010d  eb12             jmp 0x121                                
  010f  8bde             mov bx, si                               
  0111  c1e302           shl bx, 2                                
  0114  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  011a  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0120  46               inc si                                   
  0121  83fe08           cmp si, 8                                
  0124  7ce9             jl 0x10f                                 
  0126  9a20007c30       lcall 0x307c, 0x20                       -> ovl48:0000
  012b  90               nop                                      
  012c  0e               push cs                                  
  012d  e89a06           call 0x7ca                               
  0130  9a2500f930       lcall 0x30f9, 0x25                       -> ovl64:1931
  0135  9a8900f930       lcall 0x30f9, 0x89                       -> ovl64:113b
  013a  9a20000230       lcall 0x3002, 0x20                       -> ovl30:0000
  013f  9a25003730       lcall 0x3037, 0x25                       -> ovl39:00cc
  0144  b8042c           mov ax, 0x2c04                           
  0147  8ec0             mov es, ax                               
  0149  268b3e1001       mov di, word ptr es:[0x110]              
  014e  8ec0             mov es, ax                               
  0150  26833e240100     cmp word ptr es:[0x124], 0               
  0156  7426             je 0x17e                                 
  0158  33f6             xor si, si                               
  015a  eb16             jmp 0x172                                
  015c  8bde             mov bx, si                               
  015e  d1e3             shl bx, 1                                
  0160  b8042c           mov ax, 0x2c04                           
  0163  8ec0             mov es, ax                               
  0165  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  016b  7504             jne 0x171                                
  016d  8bfe             mov di, si                               
  016f  eb06             jmp 0x177                                
  0171  46               inc si                                   
  0172  83fe08           cmp si, 8                                
  0175  7ce5             jl 0x15c                                 
  0177  57               push di                                  
  0178  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  017d  59               pop cx                                   
  017e  8bdf             mov bx, di                               
  0180  6bdb14           imul bx, bx, 0x14                        
  0183  b8042c           mov ax, 0x2c04                           
  0186  8ec0             mov es, ax                               
  0188  268b8f8901       mov cx, word ptr es:[bx + 0x189]         
  018d  8bdf             mov bx, di                               
  018f  6bdb14           imul bx, bx, 0x14                        
  0192  b8042c           mov ax, 0x2c04                           
  0195  8ec0             mov es, ax                               
  0197  268bb78b01       mov si, word ptr es:[bx + 0x18b]         
  019c  83f904           cmp cx, 4                                
  019f  7e04             jle 0x1a5                                
  01a1  8bc1             mov ax, cx                               
  01a3  eb03             jmp 0x1a8                                
  01a5  b80400           mov ax, 4                                
  01a8  8bc8             mov cx, ax                               
  01aa  83fe04           cmp si, 4                                
  01ad  7e04             jle 0x1b3                                
  01af  8bc6             mov ax, si                               
  01b1  eb03             jmp 0x1b6                                
  01b3  b80400           mov ax, 4                                
  01b6  8bf0             mov si, ax                               
  01b8  83f96b           cmp cx, 0x6b                             
  01bb  7d04             jge 0x1c1                                
  01bd  8bc1             mov ax, cx                               
  01bf  eb03             jmp 0x1c4                                
  01c1  b86b00           mov ax, 0x6b                             
  01c4  8bc8             mov cx, ax                               
  01c6  81fe9700         cmp si, 0x97                             
  01ca  7d04             jge 0x1d0                                
  01cc  8bc6             mov ax, si                               
  01ce  eb03             jmp 0x1d3                                
  01d0  b89700           mov ax, 0x97                             
  01d3  8bf0             mov si, ax                               
  01d5  b8042c           mov ax, 0x2c04                           
  01d8  8ec0             mov es, ax                               
  01da  26890e7d01       mov word ptr es:[0x17d], cx              
  01df  8ec0             mov es, ax                               
  01e1  2689367f01       mov word ptr es:[0x17f], si              
  01e6  8ec0             mov es, ax                               
  01e8  26a17d01         mov ax, word ptr es:[0x17d]              
  01ec  05fcff           add ax, 0xfffc                           
  01ef  ba042c           mov dx, 0x2c04                           
  01f2  8ec2             mov es, dx                               
  01f4  26a37701         mov word ptr es:[0x177], ax              
  01f8  b8042c           mov ax, 0x2c04                           
  01fb  8ec0             mov es, ax                               
  01fd  26a17d01         mov ax, word ptr es:[0x17d]              
  0201  050400           add ax, 4                                
  0204  8ec2             mov es, dx                               
  0206  26a37b01         mov word ptr es:[0x17b], ax              
  020a  b8042c           mov ax, 0x2c04                           
  020d  8ec0             mov es, ax                               
  020f  26a17f01         mov ax, word ptr es:[0x17f]              
  0213  05fcff           add ax, 0xfffc                           
  0216  8ec2             mov es, dx                               
  0218  26a37501         mov word ptr es:[0x175], ax              
  021c  b8042c           mov ax, 0x2c04                           
  021f  8ec0             mov es, ax                               
  0221  26a17f01         mov ax, word ptr es:[0x17f]              
  0225  050400           add ax, 4                                
  0228  8ec2             mov es, dx                               
  022a  26a37901         mov word ptr es:[0x179], ax              
  022e  33c9             xor cx, cx                               
  0230  eb35             jmp 0x267                                
  0232  33f6             xor si, si                               
  0234  eb2a             jmp 0x260                                
  0236  8bde             mov bx, si                               
  0238  69dbe000         imul bx, bx, 0xe0                        
  023c  8bc1             mov ax, cx                               
  023e  d1e0             shl ax, 1                                
  0240  03d8             add bx, ax                               
  0242  b81d1e           mov ax, 0x1e1d                           
  0245  8ec0             mov es, ax                               
  0247  2680a70100df     and byte ptr es:[bx + 1], 0xdf           
  024d  8bde             mov bx, si                               
  024f  6bdb70           imul bx, bx, 0x70                        
  0252  03d9             add bx, cx                               
  0254  b8d919           mov ax, 0x19d9                           
  0257  8ec0             mov es, ax                               
  0259  2680a70000bf     and byte ptr es:[bx], 0xbf               
  025f  46               inc si                                   
  0260  81fe9c00         cmp si, 0x9c                             
  0264  7cd0             jl 0x236                                 
  0266  41               inc cx                                   
  0267  83f970           cmp cx, 0x70                             
  026a  7cc6             jl 0x232                                 
  026c  9a25009a2f       lcall 0x2f9a, 0x25                       -> ovl13:0103
  0271  33f6             xor si, si                               
  0273  eb4a             jmp 0x2bf                                
  0275  666a08           push 8                                   
  0278  6a01             push 1                                   
  027a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  027f  83c406           add sp, 6                                
  0282  8bde             mov bx, si                               
  0284  d1e3             shl bx, 1                                
  0286  ba042c           mov dx, 0x2c04                           
  0289  8ec2             mov es, dx                               
  028b  268987e310       mov word ptr es:[bx + 0x10e3], ax        
  0290  b8042c           mov ax, 0x2c04                           
  0293  8ec0             mov es, ax                               
  0295  26833e160100     cmp word ptr es:[0x116], 0               
  029b  7421             je 0x2be                                 
  029d  8bde             mov bx, si                               
  029f  d1e3             shl bx, 1                                
  02a1  b8042c           mov ax, 0x2c04                           
  02a4  8ec0             mov es, ax                               
  02a6  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  02ac  7510             jne 0x2be                                
  02ae  8bde             mov bx, si                               
  02b0  d1e3             shl bx, 1                                
  02b2  b8042c           mov ax, 0x2c04                           
  02b5  8ec0             mov es, ax                               
  02b7  268187e3109001   add word ptr es:[bx + 0x10e3], 0x190     
  02be  46               inc si                                   
  02bf  83fe08           cmp si, 8                                
  02c2  7cb1             jl 0x275                                 
  02c4  9a5200542f       lcall 0x2f54, 0x52                       -> ovl00:11bd
  02c9  5f               pop di                                   
  02ca  5e               pop si                                   
  02cb  5d               pop bp                                   
  02cc  cb               retf                                     

ovl53_02cd:  ; ENTRY
  02cd  55               push bp                                  
  02ce  8bec             mov bp, sp                               
  02d0  83ec3a           sub sp, 0x3a                             
  02d3  56               push si                                  
  02d4  57               push di                                  
  02d5  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  02da  6a02             push 2                                   
  02dc  1e               push ds                                  
  02dd  68a816           push 0x16a8                               ; "DATA\AREA.DAT"
  02e0  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  02e5  83c406           add sp, 6                                
  02e8  8bf0             mov si, ax                               
  02ea  0bf6             or si, si                                
  02ec  7d0c             jge 0x2fa                                
  02ee  1e               push ds                                  
  02ef  68b616           push 0x16b6                               ; "Area file not found"
  02f2  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  02f7  83c404           add sp, 4                                
  02fa  c746fa0000       mov word ptr [bp - 6], 0                 
  02ff  c746fe0000       mov word ptr [bp - 2], 0                 
  0304  eb40             jmp 0x346                                
  0306  6a0e             push 0xe                                 
  0308  16               push ss                                  
  0309  8d46e8           lea ax, [bp - 0x18]                      
  030c  50               push ax                                  
  030d  56               push si                                  
  030e  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0313  83c408           add sp, 8                                
  0316  8b46ee           mov ax, word ptr [bp - 0x12]             
  0319  3b46fa           cmp ax, word ptr [bp - 6]                
  031c  7603             jbe 0x321                                
  031e  8946fa           mov word ptr [bp - 6], ax                
  0321  8b7eee           mov di, word ptr [bp - 0x12]             
  0324  c746fc0000       mov word ptr [bp - 4], 0                 
  0329  eb13             jmp 0x33e                                
  032b  6a0e             push 0xe                                 
  032d  16               push ss                                  
  032e  8d46e8           lea ax, [bp - 0x18]                      
  0331  50               push ax                                  
  0332  56               push si                                  
  0333  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0338  83c408           add sp, 8                                
  033b  ff46fc           inc word ptr [bp - 4]                    
  033e  397efc           cmp word ptr [bp - 4], di                
  0341  7ce8             jl 0x32b                                 
  0343  ff46fe           inc word ptr [bp - 2]                    
  0346  837efe07         cmp word ptr [bp - 2], 7                 
  034a  7cba             jl 0x306                                 
  034c  56               push si                                  
  034d  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0352  59               pop cx                                   
  0353  8b46fa           mov ax, word ptr [bp - 6]                
  0356  6bc00e           imul ax, ax, 0xe                         
  0359  50               push ax                                  
  035a  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  035f  59               pop cx                                   
  0360  89169016         mov word ptr [0x1690], dx                
  0364  a38e16           mov word ptr [0x168e], ax                
  0367  6a02             push 2                                   
  0369  1e               push ds                                  
  036a  68ca16           push 0x16ca                               ; "DATA\BUTTON.DAT"
  036d  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0372  83c406           add sp, 6                                
  0375  8bf0             mov si, ax                               
  0377  0bf6             or si, si                                
  0379  7d0c             jge 0x387                                
  037b  1e               push ds                                  
  037c  68da16           push 0x16da                               ; "Button file not found"
  037f  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0384  83c404           add sp, 4                                
  0387  c746fe0000       mov word ptr [bp - 2], 0                 
  038c  eb4b             jmp 0x3d9                                
  038e  6a21             push 0x21                                
  0390  16               push ss                                  
  0391  8d46c6           lea ax, [bp - 0x3a]                      
  0394  50               push ax                                  
  0395  56               push si                                  
  0396  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  039b  83c408           add sp, 8                                
  039e  8a46ca           mov al, byte ptr [bp - 0x36]             
  03a1  b400             mov ah, 0                                
  03a3  3b46fa           cmp ax, word ptr [bp - 6]                
  03a6  7e08             jle 0x3b0                                
  03a8  8a46ca           mov al, byte ptr [bp - 0x36]             
  03ab  b400             mov ah, 0                                
  03ad  8946fa           mov word ptr [bp - 6], ax                
  03b0  8a46ca           mov al, byte ptr [bp - 0x36]             
  03b3  b400             mov ah, 0                                
  03b5  8bf8             mov di, ax                               
  03b7  c746fc0000       mov word ptr [bp - 4], 0                 
  03bc  eb13             jmp 0x3d1                                
  03be  6a21             push 0x21                                
  03c0  16               push ss                                  
  03c1  8d46c6           lea ax, [bp - 0x3a]                      
  03c4  50               push ax                                  
  03c5  56               push si                                  
  03c6  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  03cb  83c408           add sp, 8                                
  03ce  ff46fc           inc word ptr [bp - 4]                    
  03d1  397efc           cmp word ptr [bp - 4], di                
  03d4  7ce8             jl 0x3be                                 
  03d6  ff46fe           inc word ptr [bp - 2]                    
  03d9  837efe24         cmp word ptr [bp - 2], 0x24              
  03dd  7caf             jl 0x38e                                 
  03df  56               push si                                  
  03e0  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  03e5  59               pop cx                                   
  03e6  8b46fa           mov ax, word ptr [bp - 6]                
  03e9  6bc021           imul ax, ax, 0x21                        
  03ec  50               push ax                                  
  03ed  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  03f2  59               pop cx                                   
  03f3  89168c16         mov word ptr [0x168c], dx                
  03f7  a38a16           mov word ptr [0x168a], ax                
  03fa  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  03ff  6a02             push 2                                   
  0401  1e               push ds                                  
  0402  68f016           push 0x16f0                               ; "DATA\AREA.DAT"
  0405  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  040a  83c406           add sp, 6                                
  040d  8bf0             mov si, ax                               
  040f  0bf6             or si, si                                
  0411  7d0c             jge 0x41f                                
  0413  1e               push ds                                  
  0414  68fe16           push 0x16fe                               ; "Area file not found"
  0417  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  041c  83c404           add sp, 4                                
  041f  56               push si                                  
  0420  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0425  59               pop cx                                   
  0426  8bf8             mov di, ax                               
  0428  666885000000     push 0x85                                
  042e  6a00             push 0                                   
  0430  660fbfc7         movsx eax, di                            
  0434  6650             push eax                                 
  0436  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  043b  83c40a           add sp, 0xa                              
  043e  89164a4c         mov word ptr [0x4c4a], dx                
  0442  a3484c           mov word ptr [0x4c48], ax                
  0445  52               push dx                                  
  0446  50               push ax                                  
  0447  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  044c  83c404           add sp, 4                                
  044f  8956f8           mov word ptr [bp - 8], dx                
  0452  8946f6           mov word ptr [bp - 0xa], ax              
  0455  57               push di                                  
  0456  52               push dx                                  
  0457  50               push ax                                  
  0458  56               push si                                  
  0459  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  045e  83c408           add sp, 8                                
  0461  66ff36484c       push dword ptr [0x4c48]                  
  0466  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  046b  83c404           add sp, 4                                
  046e  56               push si                                  
  046f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0474  59               pop cx                                   
  0475  6a02             push 2                                   
  0477  1e               push ds                                  
  0478  681217           push 0x1712                               ; "DATA\JOIN.DAT"
  047b  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0480  83c406           add sp, 6                                
  0483  8bf0             mov si, ax                               
  0485  0bf6             or si, si                                
  0487  7d0c             jge 0x495                                
  0489  1e               push ds                                  
  048a  682017           push 0x1720                               ; "Join file not found"
  048d  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0492  83c404           add sp, 4                                
  0495  56               push si                                  
  0496  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  049b  59               pop cx                                   
  049c  8bf8             mov di, ax                               
  049e  666886000000     push 0x86                                
  04a4  6a00             push 0                                   
  04a6  660fbfc7         movsx eax, di                            
  04aa  6650             push eax                                 
  04ac  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  04b1  83c40a           add sp, 0xa                              
  04b4  89164e4c         mov word ptr [0x4c4e], dx                
  04b8  a34c4c           mov word ptr [0x4c4c], ax                
  04bb  52               push dx                                  
  04bc  50               push ax                                  
  04bd  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  04c2  83c404           add sp, 4                                
  04c5  8956f8           mov word ptr [bp - 8], dx                
  04c8  8946f6           mov word ptr [bp - 0xa], ax              
  04cb  57               push di                                  
  04cc  52               push dx                                  
  04cd  50               push ax                                  
  04ce  56               push si                                  
  04cf  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  04d4  83c408           add sp, 8                                
  04d7  66ff364c4c       push dword ptr [0x4c4c]                  
  04dc  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  04e1  83c404           add sp, 4                                
  04e4  56               push si                                  
  04e5  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  04ea  59               pop cx                                   
  04eb  6a02             push 2                                   
  04ed  1e               push ds                                  
  04ee  683417           push 0x1734                               ; "DATA\BUTTON.DAT"
  04f1  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  04f6  83c406           add sp, 6                                
  04f9  8bf0             mov si, ax                               
  04fb  0bf6             or si, si                                
  04fd  7d0c             jge 0x50b                                
  04ff  1e               push ds                                  
  0500  684417           push 0x1744                               ; "Button file not found"
  0503  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0508  83c404           add sp, 4                                
  050b  56               push si                                  
  050c  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0511  59               pop cx                                   
  0512  8bf8             mov di, ax                               
  0514  666887000000     push 0x87                                
  051a  6a00             push 0                                   
  051c  660fbfc7         movsx eax, di                            
  0520  6650             push eax                                 
  0522  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0527  83c40a           add sp, 0xa                              
  052a  8916464c         mov word ptr [0x4c46], dx                
  052e  a3444c           mov word ptr [0x4c44], ax                
  0531  52               push dx                                  
  0532  50               push ax                                  
  0533  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0538  83c404           add sp, 4                                
  053b  8956f8           mov word ptr [bp - 8], dx                
  053e  8946f6           mov word ptr [bp - 0xa], ax              
  0541  57               push di                                  
  0542  52               push dx                                  
  0543  50               push ax                                  
  0544  56               push si                                  
  0545  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  054a  83c408           add sp, 8                                
  054d  66ff36444c       push dword ptr [0x4c44]                  
  0552  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0557  83c404           add sp, 4                                
  055a  56               push si                                  
  055b  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0560  59               pop cx                                   
  0561  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0566  5f               pop di                                   
  0567  5e               pop si                                   
  0568  c9               leave                                    
  0569  cb               retf                                     

ovl53_056a:  ; ENTRY
  056a  55               push bp                                  
  056b  8bec             mov bp, sp                               
  056d  83ec4a           sub sp, 0x4a                             
  0570  56               push si                                  
  0571  57               push di                                  
  0572  66ff364c4c       push dword ptr [0x4c4c]                  
  0577  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  057c  83c404           add sp, 4                                
  057f  8956f4           mov word ptr [bp - 0xc], dx              
  0582  8946f2           mov word ptr [bp - 0xe], ax              
  0585  668b46f2         mov eax, dword ptr [bp - 0xe]            
  0589  668946ee         mov dword ptr [bp - 0x12], eax           
  058d  33ff             xor di, di                               
  058f  c746fe0000       mov word ptr [bp - 2], 0                 
  0594  eb3c             jmp 0x5d2                                
  0596  c45eee           les bx, ptr [bp - 0x12]                  
  0599  268b07           mov ax, word ptr es:[bx]                 
  059c  8946fc           mov word ptr [bp - 4], ax                
  059f  8346ee02         add word ptr [bp - 0x12], 2              
  05a3  3b4606           cmp ax, word ptr [bp + 6]                
  05a6  751f             jne 0x5c7                                
  05a8  c45eee           les bx, ptr [bp - 0x12]                  
  05ab  268b07           mov ax, word ptr es:[bx]                 
  05ae  8946f8           mov word ptr [bp - 8], ax                
  05b1  8346ee02         add word ptr [bp - 0x12], 2              
  05b5  c45eee           les bx, ptr [bp - 0x12]                  
  05b8  268b07           mov ax, word ptr es:[bx]                 
  05bb  8946fa           mov word ptr [bp - 6], ax                
  05be  8346ee02         add word ptr [bp - 0x12], 2              
  05c2  bf0100           mov di, 1                                
  05c5  eb08             jmp 0x5cf                                
  05c7  8346ee02         add word ptr [bp - 0x12], 2              
  05cb  8346ee02         add word ptr [bp - 0x12], 2              
  05cf  ff46fe           inc word ptr [bp - 2]                    
  05d2  837efe24         cmp word ptr [bp - 2], 0x24              
  05d6  7cbe             jl 0x596                                 
  05d8  66ff364c4c       push dword ptr [0x4c4c]                  
  05dd  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  05e2  83c404           add sp, 4                                
  05e5  0bff             or di, di                                
  05e7  750c             jne 0x5f5                                
  05e9  1e               push ds                                  
  05ea  685a17           push 0x175a                               ; "Join data not found"
  05ed  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  05f2  83c404           add sp, 4                                
  05f5  66ff36484c       push dword ptr [0x4c48]                  
  05fa  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  05ff  83c404           add sp, 4                                
  0602  8956f4           mov word ptr [bp - 0xc], dx              
  0605  8946f2           mov word ptr [bp - 0xe], ax              
  0608  668b46f2         mov eax, dword ptr [bp - 0xe]            
  060c  668946ea         mov dword ptr [bp - 0x16], eax           
  0610  33ff             xor di, di                               
  0612  c746fe0000       mov word ptr [bp - 2], 0                 
  0617  eb6d             jmp 0x686                                
  0619  8d46d8           lea ax, [bp - 0x28]                      
  061c  16               push ss                                  
  061d  50               push ax                                  
  061e  66ff76ea         push dword ptr [bp - 0x16]               
  0622  b90e00           mov cx, 0xe                              
  0625  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  062a  8346ea0e         add word ptr [bp - 0x16], 0xe            
  062e  8b46da           mov ax, word ptr [bp - 0x26]             
  0631  3b46fa           cmp ax, word ptr [bp - 6]                
  0634  753d             jne 0x673                                
  0636  8b46dc           mov ax, word ptr [bp - 0x24]             
  0639  8946f6           mov word ptr [bp - 0xa], ax              
  063c  33f6             xor si, si                               
  063e  eb23             jmp 0x663                                
  0640  8bc6             mov ax, si                               
  0642  6bc00e           imul ax, ax, 0xe                         
  0645  8b169016         mov dx, word ptr [0x1690]                
  0649  50               push ax                                  
  064a  a18e16           mov ax, word ptr [0x168e]                
  064d  5b               pop bx                                   
  064e  03c3             add ax, bx                               
  0650  52               push dx                                  
  0651  50               push ax                                  
  0652  66ff76ea         push dword ptr [bp - 0x16]               
  0656  b90e00           mov cx, 0xe                              
  0659  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  065e  8346ea0e         add word ptr [bp - 0x16], 0xe            
  0662  46               inc si                                   
  0663  3b76de           cmp si, word ptr [bp - 0x22]             
  0666  72d8             jb 0x640                                 
  0668  bf0100           mov di, 1                                
  066b  8b46de           mov ax, word ptr [bp - 0x22]             
  066e  a38616           mov word ptr [0x1686], ax                
  0671  eb19             jmp 0x68c                                
  0673  8b56de           mov dx, word ptr [bp - 0x22]             
  0676  33f6             xor si, si                               
  0678  eb05             jmp 0x67f                                
  067a  8346ea0e         add word ptr [bp - 0x16], 0xe            
  067e  46               inc si                                   
  067f  3bf2             cmp si, dx                               
  0681  7cf7             jl 0x67a                                 
  0683  ff46fe           inc word ptr [bp - 2]                    
  0686  837efe07         cmp word ptr [bp - 2], 7                 
  068a  7c8d             jl 0x619                                 
  068c  66ff36484c       push dword ptr [0x4c48]                  
  0691  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0696  83c404           add sp, 4                                
  0699  0bff             or di, di                                
  069b  750c             jne 0x6a9                                
  069d  1e               push ds                                  
  069e  686e17           push 0x176e                               ; "Area data not found"
  06a1  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  06a6  83c404           add sp, 4                                
  06a9  66ff36444c       push dword ptr [0x4c44]                  
  06ae  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  06b3  83c404           add sp, 4                                
  06b6  8956f4           mov word ptr [bp - 0xc], dx              
  06b9  8946f2           mov word ptr [bp - 0xe], ax              
  06bc  668b46f2         mov eax, dword ptr [bp - 0xe]            
  06c0  668946e6         mov dword ptr [bp - 0x1a], eax           
  06c4  33ff             xor di, di                               
  06c6  c746fe0000       mov word ptr [bp - 2], 0                 
  06cb  eb71             jmp 0x73e                                
  06cd  8d46b6           lea ax, [bp - 0x4a]                      
  06d0  16               push ss                                  
  06d1  50               push ax                                  
  06d2  66ff76e6         push dword ptr [bp - 0x1a]               
  06d6  b92100           mov cx, 0x21                             
  06d9  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  06de  8346e621         add word ptr [bp - 0x1a], 0x21           
  06e2  8b46b8           mov ax, word ptr [bp - 0x48]             
  06e5  3b46f8           cmp ax, word ptr [bp - 8]                
  06e8  753d             jne 0x727                                
  06ea  33f6             xor si, si                               
  06ec  eb23             jmp 0x711                                
  06ee  8bc6             mov ax, si                               
  06f0  6bc021           imul ax, ax, 0x21                        
  06f3  8b168c16         mov dx, word ptr [0x168c]                
  06f7  50               push ax                                  
  06f8  a18a16           mov ax, word ptr [0x168a]                
  06fb  5b               pop bx                                   
  06fc  03c3             add ax, bx                               
  06fe  52               push dx                                  
  06ff  50               push ax                                  
  0700  66ff76e6         push dword ptr [bp - 0x1a]               
  0704  b92100           mov cx, 0x21                             
  0707  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  070c  8346e621         add word ptr [bp - 0x1a], 0x21           
  0710  46               inc si                                   
  0711  8a46ba           mov al, byte ptr [bp - 0x46]             
  0714  b400             mov ah, 0                                
  0716  3bc6             cmp ax, si                               
  0718  7fd4             jg 0x6ee                                 
  071a  8a46ba           mov al, byte ptr [bp - 0x46]             
  071d  b400             mov ah, 0                                
  071f  a38816           mov word ptr [0x1688], ax                
  0722  bf0100           mov di, 1                                
  0725  eb1d             jmp 0x744                                
  0727  8a46ba           mov al, byte ptr [bp - 0x46]             
  072a  b400             mov ah, 0                                
  072c  8bd0             mov dx, ax                               
  072e  33f6             xor si, si                               
  0730  eb05             jmp 0x737                                
  0732  8346e621         add word ptr [bp - 0x1a], 0x21           
  0736  46               inc si                                   
  0737  3bf2             cmp si, dx                               
  0739  7cf7             jl 0x732                                 
  073b  ff46fe           inc word ptr [bp - 2]                    
  073e  837efe24         cmp word ptr [bp - 2], 0x24              
  0742  7c89             jl 0x6cd                                 
  0744  66ff36444c       push dword ptr [0x4c44]                  
  0749  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  074e  83c404           add sp, 4                                
  0751  0bff             or di, di                                
  0753  750c             jne 0x761                                
  0755  1e               push ds                                  
  0756  688217           push 0x1782                               ; "Button data not found"
  0759  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  075e  83c404           add sp, 4                                
  0761  66a18a16         mov eax, dword ptr [0x168a]              
  0765  66a39216         mov dword ptr [0x1692], eax              
  0769  66a18e16         mov eax, dword ptr [0x168e]              
  076d  66a39616         mov dword ptr [0x1696], eax              
  0771  8c1e9c16         mov word ptr [0x169c], ds                
  0775  c7069a168816     mov word ptr [0x169a], 0x1688            
  077b  8c1ea016         mov word ptr [0x16a0], ds                
  077f  c7069e168616     mov word ptr [0x169e], 0x1686            
  0785  8c1e424c         mov word ptr [0x4c42], ds                
  0789  c706404c9216     mov word ptr [0x4c40], 0x1692            
  078f  9a4503a908       lcall 0x8a9, 0x345                       -> 08a9:0345
  0794  c746fe0000       mov word ptr [bp - 2], 0                 
  0799  eb25             jmp 0x7c0                                
  079b  b80100           mov ax, 1                                
  079e  8a4efe           mov cl, byte ptr [bp - 2]                
  07a1  d3e0             shl ax, cl                               
  07a3  8546f6           test word ptr [bp - 0xa], ax             
  07a6  7415             je 0x7bd                                 
  07a8  8b46fe           mov ax, word ptr [bp - 2]                
  07ab  6bc00e           imul ax, ax, 0xe                         
  07ae  c41e8e16         les bx, ptr [0x168e]                     
  07b2  03d8             add bx, ax                               
  07b4  26ff37           push word ptr es:[bx]                    
  07b7  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  07bc  59               pop cx                                   
  07bd  ff46fe           inc word ptr [bp - 2]                    
  07c0  837efe08         cmp word ptr [bp - 2], 8                 
  07c4  7cd5             jl 0x79b                                 
  07c6  5f               pop di                                   
  07c7  5e               pop si                                   
  07c8  c9               leave                                    
  07c9  cb               retf                                     

ovl53_07ca:  ; ENTRY
  07ca  55               push bp                                  
  07cb  8bec             mov bp, sp                               
  07cd  83ec24           sub sp, 0x24                             
  07d0  56               push si                                  
  07d1  c746feffff       mov word ptr [bp - 2], 0xffff            
  07d6  c746fc0800       mov word ptr [bp - 4], 8                 
  07db  e94301           jmp 0x921                                
  07de  8b5efc           mov bx, word ptr [bp - 4]                
  07e1  d1e3             shl bx, 1                                
  07e3  b8042c           mov ax, 0x2c04                           
  07e6  8ec0             mov es, ax                               
  07e8  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  07ee  7442             je 0x832                                 
  07f0  8b5efc           mov bx, word ptr [bp - 4]                
  07f3  6bdb14           imul bx, bx, 0x14                        
  07f6  b8042c           mov ax, 0x2c04                           
  07f9  8ec0             mov es, ax                               
  07fb  268b878901       mov ax, word ptr es:[bx + 0x189]         
  0800  8b5efc           mov bx, word ptr [bp - 4]                
  0803  6bdb14           imul bx, bx, 0x14                        
  0806  ba042c           mov dx, 0x2c04                           
  0809  8ec2             mov es, dx                               
  080b  2689879301       mov word ptr es:[bx + 0x193], ax         
  0810  8b5efc           mov bx, word ptr [bp - 4]                
  0813  6bdb14           imul bx, bx, 0x14                        
  0816  b8042c           mov ax, 0x2c04                           
  0819  8ec0             mov es, ax                               
  081b  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  0820  8b5efc           mov bx, word ptr [bp - 4]                
  0823  6bdb14           imul bx, bx, 0x14                        
  0826  ba042c           mov dx, 0x2c04                           
  0829  8ec2             mov es, dx                               
  082b  2689879501       mov word ptr es:[bx + 0x195], ax         
  0830  eb24             jmp 0x856                                
  0832  8b5efc           mov bx, word ptr [bp - 4]                
  0835  6bdb14           imul bx, bx, 0x14                        
  0838  b8042c           mov ax, 0x2c04                           
  083b  8ec0             mov es, ax                               
  083d  26c7879301ffff   mov word ptr es:[bx + 0x193], 0xffff     
  0844  8b5efc           mov bx, word ptr [bp - 4]                
  0847  6bdb14           imul bx, bx, 0x14                        
  084a  b8042c           mov ax, 0x2c04                           
  084d  8ec0             mov es, ax                               
  084f  26c7879501ffff   mov word ptr es:[bx + 0x195], 0xffff     
  0856  8b5efc           mov bx, word ptr [bp - 4]                
  0859  6bdb14           imul bx, bx, 0x14                        
  085c  b8042c           mov ax, 0x2c04                           
  085f  8ec0             mov es, ax                               
  0861  268b878901       mov ax, word ptr es:[bx + 0x189]         
  0866  8b5efc           mov bx, word ptr [bp - 4]                
  0869  d1e3             shl bx, 1                                
  086b  8d56ec           lea dx, [bp - 0x14]                      
  086e  03da             add bx, dx                               
  0870  368907           mov word ptr ss:[bx], ax                 
  0873  8b5efc           mov bx, word ptr [bp - 4]                
  0876  6bdb14           imul bx, bx, 0x14                        
  0879  b8042c           mov ax, 0x2c04                           
  087c  8ec0             mov es, ax                               
  087e  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  0883  8b5efc           mov bx, word ptr [bp - 4]                
  0886  d1e3             shl bx, 1                                
  0888  8d56dc           lea dx, [bp - 0x24]                      
  088b  03da             add bx, dx                               
  088d  368907           mov word ptr ss:[bx], ax                 
  0890  8b5efc           mov bx, word ptr [bp - 4]                
  0893  d1e3             shl bx, 1                                
  0895  8d46dc           lea ax, [bp - 0x24]                      
  0898  03d8             add bx, ax                               
  089a  36ff37           push word ptr ss:[bx]                    
  089d  8b5efc           mov bx, word ptr [bp - 4]                
  08a0  d1e3             shl bx, 1                                
  08a2  8d46ec           lea ax, [bp - 0x14]                      
  08a5  03d8             add bx, ax                               
  08a7  36ff37           push word ptr ss:[bx]                    
  08aa  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  08af  83c404           add sp, 4                                
  08b2  8bf0             mov si, ax                               
  08b4  0bf6             or si, si                                
  08b6  7c69             jl 0x921                                 
  08b8  8b5efc           mov bx, word ptr [bp - 4]                
  08bb  d1e3             shl bx, 1                                
  08bd  b8042c           mov ax, 0x2c04                           
  08c0  8ec0             mov es, ax                               
  08c2  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  08c8  7431             je 0x8fb                                 
  08ca  ff76fc           push word ptr [bp - 4]                   
  08cd  8bc6             mov ax, si                               
  08cf  6bc041           imul ax, ax, 0x41                        
  08d2  057d15           add ax, 0x157d                           
  08d5  68042c           push 0x2c04                              
  08d8  50               push ax                                  
  08d9  9a20003730       lcall 0x3037, 0x20                       -> ovl39:0000
  08de  83c406           add sp, 6                                
  08e1  8bde             mov bx, si                               
  08e3  6bdb41           imul bx, bx, 0x41                        
  08e6  b8042c           mov ax, 0x2c04                           
  08e9  8a56fc           mov dl, byte ptr [bp - 4]                
  08ec  8ec0             mov es, ax                               
  08ee  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  08f3  8b46fc           mov ax, word ptr [bp - 4]                
  08f6  8946fe           mov word ptr [bp - 2], ax                
  08f9  eb26             jmp 0x921                                
  08fb  6a0f             push 0xf                                 
  08fd  8bc6             mov ax, si                               
  08ff  6bc041           imul ax, ax, 0x41                        
  0902  057d15           add ax, 0x157d                           
  0905  68042c           push 0x2c04                              
  0908  50               push ax                                  
  0909  9a20003730       lcall 0x3037, 0x20                       -> ovl39:0000
  090e  83c406           add sp, 6                                
  0911  8bde             mov bx, si                               
  0913  6bdb41           imul bx, bx, 0x41                        
  0916  b8042c           mov ax, 0x2c04                           
  0919  8ec0             mov es, ax                               
  091b  26c68792150f     mov byte ptr es:[bx + 0x1592], 0xf       
  0921  8b46fc           mov ax, word ptr [bp - 4]                
  0924  ff4efc           dec word ptr [bp - 4]                    
  0927  0bc0             or ax, ax                                
  0929  7403             je 0x92e                                 
  092b  e9b0fe           jmp 0x7de                                
  092e  837efeff         cmp word ptr [bp - 2], -1                
  0932  7503             jne 0x937                                
  0934  e90501           jmp 0xa3c                                
  0937  b8042c           mov ax, 0x2c04                           
  093a  8ec0             mov es, ax                               
  093c  26833e280100     cmp word ptr es:[0x128], 0               
  0942  7503             jne 0x947                                
  0944  e9f500           jmp 0xa3c                                
  0947  e9c400           jmp 0xa0e                                
  094a  ff76fe           push word ptr [bp - 2]                   
  094d  8bc6             mov ax, si                               
  094f  6bc041           imul ax, ax, 0x41                        
  0952  057d15           add ax, 0x157d                           
  0955  68042c           push 0x2c04                              
  0958  50               push ax                                  
  0959  9a20003730       lcall 0x3037, 0x20                       -> ovl39:0000
  095e  83c406           add sp, 6                                
  0961  8bde             mov bx, si                               
  0963  6bdb41           imul bx, bx, 0x41                        
  0966  b8042c           mov ax, 0x2c04                           
  0969  8a56fe           mov dl, byte ptr [bp - 2]                
  096c  8ec0             mov es, ax                               
  096e  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  0973  66680a00ffff     push 0xffff000a                          
  0979  6a01             push 1                                   
  097b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0980  83c406           add sp, 6                                
  0983  3d0400           cmp ax, 4                                
  0986  7f2f             jg 0x9b7                                 
  0988  8b5efe           mov bx, word ptr [bp - 2]                
  098b  6bdb14           imul bx, bx, 0x14                        
  098e  b8042c           mov ax, 0x2c04                           
  0991  8ec0             mov es, ax                               
  0993  268b878901       mov ax, word ptr es:[bx + 0x189]         
  0998  8b5efe           mov bx, word ptr [bp - 2]                
  099b  d1e3             shl bx, 1                                
  099d  8d56ec           lea dx, [bp - 0x14]                      
  09a0  03da             add bx, dx                               
  09a2  368907           mov word ptr ss:[bx], ax                 
  09a5  8b5efe           mov bx, word ptr [bp - 2]                
  09a8  6bdb14           imul bx, bx, 0x14                        
  09ab  b8042c           mov ax, 0x2c04                           
  09ae  8ec0             mov es, ax                               
  09b0  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  09b5  eb2b             jmp 0x9e2                                
  09b7  8bde             mov bx, si                               
  09b9  6bdb41           imul bx, bx, 0x41                        
  09bc  b8042c           mov ax, 0x2c04                           
  09bf  8ec0             mov es, ax                               
  09c1  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  09c6  8b5efe           mov bx, word ptr [bp - 2]                
  09c9  d1e3             shl bx, 1                                
  09cb  8d56ec           lea dx, [bp - 0x14]                      
  09ce  03da             add bx, dx                               
  09d0  368907           mov word ptr ss:[bx], ax                 
  09d3  8bde             mov bx, si                               
  09d5  6bdb41           imul bx, bx, 0x41                        
  09d8  b8042c           mov ax, 0x2c04                           
  09db  8ec0             mov es, ax                               
  09dd  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  09e2  8b5efe           mov bx, word ptr [bp - 2]                
  09e5  d1e3             shl bx, 1                                
  09e7  8d56dc           lea dx, [bp - 0x24]                      
  09ea  03da             add bx, dx                               
  09ec  368907           mov word ptr ss:[bx], ax                 
  09ef  8b46fe           mov ax, word ptr [bp - 2]                
  09f2  40               inc ax                                   
  09f3  bb0800           mov bx, 8                                
  09f6  99               cdq                                      
  09f7  f7fb             idiv bx                                  
  09f9  8956fe           mov word ptr [bp - 2], dx                
  09fc  8b5efe           mov bx, word ptr [bp - 2]                
  09ff  d1e3             shl bx, 1                                
  0a01  b8042c           mov ax, 0x2c04                           
  0a04  8ec0             mov es, ax                               
  0a06  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0a0c  74e1             je 0x9ef                                 
  0a0e  666a0f           push 0xf                                 
  0a11  8b5efe           mov bx, word ptr [bp - 2]                
  0a14  d1e3             shl bx, 1                                
  0a16  8d46dc           lea ax, [bp - 0x24]                      
  0a19  03d8             add bx, ax                               
  0a1b  36ff37           push word ptr ss:[bx]                    
  0a1e  8b5efe           mov bx, word ptr [bp - 2]                
  0a21  d1e3             shl bx, 1                                
  0a23  8d46ec           lea ax, [bp - 0x14]                      
  0a26  03d8             add bx, ax                               
  0a28  36ff37           push word ptr ss:[bx]                    
  0a2b  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  0a30  83c408           add sp, 8                                
  0a33  8bf0             mov si, ax                               
  0a35  0bc0             or ax, ax                                
  0a37  7c03             jl 0xa3c                                 
  0a39  e90eff           jmp 0x94a                                
  0a3c  90               nop                                      
  0a3d  0e               push cs                                  
  0a3e  e83400           call 0xa75                               
  0a41  c746fc0000       mov word ptr [bp - 4], 0                 
  0a46  eb1c             jmp 0xa64                                
  0a48  ff76fc           push word ptr [bp - 4]                   
  0a4b  9a98005830       lcall 0x3058, 0x98                       -> ovl44:0930
  0a50  59               pop cx                                   
  0a51  8b5efc           mov bx, word ptr [bp - 4]                
  0a54  6bdb41           imul bx, bx, 0x41                        
  0a57  ba042c           mov dx, 0x2c04                           
  0a5a  8ec2             mov es, dx                               
  0a5c  2688879115       mov byte ptr es:[bx + 0x1591], al        
  0a61  ff46fc           inc word ptr [bp - 4]                    
  0a64  b8042c           mov ax, 0x2c04                           
  0a67  8ec0             mov es, ax                               
  0a69  26a17b15         mov ax, word ptr es:[0x157b]             
  0a6d  3b46fc           cmp ax, word ptr [bp - 4]                
  0a70  7fd6             jg 0xa48                                 
  0a72  5e               pop si                                   
  0a73  c9               leave                                    
  0a74  cb               retf                                     

ovl53_0a75:  ; ENTRY
  0a75  55               push bp                                  
  0a76  8bec             mov bp, sp                               
  0a78  83ec40           sub sp, 0x40                             
  0a7b  56               push si                                  
  0a7c  57               push di                                  
  0a7d  33f6             xor si, si                               
  0a7f  e98800           jmp 0xb0a                                
  0a82  33ff             xor di, di                               
  0a84  eb24             jmp 0xaaa                                
  0a86  8bde             mov bx, si                               
  0a88  6bdb41           imul bx, bx, 0x41                        
  0a8b  03df             add bx, di                               
  0a8d  b8042c           mov ax, 0x2c04                           
  0a90  8ec0             mov es, ax                               
  0a92  2680bf931505     cmp byte ptr es:[bx + 0x1593], 5         
  0a98  750f             jne 0xaa9                                
  0a9a  8bde             mov bx, si                               
  0a9c  6bdb41           imul bx, bx, 0x41                        
  0a9f  03df             add bx, di                               
  0aa1  8ec0             mov es, ax                               
  0aa3  26c6879315ff     mov byte ptr es:[bx + 0x1593], 0xff      
  0aa9  47               inc di                                   
  0aaa  83ff04           cmp di, 4                                
  0aad  7cd7             jl 0xa86                                 
  0aaf  33ff             xor di, di                               
  0ab1  eb51             jmp 0xb04                                
  0ab3  8bde             mov bx, si                               
  0ab5  6bdb41           imul bx, bx, 0x41                        
  0ab8  03df             add bx, di                               
  0aba  b8042c           mov ax, 0x2c04                           
  0abd  8ec0             mov es, ax                               
  0abf  2680bf9315ff     cmp byte ptr es:[bx + 0x1593], 0xff      
  0ac5  753c             jne 0xb03                                
  0ac7  8bcf             mov cx, di                               
  0ac9  eb23             jmp 0xaee                                
  0acb  8bde             mov bx, si                               
  0acd  6bdb41           imul bx, bx, 0x41                        
  0ad0  03d9             add bx, cx                               
  0ad2  b8042c           mov ax, 0x2c04                           
  0ad5  8ec0             mov es, ax                               
  0ad7  268a879415       mov al, byte ptr es:[bx + 0x1594]        
  0adc  8bde             mov bx, si                               
  0ade  6bdb41           imul bx, bx, 0x41                        
  0ae1  03d9             add bx, cx                               
  0ae3  ba042c           mov dx, 0x2c04                           
  0ae6  8ec2             mov es, dx                               
  0ae8  2688879315       mov byte ptr es:[bx + 0x1593], al        
  0aed  41               inc cx                                   
  0aee  83f903           cmp cx, 3                                
  0af1  7cd8             jl 0xacb                                 
  0af3  8bde             mov bx, si                               
  0af5  6bdb41           imul bx, bx, 0x41                        
  0af8  b8042c           mov ax, 0x2c04                           
  0afb  8ec0             mov es, ax                               
  0afd  26c6879615ff     mov byte ptr es:[bx + 0x1596], 0xff      
  0b03  47               inc di                                   
  0b04  83ff04           cmp di, 4                                
  0b07  7caa             jl 0xab3                                 
  0b09  46               inc si                                   
  0b0a  b8042c           mov ax, 0x2c04                           
  0b0d  8ec0             mov es, ax                               
  0b0f  2639367b15       cmp word ptr es:[0x157b], si             
  0b14  7e03             jle 0xb19                                
  0b16  e969ff           jmp 0xa82                                
  0b19  c746fe0000       mov word ptr [bp - 2], 0                 
  0b1e  e99500           jmp 0xbb6                                
  0b21  16               push ss                                  
  0b22  8d46c0           lea ax, [bp - 0x40]                      
  0b25  50               push ax                                  
  0b26  ff76fe           push word ptr [bp - 2]                   
  0b29  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0b2e  83c406           add sp, 6                                
  0b31  33f6             xor si, si                               
  0b33  eb72             jmp 0xba7                                
  0b35  33ff             xor di, di                               
  0b37  eb68             jmp 0xba1                                
  0b39  8bde             mov bx, si                               
  0b3b  6bdb41           imul bx, bx, 0x41                        
  0b3e  03df             add bx, di                               
  0b40  b8042c           mov ax, 0x2c04                           
  0b43  8ec0             mov es, ax                               
  0b45  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0b4a  98               cwde                                     
  0b4b  3b46fe           cmp ax, word ptr [bp - 2]                
  0b4e  7550             jne 0xba0                                
  0b50  8bde             mov bx, si                               
  0b52  6bdb41           imul bx, bx, 0x41                        
  0b55  03df             add bx, di                               
  0b57  b8042c           mov ax, 0x2c04                           
  0b5a  8a56d6           mov dl, byte ptr [bp - 0x2a]             
  0b5d  8ec0             mov es, ax                               
  0b5f  2688979b15       mov byte ptr es:[bx + 0x159b], dl        
  0b64  8bde             mov bx, si                               
  0b66  6bdb41           imul bx, bx, 0x41                        
  0b69  03df             add bx, di                               
  0b6b  b8042c           mov ax, 0x2c04                           
  0b6e  8a56d8           mov dl, byte ptr [bp - 0x28]             
  0b71  8ec0             mov es, ax                               
  0b73  2688979715       mov byte ptr es:[bx + 0x1597], dl        
  0b78  8bde             mov bx, si                               
  0b7a  6bdb41           imul bx, bx, 0x41                        
  0b7d  03df             add bx, di                               
  0b7f  b8042c           mov ax, 0x2c04                           
  0b82  8a56dc           mov dl, byte ptr [bp - 0x24]             
  0b85  8ec0             mov es, ax                               
  0b87  2688979f15       mov byte ptr es:[bx + 0x159f], dl        
  0b8c  8bde             mov bx, si                               
  0b8e  6bdb41           imul bx, bx, 0x41                        
  0b91  03df             add bx, di                               
  0b93  b8042c           mov ax, 0x2c04                           
  0b96  8a56da           mov dl, byte ptr [bp - 0x26]             
  0b99  8ec0             mov es, ax                               
  0b9b  268897a315       mov byte ptr es:[bx + 0x15a3], dl        
  0ba0  47               inc di                                   
  0ba1  83ff04           cmp di, 4                                
  0ba4  7c93             jl 0xb39                                 
  0ba6  46               inc si                                   
  0ba7  b8042c           mov ax, 0x2c04                           
  0baa  8ec0             mov es, ax                               
  0bac  2639367b15       cmp word ptr es:[0x157b], si             
  0bb1  7f82             jg 0xb35                                 
  0bb3  ff46fe           inc word ptr [bp - 2]                    
  0bb6  837efe1d         cmp word ptr [bp - 2], 0x1d              
  0bba  7d03             jge 0xbbf                                
  0bbc  e962ff           jmp 0xb21                                
  0bbf  33f6             xor si, si                               
  0bc1  eb08             jmp 0xbcb                                
  0bc3  56               push si                                  
  0bc4  9aa2005830       lcall 0x3058, 0xa2                       -> ovl44:1544
  0bc9  59               pop cx                                   
  0bca  46               inc si                                   
  0bcb  b8042c           mov ax, 0x2c04                           
  0bce  8ec0             mov es, ax                               
  0bd0  2639367b15       cmp word ptr es:[0x157b], si             
  0bd5  7fec             jg 0xbc3                                 
  0bd7  33f6             xor si, si                               
  0bd9  e9da02           jmp 0xeb6                                
  0bdc  33ff             xor di, di                               
  0bde  e9cc02           jmp 0xead                                
  0be1  8bde             mov bx, si                               
  0be3  6bdb41           imul bx, bx, 0x41                        
  0be6  03df             add bx, di                               
  0be8  b8042c           mov ax, 0x2c04                           
  0beb  8ec0             mov es, ax                               
  0bed  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  0bf3  7d03             jge 0xbf8                                
  0bf5  e9bd02           jmp 0xeb5                                
  0bf8  666a64           push 0x64                                
  0bfb  6a01             push 1                                   
  0bfd  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c02  83c406           add sp, 6                                
  0c05  3d0a00           cmp ax, 0xa                              
  0c08  7c03             jl 0xc0d                                 
  0c0a  e98300           jmp 0xc90                                
  0c0d  666a64           push 0x64                                
  0c10  6a01             push 1                                   
  0c12  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c17  83c406           add sp, 6                                
  0c1a  3d3c00           cmp ax, 0x3c                             
  0c1d  7d31             jge 0xc50                                
  0c1f  8bde             mov bx, si                               
  0c21  6bdb41           imul bx, bx, 0x41                        
  0c24  03df             add bx, di                               
  0c26  b8042c           mov ax, 0x2c04                           
  0c29  8ec0             mov es, ax                               
  0c2b  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0c30  98               cwde                                     
  0c31  40               inc ax                                   
  0c32  3d0900           cmp ax, 9                                
  0c35  7d15             jge 0xc4c                                
  0c37  8bde             mov bx, si                               
  0c39  6bdb41           imul bx, bx, 0x41                        
  0c3c  03df             add bx, di                               
  0c3e  b8042c           mov ax, 0x2c04                           
  0c41  8ec0             mov es, ax                               
  0c43  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0c48  fec0             inc al                                   
  0c4a  eb33             jmp 0xc7f                                
  0c4c  b009             mov al, 9                                
  0c4e  eb2f             jmp 0xc7f                                
  0c50  8bde             mov bx, si                               
  0c52  6bdb41           imul bx, bx, 0x41                        
  0c55  03df             add bx, di                               
  0c57  b8042c           mov ax, 0x2c04                           
  0c5a  8ec0             mov es, ax                               
  0c5c  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0c61  98               cwde                                     
  0c62  48               dec ax                                   
  0c63  3d0100           cmp ax, 1                                
  0c66  7e15             jle 0xc7d                                
  0c68  8bde             mov bx, si                               
  0c6a  6bdb41           imul bx, bx, 0x41                        
  0c6d  03df             add bx, di                               
  0c6f  b8042c           mov ax, 0x2c04                           
  0c72  8ec0             mov es, ax                               
  0c74  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0c79  fec8             dec al                                   
  0c7b  ebcd             jmp 0xc4a                                
  0c7d  b001             mov al, 1                                
  0c7f  8bde             mov bx, si                               
  0c81  6bdb41           imul bx, bx, 0x41                        
  0c84  03df             add bx, di                               
  0c86  ba042c           mov dx, 0x2c04                           
  0c89  8ec2             mov es, dx                               
  0c8b  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  0c90  666a64           push 0x64                                
  0c93  6a01             push 1                                   
  0c95  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c9a  83c406           add sp, 6                                
  0c9d  3d1400           cmp ax, 0x14                             
  0ca0  7c03             jl 0xca5                                 
  0ca2  e9cd00           jmp 0xd72                                
  0ca5  666a64           push 0x64                                
  0ca8  6a01             push 1                                   
  0caa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0caf  83c406           add sp, 6                                
  0cb2  8bd0             mov dx, ax                               
  0cb4  83fa0a           cmp dx, 0xa                              
  0cb7  7d27             jge 0xce0                                
  0cb9  8bde             mov bx, si                               
  0cbb  6bdb41           imul bx, bx, 0x41                        
  0cbe  03df             add bx, di                               
  0cc0  b8042c           mov ax, 0x2c04                           
  0cc3  8ec0             mov es, ax                               
  0cc5  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0cca  0404             add al, 4                                
  0ccc  8bde             mov bx, si                               
  0cce  6bdb41           imul bx, bx, 0x41                        
  0cd1  03df             add bx, di                               
  0cd3  ba042c           mov dx, 0x2c04                           
  0cd6  8ec2             mov es, dx                               
  0cd8  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  0cdd  e99200           jmp 0xd72                                
  0ce0  83fa3c           cmp dx, 0x3c                             
  0ce3  7d15             jge 0xcfa                                
  0ce5  8bde             mov bx, si                               
  0ce7  6bdb41           imul bx, bx, 0x41                        
  0cea  03df             add bx, di                               
  0cec  b8042c           mov ax, 0x2c04                           
  0cef  8ec0             mov es, ax                               
  0cf1  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0cf6  0402             add al, 2                                
  0cf8  ebd2             jmp 0xccc                                
  0cfa  83fa5f           cmp dx, 0x5f                             
  0cfd  7d31             jge 0xd30                                
  0cff  8bde             mov bx, si                               
  0d01  6bdb41           imul bx, bx, 0x41                        
  0d04  03df             add bx, di                               
  0d06  b8042c           mov ax, 0x2c04                           
  0d09  8ec0             mov es, ax                               
  0d0b  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0d10  98               cwde                                     
  0d11  05feff           add ax, 0xfffe                           
  0d14  3d0200           cmp ax, 2                                
  0d17  7e46             jle 0xd5f                                
  0d19  8bde             mov bx, si                               
  0d1b  6bdb41           imul bx, bx, 0x41                        
  0d1e  03df             add bx, di                               
  0d20  b8042c           mov ax, 0x2c04                           
  0d23  8ec0             mov es, ax                               
  0d25  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0d2a  04fe             add al, 0xfe                             
  0d2c  eb33             jmp 0xd61                                
  0d2e  eb2f             jmp 0xd5f                                
  0d30  8bde             mov bx, si                               
  0d32  6bdb41           imul bx, bx, 0x41                        
  0d35  03df             add bx, di                               
  0d37  b8042c           mov ax, 0x2c04                           
  0d3a  8ec0             mov es, ax                               
  0d3c  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0d41  98               cwde                                     
  0d42  05fcff           add ax, 0xfffc                           
  0d45  3d0200           cmp ax, 2                                
  0d48  7e15             jle 0xd5f                                
  0d4a  8bde             mov bx, si                               
  0d4c  6bdb41           imul bx, bx, 0x41                        
  0d4f  03df             add bx, di                               
  0d51  b8042c           mov ax, 0x2c04                           
  0d54  8ec0             mov es, ax                               
  0d56  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0d5b  04fc             add al, 0xfc                             
  0d5d  ebcd             jmp 0xd2c                                
  0d5f  b002             mov al, 2                                
  0d61  8bde             mov bx, si                               
  0d63  6bdb41           imul bx, bx, 0x41                        
  0d66  03df             add bx, di                               
  0d68  ba042c           mov dx, 0x2c04                           
  0d6b  8ec2             mov es, dx                               
  0d6d  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  0d72  8bde             mov bx, si                               
  0d74  6bdb41           imul bx, bx, 0x41                        
  0d77  03df             add bx, di                               
  0d79  b8042c           mov ax, 0x2c04                           
  0d7c  8ec0             mov es, ax                               
  0d7e  2680bf9f1506     cmp byte ptr es:[bx + 0x159f], 6         
  0d84  7d0f             jge 0xd95                                
  0d86  8bde             mov bx, si                               
  0d88  6bdb41           imul bx, bx, 0x41                        
  0d8b  03df             add bx, di                               
  0d8d  8ec0             mov es, ax                               
  0d8f  26c6879f1506     mov byte ptr es:[bx + 0x159f], 6         
  0d95  666a64           push 0x64                                
  0d98  6a01             push 1                                   
  0d9a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0d9f  83c406           add sp, 6                                
  0da2  3d0a00           cmp ax, 0xa                              
  0da5  7d7b             jge 0xe22                                
  0da7  666a64           push 0x64                                
  0daa  6a01             push 1                                   
  0dac  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0db1  83c406           add sp, 6                                
  0db4  3d3c00           cmp ax, 0x3c                             
  0db7  7d2d             jge 0xde6                                
  0db9  8bde             mov bx, si                               
  0dbb  6bdb41           imul bx, bx, 0x41                        
  0dbe  03df             add bx, di                               
  0dc0  b8042c           mov ax, 0x2c04                           
  0dc3  8ec0             mov es, ax                               
  0dc5  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  0dca  98               cwde                                     
  0dcb  bb0400           mov bx, 4                                
  0dce  99               cdq                                      
  0dcf  f7fb             idiv bx                                  
  0dd1  8bde             mov bx, si                               
  0dd3  6bdb41           imul bx, bx, 0x41                        
  0dd6  03df             add bx, di                               
  0dd8  ba042c           mov dx, 0x2c04                           
  0ddb  8ec2             mov es, dx                               
  0ddd  268a97a315       mov dl, byte ptr es:[bx + 0x15a3]        
  0de2  2ad0             sub dl, al                               
  0de4  eb2b             jmp 0xe11                                
  0de6  8bde             mov bx, si                               
  0de8  6bdb41           imul bx, bx, 0x41                        
  0deb  03df             add bx, di                               
  0ded  b8042c           mov ax, 0x2c04                           
  0df0  8ec0             mov es, ax                               
  0df2  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  0df7  98               cwde                                     
  0df8  bb0400           mov bx, 4                                
  0dfb  99               cdq                                      
  0dfc  f7fb             idiv bx                                  
  0dfe  8bde             mov bx, si                               
  0e00  6bdb41           imul bx, bx, 0x41                        
  0e03  03df             add bx, di                               
  0e05  ba042c           mov dx, 0x2c04                           
  0e08  8ec2             mov es, dx                               
  0e0a  268a97a315       mov dl, byte ptr es:[bx + 0x15a3]        
  0e0f  02d0             add dl, al                               
  0e11  8bde             mov bx, si                               
  0e13  6bdb41           imul bx, bx, 0x41                        
  0e16  03df             add bx, di                               
  0e18  b8042c           mov ax, 0x2c04                           
  0e1b  8ec0             mov es, ax                               
  0e1d  268897a315       mov byte ptr es:[bx + 0x15a3], dl        
  0e22  666a64           push 0x64                                
  0e25  6a01             push 1                                   
  0e27  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e2c  83c406           add sp, 6                                
  0e2f  3d0a00           cmp ax, 0xa                              
  0e32  7d78             jge 0xeac                                
  0e34  666a64           push 0x64                                
  0e37  6a01             push 1                                   
  0e39  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e3e  83c406           add sp, 6                                
  0e41  3d3c00           cmp ax, 0x3c                             
  0e44  7d42             jge 0xe88                                
  0e46  8bde             mov bx, si                               
  0e48  6bdb41           imul bx, bx, 0x41                        
  0e4b  03df             add bx, di                               
  0e4d  b8042c           mov ax, 0x2c04                           
  0e50  8ec0             mov es, ax                               
  0e52  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  0e57  98               cwde                                     
  0e58  48               dec ax                                   
  0e59  3d0100           cmp ax, 1                                
  0e5c  7e15             jle 0xe73                                
  0e5e  8bde             mov bx, si                               
  0e60  6bdb41           imul bx, bx, 0x41                        
  0e63  03df             add bx, di                               
  0e65  b8042c           mov ax, 0x2c04                           
  0e68  8ec0             mov es, ax                               
  0e6a  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  0e6f  fec8             dec al                                   
  0e71  eb02             jmp 0xe75                                
  0e73  b001             mov al, 1                                
  0e75  8bde             mov bx, si                               
  0e77  6bdb41           imul bx, bx, 0x41                        
  0e7a  03df             add bx, di                               
  0e7c  ba042c           mov dx, 0x2c04                           
  0e7f  8ec2             mov es, dx                               
  0e81  2688879715       mov byte ptr es:[bx + 0x1597], al        
  0e86  eb24             jmp 0xeac                                
  0e88  8bde             mov bx, si                               
  0e8a  6bdb41           imul bx, bx, 0x41                        
  0e8d  03df             add bx, di                               
  0e8f  b8042c           mov ax, 0x2c04                           
  0e92  8ec0             mov es, ax                               
  0e94  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  0e99  fec0             inc al                                   
  0e9b  8bde             mov bx, si                               
  0e9d  6bdb41           imul bx, bx, 0x41                        
  0ea0  03df             add bx, di                               
  0ea2  ba042c           mov dx, 0x2c04                           
  0ea5  8ec2             mov es, dx                               
  0ea7  2688879715       mov byte ptr es:[bx + 0x1597], al        
  0eac  47               inc di                                   
  0ead  83ff04           cmp di, 4                                
  0eb0  7d03             jge 0xeb5                                
  0eb2  e92cfd           jmp 0xbe1                                
  0eb5  46               inc si                                   
  0eb6  b8042c           mov ax, 0x2c04                           
  0eb9  8ec0             mov es, ax                               
  0ebb  2639367b15       cmp word ptr es:[0x157b], si             
  0ec0  7e03             jle 0xec5                                
  0ec2  e917fd           jmp 0xbdc                                
  0ec5  5f               pop di                                   
  0ec6  5e               pop si                                   
  0ec7  c9               leave                                    
  0ec8  cb               retf                                     
