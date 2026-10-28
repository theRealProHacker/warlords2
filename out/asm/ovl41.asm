; ovl41 stub 3042 file_off 0x61cb0 size 0x1a0f

ovl41_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  8b5606           mov dx, word ptr [bp + 6]                
  0006  8916c40d         mov word ptr [0xdc4], dx                 
  000a  83fa04           cmp dx, 4                                
  000d  7507             jne 0x16                                 
  000f  90               nop                                      
  0010  0e               push cs                                  
  0011  e8d709           call 0x9eb                               
  0014  eb7e             jmp 0x94                                 
  0016  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  001b  3d0100           cmp ax, 1                                
  001e  7f27             jg 0x47                                  
  0020  66685d000100     push 0x1005d                             
  0026  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  002b  83c404           add sp, 4                                
  002e  52               push dx                                  
  002f  50               push ax                                  
  0030  666a5d           push 0x5d                                
  0033  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0038  83c404           add sp, 4                                
  003b  52               push dx                                  
  003c  50               push ax                                  
  003d  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  0042  83c408           add sp, 8                                
  0045  eb4d             jmp 0x94                                 
  0047  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  004c  a33c44           mov word ptr [0x443c], ax                
  004f  813e3c44ca00     cmp word ptr [0x443c], 0xca              
  0055  7c06             jl 0x5d                                  
  0057  c7063c44c900     mov word ptr [0x443c], 0xc9              
  005d  a13c44           mov ax, word ptr [0x443c]                
  0060  48               dec ax                                   
  0061  a33e44           mov word ptr [0x443e], ax                
  0064  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0069  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  006e  666801000100     push 0x10001                             
  0074  90               nop                                      
  0075  0e               push cs                                  
  0076  e81d00           call 0x96                                
  0079  83c404           add sp, 4                                
  007c  c7066a160100     mov word ptr [0x166a], 1                 
  0082  6a13             push 0x13                                
  0084  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0089  59               pop cx                                   
  008a  90               nop                                      
  008b  0e               push cs                                  
  008c  e8bf07           call 0x84e                               
  008f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0094  5d               pop bp                                   
  0095  cb               retf                                     

ovl41_0096:  ; ENTRY
  0096  55               push bp                                  
  0097  8bec             mov bp, sp                               
  0099  83ec56           sub sp, 0x56                             
  009c  56               push si                                  
  009d  57               push di                                  
  009e  8b7606           mov si, word ptr [bp + 6]                
  00a1  8b7e08           mov di, word ptr [bp + 8]                
  00a4  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00a9  0bf6             or si, si                                
  00ab  747a             je 0x127                                 
  00ad  833e6a1600       cmp word ptr [0x166a], 0                 
  00b2  742e             je 0xe2                                  
  00b4  666800000f01     push 0x10f0000                           
  00ba  666a00           push 0                                   
  00bd  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  00c2  83c408           add sp, 8                                
  00c5  833ec40d01       cmp word ptr [0xdc4], 1                  
  00ca  7429             je 0xf5                                  
  00cc  666800001e00     push 0x1e0000                            
  00d2  666800005400     push 0x540000                            
  00d8  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  00dd  83c408           add sp, 8                                
  00e0  eb13             jmp 0xf5                                 
  00e2  c7066a160100     mov word ptr [0x166a], 1                 
  00e8  6a0a             push 0xa                                 
  00ea  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  00ef  59               pop cx                                   
  00f0  90               nop                                      
  00f1  0e               push cs                                  
  00f2  e8140f           call 0x1009                              
  00f5  666800000300     push 0x30000                             
  00fb  666801000f00     push 0xf0001                             
  0101  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0106  83c408           add sp, 8                                
  0109  ff36c40d         push word ptr [0xdc4]                    
  010d  6a5b             push 0x5b                                
  010f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0114  83c404           add sp, 4                                
  0117  52               push dx                                  
  0118  50               push ax                                  
  0119  6668b0014000     push 0x4001b0                            
  011f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0124  83c408           add sp, 8                                
  0127  666800000300     push 0x30000                             
  012d  666802000f00     push 0xf0002                             
  0133  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0138  83c408           add sp, 8                                
  013b  0bff             or di, di                                
  013d  7504             jne 0x143                                
  013f  0bf6             or si, si                                
  0141  743c             je 0x17f                                 
  0143  666850001400     push 0x140050                            
  0149  666810002201     push 0x1220010                           
  014f  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0154  83c408           add sp, 8                                
  0157  ff363e44         push word ptr [0x443e]                   
  015b  1e               push ds                                  
  015c  68de0d           push 0xdde                                ; "Turn %d"
  015f  16               push ss                                  
  0160  8d46aa           lea ax, [bp - 0x56]                      
  0163  50               push ax                                  
  0164  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0169  83c40a           add sp, 0xa                              
  016c  16               push ss                                  
  016d  8d46aa           lea ax, [bp - 0x56]                      
  0170  50               push ax                                  
  0171  666838015e01     push 0x15e0138                           
  0177  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  017c  83c408           add sp, 8                                
  017f  0bf6             or si, si                                
  0181  7416             je 0x199                                 
  0183  833ec40d01       cmp word ptr [0xdc4], 1                  
  0188  7407             je 0x191                                 
  018a  90               nop                                      
  018b  0e               push cs                                  
  018c  e8bb01           call 0x34a                               
  018f  eb08             jmp 0x199                                
  0191  6a01             push 1                                   
  0193  90               nop                                      
  0194  0e               push cs                                  
  0195  e84217           call 0x18da                              
  0198  59               pop cx                                   
  0199  0bf6             or si, si                                
  019b  7504             jne 0x1a1                                
  019d  0bff             or di, di                                
  019f  7418             je 0x1b9                                 
  01a1  833ec40d01       cmp word ptr [0xdc4], 1                  
  01a6  7511             jne 0x1b9                                
  01a8  90               nop                                      
  01a9  0e               push cs                                  
  01aa  e80d15           call 0x16ba                              
  01ad  0bf6             or si, si                                
  01af  7508             jne 0x1b9                                
  01b1  6a00             push 0                                   
  01b3  90               nop                                      
  01b4  0e               push cs                                  
  01b5  e82217           call 0x18da                              
  01b8  59               pop cx                                   
  01b9  0bf6             or si, si                                
  01bb  7507             jne 0x1c4                                
  01bd  0bff             or di, di                                
  01bf  7503             jne 0x1c4                                
  01c1  e94101           jmp 0x305                                
  01c4  833ec40d01       cmp word ptr [0xdc4], 1                  
  01c9  7503             jne 0x1ce                                
  01cb  e93701           jmp 0x305                                
  01ce  660fbf063e44     movsx eax, word ptr [0x443e]             
  01d4  660fbf16ca0d     movsx edx, word ptr [0xdca]              
  01da  660fafc2         imul eax, edx                            
  01de  8b163c44         mov dx, word ptr [0x443c]                
  01e2  4a               dec dx                                   
  01e3  660fbfda         movsx ebx, dx                            
  01e7  6699             cdq                                      
  01e9  66f7fb           idiv ebx                                 
  01ec  8b16c60d         mov dx, word ptr [0xdc6]                 
  01f0  03d0             add dx, ax                               
  01f2  89162c44         mov word ptr [0x442c], dx                
  01f6  8bc2             mov ax, dx                               
  01f8  a32844           mov word ptr [0x4428], ax                
  01fb  a1c80d           mov ax, word ptr [0xdc8]                 
  01fe  05feff           add ax, 0xfffe                           
  0201  a32a44           mov word ptr [0x442a], ax                
  0204  a1c80d           mov ax, word ptr [0xdc8]                 
  0207  0306cc0d         add ax, word ptr [0xdcc]                 
  020b  050600           add ax, 6                                
  020e  a32e44           mov word ptr [0x442e], ax                
  0211  6a0d             push 0xd                                 
  0213  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0218  59               pop cx                                   
  0219  66ff363044       push dword ptr [0x4430]                  
  021e  66ff362c44       push dword ptr [0x442c]                  
  0223  66ff362844       push dword ptr [0x4428]                  
  0228  9a95003311       lcall 0x1133, 0x95                       -> 1133:0095
  022d  83c40c           add sp, 0xc                              
  0230  833ec40d03       cmp word ptr [0xdc4], 3                  
  0235  7563             jne 0x29a                                
  0237  ff363e44         push word ptr [0x443e]                   
  023b  90               nop                                      
  023c  0e               push cs                                  
  023d  e8210f           call 0x1161                              
  0240  59               pop cx                                   
  0241  8956fe           mov word ptr [bp - 2], dx                
  0244  8946fc           mov word ptr [bp - 4], ax                
  0247  33c0             xor ax, ax                               
  0249  8946fa           mov word ptr [bp - 6], ax                
  024c  8bc8             mov cx, ax                               
  024e  33d2             xor dx, dx                               
  0250  eb13             jmp 0x265                                
  0252  c45efc           les bx, ptr [bp - 4]                     
  0255  26390f           cmp word ptr es:[bx], cx                 
  0258  7e06             jle 0x260                                
  025a  268b0f           mov cx, word ptr es:[bx]                 
  025d  8956fa           mov word ptr [bp - 6], dx                
  0260  8346fc02         add word ptr [bp - 4], 2                 
  0264  42               inc dx                                   
  0265  83fa08           cmp dx, 8                                
  0268  7ce8             jl 0x252                                 
  026a  8b46fa           mov ax, word ptr [bp - 6]                
  026d  6bc014           imul ax, ax, 0x14                        
  0270  050000           add ax, 0                                
  0273  68042c           push 0x2c04                              
  0276  50               push ax                                  
  0277  ff363e44         push word ptr [0x443e]                   
  027b  ff36c40d         push word ptr [0xdc4]                    
  027f  6a5c             push 0x5c                                
  0281  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0286  83c404           add sp, 4                                
  0289  52               push dx                                  
  028a  50               push ax                                  
  028b  16               push ss                                  
  028c  8d46aa           lea ax, [bp - 0x56]                      
  028f  50               push ax                                  
  0290  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0295  83c40e           add sp, 0xe                              
  0298  eb44             jmp 0x2de                                
  029a  ff363e44         push word ptr [0x443e]                   
  029e  ff1e2444         lcall [0x4424]                           
  02a2  59               pop cx                                   
  02a3  8956fe           mov word ptr [bp - 2], dx                
  02a6  8946fc           mov word ptr [bp - 4], ax                
  02a9  b8042c           mov ax, 0x2c04                           
  02ac  8ec0             mov es, ax                               
  02ae  26a11001         mov ax, word ptr es:[0x110]              
  02b2  d1e0             shl ax, 1                                
  02b4  0146fc           add word ptr [bp - 4], ax                
  02b7  c45efc           les bx, ptr [bp - 4]                     
  02ba  26ff37           push word ptr es:[bx]                    
  02bd  ff363e44         push word ptr [0x443e]                   
  02c1  ff36c40d         push word ptr [0xdc4]                    
  02c5  6a5c             push 0x5c                                
  02c7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02cc  83c404           add sp, 4                                
  02cf  52               push dx                                  
  02d0  50               push ax                                  
  02d1  16               push ss                                  
  02d2  8d46aa           lea ax, [bp - 0x56]                      
  02d5  50               push ax                                  
  02d6  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02db  83c40c           add sp, 0xc                              
  02de  666850011400     push 0x140150                            
  02e4  666800000201     push 0x1020000                           
  02ea  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  02ef  83c408           add sp, 8                                
  02f2  16               push ss                                  
  02f3  8d46aa           lea ax, [bp - 0x56]                      
  02f6  50               push ax                                  
  02f7  6668b0013e01     push 0x13e01b0                           
  02fd  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0302  83c408           add sp, 8                                
  0305  0bf6             or si, si                                
  0307  740e             je 0x317                                 
  0309  666a00           push 0                                   
  030c  666a00           push 0                                   
  030f  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0314  83c408           add sp, 8                                
  0317  0bff             or di, di                                
  0319  7504             jne 0x31f                                
  031b  0bf6             or si, si                                
  031d  7422             je 0x341                                 
  031f  ff363e44         push word ptr [0x443e]                   
  0323  90               nop                                      
  0324  0e               push cs                                  
  0325  e8fe0d           call 0x1126                              
  0328  59               pop cx                                   
  0329  52               push dx                                  
  032a  50               push ax                                  
  032b  666a00           push 0                                   
  032e  9a2f00f230       lcall 0x30f2, 0x2f                       -> ovl63:12d3
  0333  83c408           add sp, 8                                
  0336  666a00           push 0                                   
  0339  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  033e  83c404           add sp, 4                                
  0341  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0346  5f               pop di                                   
  0347  5e               pop si                                   
  0348  c9               leave                                    
  0349  cb               retf                                     

