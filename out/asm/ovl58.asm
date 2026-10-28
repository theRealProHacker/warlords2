; ovl58 stub 30ba file_off 0x73b40 size 0xefe

ovl58_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  8b               db 8b                                    resync
ovl58_0005:  ; case
  0005  7606             jbe 0xd                                  
  0007  833eee           db 833eee                                resync
ovl58_000a:  ; case
  000a  0b00             or ax, word ptr [bx + si]                
  000c  7503             jne 0x11                                 
  000e  e9               db e9                                    resync
ovl58_000f:  ; case
  000f  6d               insw word ptr es:[di], dx                
  0010  013b             add word ptr [bp + di], di               
  0012  3632             db 3632                                  resync
ovl58_0014:  ; case
  0014  267511           jne 0x28                                 
  0017  9aa8             db 9aa8                                  resync
ovl58_0019:  ; case
  0019  045e             add al, 0x5e                             
  001b  150ac0           adc ax, 0xc00a                           
ovl58_001e:  ; case
  001e  7403             je 0x23                                  
  0020  e95b01           jmp 0x17e                                
ovl58_0023:  ; case
  0023  9a0b045e15       lcall 0x155e, 0x40b                      -> 155e:040b
  0028  89363226         mov word ptr [0x2632], si                
  002c  9aa8045e15       lcall 0x155e, 0x4a8                      -> 155e:04a8
  0031  0ac0             or al, al                                
  0033  740a             je 0x3f                                  
  0035  9a66045e15       lcall 0x155e, 0x466                      -> 155e:0466
  003a  9a0b045e15       lcall 0x155e, 0x40b                      -> 155e:040b
  003f  0bf6             or si, si                                
  0041  7531             jne 0x74                                 
  0043  666a08           push 8                                   
  0046  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  004b  83c404           add sp, 4                                
  004e  52               push dx                                  
  004f  50               push ax                                  
  0050  666a07           push 7                                   
  0053  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0058  83c404           add sp, 4                                
  005b  52               push dx                                  
  005c  50               push ax                                  
  005d  9a2f035e15       lcall 0x155e, 0x32f                      -> 155e:032f
  0062  83c408           add sp, 8                                
  0065  6a01             push 1                                   
  0067  6a00             push 0                                   
  0069  9a12045e15       lcall 0x155e, 0x412                      -> 155e:0412
  006e  83c404           add sp, 4                                
  0071  e90a01           jmp 0x17e                                
  0074  83fe03           cmp si, 3                                
  0077  7508             jne 0x81                                 
  0079  66680900ffff     push 0xffff0009                          
  007f  ebc5             jmp 0x46                                 
  0081  83fe01           cmp si, 1                                
  0084  7508             jne 0x8e                                 
  0086  66680a00ffff     push 0xffff000a                          
  008c  ebb8             jmp 0x46                                 
  008e  83fe02           cmp si, 2                                
  0091  7403             je 0x96                                  
  0093  e98a00           jmp 0x120                                
  0096  b90100           mov cx, 1                                
  0099  33d2             xor dx, dx                               
  009b  eb27             jmp 0xc4                                 
  009d  8bda             mov bx, dx                               
  009f  d1e3             shl bx, 1                                
  00a1  b8042c           mov ax, 0x2c04                           
  00a4  8ec0             mov es, ax                               
  00a6  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00ac  7415             je 0xc3                                  
  00ae  8bda             mov bx, dx                               
  00b0  d1e3             shl bx, 1                                
  00b2  b8042c           mov ax, 0x2c04                           
  00b5  8ec0             mov es, ax                               
  00b7  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  00bd  7504             jne 0xc3                                 
  00bf  33c9             xor cx, cx                               
  00c1  eb06             jmp 0xc9                                 
  00c3  42               inc dx                                   
  00c4  83fa08           cmp dx, 8                                
  00c7  7cd4             jl 0x9d                                  
  00c9  0bc9             or cx, cx                                
  00cb  7429             je 0xf6                                  
  00cd  666a64           push 0x64                                
  00d0  6a01             push 1                                   
  00d2  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00d7  83c406           add sp, 6                                
  00da  8bd0             mov dx, ax                               
  00dc  83fa06           cmp dx, 6                                
  00df  7d08             jge 0xe9                                 
  00e1  66680c00ffff     push 0xffff000c                          
  00e7  eb13             jmp 0xfc                                 
  00e9  83fa35           cmp dx, 0x35                             
  00ec  7c08             jl 0xf6                                  
  00ee  66680a00ffff     push 0xffff000a                          
  00f4  eb06             jmp 0xfc                                 
  00f6  66680b00ffff     push 0xffff000b                          
  00fc  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0101  83c404           add sp, 4                                
  0104  52               push dx                                  
  0105  50               push ax                                  
  0106  666a07           push 7                                   
  0109  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  010e  83c404           add sp, 4                                
  0111  52               push dx                                  
  0112  50               push ax                                  
  0113  9a2f035e15       lcall 0x155e, 0x32f                      -> 155e:032f
  0118  83c408           add sp, 8                                
  011b  6a00             push 0                                   
  011d  e947ff           jmp 0x67                                 
  0120  83fe04           cmp si, 4                                
  0123  7506             jne 0x12b                                
  0125  666a0c           push 0xc                                 
  0128  e91bff           jmp 0x46                                 
  012b  83fe05           cmp si, 5                                
  012e  7509             jne 0x139                                
  0130  66680d00ffff     push 0xffff000d                          
  0136  e90dff           jmp 0x46                                 
  0139  83fe06           cmp si, 6                                
  013c  7509             jne 0x147                                
  013e  66680e00ffff     push 0xffff000e                          
  0144  e9fffe           jmp 0x46                                 
  0147  83fe07           cmp si, 7                                
  014a  7506             jne 0x152                                
  014c  666a0f           push 0xf                                 
  014f  e9f4fe           jmp 0x46                                 
  0152  83fe08           cmp si, 8                                
  0155  7506             jne 0x15d                                
  0157  666a10           push 0x10                                
  015a  e9e9fe           jmp 0x46                                 
  015d  83fe09           cmp si, 9                                
  0160  7506             jne 0x168                                
  0162  666a11           push 0x11                                
  0165  e9defe           jmp 0x46                                 
  0168  83fe0a           cmp si, 0xa                              
  016b  7506             jne 0x173                                
  016d  666a12           push 0x12                                
  0170  e9d3fe           jmp 0x46                                 
  0173  83fe0b           cmp si, 0xb                              
  0176  7506             jne 0x17e                                
  0178  666a13           push 0x13                                
  017b  e9c8fe           jmp 0x46                                 
  017e  5e               pop si                                   
  017f  5d               pop bp                                   
  0180  cb               retf                                     

ovl58_0181:  ; ENTRY
  0181  55               push bp                                  
  0182  8bec             mov bp, sp                               
  0184  833eec0b00       cmp word ptr [0xbec], 0                  
  0189  741c             je 0x1a7                                 
  018b  837e0600         cmp word ptr [bp + 6], 0                 
  018f  7508             jne 0x199                                
  0191  6a00             push 0                                   
  0193  ff367459         push word ptr [0x5974]                   
  0197  eb06             jmp 0x19f                                
  0199  6a00             push 0                                   
  019b  ff367e59         push word ptr [0x597e]                   
  019f  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  01a4  83c404           add sp, 4                                
  01a7  5d               pop bp                                   
  01a8  cb               retf                                     

