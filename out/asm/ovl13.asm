; ovl13 stub 2f9a file_off 0x46c80 size 0x4d7

ovl13_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  81ecbc00         sub sp, 0xbc                             
  0007  56               push si                                  
  0008  57               push di                                  
  0009  c746fc0000       mov word ptr [bp - 4], 0                 
  000e  1e               push ds                                  
  000f  68b203           push 0x3b2                                ; "current.sgn"
  0012  16               push ss                                  
  0013  8d8644ff         lea ax, [bp - 0xbc]                      
  0017  50               push ax                                  
  0018  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  001d  83c408           add sp, 8                                
  0020  6a02             push 2                                   
  0022  16               push ss                                  
  0023  8d8644ff         lea ax, [bp - 0xbc]                      
  0027  50               push ax                                  
  0028  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  002d  83c406           add sp, 6                                
  0030  8bf0             mov si, ax                               
  0032  0bf6             or si, si                                
  0034  7d03             jge 0x39                                 
  0036  e9c600           jmp 0xff                                 
  0039  6a02             push 2                                   
  003b  16               push ss                                  
  003c  8d46fe           lea ax, [bp - 2]                         
  003f  50               push ax                                  
  0040  56               push si                                  
  0041  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0046  83c408           add sp, 8                                
  0049  33ff             xor di, di                               
  004b  6a68             push 0x68                                
  004d  16               push ss                                  
  004e  8d4694           lea ax, [bp - 0x6c]                      
  0051  50               push ax                                  
  0052  56               push si                                  
  0053  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0058  83c408           add sp, 8                                
  005b  8b4694           mov ax, word ptr [bp - 0x6c]             
  005e  3b4606           cmp ax, word ptr [bp + 6]                
  0061  750d             jne 0x70                                 
  0063  8b4696           mov ax, word ptr [bp - 0x6a]             
  0066  3b4608           cmp ax, word ptr [bp + 8]                
  0069  7505             jne 0x70                                 
  006b  c746fc0100       mov word ptr [bp - 4], 1                 
  0070  47               inc di                                   
  0071  837efc00         cmp word ptr [bp - 4], 0                 
  0075  7505             jne 0x7c                                 
  0077  3b7efe           cmp di, word ptr [bp - 2]                
  007a  7ccf             jl 0x4b                                  
  007c  56               push si                                  
  007d  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0082  59               pop cx                                   
  0083  837efc00         cmp word ptr [bp - 4], 0                 
  0087  7418             je 0xa1                                  
  0089  16               push ss                                  
  008a  8d4698           lea ax, [bp - 0x68]                      
  008d  50               push ax                                  
  008e  66ff760a         push dword ptr [bp + 0xa]                
  0092  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0097  83c408           add sp, 8                                
  009a  16               push ss                                  
  009b  8d46ca           lea ax, [bp - 0x36]                      
  009e  50               push ax                                  
  009f  eb14             jmp 0xb5                                 
  00a1  1e               push ds                                  
  00a2  68be03           push 0x3be                               
  00a5  66ff760a         push dword ptr [bp + 0xa]                
  00a9  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  00ae  83c408           add sp, 8                                
  00b1  1e               push ds                                  
  00b2  68bf03           push 0x3bf                               
  00b5  66ff760e         push dword ptr [bp + 0xe]                
  00b9  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  00be  83c408           add sp, 8                                
  00c1  1e               push ds                                  
  00c2  68c003           push 0x3c0                               
  00c5  66ff760a         push dword ptr [bp + 0xa]                
  00c9  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  00ce  83c408           add sp, 8                                
  00d1  0bc0             or ax, ax                                
  00d3  752a             jne 0xff                                 
  00d5  1e               push ds                                  
  00d6  68c103           push 0x3c1                               
  00d9  66ff760e         push dword ptr [bp + 0xe]                
  00dd  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  00e2  83c408           add sp, 8                                
  00e5  0bc0             or ax, ax                                
  00e7  7516             jne 0xff                                 
  00e9  ff7608           push word ptr [bp + 8]                   
  00ec  ff7606           push word ptr [bp + 6]                   
  00ef  1e               push ds                                  
  00f0  68c203           push 0x3c2                                ; "%d, %d"
  00f3  66ff760a         push dword ptr [bp + 0xa]                
  00f7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00fc  83c40c           add sp, 0xc                              
  00ff  5f               pop di                                   
  0100  5e               pop si                                   
  0101  c9               leave                                    
  0102  cb               retf                                     