ovl41_034a:  ; ENTRY
  034a  55               push bp                                  
  034b  8bec             mov bp, sp                               
  034d  83ec3e           sub sp, 0x3e                             
  0350  56               push si                                  
  0351  57               push di                                  
  0352  a1c40d           mov ax, word ptr [0xdc4]                 
  0355  0bc0             or ax, ax                                
  0357  7410             je 0x369                                 
  0359  3d0200           cmp ax, 2                                
  035c  746c             je 0x3ca                                 
  035e  3d0300           cmp ax, 3                                
  0361  7503             jne 0x366                                
  0363  e9c400           jmp 0x42a                                
  0366  e91f01           jmp 0x488                                
  0369  c70626444230     mov word ptr [0x4426], 0x3042            
  036f  c70624448400     mov word ptr [0x4424], 0x84              
  0375  c746fe0a00       mov word ptr [bp - 2], 0xa               
  037a  be0100           mov si, 1                                
  037d  eb40             jmp 0x3bf                                
  037f  56               push si                                  
  0380  90               nop                                      
  0381  0e               push cs                                  
  0382  e8660d           call 0x10eb                              
  0385  59               pop cx                                   
  0386  8956fc           mov word ptr [bp - 4], dx                
  0389  8946fa           mov word ptr [bp - 6], ax                
  038c  33ff             xor di, di                               
  038e  eb29             jmp 0x3b9                                
  0390  668b46fa         mov eax, dword ptr [bp - 6]              
  0394  668946f6         mov dword ptr [bp - 0xa], eax            
  0398  8bc7             mov ax, di                               
  039a  d1e0             shl ax, 1                                
  039c  0146f6           add word ptr [bp - 0xa], ax              
  039f  c45ef6           les bx, ptr [bp - 0xa]                   
  03a2  268b07           mov ax, word ptr es:[bx]                 
  03a5  3b46fe           cmp ax, word ptr [bp - 2]                
  03a8  7d05             jge 0x3af                                
  03aa  8b46fe           mov ax, word ptr [bp - 2]                
  03ad  eb06             jmp 0x3b5                                
  03af  c45ef6           les bx, ptr [bp - 0xa]                   
  03b2  268b07           mov ax, word ptr es:[bx]                 
  03b5  8946fe           mov word ptr [bp - 2], ax                
  03b8  47               inc di                                   
  03b9  83ff08           cmp di, 8                                
  03bc  7cd2             jl 0x390                                 
  03be  46               inc si                                   
  03bf  a13c44           mov ax, word ptr [0x443c]                
  03c2  48               dec ax                                   
  03c3  3bc6             cmp ax, si                               
  03c5  7db8             jge 0x37f                                
  03c7  e9be00           jmp 0x488                                
  03ca  c70626444230     mov word ptr [0x4426], 0x3042            
  03d0  c70624449300     mov word ptr [0x4424], 0x93              
  03d6  c746fef401       mov word ptr [bp - 2], 0x1f4             
  03db  be0100           mov si, 1                                
  03de  eb40             jmp 0x420                                
  03e0  56               push si                                  
  03e1  90               nop                                      
  03e2  0e               push cs                                  
  03e3  e8b60d           call 0x119c                              
  03e6  59               pop cx                                   
  03e7  8956fc           mov word ptr [bp - 4], dx                
  03ea  8946fa           mov word ptr [bp - 6], ax                
  03ed  33ff             xor di, di                               
  03ef  eb29             jmp 0x41a                                
  03f1  668b46fa         mov eax, dword ptr [bp - 6]              
  03f5  668946f6         mov dword ptr [bp - 0xa], eax            
  03f9  8bc7             mov ax, di                               
  03fb  d1e0             shl ax, 1                                
  03fd  0146f6           add word ptr [bp - 0xa], ax              
  0400  c45ef6           les bx, ptr [bp - 0xa]                   
  0403  268b07           mov ax, word ptr es:[bx]                 
  0406  3b46fe           cmp ax, word ptr [bp - 2]                
  0409  7d05             jge 0x410                                
  040b  8b46fe           mov ax, word ptr [bp - 2]                
  040e  eb06             jmp 0x416                                
  0410  c45ef6           les bx, ptr [bp - 0xa]                   
  0413  268b07           mov ax, word ptr es:[bx]                 
  0416  8946fe           mov word ptr [bp - 2], ax                
  0419  47               inc di                                   
  041a  83ff08           cmp di, 8                                
  041d  7cd2             jl 0x3f1                                 
  041f  46               inc si                                   
  0420  a13c44           mov ax, word ptr [0x443c]                
  0423  48               dec ax                                   
  0424  3bc6             cmp ax, si                               
  0426  7db8             jge 0x3e0                                
  0428  eb5e             jmp 0x488                                
  042a  c70626444230     mov word ptr [0x4426], 0x3042            
  0430  c70624448e00     mov word ptr [0x4424], 0x8e              
  0436  c746fe6400       mov word ptr [bp - 2], 0x64              
  043b  be0100           mov si, 1                                
  043e  eb40             jmp 0x480                                
  0440  56               push si                                  
  0441  90               nop                                      
  0442  0e               push cs                                  
  0443  e81b0d           call 0x1161                              
  0446  59               pop cx                                   
  0447  8956fc           mov word ptr [bp - 4], dx                
  044a  8946fa           mov word ptr [bp - 6], ax                
  044d  33ff             xor di, di                               
  044f  eb29             jmp 0x47a                                
  0451  668b46fa         mov eax, dword ptr [bp - 6]              
  0455  668946f6         mov dword ptr [bp - 0xa], eax            
  0459  8bc7             mov ax, di                               
  045b  d1e0             shl ax, 1                                
  045d  0146f6           add word ptr [bp - 0xa], ax              
  0460  c45ef6           les bx, ptr [bp - 0xa]                   
  0463  268b07           mov ax, word ptr es:[bx]                 
  0466  3b46fe           cmp ax, word ptr [bp - 2]                
  0469  7d05             jge 0x470                                
  046b  8b46fe           mov ax, word ptr [bp - 2]                
  046e  eb06             jmp 0x476                                
  0470  c45ef6           les bx, ptr [bp - 0xa]                   
  0473  268b07           mov ax, word ptr es:[bx]                 
  0476  8946fe           mov word ptr [bp - 2], ax                
  0479  47               inc di                                   
  047a  83ff08           cmp di, 8                                
  047d  7cd2             jl 0x451                                 
  047f  46               inc si                                   
  0480  a13c44           mov ax, word ptr [0x443c]                
  0483  48               dec ax                                   
  0484  3bc6             cmp ax, si                               
  0486  7db8             jge 0x440                                
  0488  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  048d  6a00             push 0                                   
  048f  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0494  59               pop cx                                   
  0495  ff36cc0d         push word ptr [0xdcc]                    
  0499  a1c80d           mov ax, word ptr [0xdc8]                 
  049c  48               dec ax                                   
  049d  50               push ax                                  
  049e  a1c60d           mov ax, word ptr [0xdc6]                 
  04a1  48               dec ax                                   
  04a2  50               push ax                                  
  04a3  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  04a8  83c406           add sp, 6                                
  04ab  ff36ca0d         push word ptr [0xdca]                    
  04af  a1c80d           mov ax, word ptr [0xdc8]                 
  04b2  0306cc0d         add ax, word ptr [0xdcc]                 
  04b6  05feff           add ax, 0xfffe                           
  04b9  50               push ax                                  
  04ba  a1c60d           mov ax, word ptr [0xdc6]                 
  04bd  48               dec ax                                   
  04be  50               push ax                                  
  04bf  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  04c4  83c406           add sp, 6                                
  04c7  6a04             push 4                                   
  04c9  a1c80d           mov ax, word ptr [0xdc8]                 
  04cc  48               dec ax                                   
  04cd  50               push ax                                  
  04ce  a1c60d           mov ax, word ptr [0xdc6]                 
  04d1  05fbff           add ax, 0xfffb                           
  04d4  50               push ax                                  
  04d5  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  04da  83c406           add sp, 6                                
  04dd  6a04             push 4                                   
  04df  a1cc0d           mov ax, word ptr [0xdcc]                 
  04e2  99               cdq                                      
  04e3  2bc2             sub ax, dx                               
  04e5  d1f8             sar ax, 1                                
  04e7  8b16c80d         mov dx, word ptr [0xdc8]                 
  04eb  03d0             add dx, ax                               
  04ed  4a               dec dx                                   
  04ee  52               push dx                                  
  04ef  a1c60d           mov ax, word ptr [0xdc6]                 
  04f2  05fbff           add ax, 0xfffb                           
  04f5  50               push ax                                  
  04f6  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  04fb  83c406           add sp, 6                                
  04fe  6a04             push 4                                   
  0500  a1c80d           mov ax, word ptr [0xdc8]                 
  0503  0306cc0d         add ax, word ptr [0xdcc]                 
  0507  05feff           add ax, 0xfffe                           
  050a  50               push ax                                  
  050b  a1c60d           mov ax, word ptr [0xdc6]                 
  050e  05fbff           add ax, 0xfffb                           
  0511  50               push ax                                  
  0512  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0517  83c406           add sp, 6                                
  051a  6a04             push 4                                   
  051c  a1c80d           mov ax, word ptr [0xdc8]                 
  051f  0306cc0d         add ax, word ptr [0xdcc]                 
  0523  05feff           add ax, 0xfffe                           
  0526  50               push ax                                  
  0527  a1c60d           mov ax, word ptr [0xdc6]                 
  052a  48               dec ax                                   
  052b  50               push ax                                  
  052c  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0531  83c406           add sp, 6                                
  0534  6a04             push 4                                   
  0536  a1c80d           mov ax, word ptr [0xdc8]                 
  0539  0306cc0d         add ax, word ptr [0xdcc]                 
  053d  05feff           add ax, 0xfffe                           
  0540  50               push ax                                  
  0541  a1ca0d           mov ax, word ptr [0xdca]                 
  0544  99               cdq                                      
  0545  2bc2             sub ax, dx                               
  0547  d1f8             sar ax, 1                                
  0549  8b16c60d         mov dx, word ptr [0xdc6]                 
  054d  03d0             add dx, ax                               
  054f  4a               dec dx                                   
  0550  52               push dx                                  
  0551  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0556  83c406           add sp, 6                                
  0559  6a04             push 4                                   
  055b  a1c80d           mov ax, word ptr [0xdc8]                 
  055e  0306cc0d         add ax, word ptr [0xdcc]                 
  0562  05feff           add ax, 0xfffe                           
  0565  50               push ax                                  
  0566  a1c60d           mov ax, word ptr [0xdc6]                 
  0569  0306ca0d         add ax, word ptr [0xdca]                 
  056d  05feff           add ax, 0xfffe                           
  0570  50               push ax                                  
  0571  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0576  83c406           add sp, 6                                
  0579  6a0f             push 0xf                                 
  057b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0580  59               pop cx                                   
  0581  ff36cc0d         push word ptr [0xdcc]                    
  0585  66ff36c60d       push dword ptr [0xdc6]                   
  058a  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  058f  83c406           add sp, 6                                
  0592  ff36ca0d         push word ptr [0xdca]                    
  0596  a1c80d           mov ax, word ptr [0xdc8]                 
  0599  0306cc0d         add ax, word ptr [0xdcc]                 
  059d  48               dec ax                                   
  059e  50               push ax                                  
  059f  ff36c60d         push word ptr [0xdc6]                    
  05a3  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  05a8  83c406           add sp, 6                                
  05ab  6a04             push 4                                   
  05ad  ff36c80d         push word ptr [0xdc8]                    
  05b1  a1c60d           mov ax, word ptr [0xdc6]                 
  05b4  05fcff           add ax, 0xfffc                           
  05b7  50               push ax                                  
  05b8  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  05bd  83c406           add sp, 6                                
  05c0  6a04             push 4                                   
  05c2  a1cc0d           mov ax, word ptr [0xdcc]                 
  05c5  99               cdq                                      
  05c6  2bc2             sub ax, dx                               
  05c8  d1f8             sar ax, 1                                
  05ca  8b16c80d         mov dx, word ptr [0xdc8]                 
  05ce  03d0             add dx, ax                               
  05d0  52               push dx                                  
  05d1  a1c60d           mov ax, word ptr [0xdc6]                 
  05d4  05fcff           add ax, 0xfffc                           
  05d7  50               push ax                                  
  05d8  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  05dd  83c406           add sp, 6                                
  05e0  6a04             push 4                                   
  05e2  a1c80d           mov ax, word ptr [0xdc8]                 
  05e5  0306cc0d         add ax, word ptr [0xdcc]                 
  05e9  48               dec ax                                   
  05ea  50               push ax                                  
  05eb  a1c60d           mov ax, word ptr [0xdc6]                 
  05ee  05fcff           add ax, 0xfffc                           
  05f1  50               push ax                                  
  05f2  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  05f7  83c406           add sp, 6                                
  05fa  6a04             push 4                                   
  05fc  a1c80d           mov ax, word ptr [0xdc8]                 
  05ff  0306cc0d         add ax, word ptr [0xdcc]                 
  0603  48               dec ax                                   
  0604  50               push ax                                  
  0605  ff36c60d         push word ptr [0xdc6]                    
  0609  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  060e  83c406           add sp, 6                                
  0611  6a04             push 4                                   
  0613  a1c80d           mov ax, word ptr [0xdc8]                 
  0616  0306cc0d         add ax, word ptr [0xdcc]                 
  061a  48               dec ax                                   
  061b  50               push ax                                  
  061c  a1ca0d           mov ax, word ptr [0xdca]                 
  061f  99               cdq                                      
  0620  2bc2             sub ax, dx                               
  0622  d1f8             sar ax, 1                                
  0624  8b16c60d         mov dx, word ptr [0xdc6]                 
  0628  03d0             add dx, ax                               
  062a  52               push dx                                  
  062b  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0630  83c406           add sp, 6                                
  0633  6a04             push 4                                   
  0635  a1c80d           mov ax, word ptr [0xdc8]                 
  0638  0306cc0d         add ax, word ptr [0xdcc]                 
  063c  48               dec ax                                   
  063d  50               push ax                                  
  063e  a1c60d           mov ax, word ptr [0xdc6]                 
  0641  0306ca0d         add ax, word ptr [0xdca]                 
  0645  48               dec ax                                   
  0646  50               push ax                                  
  0647  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  064c  83c406           add sp, 6                                
  064f  ff76fe           push word ptr [bp - 2]                   
  0652  1e               push ds                                  
  0653  68e60d           push 0xde6                               
  0656  16               push ss                                  
  0657  8d46e8           lea ax, [bp - 0x18]                      
  065a  50               push ax                                  
  065b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0660  83c40a           add sp, 0xa                              
  0663  1e               push ds                                  
  0664  68e90d           push 0xde9                               
  0667  a1c80d           mov ax, word ptr [0xdc8]                 
  066a  0306cc0d         add ax, word ptr [0xdcc]                 
  066e  05f8ff           add ax, 0xfff8                           
  0671  50               push ax                                  
  0672  a1c60d           mov ax, word ptr [0xdc6]                 
  0675  05f8ff           add ax, 0xfff8                           
  0678  50               push ax                                  
  0679  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  067e  83c408           add sp, 8                                
  0681  16               push ss                                  
  0682  8d46e8           lea ax, [bp - 0x18]                      
  0685  50               push ax                                  
  0686  a1c80d           mov ax, word ptr [0xdc8]                 
  0689  05faff           add ax, 0xfffa                           
  068c  50               push ax                                  
  068d  a1c60d           mov ax, word ptr [0xdc6]                 
  0690  05f8ff           add ax, 0xfff8                           
  0693  50               push ax                                  
  0694  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0699  83c408           add sp, 8                                
  069c  a13c44           mov ax, word ptr [0x443c]                
  069f  48               dec ax                                   
  06a0  50               push ax                                  
  06a1  1e               push ds                                  
  06a2  68eb0d           push 0xdeb                               
  06a5  16               push ss                                  
  06a6  8d46e8           lea ax, [bp - 0x18]                      
  06a9  50               push ax                                  
  06aa  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  06af  83c40a           add sp, 0xa                              
  06b2  1e               push ds                                  
  06b3  68ee0d           push 0xdee                               
  06b6  a1c80d           mov ax, word ptr [0xdc8]                 
  06b9  0306cc0d         add ax, word ptr [0xdcc]                 
  06bd  050800           add ax, 8                                
  06c0  50               push ax                                  
  06c1  ff36c60d         push word ptr [0xdc6]                    
  06c5  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  06ca  83c408           add sp, 8                                
  06cd  16               push ss                                  
  06ce  8d46e8           lea ax, [bp - 0x18]                      
  06d1  50               push ax                                  
  06d2  a1c80d           mov ax, word ptr [0xdc8]                 
  06d5  0306cc0d         add ax, word ptr [0xdcc]                 
  06d9  050800           add ax, 8                                
  06dc  50               push ax                                  
  06dd  a1c60d           mov ax, word ptr [0xdc6]                 
  06e0  0306ca0d         add ax, word ptr [0xdca]                 
  06e4  050800           add ax, 8                                
  06e7  50               push ax                                  
  06e8  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  06ed  83c408           add sp, 8                                
  06f0  1e               push ds                                  
  06f1  68f00d           push 0xdf0                                ; "Turns"
  06f4  a1c80d           mov ax, word ptr [0xdc8]                 
  06f7  0306cc0d         add ax, word ptr [0xdcc]                 
  06fb  050800           add ax, 8                                
  06fe  50               push ax                                  
  06ff  a1ca0d           mov ax, word ptr [0xdca]                 
  0702  99               cdq                                      
  0703  2bc2             sub ax, dx                               
  0705  d1f8             sar ax, 1                                
  0707  8b16c60d         mov dx, word ptr [0xdc6]                 
  070b  03d0             add dx, ax                               
  070d  52               push dx                                  
  070e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0713  83c408           add sp, 8                                
  0716  33f6             xor si, si                               
  0718  eb27             jmp 0x741                                
  071a  8bde             mov bx, si                               
  071c  d1e3             shl bx, 1                                
  071e  8d46d2           lea ax, [bp - 0x2e]                      
  0721  03d8             add bx, ax                               
  0723  a1c60d           mov ax, word ptr [0xdc6]                 
  0726  40               inc ax                                   
  0727  368907           mov word ptr ss:[bx], ax                 
  072a  8bde             mov bx, si                               
  072c  d1e3             shl bx, 1                                
  072e  8d46c2           lea ax, [bp - 0x3e]                      
  0731  03d8             add bx, ax                               
  0733  a1c80d           mov ax, word ptr [0xdc8]                 
  0736  0306cc0d         add ax, word ptr [0xdcc]                 
  073a  05feff           add ax, 0xfffe                           
  073d  368907           mov word ptr ss:[bx], ax                 
  0740  46               inc si                                   
  0741  83fe08           cmp si, 8                                
  0744  7cd4             jl 0x71a                                 
  0746  be0100           mov si, 1                                
  0749  e9ee00           jmp 0x83a                                
  074c  56               push si                                  
  074d  ff1e2444         lcall [0x4424]                           
  0751  59               pop cx                                   
  0752  8956fc           mov word ptr [bp - 4], dx                
  0755  8946fa           mov word ptr [bp - 6], ax                
  0758  660fbfc6         movsx eax, si                            
  075c  660fbf16ca0d     movsx edx, word ptr [0xdca]              
  0762  660fafc2         imul eax, edx                            
  0766  8b163c44         mov dx, word ptr [0x443c]                
  076a  4a               dec dx                                   
  076b  660fbfda         movsx ebx, dx                            
  076f  6699             cdq                                      
  0771  66f7fb           idiv ebx                                 
  0774  8b16c60d         mov dx, word ptr [0xdc6]                 
  0778  03d0             add dx, ax                               
  077a  8956f4           mov word ptr [bp - 0xc], dx              
  077d  33ff             xor di, di                               
  077f  e9af00           jmp 0x831                                
  0782  8bc7             mov ax, di                               
  0784  d1e0             shl ax, 1                                
  0786  8b56fc           mov dx, word ptr [bp - 4]                
  0789  8b5efa           mov bx, word ptr [bp - 6]                
  078c  03d8             add bx, ax                               
  078e  8956f8           mov word ptr [bp - 8], dx                
  0791  895ef6           mov word ptr [bp - 0xa], bx              
  0794  8e46f8           mov es, word ptr [bp - 8]                
  0797  268b07           mov ax, word ptr es:[bx]                 
  079a  8946e2           mov word ptr [bp - 0x1e], ax             
  079d  cd3b             int 0x3b                                 
  079f  46               inc si                                   
  07a0  e28b             loop 0x72d                               
  07a2  46               inc si                                   
  07a3  fe8946e2         dec byte ptr [bx + di - 0x1dba]          
  07a7  cd3b             int 0x3b                                 
  07a9  46               inc si                                   
  07aa  e2cd             loop 0x779                               
  07ac  3af9             cmp bh, cl                               
  07ae  cd35             int 0x35                                 
  07b0  5e               pop si                                   
  07b1  e4cd             in al, 0xcd                              
  07b3  3da1cc           cmp ax, 0xcca1                           
  07b6  0d8946           or ax, 0x4689                            
  07b9  e2cd             loop 0x788                                ; "%s is being razed!"
  07bb  3b46e2           cmp ax, word ptr [bp - 0x1e]             
  07be  cd34             int 0x34                                 
  07c0  4e               dec si                                   
  07c1  e49a             in al, 0x9a                              
  07c3  57               push di                                  
  07c4  1b00             sbb ax, word ptr [bx + si]               
  07c6  008b16c8         add byte ptr [bp + di - 0x37ea], cl      
  07ca  0d0316           or ax, 0x1603                            
  07cd  cc               int3                                     
  07ce  0d4a2b           or ax, 0x2b4a                            
  07d1  d08956f2         ror byte ptr [bx + di - 0xdaa], 1        
  07d5  8bdf             mov bx, di                               
  07d7  d1e3             shl bx, 1                                
  07d9  b8042c           mov ax, 0x2c04                           
  07dc  8ec0             mov es, ax                               
  07de  26ffb7a000       push word ptr es:[bx + 0xa0]             
  07e3  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  07e8  59               pop cx                                   
  07e9  666a00           push 0                                   
  07ec  ff76f2           push word ptr [bp - 0xe]                 
  07ef  ff76f4           push word ptr [bp - 0xc]                 
  07f2  8bdf             mov bx, di                               
  07f4  d1e3             shl bx, 1                                
  07f6  8d46c2           lea ax, [bp - 0x3e]                      
  07f9  03d8             add bx, ax                               
  07fb  36ff37           push word ptr ss:[bx]                    
  07fe  8bdf             mov bx, di                               
  0800  d1e3             shl bx, 1                                
  0802  8d46d2           lea ax, [bp - 0x2e]                      
  0805  03d8             add bx, ax                               
  0807  36ff37           push word ptr ss:[bx]                    
  080a  9a95003311       lcall 0x1133, 0x95                       -> 1133:0095
  080f  83c40c           add sp, 0xc                              
  0812  8bdf             mov bx, di                               
  0814  d1e3             shl bx, 1                                
  0816  8d46d2           lea ax, [bp - 0x2e]                      
  0819  03d8             add bx, ax                               
  081b  8b46f4           mov ax, word ptr [bp - 0xc]              
  081e  368907           mov word ptr ss:[bx], ax                 
  0821  8bdf             mov bx, di                               
  0823  d1e3             shl bx, 1                                
  0825  8d46c2           lea ax, [bp - 0x3e]                      
  0828  03d8             add bx, ax                               
  082a  8b46f2           mov ax, word ptr [bp - 0xe]              
  082d  368907           mov word ptr ss:[bx], ax                 
  0830  47               inc di                                   
  0831  83ff08           cmp di, 8                                
  0834  7d03             jge 0x839                                
  0836  e949ff           jmp 0x782                                
  0839  46               inc si                                   
  083a  a13c44           mov ax, word ptr [0x443c]                
  083d  48               dec ax                                   
  083e  3bc6             cmp ax, si                               
  0840  7c03             jl 0x845                                 
  0842  e907ff           jmp 0x74c                                
  0845  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  084a  5f               pop di                                   
  084b  5e               pop si                                   
  084c  c9               leave                                    
  084d  cb               retf                                     