ovl58_01a9:  ; ENTRY
  01a9  55               push bp                                  
  01aa  8bec             mov bp, sp                               
  01ac  833eec0b00       cmp word ptr [0xbec], 0                  
  01b1  7451             je 0x204                                 
  01b3  837e0600         cmp word ptr [bp + 6], 0                 
  01b7  751d             jne 0x1d6                                
  01b9  666a25           push 0x25                                
  01bc  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  01c1  83c404           add sp, 4                                
  01c4  52               push dx                                  
  01c5  50               push ax                                  
  01c6  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  01cb  83c404           add sp, 4                                
  01ce  8bd0             mov dx, ax                               
  01d0  0bd2             or dx, dx                                
  01d2  7c30             jl 0x204                                 
  01d4  eb1e             jmp 0x1f4                                
  01d6  666825000100     push 0x10025                             
  01dc  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  01e1  83c404           add sp, 4                                
  01e4  52               push dx                                  
  01e5  50               push ax                                  
  01e6  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  01eb  83c404           add sp, 4                                
  01ee  8bd0             mov dx, ax                               
  01f0  0bd2             or dx, dx                                
  01f2  7c10             jl 0x204                                 
  01f4  6a02             push 2                                   
  01f6  52               push dx                                  
  01f7  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  01fc  83c404           add sp, 4                                
  01ff  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  0204  5d               pop bp                                   
  0205  cb               retf                                     

ovl58_0206:  ; ENTRY
  0206  55               push bp                                  
  0207  8bec             mov bp, sp                               
  0209  833eec0b00       cmp word ptr [0xbec], 0                  
  020e  742b             je 0x23b                                 
  0210  666a26           push 0x26                                
  0213  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0218  83c404           add sp, 4                                
  021b  52               push dx                                  
  021c  50               push ax                                  
  021d  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0222  83c404           add sp, 4                                
  0225  8bd0             mov dx, ax                               
  0227  0bd2             or dx, dx                                
  0229  7c10             jl 0x23b                                 
  022b  6a02             push 2                                   
  022d  52               push dx                                  
  022e  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  0233  83c404           add sp, 4                                
  0236  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  023b  5d               pop bp                                   
  023c  cb               retf                                     

ovl58_023d:  ; ENTRY
  023d  55               push bp                                  
  023e  8bec             mov bp, sp                               
  0240  833eec0b00       cmp word ptr [0xbec], 0                  
  0245  7426             je 0x26d                                 
  0247  666a27           push 0x27                                
  024a  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  024f  83c404           add sp, 4                                
  0252  52               push dx                                  
  0253  50               push ax                                  
  0254  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0259  83c404           add sp, 4                                
  025c  8bd0             mov dx, ax                               
  025e  0bd2             or dx, dx                                
  0260  7c0b             jl 0x26d                                 
  0262  6a02             push 2                                   
  0264  52               push dx                                  
  0265  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  026a  83c404           add sp, 4                                
  026d  5d               pop bp                                   
  026e  cb               retf                                     

ovl58_026f:  ; ENTRY
  026f  55               push bp                                  
  0270  8bec             mov bp, sp                               
  0272  83ec78           sub sp, 0x78                             
  0275  56               push si                                  
  0276  57               push di                                  
  0277  c746fe9800       mov word ptr [bp - 2], 0x98              
  027c  c746fc0f00       mov word ptr [bp - 4], 0xf               
  0281  bf6001           mov di, 0x160                            
  0284  c746faba01       mov word ptr [bp - 6], 0x1ba             
  0289  c746f8ba01       mov word ptr [bp - 8], 0x1ba             
  028e  c746dc2800       mov word ptr [bp - 0x24], 0x28           
  0293  833ec82600       cmp word ptr [0x26c8], 0                 
  0298  7403             je 0x29d                                 
  029a  e97608           jmp 0xb13                                
  029d  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  02a2  837e0605         cmp word ptr [bp + 6], 5                 
  02a6  7403             je 0x2ab                                 
  02a8  e97004           jmp 0x71b                                
  02ab  b8042c           mov ax, 0x2c04                           
  02ae  8ec0             mov es, ax                               
  02b0  268b1e1001       mov bx, word ptr es:[0x110]              
  02b5  d1e3             shl bx, 1                                
  02b7  83bfea5d28       cmp word ptr [bx + 0x5dea], 0x28         
  02bc  7c03             jl 0x2c1                                 
  02be  e95208           jmp 0xb13                                
  02c1  33f6             xor si, si                               
  02c3  8ec0             mov es, ax                               
  02c5  268b0e8101       mov cx, word ptr es:[0x181]              
  02ca  eb2f             jmp 0x2fb                                
  02cc  8bd9             mov bx, cx                               
  02ce  6bdb16           imul bx, bx, 0x16                        
  02d1  b81d1e           mov ax, 0x1e1d                           
  02d4  8ec0             mov es, ax                               
  02d6  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  02dc  751d             jne 0x2fb                                
  02de  8bd9             mov bx, cx                               
  02e0  6bdb16           imul bx, bx, 0x16                        
  02e3  b81d1e           mov ax, 0x1e1d                           
  02e6  8ec0             mov es, ax                               
  02e8  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  02ed  98               cwde                                     
  02ee  ba042c           mov dx, 0x2c04                           
  02f1  8ec2             mov es, dx                               
  02f3  263b061001       cmp ax, word ptr es:[0x110]              
  02f8  7501             jne 0x2fb                                
  02fa  46               inc si                                   
  02fb  8bc1             mov ax, cx                               
  02fd  49               dec cx                                   
  02fe  0bc0             or ax, ax                                
  0300  75ca             jne 0x2cc                                
  0302  b8042c           mov ax, 0x2c04                           
  0305  8ec0             mov es, ax                               
  0307  268b1e1001       mov bx, word ptr es:[0x110]              
  030c  b8042c           mov ax, 0x2c04                           
  030f  8ec0             mov es, ax                               
  0311  2680bf000102     cmp byte ptr es:[bx + 0x100], 2          
  0317  751d             jne 0x336                                
  0319  b8042c           mov ax, 0x2c04                           
  031c  8ec0             mov es, ax                               
  031e  b8042c           mov ax, 0x2c04                           
  0321  8ec0             mov es, ax                               
  0323  268a870801       mov al, byte ptr es:[bx + 0x108]         
  0328  98               cwde                                     
  0329  ba042c           mov dx, 0x2c04                           
  032c  8ec2             mov es, dx                               
  032e  d1e3             shl bx, 1                                
  0330  3b87ea5d         cmp ax, word ptr [bx + 0x5dea]           
  0334  7f3a             jg 0x370                                 
  0336  b8042c           mov ax, 0x2c04                           
  0339  8ec0             mov es, ax                               
  033b  268b1e1001       mov bx, word ptr es:[0x110]              
  0340  b8042c           mov ax, 0x2c04                           
  0343  8ec0             mov es, ax                               
  0345  2680bf000102     cmp byte ptr es:[bx + 0x100], 2          
  034b  7503             jne 0x350                                
  034d  e94301           jmp 0x493                                
  0350  b8042c           mov ax, 0x2c04                           
  0353  8ec0             mov es, ax                               
  0355  b8042c           mov ax, 0x2c04                           
  0358  8ec0             mov es, ax                               
  035a  268a870801       mov al, byte ptr es:[bx + 0x108]         
  035f  98               cwde                                     
  0360  ba042c           mov dx, 0x2c04                           
  0363  8ec2             mov es, dx                               
  0365  d1e3             shl bx, 1                                
  0367  3b87ea5d         cmp ax, word ptr [bx + 0x5dea]           
  036b  7f03             jg 0x370                                 
  036d  e92301           jmp 0x493                                
  0370  b8042c           mov ax, 0x2c04                           
  0373  8ec0             mov es, ax                               
  0375  268b1e1001       mov bx, word ptr es:[0x110]              
  037a  d1e3             shl bx, 1                                
  037c  8b87ea5d         mov ax, word ptr [bx + 0x5dea]           
  0380  bb0500           mov bx, 5                                
  0383  99               cdq                                      
  0384  f7fb             idiv bx                                  
  0386  6bc005           imul ax, ax, 5                           
  0389  8946de           mov word ptr [bp - 0x22], ax             
  038c  b8042c           mov ax, 0x2c04                           
  038f  8ec0             mov es, ax                               
  0391  268b1e1001       mov bx, word ptr es:[0x110]              
  0396  b8042c           mov ax, 0x2c04                           
  0399  8ec0             mov es, ax                               
  039b  26c687000102     mov byte ptr es:[bx + 0x100], 2          
  03a1  b8042c           mov ax, 0x2c04                           
  03a4  8ec0             mov es, ax                               
  03a6  b8042c           mov ax, 0x2c04                           
  03a9  8a56de           mov dl, byte ptr [bp - 0x22]             
  03ac  8ec0             mov es, ax                               
  03ae  2688970801       mov byte ptr es:[bx + 0x108], dl         
  03b3  8b46de           mov ax, word ptr [bp - 0x22]             
  03b6  050500           add ax, 5                                
  03b9  8946da           mov word ptr [bp - 0x26], ax             
  03bc  b90600           mov cx, 6                                
  03bf  bb3b0b           mov bx, 0xb3b                            
  03c2  2e8b07           mov ax, word ptr cs:[bx]                 
  03c5  3b46da           cmp ax, word ptr [bp - 0x26]             
  03c8  7408             je 0x3d2                                 
  03ca  83c302           add bx, 2                                
  03cd  e2f3             loop 0x3c2                                ; "%d, %d"
  03cf  e9a800           jmp 0x47a                                
  03d2  2eff670c         jmp word ptr cs:[bx + 0xc]               