ovl13_0103:  ; ENTRY
  0103  55               push bp                                  
  0104  8bec             mov bp, sp                               
  0106  83ec2c           sub sp, 0x2c                             
  0109  56               push si                                  
  010a  57               push di                                  
  010b  1e               push ds                                  
  010c  68a05d           push 0x5da0                              
  010f  1e               push ds                                  
  0110  68a05d           push 0x5da0                              
  0113  1e               push ds                                  
  0114  68c903           push 0x3c9                                ; "%s\%s.sgn"
  0117  16               push ss                                  
  0118  8d46d4           lea ax, [bp - 0x2c]                      
  011b  50               push ax                                  
  011c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0121  83c410           add sp, 0x10                             
  0124  6a02             push 2                                   
  0126  16               push ss                                  
  0127  8d46d4           lea ax, [bp - 0x2c]                      
  012a  50               push ax                                  
  012b  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0130  83c406           add sp, 6                                
  0133  8bf0             mov si, ax                               
  0135  0bf6             or si, si                                
  0137  7c67             jl 0x1a0                                 
  0139  56               push si                                  
  013a  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  013f  59               pop cx                                   
  0140  8bf8             mov di, ax                               
  0142  50               push ax                                  
  0143  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0148  59               pop cx                                   
  0149  8956fe           mov word ptr [bp - 2], dx                
  014c  8946fc           mov word ptr [bp - 4], ax                
  014f  66837efc00       cmp dword ptr [bp - 4], 0                
  0154  744a             je 0x1a0                                 
  0156  57               push di                                  
  0157  66ff76fc         push dword ptr [bp - 4]                  
  015b  56               push si                                  
  015c  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0161  83c408           add sp, 8                                
  0164  56               push si                                  
  0165  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  016a  59               pop cx                                   
  016b  6a09             push 9                                   
  016d  1e               push ds                                  
  016e  68d303           push 0x3d3                                ; "current.sgn"
  0171  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0176  83c406           add sp, 6                                
  0179  8bf0             mov si, ax                               
  017b  0bf6             or si, si                                
  017d  7c21             jl 0x1a0                                 
  017f  57               push di                                  
  0180  66ff76fc         push dword ptr [bp - 4]                  
  0184  56               push si                                  
  0185  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  018a  83c408           add sp, 8                                
  018d  56               push si                                  
  018e  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0193  59               pop cx                                   
  0194  66ff76fc         push dword ptr [bp - 4]                  
  0198  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  019d  83c404           add sp, 4                                
  01a0  5f               pop di                                   
  01a1  5e               pop si                                   
  01a2  c9               leave                                    
  01a3  cb               retf                                     