ovl41_084e:  ; ENTRY
  084e  55               push bp                                  
  084f  8bec             mov bp, sp                               
  0851  56               push si                                  
  0852  33f6             xor si, si                               
  0854  eb1b             jmp 0x871                                
  0856  3936c40d         cmp word ptr [0xdc4], si                 
  085a  7504             jne 0x860                                
  085c  6a00             push 0                                   
  085e  eb02             jmp 0x862                                
  0860  6a01             push 1                                   
  0862  8bc6             mov ax, si                               
  0864  056001           add ax, 0x160                            
  0867  50               push ax                                  
  0868  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  086d  83c404           add sp, 4                                
  0870  46               inc si                                   
  0871  83fe04           cmp si, 4                                
  0874  7ce0             jl 0x856                                 
  0876  833e3e4401       cmp word ptr [0x443e], 1                 
  087b  7504             jne 0x881                                
  087d  6a02             push 2                                   
  087f  eb02             jmp 0x883                                
  0881  6a01             push 1                                   
  0883  686501           push 0x165                               
  0886  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  088b  83c404           add sp, 4                                
  088e  a13c44           mov ax, word ptr [0x443c]                
  0891  48               dec ax                                   
  0892  3b063e44         cmp ax, word ptr [0x443e]                
  0896  7504             jne 0x89c                                
  0898  6a02             push 2                                   
  089a  eb02             jmp 0x89e                                
  089c  6a01             push 1                                   
  089e  686601           push 0x166                               
  08a1  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  08a6  83c404           add sp, 4                                
  08a9  833ec40d01       cmp word ptr [0xdc4], 1                  
  08ae  7411             je 0x8c1                                 
  08b0  6a0a             push 0xa                                 
  08b2  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  08b7  59               pop cx                                   
  08b8  6a0b             push 0xb                                 
  08ba  9a3908a908       lcall 0x8a9, 0x839                       -> 08a9:0839
  08bf  eb0f             jmp 0x8d0                                
  08c1  6a0a             push 0xa                                 
  08c3  9a3908a908       lcall 0x8a9, 0x839                       -> 08a9:0839
  08c8  59               pop cx                                   
  08c9  6a0b             push 0xb                                 
  08cb  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  08d0  59               pop cx                                   
  08d1  666864010100     push 0x10164                             
  08d7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  08dc  83c404           add sp, 4                                
  08df  5e               pop si                                   
  08e0  5d               pop bp                                   
  08e1  cb               retf                                     

ovl41_08e2:  ; ENTRY
  08e2  55               push bp                                  
  08e3  8bec             mov bp, sp                               
  08e5  8b4606           mov ax, word ptr [bp + 6]                
  08e8  a3c40d           mov word ptr [0xdc4], ax                 
  08eb  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  08f0  666801000100     push 0x10001                             
  08f6  0e               push cs                                  
  08f7  e89cf7           call 0x96                                
  08fa  83c404           add sp, 4                                
  08fd  0e               push cs                                  
  08fe  e84dff           call 0x84e                               
  0901  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0906  5d               pop bp                                   
  0907  cb               retf                                     

ovl41_0908:  ; ENTRY
  0908  55               push bp                                  
  0909  8bec             mov bp, sp                               
  090b  83ec0a           sub sp, 0xa                              
  090e  8b5606           mov dx, word ptr [bp + 6]                
  0911  0bd2             or dx, dx                                
  0913  757d             jne 0x992                                
  0915  16               push ss                                  
  0916  8d46fc           lea ax, [bp - 4]                         
  0919  50               push ax                                  
  091a  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  091f  83c404           add sp, 4                                
  0922  833ec40d01       cmp word ptr [0xdc4], 1                  
  0927  741c             je 0x945                                 
  0929  8b46fc           mov ax, word ptr [bp - 4]                
  092c  8946f6           mov word ptr [bp - 0xa], ax              
  092f  cd3b             int 0x3b                                 
  0931  46               inc si                                   
  0932  f6a1c60d         mul byte ptr [bx + di + 0xdc6]           
  0936  8946f6           mov word ptr [bp - 0xa], ax              
  0939  cd3b             int 0x3b                                 
  093b  46               inc si                                   
  093c  f6cd3a           test ch, 0x3a                            
  093f  e9a1ca           jmp 0xffffd3e3                           
  0942  0deb1a           or ax, 0x1aeb                            
  0945  8b46fc           mov ax, word ptr [bp - 4]                
  0948  8946f6           mov word ptr [bp - 0xa], ax              
  094b  cd3b             int 0x3b                                 
  094d  46               inc si                                   
  094e  f6a1d60d         mul byte ptr [bx + di + 0xdd6]           
  0952  8946f6           mov word ptr [bp - 0xa], ax              
  0955  cd3b             int 0x3b                                 
  0957  46               inc si                                   
  0958  f6cd3a           test ch, 0x3a                            
  095b  e9a1da           jmp 0xffffe3ff                           
  095e  0d8946           or ax, 0x4689                            
  0961  f6cd3b           test ch, 0x3b                            
  0964  46               inc si                                   
  0965  f6cd3a           test ch, 0x3a                            
  0968  f9               stc                                      
  0969  cd35             int 0x35                                 
  096b  5e               pop si                                   
  096c  f8               clc                                      
  096d  cd3d             int 0x3d                                 
  096f  a13c44           mov ax, word ptr [0x443c]                
  0972  48               dec ax                                   
  0973  8946f6           mov word ptr [bp - 0xa], ax              
  0976  cd3b             int 0x3b                                 
  0978  46               inc si                                   
  0979  f6cd34           test ch, 0x34                            
  097c  4e               dec si                                   
  097d  f8               clc                                      
  097e  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  0983  40               inc ax                                   
  0984  8bd0             mov dx, ax                               
  0986  3b163e44         cmp dx, word ptr [0x443e]                
  098a  7441             je 0x9cd                                 
  098c  89163e44         mov word ptr [0x443e], dx                
  0990  eb04             jmp 0x996                                
  0992  01163e44         add word ptr [0x443e], dx                
  0996  833ec40d01       cmp word ptr [0xdc4], 1                  
  099b  741f             je 0x9bc                                 
  099d  6aff             push -1                                  
  099f  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  09a4  59               pop cx                                   
  09a5  66ff363044       push dword ptr [0x4430]                  
  09aa  66ff362c44       push dword ptr [0x442c]                  
  09af  66ff362844       push dword ptr [0x4428]                  
  09b4  9a95003311       lcall 0x1133, 0x95                       -> 1133:0095
  09b9  83c40c           add sp, 0xc                              
  09bc  666800000100     push 0x10000                             
  09c2  0e               push cs                                  
  09c3  e8d0f6           call 0x96                                
  09c6  83c404           add sp, 4                                
  09c9  0e               push cs                                  
  09ca  e881fe           call 0x84e                               
  09cd  c9               leave                                    
  09ce  cb               retf                                     

ovl41_09cf:  ; ENTRY
  09cf  55               push bp                                  
  09d0  8bec             mov bp, sp                               
  09d2  90               nop                                      
  09d3  0e               push cs                                  
  09d4  e8e806           call 0x10bf                              
  09d7  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  09dc  666a00           push 0                                   
  09df  6a00             push 0                                   
  09e1  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  09e6  83c406           add sp, 6                                
  09e9  5d               pop bp                                   
  09ea  cb               retf                                     

