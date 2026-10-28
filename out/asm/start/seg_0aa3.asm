; seg 0aa3  img 0xaa30..0xb560  file off 0xb630
  0aa3:0000  3000             xor byte ptr [bx + si], al                [reloc]
  0aa3:0002  0083c404         add byte ptr [bp + di + 0x4c4], al       
  0aa3:0006  5d               pop bp                                   
  0aa3:0007  cb               retf                                     
  0aa3:0008  a18c08           mov ax, word ptr [0x88c]                 
  0aa3:000b  eb00             jmp 0xd                                  
  0aa3:000d  cb               retf                                     

proc_0aa3_000e:
  0aa3:000e  55               push bp                                  
  0aa3:000f  8bec             mov bp, sp                               
  0aa3:0011  668b460e         mov eax, dword ptr [bp + 0xe]            
  0aa3:0015  66a3c619         mov dword ptr [0x19c6], eax              
  0aa3:0019  668b4606         mov eax, dword ptr [bp + 6]              
  0aa3:001d  66a3c219         mov dword ptr [0x19c2], eax              
  0aa3:0021  8b460a           mov ax, word ptr [bp + 0xa]              
  0aa3:0024  a39609           mov word ptr [0x996], ax                 
  0aa3:0027  8b460c           mov ax, word ptr [bp + 0xc]              
  0aa3:002a  a39a09           mov word ptr [0x99a], ax                 
  0aa3:002d  5d               pop bp                                   
  0aa3:002e  cb               retf                                     

proc_0aa3_002f:
  0aa3:002f  55               push bp                                  
  0aa3:0030  8bec             mov bp, sp                               
  0aa3:0032  56               push si                                  
  0aa3:0033  833e9a0900       cmp word ptr [0x99a], 0                  
  0aa3:0038  740c             je 0x46                                  
  0aa3:003a  1e               push ds                                  
  0aa3:003b  689608           push 0x896                               
  0aa3:003e  9a4d0a3d08       lcall 0x83d, 0xa4d                       -> 083d:0a4d [reloc]
  0aa3:0043  83c404           add sp, 4                                
  0aa3:0046  a1d308           mov ax, word ptr [0x8d3]                 
  0aa3:0049  050f00           add ax, 0xf                              
  0aa3:004c  25f0ff           and ax, 0xfff0                           
  0aa3:004f  50               push ax                                  
  0aa3:0050  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:0053  051f00           add ax, 0x1f                             
  0aa3:0056  25e0ff           and ax, 0xffe0                           
  0aa3:0059  50               push ax                                  
  0aa3:005a  1e               push ds                                  
  0aa3:005b  689608           push 0x896                               
  0aa3:005e  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0aa3:0063  83c408           add sp, 8                                
  0aa3:0066  0bc0             or ax, ax                                
  0aa3:0068  7511             jne 0x7b                                 
  0aa3:006a  1e               push ds                                  
  0aa3:006b  689c09           push 0x99c                                ; "Cannot allocate saveBM"
  0aa3:006e  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0aa3:0073  83c404           add sp, 4                                
  0aa3:0076  33c0             xor ax, ax                               
  0aa3:0078  e9aa01           jmp 0x225                                
  0aa3:007b  66833ea00800     cmp dword ptr [0x8a0], 0                 
  0aa3:0081  7438             je 0xbb                                  
  0aa3:0083  f706cb080a00     test word ptr [0x8cb], 0xa               
  0aa3:0089  7530             jne 0xbb                                 
  0aa3:008b  33f6             xor si, si                               
  0aa3:008d  eb23             jmp 0xb2                                 
  0aa3:008f  8bde             mov bx, si                               
  0aa3:0091  c1e302           shl bx, 2                                
  0aa3:0094  ffb7a208         push word ptr [bx + 0x8a2]               
  0aa3:0098  ffb7a008         push word ptr [bx + 0x8a0]               
  0aa3:009c  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:00a1  83c404           add sp, 4                                
  0aa3:00a4  8bde             mov bx, si                               
  0aa3:00a6  c1e302           shl bx, 2                                
  0aa3:00a9  8997b208         mov word ptr [bx + 0x8b2], dx            
  0aa3:00ad  8987b008         mov word ptr [bx + 0x8b0], ax            
  0aa3:00b1  46               inc si                                   
  0aa3:00b2  a0ca08           mov al, byte ptr [0x8ca]                 
  0aa3:00b5  b400             mov ah, 0                                
  0aa3:00b7  3bc6             cmp ax, si                               
  0aa3:00b9  7fd4             jg 0x8f                                  
  0aa3:00bb  833e9a0900       cmp word ptr [0x99a], 0                  
  0aa3:00c0  740c             je 0xce                                  
  0aa3:00c2  1e               push ds                                  
  0aa3:00c3  68d508           push 0x8d5                               
  0aa3:00c6  9a4d0a3d08       lcall 0x83d, 0xa4d                       -> 083d:0a4d [reloc]
  0aa3:00cb  83c404           add sp, 4                                
  0aa3:00ce  ff36d308         push word ptr [0x8d3]                    
  0aa3:00d2  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:00d5  050800           add ax, 8                                
  0aa3:00d8  c1e003           shl ax, 3                                
  0aa3:00db  50               push ax                                  
  0aa3:00dc  1e               push ds                                  
  0aa3:00dd  68d508           push 0x8d5                               
  0aa3:00e0  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0aa3:00e5  83c408           add sp, 8                                
  0aa3:00e8  0bc0             or ax, ax                                
  0aa3:00ea  750c             jne 0xf8                                 
  0aa3:00ec  1e               push ds                                  
  0aa3:00ed  68b409           push 0x9b4                                ; "Cannot allocate mouse bitmap"
  0aa3:00f0  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0aa3:00f5  83c404           add sp, 4                                
  0aa3:00f8  66833edf0800     cmp dword ptr [0x8df], 0                 
  0aa3:00fe  7438             je 0x138                                 
  0aa3:0100  f7060a090a00     test word ptr [0x90a], 0xa               
  0aa3:0106  7530             jne 0x138                                
  0aa3:0108  33f6             xor si, si                               
  0aa3:010a  eb23             jmp 0x12f                                
  0aa3:010c  8bde             mov bx, si                               
  0aa3:010e  c1e302           shl bx, 2                                
  0aa3:0111  ffb7e108         push word ptr [bx + 0x8e1]               
  0aa3:0115  ffb7df08         push word ptr [bx + 0x8df]               
  0aa3:0119  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:011e  83c404           add sp, 4                                
  0aa3:0121  8bde             mov bx, si                               
  0aa3:0123  c1e302           shl bx, 2                                
  0aa3:0126  8997f108         mov word ptr [bx + 0x8f1], dx            
  0aa3:012a  8987ef08         mov word ptr [bx + 0x8ef], ax            
  0aa3:012e  46               inc si                                   
  0aa3:012f  a00909           mov al, byte ptr [0x909]                 
  0aa3:0132  b400             mov ah, 0                                
  0aa3:0134  3bc6             cmp ax, si                               
  0aa3:0136  7fd4             jg 0x10c                                 
  0aa3:0138  6a01             push 1                                   
  0aa3:013a  ff36d308         push word ptr [0x8d3]                    
  0aa3:013e  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:0141  050800           add ax, 8                                
  0aa3:0144  c1e003           shl ax, 3                                
  0aa3:0147  50               push ax                                  
  0aa3:0148  1e               push ds                                  
  0aa3:0149  684b09           push 0x94b                               
  0aa3:014c  9ab0023d08       lcall 0x83d, 0x2b0                       -> 083d:02b0 [reloc]
  0aa3:0151  83c40a           add sp, 0xa                              
  0aa3:0154  0bc0             or ax, ax                                
  0aa3:0156  750c             jne 0x164                                
  0aa3:0158  1e               push ds                                  
  0aa3:0159  68d209           push 0x9d2                                ; "Cannot allocate mouse mask bitmap"
  0aa3:015c  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0aa3:0161  83c404           add sp, 4                                
  0aa3:0164  66833e550900     cmp dword ptr [0x955], 0                 
  0aa3:016a  7438             je 0x1a4                                 
  0aa3:016c  f70680090a00     test word ptr [0x980], 0xa               
  0aa3:0172  7530             jne 0x1a4                                
  0aa3:0174  33f6             xor si, si                               
  0aa3:0176  eb23             jmp 0x19b                                
  0aa3:0178  8bde             mov bx, si                               
  0aa3:017a  c1e302           shl bx, 2                                
  0aa3:017d  ffb75709         push word ptr [bx + 0x957]               
  0aa3:0181  ffb75509         push word ptr [bx + 0x955]               
  0aa3:0185  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:018a  83c404           add sp, 4                                
  0aa3:018d  8bde             mov bx, si                               
  0aa3:018f  c1e302           shl bx, 2                                
  0aa3:0192  89976709         mov word ptr [bx + 0x967], dx            
  0aa3:0196  89876509         mov word ptr [bx + 0x965], ax            
  0aa3:019a  46               inc si                                   
  0aa3:019b  a07f09           mov al, byte ptr [0x97f]                 
  0aa3:019e  b400             mov ah, 0                                
  0aa3:01a0  3bc6             cmp ax, si                               
  0aa3:01a2  7fd4             jg 0x178                                 
  0aa3:01a4  6a01             push 1                                   
  0aa3:01a6  1e               push ds                                  
  0aa3:01a7  684b09           push 0x94b                               
  0aa3:01aa  9a610a3d08       lcall 0x83d, 0xa61                       -> 083d:0a61 [reloc]
  0aa3:01af  83c406           add sp, 6                                
  0aa3:01b2  837e0600         cmp word ptr [bp + 6], 0                 
  0aa3:01b6  7408             je 0x1c0                                 
  0aa3:01b8  c7068c080000     mov word ptr [0x88c], 0                  
  0aa3:01be  eb13             jmp 0x1d3                                
  0aa3:01c0  9a0200eb06       lcall 0x6eb, 2                           -> 06eb:0002 [reloc]
  0aa3:01c5  0bc0             or ax, ax                                
  0aa3:01c7  7405             je 0x1ce                                 
  0aa3:01c9  b80100           mov ax, 1                                
  0aa3:01cc  eb02             jmp 0x1d0                                
  0aa3:01ce  33c0             xor ax, ax                               
  0aa3:01d0  a38c08           mov word ptr [0x88c], ax                 
  0aa3:01d3  6a00             push 0                                   
  0aa3:01d5  90               nop                                      
  0aa3:01d6  0e               push cs                                  
  0aa3:01d7  e89901           call 0x373                               -> 0aa3:0373
  0aa3:01da  59               pop cx                                   
  0aa3:01db  33c0             xor ax, ax                               
  0aa3:01dd  a38208           mov word ptr [0x882], ax                 
  0aa3:01e0  a38008           mov word ptr [0x880], ax                 
  0aa3:01e3  ff368208         push word ptr [0x882]                    
  0aa3:01e7  ff368008         push word ptr [0x880]                    
  0aa3:01eb  9a4600eb06       lcall 0x6eb, 0x46                        -> 06eb:0046 [reloc]
  0aa3:01f0  83c404           add sp, 4                                
  0aa3:01f3  833e8c0800       cmp word ptr [0x88c], 0                  
  0aa3:01f8  7412             je 0x20c                                 
  0aa3:01fa  1e               push ds                                  
  0aa3:01fb  688208           push 0x882                               
  0aa3:01fe  1e               push ds                                  
  0aa3:01ff  688008           push 0x880                               
  0aa3:0202  90               nop                                      
  0aa3:0203  0e               push cs                                  
  0aa3:0204  e8ba08           call 0xac1                               -> 0aa3:0ac1
  0aa3:0207  83c408           add sp, 8                                
  0aa3:020a  eb08             jmp 0x214                                
  0aa3:020c  33c0             xor ax, ax                               
  0aa3:020e  a38208           mov word ptr [0x882], ax                 
  0aa3:0211  a38008           mov word ptr [0x880], ax                 
  0aa3:0214  c70688080100     mov word ptr [0x888], 1                  
  0aa3:021a  90               nop                                      
  0aa3:021b  0e               push cs                                  
  0aa3:021c  e83c05           call 0x75b                               -> 0aa3:075b
  0aa3:021f  a18c08           mov ax, word ptr [0x88c]                 
  0aa3:0222  e953fe           jmp 0x78                                 
  0aa3:0225  5e               pop si                                   
  0aa3:0226  5d               pop bp                                   
  0aa3:0227  cb               retf                                     