ovl58_03d6:  ; case
  03d6  833ea43700       cmp word ptr [0x37a4], 0                 
  03db  7420             je 0x3fd                                 
  03dd  66682800ffff     push 0xffff0028                          
  03e3  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  03e8  83c404           add sp, 4                                
  03eb  52               push dx                                  
  03ec  50               push ax                                  
  03ed  16               push ss                                  
  03ee  8d4688           lea ax, [bp - 0x78]                      
  03f1  50               push ax                                  
  03f2  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  03f7  83c408           add sp, 8                                
  03fa  e91103           jmp 0x70e                                
  03fd  66684600ffff     push 0xffff0046                          
  0403  ebde             jmp 0x3e3                                
ovl58_0405:  ; case
  0405  833ea43700       cmp word ptr [0x37a4], 0                 
  040a  7408             je 0x414                                 
  040c  66682900ffff     push 0xffff0029                          
  0412  ebcf             jmp 0x3e3                                
  0414  66684700ffff     push 0xffff0047                          
  041a  ebc7             jmp 0x3e3                                
ovl58_041c:  ; case
  041c  833ea43700       cmp word ptr [0x37a4], 0                 
  0421  7408             je 0x42b                                 
  0423  66682a00ffff     push 0xffff002a                          
  0429  ebb8             jmp 0x3e3                                
  042b  66684800ffff     push 0xffff0048                          
  0431  ebb0             jmp 0x3e3                                
ovl58_0433:  ; case
  0433  833ea43700       cmp word ptr [0x37a4], 0                 
  0438  7408             je 0x442                                 
  043a  66682b00ffff     push 0xffff002b                          
  0440  eba1             jmp 0x3e3                                
  0442  66684900ffff     push 0xffff0049                          
  0448  eb99             jmp 0x3e3                                
ovl58_044a:  ; case
  044a  833ea43700       cmp word ptr [0x37a4], 0                 
  044f  7408             je 0x459                                 
  0451  66682c00ffff     push 0xffff002c                          
  0457  eb8a             jmp 0x3e3                                
  0459  66684a00ffff     push 0xffff004a                          
  045f  eb82             jmp 0x3e3                                
ovl58_0461:  ; case
  0461  833ea43700       cmp word ptr [0x37a4], 0                 
  0466  7409             je 0x471                                 
  0468  66682d00ffff     push 0xffff002d                          
  046e  e972ff           jmp 0x3e3                                
  0471  66684b00ffff     push 0xffff004b                          
  0477  e969ff           jmp 0x3e3                                
  047a  833ea43700       cmp word ptr [0x37a4], 0                 
  047f  7409             je 0x48a                                 
  0481  66682e00ffff     push 0xffff002e                          
  0487  e959ff           jmp 0x3e3                                
  048a  66684c00ffff     push 0xffff004c                          
  0490  e950ff           jmp 0x3e3                                
  0493  b8042c           mov ax, 0x2c04                           
  0496  8ec0             mov es, ax                               
  0498  268b1e1001       mov bx, word ptr es:[0x110]              
  049d  b8042c           mov ax, 0x2c04                           
  04a0  8ec0             mov es, ax                               
  04a2  2680bf000102     cmp byte ptr es:[bx + 0x100], 2          
  04a8  7520             jne 0x4ca                                
  04aa  b8042c           mov ax, 0x2c04                           
  04ad  8ec0             mov es, ax                               
  04af  b8042c           mov ax, 0x2c04                           
  04b2  8ec0             mov es, ax                               
  04b4  268a870801       mov al, byte ptr es:[bx + 0x108]         
  04b9  98               cwde                                     
  04ba  050500           add ax, 5                                
  04bd  ba042c           mov dx, 0x2c04                           
  04c0  8ec2             mov es, dx                               
  04c2  d1e3             shl bx, 1                                
  04c4  3b87ea5d         cmp ax, word ptr [bx + 0x5dea]           
  04c8  7e3d             jle 0x507                                
  04ca  b8042c           mov ax, 0x2c04                           
  04cd  8ec0             mov es, ax                               
  04cf  268b1e1001       mov bx, word ptr es:[0x110]              
  04d4  b8042c           mov ax, 0x2c04                           
  04d7  8ec0             mov es, ax                               
  04d9  2680bf000102     cmp byte ptr es:[bx + 0x100], 2          
  04df  7503             jne 0x4e4                                
  04e1  e93501           jmp 0x619                                
  04e4  b8042c           mov ax, 0x2c04                           
  04e7  8ec0             mov es, ax                               
  04e9  b8042c           mov ax, 0x2c04                           
  04ec  8ec0             mov es, ax                               
  04ee  268a870801       mov al, byte ptr es:[bx + 0x108]         
  04f3  98               cwde                                     
  04f4  050500           add ax, 5                                
  04f7  ba042c           mov dx, 0x2c04                           
  04fa  8ec2             mov es, dx                               
  04fc  d1e3             shl bx, 1                                
  04fe  3b87ea5d         cmp ax, word ptr [bx + 0x5dea]           
  0502  7e03             jle 0x507                                
  0504  e91201           jmp 0x619                                
  0507  b8042c           mov ax, 0x2c04                           
  050a  8ec0             mov es, ax                               
  050c  268b1e1001       mov bx, word ptr es:[0x110]              
  0511  d1e3             shl bx, 1                                
  0513  8b87ea5d         mov ax, word ptr [bx + 0x5dea]           
  0517  bb0500           mov bx, 5                                
  051a  99               cdq                                      
  051b  f7fb             idiv bx                                  
  051d  6bc005           imul ax, ax, 5                           
  0520  8946de           mov word ptr [bp - 0x22], ax             
  0523  b8042c           mov ax, 0x2c04                           
  0526  8ec0             mov es, ax                               
  0528  268b1e1001       mov bx, word ptr es:[0x110]              
  052d  b8042c           mov ax, 0x2c04                           
  0530  8ec0             mov es, ax                               
  0532  26c687000101     mov byte ptr es:[bx + 0x100], 1          
  0538  b8042c           mov ax, 0x2c04                           
  053b  8ec0             mov es, ax                               
  053d  b8042c           mov ax, 0x2c04                           
  0540  8a56de           mov dl, byte ptr [bp - 0x22]             
  0543  8ec0             mov es, ax                               
  0545  2688970801       mov byte ptr es:[bx + 0x108], dl         
  054a  8b46de           mov ax, word ptr [bp - 0x22]             
  054d  8946d8           mov word ptr [bp - 0x28], ax             
  0550  b90600           mov cx, 6                                
  0553  bb230b           mov bx, 0xb23                            
  0556  2e8b07           mov ax, word ptr cs:[bx]                 
  0559  3b46d8           cmp ax, word ptr [bp - 0x28]             
  055c  7408             je 0x566                                 
  055e  83c302           add bx, 2                                
  0561  e2f3             loop 0x556                               
  0563  e99a00           jmp 0x600                                
  0566  2eff670c         jmp word ptr cs:[bx + 0xc]               