ovl41_09eb:  ; ENTRY
  09eb  55               push bp                                  
  09ec  8bec             mov bp, sp                               
  09ee  b8042c           mov ax, 0x2c04                           
  09f1  8ec0             mov es, ax                               
  09f3  26a11001         mov ax, word ptr es:[0x110]              
  09f7  a32244           mov word ptr [0x4422], ax                
  09fa  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  09ff  6a01             push 1                                   
  0a01  90               nop                                      
  0a02  0e               push cs                                  
  0a03  e81b00           call 0xa21                               
  0a06  59               pop cx                                   
  0a07  c7066a160100     mov word ptr [0x166a], 1                 
  0a0d  6a14             push 0x14                                
  0a0f  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0a14  59               pop cx                                   
  0a15  90               nop                                      
  0a16  0e               push cs                                  
  0a17  e8e002           call 0xcfa                               
  0a1a  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a1f  5d               pop bp                                   
  0a20  cb               retf                                     

ovl41_0a21:  ; ENTRY
  0a21  55               push bp                                  
  0a22  8bec             mov bp, sp                               
  0a24  83ec60           sub sp, 0x60                             
  0a27  56               push si                                  
  0a28  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0a2d  837e0600         cmp word ptr [bp + 6], 0                 
  0a31  7457             je 0xa8a                                 
  0a33  833e6a1600       cmp word ptr [0x166a], 0                 
  0a38  7413             je 0xa4d                                 
  0a3a  66687001a800     push 0xa80170                            
  0a40  666840007500     push 0x750040                            
  0a46  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0a4b  eb3a             jmp 0xa87                                
  0a4d  c7066a160100     mov word ptr [0x166a], 1                 
  0a53  6a00             push 0                                   
  0a55  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0a5a  59               pop cx                                   
  0a5b  666800000300     push 0x30000                             
  0a61  666801000f00     push 0xf0001                             
  0a67  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0a6c  83c408           add sp, 8                                
  0a6f  666a50           push 0x50                                
  0a72  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a77  83c404           add sp, 4                                
  0a7a  52               push dx                                  
  0a7b  50               push ax                                  
  0a7c  666840014000     push 0x400140                            
  0a82  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0a87  83c408           add sp, 8                                
  0a8a  33f6             xor si, si                               
  0a8c  e9a600           jmp 0xb35                                
  0a8f  666830002800     push 0x280030                            
  0a95  3b362244         cmp si, word ptr [0x4422]                
  0a99  7505             jne 0xaa0                                
  0a9b  b82800           mov ax, 0x28                             
  0a9e  eb02             jmp 0xaa2                                
  0aa0  33c0             xor ax, ax                               
  0aa2  50               push ax                                  
  0aa3  689001           push 0x190                               
  0aa6  16               push ss                                  
  0aa7  8d46f8           lea ax, [bp - 8]                         
  0aaa  50               push ax                                  
  0aab  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0ab0  83c40c           add sp, 0xc                              
  0ab3  6a6d             push 0x6d                                
  0ab5  8bc6             mov ax, si                               
  0ab7  6bc030           imul ax, ax, 0x30                        
  0aba  058000           add ax, 0x80                             
  0abd  50               push ax                                  
  0abe  16               push ss                                  
  0abf  8d46f4           lea ax, [bp - 0xc]                       
  0ac2  50               push ax                                  
  0ac3  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0ac8  83c408           add sp, 8                                
  0acb  66ff76f4         push dword ptr [bp - 0xc]                
  0acf  8d46f8           lea ax, [bp - 8]                         
  0ad2  8cd2             mov dx, ss                               
  0ad4  b90800           mov cx, 8                                
  0ad7  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0adc  6a04             push 4                                   
  0ade  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0ae3  83c40e           add sp, 0xe                              
  0ae6  666820002400     push 0x240020                            
  0aec  6a00             push 0                                   
  0aee  8bc6             mov ax, si                               
  0af0  c1e005           shl ax, 5                                
  0af3  50               push ax                                  
  0af4  16               push ss                                  
  0af5  8d46f8           lea ax, [bp - 8]                         
  0af8  50               push ax                                  
  0af9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0afe  83c40c           add sp, 0xc                              
  0b01  6a6f             push 0x6f                                
  0b03  8bc6             mov ax, si                               
  0b05  6bc030           imul ax, ax, 0x30                        
  0b08  058800           add ax, 0x88                             
  0b0b  50               push ax                                  
  0b0c  16               push ss                                  
  0b0d  8d46f4           lea ax, [bp - 0xc]                       
  0b10  50               push ax                                  
  0b11  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0b16  83c408           add sp, 8                                
  0b19  66ff76f4         push dword ptr [bp - 0xc]                
  0b1d  8d46f8           lea ax, [bp - 8]                         
  0b20  8cd2             mov dx, ss                               
  0b22  b90800           mov cx, 8                                
  0b25  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0b2a  6a26             push 0x26                                
  0b2c  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0b31  83c40e           add sp, 0xe                              
  0b34  46               inc si                                   
  0b35  83fe08           cmp si, 8                                
  0b38  7d03             jge 0xb3d                                
  0b3a  e952ff           jmp 0xa8f                                
  0b3d  666a00           push 0                                   
  0b40  666800000100     push 0x10000                             
  0b46  666a00           push 0                                   
  0b49  6668a8000000     push 0xa8                                
  0b4f  6a68             push 0x68                                
  0b51  1e               push ds                                  
  0b52  682a34           push 0x342a                              
  0b55  ff362244         push word ptr [0x4422]                   
  0b59  6a04             push 4                                   
  0b5b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0b60  83c41a           add sp, 0x1a                             
  0b63  666a00           push 0                                   
  0b66  666800000100     push 0x10000                             
  0b6c  666a00           push 0                                   
  0b6f  6668cb000000     push 0xcb                                
  0b75  6a68             push 0x68                                
  0b77  1e               push ds                                  
  0b78  682a34           push 0x342a                              
  0b7b  ff362244         push word ptr [0x4422]                   
  0b7f  6a19             push 0x19                                
  0b81  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0b86  83c41a           add sp, 0x1a                             
  0b89  666a00           push 0                                   
  0b8c  666800000100     push 0x10000                             
  0b92  666a00           push 0                                   
  0b95  6668ee000000     push 0xee                                
  0b9b  6a68             push 0x68                                
  0b9d  1e               push ds                                  
  0b9e  682a34           push 0x342a                              
  0ba1  ff362244         push word ptr [0x4422]                   
  0ba5  6a1c             push 0x1c                                
  0ba7  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0bac  83c41a           add sp, 0x1a                             
  0baf  666a00           push 0                                   
  0bb2  666800000100     push 0x10000                             
  0bb8  666a00           push 0                                   
  0bbb  666811010000     push 0x111                               
  0bc1  6a68             push 0x68                                
  0bc3  1e               push ds                                  
  0bc4  682a34           push 0x342a                              
  0bc7  ff362244         push word ptr [0x4422]                   
  0bcb  6a05             push 5                                   
  0bcd  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0bd2  83c41a           add sp, 0x1a                             
  0bd5  666a00           push 0                                   
  0bd8  666800000100     push 0x10000                             
  0bde  666a00           push 0                                   
  0be1  666834010000     push 0x134                               
  0be7  6a68             push 0x68                                
  0be9  1e               push ds                                  
  0bea  682a34           push 0x342a                              
  0bed  ff362244         push word ptr [0x4422]                   
  0bf1  6a1d             push 0x1d                                
  0bf3  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0bf8  83c41a           add sp, 0x1a                             
  0bfb  666800000300     push 0x30000                             
  0c01  666802000f00     push 0xf0002                             
  0c07  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0c0c  83c408           add sp, 8                                
  0c0f  b8042c           mov ax, 0x2c04                           
  0c12  8ec0             mov es, ax                               
  0c14  26a11001         mov ax, word ptr es:[0x110]              
  0c18  3b062244         cmp ax, word ptr [0x4422]                
  0c1c  7505             jne 0xc23                                
  0c1e  b85100           mov ax, 0x51                             
  0c21  eb03             jmp 0xc26                                
  0c23  b85600           mov ax, 0x56                             
  0c26  8946f2           mov word ptr [bp - 0xe], ax              
  0c29  33f6             xor si, si                               
  0c2b  e9bc00           jmp 0xcea                                
  0c2e  b8042c           mov ax, 0x2c04                           
  0c31  8ec0             mov es, ax                               
  0c33  268b1e1001       mov bx, word ptr es:[0x110]              
  0c38  6bdb50           imul bx, bx, 0x50                        
  0c3b  a12244           mov ax, word ptr [0x4422]                
  0c3e  6bc00a           imul ax, ax, 0xa                         
  0c41  03d8             add bx, ax                               
  0c43  8bc6             mov ax, si                               
  0c45  d1e0             shl ax, 1                                
  0c47  03d8             add bx, ax                               
  0c49  b8042c           mov ax, 0x2c04                           
  0c4c  8ec0             mov es, ax                               
  0c4e  2683bf631100     cmp word ptr es:[bx + 0x1163], 0         
  0c54  7f03             jg 0xc59                                 
  0c56  e99000           jmp 0xce9                                
  0c59  b8042c           mov ax, 0x2c04                           
  0c5c  8ec0             mov es, ax                               
  0c5e  268b1e1001       mov bx, word ptr es:[0x110]              
  0c63  6bdb50           imul bx, bx, 0x50                        
  0c66  a12244           mov ax, word ptr [0x4422]                
  0c69  6bc00a           imul ax, ax, 0xa                         
  0c6c  03d8             add bx, ax                               
  0c6e  8bc6             mov ax, si                               
  0c70  d1e0             shl ax, 1                                
  0c72  03d8             add bx, ax                               
  0c74  b8042c           mov ax, 0x2c04                           
  0c77  8ec0             mov es, ax                               
  0c79  2683bf631101     cmp word ptr es:[bx + 0x1163], 1         
  0c7f  7504             jne 0xc85                                
  0c81  33c0             xor ax, ax                               
  0c83  eb03             jmp 0xc88                                
  0c85  b80100           mov ax, 1                                
  0c88  8946f0           mov word ptr [bp - 0x10], ax             
  0c8b  b8042c           mov ax, 0x2c04                           
  0c8e  8ec0             mov es, ax                               
  0c90  268b1e1001       mov bx, word ptr es:[0x110]              
  0c95  6bdb50           imul bx, bx, 0x50                        
  0c98  a12244           mov ax, word ptr [0x4422]                
  0c9b  6bc00a           imul ax, ax, 0xa                         
  0c9e  03d8             add bx, ax                               
  0ca0  8bc6             mov ax, si                               
  0ca2  d1e0             shl ax, 1                                
  0ca4  03d8             add bx, ax                               
  0ca6  b8042c           mov ax, 0x2c04                           
  0ca9  8ec0             mov es, ax                               
  0cab  26ffb76311       push word ptr es:[bx + 0x1163]           
  0cb0  ff76f0           push word ptr [bp - 0x10]                
  0cb3  8b46f2           mov ax, word ptr [bp - 0xe]              
  0cb6  03c6             add ax, si                               
  0cb8  50               push ax                                  
  0cb9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0cbe  83c404           add sp, 4                                
  0cc1  52               push dx                                  
  0cc2  50               push ax                                  
  0cc3  16               push ss                                  
  0cc4  8d46a0           lea ax, [bp - 0x60]                      
  0cc7  50               push ax                                  
  0cc8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ccd  83c40a           add sp, 0xa                              
  0cd0  16               push ss                                  
  0cd1  8d46a0           lea ax, [bp - 0x60]                      
  0cd4  50               push ax                                  
  0cd5  8bc6             mov ax, si                               
  0cd7  6bc023           imul ax, ax, 0x23                        
  0cda  05b100           add ax, 0xb1                             
  0cdd  50               push ax                                  
  0cde  689000           push 0x90                                
  0ce1  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0ce6  83c408           add sp, 8                                
  0ce9  46               inc si                                   
  0cea  83fe05           cmp si, 5                                
  0ced  7d03             jge 0xcf2                                
  0cef  e93cff           jmp 0xc2e                                
  0cf2  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0cf7  5e               pop si                                   
  0cf8  c9               leave                                    
  0cf9  cb               retf                                     

ovl41_0cfa:  ; ENTRY
  0cfa  55               push bp                                  
  0cfb  8bec             mov bp, sp                               
  0cfd  56               push si                                  
  0cfe  33f6             xor si, si                               
  0d00  eb1b             jmp 0xd1d                                
  0d02  3b362244         cmp si, word ptr [0x4422]                
  0d06  7504             jne 0xd0c                                
  0d08  6a00             push 0                                   
  0d0a  eb02             jmp 0xd0e                                
  0d0c  6a01             push 1                                   
  0d0e  8bc6             mov ax, si                               
  0d10  056801           add ax, 0x168                            
  0d13  50               push ax                                  
  0d14  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0d19  83c404           add sp, 4                                
  0d1c  46               inc si                                   
  0d1d  83fe08           cmp si, 8                                
  0d20  7ce0             jl 0xd02                                 
  0d22  666867010100     push 0x10167                             
  0d28  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0d2d  83c404           add sp, 4                                
  0d30  5e               pop si                                   
  0d31  5d               pop bp                                   
  0d32  cb               retf                                     

ovl41_0d33:  ; ENTRY
  0d33  55               push bp                                  
  0d34  8bec             mov bp, sp                               
  0d36  8b4606           mov ax, word ptr [bp + 6]                
  0d39  a32244           mov word ptr [0x4422], ax                
  0d3c  6a01             push 1                                   
  0d3e  0e               push cs                                  
  0d3f  e8dffc           call 0xa21                               
  0d42  59               pop cx                                   
  0d43  0e               push cs                                  
  0d44  e8b3ff           call 0xcfa                               
  0d47  5d               pop bp                                   
  0d48  cb               retf                                     

ovl41_0d49:  ; ENTRY
  0d49  55               push bp                                  
  0d4a  8bec             mov bp, sp                               
  0d4c  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0d51  666a00           push 0                                   
  0d54  6a00             push 0                                   
  0d56  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  0d5b  83c406           add sp, 6                                
  0d5e  5d               pop bp                                   
  0d5f  cb               retf                                     