proc_0aa3_0228:
  0aa3:0228  55               push bp                                  
  0aa3:0229  8bec             mov bp, sp                               
  0aa3:022b  56               push si                                  
  0aa3:022c  57               push di                                  
  0aa3:022d  8b760a           mov si, word ptr [bp + 0xa]              
  0aa3:0230  8b7e0c           mov di, word ptr [bp + 0xc]              
  0aa3:0233  c41e0908         les bx, ptr [0x809]                      
  0aa3:0237  268b4706         mov ax, word ptr es:[bx + 6]             
  0aa3:023b  bb1400           mov bx, 0x14                             
  0aa3:023e  33d2             xor dx, dx                               
  0aa3:0240  f7f3             div bx                                   
  0aa3:0242  50               push ax                                  
  0aa3:0243  c41e0908         les bx, ptr [0x809]                      
  0aa3:0247  268b4704         mov ax, word ptr es:[bx + 4]             
  0aa3:024b  f72ed615         imul word ptr [0x15d6]                   
  0aa3:024f  50               push ax                                  
  0aa3:0250  b80014           mov ax, 0x1400                           
  0aa3:0253  33d2             xor dx, dx                               
  0aa3:0255  5b               pop bx                                   
  0aa3:0256  f7f3             div bx                                   
  0aa3:0258  50               push ax                                  
  0aa3:0259  9a3600eb06       lcall 0x6eb, 0x36                        -> 06eb:0036 [reloc]
  0aa3:025e  83c404           add sp, 4                                
  0aa3:0261  c41e0908         les bx, ptr [0x809]                      
  0aa3:0265  268b5706         mov dx, word ptr es:[bx + 6]             
  0aa3:0269  2b5608           sub dx, word ptr [bp + 8]                
  0aa3:026c  03d7             add dx, di                               
  0aa3:026e  a1d615           mov ax, word ptr [0x15d6]                
  0aa3:0271  f7ea             imul dx                                  
  0aa3:0273  50               push ax                                  
  0aa3:0274  c41e0908         les bx, ptr [0x809]                      
  0aa3:0278  268b5704         mov dx, word ptr es:[bx + 4]             
  0aa3:027c  2b5606           sub dx, word ptr [bp + 6]                
  0aa3:027f  03d6             add dx, si                               
  0aa3:0281  a1d615           mov ax, word ptr [0x15d6]                
  0aa3:0284  f7ea             imul dx                                  
  0aa3:0286  50               push ax                                  
  0aa3:0287  a1d615           mov ax, word ptr [0x15d6]                
  0aa3:028a  f7ef             imul di                                  
  0aa3:028c  50               push ax                                  
  0aa3:028d  a1d615           mov ax, word ptr [0x15d6]                
  0aa3:0290  f7ee             imul si                                  
  0aa3:0292  50               push ax                                  
  0aa3:0293  9a6700eb06       lcall 0x6eb, 0x67                        -> 06eb:0067 [reloc]
  0aa3:0298  83c408           add sp, 8                                
  0aa3:029b  5f               pop di                                   
  0aa3:029c  5e               pop si                                   
  0aa3:029d  5d               pop bp                                   
  0aa3:029e  cb               retf                                     