ovl13_01a4:  ; ENTRY
  01a4  55               push bp                                  
  01a5  8bec             mov bp, sp                               
  01a7  83ec08           sub sp, 8                                
  01aa  56               push si                                  
  01ab  57               push di                                  
  01ac  33ff             xor di, di                               
  01ae  66833e625e00     cmp dword ptr [0x5e62], 0                
  01b4  7503             jne 0x1b9                                
  01b6  e91a01           jmp 0x2d3                                
  01b9  c41e625e         les bx, ptr [0x5e62]                     
  01bd  268b5f02         mov bx, word ptr es:[bx + 2]             
  01c1  69dbe000         imul bx, bx, 0xe0                        
  01c5  8b36625e         mov si, word ptr [0x5e62]                
  01c9  268b04           mov ax, word ptr es:[si]                 
  01cc  d1e0             shl ax, 1                                
  01ce  03d8             add bx, ax                               
  01d0  b81d1e           mov ax, 0x1e1d                           
  01d3  8ec0             mov es, ax                               
  01d5  268a9f0000       mov bl, byte ptr es:[bx]                 
  01da  81e3ff00         and bx, 0xff                             
  01de  b8042c           mov ax, 0x2c04                           
  01e1  8ec0             mov es, ax                               
  01e3  2680bf100709     cmp byte ptr es:[bx + 0x710], 9          
  01e9  7403             je 0x1ee                                 
  01eb  e9e500           jmp 0x2d3                                
  01ee  6a02             push 2                                   
  01f0  1e               push ds                                  
  01f1  68df03           push 0x3df                                ; "current.sgn"
  01f4  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  01f9  83c406           add sp, 6                                
  01fc  8bf0             mov si, ax                               
  01fe  0bf6             or si, si                                
  0200  7d03             jge 0x205                                
  0202  e9ce00           jmp 0x2d3                                
  0205  56               push si                                  
  0206  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  020b  59               pop cx                                   
  020c  8946fe           mov word ptr [bp - 2], ax                
  020f  a39c3f           mov word ptr [0x3f9c], ax                
  0212  50               push ax                                  
  0213  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0218  59               pop cx                                   
  0219  8916a03f         mov word ptr [0x3fa0], dx                
  021d  a39e3f           mov word ptr [0x3f9e], ax                
  0220  ff76fe           push word ptr [bp - 2]                   
  0223  52               push dx                                  
  0224  50               push ax                                  
  0225  56               push si                                  
  0226  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  022b  83c408           add sp, 8                                
  022e  56               push si                                  
  022f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0234  59               pop cx                                   
  0235  66a19e3f         mov eax, dword ptr [0x3f9e]              
  0239  668946f8         mov dword ptr [bp - 8], eax              
  023d  c45ef8           les bx, ptr [bp - 8]                     
  0240  268b07           mov ax, word ptr es:[bx]                 
  0243  8946fc           mov word ptr [bp - 4], ax                
  0246  83069e3f02       add word ptr [0x3f9e], 2                 
  024b  66a19e3f         mov eax, dword ptr [0x3f9e]              
  024f  66a3963f         mov dword ptr [0x3f96], eax              
  0253  832e9e3f02       sub word ptr [0x3f9e], 2                 
  0258  33d2             xor dx, dx                               
  025a  8bc2             mov ax, dx                               
  025c  6bc068           imul ax, ax, 0x68                        
  025f  c41e963f         les bx, ptr [0x3f96]                     
  0263  03d8             add bx, ax                               
  0265  268b07           mov ax, word ptr es:[bx]                 
  0268  c41e625e         les bx, ptr [0x5e62]                     
  026c  263b07           cmp ax, word ptr es:[bx]                 
  026f  751c             jne 0x28d                                
  0271  8bc2             mov ax, dx                               
  0273  6bc068           imul ax, ax, 0x68                        
  0276  c41e963f         les bx, ptr [0x3f96]                     
  027a  03d8             add bx, ax                               
  027c  268b4702         mov ax, word ptr es:[bx + 2]             
  0280  c41e625e         les bx, ptr [0x5e62]                     
  0284  263b4702         cmp ax, word ptr es:[bx + 2]             
  0288  7503             jne 0x28d                                
  028a  bf0100           mov di, 1                                
  028d  42               inc dx                                   
  028e  0bff             or di, di                                
  0290  7505             jne 0x297                                
  0292  3b56fc           cmp dx, word ptr [bp - 4]                
  0295  7cc3             jl 0x25a                                 
  0297  0bff             or di, di                                
  0299  750f             jne 0x2aa                                
  029b  66ff369e3f       push dword ptr [0x3f9e]                  
  02a0  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  02a5  83c404           add sp, 4                                
  02a8  eb29             jmp 0x2d3                                
  02aa  8bc2             mov ax, dx                               
  02ac  48               dec ax                                   
  02ad  a39a3f           mov word ptr [0x3f9a], ax                
  02b0  6a01             push 1                                   
  02b2  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  02b7  59               pop cx                                   
  02b8  6a00             push 0                                   
  02ba  90               nop                                      
  02bb  0e               push cs                                  
  02bc  e81800           call 0x2d7                               
  02bf  59               pop cx                                   
  02c0  c7066a160100     mov word ptr [0x166a], 1                 
  02c6  6a18             push 0x18                                
  02c8  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  02cd  59               pop cx                                   
  02ce  90               nop                                      
  02cf  0e               push cs                                  
  02d0  e8db00           call 0x3ae                               
  02d3  5f               pop di                                   
  02d4  5e               pop si                                   
  02d5  c9               leave                                    
  02d6  cb               retf                                     