ovl41_0d60:  ; ENTRY
  0d60  55               push bp                                  
  0d61  8bec             mov bp, sp                               
  0d63  81ec6e01         sub sp, 0x16e                            
  0d67  56               push si                                  
  0d68  57               push di                                  
  0d69  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0d6e  3d0200           cmp ax, 2                                
  0d71  7544             jne 0xdb7                                
  0d73  666800000900     push 0x90000                             
  0d79  6a06             push 6                                   
  0d7b  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0d80  83c404           add sp, 4                                
  0d83  52               push dx                                  
  0d84  50               push ax                                  
  0d85  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0d8a  83c406           add sp, 6                                
  0d8d  8bf8             mov di, ax                               
  0d8f  0bff             or di, di                                
  0d91  7d03             jge 0xd96                                
  0d93  e96f02           jmp 0x1005                               
  0d96  66c746fa04000000 mov dword ptr [bp - 6], 4                
  0d9e  6a04             push 4                                   
  0da0  16               push ss                                  
  0da1  8d46fa           lea ax, [bp - 6]                         
  0da4  50               push ax                                  
  0da5  57               push di                                  
  0da6  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0dab  83c408           add sp, 8                                
  0dae  57               push di                                  
  0daf  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0db4  59               pop cx                                   
  0db5  eb0d             jmp 0xdc4                                
  0db7  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0dbc  3dca00           cmp ax, 0xca                             
  0dbf  7c03             jl 0xdc4                                 
  0dc1  e94102           jmp 0x1005                               
  0dc4  666800000200     push 0x20000                             
  0dca  6a06             push 6                                   
  0dcc  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0dd1  83c404           add sp, 4                                
  0dd4  52               push dx                                  
  0dd5  50               push ax                                  
  0dd6  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0ddb  83c406           add sp, 6                                
  0dde  8bf8             mov di, ax                               
  0de0  6a04             push 4                                   
  0de2  16               push ss                                  
  0de3  8d46fa           lea ax, [bp - 6]                         
  0de6  50               push ax                                  
  0de7  57               push di                                  
  0de8  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0ded  83c408           add sp, 8                                
  0df0  57               push di                                  
  0df1  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0df6  59               pop cx                                   
  0df7  ff76fa           push word ptr [bp - 6]                   
  0dfa  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0dff  59               pop cx                                   
  0e00  8956f8           mov word ptr [bp - 8], dx                
  0e03  8946f6           mov word ptr [bp - 0xa], ax              
  0e06  66837ef600       cmp dword ptr [bp - 0xa], 0              
  0e0b  7503             jne 0xe10                                
  0e0d  e9f501           jmp 0x1005                               
  0e10  666800000100     push 0x10000                             
  0e16  6a06             push 6                                   
  0e18  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0e1d  83c404           add sp, 4                                
  0e20  52               push dx                                  
  0e21  50               push ax                                  
  0e22  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0e27  83c406           add sp, 6                                
  0e2a  8bf8             mov di, ax                               
  0e2c  6a04             push 4                                   
  0e2e  16               push ss                                  
  0e2f  8d46fa           lea ax, [bp - 6]                         
  0e32  50               push ax                                  
  0e33  57               push di                                  
  0e34  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e39  83c408           add sp, 8                                
  0e3c  ff76fa           push word ptr [bp - 6]                   
  0e3f  66ff76f6         push dword ptr [bp - 0xa]                
  0e43  57               push di                                  
  0e44  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e49  83c408           add sp, 8                                
  0e4c  66ff76f6         push dword ptr [bp - 0xa]                
  0e50  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0e55  83c404           add sp, 4                                
  0e58  33c9             xor cx, cx                               
  0e5a  eb5f             jmp 0xebb                                
  0e5c  8bd9             mov bx, cx                               
  0e5e  6bdb41           imul bx, bx, 0x41                        
  0e61  b8042c           mov ax, 0x2c04                           
  0e64  8ec0             mov es, ax                               
  0e66  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0e6b  69dbe000         imul bx, bx, 0xe0                        
  0e6f  8bf1             mov si, cx                               
  0e71  6bf641           imul si, si, 0x41                        
  0e74  b8042c           mov ax, 0x2c04                           
  0e77  8ec0             mov es, ax                               
  0e79  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0e7e  d1e0             shl ax, 1                                
  0e80  03d8             add bx, ax                               
  0e82  b81d1e           mov ax, 0x1e1d                           
  0e85  8ec0             mov es, ax                               
  0e87  268a9f0000       mov bl, byte ptr es:[bx]                 
  0e8c  81e3ff00         and bx, 0xff                             
  0e90  b8042c           mov ax, 0x2c04                           
  0e93  8ec0             mov es, ax                               
  0e95  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0e9b  7404             je 0xea1                                 
  0e9d  b0ff             mov al, 0xff                             
  0e9f  eb0f             jmp 0xeb0                                
  0ea1  8bd9             mov bx, cx                               
  0ea3  6bdb41           imul bx, bx, 0x41                        
  0ea6  b8042c           mov ax, 0x2c04                           
  0ea9  8ec0             mov es, ax                               
  0eab  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0eb0  8d568e           lea dx, [bp - 0x72]                      
  0eb3  8bd9             mov bx, cx                               
  0eb5  03da             add bx, dx                               
  0eb7  368807           mov byte ptr ss:[bx], al                 
  0eba  41               inc cx                                   
  0ebb  b8042c           mov ax, 0x2c04                           
  0ebe  8ec0             mov es, ax                               
  0ec0  26390e7b15       cmp word ptr es:[0x157b], cx             
  0ec5  7f95             jg 0xe5c                                 
  0ec7  33c9             xor cx, cx                               
  0ec9  eb1d             jmp 0xee8                                
  0ecb  8bd9             mov bx, cx                               
  0ecd  6bdb14           imul bx, bx, 0x14                        
  0ed0  b8042c           mov ax, 0x2c04                           
  0ed3  8ec0             mov es, ax                               
  0ed5  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0eda  8bd9             mov bx, cx                               
  0edc  d1e3             shl bx, 1                                
  0ede  8d967eff         lea dx, [bp - 0x82]                      
  0ee2  03da             add bx, dx                               
  0ee4  368907           mov word ptr ss:[bx], ax                 
  0ee7  41               inc cx                                   
  0ee8  83f908           cmp cx, 8                                
  0eeb  7cde             jl 0xecb                                 
  0eed  16               push ss                                  
  0eee  8d866eff         lea ax, [bp - 0x92]                      
  0ef2  50               push ax                                  
  0ef3  9a34004c30       lcall 0x304c, 0x34                       -> ovl42:0947
  0ef8  83c404           add sp, 4                                
  0efb  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0f00  16               push ss                                  
  0f01  8d46f4           lea ax, [bp - 0xc]                       
  0f04  50               push ax                                  
  0f05  16               push ss                                  
  0f06  8d8692fe         lea ax, [bp - 0x16e]                     
  0f0a  50               push ax                                  
  0f0b  90               nop                                      
  0f0c  0e               push cs                                  
  0f0d  e81f04           call 0x132f                              
  0f10  83c408           add sp, 8                                
  0f13  8946f2           mov word ptr [bp - 0xe], ax              
  0f16  b8042c           mov ax, 0x2c04                           
  0f19  8ec0             mov es, ax                               
  0f1b  26a17b15         mov ax, word ptr es:[0x157b]             
  0f1f  0346f4           add ax, word ptr [bp - 0xc]              
  0f22  053400           add ax, 0x34                             
  0f25  8946fe           mov word ptr [bp - 2], ax                
  0f28  b8042c           mov ax, 0x2c04                           
  0f2b  8ec0             mov es, ax                               
  0f2d  268b367b15       mov si, word ptr es:[0x157b]             
  0f32  8ec0             mov es, ax                               
  0f34  26833e7b1500     cmp word ptr es:[0x157b], 0              
  0f3a  7424             je 0xf60                                 
  0f3c  8ec0             mov es, ax                               
  0f3e  26a17b15         mov ax, word ptr es:[0x157b]             
  0f42  99               cdq                                      
  0f43  2bc2             sub ax, dx                               
  0f45  d1f8             sar ax, 1                                
  0f47  ba042c           mov dx, 0x2c04                           
  0f4a  8ec2             mov es, dx                               
  0f4c  50               push ax                                  
  0f4d  26a17b15         mov ax, word ptr es:[0x157b]             
  0f51  48               dec ax                                   
  0f52  99               cdq                                      
  0f53  2bc2             sub ax, dx                               
  0f55  d1f8             sar ax, 1                                
  0f57  5a               pop dx                                   
  0f58  3bd0             cmp dx, ax                               
  0f5a  7504             jne 0xf60                                
  0f5c  46               inc si                                   
  0f5d  ff46fe           inc word ptr [bp - 2]                    
  0f60  6a02             push 2                                   
  0f62  16               push ss                                  
  0f63  8d46fe           lea ax, [bp - 2]                         
  0f66  50               push ax                                  
  0f67  57               push di                                  
  0f68  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0f6d  83c408           add sp, 8                                
  0f70  6a10             push 0x10                                
  0f72  16               push ss                                  
  0f73  8d867eff         lea ax, [bp - 0x82]                      
  0f77  50               push ax                                  
  0f78  57               push di                                  
  0f79  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0f7e  83c408           add sp, 8                                
  0f81  6a10             push 0x10                                
  0f83  16               push ss                                  
  0f84  8d866eff         lea ax, [bp - 0x92]                      
  0f88  50               push ax                                  
  0f89  57               push di                                  
  0f8a  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0f8f  83c408           add sp, 8                                
  0f92  6a10             push 0x10                                
  0f94  1e               push ds                                  
  0f95  68ea5d           push 0x5dea                              
  0f98  57               push di                                  
  0f99  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0f9e  83c408           add sp, 8                                
  0fa1  56               push si                                  
  0fa2  16               push ss                                  
  0fa3  8d468e           lea ax, [bp - 0x72]                      
  0fa6  50               push ax                                  
  0fa7  57               push di                                  
  0fa8  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0fad  83c408           add sp, 8                                
  0fb0  6a02             push 2                                   
  0fb2  16               push ss                                  
  0fb3  8d46f2           lea ax, [bp - 0xe]                       
  0fb6  50               push ax                                  
  0fb7  57               push di                                  
  0fb8  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0fbd  83c408           add sp, 8                                
  0fc0  ff76f4           push word ptr [bp - 0xc]                 
  0fc3  16               push ss                                  
  0fc4  8d8692fe         lea ax, [bp - 0x16e]                     
  0fc8  50               push ax                                  
  0fc9  57               push di                                  
  0fca  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0fcf  83c408           add sp, 8                                
  0fd2  660fbf46fe       movsx eax, word ptr [bp - 2]             
  0fd7  660146fa         add dword ptr [bp - 6], eax              
  0fdb  6a00             push 0                                   
  0fdd  666a00           push 0                                   
  0fe0  57               push di                                  
  0fe1  9a8c000b07       lcall 0x70b, 0x8c                        -> 070b:008c
  0fe6  83c408           add sp, 8                                
  0fe9  6a04             push 4                                   
  0feb  16               push ss                                  
  0fec  8d46fa           lea ax, [bp - 6]                         
  0fef  50               push ax                                  
  0ff0  57               push di                                  
  0ff1  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0ff6  83c408           add sp, 8                                
  0ff9  57               push di                                  
  0ffa  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0fff  59               pop cx                                   
  1000  90               nop                                      
  1001  0e               push cs                                  
  1002  e82002           call 0x1225                              
  1005  5f               pop di                                   
  1006  5e               pop si                                   
  1007  c9               leave                                    
  1008  cb               retf                                     

ovl41_1009:  ; ENTRY
  1009  55               push bp                                  
  100a  8bec             mov bp, sp                               
  100c  83ec04           sub sp, 4                                
  100f  56               push si                                  
  1010  666800000200     push 0x20000                             
  1016  6a06             push 6                                   
  1018  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  101d  83c404           add sp, 4                                
  1020  52               push dx                                  
  1021  50               push ax                                  
  1022  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  1027  83c406           add sp, 6                                
  102a  8bf0             mov si, ax                               
  102c  0bf6             or si, si                                
  102e  7d03             jge 0x1033                               
  1030  e98900           jmp 0x10bc                               
  1033  6a00             push 0                                   
  1035  666a00           push 0                                   
  1038  56               push si                                  
  1039  9a8c000b07       lcall 0x70b, 0x8c                        -> 070b:008c
  103e  83c408           add sp, 8                                
  1041  6a04             push 4                                   
  1043  16               push ss                                  
  1044  8d46fc           lea ax, [bp - 4]                         
  1047  50               push ax                                  
  1048  56               push si                                  
  1049  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  104e  83c408           add sp, 8                                
  1051  66836efc04       sub dword ptr [bp - 4], 4                
  1056  6668d2040000     push 0x4d2                               
  105c  6a00             push 0                                   
  105e  66ff76fc         push dword ptr [bp - 4]                  
  1062  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  1067  83c40a           add sp, 0xa                              
  106a  89163a44         mov word ptr [0x443a], dx                
  106e  a33844           mov word ptr [0x4438], ax                
  1071  52               push dx                                  
  1072  50               push ax                                  
  1073  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1078  83c404           add sp, 4                                
  107b  89163644         mov word ptr [0x4436], dx                
  107f  a33444           mov word ptr [0x4434], ax                
  1082  6a00             push 0                                   
  1084  666a04           push 4                                   
  1087  56               push si                                  
  1088  9a8c000b07       lcall 0x70b, 0x8c                        -> 070b:008c
  108d  83c408           add sp, 8                                
  1090  ff76fc           push word ptr [bp - 4]                   
  1093  66ff363444       push dword ptr [0x4434]                  
  1098  56               push si                                  
  1099  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  109e  83c408           add sp, 8                                
  10a1  56               push si                                  
  10a2  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  10a7  59               pop cx                                   
  10a8  a1cc0d           mov ax, word ptr [0xdcc]                 
  10ab  050a00           add ax, 0xa                              
  10ae  50               push ax                                  
  10af  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  10b4  59               pop cx                                   
  10b5  89163244         mov word ptr [0x4432], dx                
  10b9  a33044           mov word ptr [0x4430], ax                
  10bc  5e               pop si                                   
  10bd  c9               leave                                    
  10be  cb               retf                                     

ovl41_10bf:  ; ENTRY
  10bf  55               push bp                                  
  10c0  8bec             mov bp, sp                               
  10c2  66ff363844       push dword ptr [0x4438]                  
  10c7  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  10cc  83c404           add sp, 4                                
  10cf  66ff363844       push dword ptr [0x4438]                  
  10d4  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  10d9  83c404           add sp, 4                                
  10dc  66ff363044       push dword ptr [0x4430]                  
  10e1  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  10e6  83c404           add sp, 4                                
  10e9  5d               pop bp                                   
  10ea  cb               retf                                     