proc_0aa3_029f:
  0aa3:029f  55               push bp                                  
  0aa3:02a0  8bec             mov bp, sp                               
  0aa3:02a2  8b4606           mov ax, word ptr [bp + 6]                
  0aa3:02a5  a38408           mov word ptr [0x884], ax                 
  0aa3:02a8  8b4608           mov ax, word ptr [bp + 8]                
  0aa3:02ab  a38608           mov word ptr [0x886], ax                 
  0aa3:02ae  5d               pop bp                                   
  0aa3:02af  cb               retf                                     
  0aa3:02b0  833e8c0800       cmp word ptr [0x88c], 0                  
  0aa3:02b5  741b             je 0x2d2                                 
  0aa3:02b7  1e               push ds                                  
  0aa3:02b8  68c019           push 0x19c0                              
  0aa3:02bb  1e               push ds                                  
  0aa3:02bc  68be19           push 0x19be                              
  0aa3:02bf  9a0e00eb06       lcall 0x6eb, 0xe                         -> 06eb:000e [reloc]
  0aa3:02c4  83c408           add sp, 8                                
  0aa3:02c7  a17808           mov ax, word ptr [0x878]                 
  0aa3:02ca  a3be19           mov word ptr [0x19be], ax                
  0aa3:02cd  a17a08           mov ax, word ptr [0x87a]                 
  0aa3:02d0  eb09             jmp 0x2db                                
  0aa3:02d2  a18408           mov ax, word ptr [0x884]                 
  0aa3:02d5  a3be19           mov word ptr [0x19be], ax                
  0aa3:02d8  a18608           mov ax, word ptr [0x886]                 
  0aa3:02db  a3c019           mov word ptr [0x19c0], ax                
  0aa3:02de  a1be19           mov ax, word ptr [0x19be]                
  0aa3:02e1  3b068008         cmp ax, word ptr [0x880]                 
  0aa3:02e5  750c             jne 0x2f3                                
  0aa3:02e7  a1c019           mov ax, word ptr [0x19c0]                
  0aa3:02ea  3b068208         cmp ax, word ptr [0x882]                 
  0aa3:02ee  7503             jne 0x2f3                                
  0aa3:02f0  e97f00           jmp 0x372                                
  0aa3:02f3  833e880800       cmp word ptr [0x888], 0                  
  0aa3:02f8  7578             jne 0x372                                
  0aa3:02fa  a18208           mov ax, word ptr [0x882]                 
  0aa3:02fd  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:0301  50               push ax                                  
  0aa3:0302  a18008           mov ax, word ptr [0x880]                 
  0aa3:0305  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:0309  25f8ff           and ax, 0xfff8                           
  0aa3:030c  50               push ax                                  
  0aa3:030d  1e               push ds                                  
  0aa3:030e  684c07           push 0x74c                               
  0aa3:0311  ff368c09         push word ptr [0x98c]                    
  0aa3:0315  ff368809         push word ptr [0x988]                    
  0aa3:0319  6a00             push 0                                   
  0aa3:031b  6a00             push 0                                   
  0aa3:031d  1e               push ds                                  
  0aa3:031e  689608           push 0x896                               
  0aa3:0321  ff1ef615         lcall [0x15f6]                           
  0aa3:0325  83c414           add sp, 0x14                             
  0aa3:0328  6a00             push 0                                   
  0aa3:032a  6a00             push 0                                   
  0aa3:032c  1e               push ds                                  
  0aa3:032d  689608           push 0x896                               
  0aa3:0330  ff368c09         push word ptr [0x98c]                    
  0aa3:0334  ff368809         push word ptr [0x988]                    
  0aa3:0338  a1c019           mov ax, word ptr [0x19c0]                
  0aa3:033b  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:033f  50               push ax                                  
  0aa3:0340  a1be19           mov ax, word ptr [0x19be]                
  0aa3:0343  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:0347  25f8ff           and ax, 0xfff8                           
  0aa3:034a  50               push ax                                  
  0aa3:034b  1e               push ds                                  
  0aa3:034c  684c07           push 0x74c                               
  0aa3:034f  ff1ef615         lcall [0x15f6]                           
  0aa3:0353  83c414           add sp, 0x14                             
  0aa3:0356  ff36c019         push word ptr [0x19c0]                   
  0aa3:035a  ff36be19         push word ptr [0x19be]                   
  0aa3:035e  90               nop                                      
  0aa3:035f  0e               push cs                                  
  0aa3:0360  e82e06           call 0x991                               -> 0aa3:0991
  0aa3:0363  83c404           add sp, 4                                
  0aa3:0366  a1be19           mov ax, word ptr [0x19be]                
  0aa3:0369  a38008           mov word ptr [0x880], ax                 
  0aa3:036c  a1c019           mov ax, word ptr [0x19c0]                
  0aa3:036f  a38208           mov word ptr [0x882], ax                 
  0aa3:0372  cb               retf                                     
  0aa3:0373  c8080000         enter 8, 0                               
  0aa3:0377  56               push si                                  
  0aa3:0378  57               push di                                  
  0aa3:0379  8b7606           mov si, word ptr [bp + 6]                
  0aa3:037c  39369408         cmp word ptr [0x894], si                 
  0aa3:0380  7503             jne 0x385                                
  0aa3:0382  e9d203           jmp 0x757                                
  0aa3:0385  833e860900       cmp word ptr [0x986], 0                  
  0aa3:038a  7435             je 0x3c1                                 
  0aa3:038c  833e880800       cmp word ptr [0x888], 0                  
  0aa3:0391  752e             jne 0x3c1                                
  0aa3:0393  a18208           mov ax, word ptr [0x882]                 
  0aa3:0396  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:039a  50               push ax                                  
  0aa3:039b  a18008           mov ax, word ptr [0x880]                 
  0aa3:039e  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:03a2  25f8ff           and ax, 0xfff8                           
  0aa3:03a5  50               push ax                                  
  0aa3:03a6  1e               push ds                                  
  0aa3:03a7  684c07           push 0x74c                               
  0aa3:03aa  ff368c09         push word ptr [0x98c]                    
  0aa3:03ae  ff368809         push word ptr [0x988]                    
  0aa3:03b2  6a00             push 0                                   
  0aa3:03b4  6a00             push 0                                   
  0aa3:03b6  1e               push ds                                  
  0aa3:03b7  689608           push 0x896                               
  0aa3:03ba  ff1ef615         lcall [0x15f6]                           
  0aa3:03be  83c414           add sp, 0x14                             
  0aa3:03c1  6a10             push 0x10                                
  0aa3:03c3  6a10             push 0x10                                
  0aa3:03c5  6a00             push 0                                   
  0aa3:03c7  8bc6             mov ax, si                               
  0aa3:03c9  c1e004           shl ax, 4                                
  0aa3:03cc  50               push ax                                  
  0aa3:03cd  16               push ss                                  
  0aa3:03ce  8d46f8           lea ax, [bp - 8]                         
  0aa3:03d1  50               push ax                                  
  0aa3:03d2  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  0aa3:03d7  83c40c           add sp, 0xc                              
  0aa3:03da  8b46fc           mov ax, word ptr [bp - 4]                
  0aa3:03dd  050e00           add ax, 0xe                              
  0aa3:03e0  25f8ff           and ax, 0xfff8                           
  0aa3:03e3  a38809           mov word ptr [0x988], ax                 
  0aa3:03e6  c41ec619         les bx, ptr [0x19c6]                     
  0aa3:03ea  26c45f02         les bx, ptr es:[bx + 2]                  
  0aa3:03ee  8bc6             mov ax, si                               
  0aa3:03f0  d1e0             shl ax, 1                                
  0aa3:03f2  03d8             add bx, ax                               
  0aa3:03f4  268b07           mov ax, word ptr es:[bx]                 
  0aa3:03f7  a38a09           mov word ptr [0x98a], ax                 
  0aa3:03fa  c41ec619         les bx, ptr [0x19c6]                     
  0aa3:03fe  26c45f06         les bx, ptr es:[bx + 6]                  
  0aa3:0402  8bc6             mov ax, si                               
  0aa3:0404  d1e0             shl ax, 1                                
  0aa3:0406  03d8             add bx, ax                               
  0aa3:0408  268b07           mov ax, word ptr es:[bx]                 
  0aa3:040b  a38c09           mov word ptr [0x98c], ax                 
  0aa3:040e  89369408         mov word ptr [0x894], si                 
  0aa3:0412  c41ec619         les bx, ptr [0x19c6]                     
  0aa3:0416  26c45f0a         les bx, ptr es:[bx + 0xa]                
  0aa3:041a  8bc6             mov ax, si                               
  0aa3:041c  d1e0             shl ax, 1                                
  0aa3:041e  03d8             add bx, ax                               
  0aa3:0420  268b07           mov ax, word ptr es:[bx]                 
  0aa3:0423  a3cc19           mov word ptr [0x19cc], ax                
  0aa3:0426  c41ec619         les bx, ptr [0x19c6]                     
  0aa3:042a  26c45f0a         les bx, ptr es:[bx + 0xa]                
  0aa3:042e  8bc6             mov ax, si                               
  0aa3:0430  d1e0             shl ax, 1                                
  0aa3:0432  03d8             add bx, ax                               
  0aa3:0434  268b07           mov ax, word ptr es:[bx]                 
  0aa3:0437  a3ca19           mov word ptr [0x19ca], ax                
  0aa3:043a  ff36ca19         push word ptr [0x19ca]                   
  0aa3:043e  ff36cc19         push word ptr [0x19cc]                   
  0aa3:0442  ff368c09         push word ptr [0x98c]                    
  0aa3:0446  ff368a09         push word ptr [0x98a]                    
  0aa3:044a  0e               push cs                                  
  0aa3:044b  e8dafd           call 0x228                               -> 0aa3:0228
  0aa3:044e  83c408           add sp, 8                                
  0aa3:0451  ff36d308         push word ptr [0x8d3]                    
  0aa3:0455  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:0458  050800           add ax, 8                                
  0aa3:045b  c1e003           shl ax, 3                                
  0aa3:045e  50               push ax                                  
  0aa3:045f  1e               push ds                                  
  0aa3:0460  681009           push 0x910                               
  0aa3:0463  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0aa3:0468  83c408           add sp, 8                                
  0aa3:046b  0bc0             or ax, ax                                
  0aa3:046d  750c             jne 0x47b                                
  0aa3:046f  1e               push ds                                  
  0aa3:0470  68f509           push 0x9f5                                ; "Cannot allocate mouse temp bitmap"
  0aa3:0473  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0aa3:0478  83c404           add sp, 4                                
  0aa3:047b  66833e1a0900     cmp dword ptr [0x91a], 0                 
  0aa3:0481  7438             je 0x4bb                                 
  0aa3:0483  f70645090a00     test word ptr [0x945], 0xa               
  0aa3:0489  7530             jne 0x4bb                                
  0aa3:048b  33f6             xor si, si                               
  0aa3:048d  eb23             jmp 0x4b2                                
  0aa3:048f  8bde             mov bx, si                               
  0aa3:0491  c1e302           shl bx, 2                                
  0aa3:0494  ffb71c09         push word ptr [bx + 0x91c]               
  0aa3:0498  ffb71a09         push word ptr [bx + 0x91a]               
  0aa3:049c  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:04a1  83c404           add sp, 4                                
  0aa3:04a4  8bde             mov bx, si                               
  0aa3:04a6  c1e302           shl bx, 2                                
  0aa3:04a9  89972c09         mov word ptr [bx + 0x92c], dx            
  0aa3:04ad  89872a09         mov word ptr [bx + 0x92a], ax            
  0aa3:04b1  46               inc si                                   
  0aa3:04b2  a04409           mov al, byte ptr [0x944]                 
  0aa3:04b5  b400             mov ah, 0                                
  0aa3:04b7  3bc6             cmp ax, si                               
  0aa3:04b9  7fd4             jg 0x48f                                 
  0aa3:04bb  ff369609         push word ptr [0x996]                    
  0aa3:04bf  1e               push ds                                  
  0aa3:04c0  681009           push 0x910                               
  0aa3:04c3  9a4a083d08       lcall 0x83d, 0x84a                       -> 083d:084a [reloc]
  0aa3:04c8  83c406           add sp, 6                                
  0aa3:04cb  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:04cf  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0aa3:04d5  744d             je 0x524                                 
  0aa3:04d7  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:04db  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0aa3:04e1  7541             jne 0x524                                
  0aa3:04e3  33ff             xor di, di                               
  0aa3:04e5  eb2f             jmp 0x516                                
  0aa3:04e7  8bc7             mov ax, di                               
  0aa3:04e9  c1e002           shl ax, 2                                
  0aa3:04ec  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:04f0  03d8             add bx, ax                               
  0aa3:04f2  26ff770c         push word ptr es:[bx + 0xc]              
  0aa3:04f6  26ff770a         push word ptr es:[bx + 0xa]              
  0aa3:04fa  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:04ff  83c404           add sp, 4                                
  0aa3:0502  8bdf             mov bx, di                               
  0aa3:0504  c1e302           shl bx, 2                                
  0aa3:0507  c436c219         les si, ptr [0x19c2]                     
  0aa3:050b  03f3             add si, bx                               
  0aa3:050d  2689541c         mov word ptr es:[si + 0x1c], dx          
  0aa3:0511  2689441a         mov word ptr es:[si + 0x1a], ax          
  0aa3:0515  47               inc di                                   
  0aa3:0516  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:051a  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0aa3:051e  b400             mov ah, 0                                
  0aa3:0520  3bc7             cmp ax, di                               
  0aa3:0522  7fc3             jg 0x4e7                                 
  0aa3:0524  bf0800           mov di, 8                                
  0aa3:0527  33f6             xor si, si                               
  0aa3:0529  eb2d             jmp 0x558                                
  0aa3:052b  6a00             push 0                                   
  0aa3:052d  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:0530  050800           add ax, 8                                
  0aa3:0533  f7ee             imul si                                  
  0aa3:0535  03c6             add ax, si                               
  0aa3:0537  50               push ax                                  
  0aa3:0538  1e               push ds                                  
  0aa3:0539  681009           push 0x910                               
  0aa3:053c  ff76fe           push word ptr [bp - 2]                   
  0aa3:053f  ff76fc           push word ptr [bp - 4]                   
  0aa3:0542  ff76fa           push word ptr [bp - 6]                   
  0aa3:0545  ff76f8           push word ptr [bp - 8]                   
  0aa3:0548  ff36c419         push word ptr [0x19c4]                   
  0aa3:054c  ff36c219         push word ptr [0x19c2]                   
  0aa3:0550  ff1ef615         lcall [0x15f6]                           
  0aa3:0554  83c414           add sp, 0x14                             
  0aa3:0557  46               inc si                                   
  0aa3:0558  8bc7             mov ax, di                               
  0aa3:055a  4f               dec di                                   
  0aa3:055b  0bc0             or ax, ax                                
  0aa3:055d  75cc             jne 0x52b                                
  0aa3:055f  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:0563  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0aa3:0569  743a             je 0x5a5                                 
  0aa3:056b  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:056f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0aa3:0575  752e             jne 0x5a5                                
  0aa3:0577  33f6             xor si, si                               
  0aa3:0579  eb1c             jmp 0x597                                
  0aa3:057b  8bc6             mov ax, si                               
  0aa3:057d  c1e002           shl ax, 2                                
  0aa3:0580  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:0584  03d8             add bx, ax                               
  0aa3:0586  26ff770c         push word ptr es:[bx + 0xc]              
  0aa3:058a  26ff770a         push word ptr es:[bx + 0xa]              
  0aa3:058e  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  0aa3:0593  83c404           add sp, 4                                
  0aa3:0596  46               inc si                                   
  0aa3:0597  c41ec219         les bx, ptr [0x19c2]                     
  0aa3:059b  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0aa3:059f  b400             mov ah, 0                                
  0aa3:05a1  3bc6             cmp ax, si                               
  0aa3:05a3  7fd6             jg 0x57b                                 
  0aa3:05a5  ff369609         push word ptr [0x996]                    
  0aa3:05a9  1e               push ds                                  
  0aa3:05aa  684b09           push 0x94b                               
  0aa3:05ad  1e               push ds                                  
  0aa3:05ae  681009           push 0x910                               
  0aa3:05b1  1e               push ds                                  
  0aa3:05b2  689809           push 0x998                               
  0aa3:05b5  9ad000c30b       lcall 0xbc3, 0xd0                        -> 0bc3:00d0 [reloc]
  0aa3:05ba  83c40e           add sp, 0xe                              
  0aa3:05bd  66833edf0800     cmp dword ptr [0x8df], 0                 
  0aa3:05c3  7438             je 0x5fd                                 
  0aa3:05c5  f7060a090a00     test word ptr [0x90a], 0xa               
  0aa3:05cb  7530             jne 0x5fd                                
  0aa3:05cd  33f6             xor si, si                               
  0aa3:05cf  eb23             jmp 0x5f4                                
  0aa3:05d1  8bde             mov bx, si                               
  0aa3:05d3  c1e302           shl bx, 2                                
  0aa3:05d6  ffb7e108         push word ptr [bx + 0x8e1]               
  0aa3:05da  ffb7df08         push word ptr [bx + 0x8df]               
  0aa3:05de  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:05e3  83c404           add sp, 4                                
  0aa3:05e6  8bde             mov bx, si                               
  0aa3:05e8  c1e302           shl bx, 2                                
  0aa3:05eb  8997f108         mov word ptr [bx + 0x8f1], dx            
  0aa3:05ef  8987ef08         mov word ptr [bx + 0x8ef], ax            
  0aa3:05f3  46               inc si                                   
  0aa3:05f4  a00909           mov al, byte ptr [0x909]                 
  0aa3:05f7  b400             mov ah, 0                                
  0aa3:05f9  3bc6             cmp ax, si                               
  0aa3:05fb  7fd4             jg 0x5d1                                 
  0aa3:05fd  66833e1a0900     cmp dword ptr [0x91a], 0                 
  0aa3:0603  7438             je 0x63d                                 
  0aa3:0605  f70645090a00     test word ptr [0x945], 0xa               
  0aa3:060b  7530             jne 0x63d                                
  0aa3:060d  33f6             xor si, si                               
  0aa3:060f  eb23             jmp 0x634                                
  0aa3:0611  8bde             mov bx, si                               
  0aa3:0613  c1e302           shl bx, 2                                
  0aa3:0616  ffb71c09         push word ptr [bx + 0x91c]               
  0aa3:061a  ffb71a09         push word ptr [bx + 0x91a]               
  0aa3:061e  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:0623  83c404           add sp, 4                                
  0aa3:0626  8bde             mov bx, si                               
  0aa3:0628  c1e302           shl bx, 2                                
  0aa3:062b  89972c09         mov word ptr [bx + 0x92c], dx            
  0aa3:062f  89872a09         mov word ptr [bx + 0x92a], ax            
  0aa3:0633  46               inc si                                   
  0aa3:0634  a04409           mov al, byte ptr [0x944]                 
  0aa3:0637  b400             mov ah, 0                                
  0aa3:0639  3bc6             cmp ax, si                               
  0aa3:063b  7fd4             jg 0x611                                 
  0aa3:063d  6a00             push 0                                   
  0aa3:063f  6a00             push 0                                   
  0aa3:0641  1e               push ds                                  
  0aa3:0642  68d508           push 0x8d5                               
  0aa3:0645  ff36d308         push word ptr [0x8d3]                    
  0aa3:0649  a1d108           mov ax, word ptr [0x8d1]                 
  0aa3:064c  050800           add ax, 8                                
  0aa3:064f  c1e003           shl ax, 3                                
  0aa3:0652  50               push ax                                  
  0aa3:0653  6a00             push 0                                   
  0aa3:0655  6a00             push 0                                   
  0aa3:0657  1e               push ds                                  
  0aa3:0658  681009           push 0x910                               
  0aa3:065b  ff1ef615         lcall [0x15f6]                           
  0aa3:065f  83c414           add sp, 0x14                             
  0aa3:0662  1e               push ds                                  
  0aa3:0663  681009           push 0x910                               
  0aa3:0666  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0aa3:066b  83c404           add sp, 4                                
  0aa3:066e  c70686090100     mov word ptr [0x986], 1                  
  0aa3:0674  8b46f8           mov ax, word ptr [bp - 8]                
  0aa3:0677  a38e09           mov word ptr [0x98e], ax                 
  0aa3:067a  8b46fa           mov ax, word ptr [bp - 6]                
  0aa3:067d  a39009           mov word ptr [0x990], ax                 
  0aa3:0680  8b46fc           mov ax, word ptr [bp - 4]                
  0aa3:0683  a39209           mov word ptr [0x992], ax                 
  0aa3:0686  8b46fe           mov ax, word ptr [bp - 2]                
  0aa3:0689  a39409           mov word ptr [0x994], ax                 
  0aa3:068c  1e               push ds                                  
  0aa3:068d  688208           push 0x882                               
  0aa3:0690  1e               push ds                                  
  0aa3:0691  688008           push 0x880                               
  0aa3:0694  90               nop                                      
  0aa3:0695  0e               push cs                                  
  0aa3:0696  e82804           call 0xac1                               -> 0aa3:0ac1
  0aa3:0699  83c408           add sp, 8                                
  0aa3:069c  c41e0908         les bx, ptr [0x809]                      
  0aa3:06a0  a18008           mov ax, word ptr [0x880]                 
  0aa3:06a3  0346fc           add ax, word ptr [bp - 4]                
  0aa3:06a6  26394704         cmp word ptr es:[bx + 4], ax             
  0aa3:06aa  7d14             jge 0x6c0                                
  0aa3:06ac  c41e0908         les bx, ptr [0x809]                      
  0aa3:06b0  268b4704         mov ax, word ptr es:[bx + 4]             
  0aa3:06b4  2b46fc           sub ax, word ptr [bp - 4]                
  0aa3:06b7  0306cc19         add ax, word ptr [0x19cc]                
  0aa3:06bb  a38008           mov word ptr [0x880], ax                 
  0aa3:06be  eb0f             jmp 0x6cf                                
  0aa3:06c0  a18008           mov ax, word ptr [0x880]                 
  0aa3:06c3  3b06cc19         cmp ax, word ptr [0x19cc]                
  0aa3:06c7  7d06             jge 0x6cf                                
  0aa3:06c9  a1cc19           mov ax, word ptr [0x19cc]                
  0aa3:06cc  a38008           mov word ptr [0x880], ax                 
  0aa3:06cf  c41e0908         les bx, ptr [0x809]                      
  0aa3:06d3  a18208           mov ax, word ptr [0x882]                 
  0aa3:06d6  0346fe           add ax, word ptr [bp - 2]                
  0aa3:06d9  26394706         cmp word ptr es:[bx + 6], ax             
  0aa3:06dd  7d14             jge 0x6f3                                
  0aa3:06df  c41e0908         les bx, ptr [0x809]                      
  0aa3:06e3  268b4706         mov ax, word ptr es:[bx + 6]             
  0aa3:06e7  2b46fe           sub ax, word ptr [bp - 2]                
  0aa3:06ea  0306ca19         add ax, word ptr [0x19ca]                
  0aa3:06ee  a38208           mov word ptr [0x882], ax                 
  0aa3:06f1  eb0f             jmp 0x702                                
  0aa3:06f3  a18208           mov ax, word ptr [0x882]                 
  0aa3:06f6  3b06ca19         cmp ax, word ptr [0x19ca]                
  0aa3:06fa  7d06             jge 0x702                                
  0aa3:06fc  a1ca19           mov ax, word ptr [0x19ca]                
  0aa3:06ff  a38208           mov word ptr [0x882], ax                 
  0aa3:0702  ff368208         push word ptr [0x882]                    
  0aa3:0706  ff368008         push word ptr [0x880]                    
  0aa3:070a  9a4600eb06       lcall 0x6eb, 0x46                        -> 06eb:0046 [reloc]
  0aa3:070f  83c404           add sp, 4                                
  0aa3:0712  833e880800       cmp word ptr [0x888], 0                  
  0aa3:0717  753e             jne 0x757                                
  0aa3:0719  6a00             push 0                                   
  0aa3:071b  6a00             push 0                                   
  0aa3:071d  1e               push ds                                  
  0aa3:071e  689608           push 0x896                               
  0aa3:0721  ff368c09         push word ptr [0x98c]                    
  0aa3:0725  ff368809         push word ptr [0x988]                    
  0aa3:0729  a18208           mov ax, word ptr [0x882]                 
  0aa3:072c  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:0730  50               push ax                                  
  0aa3:0731  a18008           mov ax, word ptr [0x880]                 
  0aa3:0734  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:0738  25f8ff           and ax, 0xfff8                           
  0aa3:073b  50               push ax                                  
  0aa3:073c  1e               push ds                                  
  0aa3:073d  684c07           push 0x74c                               
  0aa3:0740  ff1ef615         lcall [0x15f6]                           
  0aa3:0744  83c414           add sp, 0x14                             
  0aa3:0747  ff368208         push word ptr [0x882]                    
  0aa3:074b  ff368008         push word ptr [0x880]                    
  0aa3:074f  90               nop                                      
  0aa3:0750  0e               push cs                                  
  0aa3:0751  e83d02           call 0x991                               -> 0aa3:0991
  0aa3:0754  83c404           add sp, 4                                
  0aa3:0757  5f               pop di                                   
  0aa3:0758  5e               pop si                                   
  0aa3:0759  c9               leave                                    
  0aa3:075a  cb               retf                                     
  0aa3:075b  833e900800       cmp word ptr [0x890], 0                  
  0aa3:0760  7402             je 0x764                                 
  0aa3:0762  eb44             jmp 0x7a8                                
  0aa3:0764  ff0e8808         dec word ptr [0x888]                     
  0aa3:0768  7f3e             jg 0x7a8                                 
  0aa3:076a  6a00             push 0                                   
  0aa3:076c  6a00             push 0                                   
  0aa3:076e  1e               push ds                                  
  0aa3:076f  689608           push 0x896                               
  0aa3:0772  ff368c09         push word ptr [0x98c]                    
  0aa3:0776  ff368809         push word ptr [0x988]                    
  0aa3:077a  a18208           mov ax, word ptr [0x882]                 
  0aa3:077d  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:0781  50               push ax                                  
  0aa3:0782  a18008           mov ax, word ptr [0x880]                 
  0aa3:0785  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:0789  25f8ff           and ax, 0xfff8                           
  0aa3:078c  50               push ax                                  
  0aa3:078d  1e               push ds                                  
  0aa3:078e  684c07           push 0x74c                               
  0aa3:0791  ff1ef615         lcall [0x15f6]                           
  0aa3:0795  83c414           add sp, 0x14                             
  0aa3:0798  ff368208         push word ptr [0x882]                    
  0aa3:079c  ff368008         push word ptr [0x880]                    
  0aa3:07a0  90               nop                                      
  0aa3:07a1  0e               push cs                                  
  0aa3:07a2  e8ec01           call 0x991                               -> 0aa3:0991
  0aa3:07a5  83c404           add sp, 4                                
  0aa3:07a8  cb               retf                                     
  0aa3:07a9  833e900800       cmp word ptr [0x890], 0                  
  0aa3:07ae  7402             je 0x7b2                                 
  0aa3:07b0  eb39             jmp 0x7eb                                
  0aa3:07b2  a18808           mov ax, word ptr [0x888]                 
  0aa3:07b5  ff068808         inc word ptr [0x888]                     
  0aa3:07b9  0bc0             or ax, ax                                
  0aa3:07bb  752e             jne 0x7eb                                
  0aa3:07bd  a18208           mov ax, word ptr [0x882]                 
  0aa3:07c0  2b06ca19         sub ax, word ptr [0x19ca]                
  0aa3:07c4  50               push ax                                  
  0aa3:07c5  a18008           mov ax, word ptr [0x880]                 
  0aa3:07c8  2b06cc19         sub ax, word ptr [0x19cc]                
  0aa3:07cc  25f8ff           and ax, 0xfff8                           
  0aa3:07cf  50               push ax                                  
  0aa3:07d0  1e               push ds                                  
  0aa3:07d1  684c07           push 0x74c                               
  0aa3:07d4  ff368c09         push word ptr [0x98c]                    
  0aa3:07d8  ff368809         push word ptr [0x988]                    
  0aa3:07dc  6a00             push 0                                   
  0aa3:07de  6a00             push 0                                   
  0aa3:07e0  1e               push ds                                  
  0aa3:07e1  689608           push 0x896                               
  0aa3:07e4  ff1ef615         lcall [0x15f6]                           
  0aa3:07e8  83c414           add sp, 0x14                             
  0aa3:07eb  cb               retf                                     