ovl13_02d7:  ; ENTRY
  02d7  55               push bp                                  
  02d8  8bec             mov bp, sp                               
  02da  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  02df  837e0600         cmp word ptr [bp + 6], 0                 
  02e3  755e             jne 0x343                                
  02e5  666800000300     push 0x30000                             
  02eb  666801000f00     push 0xf0001                             
  02f1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  02f6  83c408           add sp, 8                                
  02f9  1e               push ds                                  
  02fa  68eb03           push 0x3eb                                ; "A Signpost!"
  02fd  666840015e00     push 0x5e0140                            
  0303  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0308  83c408           add sp, 8                                
  030b  666800000300     push 0x30000                             
  0311  666802000f00     push 0xf0002                             
  0317  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  031c  83c408           add sp, 8                                
  031f  1e               push ds                                  
  0320  68f703           push 0x3f7                                ; "Type the new message for"
  0323  666840018c00     push 0x8c0140                            
  0329  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  032e  83c408           add sp, 8                                
  0331  1e               push ds                                  
  0332  681004           push 0x410                                ; "this signpost!"
  0335  66684001a000     push 0xa00140                            
  033b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0340  83c408           add sp, 8                                
  0343  666800000300     push 0x30000                             
  0349  666802000f00     push 0xf0002                             
  034f  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0354  83c408           add sp, 8                                
  0357  a19a3f           mov ax, word ptr [0x3f9a]                
  035a  6bc068           imul ax, ax, 0x68                        
  035d  8b16963f         mov dx, word ptr [0x3f96]                
  0361  03d0             add dx, ax                               
  0363  83c204           add dx, 4                                
  0366  ff36983f         push word ptr [0x3f98]                   
  036a  52               push dx                                  
  036b  6668f0001600     push 0x1600f0                            
  0371  6668c800be00     push 0xbe00c8                             ; "Quest"
  0377  9a5c00c130       lcall 0x30c1, 0x5c                       -> ovl59:0058
  037c  83c40c           add sp, 0xc                              
  037f  a19a3f           mov ax, word ptr [0x3f9a]                
  0382  6bc068           imul ax, ax, 0x68                        
  0385  8b16963f         mov dx, word ptr [0x3f96]                
  0389  03d0             add dx, ax                               
  038b  83c236           add dx, 0x36                             
  038e  ff36983f         push word ptr [0x3f98]                   
  0392  52               push dx                                  
  0393  6668f0001600     push 0x1600f0                            
  0399  6668c800d700     push 0xd700c8                             ; "Quest"
  039f  9a5c00c130       lcall 0x30c1, 0x5c                       -> ovl59:0058
  03a4  83c40c           add sp, 0xc                              
  03a7  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  03ac  5d               pop bp                                   
  03ad  cb               retf                                     

ovl13_03ae:  ; ENTRY
  03ae  55               push bp                                  
  03af  8bec             mov bp, sp                               
  03b1  6668a5010100     push 0x101a5                             
  03b7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  03bc  83c404           add sp, 4                                
  03bf  6668a6010100     push 0x101a6                             
  03c5  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  03ca  83c404           add sp, 4                                
  03cd  6668a7010100     push 0x101a7                             
  03d3  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  03d8  83c404           add sp, 4                                
  03db  5d               pop bp                                   
  03dc  cb               retf                                     