ovl41_10eb:  ; ENTRY
  10eb  55               push bp                                  
  10ec  8bec             mov bp, sp                               
  10ee  83ec08           sub sp, 8                                
  10f1  66a13444         mov eax, dword ptr [0x4434]              
  10f5  668946f8         mov dword ptr [bp - 8], eax              
  10f9  b90100           mov cx, 1                                
  10fc  eb17             jmp 0x1115                               
  10fe  c45ef8           les bx, ptr [bp - 8]                     
  1101  268b07           mov ax, word ptr es:[bx]                 
  1104  8946fe           mov word ptr [bp - 2], ax                
  1107  99               cdq                                      
  1108  2bc2             sub ax, dx                               
  110a  d1f8             sar ax, 1                                
  110c  8946fc           mov word ptr [bp - 4], ax                
  110f  d1e0             shl ax, 1                                
  1111  0146f8           add word ptr [bp - 8], ax                
  1114  41               inc cx                                   
  1115  3b4e06           cmp cx, word ptr [bp + 6]                
  1118  7ce4             jl 0x10fe                                
  111a  8346f822         add word ptr [bp - 8], 0x22              
  111e  8b56fa           mov dx, word ptr [bp - 6]                
  1121  8b46f8           mov ax, word ptr [bp - 8]                
  1124  c9               leave                                    
  1125  cb               retf                                     

ovl41_1126:  ; ENTRY
  1126  55               push bp                                  
  1127  8bec             mov bp, sp                               
  1129  83ec08           sub sp, 8                                
  112c  66a13444         mov eax, dword ptr [0x4434]              
  1130  668946f8         mov dword ptr [bp - 8], eax              
  1134  b90100           mov cx, 1                                
  1137  eb17             jmp 0x1150                               
  1139  c45ef8           les bx, ptr [bp - 8]                     
  113c  268b07           mov ax, word ptr es:[bx]                 
  113f  8946fe           mov word ptr [bp - 2], ax                
  1142  99               cdq                                      
  1143  2bc2             sub ax, dx                               
  1145  d1f8             sar ax, 1                                
  1147  8946fc           mov word ptr [bp - 4], ax                
  114a  d1e0             shl ax, 1                                
  114c  0146f8           add word ptr [bp - 8], ax                
  114f  41               inc cx                                   
  1150  3b4e06           cmp cx, word ptr [bp + 6]                
  1153  7ce4             jl 0x1139                                
  1155  8346f832         add word ptr [bp - 8], 0x32              
  1159  8b56fa           mov dx, word ptr [bp - 6]                
  115c  8b46f8           mov ax, word ptr [bp - 8]                
  115f  c9               leave                                    
  1160  cb               retf                                     

ovl41_1161:  ; ENTRY
  1161  55               push bp                                  
  1162  8bec             mov bp, sp                               
  1164  83ec08           sub sp, 8                                
  1167  66a13444         mov eax, dword ptr [0x4434]              
  116b  668946f8         mov dword ptr [bp - 8], eax              
  116f  b90100           mov cx, 1                                
  1172  eb17             jmp 0x118b                               
  1174  c45ef8           les bx, ptr [bp - 8]                     
  1177  268b07           mov ax, word ptr es:[bx]                 
  117a  8946fe           mov word ptr [bp - 2], ax                
  117d  99               cdq                                      
  117e  2bc2             sub ax, dx                               
  1180  d1f8             sar ax, 1                                
  1182  8946fc           mov word ptr [bp - 4], ax                
  1185  d1e0             shl ax, 1                                
  1187  0146f8           add word ptr [bp - 8], ax                
  118a  41               inc cx                                   
  118b  3b4e06           cmp cx, word ptr [bp + 6]                
  118e  7ce4             jl 0x1174                                
  1190  8346f812         add word ptr [bp - 8], 0x12              
  1194  8b56fa           mov dx, word ptr [bp - 6]                
  1197  8b46f8           mov ax, word ptr [bp - 8]                
  119a  c9               leave                                    
  119b  cb               retf                                     

ovl41_119c:  ; ENTRY
  119c  55               push bp                                  
  119d  8bec             mov bp, sp                               
  119f  83ec08           sub sp, 8                                
  11a2  66a13444         mov eax, dword ptr [0x4434]              
  11a6  668946f8         mov dword ptr [bp - 8], eax              
  11aa  b90100           mov cx, 1                                
  11ad  eb17             jmp 0x11c6                               
  11af  c45ef8           les bx, ptr [bp - 8]                     
  11b2  268b07           mov ax, word ptr es:[bx]                 
  11b5  8946fe           mov word ptr [bp - 2], ax                
  11b8  99               cdq                                      
  11b9  2bc2             sub ax, dx                               
  11bb  d1f8             sar ax, 1                                
  11bd  8946fc           mov word ptr [bp - 4], ax                
  11c0  d1e0             shl ax, 1                                
  11c2  0146f8           add word ptr [bp - 8], ax                
  11c5  41               inc cx                                   
  11c6  3b4e06           cmp cx, word ptr [bp + 6]                
  11c9  7ce4             jl 0x11af                                
  11cb  8346f802         add word ptr [bp - 8], 2                 
  11cf  8b56fa           mov dx, word ptr [bp - 6]                
  11d2  8b46f8           mov ax, word ptr [bp - 8]                
  11d5  c9               leave                                    
  11d6  cb               retf                                     

ovl41_11d7:  ; ENTRY
  11d7  55               push bp                                  
  11d8  8bec             mov bp, sp                               
  11da  83ec08           sub sp, 8                                
  11dd  66a13444         mov eax, dword ptr [0x4434]              
  11e1  668946f8         mov dword ptr [bp - 8], eax              
  11e5  b90100           mov cx, 1                                
  11e8  eb17             jmp 0x1201                               
  11ea  c45ef8           les bx, ptr [bp - 8]                     
  11ed  268b07           mov ax, word ptr es:[bx]                 
  11f0  8946fe           mov word ptr [bp - 2], ax                
  11f3  99               cdq                                      
  11f4  2bc2             sub ax, dx                               
  11f6  d1f8             sar ax, 1                                
  11f8  8946fc           mov word ptr [bp - 4], ax                
  11fb  d1e0             shl ax, 1                                
  11fd  0146f8           add word ptr [bp - 8], ax                
  1200  41               inc cx                                   
  1201  3b4e06           cmp cx, word ptr [bp + 6]                
  1204  7ce4             jl 0x11ea                                
  1206  b8042c           mov ax, 0x2c04                           
  1209  8ec0             mov es, ax                               
  120b  26a17b15         mov ax, word ptr es:[0x157b]             
  120f  40               inc ax                                   
  1210  99               cdq                                      
  1211  2bc2             sub ax, dx                               
  1213  d1f8             sar ax, 1                                
  1215  051900           add ax, 0x19                             
  1218  d1e0             shl ax, 1                                
  121a  0146f8           add word ptr [bp - 8], ax                
  121d  8b56fa           mov dx, word ptr [bp - 6]                
  1220  8b46f8           mov ax, word ptr [bp - 8]                
  1223  c9               leave                                    
  1224  cb               retf                                     

ovl41_1225:  ; ENTRY
  1225  55               push bp                                  
  1226  8bec             mov bp, sp                               
  1228  33d2             xor dx, dx                               
  122a  eb11             jmp 0x123d                               
  122c  8bda             mov bx, dx                               
  122e  6bdb2b           imul bx, bx, 0x2b                        
  1231  b8042c           mov ax, 0x2c04                           
  1234  8ec0             mov es, ax                               
  1236  26c687e31300     mov byte ptr es:[bx + 0x13e3], 0         
  123c  42               inc dx                                   
  123d  83fa08           cmp dx, 8                                
  1240  7cea             jl 0x122c                                
  1242  5d               pop bp                                   
  1243  cb               retf                                     

ovl41_1244:  ; ENTRY
  1244  55               push bp                                  
  1245  8bec             mov bp, sp                               
  1247  56               push si                                  
  1248  8b4e06           mov cx, word ptr [bp + 6]                
  124b  8bd9             mov bx, cx                               
  124d  6bdb2b           imul bx, bx, 0x2b                        
  1250  b8042c           mov ax, 0x2c04                           
  1253  8ec0             mov es, ax                               
  1255  2680bfe31302     cmp byte ptr es:[bx + 0x13e3], 2         
  125b  7d31             jge 0x128e                               
  125d  8bd9             mov bx, cx                               
  125f  6bdb2b           imul bx, bx, 0x2b                        
  1262  8ec0             mov es, ax                               
  1264  268a87e313       mov al, byte ptr es:[bx + 0x13e3]        
  1269  98               cwde                                     
  126a  8bf0             mov si, ax                               
  126c  8bd9             mov bx, cx                               
  126e  6bdb2b           imul bx, bx, 0x2b                        
  1271  b8042c           mov ax, 0x2c04                           
  1274  8ec0             mov es, ax                               
  1276  268a87e313       mov al, byte ptr es:[bx + 0x13e3]        
  127b  fec0             inc al                                   
  127d  8bd9             mov bx, cx                               
  127f  6bdb2b           imul bx, bx, 0x2b                        
  1282  ba042c           mov dx, 0x2c04                           
  1285  8ec2             mov es, dx                               
  1287  268887e313       mov byte ptr es:[bx + 0x13e3], al        
  128c  eb3b             jmp 0x12c9                               
  128e  33f6             xor si, si                               
  1290  8bd9             mov bx, cx                               
  1292  6bdb2b           imul bx, bx, 0x2b                        
  1295  b8042c           mov ax, 0x2c04                           
  1298  8ec0             mov es, ax                               
  129a  268a87e513       mov al, byte ptr es:[bx + 0x13e5]        
  129f  8bd9             mov bx, cx                               
  12a1  6bdb2b           imul bx, bx, 0x2b                        
  12a4  ba042c           mov dx, 0x2c04                           
  12a7  8ec2             mov es, dx                               
  12a9  263a87e413       cmp al, byte ptr es:[bx + 0x13e4]        
  12ae  7c03             jl 0x12b3                                
  12b0  be0100           mov si, 1                                
  12b3  8bd9             mov bx, cx                               
  12b5  6bdb2b           imul bx, bx, 0x2b                        
  12b8  03de             add bx, si                               
  12ba  b8042c           mov ax, 0x2c04                           
  12bd  8ec0             mov es, ax                               
  12bf  268a87e413       mov al, byte ptr es:[bx + 0x13e4]        
  12c4  3a4608           cmp al, byte ptr [bp + 8]                
  12c7  7e63             jle 0x132c                               
  12c9  8bd9             mov bx, cx                               
  12cb  6bdb2b           imul bx, bx, 0x2b                        
  12ce  03de             add bx, si                               
  12d0  b8042c           mov ax, 0x2c04                           
  12d3  8a5608           mov dl, byte ptr [bp + 8]                
  12d6  8ec0             mov es, ax                               
  12d8  268897e413       mov byte ptr es:[bx + 0x13e4], dl        
  12dd  8bd9             mov bx, cx                               
  12df  6bdb2b           imul bx, bx, 0x2b                        
  12e2  8bc6             mov ax, si                               
  12e4  d1e0             shl ax, 1                                
  12e6  03d8             add bx, ax                               
  12e8  b8042c           mov ax, 0x2c04                           
  12eb  8b560a           mov dx, word ptr [bp + 0xa]              
  12ee  8ec0             mov es, ax                               
  12f0  268997e613       mov word ptr es:[bx + 0x13e6], dx        
  12f5  8bd9             mov bx, cx                               
  12f7  6bdb2b           imul bx, bx, 0x2b                        
  12fa  8bc6             mov ax, si                               
  12fc  d1e0             shl ax, 1                                
  12fe  03d8             add bx, ax                               
  1300  b8042c           mov ax, 0x2c04                           
  1303  8b560c           mov dx, word ptr [bp + 0xc]              
  1306  8ec0             mov es, ax                               
  1308  268997ea13       mov word ptr es:[bx + 0x13ea], dx        
  130d  66ff760e         push dword ptr [bp + 0xe]                
  1311  8bc1             mov ax, cx                               
  1313  6bc02b           imul ax, ax, 0x2b                        
  1316  8bd6             mov dx, si                               
  1318  c1e204           shl dx, 4                                
  131b  03c2             add ax, dx                               
  131d  05ee13           add ax, 0x13ee                           
  1320  68042c           push 0x2c04                              
  1323  50               push ax                                  
  1324  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1329  83c408           add sp, 8                                
  132c  5e               pop si                                   
  132d  5d               pop bp                                   
  132e  cb               retf                                     