proc_0aa3_07ec:
  0aa3:07ec  55               push bp                                  
  0aa3:07ed  8bec             mov bp, sp                               
  0aa3:07ef  c45e06           les bx, ptr [bp + 6]                     
  0aa3:07f2  268b07           mov ax, word ptr es:[bx]                 
  0aa3:07f5  2b068809         sub ax, word ptr [0x988]                 
  0aa3:07f9  7d04             jge 0x7ff                                
  0aa3:07fb  33c0             xor ax, ax                               
  0aa3:07fd  eb0a             jmp 0x809                                
  0aa3:07ff  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0802  268b07           mov ax, word ptr es:[bx]                 
  0aa3:0805  2b068809         sub ax, word ptr [0x988]                 
  0aa3:0809  c45e06           les bx, ptr [bp + 6]                     
  0aa3:080c  268907           mov word ptr es:[bx], ax                 
  0aa3:080f  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0812  268b4702         mov ax, word ptr es:[bx + 2]             
  0aa3:0816  2b068c09         sub ax, word ptr [0x98c]                 
  0aa3:081a  7d04             jge 0x820                                
  0aa3:081c  33c0             xor ax, ax                               
  0aa3:081e  eb0b             jmp 0x82b                                
  0aa3:0820  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0823  268b4702         mov ax, word ptr es:[bx + 2]             
  0aa3:0827  2b068c09         sub ax, word ptr [0x98c]                 
  0aa3:082b  c45e06           les bx, ptr [bp + 6]                     
  0aa3:082e  26894702         mov word ptr es:[bx + 2], ax             
  0aa3:0832  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0835  a18809           mov ax, word ptr [0x988]                 
  0aa3:0838  26014704         add word ptr es:[bx + 4], ax             
  0aa3:083c  c45e06           les bx, ptr [bp + 6]                     
  0aa3:083f  a18c09           mov ax, word ptr [0x98c]                 
  0aa3:0842  26014706         add word ptr es:[bx + 6], ax             
  0aa3:0846  ff068e08         inc word ptr [0x88e]                     
  0aa3:084a  ff7608           push word ptr [bp + 8]                   
  0aa3:084d  ff7606           push word ptr [bp + 6]                   
  0aa3:0850  90               nop                                      
  0aa3:0851  0e               push cs                                  
  0aa3:0852  e86000           call 0x8b5                               -> 0aa3:08b5
  0aa3:0855  83c404           add sp, 4                                
  0aa3:0858  0bc0             or ax, ax                                
  0aa3:085a  740a             je 0x866                                 
  0aa3:085c  c70692080100     mov word ptr [0x892], 1                  
  0aa3:0862  0e               push cs                                  
  0aa3:0863  e843ff           call 0x7a9                               -> 0aa3:07a9
  0aa3:0866  c70690080100     mov word ptr [0x890], 1                  
  0aa3:086c  5d               pop bp                                   
  0aa3:086d  cb               retf                                     
  0aa3:086e  ff0e8e08         dec word ptr [0x88e]                     
  0aa3:0872  7f17             jg 0x88b                                 
  0aa3:0874  c70690080000     mov word ptr [0x890], 0                  
  0aa3:087a  833e920800       cmp word ptr [0x892], 0                  
  0aa3:087f  7404             je 0x885                                 
  0aa3:0881  0e               push cs                                  
  0aa3:0882  e8d6fe           call 0x75b                               -> 0aa3:075b
  0aa3:0885  c70692080000     mov word ptr [0x892], 0                  
  0aa3:088b  cb               retf                                     