ovl58_056a:  ; case
  056a  833ea43700       cmp word ptr [0x37a4], 0                 
  056f  7409             je 0x57a                                 
  0571  66683500ffff     push 0xffff0035                          
  0577  e969fe           jmp 0x3e3                                
  057a  66685300ffff     push 0xffff0053                          
  0580  e960fe           jmp 0x3e3                                
ovl58_0583:  ; case
  0583  833ea43700       cmp word ptr [0x37a4], 0                 
  0588  7409             je 0x593                                 
  058a  66683400ffff     push 0xffff0034                          
  0590  e950fe           jmp 0x3e3                                
  0593  66685200ffff     push 0xffff0052                          
  0599  e947fe           jmp 0x3e3                                
ovl58_059c:  ; case
  059c  833ea43700       cmp word ptr [0x37a4], 0                 
  05a1  7409             je 0x5ac                                 
  05a3  66683300ffff     push 0xffff0033                          
  05a9  e937fe           jmp 0x3e3                                
  05ac  66685100ffff     push 0xffff0051                          
  05b2  e92efe           jmp 0x3e3                                
ovl58_05b5:  ; case
  05b5  833ea43700       cmp word ptr [0x37a4], 0                 
  05ba  7409             je 0x5c5                                 
  05bc  66683200ffff     push 0xffff0032                          
  05c2  e91efe           jmp 0x3e3                                
  05c5  66685000ffff     push 0xffff0050                          
  05cb  e915fe           jmp 0x3e3                                
ovl58_05ce:  ; case
  05ce  833ea43700       cmp word ptr [0x37a4], 0                 
  05d3  7409             je 0x5de                                 
  05d5  66683100ffff     push 0xffff0031                          
  05db  e905fe           jmp 0x3e3                                
  05de  66684f00ffff     push 0xffff004f                          
  05e4  e9fcfd           jmp 0x3e3                                
ovl58_05e7:  ; case
  05e7  833ea43700       cmp word ptr [0x37a4], 0                 
  05ec  7409             je 0x5f7                                 
  05ee  66683000ffff     push 0xffff0030                          
  05f4  e9ecfd           jmp 0x3e3                                
  05f7  66684e00ffff     push 0xffff004e                          
  05fd  e9e3fd           jmp 0x3e3                                
  0600  833ea43700       cmp word ptr [0x37a4], 0                 
  0605  7409             je 0x610                                 
  0607  66682f00ffff     push 0xffff002f                          
  060d  e9d3fd           jmp 0x3e3                                
  0610  66684d00ffff     push 0xffff004d                          
  0616  e9cafd           jmp 0x3e3                                
  0619  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  061e  bb0700           mov bx, 7                                
  0621  99               cdq                                      
  0622  f7fb             idiv bx                                  
  0624  0bd2             or dx, dx                                
  0626  7403             je 0x62b                                 
  0628  e9e804           jmp 0xb13                                
  062b  b8042c           mov ax, 0x2c04                           
  062e  8ec0             mov es, ax                               
  0630  268b1e1001       mov bx, word ptr es:[0x110]              
  0635  6bdb14           imul bx, bx, 0x14                        
  0638  b8042c           mov ax, 0x2c04                           
  063b  8ec0             mov es, ax                               
  063d  2683bf850164     cmp word ptr es:[bx + 0x185], 0x64       
  0643  7d19             jge 0x65e                                
  0645  833ea43700       cmp word ptr [0x37a4], 0                 
  064a  7409             je 0x655                                 
  064c  66683600ffff     push 0xffff0036                          
  0652  e98efd           jmp 0x3e3                                
  0655  66685400ffff     push 0xffff0054                          
  065b  e985fd           jmp 0x3e3                                
  065e  b8042c           mov ax, 0x2c04                           
  0661  8ec0             mov es, ax                               
  0663  268b1e1001       mov bx, word ptr es:[0x110]              
  0668  6bdb14           imul bx, bx, 0x14                        
  066b  b8042c           mov ax, 0x2c04                           
  066e  8ec0             mov es, ax                               
  0670  2681bf8501f00a   cmp word ptr es:[bx + 0x185], 0xaf0      
  0677  7e19             jle 0x692                                
  0679  833ea43700       cmp word ptr [0x37a4], 0                 
  067e  7409             je 0x689                                 
  0680  66683700ffff     push 0xffff0037                          
  0686  e95afd           jmp 0x3e3                                
  0689  66685500ffff     push 0xffff0055                          
  068f  e951fd           jmp 0x3e3                                
  0692  0bf6             or si, si                                
  0694  7f19             jg 0x6af                                 
  0696  833ea43700       cmp word ptr [0x37a4], 0                 
  069b  7409             je 0x6a6                                 
  069d  66683800ffff     push 0xffff0038                          
  06a3  e93dfd           jmp 0x3e3                                
  06a6  66685600ffff     push 0xffff0056                          
  06ac  e934fd           jmp 0x3e3                                
  06af  83fe05           cmp si, 5                                
  06b2  7c19             jl 0x6cd                                 
  06b4  833ea43700       cmp word ptr [0x37a4], 0                 
  06b9  7409             je 0x6c4                                 
  06bb  66683900ffff     push 0xffff0039                          
  06c1  e91ffd           jmp 0x3e3                                
  06c4  66685700ffff     push 0xffff0057                          
  06ca  e916fd           jmp 0x3e3                                
  06cd  666a05           push 5                                   
  06d0  6a01             push 1                                   
  06d2  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  06d7  83c406           add sp, 6                                
  06da  3d0100           cmp ax, 1                                
  06dd  7403             je 0x6e2                                 
  06df  e93104           jmp 0xb13                                
  06e2  833ea43700       cmp word ptr [0x37a4], 0                 
  06e7  7408             je 0x6f1                                 
  06e9  66683a00ffff     push 0xffff003a                          
  06ef  eb06             jmp 0x6f7                                
  06f1  66685800ffff     push 0xffff0058                          
  06f7  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  06fc  83c404           add sp, 4                                
  06ff  52               push dx                                  
  0700  50               push ax                                  
  0701  16               push ss                                  
  0702  8d4688           lea ax, [bp - 0x78]                      
  0705  50               push ax                                  
  0706  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  070b  e9e9fc           jmp 0x3f7                                
  070e  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0713  3d0100           cmp ax, 1                                
  0716  7503             jne 0x71b                                
  0718  e9f803           jmp 0xb13                                
  071b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0720  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  0725  ff76f8           push word ptr [bp - 8]                   
  0728  57               push di                                  
  0729  666a00           push 0                                   
  072c  16               push ss                                  
  072d  8d46f0           lea ax, [bp - 0x10]                      
  0730  50               push ax                                  
  0731  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0736  83c40c           add sp, 0xc                              
  0739  ff76fc           push word ptr [bp - 4]                   
  073c  ff76fe           push word ptr [bp - 2]                   
  073f  16               push ss                                  
  0740  8d46e4           lea ax, [bp - 0x1c]                      
  0743  50               push ax                                  
  0744  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0749  83c408           add sp, 8                                
  074c  ff76fa           push word ptr [bp - 6]                   
  074f  57               push di                                  
  0750  1e               push ds                                  
  0751  683426           push 0x2634                              
  0754  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0759  83c408           add sp, 8                                
  075c  0bc0             or ax, ax                                
  075e  7503             jne 0x763                                
  0760  e9b003           jmp 0xb13                                
  0763  66833e3e2600     cmp dword ptr [0x263e], 0                
  0769  7435             je 0x7a0                                 
  076b  f70669260a00     test word ptr [0x2669], 0xa              
  0771  752d             jne 0x7a0                                
  0773  33f6             xor si, si                               
  0775  eb20             jmp 0x797                                
  0777  8bde             mov bx, si                               
  0779  c1e302           shl bx, 2                                
  077c  66ffb73e26       push dword ptr [bx + 0x263e]             
  0781  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0786  83c404           add sp, 4                                
  0789  8bde             mov bx, si                               
  078b  c1e302           shl bx, 2                                
  078e  89975026         mov word ptr [bx + 0x2650], dx           
  0792  89874e26         mov word ptr [bx + 0x264e], ax           
  0796  46               inc si                                   
  0797  a06826           mov al, byte ptr [0x2668]                
  079a  b400             mov ah, 0                                
  079c  3bc6             cmp ax, si                               
  079e  7fd7             jg 0x777                                 
  07a0  666a00           push 0                                   
  07a3  1e               push ds                                  
  07a4  683426           push 0x2634                              
  07a7  ff76fa           push word ptr [bp - 6]                   
  07aa  57               push di                                  
  07ab  ff76fc           push word ptr [bp - 4]                   
  07ae  ff76fe           push word ptr [bp - 2]                   
  07b1  1e               push ds                                  
  07b2  682a34           push 0x342a                              
  07b5  ff1ed469         lcall [0x69d4]                           
  07b9  83c414           add sp, 0x14                             
  07bc  66833e3e2600     cmp dword ptr [0x263e], 0                
  07c2  7428             je 0x7ec                                 
  07c4  f70669260a00     test word ptr [0x2669], 0xa              
  07ca  7520             jne 0x7ec                                
  07cc  33f6             xor si, si                               
  07ce  eb13             jmp 0x7e3                                
  07d0  8bde             mov bx, si                               
  07d2  c1e302           shl bx, 2                                
  07d5  66ffb73e26       push dword ptr [bx + 0x263e]             
  07da  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  07df  83c404           add sp, 4                                
  07e2  46               inc si                                   
  07e3  a06826           mov al, byte ptr [0x2668]                
  07e6  b400             mov ah, 0                                
  07e8  3bc6             cmp ax, si                               
  07ea  7fe4             jg 0x7d0                                 
  07ec  8d46e8           lea ax, [bp - 0x18]                      
  07ef  16               push ss                                  
  07f0  50               push ax                                  
  07f1  8d46f0           lea ax, [bp - 0x10]                      
  07f4  16               push ss                                  
  07f5  50               push ax                                  
  07f6  b90800           mov cx, 8                                
  07f9  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  07fe  668b46e4         mov eax, dword ptr [bp - 0x1c]           
  0802  668946e0         mov dword ptr [bp - 0x20], eax           
  0806  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  080b  66ff76e0         push dword ptr [bp - 0x20]               
  080f  8d46e8           lea ax, [bp - 0x18]                      
  0812  8cd2             mov dx, ss                               
  0814  b90800           mov cx, 8                                
  0817  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  081c  6a32             push 0x32                                
  081e  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0823  83c40e           add sp, 0xe                              
  0826  8b5e06           mov bx, word ptr [bp + 6]                
  0829  83fb05           cmp bx, 5                                
  082c  7603             jbe 0x831                                
  082e  e91301           jmp 0x944                                
  0831  d1e3             shl bx, 1                                
  0833  2effa7170b       jmp word ptr cs:[bx + 0xb17]             