ovl41_132f:  ; ENTRY
  132f  55               push bp                                  
  1330  8bec             mov bp, sp                               
  1332  83ec24           sub sp, 0x24                             
  1335  56               push si                                  
  1336  57               push di                                  
  1337  33ff             xor di, di                               
  1339  c746fe0000       mov word ptr [bp - 2], 0                 
  133e  eb21             jmp 0x1361                               
  1340  8b5efe           mov bx, word ptr [bp - 2]                
  1343  c1e302           shl bx, 2                                
  1346  8d46de           lea ax, [bp - 0x22]                      
  1349  03d8             add bx, ax                               
  134b  33c0             xor ax, ax                               
  134d  368907           mov word ptr ss:[bx], ax                 
  1350  8b5efe           mov bx, word ptr [bp - 2]                
  1353  c1e302           shl bx, 2                                
  1356  8d56dc           lea dx, [bp - 0x24]                      
  1359  03da             add bx, dx                               
  135b  368907           mov word ptr ss:[bx], ax                 
  135e  ff46fe           inc word ptr [bp - 2]                    
  1361  837efe08         cmp word ptr [bp - 2], 8                 
  1365  7cd9             jl 0x1340                                
  1367  c746fe0000       mov word ptr [bp - 2], 0                 
  136c  eb27             jmp 0x1395                               
  136e  8b5efe           mov bx, word ptr [bp - 2]                
  1371  6bdb2b           imul bx, bx, 0x2b                        
  1374  b8042c           mov ax, 0x2c04                           
  1377  8ec0             mov es, ax                               
  1379  2680bfe31301     cmp byte ptr es:[bx + 0x13e3], 1         
  137f  7c11             jl 0x1392                                
  1381  47               inc di                                   
  1382  8b5efe           mov bx, word ptr [bp - 2]                
  1385  c1e302           shl bx, 2                                
  1388  8d46dc           lea ax, [bp - 0x24]                      
  138b  03d8             add bx, ax                               
  138d  36c7070100       mov word ptr ss:[bx], 1                  
  1392  ff46fe           inc word ptr [bp - 2]                    
  1395  837efe08         cmp word ptr [bp - 2], 8                 
  1399  7cd3             jl 0x136e                                
  139b  c746fe0000       mov word ptr [bp - 2], 0                 
  13a0  eb2c             jmp 0x13ce                               
  13a2  8b5efe           mov bx, word ptr [bp - 2]                
  13a5  6bdb2b           imul bx, bx, 0x2b                        
  13a8  b8042c           mov ax, 0x2c04                           
  13ab  8ec0             mov es, ax                               
  13ad  2680bfe31302     cmp byte ptr es:[bx + 0x13e3], 2         
  13b3  7c16             jl 0x13cb                                
  13b5  83ff0a           cmp di, 0xa                              
  13b8  7d11             jge 0x13cb                               
  13ba  47               inc di                                   
  13bb  8b5efe           mov bx, word ptr [bp - 2]                
  13be  c1e302           shl bx, 2                                
  13c1  8d46de           lea ax, [bp - 0x22]                      
  13c4  03d8             add bx, ax                               
  13c6  36c7070100       mov word ptr ss:[bx], 1                  
  13cb  ff46fe           inc word ptr [bp - 2]                    
  13ce  837efe08         cmp word ptr [bp - 2], 8                 
  13d2  7cce             jl 0x13a2                                
  13d4  c746fe0000       mov word ptr [bp - 2], 0                 
  13d9  eb36             jmp 0x1411                               
  13db  8b5efe           mov bx, word ptr [bp - 2]                
  13de  c1e302           shl bx, 2                                
  13e1  8d46dc           lea ax, [bp - 0x24]                      
  13e4  03d8             add bx, ax                               
  13e6  36833f00         cmp word ptr ss:[bx], 0                  
  13ea  7422             je 0x140e                                
  13ec  8b5efe           mov bx, word ptr [bp - 2]                
  13ef  c1e302           shl bx, 2                                
  13f2  8d46de           lea ax, [bp - 0x22]                      
  13f5  03d8             add bx, ax                               
  13f7  36833f00         cmp word ptr ss:[bx], 0                  
  13fb  7511             jne 0x140e                               
  13fd  8b5efe           mov bx, word ptr [bp - 2]                
  1400  6bdb2b           imul bx, bx, 0x2b                        
  1403  b8042c           mov ax, 0x2c04                           
  1406  8ec0             mov es, ax                               
  1408  26c687e31301     mov byte ptr es:[bx + 0x13e3], 1         
  140e  ff46fe           inc word ptr [bp - 2]                    
  1411  837efe08         cmp word ptr [bp - 2], 8                 
  1415  7cc4             jl 0x13db                                
  1417  c746fe0000       mov word ptr [bp - 2], 0                 
  141c  c746fc0000       mov word ptr [bp - 4], 0                 
  1421  e9d800           jmp 0x14fc                               
  1424  33f6             xor si, si                               
  1426  e9c800           jmp 0x14f1                               
  1429  8b5efe           mov bx, word ptr [bp - 2]                
  142c  c1e302           shl bx, 2                                
  142f  8bc6             mov ax, si                               
  1431  d1e0             shl ax, 1                                
  1433  03d8             add bx, ax                               
  1435  8d46dc           lea ax, [bp - 0x24]                      
  1438  03d8             add bx, ax                               
  143a  36833f00         cmp word ptr ss:[bx], 0                  
  143e  7503             jne 0x1443                               
  1440  e9ad00           jmp 0x14f0                               
  1443  8b46fc           mov ax, word ptr [bp - 4]                
  1446  6bc016           imul ax, ax, 0x16                        
  1449  c45e06           les bx, ptr [bp + 6]                     
  144c  03d8             add bx, ax                               
  144e  8a46fe           mov al, byte ptr [bp - 2]                
  1451  268807           mov byte ptr es:[bx], al                 
  1454  8b5efe           mov bx, word ptr [bp - 2]                
  1457  6bdb2b           imul bx, bx, 0x2b                        
  145a  03de             add bx, si                               
  145c  b8042c           mov ax, 0x2c04                           
  145f  8ec0             mov es, ax                               
  1461  268a87e413       mov al, byte ptr es:[bx + 0x13e4]        
  1466  8b56fc           mov dx, word ptr [bp - 4]                
  1469  6bd216           imul dx, dx, 0x16                        
  146c  c45e06           les bx, ptr [bp + 6]                     
  146f  03da             add bx, dx                               
  1471  26884701         mov byte ptr es:[bx + 1], al             
  1475  8b5efe           mov bx, word ptr [bp - 2]                
  1478  6bdb2b           imul bx, bx, 0x2b                        
  147b  8bc6             mov ax, si                               
  147d  d1e0             shl ax, 1                                
  147f  03d8             add bx, ax                               
  1481  b8042c           mov ax, 0x2c04                           
  1484  8ec0             mov es, ax                               
  1486  268b87e613       mov ax, word ptr es:[bx + 0x13e6]        
  148b  8b56fc           mov dx, word ptr [bp - 4]                
  148e  6bd216           imul dx, dx, 0x16                        
  1491  c45e06           les bx, ptr [bp + 6]                     
  1494  03da             add bx, dx                               
  1496  26894702         mov word ptr es:[bx + 2], ax             
  149a  8b5efe           mov bx, word ptr [bp - 2]                
  149d  6bdb2b           imul bx, bx, 0x2b                        
  14a0  8bc6             mov ax, si                               
  14a2  d1e0             shl ax, 1                                
  14a4  03d8             add bx, ax                               
  14a6  b8042c           mov ax, 0x2c04                           
  14a9  8ec0             mov es, ax                               
  14ab  268b87ea13       mov ax, word ptr es:[bx + 0x13ea]        
  14b0  8b56fc           mov dx, word ptr [bp - 4]                
  14b3  6bd216           imul dx, dx, 0x16                        
  14b6  c45e06           les bx, ptr [bp + 6]                     
  14b9  03da             add bx, dx                               
  14bb  26894704         mov word ptr es:[bx + 4], ax             
  14bf  8b46fe           mov ax, word ptr [bp - 2]                
  14c2  6bc02b           imul ax, ax, 0x2b                        
  14c5  8bd6             mov dx, si                               
  14c7  c1e204           shl dx, 4                                
  14ca  03c2             add ax, dx                               
  14cc  05ee13           add ax, 0x13ee                           
  14cf  68042c           push 0x2c04                              
  14d2  50               push ax                                  
  14d3  8b46fc           mov ax, word ptr [bp - 4]                
  14d6  6bc016           imul ax, ax, 0x16                        
  14d9  8b5606           mov dx, word ptr [bp + 6]                
  14dc  03d0             add dx, ax                               
  14de  83c206           add dx, 6                                
  14e1  ff7608           push word ptr [bp + 8]                   
  14e4  52               push dx                                  
  14e5  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14ea  83c408           add sp, 8                                
  14ed  ff46fc           inc word ptr [bp - 4]                    
  14f0  46               inc si                                   
  14f1  83fe02           cmp si, 2                                
  14f4  7d03             jge 0x14f9                               
  14f6  e930ff           jmp 0x1429                               
  14f9  ff46fe           inc word ptr [bp - 2]                    
  14fc  837efe08         cmp word ptr [bp - 2], 8                 
  1500  7d03             jge 0x1505                               
  1502  e91fff           jmp 0x1424                               
  1505  8bc7             mov ax, di                               
  1507  6bc016           imul ax, ax, 0x16                        
  150a  c45e0a           les bx, ptr [bp + 0xa]                   
  150d  268907           mov word ptr es:[bx], ax                 
  1510  8bc7             mov ax, di                               
  1512  5f               pop di                                   
  1513  5e               pop si                                   
  1514  c9               leave                                    
  1515  cb               retf                                     

ovl41_1516:  ; ENTRY
  1516  55               push bp                                  
  1517  8bec             mov bp, sp                               
  1519  8b5608           mov dx, word ptr [bp + 8]                
  151c  8b4e0a           mov cx, word ptr [bp + 0xa]              
  151f  8a4606           mov al, byte ptr [bp + 6]                
  1522  98               cwde                                     
  1523  8bd8             mov bx, ax                               
  1525  83fb0a           cmp bx, 0xa                              
  1528  7603             jbe 0x152d                               
  152a  e97001           jmp 0x169d                               
  152d  d1e3             shl bx, 1                                
  152f  2effa7a416       jmp word ptr cs:[bx + 0x16a4]            
ovl41_1534:  ; case
  1534  8bc2             mov ax, dx                               
  1536  6bc041           imul ax, ax, 0x41                        
  1539  058115           add ax, 0x1581                           
  153c  68042c           push 0x2c04                              
  153f  50               push ax                                  
  1540  66ff760c         push dword ptr [bp + 0xc]                
  1544  6a00             push 0                                   
  1546  e93c01           jmp 0x1685                               
ovl41_1549:  ; case
  1549  83faff           cmp dx, -1                               
  154c  7521             jne 0x156f                               
  154e  66ff760c         push dword ptr [bp + 0xc]                
  1552  6a01             push 1                                   
  1554  6a5e             push 0x5e                                
  1556  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  155b  83c404           add sp, 4                                
  155e  52               push dx                                  
  155f  50               push ax                                  
  1560  1e               push ds                                  
  1561  68385c           push 0x5c38                              
  1564  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1569  83c40c           add sp, 0xc                              
  156c  e92e01           jmp 0x169d                               
  156f  83fafe           cmp dx, -2                               
  1572  7508             jne 0x157c                               
  1574  66ff760c         push dword ptr [bp + 0xc]                
  1578  6a02             push 2                                   
  157a  ebd8             jmp 0x1554                               
  157c  8bc2             mov ax, dx                               
  157e  6bc041           imul ax, ax, 0x41                        
  1581  058115           add ax, 0x1581                           
  1584  68042c           push 0x2c04                              
  1587  50               push ax                                  
  1588  66ff760c         push dword ptr [bp + 0xc]                
  158c  6a03             push 3                                   
  158e  e9f400           jmp 0x1685                               
ovl41_1591:  ; case
  1591  66ff760c         push dword ptr [bp + 0xc]                
  1595  6a04             push 4                                   
  1597  ebbb             jmp 0x1554                               
ovl41_1599:  ; case
  1599  66ff760c         push dword ptr [bp + 0xc]                
  159d  6a05             push 5                                   
  159f  ebb3             jmp 0x1554                               
ovl41_15a1:  ; case
  15a1  8bc2             mov ax, dx                               
  15a3  6bc014           imul ax, ax, 0x14                        
  15a6  050000           add ax, 0                                
  15a9  68042c           push 0x2c04                              
  15ac  50               push ax                                  
  15ad  6a06             push 6                                   
  15af  eba3             jmp 0x1554                               
ovl41_15b1:  ; case
  15b1  83faff           cmp dx, -1                               
  15b4  7515             jne 0x15cb                               
  15b6  8bc1             mov ax, cx                               
  15b8  6bc041           imul ax, ax, 0x41                        
  15bb  058115           add ax, 0x1581                           
  15be  68042c           push 0x2c04                              
  15c1  50               push ax                                  
  15c2  66ff760c         push dword ptr [bp + 0xc]                
  15c6  6a07             push 7                                   
  15c8  e9ba00           jmp 0x1685                               
  15cb  8bc1             mov ax, cx                               
  15cd  6bc041           imul ax, ax, 0x41                        
  15d0  058115           add ax, 0x1581                           
  15d3  68042c           push 0x2c04                              
  15d6  50               push ax                                  
  15d7  8bc2             mov ax, dx                               
  15d9  6bc014           imul ax, ax, 0x14                        
  15dc  050000           add ax, 0                                
  15df  68042c           push 0x2c04                              
  15e2  50               push ax                                  
  15e3  6a08             push 8                                   
  15e5  e99d00           jmp 0x1685                               
ovl41_15e8:  ; case
  15e8  83fa64           cmp dx, 0x64                             
  15eb  750f             jne 0x15fc                               
  15ed  6a0d             push 0xd                                 
  15ef  6a5e             push 0x5e                                
  15f1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  15f6  83c404           add sp, 4                                
  15f9  52               push dx                                  
  15fa  eb1d             jmp 0x1619                               
  15fc  83fa65           cmp dx, 0x65                             
  15ff  7504             jne 0x1605                               
  1601  6a0e             push 0xe                                 
  1603  ebea             jmp 0x15ef                               
  1605  83fa66           cmp dx, 0x66                             
  1608  7504             jne 0x160e                               
  160a  6a0f             push 0xf                                 
  160c  ebe1             jmp 0x15ef                               
  160e  8bc2             mov ax, dx                               
  1610  6bc01d           imul ax, ax, 0x1d                        
  1613  05e90c           add ax, 0xce9                            
  1616  68042c           push 0x2c04                              
  1619  50               push ax                                  
  161a  66ff760c         push dword ptr [bp + 0xc]                
  161e  6a09             push 9                                   
  1620  eb63             jmp 0x1685                               
ovl41_1622:  ; case
  1622  8bc2             mov ax, dx                               
  1624  6bc014           imul ax, ax, 0x14                        
  1627  050000           add ax, 0                                
  162a  68042c           push 0x2c04                              
  162d  50               push ax                                  
  162e  6a0a             push 0xa                                 
  1630  e921ff           jmp 0x1554                               
ovl41_1633:  ; case
  1633  8bc1             mov ax, cx                               
  1635  6bc014           imul ax, ax, 0x14                        
  1638  050000           add ax, 0                                
  163b  68042c           push 0x2c04                              
  163e  50               push ax                                  
  163f  8bc2             mov ax, dx                               
  1641  6bc014           imul ax, ax, 0x14                        
  1644  050000           add ax, 0                                
  1647  68042c           push 0x2c04                              
  164a  50               push ax                                  
  164b  6a0b             push 0xb                                 
  164d  eb36             jmp 0x1685                               
ovl41_164f:  ; case
  164f  8bc1             mov ax, cx                               
  1651  6bc014           imul ax, ax, 0x14                        
  1654  050000           add ax, 0                                
  1657  68042c           push 0x2c04                              
  165a  50               push ax                                  
  165b  8bc2             mov ax, dx                               
  165d  6bc014           imul ax, ax, 0x14                        
  1660  050000           add ax, 0                                
  1663  68042c           push 0x2c04                              
  1666  50               push ax                                  
  1667  6a0c             push 0xc                                 
  1669  eb1a             jmp 0x1685                               
ovl41_166b:  ; case
  166b  8bc1             mov ax, cx                               
  166d  6bc014           imul ax, ax, 0x14                        
  1670  050000           add ax, 0                                
  1673  68042c           push 0x2c04                              
  1676  50               push ax                                  
  1677  8bc2             mov ax, dx                               
  1679  6bc014           imul ax, ax, 0x14                        
  167c  050000           add ax, 0                                
  167f  68042c           push 0x2c04                              
  1682  50               push ax                                  
  1683  6a10             push 0x10                                
  1685  6a5e             push 0x5e                                
  1687  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  168c  83c404           add sp, 4                                
  168f  52               push dx                                  
  1690  50               push ax                                  
  1691  1e               push ds                                  
  1692  68385c           push 0x5c38                              
  1695  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  169a  83c410           add sp, 0x10                             
  169d  8cda             mov dx, ds                               
  169f  b8385c           mov ax, 0x5c38                           
  16a2  5d               pop bp                                   
  16a3  cb               retf                                     
  16a4  3415491591159915 dw 1534,1549,1591,1599,15a1,15b1,15e8,1622,166b,1633,164f jump table