proc_0aa3_088c:
  0aa3:088c  55               push bp                                  
  0aa3:088d  8bec             mov bp, sp                               
  0aa3:088f  833e8c0800       cmp word ptr [0x88c], 0                  
  0aa3:0894  741d             je 0x8b3                                 
  0aa3:0896  ff7608           push word ptr [bp + 8]                   
  0aa3:0899  ff7606           push word ptr [bp + 6]                   
  0aa3:089c  90               nop                                      
  0aa3:089d  0e               push cs                                  
  0aa3:089e  e81400           call 0x8b5                               -> 0aa3:08b5
  0aa3:08a1  83c404           add sp, 4                                
  0aa3:08a4  0bc0             or ax, ax                                
  0aa3:08a6  740b             je 0x8b3                                 
  0aa3:08a8  833e880800       cmp word ptr [0x888], 0                  
  0aa3:08ad  7404             je 0x8b3                                 
  0aa3:08af  0e               push cs                                  
  0aa3:08b0  e8f6fe           call 0x7a9                               -> 0aa3:07a9
  0aa3:08b3  5d               pop bp                                   
  0aa3:08b4  cb               retf                                     

proc_0aa3_08b5:
  0aa3:08b5  55               push bp                                  
  0aa3:08b6  8bec             mov bp, sp                               
  0aa3:08b8  56               push si                                  
  0aa3:08b9  c45e06           les bx, ptr [bp + 6]                     
  0aa3:08bc  268b4702         mov ax, word ptr es:[bx + 2]             
  0aa3:08c0  3b068208         cmp ax, word ptr [0x882]                 
  0aa3:08c4  7f3a             jg 0x900                                 
  0aa3:08c6  c45e06           les bx, ptr [bp + 6]                     
  0aa3:08c9  268b4702         mov ax, word ptr es:[bx + 2]             
  0aa3:08cd  c45e06           les bx, ptr [bp + 6]                     
  0aa3:08d0  26034706         add ax, word ptr es:[bx + 6]             
  0aa3:08d4  3b068208         cmp ax, word ptr [0x882]                 
  0aa3:08d8  7e26             jle 0x900                                
  0aa3:08da  c45e06           les bx, ptr [bp + 6]                     
  0aa3:08dd  268b07           mov ax, word ptr es:[bx]                 
  0aa3:08e0  3b068008         cmp ax, word ptr [0x880]                 
  0aa3:08e4  7f1a             jg 0x900                                 
  0aa3:08e6  c45e06           les bx, ptr [bp + 6]                     
  0aa3:08e9  06               push es                                  
  0aa3:08ea  c47606           les si, ptr [bp + 6]                     
  0aa3:08ed  268b04           mov ax, word ptr es:[si]                 
  0aa3:08f0  07               pop es                                   
  0aa3:08f1  26034704         add ax, word ptr es:[bx + 4]             
  0aa3:08f5  3b068008         cmp ax, word ptr [0x880]                 
  0aa3:08f9  7e05             jle 0x900                                
  0aa3:08fb  b80100           mov ax, 1                                
  0aa3:08fe  eb02             jmp 0x902                                
  0aa3:0900  33c0             xor ax, ax                               
  0aa3:0902  eb00             jmp 0x904                                
  0aa3:0904  5e               pop si                                   
  0aa3:0905  5d               pop bp                                   
  0aa3:0906  cb               retf                                     