ovl58_0838:  ; case
  0838  833ea43700       cmp word ptr [0x37a4], 0                 
  083d  751b             jne 0x85a                                
  083f  66683b000100     push 0x1003b                             
  0845  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  084a  83c404           add sp, 4                                
  084d  52               push dx                                  
  084e  50               push ax                                  
  084f  90               nop                                      
  0850  0e               push cs                                  
  0851  e8ad04           call 0xd01                               
  0854  83c404           add sp, 4                                
  0857  e9ea00           jmp 0x944                                
  085a  666a3b           push 0x3b                                
  085d  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0862  83c404           add sp, 4                                
  0865  52               push dx                                  
  0866  50               push ax                                  
  0867  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  086c  83c404           add sp, 4                                
  086f  8bd0             mov dx, ax                               
  0871  0bd2             or dx, dx                                
  0873  7d03             jge 0x878                                
  0875  e9cc00           jmp 0x944                                
  0878  e9be00           jmp 0x939                                
ovl58_087b:  ; case
  087b  833ea43700       cmp word ptr [0x37a4], 0                 
  0880  7508             jne 0x88a                                
  0882  66683c000100     push 0x1003c                             
  0888  ebbb             jmp 0x845                                
  088a  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  088f  666a3c           push 0x3c                                
  0892  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0897  83c404           add sp, 4                                
  089a  52               push dx                                  
  089b  50               push ax                                  
  089c  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  08a1  83c404           add sp, 4                                
  08a4  8bd0             mov dx, ax                               
  08a6  0bd2             or dx, dx                                
  08a8  7d03             jge 0x8ad                                
  08aa  e99700           jmp 0x944                                
  08ad  e98900           jmp 0x939                                
ovl58_08b0:  ; case
  08b0  833ea43700       cmp word ptr [0x37a4], 0                 
  08b5  7508             jne 0x8bf                                
  08b7  66683d000100     push 0x1003d                             
  08bd  eb86             jmp 0x845                                
  08bf  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  08c4  666a3d           push 0x3d                                
  08c7  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  08cc  83c404           add sp, 4                                
  08cf  52               push dx                                  
  08d0  50               push ax                                  
  08d1  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  08d6  83c404           add sp, 4                                
  08d9  8bd0             mov dx, ax                               
  08db  0bd2             or dx, dx                                
  08dd  7c65             jl 0x944                                 
  08df  eb58             jmp 0x939                                
ovl58_08e1:  ; case
  08e1  833ea43700       cmp word ptr [0x37a4], 0                 
  08e6  7509             jne 0x8f1                                
  08e8  66683e000100     push 0x1003e                             
  08ee  e954ff           jmp 0x845                                
  08f1  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  08f6  666a3e           push 0x3e                                
  08f9  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  08fe  83c404           add sp, 4                                
  0901  52               push dx                                  
  0902  50               push ax                                  
  0903  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0908  83c404           add sp, 4                                
  090b  8bd0             mov dx, ax                               
  090d  0bd2             or dx, dx                                
  090f  7c33             jl 0x944                                 
  0911  eb26             jmp 0x939                                
ovl58_0913:  ; case
  0913  833ea43700       cmp word ptr [0x37a4], 0                 
  0918  7507             jne 0x921                                
  091a  16               push ss                                  
  091b  8d4688           lea ax, [bp - 0x78]                      
  091e  e92dff           jmp 0x84e                                
  0921  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  0926  16               push ss                                  
  0927  8d4688           lea ax, [bp - 0x78]                      
  092a  50               push ax                                  
  092b  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0930  83c404           add sp, 4                                
  0933  8bd0             mov dx, ax                               
  0935  0bd2             or dx, dx                                
  0937  7c0b             jl 0x944                                 
  0939  6a02             push 2                                   
  093b  52               push dx                                  
  093c  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  0941  e910ff           jmp 0x854                                