ovl41_16ba:  ; ENTRY
  16ba  55               push bp                                  
  16bb  8bec             mov bp, sp                               
  16bd  83ec2a           sub sp, 0x2a                             
  16c0  56               push si                                  
  16c1  57               push di                                  
  16c2  bf1801           mov di, 0x118                            
  16c5  c746fe9500       mov word ptr [bp - 2], 0x95              
  16ca  c746fc0801       mov word ptr [bp - 4], 0x108             
  16cf  c746fa9600       mov word ptr [bp - 6], 0x96              
  16d4  66686001af00     push 0xaf0160                            
  16da  666800005400     push 0x540000                            
  16e0  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  16e5  83c408           add sp, 8                                
  16e8  666800000300     push 0x30000                             
  16ee  666802000f00     push 0xf0002                             
  16f4  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  16f9  83c408           add sp, 8                                
  16fc  ff363e44         push word ptr [0x443e]                   
  1700  0e               push cs                                  
  1701  e8d3fa           call 0x11d7                              
  1704  59               pop cx                                   
  1705  8956e4           mov word ptr [bp - 0x1c], dx             
  1708  8946e2           mov word ptr [bp - 0x1e], ax             
  170b  668b46e2         mov eax, dword ptr [bp - 0x1e]           
  170f  668946de         mov dword ptr [bp - 0x22], eax           
  1713  8b46e4           mov ax, word ptr [bp - 0x1c]             
  1716  8b56e2           mov dx, word ptr [bp - 0x1e]             
  1719  83c202           add dx, 2                                
  171c  8946f8           mov word ptr [bp - 8], ax                
  171f  8956f6           mov word ptr [bp - 0xa], dx              
  1722  c45ede           les bx, ptr [bp - 0x22]                  
  1725  268b07           mov ax, word ptr es:[bx]                 
  1728  8946dc           mov word ptr [bp - 0x24], ax             
  172b  33f6             xor si, si                               
  172d  e99e01           jmp 0x18ce                               
  1730  8bc6             mov ax, si                               
  1732  6bc016           imul ax, ax, 0x16                        
  1735  c45ef6           les bx, ptr [bp - 0xa]                   
  1738  03d8             add bx, ax                               
  173a  268a07           mov al, byte ptr es:[bx]                 
  173d  98               cwde                                     
  173e  8bc8             mov cx, ax                               
  1740  666810000e00     push 0xe0010                             
  1746  bb0400           mov bx, 4                                
  1749  99               cdq                                      
  174a  f7fb             idiv bx                                  
  174c  6bd20e           imul dx, dx, 0xe                         
  174f  83c25e           add dx, 0x5e                             
  1752  52               push dx                                  
  1753  8bc1             mov ax, cx                               
  1755  99               cdq                                      
  1756  f7fb             idiv bx                                  
  1758  c1e004           shl ax, 4                                
  175b  057000           add ax, 0x70                             
  175e  50               push ax                                  
  175f  16               push ss                                  
  1760  8d46ee           lea ax, [bp - 0x12]                      
  1763  50               push ax                                  
  1764  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1769  83c40c           add sp, 0xc                              
  176c  8bc6             mov ax, si                               
  176e  6bc011           imul ax, ax, 0x11                        
  1771  8b56fa           mov dx, word ptr [bp - 6]                
  1774  03d0             add dx, ax                               
  1776  52               push dx                                  
  1777  ff76fc           push word ptr [bp - 4]                   
  177a  16               push ss                                  
  177b  8d46ea           lea ax, [bp - 0x16]                      
  177e  50               push ax                                  
  177f  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  1784  83c408           add sp, 8                                
  1787  66ff76ea         push dword ptr [bp - 0x16]               
  178b  8d46ee           lea ax, [bp - 0x12]                      
  178e  8cd2             mov dx, ss                               
  1790  b90800           mov cx, 8                                
  1793  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1798  6a09             push 9                                   
  179a  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  179f  83c40e           add sp, 0xe                              
  17a2  8bc6             mov ax, si                               
  17a4  6bc016           imul ax, ax, 0x16                        
  17a7  8b56f6           mov dx, word ptr [bp - 0xa]              
  17aa  03d0             add dx, ax                               
  17ac  83c206           add dx, 6                                
  17af  ff76f8           push word ptr [bp - 8]                   
  17b2  52               push dx                                  
  17b3  8bc6             mov ax, si                               
  17b5  6bc016           imul ax, ax, 0x16                        
  17b8  c45ef6           les bx, ptr [bp - 0xa]                   
  17bb  03d8             add bx, ax                               
  17bd  26ff7704         push word ptr es:[bx + 4]                
  17c1  8bc6             mov ax, si                               
  17c3  6bc016           imul ax, ax, 0x16                        
  17c6  8b5ef6           mov bx, word ptr [bp - 0xa]              
  17c9  03d8             add bx, ax                               
  17cb  26ff7702         push word ptr es:[bx + 2]                
  17cf  8bc6             mov ax, si                               
  17d1  6bc016           imul ax, ax, 0x16                        
  17d4  8b5ef6           mov bx, word ptr [bp - 0xa]              
  17d7  03d8             add bx, ax                               
  17d9  268a4701         mov al, byte ptr es:[bx + 1]             
  17dd  50               push ax                                  
  17de  0e               push cs                                  
  17df  e834fd           call 0x1516                              
  17e2  83c40a           add sp, 0xa                              
  17e5  8956e8           mov word ptr [bp - 0x18], dx             
  17e8  8946e6           mov word ptr [bp - 0x1a], ax             
  17eb  52               push dx                                  
  17ec  50               push ax                                  
  17ed  8bc6             mov ax, si                               
  17ef  6bc011           imul ax, ax, 0x11                        
  17f2  8b56fe           mov dx, word ptr [bp - 2]                
  17f5  03d0             add dx, ax                               
  17f7  52               push dx                                  
  17f8  57               push di                                  
  17f9  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  17fe  83c408           add sp, 8                                
  1801  8bc6             mov ax, si                               
  1803  6bc016           imul ax, ax, 0x16                        
  1806  c45ef6           les bx, ptr [bp - 0xa]                   
  1809  03d8             add bx, ax                               
  180b  26807f0109       cmp byte ptr es:[bx + 1], 9              
  1810  7425             je 0x1837                                
  1812  8bc6             mov ax, si                               
  1814  6bc016           imul ax, ax, 0x16                        
  1817  8b5ef6           mov bx, word ptr [bp - 0xa]              
  181a  03d8             add bx, ax                               
  181c  26807f010a       cmp byte ptr es:[bx + 1], 0xa            
  1821  7414             je 0x1837                                
  1823  8bc6             mov ax, si                               
  1825  6bc016           imul ax, ax, 0x16                        
  1828  8b5ef6           mov bx, word ptr [bp - 0xa]              
  182b  03d8             add bx, ax                               
  182d  26807f0108       cmp byte ptr es:[bx + 1], 8              
  1832  7403             je 0x1837                                
  1834  e99600           jmp 0x18cd                               
  1837  66ff76e6         push dword ptr [bp - 0x1a]               
  183b  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  1840  83c404           add sp, 4                                
  1843  8946da           mov word ptr [bp - 0x26], ax             
  1846  c1f803           sar ax, 3                                
  1849  c1e003           shl ax, 3                                
  184c  8bd7             mov dx, di                               
  184e  03d0             add dx, ax                               
  1850  83c210           add dx, 0x10                             
  1853  8956d8           mov word ptr [bp - 0x28], dx             
  1856  8bc6             mov ax, si                               
  1858  6bc011           imul ax, ax, 0x11                        
  185b  8b56fa           mov dx, word ptr [bp - 6]                
  185e  03d0             add dx, ax                               
  1860  8956d6           mov word ptr [bp - 0x2a], dx             
  1863  8bc6             mov ax, si                               
  1865  6bc016           imul ax, ax, 0x16                        
  1868  c45ef6           les bx, ptr [bp - 0xa]                   
  186b  03d8             add bx, ax                               
  186d  268b4f04         mov cx, word ptr es:[bx + 4]             
  1871  666810000e00     push 0xe0010                             
  1877  8bc1             mov ax, cx                               
  1879  bb0400           mov bx, 4                                
  187c  99               cdq                                      
  187d  f7fb             idiv bx                                  
  187f  6bd20e           imul dx, dx, 0xe                         
  1882  83c25e           add dx, 0x5e                             
  1885  52               push dx                                  
  1886  8bc1             mov ax, cx                               
  1888  99               cdq                                      
  1889  f7fb             idiv bx                                  
  188b  c1e004           shl ax, 4                                
  188e  057000           add ax, 0x70                             
  1891  50               push ax                                  
  1892  16               push ss                                  
  1893  8d46ee           lea ax, [bp - 0x12]                      
  1896  50               push ax                                  
  1897  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  189c  83c40c           add sp, 0xc                              
  189f  ff76d6           push word ptr [bp - 0x2a]                
  18a2  ff76d8           push word ptr [bp - 0x28]                
  18a5  16               push ss                                  
  18a6  8d46ea           lea ax, [bp - 0x16]                      
  18a9  50               push ax                                  
  18aa  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  18af  83c408           add sp, 8                                
  18b2  66ff76ea         push dword ptr [bp - 0x16]               
  18b6  8d46ee           lea ax, [bp - 0x12]                      
  18b9  8cd2             mov dx, ss                               
  18bb  b90800           mov cx, 8                                
  18be  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  18c3  6a09             push 9                                   
  18c5  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  18ca  83c40e           add sp, 0xe                              
  18cd  46               inc si                                   
  18ce  3b76dc           cmp si, word ptr [bp - 0x24]             
  18d1  7d03             jge 0x18d6                               
  18d3  e95afe           jmp 0x1730                               
  18d6  5f               pop di                                   
  18d7  5e               pop si                                   
  18d8  c9               leave                                    
  18d9  cb               retf                                     

ovl41_18da:  ; ENTRY
  18da  55               push bp                                  
  18db  8bec             mov bp, sp                               
  18dd  83ec08           sub sp, 8                                
  18e0  56               push si                                  
  18e1  837e0600         cmp word ptr [bp + 6], 0                 
  18e5  7467             je 0x194e                                
  18e7  8d46f8           lea ax, [bp - 8]                         
  18ea  16               push ss                                  
  18eb  50               push ax                                  
  18ec  1e               push ds                                  
  18ed  68ce0d           push 0xdce                               
  18f0  b90800           mov cx, 8                                
  18f3  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  18f8  666804000200     push 0x20004                             
  18fe  1e               push ds                                  
  18ff  68ce0d           push 0xdce                               
  1902  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  1907  83c408           add sp, 8                                
  190a  ff46f8           inc word ptr [bp - 8]                    
  190d  ff46fa           inc word ptr [bp - 6]                    
  1910  836efc02         sub word ptr [bp - 4], 2                 
  1914  836efe02         sub word ptr [bp - 2], 2                 
  1918  666804000200     push 0x20004                             
  191e  16               push ss                                  
  191f  8d46f8           lea ax, [bp - 8]                         
  1922  50               push ax                                  
  1923  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  1928  83c408           add sp, 8                                
  192b  ff46f8           inc word ptr [bp - 8]                    
  192e  ff46fa           inc word ptr [bp - 6]                    
  1931  836efc02         sub word ptr [bp - 4], 2                 
  1935  836efe02         sub word ptr [bp - 2], 2                 
  1939  6a00             push 0                                   
  193b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1940  59               pop cx                                   
  1941  16               push ss                                  
  1942  8d46f8           lea ax, [bp - 8]                         
  1945  50               push ax                                  
  1946  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  194b  83c404           add sp, 4                                
  194e  660fbf063e44     movsx eax, word ptr [0x443e]             
  1954  660fbf16da0d     movsx edx, word ptr [0xdda]              
  195a  660fafc2         imul eax, edx                            
  195e  8b163c44         mov dx, word ptr [0x443c]                
  1962  4a               dec dx                                   
  1963  660fbfda         movsx ebx, dx                            
  1967  6699             cdq                                      
  1969  66f7fb           idiv ebx                                 
  196c  8bf0             mov si, ax                               
  196e  3b36da0d         cmp si, word ptr [0xdda]                 
  1972  7e04             jle 0x1978                               
  1974  8b36da0d         mov si, word ptr [0xdda]                 
  1978  ff36dc0d         push word ptr [0xddc]                    
  197c  56               push si                                  
  197d  66ff36d60d       push dword ptr [0xdd6]                   
  1982  16               push ss                                  
  1983  8d46f8           lea ax, [bp - 8]                         
  1986  50               push ax                                  
  1987  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  198c  83c40c           add sp, 0xc                              
  198f  b8042c           mov ax, 0x2c04                           
  1992  8ec0             mov es, ax                               
  1994  268b1e1001       mov bx, word ptr es:[0x110]              
  1999  d1e3             shl bx, 1                                
  199b  b8042c           mov ax, 0x2c04                           
  199e  8ec0             mov es, ax                               
  19a0  26ffb7a000       push word ptr es:[bx + 0xa0]             
  19a5  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  19aa  59               pop cx                                   
  19ab  16               push ss                                  
  19ac  8d46f8           lea ax, [bp - 8]                         
  19af  50               push ax                                  
  19b0  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  19b5  83c404           add sp, 4                                
  19b8  a1da0d           mov ax, word ptr [0xdda]                 
  19bb  05f8ff           add ax, 0xfff8                           
  19be  3bc6             cmp ax, si                               
  19c0  7e4a             jle 0x1a0c                               
  19c2  ff36dc0d         push word ptr [0xddc]                    
  19c6  a1da0d           mov ax, word ptr [0xdda]                 
  19c9  2bc6             sub ax, si                               
  19cb  50               push ax                                  
  19cc  ff36d80d         push word ptr [0xdd8]                    
  19d0  a1d60d           mov ax, word ptr [0xdd6]                 
  19d3  03c6             add ax, si                               
  19d5  50               push ax                                  
  19d6  16               push ss                                  
  19d7  8d46f8           lea ax, [bp - 8]                         
  19da  50               push ax                                  
  19db  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  19e0  83c40c           add sp, 0xc                              
  19e3  b8042c           mov ax, 0x2c04                           
  19e6  8ec0             mov es, ax                               
  19e8  268b1e1001       mov bx, word ptr es:[0x110]              
  19ed  d1e3             shl bx, 1                                
  19ef  b8042c           mov ax, 0x2c04                           
  19f2  8ec0             mov es, ax                               
  19f4  26ffb7b000       push word ptr es:[bx + 0xb0]             
  19f9  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  19fe  59               pop cx                                   
  19ff  16               push ss                                  
  1a00  8d46f8           lea ax, [bp - 8]                         
  1a03  50               push ax                                  
  1a04  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  1a09  83c404           add sp, 4                                
  1a0c  5e               pop si                                   
  1a0d  c9               leave                                    
  1a0e  cb               retf                                     