proc_0aa3_0907:
  0aa3:0907  55               push bp                                  
  0aa3:0908  8bec             mov bp, sp                               
  0aa3:090a  c45e06           les bx, ptr [bp + 6]                     
  0aa3:090d  268b07           mov ax, word ptr es:[bx]                 
  0aa3:0910  3b068208         cmp ax, word ptr [0x882]                 
  0aa3:0914  7f2c             jg 0x942                                 
  0aa3:0916  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0919  268b4704         mov ax, word ptr es:[bx + 4]             
  0aa3:091d  3b068208         cmp ax, word ptr [0x882]                 
  0aa3:0921  7e1f             jle 0x942                                
  0aa3:0923  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0926  268b4702         mov ax, word ptr es:[bx + 2]             
  0aa3:092a  3b068008         cmp ax, word ptr [0x880]                 
  0aa3:092e  7f12             jg 0x942                                 
  0aa3:0930  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0933  268b4706         mov ax, word ptr es:[bx + 6]             
  0aa3:0937  3b068008         cmp ax, word ptr [0x880]                 
  0aa3:093b  7e05             jle 0x942                                
  0aa3:093d  b80100           mov ax, 1                                
  0aa3:0940  eb02             jmp 0x944                                
  0aa3:0942  33c0             xor ax, ax                               
  0aa3:0944  eb00             jmp 0x946                                
  0aa3:0946  5d               pop bp                                   
  0aa3:0947  cb               retf                                     
  0aa3:0948  c8040000         enter 4, 0                               
  0aa3:094c  833e8c0800       cmp word ptr [0x88c], 0                  
  0aa3:0951  7417             je 0x96a                                 
  0aa3:0953  16               push ss                                  
  0aa3:0954  8d46fc           lea ax, [bp - 4]                         
  0aa3:0957  50               push ax                                  
  0aa3:0958  16               push ss                                  
  0aa3:0959  8d46fe           lea ax, [bp - 2]                         
  0aa3:095c  50               push ax                                  
  0aa3:095d  9a0e00eb06       lcall 0x6eb, 0xe                         -> 06eb:000e [reloc]
  0aa3:0962  83c408           add sp, 8                                
  0aa3:0965  250700           and ax, 7                                
  0aa3:0968  eb02             jmp 0x96c                                
  0aa3:096a  33c0             xor ax, ax                               
  0aa3:096c  eb00             jmp 0x96e                                
  0aa3:096e  c9               leave                                    
  0aa3:096f  cb               retf                                     
  0aa3:0970  c8040000         enter 4, 0                               
  0aa3:0974  66c746fccc000000 mov dword ptr [bp - 4], 0xcc             
  0aa3:097c  c45efc           les bx, ptr [bp - 4]                     
  0aa3:097f  6626833f00       cmp dword ptr es:[bx], 0                 
  0aa3:0984  7405             je 0x98b                                 
  0aa3:0986  b80100           mov ax, 1                                
  0aa3:0989  eb02             jmp 0x98d                                
  0aa3:098b  33c0             xor ax, ax                               
  0aa3:098d  eb00             jmp 0x98f                                
  0aa3:098f  c9               leave                                    
  0aa3:0990  cb               retf                                     
  0aa3:0991  c8020000         enter 2, 0                               
  0aa3:0995  56               push si                                  
  0aa3:0996  57               push di                                  
  0aa3:0997  8b7e06           mov di, word ptr [bp + 6]                
  0aa3:099a  2b3ecc19         sub di, word ptr [0x19cc]                
  0aa3:099e  a1ca19           mov ax, word ptr [0x19ca]                
  0aa3:09a1  294608           sub word ptr [bp + 8], ax                
  0aa3:09a4  8b16d108         mov dx, word ptr [0x8d1]                 
  0aa3:09a8  83c208           add dx, 8                                
  0aa3:09ab  8bc7             mov ax, di                               
  0aa3:09ad  250700           and ax, 7                                
  0aa3:09b0  f7ea             imul dx                                  
  0aa3:09b2  8946fe           mov word ptr [bp - 2], ax                
  0aa3:09b5  66833e550900     cmp dword ptr [0x955], 0                 
  0aa3:09bb  7438             je 0x9f5                                 
  0aa3:09bd  f70680090a00     test word ptr [0x980], 0xa               
  0aa3:09c3  7530             jne 0x9f5                                
  0aa3:09c5  33f6             xor si, si                               
  0aa3:09c7  eb23             jmp 0x9ec                                
  0aa3:09c9  8bde             mov bx, si                               
  0aa3:09cb  c1e302           shl bx, 2                                
  0aa3:09ce  ffb75709         push word ptr [bx + 0x957]               
  0aa3:09d2  ffb75509         push word ptr [bx + 0x955]               
  0aa3:09d6  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0aa3:09db  83c404           add sp, 4                                
  0aa3:09de  8bde             mov bx, si                               
  0aa3:09e0  c1e302           shl bx, 2                                
  0aa3:09e3  89976709         mov word ptr [bx + 0x967], dx            
  0aa3:09e7  89876509         mov word ptr [bx + 0x965], ax            
  0aa3:09eb  46               inc si                                   
  0aa3:09ec  a07f09           mov al, byte ptr [0x97f]                 
  0aa3:09ef  b400             mov ah, 0                                
  0aa3:09f1  3bc6             cmp ax, si                               
  0aa3:09f3  7fd4             jg 0x9c9                                 
  0aa3:09f5  6a00             push 0                                   
  0aa3:09f7  ff76fe           push word ptr [bp - 2]                   
  0aa3:09fa  1e               push ds                                  
  0aa3:09fb  684b09           push 0x94b                               
  0aa3:09fe  ff7608           push word ptr [bp + 8]                   
  0aa3:0a01  8bc7             mov ax, di                               
  0aa3:0a03  25f8ff           and ax, 0xfff8                           
  0aa3:0a06  50               push ax                                  
  0aa3:0a07  1e               push ds                                  
  0aa3:0a08  684c07           push 0x74c                               
  0aa3:0a0b  ff368c09         push word ptr [0x98c]                    
  0aa3:0a0f  a18809           mov ax, word ptr [0x988]                 
  0aa3:0a12  050f00           add ax, 0xf                              
  0aa3:0a15  25f0ff           and ax, 0xfff0                           
  0aa3:0a18  50               push ax                                  
  0aa3:0a19  6a00             push 0                                   
  0aa3:0a1b  ff76fe           push word ptr [bp - 2]                   
  0aa3:0a1e  1e               push ds                                  
  0aa3:0a1f  68d508           push 0x8d5                               
  0aa3:0a22  ff1eea15         lcall [0x15ea]                           
  0aa3:0a26  83c41c           add sp, 0x1c                             
  0aa3:0a29  5f               pop di                                   
  0aa3:0a2a  5e               pop si                                   
  0aa3:0a2b  c9               leave                                    
  0aa3:0a2c  cb               retf                                     
  0aa3:0a2d  1e               push ds                                  
  0aa3:0a2e  689608           push 0x896                               
  0aa3:0a31  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0aa3:0a36  83c404           add sp, 4                                
  0aa3:0a39  cb               retf                                     