ovl58_0944:  ; case
  0944  66681e000a00     push 0xa001e                             
  094a  6a01             push 1                                   
  094c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0951  83c406           add sp, 6                                
  0954  8bf0             mov si, ax                               
  0956  e91f01           jmp 0xa78                                
  0959  6a01             push 1                                   
  095b  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0960  59               pop cx                                   
  0961  46               inc si                                   
  0962  3b76dc           cmp si, word ptr [bp - 0x24]             
  0965  7f03             jg 0x96a                                 
  0967  e90e01           jmp 0xa78                                
  096a  6668e8000501     push 0x10500e8                           
  0970  16               push ss                                  
  0971  8d46e4           lea ax, [bp - 0x1c]                      
  0974  50               push ax                                  
  0975  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  097a  83c408           add sp, 8                                
  097d  33f6             xor si, si                               
  097f  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0984  6668a0002f00     push 0x2f00a0                            
  098a  666800002f00     push 0x2f0000                            
  0990  16               push ss                                  
  0991  8d46f0           lea ax, [bp - 0x10]                      
  0994  50               push ax                                  
  0995  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  099a  83c40c           add sp, 0xc                              
  099d  66ff76e4         push dword ptr [bp - 0x1c]               
  09a1  8d46f0           lea ax, [bp - 0x10]                      
  09a4  8cd2             mov dx, ss                               
  09a6  b90800           mov cx, 8                                
  09a9  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09ae  6a33             push 0x33                                
  09b0  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09b5  83c40e           add sp, 0xe                              
  09b8  6a02             push 2                                   
  09ba  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  09bf  59               pop cx                                   
  09c0  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  09c5  6668a0002f00     push 0x2f00a0                            
  09cb  666800005e00     push 0x5e0000                            
  09d1  16               push ss                                  
  09d2  8d46f0           lea ax, [bp - 0x10]                      
  09d5  50               push ax                                  
  09d6  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  09db  83c40c           add sp, 0xc                              
  09de  66ff76e4         push dword ptr [bp - 0x1c]               
  09e2  8d46f0           lea ax, [bp - 0x10]                      
  09e5  8cd2             mov dx, ss                               
  09e7  b90800           mov cx, 8                                
  09ea  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09ef  6a33             push 0x33                                
  09f1  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09f6  83c40e           add sp, 0xe                              
  09f9  6a02             push 2                                   
  09fb  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0a00  59               pop cx                                   
  0a01  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0a06  6668a0002f00     push 0x2f00a0                            
  0a0c  666800002f00     push 0x2f0000                            
  0a12  16               push ss                                  
  0a13  8d46f0           lea ax, [bp - 0x10]                      
  0a16  50               push ax                                  
  0a17  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0a1c  83c40c           add sp, 0xc                              
  0a1f  66ff76e4         push dword ptr [bp - 0x1c]               
  0a23  8d46f0           lea ax, [bp - 0x10]                      
  0a26  8cd2             mov dx, ss                               
  0a28  b90800           mov cx, 8                                
  0a2b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a30  6a33             push 0x33                                
  0a32  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0a37  83c40e           add sp, 0xe                              
  0a3a  6a02             push 2                                   
  0a3c  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0a41  59               pop cx                                   
  0a42  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0a47  6668a0002f00     push 0x2f00a0                            
  0a4d  666a00           push 0                                   
  0a50  16               push ss                                  
  0a51  8d46f0           lea ax, [bp - 0x10]                      
  0a54  50               push ax                                  
  0a55  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0a5a  83c40c           add sp, 0xc                              
  0a5d  66ff76e4         push dword ptr [bp - 0x1c]               
  0a61  8d46f0           lea ax, [bp - 0x10]                      
  0a64  8cd2             mov dx, ss                               
  0a66  b90800           mov cx, 8                                
  0a69  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a6e  6a33             push 0x33                                
  0a70  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0a75  83c40e           add sp, 0xe                              
  0a78  9a5a075e15       lcall 0x155e, 0x75a                      -> 155e:075a
  0a7d  0ac0             or al, al                                
  0a7f  740a             je 0xa8b                                 
  0a81  833ea43700       cmp word ptr [0x37a4], 0                 
  0a86  7403             je 0xa8b                                 
  0a88  e9cefe           jmp 0x959                                
  0a8b  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  0a90  833ea43700       cmp word ptr [0x37a4], 0                 
  0a95  7408             je 0xa9f                                 
  0a97  6a06             push 6                                   
  0a99  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0a9e  59               pop cx                                   
  0a9f  66833e3e2600     cmp dword ptr [0x263e], 0                
  0aa5  7435             je 0xadc                                 
  0aa7  f70669260a00     test word ptr [0x2669], 0xa              
  0aad  752d             jne 0xadc                                
  0aaf  33f6             xor si, si                               
  0ab1  eb20             jmp 0xad3                                
  0ab3  8bde             mov bx, si                               
  0ab5  c1e302           shl bx, 2                                
  0ab8  66ffb73e26       push dword ptr [bx + 0x263e]             
  0abd  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0ac2  83c404           add sp, 4                                
  0ac5  8bde             mov bx, si                               
  0ac7  c1e302           shl bx, 2                                
  0aca  89975026         mov word ptr [bx + 0x2650], dx           
  0ace  89874e26         mov word ptr [bx + 0x264e], ax           
  0ad2  46               inc si                                   
  0ad3  a06826           mov al, byte ptr [0x2668]                
  0ad6  b400             mov ah, 0                                
  0ad8  3bc6             cmp ax, si                               
  0ada  7fd7             jg 0xab3                                 
  0adc  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0ae1  ff76fc           push word ptr [bp - 4]                   
  0ae4  ff76fe           push word ptr [bp - 2]                   
  0ae7  1e               push ds                                  
  0ae8  682a34           push 0x342a                              
  0aeb  ff76fa           push word ptr [bp - 6]                   
  0aee  57               push di                                  
  0aef  666a00           push 0                                   
  0af2  1e               push ds                                  
  0af3  683426           push 0x2634                              
  0af6  ff1ed469         lcall [0x69d4]                           
  0afa  83c414           add sp, 0x14                             
  0afd  1e               push ds                                  
  0afe  683426           push 0x2634                              
  0b01  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0b06  83c404           add sp, 4                                
  0b09  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0b0e  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0b13  5f               pop di                                   
  0b14  5e               pop si                                   
  0b15  c9               leave                                    
  0b16  cb               retf                                     
  0b17  7b08b00838084409 dw 087b,08b0,0838,0944,08e1,0913,000a,000f,0014,0019,001e,0023,05e7,05ce,05b5,059c,0583,056a,0005,000a,000f,0014,0019,001e,03d6,0405,041c,0433,044a,0461 jump table

ovl58_0b53:  ; ENTRY
  0b53  55               push bp                                  
  0b54  8bec             mov bp, sp                               
  0b56  833eec0b00       cmp word ptr [0xbec], 0                  
  0b5b  7400             je 0xb5d                                 
  0b5d  5d               pop bp                                   
  0b5e  cb               retf                                     

ovl58_0b5f:  ; ENTRY
  0b5f  55               push bp                                  
  0b60  8bec             mov bp, sp                               
  0b62  833eec0b00       cmp word ptr [0xbec], 0                  
  0b67  740e             je 0xb77                                 
  0b69  6a00             push 0                                   
  0b6b  ff367859         push word ptr [0x5978]                   
  0b6f  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  0b74  83c404           add sp, 4                                
  0b77  5d               pop bp                                   
  0b78  cb               retf                                     

ovl58_0b79:  ; ENTRY
  0b79  55               push bp                                  
  0b7a  8bec             mov bp, sp                               
  0b7c  833eec0b00       cmp word ptr [0xbec], 0                  
  0b81  740e             je 0xb91                                 
  0b83  6a00             push 0                                   
  0b85  ff367659         push word ptr [0x5976]                   
  0b89  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  0b8e  83c404           add sp, 4                                
  0b91  5d               pop bp                                   
  0b92  cb               retf                                     