ovl13_03dd:  ; ENTRY
  03dd  55               push bp                                  
  03de  8bec             mov bp, sp                               
  03e0  83ec08           sub sp, 8                                
  03e3  6668f0001600     push 0x1600f0                            
  03e9  6668c800be00     push 0xbe00c8                             ; "Quest"
  03ef  16               push ss                                  
  03f0  8d46f8           lea ax, [bp - 8]                         
  03f3  50               push ax                                  
  03f4  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  03f9  83c40c           add sp, 0xc                              
  03fc  66681e00d800     push 0xd8001e                            
  0402  a19a3f           mov ax, word ptr [0x3f9a]                
  0405  6bc068           imul ax, ax, 0x68                        
  0408  8b16963f         mov dx, word ptr [0x3f96]                
  040c  03d0             add dx, ax                               
  040e  83c204           add dx, 4                                
  0411  ff36983f         push word ptr [0x3f98]                   
  0415  52               push dx                                  
  0416  8d46f8           lea ax, [bp - 8]                         
  0419  8cd2             mov dx, ss                               
  041b  b90800           mov cx, 8                                
  041e  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0423  9a4800a530       lcall 0x30a5, 0x48                       -> ovl56:03a6
  0428  83c410           add sp, 0x10                             
  042b  90               nop                                      
  042c  0e               push cs                                  
  042d  e80200           call 0x432                               
  0430  c9               leave                                    
  0431  cb               retf                                     

ovl13_0432:  ; ENTRY
  0432  55               push bp                                  
  0433  8bec             mov bp, sp                               
  0435  83ec08           sub sp, 8                                
  0438  6668f0001600     push 0x1600f0                            
  043e  6668c800d700     push 0xd700c8                             ; "Quest"
  0444  16               push ss                                  
  0445  8d46f8           lea ax, [bp - 8]                         
  0448  50               push ax                                  
  0449  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  044e  83c40c           add sp, 0xc                              
  0451  66681e00d800     push 0xd8001e                            
  0457  a19a3f           mov ax, word ptr [0x3f9a]                
  045a  6bc068           imul ax, ax, 0x68                        
  045d  8b16963f         mov dx, word ptr [0x3f96]                
  0461  03d0             add dx, ax                               
  0463  83c236           add dx, 0x36                             
  0466  ff36983f         push word ptr [0x3f98]                   
  046a  52               push dx                                  
  046b  8d46f8           lea ax, [bp - 8]                         
  046e  8cd2             mov dx, ss                               
  0470  b90800           mov cx, 8                                
  0473  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0478  9a4800a530       lcall 0x30a5, 0x48                       -> ovl56:03a6
  047d  83c410           add sp, 0x10                             
  0480  0e               push cs                                  
  0481  e82aff           call 0x3ae                               
  0484  c9               leave                                    
  0485  cb               retf                                     

ovl13_0486:  ; ENTRY
  0486  55               push bp                                  
  0487  8bec             mov bp, sp                               
  0489  56               push si                                  
  048a  6a09             push 9                                   
  048c  1e               push ds                                  
  048d  681f04           push 0x41f                                ; "current.sgn"
  0490  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0495  83c406           add sp, 6                                
  0498  8bf0             mov si, ax                               
  049a  0bf6             or si, si                                
  049c  7c36             jl 0x4d4                                 
  049e  ff369c3f         push word ptr [0x3f9c]                   
  04a2  66ff369e3f       push dword ptr [0x3f9e]                  
  04a7  56               push si                                  
  04a8  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  04ad  83c408           add sp, 8                                
  04b0  56               push si                                  
  04b1  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  04b6  59               pop cx                                   
  04b7  66ff369e3f       push dword ptr [0x3f9e]                  
  04bc  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  04c1  83c404           add sp, 4                                
  04c4  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  04c9  666a00           push 0                                   
  04cc  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  04d1  83c404           add sp, 4                                
  04d4  5e               pop si                                   
  04d5  5d               pop bp                                   
  04d6  cb               retf                                     