proc_0aa3_0a3a:
  0aa3:0a3a  55               push bp                                  
  0aa3:0a3b  8bec             mov bp, sp                               
  0aa3:0a3d  56               push si                                  
  0aa3:0a3e  57               push di                                  
  0aa3:0a3f  8b760a           mov si, word ptr [bp + 0xa]              
  0aa3:0a42  8b7e0c           mov di, word ptr [bp + 0xc]              
  0aa3:0a45  66837e0600       cmp dword ptr [bp + 6], 0                
  0aa3:0a4a  7413             je 0xa5f                                 
  0aa3:0a4c  ff7608           push word ptr [bp + 8]                   
  0aa3:0a4f  ff7606           push word ptr [bp + 6]                   
  0aa3:0a52  0e               push cs                                  
  0aa3:0a53  e85ffe           call 0x8b5                               -> 0aa3:08b5
  0aa3:0a56  83c404           add sp, 4                                
  0aa3:0a59  0bc0             or ax, ax                                
  0aa3:0a5b  7402             je 0xa5f                                 
  0aa3:0a5d  eb5e             jmp 0xabd                                
  0aa3:0a5f  1e               push ds                                  
  0aa3:0a60  688208           push 0x882                               
  0aa3:0a63  1e               push ds                                  
  0aa3:0a64  688008           push 0x880                               
  0aa3:0a67  90               nop                                      
  0aa3:0a68  0e               push cs                                  
  0aa3:0a69  e85500           call 0xac1                               -> 0aa3:0ac1
  0aa3:0a6c  83c408           add sp, 8                                
  0aa3:0a6f  c41e0908         les bx, ptr [0x809]                      
  0aa3:0a73  8bc6             mov ax, si                               
  0aa3:0a75  03069209         add ax, word ptr [0x992]                 
  0aa3:0a79  26394704         cmp word ptr es:[bx + 4], ax             
  0aa3:0a7d  7d0e             jge 0xa8d                                
  0aa3:0a7f  c41e0908         les bx, ptr [0x809]                      
  0aa3:0a83  268b4704         mov ax, word ptr es:[bx + 4]             
  0aa3:0a87  2b069209         sub ax, word ptr [0x992]                 
  0aa3:0a8b  8bf0             mov si, ax                               
  0aa3:0a8d  c41e0908         les bx, ptr [0x809]                      
  0aa3:0a91  8bc7             mov ax, di                               
  0aa3:0a93  03069409         add ax, word ptr [0x994]                 
  0aa3:0a97  26394706         cmp word ptr es:[bx + 6], ax             
  0aa3:0a9b  7d0e             jge 0xaab                                
  0aa3:0a9d  c41e0908         les bx, ptr [0x809]                      
  0aa3:0aa1  268b4706         mov ax, word ptr es:[bx + 6]             
  0aa3:0aa5  2b069409         sub ax, word ptr [0x994]                 
  0aa3:0aa9  8bf8             mov di, ax                               
  0aa3:0aab  0e               push cs                                  
  0aa3:0aac  e8fafc           call 0x7a9                               -> 0aa3:07a9
  0aa3:0aaf  57               push di                                  
  0aa3:0ab0  56               push si                                  
  0aa3:0ab1  9a4600eb06       lcall 0x6eb, 0x46                        -> 06eb:0046 [reloc]
  0aa3:0ab6  83c404           add sp, 4                                
  0aa3:0ab9  0e               push cs                                  
  0aa3:0aba  e89efc           call 0x75b                               -> 0aa3:075b
  0aa3:0abd  5f               pop di                                   
  0aa3:0abe  5e               pop si                                   
  0aa3:0abf  5d               pop bp                                   
  0aa3:0ac0  cb               retf                                     