ovl58_0b93:  ; ENTRY
  0b93  55               push bp                                  
  0b94  8bec             mov bp, sp                               
  0b96  833eec0b00       cmp word ptr [0xbec], 0                  
  0b9b  7426             je 0xbc3                                 
  0b9d  666a3f           push 0x3f                                
  0ba0  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0ba5  83c404           add sp, 4                                
  0ba8  52               push dx                                  
  0ba9  50               push ax                                  
  0baa  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0baf  83c404           add sp, 4                                
  0bb2  8bd0             mov dx, ax                               
  0bb4  0bd2             or dx, dx                                
  0bb6  7c0b             jl 0xbc3                                 
  0bb8  6a02             push 2                                   
  0bba  52               push dx                                  
  0bbb  9a5e065e15       lcall 0x155e, 0x65e                      -> 155e:065e
  0bc0  83c404           add sp, 4                                
  0bc3  5d               pop bp                                   
  0bc4  cb               retf                                     

ovl58_0bc5:  ; ENTRY
  0bc5  55               push bp                                  
  0bc6  8bec             mov bp, sp                               
  0bc8  83ec0a           sub sp, 0xa                              
  0bcb  56               push si                                  
  0bcc  666800000200     push 0x20000                             
  0bd2  6a44             push 0x44                                
  0bd4  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0bd9  83c404           add sp, 4                                
  0bdc  52               push dx                                  
  0bdd  50               push ax                                  
  0bde  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0be3  83c406           add sp, 6                                
  0be6  8bf0             mov si, ax                               
  0be8  1e               push ds                                  
  0be9  686f26           push 0x266f                              
  0bec  16               push ss                                  
  0bed  8d46fc           lea ax, [bp - 4]                         
  0bf0  50               push ax                                  
  0bf1  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0bf6  83c408           add sp, 8                                
  0bf9  0bf6             or si, si                                
  0bfb  7c17             jl 0xc14                                 
  0bfd  6a03             push 3                                   
  0bff  16               push ss                                  
  0c00  8d46fc           lea ax, [bp - 4]                         
  0c03  50               push ax                                  
  0c04  56               push si                                  
  0c05  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0c0a  83c408           add sp, 8                                
  0c0d  56               push si                                  
  0c0e  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0c13  59               pop cx                                   
  0c14  8a46fc           mov al, byte ptr [bp - 4]                
  0c17  98               cwde                                     
  0c18  05d0ff           add ax, 0xffd0                           
  0c1b  8946fa           mov word ptr [bp - 6], ax                
  0c1e  8a46fd           mov al, byte ptr [bp - 3]                
  0c21  98               cwde                                     
  0c22  05d0ff           add ax, 0xffd0                           
  0c25  8946f8           mov word ptr [bp - 8], ax                
  0c28  8a46fe           mov al, byte ptr [bp - 2]                
  0c2b  98               cwde                                     
  0c2c  05d0ff           add ax, 0xffd0                           
  0c2f  8946f6           mov word ptr [bp - 0xa], ax              
  0c32  a0a337           mov al, byte ptr [0x37a3]                
  0c35  98               cwde                                     
  0c36  0bc0             or ax, ax                                
  0c38  7508             jne 0xc42                                
  0c3a  c706ee0b0000     mov word ptr [0xbee], 0                  
  0c40  eb06             jmp 0xc48                                
  0c42  8b46fa           mov ax, word ptr [bp - 6]                
  0c45  a3ee0b           mov word ptr [0xbee], ax                 
  0c48  a0a237           mov al, byte ptr [0x37a2]                
  0c4b  98               cwde                                     
  0c4c  0bc0             or ax, ax                                
  0c4e  7508             jne 0xc58                                
  0c50  c706ec0b0000     mov word ptr [0xbec], 0                  
  0c56  eb06             jmp 0xc5e                                
  0c58  8b46f8           mov ax, word ptr [bp - 8]                
  0c5b  a3ec0b           mov word ptr [0xbec], ax                 
  0c5e  833ec82600       cmp word ptr [0x26c8], 0                 
  0c63  7408             je 0xc6d                                 
  0c65  c706c8260100     mov word ptr [0x26c8], 1                 
  0c6b  eb0b             jmp 0xc78                                
  0c6d  8b46f6           mov ax, word ptr [bp - 0xa]              
  0c70  f7d8             neg ax                                   
  0c72  1bc0             sbb ax, ax                               
  0c74  40               inc ax                                   
  0c75  a3c826           mov word ptr [0x26c8], ax                
  0c78  803ea23700       cmp byte ptr [0x37a2], 0                 
  0c7d  7469             je 0xce8                                 
  0c7f  666a40           push 0x40                                
  0c82  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0c87  83c404           add sp, 4                                
  0c8a  52               push dx                                  
  0c8b  50               push ax                                  
  0c8c  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0c91  83c404           add sp, 4                                
  0c94  a37459           mov word ptr [0x5974], ax                
  0c97  666840000100     push 0x10040                             
  0c9d  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0ca2  83c404           add sp, 4                                
  0ca5  52               push dx                                  
  0ca6  50               push ax                                  
  0ca7  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0cac  83c404           add sp, 4                                
  0caf  a37659           mov word ptr [0x5976], ax                
  0cb2  666840000200     push 0x20040                             
  0cb8  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0cbd  83c404           add sp, 4                                
  0cc0  52               push dx                                  
  0cc1  50               push ax                                  
  0cc2  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0cc7  83c404           add sp, 4                                
  0cca  a37859           mov word ptr [0x5978], ax                
  0ccd  666840000500     push 0x50040                             
  0cd3  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0cd8  83c404           add sp, 4                                
  0cdb  52               push dx                                  
  0cdc  50               push ax                                  
  0cdd  9ae9045e15       lcall 0x155e, 0x4e9                      -> 155e:04e9
  0ce2  83c404           add sp, 4                                
  0ce5  a37e59           mov word ptr [0x597e], ax                
  0ce8  5e               pop si                                   
  0ce9  c9               leave                                    
  0cea  cb               retf                                     

ovl58_0ceb:  ; ENTRY
  0ceb  55               push bp                                  
  0cec  8bec             mov bp, sp                               
  0cee  833eec0b00       cmp word ptr [0xbec], 0                  
  0cf3  7400             je 0xcf5                                 
  0cf5  5d               pop bp                                   
  0cf6  cb               retf                                     

ovl58_0cf7:  ; ENTRY
  0cf7  55               push bp                                  
  0cf8  8bec             mov bp, sp                               
  0cfa  5d               pop bp                                   
  0cfb  cb               retf                                     

ovl58_0cfc:  ; ENTRY
  0cfc  55               push bp                                  
  0cfd  8bec             mov bp, sp                               
  0cff  5d               pop bp                                   
  0d00  cb               retf                                     