proc_0aa3_0ac1:
  0aa3:0ac1  55               push bp                                  
  0aa3:0ac2  8bec             mov bp, sp                               
  0aa3:0ac4  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0ac7  a18008           mov ax, word ptr [0x880]                 
  0aa3:0aca  268907           mov word ptr es:[bx], ax                 
  0aa3:0acd  c45e0a           les bx, ptr [bp + 0xa]                   
  0aa3:0ad0  a18208           mov ax, word ptr [0x882]                 
  0aa3:0ad3  268907           mov word ptr es:[bx], ax                 
  0aa3:0ad6  5d               pop bp                                   
  0aa3:0ad7  cb               retf                                     

proc_0aa3_0ad8:
  0aa3:0ad8  55               push bp                                  
  0aa3:0ad9  8bec             mov bp, sp                               
  0aa3:0adb  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0ade  a18008           mov ax, word ptr [0x880]                 
  0aa3:0ae1  268907           mov word ptr es:[bx], ax                 
  0aa3:0ae4  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0ae7  a18208           mov ax, word ptr [0x882]                 
  0aa3:0aea  26894702         mov word ptr es:[bx + 2], ax             
  0aa3:0aee  8b5608           mov dx, word ptr [bp + 8]                
  0aa3:0af1  8b4606           mov ax, word ptr [bp + 6]                
  0aa3:0af4  eb00             jmp 0xaf6                                
  0aa3:0af6  5d               pop bp                                   
  0aa3:0af7  cb               retf                                     

proc_0aa3_0af8:
  0aa3:0af8  55               push bp                                  
  0aa3:0af9  8bec             mov bp, sp                               
  0aa3:0afb  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0afe  a18008           mov ax, word ptr [0x880]                 
  0aa3:0b01  268907           mov word ptr es:[bx], ax                 
  0aa3:0b04  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0b07  a18208           mov ax, word ptr [0x882]                 
  0aa3:0b0a  26894702         mov word ptr es:[bx + 2], ax             
  0aa3:0b0e  5d               pop bp                                   
  0aa3:0b0f  cb               retf                                     

proc_0aa3_0b10:
  0aa3:0b10  55               push bp                                  
  0aa3:0b11  8bec             mov bp, sp                               
  0aa3:0b13  9a5600eb06       lcall 0x6eb, 0x56                        -> 06eb:0056 [reloc]
  0aa3:0b18  c45e06           les bx, ptr [bp + 6]                     
  0aa3:0b1b  a17c08           mov ax, word ptr [0x87c]                 
  0aa3:0b1e  268907           mov word ptr es:[bx], ax                 
  0aa3:0b21  c45e0a           les bx, ptr [bp + 0xa]                   
  0aa3:0b24  a17e08           mov ax, word ptr [0x87e]                 
  0aa3:0b27  268907           mov word ptr es:[bx], ax                 
  0aa3:0b2a  eb00             jmp 0xb2c                                
  0aa3:0b2c  5d               pop bp                                   
  0aa3:0b2d  cb               retf                                     
  0aa3:0b2e  8cda             mov dx, ds                               