ovl58_0d01:  ; ENTRY
  0d01  55               push bp                                  
  0d02  8bec             mov bp, sp                               
  0d04  81ecc400         sub sp, 0xc4                             
  0d08  56               push si                                  
  0d09  57               push di                                  
  0d0a  c746fa0000       mov word ptr [bp - 6], 0                 
  0d0f  6a02             push 2                                   
  0d11  66ff7606         push dword ptr [bp + 6]                  
  0d15  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0d1a  83c406           add sp, 6                                
  0d1d  8bf0             mov si, ax                               
  0d1f  0bf6             or si, si                                
  0d21  7d03             jge 0xd26                                
  0d23  e9d401           jmp 0xefa                                
  0d26  688000           push 0x80                                
  0d29  16               push ss                                  
  0d2a  8d8678ff         lea ax, [bp - 0x88]                      
  0d2e  50               push ax                                  
  0d2f  56               push si                                  
  0d30  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0d35  83c408           add sp, 8                                
  0d38  56               push si                                  
  0d39  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0d3e  59               pop cx                                   
  0d3f  33f6             xor si, si                               
  0d41  c746fe0000       mov word ptr [bp - 2], 0                 
  0d46  666800000300     push 0x30000                             
  0d4c  666802000f00     push 0xf0002                             
  0d52  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0d57  83c408           add sp, 8                                
  0d5a  e98401           jmp 0xee1                                
  0d5d  8976fc           mov word ptr [bp - 4], si                
  0d60  eb24             jmp 0xd86                                
  0d62  80ba78ff7c       cmp byte ptr [bp + si - 0x88], 0x7c      
  0d67  7508             jne 0xd71                                
  0d69  c68278ff00       mov byte ptr [bp + si - 0x88], 0         
  0d6e  46               inc si                                   
  0d6f  eb1b             jmp 0xd8c                                
  0d71  80ba78ff7e       cmp byte ptr [bp + si - 0x88], 0x7e      
  0d76  750d             jne 0xd85                                
  0d78  c68278ff00       mov byte ptr [bp + si - 0x88], 0         
  0d7d  46               inc si                                   
  0d7e  c746fe0100       mov word ptr [bp - 2], 1                 
  0d83  eb07             jmp 0xd8c                                
  0d85  46               inc si                                   
  0d86  81fe8000         cmp si, 0x80                             
  0d8a  7cd6             jl 0xd62                                 
  0d8c  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0d91  8d8678ff         lea ax, [bp - 0x88]                      
  0d95  8b56fc           mov dx, word ptr [bp - 4]                
  0d98  03d0             add dx, ax                               
  0d9a  16               push ss                                  
  0d9b  52               push dx                                  
  0d9c  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  0da1  83c404           add sp, 4                                
  0da4  8bf8             mov di, ax                               
  0da6  c1ff04           sar di, 4                                
  0da9  c1e704           shl di, 4                                
  0dac  83c710           add di, 0x10                             
  0daf  c68670ff00       mov byte ptr [bp - 0x90], 0              
  0db4  c78671ff0000     mov word ptr [bp - 0x8f], 0              
  0dba  6a11             push 0x11                                
  0dbc  57               push di                                  
  0dbd  16               push ss                                  
  0dbe  8d863cff         lea ax, [bp - 0xc4]                      
  0dc2  50               push ax                                  
  0dc3  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0dc8  83c408           add sp, 8                                
  0dcb  0bc0             or ax, ax                                
  0dcd  7503             jne 0xdd2                                
  0dcf  e92801           jmp 0xefa                                
  0dd2  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0dd7  6683be46ff00     cmp dword ptr [bp - 0xba], 0             
  0ddd  7448             je 0xe27                                 
  0ddf  f78671ff0a00     test word ptr [bp - 0x8f], 0xa           
  0de5  7540             jne 0xe27                                
  0de7  c746f80000       mov word ptr [bp - 8], 0                 
  0dec  eb2e             jmp 0xe1c                                
  0dee  8b5ef8           mov bx, word ptr [bp - 8]                
  0df1  c1e302           shl bx, 2                                
  0df4  8d8646ff         lea ax, [bp - 0xba]                      
  0df8  03d8             add bx, ax                               
  0dfa  6636ff37         push dword ptr ss:[bx]                   
  0dfe  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0e03  83c404           add sp, 4                                
  0e06  8b5ef8           mov bx, word ptr [bp - 8]                
  0e09  c1e302           shl bx, 2                                
  0e0c  8d8e56ff         lea cx, [bp - 0xaa]                      
  0e10  03d9             add bx, cx                               
  0e12  36895702         mov word ptr ss:[bx + 2], dx             
  0e16  368907           mov word ptr ss:[bx], ax                 
  0e19  ff46f8           inc word ptr [bp - 8]                    
  0e1c  8a8670ff         mov al, byte ptr [bp - 0x90]             
  0e20  b400             mov ah, 0                                
  0e22  3b46f8           cmp ax, word ptr [bp - 8]                
  0e25  7fc7             jg 0xdee                                 
  0e27  666a00           push 0                                   
  0e2a  16               push ss                                  
  0e2b  8d863cff         lea ax, [bp - 0xc4]                      
  0e2f  50               push ax                                  
  0e30  6a11             push 0x11                                
  0e32  57               push di                                  
  0e33  689801           push 0x198                               
  0e36  8bc7             mov ax, di                               
  0e38  99               cdq                                      
  0e39  2bc2             sub ax, dx                               
  0e3b  d1f8             sar ax, 1                                
  0e3d  ba3801           mov dx, 0x138                            
  0e40  2bd0             sub dx, ax                               
  0e42  52               push dx                                  
  0e43  1e               push ds                                  
  0e44  682a34           push 0x342a                              
  0e47  ff1ed469         lcall [0x69d4]                           
  0e4b  83c414           add sp, 0x14                             
  0e4e  6683be46ff00     cmp dword ptr [bp - 0xba], 0             
  0e54  7435             je 0xe8b                                 
  0e56  f78671ff0a00     test word ptr [bp - 0x8f], 0xa           
  0e5c  752d             jne 0xe8b                                
  0e5e  c746f80000       mov word ptr [bp - 8], 0                 
  0e63  eb1b             jmp 0xe80                                
  0e65  8b5ef8           mov bx, word ptr [bp - 8]                
  0e68  c1e302           shl bx, 2                                
  0e6b  8d8646ff         lea ax, [bp - 0xba]                      
  0e6f  03d8             add bx, ax                               
  0e71  6636ff37         push dword ptr ss:[bx]                   
  0e75  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0e7a  83c404           add sp, 4                                
  0e7d  ff46f8           inc word ptr [bp - 8]                    
  0e80  8a8670ff         mov al, byte ptr [bp - 0x90]             
  0e84  b400             mov ah, 0                                
  0e86  3b46f8           cmp ax, word ptr [bp - 8]                
  0e89  7fda             jg 0xe65                                 
  0e8b  8d8678ff         lea ax, [bp - 0x88]                      
  0e8f  8b56fc           mov dx, word ptr [bp - 4]                
  0e92  03d0             add dx, ax                               
  0e94  16               push ss                                  
  0e95  52               push dx                                  
  0e96  666838019801     push 0x1980138                           
  0e9c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0ea1  83c408           add sp, 8                                
  0ea4  6a28             push 0x28                                
  0ea6  9a2500c130       lcall 0x30c1, 0x25                       -> ovl59:015e
  0eab  59               pop cx                                   
  0eac  689801           push 0x198                               
  0eaf  8bc7             mov ax, di                               
  0eb1  99               cdq                                      
  0eb2  2bc2             sub ax, dx                               
  0eb4  d1f8             sar ax, 1                                
  0eb6  ba3801           mov dx, 0x138                            
  0eb9  2bd0             sub dx, ax                               
  0ebb  52               push dx                                  
  0ebc  1e               push ds                                  
  0ebd  682a34           push 0x342a                              
  0ec0  6a11             push 0x11                                
  0ec2  57               push di                                  
  0ec3  666a00           push 0                                   
  0ec6  16               push ss                                  
  0ec7  8d863cff         lea ax, [bp - 0xc4]                      
  0ecb  50               push ax                                  
  0ecc  ff1ed469         lcall [0x69d4]                           
  0ed0  83c414           add sp, 0x14                             
  0ed3  16               push ss                                  
  0ed4  8d863cff         lea ax, [bp - 0xc4]                      
  0ed8  50               push ax                                  
  0ed9  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0ede  83c404           add sp, 4                                
  0ee1  837efe00         cmp word ptr [bp - 2], 0                 
  0ee5  750e             jne 0xef5                                
  0ee7  8b46fa           mov ax, word ptr [bp - 6]                
  0eea  ff46fa           inc word ptr [bp - 6]                    
  0eed  3d0500           cmp ax, 5                                
  0ef0  7d03             jge 0xef5                                
  0ef2  e968fe           jmp 0xd5d                                
  0ef5  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0efa  5f               pop di                                   
  0efb  5e               pop si                                   
  0efc  c9               leave                                    
  0efd  cb               retf                                     
