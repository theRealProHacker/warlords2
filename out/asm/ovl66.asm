; ovl66 stub 310c file_off 0x80850 size 0x2256

ovl66_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  90               nop                                      
  0004  0e               push cs                                  
  0005  e8280d           call 0xd30                               
  0008  5d               pop bp                                   
  0009  cb               retf                                     

ovl66_000a:  ; ENTRY
  000a  55               push bp                                  
  000b  8bec             mov bp, sp                               
  000d  83ec4e           sub sp, 0x4e                             
  0010  56               push si                                  
  0011  57               push di                                  
  0012  c41e625e         les bx, ptr [0x5e62]                     
  0016  268b4712         mov ax, word ptr es:[bx + 0x12]          
  001a  8946fe           mov word ptr [bp - 2], ax                
  001d  268b4714         mov ax, word ptr es:[bx + 0x14]          
  0021  8946fc           mov word ptr [bp - 4], ax                
  0024  a1aa2e           mov ax, word ptr [0x2eaa]                
  0027  8946fa           mov word ptr [bp - 6], ax                
  002a  66c706625e000000 mov dword ptr [0x5e62], 0                
  0033  33ff             xor di, di                               
  0035  eb12             jmp 0x49                                 
  0037  8bdf             mov bx, di                               
  0039  c1e302           shl bx, 2                                
  003c  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  0042  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0048  47               inc di                                   
  0049  83ff08           cmp di, 8                                
  004c  7ce9             jl 0x37                                  
  004e  33ff             xor di, di                               
  0050  33f6             xor si, si                               
  0052  eb51             jmp 0xa5                                 
  0054  8bdf             mov bx, di                               
  0056  d1e3             shl bx, 1                                
  0058  83bf426800       cmp word ptr [bx + 0x6842], 0            
  005d  7445             je 0xa4                                  
  005f  66833e625e00     cmp dword ptr [0x5e62], 0                
  0065  7514             jne 0x7b                                 
  0067  8bdf             mov bx, di                               
  0069  c1e302           shl bx, 2                                
  006c  8b876468         mov ax, word ptr [bx + 0x6864]           
  0070  8b976268         mov dx, word ptr [bx + 0x6862]           
  0074  a3645e           mov word ptr [0x5e64], ax                
  0077  8916625e         mov word ptr [0x5e62], dx                
  007b  8bdf             mov bx, di                               
  007d  c1e302           shl bx, 2                                
  0080  8b876468         mov ax, word ptr [bx + 0x6864]           
  0084  8b976268         mov dx, word ptr [bx + 0x6862]           
  0088  8bde             mov bx, si                               
  008a  c1e302           shl bx, 2                                
  008d  8987405e         mov word ptr [bx + 0x5e40], ax           
  0091  89973e5e         mov word ptr [bx + 0x5e3e], dx           
  0095  46               inc si                                   
  0096  8bdf             mov bx, di                               
  0098  c1e302           shl bx, 2                                
  009b  c49f6268         les bx, ptr [bx + 0x6862]                
  009f  26834f0c01       or word ptr es:[bx + 0xc], 1             
  00a4  47               inc di                                   
  00a5  3b3ef630         cmp di, word ptr [0x30f6]                
  00a9  7ca9             jl 0x54                                  
  00ab  8936fe5d         mov word ptr [0x5dfe], si                
  00af  833efe5d01       cmp word ptr [0x5dfe], 1                 
  00b4  7e05             jle 0xbb                                 
  00b6  b80100           mov ax, 1                                
  00b9  eb02             jmp 0xbd                                 
  00bb  33c0             xor ax, ax                               
  00bd  a3da2b           mov word ptr [0x2bda], ax                
  00c0  bf0100           mov di, 1                                
  00c3  eb2b             jmp 0xf0                                 
  00c5  c41e625e         les bx, ptr [0x5e62]                     
  00c9  268b4712         mov ax, word ptr es:[bx + 0x12]          
  00cd  8bdf             mov bx, di                               
  00cf  c1e302           shl bx, 2                                
  00d2  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  00d6  26894712         mov word ptr es:[bx + 0x12], ax          
  00da  c41e625e         les bx, ptr [0x5e62]                     
  00de  268b4714         mov ax, word ptr es:[bx + 0x14]          
  00e2  8bdf             mov bx, di                               
  00e4  c1e302           shl bx, 2                                
  00e7  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  00eb  26894714         mov word ptr es:[bx + 0x14], ax          
  00ef  47               inc di                                   
  00f0  3b3efe5d         cmp di, word ptr [0x5dfe]                
  00f4  7ccf             jl 0xc5                                  
  00f6  c746f40000       mov word ptr [bp - 0xc], 0               
  00fb  33ff             xor di, di                               
  00fd  eb72             jmp 0x171                                
  00ff  8bdf             mov bx, di                               
  0101  c1e302           shl bx, 2                                
  0104  c49f6268         les bx, ptr [bx + 0x6862]                
  0108  26807f1100       cmp byte ptr es:[bx + 0x11], 0           
  010d  7461             je 0x170                                 
  010f  8bdf             mov bx, di                               
  0111  c1e302           shl bx, 2                                
  0114  c49f6268         les bx, ptr [bx + 0x6862]                
  0118  26807f1101       cmp byte ptr es:[bx + 0x11], 1           
  011d  7451             je 0x170                                 
  011f  33c9             xor cx, cx                               
  0121  33f6             xor si, si                               
  0123  eb23             jmp 0x148                                
  0125  8bdf             mov bx, di                               
  0127  c1e302           shl bx, 2                                
  012a  c49f6268         les bx, ptr [bx + 0x6862]                
  012e  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0132  b400             mov ah, 0                                
  0134  8bd9             mov bx, cx                               
  0136  d1e3             shl bx, 1                                
  0138  8d56e2           lea dx, [bp - 0x1e]                      
  013b  03da             add bx, dx                               
  013d  363b07           cmp ax, word ptr ss:[bx]                 
  0140  7505             jne 0x147                                
  0142  be0100           mov si, 1                                
  0145  eb06             jmp 0x14d                                
  0147  41               inc cx                                   
  0148  3b4ef4           cmp cx, word ptr [bp - 0xc]              
  014b  7cd8             jl 0x125                                 
  014d  0bf6             or si, si                                
  014f  751f             jne 0x170                                
  0151  8bdf             mov bx, di                               
  0153  c1e302           shl bx, 2                                
  0156  c49f6268         les bx, ptr [bx + 0x6862]                
  015a  268a4711         mov al, byte ptr es:[bx + 0x11]          
  015e  b400             mov ah, 0                                
  0160  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0163  d1e3             shl bx, 1                                
  0165  8d56e2           lea dx, [bp - 0x1e]                      
  0168  03da             add bx, dx                               
  016a  368907           mov word ptr ss:[bx], ax                 
  016d  ff46f4           inc word ptr [bp - 0xc]                  
  0170  47               inc di                                   
  0171  3b3ef630         cmp di, word ptr [0x30f6]                
  0175  7c88             jl 0xff                                  
  0177  33ff             xor di, di                               
  0179  c746f2ffff       mov word ptr [bp - 0xe], 0xffff          
  017e  e97f00           jmp 0x200                                
  0181  0bff             or di, di                                
  0183  7412             je 0x197                                 
  0185  8bdf             mov bx, di                               
  0187  d1e3             shl bx, 1                                
  0189  8b875268         mov ax, word ptr [bx + 0x6852]           
  018d  8bdf             mov bx, di                               
  018f  d1e3             shl bx, 1                                
  0191  3b875068         cmp ax, word ptr [bx + 0x6850]           
  0195  7405             je 0x19c                                 
  0197  b80100           mov ax, 1                                
  019a  eb02             jmp 0x19e                                
  019c  33c0             xor ax, ax                               
  019e  8946f6           mov word ptr [bp - 0xa], ax              
  01a1  837ef600         cmp word ptr [bp - 0xa], 0               
  01a5  744b             je 0x1f2                                 
  01a7  ff46f2           inc word ptr [bp - 0xe]                  
  01aa  8bdf             mov bx, di                               
  01ac  c1e302           shl bx, 2                                
  01af  c49f6268         les bx, ptr [bx + 0x6862]                
  01b3  268a4711         mov al, byte ptr es:[bx + 0x11]          
  01b7  b400             mov ah, 0                                
  01b9  8b5ef2           mov bx, word ptr [bp - 0xe]              
  01bc  d1e3             shl bx, 1                                
  01be  8d56b2           lea dx, [bp - 0x4e]                      
  01c1  03da             add bx, dx                               
  01c3  368907           mov word ptr ss:[bx], ax                 
  01c6  8b5ef2           mov bx, word ptr [bp - 0xe]              
  01c9  d1e3             shl bx, 1                                
  01cb  8d46c2           lea ax, [bp - 0x3e]                      
  01ce  03d8             add bx, ax                               
  01d0  36c7070000       mov word ptr ss:[bx], 0                  
  01d5  8b5ef2           mov bx, word ptr [bp - 0xe]              
  01d8  d1e3             shl bx, 1                                
  01da  8d46d2           lea ax, [bp - 0x2e]                      
  01dd  03d8             add bx, ax                               
  01df  8bf7             mov si, di                               
  01e1  c1e602           shl si, 2                                
  01e4  8bb46268         mov si, word ptr [si + 0x6862]           
  01e8  268b440c         mov ax, word ptr es:[si + 0xc]           
  01ec  250100           and ax, 1                                
  01ef  368907           mov word ptr ss:[bx], ax                 
  01f2  8b5ef2           mov bx, word ptr [bp - 0xe]              
  01f5  d1e3             shl bx, 1                                
  01f7  8d46c2           lea ax, [bp - 0x3e]                      
  01fa  03d8             add bx, ax                               
  01fc  36ff07           inc word ptr ss:[bx]                     
  01ff  47               inc di                                   
  0200  3b3ef630         cmp di, word ptr [0x30f6]                
  0204  7d03             jge 0x209                                
  0206  e978ff           jmp 0x181                                
  0209  ff46f2           inc word ptr [bp - 0xe]                  
  020c  33ff             xor di, di                               
  020e  eb4b             jmp 0x25b                                
  0210  8bdf             mov bx, di                               
  0212  d1e3             shl bx, 1                                
  0214  8d46c2           lea ax, [bp - 0x3e]                      
  0217  03d8             add bx, ax                               
  0219  36833f01         cmp word ptr ss:[bx], 1                  
  021d  7518             jne 0x237                                
  021f  8bdf             mov bx, di                               
  0221  d1e3             shl bx, 1                                
  0223  8d46d2           lea ax, [bp - 0x2e]                      
  0226  03d8             add bx, ax                               
  0228  36833f00         cmp word ptr ss:[bx], 0                  
  022c  7404             je 0x232                                 
  022e  33c0             xor ax, ax                               
  0230  eb1c             jmp 0x24e                                
  0232  b80200           mov ax, 2                                
  0235  eb17             jmp 0x24e                                
  0237  8bdf             mov bx, di                               
  0239  d1e3             shl bx, 1                                
  023b  8d46d2           lea ax, [bp - 0x2e]                      
  023e  03d8             add bx, ax                               
  0240  36833f00         cmp word ptr ss:[bx], 0                  
  0244  7405             je 0x24b                                 
  0246  b80100           mov ax, 1                                
  0249  ebe5             jmp 0x230                                
  024b  b80300           mov ax, 3                                
  024e  8bdf             mov bx, di                               
  0250  d1e3             shl bx, 1                                
  0252  8d56d2           lea dx, [bp - 0x2e]                      
  0255  03da             add bx, dx                               
  0257  368907           mov word ptr ss:[bx], ax                 
  025a  47               inc di                                   
  025b  3b7ef2           cmp di, word ptr [bp - 0xe]              
  025e  7cb0             jl 0x210                                 
  0260  33ff             xor di, di                               
  0262  33f6             xor si, si                               
  0264  eb78             jmp 0x2de                                
  0266  8bdf             mov bx, di                               
  0268  d1e3             shl bx, 1                                
  026a  8d46d2           lea ax, [bp - 0x2e]                      
  026d  03d8             add bx, ax                               
  026f  36833f02         cmp word ptr ss:[bx], 2                  
  0273  740c             je 0x281                                 
  0275  8bdf             mov bx, di                               
  0277  d1e3             shl bx, 1                                
  0279  03d8             add bx, ax                               
  027b  36833f00         cmp word ptr ss:[bx], 0                  
  027f  7504             jne 0x285                                
  0281  33d2             xor dx, dx                               
  0283  eb2f             jmp 0x2b4                                
  0285  8bdf             mov bx, di                               
  0287  d1e3             shl bx, 1                                
  0289  8d46d2           lea ax, [bp - 0x2e]                      
  028c  03d8             add bx, ax                               
  028e  36833f03         cmp word ptr ss:[bx], 3                  
  0292  7505             jne 0x299                                
  0294  ba0100           mov dx, 1                                
  0297  eb1b             jmp 0x2b4                                
  0299  ff4ef4           dec word ptr [bp - 0xc]                  
  029c  7e0f             jle 0x2ad                                
  029e  8b5ef4           mov bx, word ptr [bp - 0xc]              
  02a1  d1e3             shl bx, 1                                
  02a3  8d46e2           lea ax, [bp - 0x1e]                      
  02a6  03d8             add bx, ax                               
  02a8  368b17           mov dx, word ptr ss:[bx]                 
  02ab  eb07             jmp 0x2b4                                
  02ad  9ade0c620b       lcall 0xb62, 0xcde                       -> 0b62:0cde
  02b2  8bd0             mov dx, ax                               
  02b4  8bdf             mov bx, di                               
  02b6  d1e3             shl bx, 1                                
  02b8  8d46c2           lea ax, [bp - 0x3e]                      
  02bb  03d8             add bx, ax                               
  02bd  8bc6             mov ax, si                               
  02bf  360307           add ax, word ptr ss:[bx]                 
  02c2  8946f8           mov word ptr [bp - 8], ax                
  02c5  8bce             mov cx, si                               
  02c7  eb0f             jmp 0x2d8                                
  02c9  8bde             mov bx, si                               
  02cb  c1e302           shl bx, 2                                
  02ce  c49f6268         les bx, ptr [bx + 0x6862]                
  02d2  26885711         mov byte ptr es:[bx + 0x11], dl          
  02d6  46               inc si                                   
  02d7  41               inc cx                                   
  02d8  3b4ef8           cmp cx, word ptr [bp - 8]                
  02db  7cec             jl 0x2c9                                 
  02dd  47               inc di                                   
  02de  3b7ef2           cmp di, word ptr [bp - 0xe]              
  02e1  7c83             jl 0x266                                 
  02e3  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  02e8  837e0600         cmp word ptr [bp + 6], 0                 
  02ec  751e             jne 0x30c                                
  02ee  c41e625e         les bx, ptr [0x5e62]                     
  02f2  268b4712         mov ax, word ptr es:[bx + 0x12]          
  02f6  3b46fe           cmp ax, word ptr [bp - 2]                
  02f9  7511             jne 0x30c                                
  02fb  268b4714         mov ax, word ptr es:[bx + 0x14]          
  02ff  3b46fc           cmp ax, word ptr [bp - 4]                
  0302  7508             jne 0x30c                                
  0304  a1aa2e           mov ax, word ptr [0x2eaa]                
  0307  3b46fa           cmp ax, word ptr [bp - 6]                
  030a  7407             je 0x313                                 
  030c  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0311  eb3f             jmp 0x352                                
  0313  c41e625e         les bx, ptr [0x5e62]                     
  0317  26ff7702         push word ptr es:[bx + 2]                
  031b  26ff37           push word ptr es:[bx]                    
  031e  9a5700f930       lcall 0x30f9, 0x57                       -> ovl64:0238
  0323  83c404           add sp, 4                                
  0326  833efe5d01       cmp word ptr [0x5dfe], 1                 
  032b  7e12             jle 0x33f                                
  032d  c41e625e         les bx, ptr [0x5e62]                     
  0331  26ff7702         push word ptr es:[bx + 2]                
  0335  26ff37           push word ptr es:[bx]                    
  0338  9a8e00e830       lcall 0x30e8, 0x8e                       -> ovl62:0b27
  033d  eb10             jmp 0x34f                                
  033f  c41e625e         les bx, ptr [0x5e62]                     
  0343  26ff7702         push word ptr es:[bx + 2]                
  0347  26ff37           push word ptr es:[bx]                    
  034a  9a8900e830       lcall 0x30e8, 0x89                       -> ovl62:0afd
  034f  83c404           add sp, 4                                
  0352  5f               pop di                                   
  0353  5e               pop si                                   
  0354  c9               leave                                    
  0355  cb               retf                                     

ovl66_0356:  ; ENTRY
  0356  55               push bp                                  
  0357  8bec             mov bp, sp                               
  0359  83ec0e           sub sp, 0xe                              
  035c  56               push si                                  
  035d  66833e625e00     cmp dword ptr [0x5e62], 0                
  0363  7427             je 0x38c                                 
  0365  16               push ss                                  
  0366  8d46fe           lea ax, [bp - 2]                         
  0369  50               push ax                                  
  036a  c41e625e         les bx, ptr [0x5e62]                     
  036e  26ff7702         push word ptr es:[bx + 2]                
  0372  26ff37           push word ptr es:[bx]                    
  0375  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  037a  83c408           add sp, 8                                
  037d  6a00             push 0                                   
  037f  ff76fe           push word ptr [bp - 2]                   
  0382  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  0387  83c404           add sp, 4                                
  038a  eb08             jmp 0x394                                
  038c  90               nop                                      
  038d  0e               push cs                                  
  038e  e81202           call 0x5a3                               
  0391  e9d001           jmp 0x564                                
  0394  833ef83000       cmp word ptr [0x30f8], 0                 
  0399  7405             je 0x3a0                                 
  039b  9a7000d730       lcall 0x30d7, 0x70                       -> ovl61:0aeb
  03a0  c706f8300000     mov word ptr [0x30f8], 0                 
  03a6  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  03ab  833eda2b00       cmp word ptr [0x2bda], 0                 
  03b0  750e             jne 0x3c0                                
  03b2  c706fe5d0100     mov word ptr [0x5dfe], 1                 
  03b8  66a1625e         mov eax, dword ptr [0x5e62]              
  03bc  66a33e5e         mov dword ptr [0x5e3e], eax              
  03c0  33f6             xor si, si                               
  03c2  e95e01           jmp 0x523                                
  03c5  3b36f630         cmp si, word ptr [0x30f6]                
  03c9  7c03             jl 0x3ce                                 
  03cb  e9d400           jmp 0x4a2                                
  03ce  8bde             mov bx, si                               
  03d0  d1e3             shl bx, 1                                
  03d2  b8042c           mov ax, 0x2c04                           
  03d5  8ec0             mov es, ax                               
  03d7  26a11001         mov ax, word ptr es:[0x110]              
  03db  03875268         add ax, word ptr [bx + 0x6852]           
  03df  bb0800           mov bx, 8                                
  03e2  99               cdq                                      
  03e3  f7fb             idiv bx                                  
  03e5  83c202           add dx, 2                                
  03e8  8956fc           mov word ptr [bp - 4], dx                
  03eb  8bde             mov bx, si                               
  03ed  d1e3             shl bx, 1                                
  03ef  83bf426800       cmp word ptr [bx + 0x6842], 0            
  03f4  7404             je 0x3fa                                 
  03f6  33c0             xor ax, ax                               
  03f8  eb03             jmp 0x3fd                                
  03fa  b80100           mov ax, 1                                
  03fd  8946fa           mov word ptr [bp - 6], ax                
  0400  50               push ax                                  
  0401  6a02             push 2                                   
  0403  ff76fc           push word ptr [bp - 4]                   
  0406  8bde             mov bx, si                               
  0408  c1e302           shl bx, 2                                
  040b  c49f6268         les bx, ptr [bx + 0x6862]                
  040f  268a4708         mov al, byte ptr es:[bx + 8]             
  0413  98               cwde                                     
  0414  50               push ax                                  
  0415  8bde             mov bx, si                               
  0417  c1e302           shl bx, 2                                
  041a  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  041e  268a4707         mov al, byte ptr es:[bx + 7]             
  0422  98               cwde                                     
  0423  50               push ax                                  
  0424  666a00           push 0                                   
  0427  8bde             mov bx, si                               
  0429  c1e302           shl bx, 2                                
  042c  ffb7c82f         push word ptr [bx + 0x2fc8]              
  0430  8bde             mov bx, si                               
  0432  c1e302           shl bx, 2                                
  0435  ffb7c62f         push word ptr [bx + 0x2fc6]              
  0439  1e               push ds                                  
  043a  682a34           push 0x342a                              
  043d  b8042c           mov ax, 0x2c04                           
  0440  8ec0             mov es, ax                               
  0442  26ff361001       push word ptr es:[0x110]                 
  0447  8bde             mov bx, si                               
  0449  c1e302           shl bx, 2                                
  044c  c49f6268         les bx, ptr [bx + 0x6862]                
  0450  268a4704         mov al, byte ptr es:[bx + 4]             
  0454  98               cwde                                     
  0455  50               push ax                                  
  0456  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  045b  83c41a           add sp, 0x1a                             
  045e  8bde             mov bx, si                               
  0460  d1e3             shl bx, 1                                
  0462  83bf3268ff       cmp word ptr [bx + 0x6832], -1           
  0467  742f             je 0x498                                 
  0469  8bde             mov bx, si                               
  046b  c1e302           shl bx, 2                                
  046e  66ffb7c230       push dword ptr [bx + 0x30c2]             
  0473  8bde             mov bx, si                               
  0475  d1e3             shl bx, 1                                
  0477  8b873268         mov ax, word ptr [bx + 0x6832]           
  047b  c1e003           shl ax, 3                                
  047e  8cda             mov dx, ds                               
  0480  05b230           add ax, 0x30b2                           
  0483  b90800           mov cx, 8                                
  0486  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  048b  6a08             push 8                                   
  048d  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0492  83c40e           add sp, 0xe                              
  0495  e98a00           jmp 0x522                                
  0498  6a03             push 3                                   
  049a  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  049f  59               pop cx                                   
  04a0  eb52             jmp 0x4f4                                
  04a2  666a00           push 0                                   
  04a5  666800000100     push 0x10000                             
  04ab  666a00           push 0                                   
  04ae  6a00             push 0                                   
  04b0  8bde             mov bx, si                               
  04b2  c1e302           shl bx, 2                                
  04b5  ffb7c82f         push word ptr [bx + 0x2fc8]              
  04b9  8bde             mov bx, si                               
  04bb  c1e302           shl bx, 2                                
  04be  ffb7c62f         push word ptr [bx + 0x2fc6]              
  04c2  1e               push ds                                  
  04c3  682a34           push 0x342a                              
  04c6  b8042c           mov ax, 0x2c04                           
  04c9  8ec0             mov es, ax                               
  04cb  26ff361001       push word ptr es:[0x110]                 
  04d0  6aff             push -1                                  
  04d2  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  04d7  83c41a           add sp, 0x1a                             
  04da  6a03             push 3                                   
  04dc  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  04e1  59               pop cx                                   
  04e2  1e               push ds                                  
  04e3  8bc6             mov ax, si                               
  04e5  c1e003           shl ax, 3                                
  04e8  05e62f           add ax, 0x2fe6                           
  04eb  50               push ax                                  
  04ec  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  04f1  83c404           add sp, 4                                
  04f4  66ff36b630       push dword ptr [0x30b6]                  
  04f9  8bde             mov bx, si                               
  04fb  c1e302           shl bx, 2                                
  04fe  ffb7c430         push word ptr [bx + 0x30c4]              
  0502  8bde             mov bx, si                               
  0504  c1e302           shl bx, 2                                
  0507  ffb7c230         push word ptr [bx + 0x30c2]              
  050b  16               push ss                                  
  050c  8d46f2           lea ax, [bp - 0xe]                       
  050f  50               push ax                                  
  0510  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0515  83c40c           add sp, 0xc                              
  0518  52               push dx                                  
  0519  50               push ax                                  
  051a  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  051f  83c404           add sp, 4                                
  0522  46               inc si                                   
  0523  83fe08           cmp si, 8                                
  0526  7d03             jge 0x52b                                
  0528  e99afe           jmp 0x3c5                                
  052b  90               nop                                      
  052c  0e               push cs                                  
  052d  e83700           call 0x567                               
  0530  0bc0             or ax, ax                                
  0532  740a             je 0x53e                                 
  0534  66ff36f230       push dword ptr [0x30f2]                  
  0539  b8ea30           mov ax, 0x30ea                           
  053c  eb08             jmp 0x546                                
  053e  66ff36f230       push dword ptr [0x30f2]                  
  0543  b8e230           mov ax, 0x30e2                           
  0546  8cda             mov dx, ds                               
  0548  b90800           mov cx, 8                                
  054b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0550  6a08             push 8                                   
  0552  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0557  83c40e           add sp, 0xe                              
  055a  90               nop                                      
  055b  0e               push cs                                  
  055c  e8ae01           call 0x70d                               
  055f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0564  5e               pop si                                   
  0565  c9               leave                                    
  0566  cb               retf                                     

ovl66_0567:  ; ENTRY
  0567  55               push bp                                  
  0568  8bec             mov bp, sp                               
  056a  b90100           mov cx, 1                                
  056d  66833e625e00     cmp dword ptr [0x5e62], 0                
  0573  7504             jne 0x579                                
  0575  33c0             xor ax, ax                               
  0577  eb28             jmp 0x5a1                                
  0579  833ef63001       cmp word ptr [0x30f6], 1                 
  057e  7505             jne 0x585                                
  0580  b80100           mov ax, 1                                
  0583  eb1c             jmp 0x5a1                                
  0585  33d2             xor dx, dx                               
  0587  eb10             jmp 0x599                                
  0589  8bda             mov bx, dx                               
  058b  d1e3             shl bx, 1                                
  058d  83bf426800       cmp word ptr [bx + 0x6842], 0            
  0592  7504             jne 0x598                                
  0594  33c9             xor cx, cx                               
  0596  eb07             jmp 0x59f                                
  0598  42               inc dx                                   
  0599  3b16f630         cmp dx, word ptr [0x30f6]                
  059d  7cea             jl 0x589                                 
  059f  8bc1             mov ax, cx                               
  05a1  5d               pop bp                                   
  05a2  cb               retf                                     

ovl66_05a3:  ; ENTRY
  05a3  55               push bp                                  
  05a4  8bec             mov bp, sp                               
  05a6  83ec32           sub sp, 0x32                             
  05a9  c706f8300100     mov word ptr [0x30f8], 1                 
  05af  9a7000d730       lcall 0x30d7, 0x70                       -> ovl61:0aeb
  05b4  666800000300     push 0x30000                             
  05ba  666802000f00     push 0xf0002                             
  05c0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  05c5  83c408           add sp, 8                                
  05c8  66ff369230       push dword ptr [0x3092]                  
  05cd  b87230           mov ax, 0x3072                           
  05d0  8cda             mov dx, ds                               
  05d2  b90800           mov cx, 8                                
  05d5  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  05da  6a08             push 8                                   
  05dc  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  05e1  83c40e           add sp, 0xe                              
  05e4  b8042c           mov ax, 0x2c04                           
  05e7  8ec0             mov es, ax                               
  05e9  268b1e1001       mov bx, word ptr es:[0x110]              
  05ee  d1e3             shl bx, 1                                
  05f0  ffb7ea5d         push word ptr [bx + 0x5dea]              
  05f4  1e               push ds                                  
  05f5  682831           push 0x3128                              
  05f8  16               push ss                                  
  05f9  8d46ce           lea ax, [bp - 0x32]                      
  05fc  50               push ax                                  
  05fd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0602  83c40a           add sp, 0xa                              
  0605  16               push ss                                  
  0606  8d46ce           lea ax, [bp - 0x32]                      
  0609  50               push ax                                  
  060a  66ff36a230       push dword ptr [0x30a2]                  
  060f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0614  83c408           add sp, 8                                
  0617  66ff369630       push dword ptr [0x3096]                  
  061c  b87a30           mov ax, 0x307a                           
  061f  8cda             mov dx, ds                               
  0621  b90800           mov cx, 8                                
  0624  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0629  6a08             push 8                                   
  062b  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0630  83c40e           add sp, 0xe                              
  0633  b8042c           mov ax, 0x2c04                           
  0636  8ec0             mov es, ax                               
  0638  268b1e1001       mov bx, word ptr es:[0x110]              
  063d  6bdb14           imul bx, bx, 0x14                        
  0640  b8042c           mov ax, 0x2c04                           
  0643  8ec0             mov es, ax                               
  0645  26ffb78501       push word ptr es:[bx + 0x185]            
  064a  1e               push ds                                  
  064b  682b31           push 0x312b                               ; "%dgp"
  064e  16               push ss                                  
  064f  8d46ce           lea ax, [bp - 0x32]                      
  0652  50               push ax                                  
  0653  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0658  83c40a           add sp, 0xa                              
  065b  16               push ss                                  
  065c  8d46ce           lea ax, [bp - 0x32]                      
  065f  50               push ax                                  
  0660  66ff36a630       push dword ptr [0x30a6]                  
  0665  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  066a  83c408           add sp, 8                                
  066d  66ff369a30       push dword ptr [0x309a]                  
  0672  b88230           mov ax, 0x3082                           
  0675  8cda             mov dx, ds                               
  0677  b90800           mov cx, 8                                
  067a  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  067f  6a08             push 8                                   
  0681  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0686  83c40e           add sp, 0xe                              
  0689  b8042c           mov ax, 0x2c04                           
  068c  8ec0             mov es, ax                               
  068e  268b1e1001       mov bx, word ptr es:[0x110]              
  0693  d1e3             shl bx, 1                                
  0695  ffb7ca5d         push word ptr [bx + 0x5dca]              
  0699  1e               push ds                                  
  069a  683031           push 0x3130                               ; "%dgp"
  069d  16               push ss                                  
  069e  8d46ce           lea ax, [bp - 0x32]                      
  06a1  50               push ax                                  
  06a2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  06a7  83c40a           add sp, 0xa                              
  06aa  16               push ss                                  
  06ab  8d46ce           lea ax, [bp - 0x32]                      
  06ae  50               push ax                                  
  06af  66ff36aa30       push dword ptr [0x30aa]                  
  06b4  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  06b9  83c408           add sp, 8                                
  06bc  66ff369e30       push dword ptr [0x309e]                  
  06c1  b88a30           mov ax, 0x308a                           
  06c4  8cda             mov dx, ds                               
  06c6  b90800           mov cx, 8                                
  06c9  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  06ce  6a08             push 8                                   
  06d0  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  06d5  83c40e           add sp, 0xe                              
  06d8  b8042c           mov ax, 0x2c04                           
  06db  8ec0             mov es, ax                               
  06dd  268b1e1001       mov bx, word ptr es:[0x110]              
  06e2  d1e3             shl bx, 1                                
  06e4  ffb7da5d         push word ptr [bx + 0x5dda]              
  06e8  1e               push ds                                  
  06e9  683531           push 0x3135                               ; "%dgp"
  06ec  16               push ss                                  
  06ed  8d46ce           lea ax, [bp - 0x32]                      
  06f0  50               push ax                                  
  06f1  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  06f6  83c40a           add sp, 0xa                              
  06f9  16               push ss                                  
  06fa  8d46ce           lea ax, [bp - 0x32]                      
  06fd  50               push ax                                  
  06fe  66ff36ae30       push dword ptr [0x30ae]                  
  0703  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0708  83c408           add sp, 8                                
  070b  c9               leave                                    
  070c  cb               retf                                     

ovl66_070d:  ; ENTRY
  070d  55               push bp                                  
  070e  8bec             mov bp, sp                               
  0710  83ec16           sub sp, 0x16                             
  0713  56               push si                                  
  0714  57               push di                                  
  0715  c746ec0100       mov word ptr [bp - 0x14], 1              
  071a  33ff             xor di, di                               
  071c  c746ea0000       mov word ptr [bp - 0x16], 0              
  0721  833ef83000       cmp word ptr [0x30f8], 0                 
  0726  7403             je 0x72b                                 
  0728  e9e101           jmp 0x90c                                
  072b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0730  666800000300     push 0x30000                             
  0736  666802000f00     push 0xf0002                             
  073c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0741  83c408           add sp, 8                                
  0744  ff36f630         push word ptr [0x30f6]                   
  0748  1e               push ds                                  
  0749  684268           push 0x6842                              
  074c  1e               push ds                                  
  074d  686268           push 0x6862                              
  0750  9a12098c0c       lcall 0xc8c, 0x912                       -> 0c8c:0912
  0755  83c40a           add sp, 0xa                              
  0758  66833e625e00     cmp dword ptr [0x5e62], 0                
  075e  7513             jne 0x773                                
  0760  1e               push ds                                  
  0761  683a31           push 0x313a                              
  0764  16               push ss                                  
  0765  8d46f6           lea ax, [bp - 0xa]                       
  0768  50               push ax                                  
  0769  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  076e  83c408           add sp, 8                                
  0771  eb15             jmp 0x788                                
  0773  ff36005e         push word ptr [0x5e00]                   
  0777  1e               push ds                                  
  0778  683d31           push 0x313d                               ; "%02d"
  077b  16               push ss                                  
  077c  8d46f6           lea ax, [bp - 0xa]                       
  077f  50               push ax                                  
  0780  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0785  83c40a           add sp, 0xa                              
  0788  66ff363630       push dword ptr [0x3036]                  
  078d  b82630           mov ax, 0x3026                           
  0790  8cda             mov dx, ds                               
  0792  b90800           mov cx, 8                                
  0795  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  079a  6a08             push 8                                   
  079c  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  07a1  83c40e           add sp, 0xe                              
  07a4  66ff363a30       push dword ptr [0x303a]                  
  07a9  b82e30           mov ax, 0x302e                           
  07ac  8cda             mov dx, ds                               
  07ae  b90800           mov cx, 8                                
  07b1  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  07b6  6a08             push 8                                   
  07b8  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  07bd  83c40e           add sp, 0xe                              
  07c0  33f6             xor si, si                               
  07c2  eb29             jmp 0x7ed                                
  07c4  8bde             mov bx, si                               
  07c6  c1e302           shl bx, 2                                
  07c9  66ffb73e30       push dword ptr [bx + 0x303e]             
  07ce  8a42f6           mov al, byte ptr [bp + si - 0xa]         
  07d1  98               cwde                                     
  07d2  c1e003           shl ax, 3                                
  07d5  8cda             mov dx, ds                               
  07d7  05d62c           add ax, 0x2cd6                           
  07da  b90800           mov cx, 8                                
  07dd  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  07e2  6a08             push 8                                   
  07e4  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  07e9  83c40e           add sp, 0xe                              
  07ec  46               inc si                                   
  07ed  16               push ss                                  
  07ee  8d46f6           lea ax, [bp - 0xa]                       
  07f1  50               push ax                                  
  07f2  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  07f7  83c404           add sp, 4                                
  07fa  3bc6             cmp ax, si                               
  07fc  7fc6             jg 0x7c4                                 
  07fe  33f6             xor si, si                               
  0800  eb5e             jmp 0x860                                
  0802  8bde             mov bx, si                               
  0804  d1e3             shl bx, 1                                
  0806  83bf426800       cmp word ptr [bx + 0x6842], 0            
  080b  7452             je 0x85f                                 
  080d  8bde             mov bx, si                               
  080f  c1e302           shl bx, 2                                
  0812  c49f6268         les bx, ptr [bx + 0x6862]                
  0816  268a4704         mov al, byte ptr es:[bx + 4]             
  081a  98               cwde                                     
  081b  6bc006           imul ax, ax, 6                           
  081e  8bd8             mov bx, ax                               
  0820  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  0825  7403             je 0x82a                                 
  0827  bf0100           mov di, 1                                
  082a  8bde             mov bx, si                               
  082c  c1e302           shl bx, 2                                
  082f  c49f6268         les bx, ptr [bx + 0x6862]                
  0833  268a4704         mov al, byte ptr es:[bx + 4]             
  0837  98               cwde                                     
  0838  6bc006           imul ax, ax, 6                           
  083b  8bd8             mov bx, ax                               
  083d  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  0842  7405             je 0x849                                 
  0844  c746ea0100       mov word ptr [bp - 0x16], 1              
  0849  8bde             mov bx, si                               
  084b  c1e302           shl bx, 2                                
  084e  c49f6268         les bx, ptr [bx + 0x6862]                
  0852  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0858  7505             jne 0x85f                                
  085a  c746ec0000       mov word ptr [bp - 0x14], 0              
  085f  46               inc si                                   
  0860  3b36f630         cmp si, word ptr [0x30f6]                
  0864  7c9c             jl 0x802                                 
  0866  ff36f630         push word ptr [0x30f6]                   
  086a  1e               push ds                                  
  086b  684268           push 0x6842                              
  086e  1e               push ds                                  
  086f  686268           push 0x6862                              
  0872  9afa078c0c       lcall 0xc8c, 0x7fa                       -> 0c8c:07fa
  0877  83c40a           add sp, 0xa                              
  087a  0bc0             or ax, ax                                
  087c  741e             je 0x89c                                 
  087e  66ff366e30       push dword ptr [0x306e]                  
  0883  b84630           mov ax, 0x3046                           
  0886  8cda             mov dx, ds                               
  0888  b90800           mov cx, 8                                
  088b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0890  6a08             push 8                                   
  0892  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0897  83c40e           add sp, 0xe                              
  089a  eb6b             jmp 0x907                                
  089c  837eec00         cmp word ptr [bp - 0x14], 0              
  08a0  740a             je 0x8ac                                 
  08a2  66ff366e30       push dword ptr [0x306e]                  
  08a7  b86630           mov ax, 0x3066                           
  08aa  ebda             jmp 0x886                                
  08ac  0bff             or di, di                                
  08ae  7410             je 0x8c0                                 
  08b0  837eea00         cmp word ptr [bp - 0x16], 0              
  08b4  740a             je 0x8c0                                 
  08b6  66ff366e30       push dword ptr [0x306e]                  
  08bb  b85e30           mov ax, 0x305e                           
  08be  ebc6             jmp 0x886                                
  08c0  0bff             or di, di                                
  08c2  740a             je 0x8ce                                 
  08c4  66ff366e30       push dword ptr [0x306e]                  
  08c9  b85630           mov ax, 0x3056                           
  08cc  ebb8             jmp 0x886                                
  08ce  837eea00         cmp word ptr [bp - 0x16], 0              
  08d2  740a             je 0x8de                                 
  08d4  66ff366e30       push dword ptr [0x306e]                  
  08d9  b84e30           mov ax, 0x304e                           
  08dc  eba8             jmp 0x886                                
  08de  6a03             push 3                                   
  08e0  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  08e5  59               pop cx                                   
  08e6  66ff364a30       push dword ptr [0x304a]                  
  08eb  66ff366e30       push dword ptr [0x306e]                  
  08f0  16               push ss                                  
  08f1  8d46ee           lea ax, [bp - 0x12]                      
  08f4  50               push ax                                  
  08f5  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  08fa  83c40c           add sp, 0xc                              
  08fd  52               push dx                                  
  08fe  50               push ax                                  
  08ff  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0904  83c404           add sp, 4                                
  0907  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  090c  5f               pop di                                   
  090d  5e               pop si                                   
  090e  c9               leave                                    
  090f  cb               retf                                     

ovl66_0910:  ; ENTRY
  0910  55               push bp                                  
  0911  8bec             mov bp, sp                               
  0913  83ec02           sub sp, 2                                
  0916  8b5e06           mov bx, word ptr [bp + 6]                
  0919  d1e3             shl bx, 1                                
  091b  8b875268         mov ax, word ptr [bx + 0x6852]           
  091f  8946fe           mov word ptr [bp - 2], ax                
  0922  33d2             xor dx, dx                               
  0924  eb1d             jmp 0x943                                
  0926  8bda             mov bx, dx                               
  0928  d1e3             shl bx, 1                                
  092a  8b875268         mov ax, word ptr [bx + 0x6852]           
  092e  3b46fe           cmp ax, word ptr [bp - 2]                
  0931  7505             jne 0x938                                
  0933  b80100           mov ax, 1                                
  0936  eb02             jmp 0x93a                                
  0938  33c0             xor ax, ax                               
  093a  8bda             mov bx, dx                               
  093c  d1e3             shl bx, 1                                
  093e  89874268         mov word ptr [bx + 0x6842], ax           
  0942  42               inc dx                                   
  0943  3b16f630         cmp dx, word ptr [0x30f6]                
  0947  7cdd             jl 0x926                                 
  0949  6a00             push 0                                   
  094b  90               nop                                      
  094c  0e               push cs                                  
  094d  e8970e           call 0x17e7                              
  0950  59               pop cx                                   
  0951  6a00             push 0                                   
  0953  0e               push cs                                  
  0954  e8b3f6           call 0xa                                 
  0957  59               pop cx                                   
  0958  0e               push cs                                  
  0959  e8faf9           call 0x356                               
  095c  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0961  c9               leave                                    
  0962  cb               retf                                     

ovl66_0963:  ; ENTRY
  0963  55               push bp                                  
  0964  8bec             mov bp, sp                               
  0966  83ec10           sub sp, 0x10                             
  0969  56               push si                                  
  096a  8b4e06           mov cx, word ptr [bp + 6]                
  096d  8bd9             mov bx, cx                               
  096f  d1e3             shl bx, 1                                
  0971  83bf426800       cmp word ptr [bx + 0x6842], 0            
  0976  7540             jne 0x9b8                                
  0978  33d2             xor dx, dx                               
  097a  eb16             jmp 0x992                                
  097c  8bda             mov bx, dx                               
  097e  d1e3             shl bx, 1                                
  0980  83bf426800       cmp word ptr [bx + 0x6842], 0            
  0985  740a             je 0x991                                 
  0987  8bda             mov bx, dx                               
  0989  d1e3             shl bx, 1                                
  098b  8bb75268         mov si, word ptr [bx + 0x6852]           
  098f  eb07             jmp 0x998                                
  0991  42               inc dx                                   
  0992  3b16f630         cmp dx, word ptr [0x30f6]                
  0996  7ce4             jl 0x97c                                 
  0998  8bd9             mov bx, cx                               
  099a  d1e3             shl bx, 1                                
  099c  89b75268         mov word ptr [bx + 0x6852], si           
  09a0  8bd9             mov bx, cx                               
  09a2  d1e3             shl bx, 1                                
  09a4  8b874268         mov ax, word ptr [bx + 0x6842]           
  09a8  f7d8             neg ax                                   
  09aa  1bc0             sbb ax, ax                               
  09ac  40               inc ax                                   
  09ad  8bd9             mov bx, cx                               
  09af  d1e3             shl bx, 1                                
  09b1  89874268         mov word ptr [bx + 0x6842], ax           
  09b5  e98200           jmp 0xa3a                                
  09b8  33d2             xor dx, dx                               
  09ba  eb0f             jmp 0x9cb                                
  09bc  8bda             mov bx, dx                               
  09be  d1e3             shl bx, 1                                
  09c0  8d46f0           lea ax, [bp - 0x10]                      
  09c3  03d8             add bx, ax                               
  09c5  36c7070000       mov word ptr ss:[bx], 0                  
  09ca  42               inc dx                                   
  09cb  83fa08           cmp dx, 8                                
  09ce  7cec             jl 0x9bc                                 
  09d0  33d2             xor dx, dx                               
  09d2  eb13             jmp 0x9e7                                
  09d4  8bda             mov bx, dx                               
  09d6  d1e3             shl bx, 1                                
  09d8  8b9f5268         mov bx, word ptr [bx + 0x6852]           
  09dc  d1e3             shl bx, 1                                
  09de  8d46f0           lea ax, [bp - 0x10]                      
  09e1  03d8             add bx, ax                               
  09e3  36ff07           inc word ptr ss:[bx]                     
  09e6  42               inc dx                                   
  09e7  3b16f630         cmp dx, word ptr [0x30f6]                
  09eb  7ce7             jl 0x9d4                                 
  09ed  8bd9             mov bx, cx                               
  09ef  d1e3             shl bx, 1                                
  09f1  8b9f5268         mov bx, word ptr [bx + 0x6852]           
  09f5  d1e3             shl bx, 1                                
  09f7  8d46f0           lea ax, [bp - 0x10]                      
  09fa  03d8             add bx, ax                               
  09fc  36833f01         cmp word ptr ss:[bx], 1                  
  0a00  7438             je 0xa3a                                 
  0a02  33d2             xor dx, dx                               
  0a04  eb10             jmp 0xa16                                
  0a06  8bda             mov bx, dx                               
  0a08  d1e3             shl bx, 1                                
  0a0a  8d46f0           lea ax, [bp - 0x10]                      
  0a0d  03d8             add bx, ax                               
  0a0f  36833f00         cmp word ptr ss:[bx], 0                  
  0a13  7406             je 0xa1b                                 
  0a15  42               inc dx                                   
  0a16  83fa08           cmp dx, 8                                
  0a19  7ceb             jl 0xa06                                 
  0a1b  8bf2             mov si, dx                               
  0a1d  8bd9             mov bx, cx                               
  0a1f  d1e3             shl bx, 1                                
  0a21  8b874268         mov ax, word ptr [bx + 0x6842]           
  0a25  f7d8             neg ax                                   
  0a27  1bc0             sbb ax, ax                               
  0a29  40               inc ax                                   
  0a2a  8bd9             mov bx, cx                               
  0a2c  d1e3             shl bx, 1                                
  0a2e  89874268         mov word ptr [bx + 0x6842], ax           
  0a32  8bd9             mov bx, cx                               
  0a34  d1e3             shl bx, 1                                
  0a36  89b75268         mov word ptr [bx + 0x6852], si           
  0a3a  6a01             push 1                                   
  0a3c  90               nop                                      
  0a3d  0e               push cs                                  
  0a3e  e8a60d           call 0x17e7                              
  0a41  59               pop cx                                   
  0a42  6a00             push 0                                   
  0a44  0e               push cs                                  
  0a45  e8c2f5           call 0xa                                 
  0a48  59               pop cx                                   
  0a49  0e               push cs                                  
  0a4a  e809f9           call 0x356                               
  0a4d  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0a52  5e               pop si                                   
  0a53  c9               leave                                    
  0a54  cb               retf                                     

ovl66_0a55:  ; ENTRY
  0a55  55               push bp                                  
  0a56  8bec             mov bp, sp                               
  0a58  66833e625e00     cmp dword ptr [0x5e62], 0                
  0a5e  7437             je 0xa97                                 
  0a60  33d2             xor dx, dx                               
  0a62  eb15             jmp 0xa79                                
  0a64  8bda             mov bx, dx                               
  0a66  d1e3             shl bx, 1                                
  0a68  c78752680000     mov word ptr [bx + 0x6852], 0            
  0a6e  8bda             mov bx, dx                               
  0a70  d1e3             shl bx, 1                                
  0a72  c78742680100     mov word ptr [bx + 0x6842], 1            
  0a78  42               inc dx                                   
  0a79  3b16f630         cmp dx, word ptr [0x30f6]                
  0a7d  7ce5             jl 0xa64                                 
  0a7f  6a01             push 1                                   
  0a81  90               nop                                      
  0a82  0e               push cs                                  
  0a83  e8610d           call 0x17e7                              
  0a86  59               pop cx                                   
  0a87  6a00             push 0                                   
  0a89  0e               push cs                                  
  0a8a  e87df5           call 0xa                                 
  0a8d  59               pop cx                                   
  0a8e  0e               push cs                                  
  0a8f  e8c4f8           call 0x356                               
  0a92  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0a97  5d               pop bp                                   
  0a98  cb               retf                                     

ovl66_0a99:  ; ENTRY
  0a99  55               push bp                                  
  0a9a  8bec             mov bp, sp                               
  0a9c  33d2             xor dx, dx                               
  0a9e  eb13             jmp 0xab3                                
  0aa0  8bda             mov bx, dx                               
  0aa2  d1e3             shl bx, 1                                
  0aa4  89975268         mov word ptr [bx + 0x6852], dx           
  0aa8  8bda             mov bx, dx                               
  0aaa  d1e3             shl bx, 1                                
  0aac  c78742680000     mov word ptr [bx + 0x6842], 0            
  0ab2  42               inc dx                                   
  0ab3  3b16f630         cmp dx, word ptr [0x30f6]                
  0ab7  7ce7             jl 0xaa0                                 
  0ab9  c70642680100     mov word ptr [0x6842], 1                 
  0abf  6a01             push 1                                   
  0ac1  90               nop                                      
  0ac2  0e               push cs                                  
  0ac3  e8210d           call 0x17e7                              
  0ac6  59               pop cx                                   
  0ac7  6a00             push 0                                   
  0ac9  0e               push cs                                  
  0aca  e83df5           call 0xa                                 
  0acd  59               pop cx                                   
  0ace  0e               push cs                                  
  0acf  e884f8           call 0x356                               
  0ad2  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0ad7  5d               pop bp                                   
  0ad8  cb               retf                                     

ovl66_0ad9:  ; ENTRY
  0ad9  55               push bp                                  
  0ada  8bec             mov bp, sp                               
  0adc  83ec32           sub sp, 0x32                             
  0adf  56               push si                                  
  0ae0  57               push di                                  
  0ae1  8b4e06           mov cx, word ptr [bp + 6]                
  0ae4  8b7e08           mov di, word ptr [bp + 8]                
  0ae7  8b760a           mov si, word ptr [bp + 0xa]              
  0aea  833e741100       cmp word ptr [0x1174], 0                 
  0aef  7403             je 0xaf4                                 
  0af1  e99c01           jmp 0xc90                                
  0af4  833ef83000       cmp word ptr [0x30f8], 0                 
  0af9  7403             je 0xafe                                 
  0afb  e9b100           jmp 0xbaf                                
  0afe  8bc1             mov ax, cx                               
  0b00  05f0ff           add ax, 0xfff0                           
  0b03  bb2800           mov bx, 0x28                             
  0b06  99               cdq                                      
  0b07  f7fb             idiv bx                                  
  0b09  8bf0             mov si, ax                               
  0b0b  81f95001         cmp cx, 0x150                            
  0b0f  7c03             jl 0xb14                                 
  0b11  e98400           jmp 0xb98                                
  0b14  3b36f630         cmp si, word ptr [0x30f6]                
  0b18  7d67             jge 0xb81                                
  0b1a  57               push di                                  
  0b1b  51               push cx                                  
  0b1c  8bde             mov bx, si                               
  0b1e  c1e302           shl bx, 2                                
  0b21  c49f6268         les bx, ptr [bx + 0x6862]                
  0b25  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0b29  98               cwde                                     
  0b2a  50               push ax                                  
  0b2b  8bde             mov bx, si                               
  0b2d  c1e302           shl bx, 2                                
  0b30  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  0b34  268a4707         mov al, byte ptr es:[bx + 7]             
  0b38  98               cwde                                     
  0b39  50               push ax                                  
  0b3a  8bde             mov bx, si                               
  0b3c  c1e302           shl bx, 2                                
  0b3f  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  0b43  268a470b         mov al, byte ptr es:[bx + 0xb]           
  0b47  98               cwde                                     
  0b48  50               push ax                                  
  0b49  8bde             mov bx, si                               
  0b4b  c1e302           shl bx, 2                                
  0b4e  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  0b52  268a4708         mov al, byte ptr es:[bx + 8]             
  0b56  98               cwde                                     
  0b57  50               push ax                                  
  0b58  8bde             mov bx, si                               
  0b5a  c1e302           shl bx, 2                                
  0b5d  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  0b61  268a4706         mov al, byte ptr es:[bx + 6]             
  0b65  98               cwde                                     
  0b66  50               push ax                                  
  0b67  8bde             mov bx, si                               
  0b69  c1e302           shl bx, 2                                
  0b6c  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  0b70  268a4704         mov al, byte ptr es:[bx + 4]             
  0b74  98               cwde                                     
  0b75  50               push ax                                  
  0b76  9a43006c30       lcall 0x306c, 0x43                       -> ovl46:0626
  0b7b  83c410           add sp, 0x10                             
  0b7e  e90901           jmp 0xc8a                                
  0b81  6a00             push 0                                   
  0b83  57               push di                                  
  0b84  51               push cx                                  
  0b85  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0b8a  83c406           add sp, 6                                
  0b8d  1e               push ds                                  
  0b8e  684e31           push 0x314e                               ; "Select armies when present"
  0b91  1e               push ds                                  
  0b92  684231           push 0x3142                               ; "Select Army"
  0b95  e9ea00           jmp 0xc82                                
  0b98  6a00             push 0                                   
  0b9a  57               push di                                  
  0b9b  51               push cx                                  
  0b9c  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0ba1  83c406           add sp, 6                                
  0ba4  1e               push ds                                  
  0ba5  687731           push 0x3177                               ; "Manipulate all armies"
  0ba8  1e               push ds                                  
  0ba9  686931           push 0x3169                               ; "Group/Ungroup"
  0bac  e9d300           jmp 0xc82                                
  0baf  6a00             push 0                                   
  0bb1  57               push di                                  
  0bb2  51               push cx                                  
  0bb3  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0bb8  83c406           add sp, 6                                
  0bbb  8bde             mov bx, si                               
  0bbd  83fb03           cmp bx, 3                                
  0bc0  7603             jbe 0xbc5                                
  0bc2  e9c500           jmp 0xc8a                                
  0bc5  d1e3             shl bx, 1                                
  0bc7  2effa7940c       jmp word ptr cs:[bx + 0xc94]             
ovl66_0bcc:  ; case
  0bcc  b8042c           mov ax, 0x2c04                           
  0bcf  8ec0             mov es, ax                               
  0bd1  268b1e1001       mov bx, word ptr es:[0x110]              
  0bd6  d1e3             shl bx, 1                                
  0bd8  ffb7ea5d         push word ptr [bx + 0x5dea]              
  0bdc  1e               push ds                                  
  0bdd  688d31           push 0x318d                               ; "You have %d cities!"
  0be0  16               push ss                                  
  0be1  8d46ce           lea ax, [bp - 0x32]                      
  0be4  50               push ax                                  
  0be5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0bea  83c40a           add sp, 0xa                              
  0bed  16               push ss                                  
  0bee  8d46ce           lea ax, [bp - 0x32]                      
  0bf1  50               push ax                                  
  0bf2  1e               push ds                                  
  0bf3  68a131           push 0x31a1                               ; "Number of Cities"
  0bf6  e98900           jmp 0xc82                                
ovl66_0bf9:  ; case
  0bf9  b8042c           mov ax, 0x2c04                           
  0bfc  8ec0             mov es, ax                               
  0bfe  268b1e1001       mov bx, word ptr es:[0x110]              
  0c03  6bdb14           imul bx, bx, 0x14                        
  0c06  b8042c           mov ax, 0x2c04                           
  0c09  8ec0             mov es, ax                               
  0c0b  26ffb78501       push word ptr es:[bx + 0x185]            
  0c10  1e               push ds                                  
  0c11  68b231           push 0x31b2                               ; "You have %d gold!"
  0c14  16               push ss                                  
  0c15  8d46ce           lea ax, [bp - 0x32]                      
  0c18  50               push ax                                  
  0c19  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0c1e  83c40a           add sp, 0xa                              
  0c21  16               push ss                                  
  0c22  8d46ce           lea ax, [bp - 0x32]                      
  0c25  50               push ax                                  
  0c26  1e               push ds                                  
  0c27  68c431           push 0x31c4                               ; "Your Treasury"
  0c2a  eb56             jmp 0xc82                                
ovl66_0c2c:  ; case
  0c2c  b8042c           mov ax, 0x2c04                           
  0c2f  8ec0             mov es, ax                               
  0c31  268b1e1001       mov bx, word ptr es:[0x110]              
  0c36  d1e3             shl bx, 1                                
  0c38  ffb7ca5d         push word ptr [bx + 0x5dca]              
  0c3c  1e               push ds                                  
  0c3d  68d231           push 0x31d2                               ; "You earn %d gold!"
  0c40  16               push ss                                  
  0c41  8d46ce           lea ax, [bp - 0x32]                      
  0c44  50               push ax                                  
  0c45  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0c4a  83c40a           add sp, 0xa                              
  0c4d  16               push ss                                  
  0c4e  8d46ce           lea ax, [bp - 0x32]                      
  0c51  50               push ax                                  
  0c52  1e               push ds                                  
  0c53  68e431           push 0x31e4                               ; "Your Income"
  0c56  eb2a             jmp 0xc82                                
ovl66_0c58:  ; case
  0c58  b8042c           mov ax, 0x2c04                           
  0c5b  8ec0             mov es, ax                               
  0c5d  268b1e1001       mov bx, word ptr es:[0x110]              
  0c62  d1e3             shl bx, 1                                
  0c64  ffb7da5d         push word ptr [bx + 0x5dda]              
  0c68  1e               push ds                                  
  0c69  68f031           push 0x31f0                               ; "You pay %d gold!"
  0c6c  16               push ss                                  
  0c6d  8d46ce           lea ax, [bp - 0x32]                      
  0c70  50               push ax                                  
  0c71  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0c76  83c40a           add sp, 0xa                              
  0c79  16               push ss                                  
  0c7a  8d46ce           lea ax, [bp - 0x32]                      
  0c7d  50               push ax                                  
  0c7e  1e               push ds                                  
  0c7f  680132           push 0x3201                               ; "Your Upkeep"
  0c82  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  0c87  83c408           add sp, 8                                
  0c8a  c70674110100     mov word ptr [0x1174], 1                 
  0c90  5f               pop di                                   
  0c91  5e               pop si                                   
  0c92  c9               leave                                    
  0c93  cb               retf                                     
  0c94  cc0bf90b2c0c580c dw 0bcc,0bf9,0c2c,0c58                   jump table

ovl66_0c9c:  ; ENTRY
  0c9c  55               push bp                                  
  0c9d  8bec             mov bp, sp                               
  0c9f  66833e625e00     cmp dword ptr [0x5e62], 0                
  0ca5  7503             jne 0xcaa                                
  0ca7  e98400           jmp 0xd2e                                
  0caa  a1f630           mov ax, word ptr [0x30f6]                
  0cad  a32631           mov word ptr [0x3126], ax                
  0cb0  33c9             xor cx, cx                               
  0cb2  eb4b             jmp 0xcff                                
  0cb4  8bd9             mov bx, cx                               
  0cb6  c1e302           shl bx, 2                                
  0cb9  8b876468         mov ax, word ptr [bx + 0x6864]           
  0cbd  8b976268         mov dx, word ptr [bx + 0x6862]           
  0cc1  8bd9             mov bx, cx                               
  0cc3  c1e302           shl bx, 2                                
  0cc6  89871268         mov word ptr [bx + 0x6812], ax           
  0cca  89971068         mov word ptr [bx + 0x6810], dx           
  0cce  8bd9             mov bx, cx                               
  0cd0  d1e3             shl bx, 1                                
  0cd2  8b875268         mov ax, word ptr [bx + 0x6852]           
  0cd6  8bd9             mov bx, cx                               
  0cd8  d1e3             shl bx, 1                                
  0cda  89870068         mov word ptr [bx + 0x6800], ax           
  0cde  8bd9             mov bx, cx                               
  0ce0  d1e3             shl bx, 1                                
  0ce2  8b874268         mov ax, word ptr [bx + 0x6842]           
  0ce6  8bd9             mov bx, cx                               
  0ce8  d1e3             shl bx, 1                                
  0cea  8987f067         mov word ptr [bx + 0x67f0], ax           
  0cee  8bd9             mov bx, cx                               
  0cf0  d1e3             shl bx, 1                                
  0cf2  8b873268         mov ax, word ptr [bx + 0x6832]           
  0cf6  8bd9             mov bx, cx                               
  0cf8  d1e3             shl bx, 1                                
  0cfa  8987e067         mov word ptr [bx + 0x67e0], ax           
  0cfe  41               inc cx                                   
  0cff  3b0e2631         cmp cx, word ptr [0x3126]                
  0d03  7caf             jl 0xcb4                                 
  0d05  a13068           mov ax, word ptr [0x6830]                
  0d08  a3de67           mov word ptr [0x67de], ax                
  0d0b  66680000ffff     push 0xffff0000                          
  0d11  6a01             push 1                                   
  0d13  90               nop                                      
  0d14  0e               push cs                                  
  0d15  e86d01           call 0xe85                               
  0d18  83c406           add sp, 6                                
  0d1b  c7066a160100     mov word ptr [0x166a], 1                 
  0d21  6a12             push 0x12                                
  0d23  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0d28  59               pop cx                                   
  0d29  90               nop                                      
  0d2a  0e               push cs                                  
  0d2b  e8f706           call 0x1425                              
  0d2e  5d               pop bp                                   
  0d2f  cb               retf                                     

ovl66_0d30:  ; ENTRY
  0d30  55               push bp                                  
  0d31  8bec             mov bp, sp                               
  0d33  83ec08           sub sp, 8                                
  0d36  56               push si                                  
  0d37  57               push di                                  
  0d38  bfffff           mov di, 0xffff                           
  0d3b  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0d40  833eda2b00       cmp word ptr [0x2bda], 0                 
  0d45  750e             jne 0xd55                                
  0d47  c706fe5d0100     mov word ptr [0x5dfe], 1                 
  0d4d  66a1625e         mov eax, dword ptr [0x5e62]              
  0d51  66a33e5e         mov dword ptr [0x5e3e], eax              
  0d55  16               push ss                                  
  0d56  8d46fa           lea ax, [bp - 6]                         
  0d59  50               push ax                                  
  0d5a  c41e625e         les bx, ptr [0x5e62]                     
  0d5e  26ff7702         push word ptr es:[bx + 2]                
  0d62  26ff37           push word ptr es:[bx]                    
  0d65  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0d6a  83c408           add sp, 8                                
  0d6d  6a00             push 0                                   
  0d6f  ff76fa           push word ptr [bp - 6]                   
  0d72  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  0d77  83c404           add sp, 4                                
  0d7a  8b46fa           mov ax, word ptr [bp - 6]                
  0d7d  8946fe           mov word ptr [bp - 2], ax                
  0d80  33c9             xor cx, cx                               
  0d82  e9ac00           jmp 0xe31                                
  0d85  33f6             xor si, si                               
  0d87  c746f80000       mov word ptr [bp - 8], 0                 
  0d8c  eb26             jmp 0xdb4                                
  0d8e  8bde             mov bx, si                               
  0d90  c1e302           shl bx, 2                                
  0d93  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  0d97  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  0d9b  8bd9             mov bx, cx                               
  0d9d  c1e302           shl bx, 2                                
  0da0  3b87205e         cmp ax, word ptr [bx + 0x5e20]           
  0da4  750d             jne 0xdb3                                
  0da6  3b971e5e         cmp dx, word ptr [bx + 0x5e1e]           
  0daa  7507             jne 0xdb3                                
  0dac  c746f80100       mov word ptr [bp - 8], 1                 
  0db1  eb07             jmp 0xdba                                
  0db3  46               inc si                                   
  0db4  3b36fe5d         cmp si, word ptr [0x5dfe]                
  0db8  7cd4             jl 0xd8e                                 
  0dba  8bd9             mov bx, cx                               
  0dbc  c1e302           shl bx, 2                                
  0dbf  c49f1e5e         les bx, ptr [bx + 0x5e1e]                
  0dc3  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0dc7  b400             mov ah, 0                                
  0dc9  8bf0             mov si, ax                               
  0dcb  3976fc           cmp word ptr [bp - 4], si                
  0dce  7508             jne 0xdd8                                
  0dd0  0bf6             or si, si                                
  0dd2  7404             je 0xdd8                                 
  0dd4  0bff             or di, di                                
  0dd6  7d0d             jge 0xde5                                
  0dd8  8bd9             mov bx, cx                               
  0dda  d1e3             shl bx, 1                                
  0ddc  c78732680000     mov word ptr [bx + 0x6832], 0            
  0de2  47               inc di                                   
  0de3  eb0a             jmp 0xdef                                
  0de5  8bd9             mov bx, cx                               
  0de7  d1e3             shl bx, 1                                
  0de9  c7873268ffff     mov word ptr [bx + 0x6832], 0xffff       
  0def  8bd9             mov bx, cx                               
  0df1  d1e3             shl bx, 1                                
  0df3  89bf5268         mov word ptr [bx + 0x6852], di           
  0df7  8bd9             mov bx, cx                               
  0df9  c1e302           shl bx, 2                                
  0dfc  8b87205e         mov ax, word ptr [bx + 0x5e20]           
  0e00  8b971e5e         mov dx, word ptr [bx + 0x5e1e]           
  0e04  8bd9             mov bx, cx                               
  0e06  c1e302           shl bx, 2                                
  0e09  89876468         mov word ptr [bx + 0x6864], ax           
  0e0d  89976268         mov word ptr [bx + 0x6862], dx           
  0e11  837ef800         cmp word ptr [bp - 8], 0                 
  0e15  740c             je 0xe23                                 
  0e17  8bd9             mov bx, cx                               
  0e19  d1e3             shl bx, 1                                
  0e1b  c78742680100     mov word ptr [bx + 0x6842], 1            
  0e21  eb0a             jmp 0xe2d                                
  0e23  8bd9             mov bx, cx                               
  0e25  d1e3             shl bx, 1                                
  0e27  c78742680000     mov word ptr [bx + 0x6842], 0            
  0e2d  8976fc           mov word ptr [bp - 4], si                
  0e30  41               inc cx                                   
  0e31  3b4efe           cmp cx, word ptr [bp - 2]                
  0e34  7d03             jge 0xe39                                
  0e36  e94cff           jmp 0xd85                                
  0e39  8b4efe           mov cx, word ptr [bp - 2]                
  0e3c  eb30             jmp 0xe6e                                
  0e3e  8bd9             mov bx, cx                               
  0e40  d1e3             shl bx, 1                                
  0e42  c78742680000     mov word ptr [bx + 0x6842], 0            
  0e48  8bd9             mov bx, cx                               
  0e4a  d1e3             shl bx, 1                                
  0e4c  c7875268ffff     mov word ptr [bx + 0x6852], 0xffff       
  0e52  8bd9             mov bx, cx                               
  0e54  d1e3             shl bx, 1                                
  0e56  c7873268ffff     mov word ptr [bx + 0x6832], 0xffff       
  0e5c  8bd9             mov bx, cx                               
  0e5e  c1e302           shl bx, 2                                
  0e61  c78764680000     mov word ptr [bx + 0x6864], 0            
  0e67  c78762680000     mov word ptr [bx + 0x6862], 0            
  0e6d  41               inc cx                                   
  0e6e  83f908           cmp cx, 8                                
  0e71  7ccb             jl 0xe3e                                 
  0e73  8b46fe           mov ax, word ptr [bp - 2]                
  0e76  a3f630           mov word ptr [0x30f6], ax                
  0e79  6a00             push 0                                   
  0e7b  90               nop                                      
  0e7c  0e               push cs                                  
  0e7d  e86709           call 0x17e7                              
  0e80  59               pop cx                                   
  0e81  5f               pop di                                   
  0e82  5e               pop si                                   
  0e83  c9               leave                                    
  0e84  cb               retf                                     

ovl66_0e85:  ; ENTRY
  0e85  55               push bp                                  
  0e86  8bec             mov bp, sp                               
  0e88  83ec26           sub sp, 0x26                             
  0e8b  56               push si                                  
  0e8c  57               push di                                  
  0e8d  8b7608           mov si, word ptr [bp + 8]                
  0e90  8b7e0a           mov di, word ptr [bp + 0xa]              
  0e93  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0e98  837e0600         cmp word ptr [bp + 6], 0                 
  0e9c  7464             je 0xf02                                 
  0e9e  6a00             push 0                                   
  0ea0  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0ea5  59               pop cx                                   
  0ea6  66ff360231       push dword ptr [0x3102]                  
  0eab  b8fa30           mov ax, 0x30fa                           
  0eae  8cda             mov dx, ds                               
  0eb0  b90800           mov cx, 8                                
  0eb3  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0eb8  6a2e             push 0x2e                                
  0eba  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0ebf  83c40e           add sp, 0xe                              
  0ec2  666800000300     push 0x30000                             
  0ec8  666802000f00     push 0xf0002                             
  0ece  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ed3  83c408           add sp, 8                                
  0ed6  b8042c           mov ax, 0x2c04                           
  0ed9  8ec0             mov es, ax                               
  0edb  26ff361201       push word ptr es:[0x112]                 
  0ee0  1e               push ds                                  
  0ee1  680d32           push 0x320d                               ; "(max +%d)"
  0ee4  1e               push ds                                  
  0ee5  68885c           push 0x5c88                              
  0ee8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0eed  83c40a           add sp, 0xa                              
  0ef0  1e               push ds                                  
  0ef1  68885c           push 0x5c88                              
  0ef4  6668e0014200     push 0x4201e0                            
  0efa  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0eff  83c408           add sp, 8                                
  0f02  16               push ss                                  
  0f03  8d46da           lea ax, [bp - 0x26]                      
  0f06  50               push ax                                  
  0f07  90               nop                                      
  0f08  0e               push cs                                  
  0f09  e8900c           call 0x1b9c                              
  0f0c  83c404           add sp, 4                                
  0f0f  0bf6             or si, si                                
  0f11  7404             je 0xf17                                 
  0f13  8bc7             mov ax, di                               
  0f15  eb02             jmp 0xf19                                
  0f17  33c0             xor ax, ax                               
  0f19  8946fe           mov word ptr [bp - 2], ax                
  0f1c  0bf6             or si, si                                
  0f1e  7404             je 0xf24                                 
  0f20  8bc7             mov ax, di                               
  0f22  eb03             jmp 0xf27                                
  0f24  b80700           mov ax, 7                                
  0f27  8946fc           mov word ptr [bp - 4], ax                
  0f2a  666800000300     push 0x30000                             
  0f30  666802000f00     push 0xf0002                             
  0f36  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0f3b  83c408           add sp, 8                                
  0f3e  33f6             xor si, si                               
  0f40  eb71             jmp 0xfb3                                
  0f42  8bde             mov bx, si                               
  0f44  d1e3             shl bx, 1                                
  0f46  83bf3268ff       cmp word ptr [bx + 0x6832], -1           
  0f4b  7446             je 0xf93                                 
  0f4d  8bde             mov bx, si                               
  0f4f  c1e302           shl bx, 2                                
  0f52  8b870631         mov ax, word ptr [bx + 0x3106]           
  0f56  05e0ff           add ax, 0xffe0                           
  0f59  8946f4           mov word ptr [bp - 0xc], ax              
  0f5c  8bde             mov bx, si                               
  0f5e  c1e302           shl bx, 2                                
  0f61  8b870831         mov ax, word ptr [bx + 0x3108]           
  0f65  050500           add ax, 5                                
  0f68  8946f6           mov word ptr [bp - 0xa], ax              
  0f6b  66ff76f4         push dword ptr [bp - 0xc]                
  0f6f  8bde             mov bx, si                               
  0f71  d1e3             shl bx, 1                                
  0f73  8b873268         mov ax, word ptr [bx + 0x6832]           
  0f77  c1e003           shl ax, 3                                
  0f7a  8cda             mov dx, ds                               
  0f7c  05b230           add ax, 0x30b2                           
  0f7f  b90800           mov cx, 8                                
  0f82  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0f87  6a08             push 8                                   
  0f89  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0f8e  83c40e           add sp, 0xe                              
  0f91  eb1f             jmp 0xfb2                                
  0f93  837e0600         cmp word ptr [bp + 6], 0                 
  0f97  7519             jne 0xfb2                                
  0f99  666820001e00     push 0x1e0020                            
  0f9f  8bc6             mov ax, si                               
  0fa1  6bc01e           imul ax, ax, 0x1e                        
  0fa4  052300           add ax, 0x23                             
  0fa7  50               push ax                                  
  0fa8  6a00             push 0                                   
  0faa  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0faf  83c408           add sp, 8                                
  0fb2  46               inc si                                   
  0fb3  3b36f630         cmp si, word ptr [0x30f6]                
  0fb7  7c89             jl 0xf42                                 
  0fb9  8b76fe           mov si, word ptr [bp - 2]                
  0fbc  e95504           jmp 0x1414                               
  0fbf  3b36f630         cmp si, word ptr [0x30f6]                
  0fc3  7c03             jl 0xfc8                                 
  0fc5  e91304           jmp 0x13db                               
  0fc8  8bde             mov bx, si                               
  0fca  d1e3             shl bx, 1                                
  0fcc  b8042c           mov ax, 0x2c04                           
  0fcf  8ec0             mov es, ax                               
  0fd1  26a11001         mov ax, word ptr es:[0x110]              
  0fd5  03875268         add ax, word ptr [bx + 0x6852]           
  0fd9  bb0800           mov bx, 8                                
  0fdc  99               cdq                                      
  0fdd  f7fb             idiv bx                                  
  0fdf  83c202           add dx, 2                                
  0fe2  8956fa           mov word ptr [bp - 6], dx                
  0fe5  8bde             mov bx, si                               
  0fe7  d1e3             shl bx, 1                                
  0fe9  83bf426800       cmp word ptr [bx + 0x6842], 0            
  0fee  7404             je 0xff4                                 
  0ff0  33c0             xor ax, ax                               
  0ff2  eb03             jmp 0xff7                                
  0ff4  b80100           mov ax, 1                                
  0ff7  8946f8           mov word ptr [bp - 8], ax                
  0ffa  50               push ax                                  
  0ffb  6a00             push 0                                   
  0ffd  ff76fa           push word ptr [bp - 6]                   
  1000  666a00           push 0                                   
  1003  666a00           push 0                                   
  1006  8bde             mov bx, si                               
  1008  c1e302           shl bx, 2                                
  100b  ffb70831         push word ptr [bx + 0x3108]              
  100f  8bde             mov bx, si                               
  1011  c1e302           shl bx, 2                                
  1014  ffb70631         push word ptr [bx + 0x3106]              
  1018  1e               push ds                                  
  1019  682a34           push 0x342a                              
  101c  b8042c           mov ax, 0x2c04                           
  101f  8ec0             mov es, ax                               
  1021  26ff361001       push word ptr es:[0x110]                 
  1026  8bde             mov bx, si                               
  1028  c1e302           shl bx, 2                                
  102b  c49f6268         les bx, ptr [bx + 0x6862]                
  102f  268a4704         mov al, byte ptr es:[bx + 4]             
  1033  98               cwde                                     
  1034  50               push ax                                  
  1035  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  103a  83c41a           add sp, 0x1a                             
  103d  837e0600         cmp word ptr [bp + 6], 0                 
  1041  7519             jne 0x105c                               
  1043  6668a0011400     push 0x1401a0                            
  1049  8bc6             mov ax, si                               
  104b  6bc01e           imul ax, ax, 0x1e                        
  104e  052300           add ax, 0x23                             
  1051  50               push ax                                  
  1052  6a40             push 0x40                                
  1054  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  1059  83c408           add sp, 8                                
  105c  8bde             mov bx, si                               
  105e  c1e302           shl bx, 2                                
  1061  c49f6268         les bx, ptr [bx + 0x6862]                
  1065  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  106a  7503             jne 0x106f                               
  106c  e99700           jmp 0x1106                               
  106f  8bde             mov bx, si                               
  1071  c1e302           shl bx, 2                                
  1074  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  1078  268a4704         mov al, byte ptr es:[bx + 4]             
  107c  98               cwde                                     
  107d  6bc006           imul ax, ax, 6                           
  1080  8bd8             mov bx, ax                               
  1082  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  1086  98               cwde                                     
  1087  0bc0             or ax, ax                                
  1089  757b             jne 0x1106                               
  108b  33ff             xor di, di                               
  108d  eb65             jmp 0x10f4                               
  108f  8bde             mov bx, si                               
  1091  c1e302           shl bx, 2                                
  1094  8b870831         mov ax, word ptr [bx + 0x3108]           
  1098  50               push ax                                  
  1099  8bc7             mov ax, di                               
  109b  bb0200           mov bx, 2                                
  109e  99               cdq                                      
  109f  f7fb             idiv bx                                  
  10a1  6bd209           imul dx, dx, 9                           
  10a4  58               pop ax                                   
  10a5  03c2             add ax, dx                               
  10a7  050800           add ax, 8                                
  10aa  50               push ax                                  
  10ab  8bde             mov bx, si                               
  10ad  c1e302           shl bx, 2                                
  10b0  8b870631         mov ax, word ptr [bx + 0x3106]           
  10b4  50               push ax                                  
  10b5  8bc7             mov ax, di                               
  10b7  99               cdq                                      
  10b8  2bc2             sub ax, dx                               
  10ba  d1f8             sar ax, 1                                
  10bc  c1e003           shl ax, 3                                
  10bf  5a               pop dx                                   
  10c0  03d0             add dx, ax                               
  10c2  83c220           add dx, 0x20                             
  10c5  52               push dx                                  
  10c6  16               push ss                                  
  10c7  8d46f4           lea ax, [bp - 0xc]                       
  10ca  50               push ax                                  
  10cb  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  10d0  83c408           add sp, 8                                
  10d3  66ff76f4         push dword ptr [bp - 0xc]                
  10d7  8bc7             mov ax, di                               
  10d9  c1e003           shl ax, 3                                
  10dc  8cda             mov dx, ds                               
  10de  05a62f           add ax, 0x2fa6                           
  10e1  b90800           mov cx, 8                                
  10e4  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  10e9  6a08             push 8                                   
  10eb  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  10f0  83c40e           add sp, 0xe                              
  10f3  47               inc di                                   
  10f4  8bde             mov bx, si                               
  10f6  c1e302           shl bx, 2                                
  10f9  c49f6268         les bx, ptr [bx + 0x6862]                
  10fd  268a470a         mov al, byte ptr es:[bx + 0xa]           
  1101  98               cwde                                     
  1102  3bc7             cmp ax, di                               
  1104  7f89             jg 0x108f                                
  1106  8bde             mov bx, si                               
  1108  c1e302           shl bx, 2                                
  110b  c49f6268         les bx, ptr [bx + 0x6862]                
  110f  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  1114  7519             jne 0x112f                               
  1116  8bde             mov bx, si                               
  1118  c1e302           shl bx, 2                                
  111b  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  111f  268a470a         mov al, byte ptr es:[bx + 0xa]           
  1123  98               cwde                                     
  1124  6bc014           imul ax, ax, 0x14                        
  1127  052302           add ax, 0x223                            
  112a  68042c           push 0x2c04                              
  112d  eb16             jmp 0x1145                               
  112f  8bde             mov bx, si                               
  1131  c1e302           shl bx, 2                                
  1134  c49f6268         les bx, ptr [bx + 0x6862]                
  1138  268a4704         mov al, byte ptr es:[bx + 4]             
  113c  98               cwde                                     
  113d  50               push ax                                  
  113e  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  1143  59               pop cx                                   
  1144  52               push dx                                  
  1145  50               push ax                                  
  1146  8bde             mov bx, si                               
  1148  c1e302           shl bx, 2                                
  114b  8b870831         mov ax, word ptr [bx + 0x3108]           
  114f  050500           add ax, 5                                
  1152  50               push ax                                  
  1153  8bde             mov bx, si                               
  1155  c1e302           shl bx, 2                                
  1158  8b870631         mov ax, word ptr [bx + 0x3106]           
  115c  053000           add ax, 0x30                             
  115f  50               push ax                                  
  1160  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1165  83c408           add sp, 8                                
  1168  8bde             mov bx, si                               
  116a  c1e302           shl bx, 2                                
  116d  c49f6268         les bx, ptr [bx + 0x6862]                
  1171  268a4708         mov al, byte ptr es:[bx + 8]             
  1175  98               cwde                                     
  1176  8bf8             mov di, ax                               
  1178  8bde             mov bx, si                               
  117a  c1e302           shl bx, 2                                
  117d  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  1181  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  1186  7514             jne 0x119c                               
  1188  8bde             mov bx, si                               
  118a  c1e302           shl bx, 2                                
  118d  66ffb76268       push dword ptr [bx + 0x6862]             
  1192  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  1197  83c404           add sp, 4                                
  119a  03f8             add di, ax                               
  119c  83ff09           cmp di, 9                                
  119f  7e03             jle 0x11a4                               
  11a1  bf0900           mov di, 9                                
  11a4  57               push di                                  
  11a5  1e               push ds                                  
  11a6  681732           push 0x3217                              
  11a9  16               push ss                                  
  11aa  8d46ea           lea ax, [bp - 0x16]                      
  11ad  50               push ax                                  
  11ae  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  11b3  83c40a           add sp, 0xa                              
  11b6  16               push ss                                  
  11b7  8d46ea           lea ax, [bp - 0x16]                      
  11ba  50               push ax                                  
  11bb  8bde             mov bx, si                               
  11bd  c1e302           shl bx, 2                                
  11c0  8b870831         mov ax, word ptr [bx + 0x3108]           
  11c4  050500           add ax, 5                                
  11c7  50               push ax                                  
  11c8  8bde             mov bx, si                               
  11ca  c1e302           shl bx, 2                                
  11cd  8b870631         mov ax, word ptr [bx + 0x3106]           
  11d1  05a800           add ax, 0xa8                             
  11d4  50               push ax                                  
  11d5  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  11da  83c408           add sp, 8                                
  11dd  8bde             mov bx, si                               
  11df  d1e3             shl bx, 1                                
  11e1  83bf426800       cmp word ptr [bx + 0x6842], 0            
  11e6  7444             je 0x122c                                
  11e8  8bde             mov bx, si                               
  11ea  d1e3             shl bx, 1                                
  11ec  8d46da           lea ax, [bp - 0x26]                      
  11ef  03d8             add bx, ax                               
  11f1  36ff37           push word ptr ss:[bx]                    
  11f4  1e               push ds                                  
  11f5  681a32           push 0x321a                               ; "(%d)"
  11f8  16               push ss                                  
  11f9  8d46ea           lea ax, [bp - 0x16]                      
  11fc  50               push ax                                  
  11fd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1202  83c40a           add sp, 0xa                              
  1205  16               push ss                                  
  1206  8d46ea           lea ax, [bp - 0x16]                      
  1209  50               push ax                                  
  120a  8bde             mov bx, si                               
  120c  c1e302           shl bx, 2                                
  120f  8b870831         mov ax, word ptr [bx + 0x3108]           
  1213  050500           add ax, 5                                
  1216  50               push ax                                  
  1217  8bde             mov bx, si                               
  1219  c1e302           shl bx, 2                                
  121c  8b870631         mov ax, word ptr [bx + 0x3106]           
  1220  05b800           add ax, 0xb8                             
  1223  50               push ax                                  
  1224  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1229  83c408           add sp, 8                                
  122c  8bde             mov bx, si                               
  122e  c1e302           shl bx, 2                                
  1231  c49f6268         les bx, ptr [bx + 0x6862]                
  1235  268a4707         mov al, byte ptr es:[bx + 7]             
  1239  98               cwde                                     
  123a  50               push ax                                  
  123b  1e               push ds                                  
  123c  681f32           push 0x321f                              
  123f  16               push ss                                  
  1240  8d46ea           lea ax, [bp - 0x16]                      
  1243  50               push ax                                  
  1244  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1249  83c40a           add sp, 0xa                              
  124c  16               push ss                                  
  124d  8d46ea           lea ax, [bp - 0x16]                      
  1250  50               push ax                                  
  1251  8bde             mov bx, si                               
  1253  c1e302           shl bx, 2                                
  1256  8b870831         mov ax, word ptr [bx + 0x3108]           
  125a  050500           add ax, 5                                
  125d  50               push ax                                  
  125e  8bde             mov bx, si                               
  1260  c1e302           shl bx, 2                                
  1263  8b870631         mov ax, word ptr [bx + 0x3106]           
  1267  05e800           add ax, 0xe8                             
  126a  50               push ax                                  
  126b  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1270  83c408           add sp, 8                                
  1273  8bde             mov bx, si                               
  1275  c1e302           shl bx, 2                                
  1278  8b870831         mov ax, word ptr [bx + 0x3108]           
  127c  050800           add ax, 8                                
  127f  50               push ax                                  
  1280  8bde             mov bx, si                               
  1282  c1e302           shl bx, 2                                
  1285  8b870631         mov ax, word ptr [bx + 0x3106]           
  1289  050001           add ax, 0x100                            
  128c  50               push ax                                  
  128d  16               push ss                                  
  128e  8d46f4           lea ax, [bp - 0xc]                       
  1291  50               push ax                                  
  1292  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  1297  83c408           add sp, 8                                
  129a  8bde             mov bx, si                               
  129c  c1e302           shl bx, 2                                
  129f  c49f6268         les bx, ptr [bx + 0x6862]                
  12a3  268a4704         mov al, byte ptr es:[bx + 4]             
  12a7  98               cwde                                     
  12a8  6bc006           imul ax, ax, 6                           
  12ab  8bd8             mov bx, ax                               
  12ad  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  12b2  7526             jne 0x12da                               
  12b4  8bde             mov bx, si                               
  12b6  c1e302           shl bx, 2                                
  12b9  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  12bd  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  12c2  7520             jne 0x12e4                               
  12c4  8bde             mov bx, si                               
  12c6  c1e302           shl bx, 2                                
  12c9  66ffb76268       push dword ptr [bx + 0x6862]             
  12ce  9a2f001d30       lcall 0x301d, 0x2f                       -> ovl35:08b4
  12d3  83c404           add sp, 4                                
  12d6  0bc0             or ax, ax                                
  12d8  740a             je 0x12e4                                
  12da  66ff76f4         push dword ptr [bp - 0xc]                
  12de  b84630           mov ax, 0x3046                           
  12e1  e99c00           jmp 0x1380                               
  12e4  8bde             mov bx, si                               
  12e6  c1e302           shl bx, 2                                
  12e9  c49f6268         les bx, ptr [bx + 0x6862]                
  12ed  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  12f3  740a             je 0x12ff                                
  12f5  66ff76f4         push dword ptr [bp - 0xc]                
  12f9  b86630           mov ax, 0x3066                           
  12fc  e98100           jmp 0x1380                               
  12ff  8bde             mov bx, si                               
  1301  c1e302           shl bx, 2                                
  1304  c49f6268         les bx, ptr [bx + 0x6862]                
  1308  268a4704         mov al, byte ptr es:[bx + 4]             
  130c  98               cwde                                     
  130d  6bc006           imul ax, ax, 6                           
  1310  8bd8             mov bx, ax                               
  1312  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  1317  7423             je 0x133c                                
  1319  8bde             mov bx, si                               
  131b  c1e302           shl bx, 2                                
  131e  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  1322  268a4704         mov al, byte ptr es:[bx + 4]             
  1326  98               cwde                                     
  1327  6bc006           imul ax, ax, 6                           
  132a  8bd8             mov bx, ax                               
  132c  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  1331  7409             je 0x133c                                
  1333  66ff76f4         push dword ptr [bp - 0xc]                
  1337  b85e30           mov ax, 0x305e                           
  133a  eb44             jmp 0x1380                               
  133c  8bde             mov bx, si                               
  133e  c1e302           shl bx, 2                                
  1341  c49f6268         les bx, ptr [bx + 0x6862]                
  1345  268a4704         mov al, byte ptr es:[bx + 4]             
  1349  98               cwde                                     
  134a  6bc006           imul ax, ax, 6                           
  134d  8bd8             mov bx, ax                               
  134f  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  1354  7409             je 0x135f                                
  1356  66ff76f4         push dword ptr [bp - 0xc]                
  135a  b85630           mov ax, 0x3056                           
  135d  eb21             jmp 0x1380                               
  135f  8bde             mov bx, si                               
  1361  c1e302           shl bx, 2                                
  1364  c49f6268         les bx, ptr [bx + 0x6862]                
  1368  268a4704         mov al, byte ptr es:[bx + 4]             
  136c  98               cwde                                     
  136d  6bc006           imul ax, ax, 6                           
  1370  8bd8             mov bx, ax                               
  1372  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  1377  741b             je 0x1394                                
  1379  66ff76f4         push dword ptr [bp - 0xc]                
  137d  b84e30           mov ax, 0x304e                           
  1380  8cda             mov dx, ds                               
  1382  b90800           mov cx, 8                                
  1385  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  138a  6a08             push 8                                   
  138c  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1391  83c40e           add sp, 0xe                              
  1394  8bde             mov bx, si                               
  1396  c1e302           shl bx, 2                                
  1399  66ffb76268       push dword ptr [bx + 0x6862]             
  139e  8bde             mov bx, si                               
  13a0  c1e302           shl bx, 2                                
  13a3  c49f6268         les bx, ptr [bx + 0x6862]                
  13a7  268a4704         mov al, byte ptr es:[bx + 4]             
  13ab  98               cwde                                     
  13ac  50               push ax                                  
  13ad  90               nop                                      
  13ae  0e               push cs                                  
  13af  e85506           call 0x1a07                              
  13b2  83c406           add sp, 6                                
  13b5  52               push dx                                  
  13b6  50               push ax                                  
  13b7  8bde             mov bx, si                               
  13b9  c1e302           shl bx, 2                                
  13bc  8b870831         mov ax, word ptr [bx + 0x3108]           
  13c0  050500           add ax, 5                                
  13c3  50               push ax                                  
  13c4  8bde             mov bx, si                               
  13c6  c1e302           shl bx, 2                                
  13c9  8b870631         mov ax, word ptr [bx + 0x3106]           
  13cd  053001           add ax, 0x130                            
  13d0  50               push ax                                  
  13d1  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  13d6  83c408           add sp, 8                                
  13d9  eb38             jmp 0x1413                               
  13db  666a00           push 0                                   
  13de  666800000100     push 0x10000                             
  13e4  666a00           push 0                                   
  13e7  6a00             push 0                                   
  13e9  8bde             mov bx, si                               
  13eb  c1e302           shl bx, 2                                
  13ee  ffb70831         push word ptr [bx + 0x3108]              
  13f2  8bde             mov bx, si                               
  13f4  c1e302           shl bx, 2                                
  13f7  ffb70631         push word ptr [bx + 0x3106]              
  13fb  1e               push ds                                  
  13fc  682a34           push 0x342a                              
  13ff  b8042c           mov ax, 0x2c04                           
  1402  8ec0             mov es, ax                               
  1404  26ff361001       push word ptr es:[0x110]                 
  1409  6aff             push -1                                  
  140b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1410  83c41a           add sp, 0x1a                             
  1413  46               inc si                                   
  1414  3b76fc           cmp si, word ptr [bp - 4]                
  1417  7f03             jg 0x141c                                
  1419  e9a3fb           jmp 0xfbf                                
  141c  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1421  5f               pop di                                   
  1422  5e               pop si                                   
  1423  c9               leave                                    
  1424  cb               retf                                     

ovl66_1425:  ; ENTRY
  1425  55               push bp                                  
  1426  8bec             mov bp, sp                               
  1428  56               push si                                  
  1429  66684c010100     push 0x1014c                             
  142f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1434  83c404           add sp, 4                                
  1437  66684d010100     push 0x1014d                             
  143d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1442  83c404           add sp, 4                                
  1445  833ef63001       cmp word ptr [0x30f6], 1                 
  144a  7e12             jle 0x145e                               
  144c  66684f010100     push 0x1014f                             
  1452  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1457  83c404           add sp, 4                                
  145a  6a01             push 1                                   
  145c  eb10             jmp 0x146e                               
  145e  66684f010200     push 0x2014f                             
  1464  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1469  83c404           add sp, 4                                
  146c  6a02             push 2                                   
  146e  684e01           push 0x14e                               
  1471  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1476  83c404           add sp, 4                                
  1479  33f6             xor si, si                               
  147b  eb21             jmp 0x149e                               
  147d  6a01             push 1                                   
  147f  8bc6             mov ax, si                               
  1481  055001           add ax, 0x150                            
  1484  50               push ax                                  
  1485  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  148a  83c404           add sp, 4                                
  148d  6a01             push 1                                   
  148f  8bc6             mov ax, si                               
  1491  055801           add ax, 0x158                            
  1494  50               push ax                                  
  1495  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  149a  83c404           add sp, 4                                
  149d  46               inc si                                   
  149e  3b36f630         cmp si, word ptr [0x30f6]                
  14a2  7cd9             jl 0x147d                                
  14a4  8b36f630         mov si, word ptr [0x30f6]                
  14a8  eb21             jmp 0x14cb                               
  14aa  6a02             push 2                                   
  14ac  8bc6             mov ax, si                               
  14ae  055001           add ax, 0x150                            
  14b1  50               push ax                                  
  14b2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  14b7  83c404           add sp, 4                                
  14ba  6a02             push 2                                   
  14bc  8bc6             mov ax, si                               
  14be  055801           add ax, 0x158                            
  14c1  50               push ax                                  
  14c2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  14c7  83c404           add sp, 4                                
  14ca  46               inc si                                   
  14cb  83fe08           cmp si, 8                                
  14ce  7cda             jl 0x14aa                                
  14d0  5e               pop si                                   
  14d1  5d               pop bp                                   
  14d2  cb               retf                                     

ovl66_14d3:  ; ENTRY
  14d3  55               push bp                                  
  14d4  8bec             mov bp, sp                               
  14d6  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  14db  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  14e0  666a00           push 0                                   
  14e3  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  14e8  83c404           add sp, 4                                
  14eb  6a00             push 0                                   
  14ed  0e               push cs                                  
  14ee  e819eb           call 0xa                                 
  14f1  59               pop cx                                   
  14f2  0e               push cs                                  
  14f3  e860ee           call 0x356                               
  14f6  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  14fb  5d               pop bp                                   
  14fc  cb               retf                                     

ovl66_14fd:  ; ENTRY
  14fd  55               push bp                                  
  14fe  8bec             mov bp, sp                               
  1500  a12631           mov ax, word ptr [0x3126]                
  1503  a3f630           mov word ptr [0x30f6], ax                
  1506  33c9             xor cx, cx                               
  1508  eb4b             jmp 0x1555                               
  150a  8bd9             mov bx, cx                               
  150c  c1e302           shl bx, 2                                
  150f  8b871268         mov ax, word ptr [bx + 0x6812]           
  1513  8b971068         mov dx, word ptr [bx + 0x6810]           
  1517  8bd9             mov bx, cx                               
  1519  c1e302           shl bx, 2                                
  151c  89876468         mov word ptr [bx + 0x6864], ax           
  1520  89976268         mov word ptr [bx + 0x6862], dx           
  1524  8bd9             mov bx, cx                               
  1526  d1e3             shl bx, 1                                
  1528  8b870068         mov ax, word ptr [bx + 0x6800]           
  152c  8bd9             mov bx, cx                               
  152e  d1e3             shl bx, 1                                
  1530  89875268         mov word ptr [bx + 0x6852], ax           
  1534  8bd9             mov bx, cx                               
  1536  d1e3             shl bx, 1                                
  1538  8b87f067         mov ax, word ptr [bx + 0x67f0]           
  153c  8bd9             mov bx, cx                               
  153e  d1e3             shl bx, 1                                
  1540  89874268         mov word ptr [bx + 0x6842], ax           
  1544  8bd9             mov bx, cx                               
  1546  d1e3             shl bx, 1                                
  1548  8b87e067         mov ax, word ptr [bx + 0x67e0]           
  154c  8bd9             mov bx, cx                               
  154e  d1e3             shl bx, 1                                
  1550  89873268         mov word ptr [bx + 0x6832], ax           
  1554  41               inc cx                                   
  1555  3b0ef630         cmp cx, word ptr [0x30f6]                
  1559  7caf             jl 0x150a                                
  155b  a1de67           mov ax, word ptr [0x67de]                
  155e  a33068           mov word ptr [0x6830], ax                
  1561  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1566  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  156b  666a00           push 0                                   
  156e  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  1573  83c404           add sp, 4                                
  1576  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  157b  5d               pop bp                                   
  157c  cb               retf                                     

ovl66_157d:  ; ENTRY
  157d  55               push bp                                  
  157e  8bec             mov bp, sp                               
  1580  83ec10           sub sp, 0x10                             
  1583  56               push si                                  
  1584  8b4e06           mov cx, word ptr [bp + 6]                
  1587  8bd9             mov bx, cx                               
  1589  d1e3             shl bx, 1                                
  158b  83bf426800       cmp word ptr [bx + 0x6842], 0            
  1590  7540             jne 0x15d2                               
  1592  33d2             xor dx, dx                               
  1594  eb16             jmp 0x15ac                               
  1596  8bda             mov bx, dx                               
  1598  d1e3             shl bx, 1                                
  159a  83bf426800       cmp word ptr [bx + 0x6842], 0            
  159f  740a             je 0x15ab                                
  15a1  8bda             mov bx, dx                               
  15a3  d1e3             shl bx, 1                                
  15a5  8bb75268         mov si, word ptr [bx + 0x6852]           
  15a9  eb07             jmp 0x15b2                               
  15ab  42               inc dx                                   
  15ac  3b16f630         cmp dx, word ptr [0x30f6]                
  15b0  7ce4             jl 0x1596                                
  15b2  8bd9             mov bx, cx                               
  15b4  d1e3             shl bx, 1                                
  15b6  89b75268         mov word ptr [bx + 0x6852], si           
  15ba  8bd9             mov bx, cx                               
  15bc  d1e3             shl bx, 1                                
  15be  8b874268         mov ax, word ptr [bx + 0x6842]           
  15c2  f7d8             neg ax                                   
  15c4  1bc0             sbb ax, ax                               
  15c6  40               inc ax                                   
  15c7  8bd9             mov bx, cx                               
  15c9  d1e3             shl bx, 1                                
  15cb  89874268         mov word ptr [bx + 0x6842], ax           
  15cf  e98200           jmp 0x1654                               
  15d2  33d2             xor dx, dx                               
  15d4  eb0f             jmp 0x15e5                               
  15d6  8bda             mov bx, dx                               
  15d8  d1e3             shl bx, 1                                
  15da  8d46f0           lea ax, [bp - 0x10]                      
  15dd  03d8             add bx, ax                               
  15df  36c7070000       mov word ptr ss:[bx], 0                  
  15e4  42               inc dx                                   
  15e5  83fa08           cmp dx, 8                                
  15e8  7cec             jl 0x15d6                                
  15ea  33d2             xor dx, dx                               
  15ec  eb13             jmp 0x1601                               
  15ee  8bda             mov bx, dx                               
  15f0  d1e3             shl bx, 1                                
  15f2  8b9f5268         mov bx, word ptr [bx + 0x6852]           
  15f6  d1e3             shl bx, 1                                
  15f8  8d46f0           lea ax, [bp - 0x10]                      
  15fb  03d8             add bx, ax                               
  15fd  36ff07           inc word ptr ss:[bx]                     
  1600  42               inc dx                                   
  1601  3b16f630         cmp dx, word ptr [0x30f6]                
  1605  7ce7             jl 0x15ee                                
  1607  8bd9             mov bx, cx                               
  1609  d1e3             shl bx, 1                                
  160b  8b9f5268         mov bx, word ptr [bx + 0x6852]           
  160f  d1e3             shl bx, 1                                
  1611  8d46f0           lea ax, [bp - 0x10]                      
  1614  03d8             add bx, ax                               
  1616  36833f01         cmp word ptr ss:[bx], 1                  
  161a  7438             je 0x1654                                
  161c  33d2             xor dx, dx                               
  161e  eb10             jmp 0x1630                               
  1620  8bda             mov bx, dx                               
  1622  d1e3             shl bx, 1                                
  1624  8d46f0           lea ax, [bp - 0x10]                      
  1627  03d8             add bx, ax                               
  1629  36833f00         cmp word ptr ss:[bx], 0                  
  162d  7406             je 0x1635                                
  162f  42               inc dx                                   
  1630  83fa08           cmp dx, 8                                
  1633  7ceb             jl 0x1620                                
  1635  8bf2             mov si, dx                               
  1637  8bd9             mov bx, cx                               
  1639  d1e3             shl bx, 1                                
  163b  8b874268         mov ax, word ptr [bx + 0x6842]           
  163f  f7d8             neg ax                                   
  1641  1bc0             sbb ax, ax                               
  1643  40               inc ax                                   
  1644  8bd9             mov bx, cx                               
  1646  d1e3             shl bx, 1                                
  1648  89874268         mov word ptr [bx + 0x6842], ax           
  164c  8bd9             mov bx, cx                               
  164e  d1e3             shl bx, 1                                
  1650  89b75268         mov word ptr [bx + 0x6852], si           
  1654  6a01             push 1                                   
  1656  90               nop                                      
  1657  0e               push cs                                  
  1658  e88c01           call 0x17e7                              
  165b  59               pop cx                                   
  165c  666a00           push 0                                   
  165f  6a00             push 0                                   
  1661  0e               push cs                                  
  1662  e820f8           call 0xe85                               
  1665  83c406           add sp, 6                                
  1668  0e               push cs                                  
  1669  e8b9fd           call 0x1425                              
  166c  5e               pop si                                   
  166d  c9               leave                                    
  166e  cb               retf                                     

ovl66_166f:  ; ENTRY
  166f  55               push bp                                  
  1670  8bec             mov bp, sp                               
  1672  83ec02           sub sp, 2                                
  1675  8b5e06           mov bx, word ptr [bp + 6]                
  1678  d1e3             shl bx, 1                                
  167a  8b875268         mov ax, word ptr [bx + 0x6852]           
  167e  8946fe           mov word ptr [bp - 2], ax                
  1681  33d2             xor dx, dx                               
  1683  eb1d             jmp 0x16a2                               
  1685  8bda             mov bx, dx                               
  1687  d1e3             shl bx, 1                                
  1689  8b875268         mov ax, word ptr [bx + 0x6852]           
  168d  3b46fe           cmp ax, word ptr [bp - 2]                
  1690  7505             jne 0x1697                               
  1692  b80100           mov ax, 1                                
  1695  eb02             jmp 0x1699                               
  1697  33c0             xor ax, ax                               
  1699  8bda             mov bx, dx                               
  169b  d1e3             shl bx, 1                                
  169d  89874268         mov word ptr [bx + 0x6842], ax           
  16a1  42               inc dx                                   
  16a2  3b16f630         cmp dx, word ptr [0x30f6]                
  16a6  7cdd             jl 0x1685                                
  16a8  6a00             push 0                                   
  16aa  90               nop                                      
  16ab  0e               push cs                                  
  16ac  e83801           call 0x17e7                              
  16af  59               pop cx                                   
  16b0  66680000ffff     push 0xffff0000                          
  16b6  6a00             push 0                                   
  16b8  0e               push cs                                  
  16b9  e8c9f7           call 0xe85                               
  16bc  83c406           add sp, 6                                
  16bf  0e               push cs                                  
  16c0  e862fd           call 0x1425                              
  16c3  c9               leave                                    
  16c4  cb               retf                                     

ovl66_16c5:  ; ENTRY
  16c5  55               push bp                                  
  16c6  8bec             mov bp, sp                               
  16c8  33d2             xor dx, dx                               
  16ca  eb15             jmp 0x16e1                               
  16cc  8bda             mov bx, dx                               
  16ce  d1e3             shl bx, 1                                
  16d0  c78752680000     mov word ptr [bx + 0x6852], 0            
  16d6  8bda             mov bx, dx                               
  16d8  d1e3             shl bx, 1                                
  16da  c78742680100     mov word ptr [bx + 0x6842], 1            
  16e0  42               inc dx                                   
  16e1  3b16f630         cmp dx, word ptr [0x30f6]                
  16e5  7ce5             jl 0x16cc                                
  16e7  6a01             push 1                                   
  16e9  90               nop                                      
  16ea  0e               push cs                                  
  16eb  e8f900           call 0x17e7                              
  16ee  59               pop cx                                   
  16ef  66680000ffff     push 0xffff0000                          
  16f5  6a00             push 0                                   
  16f7  0e               push cs                                  
  16f8  e88af7           call 0xe85                               
  16fb  83c406           add sp, 6                                
  16fe  0e               push cs                                  
  16ff  e823fd           call 0x1425                              
  1702  5d               pop bp                                   
  1703  cb               retf                                     

ovl66_1704:  ; ENTRY
  1704  55               push bp                                  
  1705  8bec             mov bp, sp                               
  1707  33d2             xor dx, dx                               
  1709  eb13             jmp 0x171e                               
  170b  8bda             mov bx, dx                               
  170d  d1e3             shl bx, 1                                
  170f  89975268         mov word ptr [bx + 0x6852], dx           
  1713  8bda             mov bx, dx                               
  1715  d1e3             shl bx, 1                                
  1717  c78742680000     mov word ptr [bx + 0x6842], 0            
  171d  42               inc dx                                   
  171e  3b16f630         cmp dx, word ptr [0x30f6]                
  1722  7ce7             jl 0x170b                                
  1724  c70642680100     mov word ptr [0x6842], 1                 
  172a  6a01             push 1                                   
  172c  90               nop                                      
  172d  0e               push cs                                  
  172e  e8b600           call 0x17e7                              
  1731  59               pop cx                                   
  1732  66680000ffff     push 0xffff0000                          
  1738  6a00             push 0                                   
  173a  0e               push cs                                  
  173b  e847f7           call 0xe85                               
  173e  83c406           add sp, 6                                
  1741  0e               push cs                                  
  1742  e8e0fc           call 0x1425                              
  1745  5d               pop bp                                   
  1746  cb               retf                                     

ovl66_1747:  ; ENTRY
  1747  55               push bp                                  
  1748  8bec             mov bp, sp                               
  174a  8b5606           mov dx, word ptr [bp + 6]                
  174d  8b5e08           mov bx, word ptr [bp + 8]                
  1750  8b4e0a           mov cx, word ptr [bp + 0xa]              
  1753  833e741100       cmp word ptr [0x1174], 0                 
  1758  7403             je 0x175d                                
  175a  e98800           jmp 0x17e5                               
  175d  3b16f630         cmp dx, word ptr [0x30f6]                
  1761  7d66             jge 0x17c9                               
  1763  51               push cx                                  
  1764  53               push bx                                  
  1765  8bda             mov bx, dx                               
  1767  c1e302           shl bx, 2                                
  176a  c49f6268         les bx, ptr [bx + 0x6862]                
  176e  268a470a         mov al, byte ptr es:[bx + 0xa]           
  1772  98               cwde                                     
  1773  50               push ax                                  
  1774  8bda             mov bx, dx                               
  1776  c1e302           shl bx, 2                                
  1779  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  177d  268a4707         mov al, byte ptr es:[bx + 7]             
  1781  98               cwde                                     
  1782  50               push ax                                  
  1783  8bda             mov bx, dx                               
  1785  c1e302           shl bx, 2                                
  1788  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  178c  268a470b         mov al, byte ptr es:[bx + 0xb]           
  1790  98               cwde                                     
  1791  50               push ax                                  
  1792  8bda             mov bx, dx                               
  1794  c1e302           shl bx, 2                                
  1797  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  179b  268a4708         mov al, byte ptr es:[bx + 8]             
  179f  98               cwde                                     
  17a0  50               push ax                                  
  17a1  8bda             mov bx, dx                               
  17a3  c1e302           shl bx, 2                                
  17a6  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  17aa  268a4706         mov al, byte ptr es:[bx + 6]             
  17ae  98               cwde                                     
  17af  50               push ax                                  
  17b0  8bda             mov bx, dx                               
  17b2  c1e302           shl bx, 2                                
  17b5  8b9f6268         mov bx, word ptr [bx + 0x6862]           
  17b9  268a4704         mov al, byte ptr es:[bx + 4]             
  17bd  98               cwde                                     
  17be  50               push ax                                  
  17bf  9a43006c30       lcall 0x306c, 0x43                       -> ovl46:0626
  17c4  83c410           add sp, 0x10                             
  17c7  eb1c             jmp 0x17e5                               
  17c9  6a00             push 0                                   
  17cb  51               push cx                                  
  17cc  53               push bx                                  
  17cd  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  17d2  83c406           add sp, 6                                
  17d5  1e               push ds                                  
  17d6  682e32           push 0x322e                               ; "Select armies when present"
  17d9  1e               push ds                                  
  17da  682232           push 0x3222                               ; "Select Army"
  17dd  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  17e2  83c408           add sp, 8                                
  17e5  5d               pop bp                                   
  17e6  cb               retf                                     

ovl66_17e7:  ; ENTRY
  17e7  55               push bp                                  
  17e8  8bec             mov bp, sp                               
  17ea  83ec08           sub sp, 8                                
  17ed  56               push si                                  
  17ee  b8042c           mov ax, 0x2c04                           
  17f1  8ec0             mov es, ax                               
  17f3  26ff361001       push word ptr es:[0x110]                 
  17f8  9a2400620b       lcall 0xb62, 0x24                        -> 0b62:0024
  17fd  59               pop cx                                   
  17fe  8956fa           mov word ptr [bp - 6], dx                
  1801  8946f8           mov word ptr [bp - 8], ax                
  1804  837e0600         cmp word ptr [bp + 6], 0                 
  1808  7503             jne 0x180d                               
  180a  e94601           jmp 0x1953                               
  180d  be0100           mov si, 1                                
  1810  e93701           jmp 0x194a                               
  1813  8bde             mov bx, si                               
  1815  d1e3             shl bx, 1                                
  1817  8b875268         mov ax, word ptr [bx + 0x6852]           
  181b  8bde             mov bx, si                               
  181d  d1e3             shl bx, 1                                
  181f  3b875068         cmp ax, word ptr [bx + 0x6850]           
  1823  7c44             jl 0x1869                                
  1825  8bde             mov bx, si                               
  1827  d1e3             shl bx, 1                                
  1829  8bde             mov bx, si                               
  182b  d1e3             shl bx, 1                                
  182d  3b875068         cmp ax, word ptr [bx + 0x6850]           
  1831  7403             je 0x1836                                
  1833  e91301           jmp 0x1949                               
  1836  8bde             mov bx, si                               
  1838  c1e302           shl bx, 2                                
  183b  c49f6268         les bx, ptr [bx + 0x6862]                
  183f  268a4704         mov al, byte ptr es:[bx + 4]             
  1843  98               cwde                                     
  1844  c45ef8           les bx, ptr [bp - 8]                     
  1847  03d8             add bx, ax                               
  1849  268a07           mov al, byte ptr es:[bx]                 
  184c  8bde             mov bx, si                               
  184e  c1e302           shl bx, 2                                
  1851  c49f5e68         les bx, ptr [bx + 0x685e]                
  1855  50               push ax                                  
  1856  268a4704         mov al, byte ptr es:[bx + 4]             
  185a  98               cwde                                     
  185b  c45ef8           les bx, ptr [bp - 8]                     
  185e  03d8             add bx, ax                               
  1860  58               pop ax                                   
  1861  263a07           cmp al, byte ptr es:[bx]                 
  1864  7f03             jg 0x1869                                
  1866  e9e000           jmp 0x1949                               
  1869  8bce             mov cx, si                               
  186b  e98100           jmp 0x18ef                               
  186e  8bd9             mov bx, cx                               
  1870  c1e302           shl bx, 2                                
  1873  8b876468         mov ax, word ptr [bx + 0x6864]           
  1877  8b976268         mov dx, word ptr [bx + 0x6862]           
  187b  8946fe           mov word ptr [bp - 2], ax                
  187e  8956fc           mov word ptr [bp - 4], dx                
  1881  8bd9             mov bx, cx                               
  1883  c1e302           shl bx, 2                                
  1886  8b876068         mov ax, word ptr [bx + 0x6860]           
  188a  8b975e68         mov dx, word ptr [bx + 0x685e]           
  188e  8bd9             mov bx, cx                               
  1890  c1e302           shl bx, 2                                
  1893  89876468         mov word ptr [bx + 0x6864], ax           
  1897  89976268         mov word ptr [bx + 0x6862], dx           
  189b  8bd9             mov bx, cx                               
  189d  c1e302           shl bx, 2                                
  18a0  8b46fe           mov ax, word ptr [bp - 2]                
  18a3  8b56fc           mov dx, word ptr [bp - 4]                
  18a6  89876068         mov word ptr [bx + 0x6860], ax           
  18aa  89975e68         mov word ptr [bx + 0x685e], dx           
  18ae  8bd9             mov bx, cx                               
  18b0  d1e3             shl bx, 1                                
  18b2  8b975268         mov dx, word ptr [bx + 0x6852]           
  18b6  8bd9             mov bx, cx                               
  18b8  d1e3             shl bx, 1                                
  18ba  8b875068         mov ax, word ptr [bx + 0x6850]           
  18be  8bd9             mov bx, cx                               
  18c0  d1e3             shl bx, 1                                
  18c2  89875268         mov word ptr [bx + 0x6852], ax           
  18c6  8bd9             mov bx, cx                               
  18c8  d1e3             shl bx, 1                                
  18ca  89975068         mov word ptr [bx + 0x6850], dx           
  18ce  8bd9             mov bx, cx                               
  18d0  d1e3             shl bx, 1                                
  18d2  8b974268         mov dx, word ptr [bx + 0x6842]           
  18d6  8bd9             mov bx, cx                               
  18d8  d1e3             shl bx, 1                                
  18da  8b874068         mov ax, word ptr [bx + 0x6840]           
  18de  8bd9             mov bx, cx                               
  18e0  d1e3             shl bx, 1                                
  18e2  89874268         mov word ptr [bx + 0x6842], ax           
  18e6  8bd9             mov bx, cx                               
  18e8  d1e3             shl bx, 1                                
  18ea  89974068         mov word ptr [bx + 0x6840], dx           
  18ee  49               dec cx                                   
  18ef  0bc9             or cx, cx                                
  18f1  7e56             jle 0x1949                               
  18f3  8bd9             mov bx, cx                               
  18f5  d1e3             shl bx, 1                                
  18f7  8b875268         mov ax, word ptr [bx + 0x6852]           
  18fb  8bd9             mov bx, cx                               
  18fd  d1e3             shl bx, 1                                
  18ff  3b875068         cmp ax, word ptr [bx + 0x6850]           
  1903  7d03             jge 0x1908                               
  1905  e966ff           jmp 0x186e                               
  1908  8bd9             mov bx, cx                               
  190a  d1e3             shl bx, 1                                
  190c  8bd9             mov bx, cx                               
  190e  d1e3             shl bx, 1                                
  1910  3b875068         cmp ax, word ptr [bx + 0x6850]           
  1914  7533             jne 0x1949                               
  1916  8bd9             mov bx, cx                               
  1918  c1e302           shl bx, 2                                
  191b  c49f6268         les bx, ptr [bx + 0x6862]                
  191f  268a4704         mov al, byte ptr es:[bx + 4]             
  1923  98               cwde                                     
  1924  c45ef8           les bx, ptr [bp - 8]                     
  1927  03d8             add bx, ax                               
  1929  268a07           mov al, byte ptr es:[bx]                 
  192c  8bd9             mov bx, cx                               
  192e  c1e302           shl bx, 2                                
  1931  c49f5e68         les bx, ptr [bx + 0x685e]                
  1935  50               push ax                                  
  1936  268a4704         mov al, byte ptr es:[bx + 4]             
  193a  98               cwde                                     
  193b  c45ef8           les bx, ptr [bp - 8]                     
  193e  03d8             add bx, ax                               
  1940  58               pop ax                                   
  1941  263a07           cmp al, byte ptr es:[bx]                 
  1944  7e03             jle 0x1949                               
  1946  e925ff           jmp 0x186e                               
  1949  46               inc si                                   
  194a  3b36f630         cmp si, word ptr [0x30f6]                
  194e  7d03             jge 0x1953                               
  1950  e9c0fe           jmp 0x1813                               
  1953  c70632680000     mov word ptr [0x6832], 0                 
  1959  be0100           mov si, 1                                
  195c  eb22             jmp 0x1980                               
  195e  8bde             mov bx, si                               
  1960  d1e3             shl bx, 1                                
  1962  8b875268         mov ax, word ptr [bx + 0x6852]           
  1966  8bde             mov bx, si                               
  1968  d1e3             shl bx, 1                                
  196a  3b875068         cmp ax, word ptr [bx + 0x6850]           
  196e  7505             jne 0x1975                               
  1970  b8ffff           mov ax, 0xffff                           
  1973  eb02             jmp 0x1977                               
  1975  33c0             xor ax, ax                               
  1977  8bde             mov bx, si                               
  1979  d1e3             shl bx, 1                                
  197b  89873268         mov word ptr [bx + 0x6832], ax           
  197f  46               inc si                                   
  1980  3b36f630         cmp si, word ptr [0x30f6]                
  1984  7cd8             jl 0x195e                                
  1986  33d2             xor dx, dx                               
  1988  33f6             xor si, si                               
  198a  eb58             jmp 0x19e4                               
  198c  8bde             mov bx, si                               
  198e  d1e3             shl bx, 1                                
  1990  83bf426800       cmp word ptr [bx + 0x6842], 0            
  1995  744c             je 0x19e3                                
  1997  ba0100           mov dx, 1                                
  199a  33c9             xor cx, cx                               
  199c  eb3d             jmp 0x19db                               
  199e  8bd9             mov bx, cx                               
  19a0  d1e3             shl bx, 1                                
  19a2  83bf426800       cmp word ptr [bx + 0x6842], 0            
  19a7  7412             je 0x19bb                                
  19a9  8bd9             mov bx, cx                               
  19ab  d1e3             shl bx, 1                                
  19ad  8b875268         mov ax, word ptr [bx + 0x6852]           
  19b1  8bde             mov bx, si                               
  19b3  d1e3             shl bx, 1                                
  19b5  3b875268         cmp ax, word ptr [bx + 0x6852]           
  19b9  741f             je 0x19da                                
  19bb  8bd9             mov bx, cx                               
  19bd  d1e3             shl bx, 1                                
  19bf  83bf426800       cmp word ptr [bx + 0x6842], 0            
  19c4  7512             jne 0x19d8                               
  19c6  8bd9             mov bx, cx                               
  19c8  d1e3             shl bx, 1                                
  19ca  8b875268         mov ax, word ptr [bx + 0x6852]           
  19ce  8bde             mov bx, si                               
  19d0  d1e3             shl bx, 1                                
  19d2  3b875268         cmp ax, word ptr [bx + 0x6852]           
  19d6  7502             jne 0x19da                               
  19d8  33d2             xor dx, dx                               
  19da  41               inc cx                                   
  19db  3b0ef630         cmp cx, word ptr [0x30f6]                
  19df  7cbd             jl 0x199e                                
  19e1  eb07             jmp 0x19ea                               
  19e3  46               inc si                                   
  19e4  3b36f630         cmp si, word ptr [0x30f6]                
  19e8  7ca2             jl 0x198c                                
  19ea  0bd2             or dx, dx                                
  19ec  7410             je 0x19fe                                
  19ee  89363068         mov word ptr [0x6830], si                
  19f2  8bde             mov bx, si                               
  19f4  d1e3             shl bx, 1                                
  19f6  c78732680100     mov word ptr [bx + 0x6832], 1            
  19fc  eb06             jmp 0x1a04                               
  19fe  c7063068ffff     mov word ptr [0x6830], 0xffff            
  1a04  5e               pop si                                   
  1a05  c9               leave                                    
  1a06  cb               retf                                     

ovl66_1a07:  ; ENTRY
  1a07  55               push bp                                  
  1a08  8bec             mov bp, sp                               
  1a0a  83ec40           sub sp, 0x40                             
  1a0d  56               push si                                  
  1a0e  8b7606           mov si, word ptr [bp + 6]                
  1a11  6668a3000000     push 0xa3                                
  1a17  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a1c  83c404           add sp, 4                                
  1a1f  52               push dx                                  
  1a20  50               push ax                                  
  1a21  1e               push ds                                  
  1a22  68885c           push 0x5c88                              
  1a25  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1a2a  83c408           add sp, 8                                
  1a2d  66837e0800       cmp dword ptr [bp + 8], 0                
  1a32  7429             je 0x1a5d                                
  1a34  c45e08           les bx, ptr [bp + 8]                     
  1a37  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  1a3d  741e             je 0x1a5d                                
  1a3f  6a01             push 1                                   
  1a41  68a300           push 0xa3                                
  1a44  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a49  83c404           add sp, 4                                
  1a4c  52               push dx                                  
  1a4d  50               push ax                                  
  1a4e  1e               push ds                                  
  1a4f  68885c           push 0x5c88                              
  1a52  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1a57  83c408           add sp, 8                                
  1a5a  e93701           jmp 0x1b94                               
  1a5d  83fe1c           cmp si, 0x1c                             
  1a60  740e             je 0x1a70                                
  1a62  16               push ss                                  
  1a63  8d46c0           lea ax, [bp - 0x40]                      
  1a66  50               push ax                                  
  1a67  56               push si                                  
  1a68  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1a6d  83c406           add sp, 6                                
  1a70  83fe1c           cmp si, 0x1c                             
  1a73  7545             jne 0x1aba                               
  1a75  66837e0800       cmp dword ptr [bp + 8], 0                
  1a7a  743e             je 0x1aba                                
  1a7c  66ff7608         push dword ptr [bp + 8]                  
  1a80  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  1a85  83c404           add sp, 4                                
  1a88  8946fe           mov word ptr [bp - 2], ax                
  1a8b  c45e08           les bx, ptr [bp + 8]                     
  1a8e  268a4708         mov al, byte ptr es:[bx + 8]             
  1a92  98               cwde                                     
  1a93  0346fe           add ax, word ptr [bp - 2]                
  1a96  d1e0             shl ax, 1                                
  1a98  8bd8             mov bx, ax                               
  1a9a  8bb7e40c         mov si, word ptr [bx + 0xce4]            
  1a9e  66ff7608         push dword ptr [bp + 8]                  
  1aa2  9a2a003030       lcall 0x3030, 0x2a                       -> ovl38:0d71
  1aa7  83c404           add sp, 4                                
  1aaa  03f0             add si, ax                               
  1aac  83fe06           cmp si, 6                                
  1aaf  7e03             jle 0x1ab4                               
  1ab1  be0600           mov si, 6                                
  1ab4  56               push si                                  
  1ab5  6a02             push 2                                   
  1ab7  e9c100           jmp 0x1b7b                               
  1aba  837ef402         cmp word ptr [bp - 0xc], 2               
  1abe  7505             jne 0x1ac5                               
  1ac0  6a03             push 3                                   
  1ac2  e97cff           jmp 0x1a41                               
  1ac5  837ef403         cmp word ptr [bp - 0xc], 3               
  1ac9  7505             jne 0x1ad0                               
  1acb  6a04             push 4                                   
  1acd  e971ff           jmp 0x1a41                               
  1ad0  837ef000         cmp word ptr [bp - 0x10], 0              
  1ad4  7408             je 0x1ade                                
  1ad6  ff76ea           push word ptr [bp - 0x16]                
  1ad9  6a05             push 5                                   
  1adb  e99d00           jmp 0x1b7b                               
  1ade  837eee00         cmp word ptr [bp - 0x12], 0              
  1ae2  7419             je 0x1afd                                
  1ae4  837eec00         cmp word ptr [bp - 0x14], 0              
  1ae8  7413             je 0x1afd                                
  1aea  837eea00         cmp word ptr [bp - 0x16], 0              
  1aee  740d             je 0x1afd                                
  1af0  837ee800         cmp word ptr [bp - 0x18], 0              
  1af4  7407             je 0x1afd                                
  1af6  ff76e8           push word ptr [bp - 0x18]                
  1af9  6a10             push 0x10                                
  1afb  eb7e             jmp 0x1b7b                               
  1afd  837ef401         cmp word ptr [bp - 0xc], 1               
  1b01  7505             jne 0x1b08                               
  1b03  6a06             push 6                                   
  1b05  e939ff           jmp 0x1a41                               
  1b08  837ef200         cmp word ptr [bp - 0xe], 0               
  1b0c  7407             je 0x1b15                                
  1b0e  ff76f2           push word ptr [bp - 0xe]                 
  1b11  6a07             push 7                                   
  1b13  eb66             jmp 0x1b7b                               
  1b15  837eee00         cmp word ptr [bp - 0x12], 0              
  1b19  7407             je 0x1b22                                
  1b1b  ff76ee           push word ptr [bp - 0x12]                
  1b1e  6a08             push 8                                   
  1b20  eb59             jmp 0x1b7b                               
  1b22  837eec00         cmp word ptr [bp - 0x14], 0              
  1b26  7407             je 0x1b2f                                
  1b28  ff76ec           push word ptr [bp - 0x14]                
  1b2b  6a09             push 9                                   
  1b2d  eb4c             jmp 0x1b7b                               
  1b2f  837eea00         cmp word ptr [bp - 0x16], 0              
  1b33  7407             je 0x1b3c                                
  1b35  ff76ea           push word ptr [bp - 0x16]                
  1b38  6a0a             push 0xa                                 
  1b3a  eb3f             jmp 0x1b7b                               
  1b3c  837ee800         cmp word ptr [bp - 0x18], 0              
  1b40  7407             je 0x1b49                                
  1b42  ff76e8           push word ptr [bp - 0x18]                
  1b45  6a0b             push 0xb                                 
  1b47  eb32             jmp 0x1b7b                               
  1b49  837ee600         cmp word ptr [bp - 0x1a], 0              
  1b4d  7407             je 0x1b56                                
  1b4f  ff76e6           push word ptr [bp - 0x1a]                
  1b52  6a0c             push 0xc                                 
  1b54  eb25             jmp 0x1b7b                               
  1b56  837ee400         cmp word ptr [bp - 0x1c], 0              
  1b5a  7407             je 0x1b63                                
  1b5c  ff76e4           push word ptr [bp - 0x1c]                
  1b5f  6a0d             push 0xd                                 
  1b61  eb18             jmp 0x1b7b                               
  1b63  837ee200         cmp word ptr [bp - 0x1e], 0              
  1b67  7407             je 0x1b70                                
  1b69  ff76e2           push word ptr [bp - 0x1e]                
  1b6c  6a0e             push 0xe                                 
  1b6e  eb0b             jmp 0x1b7b                               
  1b70  837ee000         cmp word ptr [bp - 0x20], 0              
  1b74  741e             je 0x1b94                                
  1b76  ff76e0           push word ptr [bp - 0x20]                
  1b79  6a0f             push 0xf                                 
  1b7b  68a300           push 0xa3                                
  1b7e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1b83  83c404           add sp, 4                                
  1b86  52               push dx                                  
  1b87  50               push ax                                  
  1b88  1e               push ds                                  
  1b89  68885c           push 0x5c88                              
  1b8c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1b91  83c40a           add sp, 0xa                              
  1b94  8cda             mov dx, ds                               
  1b96  b8885c           mov ax, 0x5c88                           
  1b99  5e               pop si                                   
  1b9a  c9               leave                                    
  1b9b  cb               retf                                     

ovl66_1b9c:  ; ENTRY
  1b9c  55               push bp                                  
  1b9d  8bec             mov bp, sp                               
  1b9f  83ec50           sub sp, 0x50                             
  1ba2  56               push si                                  
  1ba3  57               push di                                  
  1ba4  33ff             xor di, di                               
  1ba6  c746f40000       mov word ptr [bp - 0xc], 0               
  1bab  c746f20000       mov word ptr [bp - 0xe], 0               
  1bb0  c746f00000       mov word ptr [bp - 0x10], 0              
  1bb5  c746ee0000       mov word ptr [bp - 0x12], 0              
  1bba  c41e625e         les bx, ptr [0x5e62]                     
  1bbe  26ff7702         push word ptr es:[bx + 2]                
  1bc2  26ff37           push word ptr es:[bx]                    
  1bc5  9a57003030       lcall 0x3030, 0x57                       -> ovl38:0000
  1bca  83c404           add sp, 4                                
  1bcd  8946fc           mov word ptr [bp - 4], ax                
  1bd0  33f6             xor si, si                               
  1bd2  e91c01           jmp 0x1cf1                               
  1bd5  8bde             mov bx, si                               
  1bd7  d1e3             shl bx, 1                                
  1bd9  83bf426800       cmp word ptr [bx + 0x6842], 0            
  1bde  7503             jne 0x1be3                               
  1be0  e90d01           jmp 0x1cf0                               
  1be3  8bde             mov bx, si                               
  1be5  c1e302           shl bx, 2                                
  1be8  8b876468         mov ax, word ptr [bx + 0x6864]           
  1bec  8b976268         mov dx, word ptr [bx + 0x6862]           
  1bf0  8946f8           mov word ptr [bp - 8], ax                
  1bf3  8956f6           mov word ptr [bp - 0xa], dx              
  1bf6  c45ef6           les bx, ptr [bp - 0xa]                   
  1bf9  268a4704         mov al, byte ptr es:[bx + 4]             
  1bfd  98               cwde                                     
  1bfe  8946fe           mov word ptr [bp - 2], ax                
  1c01  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  1c07  7403             je 0x1c0c                                
  1c09  e9e400           jmp 0x1cf0                               
  1c0c  837efe1c         cmp word ptr [bp - 2], 0x1c              
  1c10  7410             je 0x1c22                                
  1c12  16               push ss                                  
  1c13  8d46b0           lea ax, [bp - 0x50]                      
  1c16  50               push ax                                  
  1c17  ff76fe           push word ptr [bp - 2]                   
  1c1a  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1c1f  83c406           add sp, 6                                
  1c22  837efe1c         cmp word ptr [bp - 2], 0x1c              
  1c26  7546             jne 0x1c6e                               
  1c28  66ff76f6         push dword ptr [bp - 0xa]                
  1c2c  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  1c31  83c404           add sp, 4                                
  1c34  8bd0             mov dx, ax                               
  1c36  c45ef6           les bx, ptr [bp - 0xa]                   
  1c39  268a4708         mov al, byte ptr es:[bx + 8]             
  1c3d  98               cwde                                     
  1c3e  03c2             add ax, dx                               
  1c40  3d0900           cmp ax, 9                                
  1c43  7d09             jge 0x1c4e                               
  1c45  268a4708         mov al, byte ptr es:[bx + 8]             
  1c49  98               cwde                                     
  1c4a  03c2             add ax, dx                               
  1c4c  eb03             jmp 0x1c51                               
  1c4e  b80900           mov ax, 9                                
  1c51  8946fa           mov word ptr [bp - 6], ax                
  1c54  8b5efa           mov bx, word ptr [bp - 6]                
  1c57  d1e3             shl bx, 1                                
  1c59  03bfe40c         add di, word ptr [bx + 0xce4]            
  1c5d  66ff76f6         push dword ptr [bp - 0xa]                
  1c61  9a2a003030       lcall 0x3030, 0x2a                       -> ovl38:0d71
  1c66  83c404           add sp, 4                                
  1c69  03f8             add di, ax                               
  1c6b  e98200           jmp 0x1cf0                               
  1c6e  837ede00         cmp word ptr [bp - 0x22], 0              
  1c72  741b             je 0x1c8f                                
  1c74  837efc03         cmp word ptr [bp - 4], 3                 
  1c78  7515             jne 0x1c8f                               
  1c7a  8b46de           mov ax, word ptr [bp - 0x22]             
  1c7d  3b46f4           cmp ax, word ptr [bp - 0xc]              
  1c80  7e0d             jle 0x1c8f                               
  1c82  2b46f4           sub ax, word ptr [bp - 0xc]              
  1c85  03f8             add di, ax                               
  1c87  8b46de           mov ax, word ptr [bp - 0x22]             
  1c8a  8946f4           mov word ptr [bp - 0xc], ax              
  1c8d  eb61             jmp 0x1cf0                               
  1c8f  837edc00         cmp word ptr [bp - 0x24], 0              
  1c93  741b             je 0x1cb0                                
  1c95  837efc02         cmp word ptr [bp - 4], 2                 
  1c99  7515             jne 0x1cb0                               
  1c9b  8b46dc           mov ax, word ptr [bp - 0x24]             
  1c9e  3b46f2           cmp ax, word ptr [bp - 0xe]              
  1ca1  7e0d             jle 0x1cb0                               
  1ca3  2b46f2           sub ax, word ptr [bp - 0xe]              
  1ca6  03f8             add di, ax                               
  1ca8  8b46dc           mov ax, word ptr [bp - 0x24]             
  1cab  8946f2           mov word ptr [bp - 0xe], ax              
  1cae  eb40             jmp 0x1cf0                               
  1cb0  837eda00         cmp word ptr [bp - 0x26], 0              
  1cb4  741b             je 0x1cd1                                
  1cb6  837efc01         cmp word ptr [bp - 4], 1                 
  1cba  7515             jne 0x1cd1                               
  1cbc  8b46da           mov ax, word ptr [bp - 0x26]             
  1cbf  3b46f0           cmp ax, word ptr [bp - 0x10]             
  1cc2  7e0d             jle 0x1cd1                               
  1cc4  2b46f0           sub ax, word ptr [bp - 0x10]             
  1cc7  03f8             add di, ax                               
  1cc9  8b46da           mov ax, word ptr [bp - 0x26]             
  1ccc  8946f0           mov word ptr [bp - 0x10], ax             
  1ccf  eb1f             jmp 0x1cf0                               
  1cd1  837ed800         cmp word ptr [bp - 0x28], 0              
  1cd5  7419             je 0x1cf0                                
  1cd7  837efc00         cmp word ptr [bp - 4], 0                 
  1cdb  7513             jne 0x1cf0                               
  1cdd  8b46d8           mov ax, word ptr [bp - 0x28]             
  1ce0  3b46ee           cmp ax, word ptr [bp - 0x12]             
  1ce3  7e0b             jle 0x1cf0                               
  1ce5  2b46ee           sub ax, word ptr [bp - 0x12]             
  1ce8  03f8             add di, ax                               
  1cea  8b46d8           mov ax, word ptr [bp - 0x28]             
  1ced  8946ee           mov word ptr [bp - 0x12], ax             
  1cf0  46               inc si                                   
  1cf1  3b36f630         cmp si, word ptr [0x30f6]                
  1cf5  7d03             jge 0x1cfa                               
  1cf7  e9dbfe           jmp 0x1bd5                               
  1cfa  b8042c           mov ax, 0x2c04                           
  1cfd  8ec0             mov es, ax                               
  1cff  26393e1201       cmp word ptr es:[0x112], di              
  1d04  7d07             jge 0x1d0d                               
  1d06  8ec0             mov es, ax                               
  1d08  268b3e1201       mov di, word ptr es:[0x112]              
  1d0d  33f6             xor si, si                               
  1d0f  e91c01           jmp 0x1e2e                               
  1d12  8bde             mov bx, si                               
  1d14  d1e3             shl bx, 1                                
  1d16  83bf426800       cmp word ptr [bx + 0x6842], 0            
  1d1b  7503             jne 0x1d20                               
  1d1d  e90d01           jmp 0x1e2d                               
  1d20  8bde             mov bx, si                               
  1d22  c1e302           shl bx, 2                                
  1d25  8b876468         mov ax, word ptr [bx + 0x6864]           
  1d29  8b976268         mov dx, word ptr [bx + 0x6862]           
  1d2d  8946f8           mov word ptr [bp - 8], ax                
  1d30  8956f6           mov word ptr [bp - 0xa], dx              
  1d33  c45ef6           les bx, ptr [bp - 0xa]                   
  1d36  268a4704         mov al, byte ptr es:[bx + 4]             
  1d3a  98               cwde                                     
  1d3b  8946fe           mov word ptr [bp - 2], ax                
  1d3e  268a4708         mov al, byte ptr es:[bx + 8]             
  1d42  98               cwde                                     
  1d43  8bd6             mov dx, si                               
  1d45  d1e2             shl dx, 1                                
  1d47  c45e06           les bx, ptr [bp + 6]                     
  1d4a  03da             add bx, dx                               
  1d4c  268907           mov word ptr es:[bx], ax                 
  1d4f  837efe1c         cmp word ptr [bp - 2], 0x1c              
  1d53  7410             je 0x1d65                                
  1d55  16               push ss                                  
  1d56  8d46b0           lea ax, [bp - 0x50]                      
  1d59  50               push ax                                  
  1d5a  ff76fe           push word ptr [bp - 2]                   
  1d5d  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1d62  83c406           add sp, 6                                
  1d65  c45ef6           les bx, ptr [bp - 0xa]                   
  1d68  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  1d6e  7411             je 0x1d81                                
  1d70  8bc6             mov ax, si                               
  1d72  d1e0             shl ax, 1                                
  1d74  c45e06           les bx, ptr [bp + 6]                     
  1d77  03d8             add bx, ax                               
  1d79  26c7070400       mov word ptr es:[bx], 4                  
  1d7e  e98600           jmp 0x1e07                               
  1d81  837efe1c         cmp word ptr [bp - 2], 0x1c              
  1d85  7517             jne 0x1d9e                               
  1d87  66ff76f6         push dword ptr [bp - 0xa]                
  1d8b  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  1d90  83c404           add sp, 4                                
  1d93  8bd6             mov dx, si                               
  1d95  d1e2             shl dx, 1                                
  1d97  c45e06           les bx, ptr [bp + 6]                     
  1d9a  03da             add bx, dx                               
  1d9c  eb66             jmp 0x1e04                               
  1d9e  837ed600         cmp word ptr [bp - 0x2a], 0              
  1da2  7414             je 0x1db8                                
  1da4  837efc03         cmp word ptr [bp - 4], 3                 
  1da8  750e             jne 0x1db8                               
  1daa  8bc6             mov ax, si                               
  1dac  d1e0             shl ax, 1                                
  1dae  c45e06           les bx, ptr [bp + 6]                     
  1db1  03d8             add bx, ax                               
  1db3  8b46d6           mov ax, word ptr [bp - 0x2a]             
  1db6  eb4c             jmp 0x1e04                               
  1db8  837ed400         cmp word ptr [bp - 0x2c], 0              
  1dbc  7414             je 0x1dd2                                
  1dbe  837efc02         cmp word ptr [bp - 4], 2                 
  1dc2  750e             jne 0x1dd2                               
  1dc4  8bc6             mov ax, si                               
  1dc6  d1e0             shl ax, 1                                
  1dc8  c45e06           les bx, ptr [bp + 6]                     
  1dcb  03d8             add bx, ax                               
  1dcd  8b46d4           mov ax, word ptr [bp - 0x2c]             
  1dd0  eb32             jmp 0x1e04                               
  1dd2  837ed200         cmp word ptr [bp - 0x2e], 0              
  1dd6  7414             je 0x1dec                                
  1dd8  837efc01         cmp word ptr [bp - 4], 1                 
  1ddc  750e             jne 0x1dec                               
  1dde  8bc6             mov ax, si                               
  1de0  d1e0             shl ax, 1                                
  1de2  c45e06           les bx, ptr [bp + 6]                     
  1de5  03d8             add bx, ax                               
  1de7  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1dea  eb18             jmp 0x1e04                               
  1dec  837ed000         cmp word ptr [bp - 0x30], 0              
  1df0  7415             je 0x1e07                                
  1df2  837efc00         cmp word ptr [bp - 4], 0                 
  1df6  750f             jne 0x1e07                               
  1df8  8bc6             mov ax, si                               
  1dfa  d1e0             shl ax, 1                                
  1dfc  c45e06           les bx, ptr [bp + 6]                     
  1dff  03d8             add bx, ax                               
  1e01  8b46d0           mov ax, word ptr [bp - 0x30]             
  1e04  260107           add word ptr es:[bx], ax                 
  1e07  8bc6             mov ax, si                               
  1e09  d1e0             shl ax, 1                                
  1e0b  c45e06           les bx, ptr [bp + 6]                     
  1e0e  03d8             add bx, ax                               
  1e10  26833f09         cmp word ptr es:[bx], 9                  
  1e14  7d05             jge 0x1e1b                               
  1e16  268b07           mov ax, word ptr es:[bx]                 
  1e19  eb03             jmp 0x1e1e                               
  1e1b  b80900           mov ax, 9                                
  1e1e  8bd6             mov dx, si                               
  1e20  d1e2             shl dx, 1                                
  1e22  c45e06           les bx, ptr [bp + 6]                     
  1e25  03da             add bx, dx                               
  1e27  268907           mov word ptr es:[bx], ax                 
  1e2a  26013f           add word ptr es:[bx], di                 
  1e2d  46               inc si                                   
  1e2e  3b36f630         cmp si, word ptr [0x30f6]                
  1e32  7d03             jge 0x1e37                               
  1e34  e9dbfe           jmp 0x1d12                               
  1e37  5f               pop di                                   
  1e38  5e               pop si                                   
  1e39  c9               leave                                    
  1e3a  cb               retf                                     

ovl66_1e3b:  ; ENTRY
  1e3b  55               push bp                                  
  1e3c  8bec             mov bp, sp                               
  1e3e  c706d8670000     mov word ptr [0x67d8], 0                 
  1e44  6a3a             push 0x3a                                
  1e46  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  1e4b  59               pop cx                                   
  1e4c  8916dc67         mov word ptr [0x67dc], dx                
  1e50  a3da67           mov word ptr [0x67da], ax                
  1e53  66833eda6700     cmp dword ptr [0x67da], 0                
  1e59  7452             je 0x1ead                                
  1e5b  33d2             xor dx, dx                               
  1e5d  eb26             jmp 0x1e85                               
  1e5f  b8042c           mov ax, 0x2c04                           
  1e62  8ec0             mov es, ax                               
  1e64  268b1e1001       mov bx, word ptr es:[0x110]              
  1e69  6bdb1d           imul bx, bx, 0x1d                        
  1e6c  03da             add bx, dx                               
  1e6e  b8042c           mov ax, 0x2c04                           
  1e71  8ec0             mov es, ax                               
  1e73  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  1e78  98               cwde                                     
  1e79  d1e0             shl ax, 1                                
  1e7b  c41eda67         les bx, ptr [0x67da]                     
  1e7f  03d8             add bx, ax                               
  1e81  268917           mov word ptr es:[bx], dx                 
  1e84  42               inc dx                                   
  1e85  83fa1d           cmp dx, 0x1d                             
  1e88  7cd5             jl 0x1e5f                                
  1e8a  6a00             push 0                                   
  1e8c  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1e91  59               pop cx                                   
  1e92  c7066a160100     mov word ptr [0x166a], 1                 
  1e98  6a22             push 0x22                                
  1e9a  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1e9f  59               pop cx                                   
  1ea0  6a00             push 0                                   
  1ea2  90               nop                                      
  1ea3  0e               push cs                                  
  1ea4  e82b01           call 0x1fd2                              
  1ea7  59               pop cx                                   
  1ea8  90               nop                                      
  1ea9  0e               push cs                                  
  1eaa  e8a400           call 0x1f51                              
  1ead  5d               pop bp                                   
  1eae  cb               retf                                     

ovl66_1eaf:  ; ENTRY
  1eaf  55               push bp                                  
  1eb0  8bec             mov bp, sp                               
  1eb2  66ff36da67       push dword ptr [0x67da]                  
  1eb7  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  1ebc  83c404           add sp, 4                                
  1ebf  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1ec4  666a00           push 0                                   
  1ec7  6a00             push 0                                   
  1ec9  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  1ece  83c406           add sp, 6                                
  1ed1  5d               pop bp                                   
  1ed2  cb               retf                                     

ovl66_1ed3:  ; ENTRY
  1ed3  55               push bp                                  
  1ed4  8bec             mov bp, sp                               
  1ed6  ff0ed867         dec word ptr [0x67d8]                    
  1eda  6a01             push 1                                   
  1edc  90               nop                                      
  1edd  0e               push cs                                  
  1ede  e8f100           call 0x1fd2                              
  1ee1  59               pop cx                                   
  1ee2  90               nop                                      
  1ee3  0e               push cs                                  
  1ee4  e86a00           call 0x1f51                              
  1ee7  5d               pop bp                                   
  1ee8  cb               retf                                     

ovl66_1ee9:  ; ENTRY
  1ee9  55               push bp                                  
  1eea  8bec             mov bp, sp                               
  1eec  ff06d867         inc word ptr [0x67d8]                    
  1ef0  6a01             push 1                                   
  1ef2  90               nop                                      
  1ef3  0e               push cs                                  
  1ef4  e8db00           call 0x1fd2                              
  1ef7  59               pop cx                                   
  1ef8  90               nop                                      
  1ef9  0e               push cs                                  
  1efa  e85400           call 0x1f51                              
  1efd  5d               pop bp                                   
  1efe  cb               retf                                     

ovl66_1eff:  ; ENTRY
  1eff  55               push bp                                  
  1f00  8bec             mov bp, sp                               
  1f02  a1d867           mov ax, word ptr [0x67d8]                
  1f05  05faff           add ax, 0xfffa                           
  1f08  7d04             jge 0x1f0e                               
  1f0a  33c0             xor ax, ax                               
  1f0c  eb06             jmp 0x1f14                               
  1f0e  a1d867           mov ax, word ptr [0x67d8]                
  1f11  05faff           add ax, 0xfffa                           
  1f14  a3d867           mov word ptr [0x67d8], ax                
  1f17  6a01             push 1                                   
  1f19  90               nop                                      
  1f1a  0e               push cs                                  
  1f1b  e8b400           call 0x1fd2                              
  1f1e  59               pop cx                                   
  1f1f  90               nop                                      
  1f20  0e               push cs                                  
  1f21  e82d00           call 0x1f51                              
  1f24  5d               pop bp                                   
  1f25  cb               retf                                     

ovl66_1f26:  ; ENTRY
  1f26  55               push bp                                  
  1f27  8bec             mov bp, sp                               
  1f29  a1d867           mov ax, word ptr [0x67d8]                
  1f2c  050600           add ax, 6                                
  1f2f  3d1500           cmp ax, 0x15                             
  1f32  7e05             jle 0x1f39                               
  1f34  b81500           mov ax, 0x15                             
  1f37  eb06             jmp 0x1f3f                               
  1f39  a1d867           mov ax, word ptr [0x67d8]                
  1f3c  050600           add ax, 6                                
  1f3f  a3d867           mov word ptr [0x67d8], ax                
  1f42  6a01             push 1                                   
  1f44  90               nop                                      
  1f45  0e               push cs                                  
  1f46  e88900           call 0x1fd2                              
  1f49  59               pop cx                                   
  1f4a  90               nop                                      
  1f4b  0e               push cs                                  
  1f4c  e80200           call 0x1f51                              
  1f4f  5d               pop bp                                   
  1f50  cb               retf                                     

ovl66_1f51:  ; ENTRY
  1f51  55               push bp                                  
  1f52  8bec             mov bp, sp                               
  1f54  6668ea010100     push 0x101ea                             
  1f5a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1f5f  83c404           add sp, 4                                
  1f62  833ed86700       cmp word ptr [0x67d8], 0                 
  1f67  7f12             jg 0x1f7b                                
  1f69  6668eb010200     push 0x201eb                             
  1f6f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1f74  83c404           add sp, 4                                
  1f77  6a02             push 2                                   
  1f79  eb10             jmp 0x1f8b                               
  1f7b  6668eb010100     push 0x101eb                             
  1f81  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1f86  83c404           add sp, 4                                
  1f89  6a01             push 1                                   
  1f8b  68ed01           push 0x1ed                               
  1f8e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1f93  83c404           add sp, 4                                
  1f96  a1d867           mov ax, word ptr [0x67d8]                
  1f99  050600           add ax, 6                                
  1f9c  3d1b00           cmp ax, 0x1b                             
  1f9f  7c1d             jl 0x1fbe                                
  1fa1  6668ec010200     push 0x201ec                             
  1fa7  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fac  83c404           add sp, 4                                
  1faf  6a02             push 2                                   
  1fb1  68ee01           push 0x1ee                               
  1fb4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fb9  83c404           add sp, 4                                
  1fbc  eb12             jmp 0x1fd0                               
  1fbe  6668ec010100     push 0x101ec                             
  1fc4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fc9  83c404           add sp, 4                                
  1fcc  6a01             push 1                                   
  1fce  ebe1             jmp 0x1fb1                               
  1fd0  5d               pop bp                                   
  1fd1  cb               retf                                     

ovl66_1fd2:  ; ENTRY
  1fd2  55               push bp                                  
  1fd3  8bec             mov bp, sp                               
  1fd5  83ec4a           sub sp, 0x4a                             
  1fd8  56               push si                                  
  1fd9  57               push di                                  
  1fda  837e0600         cmp word ptr [bp + 6], 0                 
  1fde  7403             je 0x1fe3                                
  1fe0  e9c700           jmp 0x20aa                               
  1fe3  666800000300     push 0x30000                             
  1fe9  666801000f00     push 0xf0001                             
  1fef  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1ff4  83c408           add sp, 8                                
  1ff7  6668a4000000     push 0xa4                                
  1ffd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2002  83c404           add sp, 4                                
  2005  52               push dx                                  
  2006  50               push ax                                  
  2007  666840013e00     push 0x3e0140                            
  200d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  2012  83c408           add sp, 8                                
  2015  666804000200     push 0x20004                             
  201b  6668b201ba00     push 0xba01b2                            
  2021  66687c009200     push 0x92007c                            
  2027  16               push ss                                  
  2028  8d46f8           lea ax, [bp - 8]                         
  202b  50               push ax                                  
  202c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  2031  83c40c           add sp, 0xc                              
  2034  52               push dx                                  
  2035  50               push ax                                  
  2036  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  203b  83c408           add sp, 8                                
  203e  6a00             push 0                                   
  2040  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  2045  59               pop cx                                   
  2046  ff46f8           inc word ptr [bp - 8]                    
  2049  ff46fa           inc word ptr [bp - 6]                    
  204c  836efc02         sub word ptr [bp - 4], 2                 
  2050  836efe02         sub word ptr [bp - 2], 2                 
  2054  16               push ss                                  
  2055  8d46f8           lea ax, [bp - 8]                         
  2058  50               push ax                                  
  2059  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  205e  83c404           add sp, 4                                
  2061  6668d8001600     push 0x1600d8                            
  2067  6668bc000000     push 0xbc                                
  206d  16               push ss                                  
  206e  8d46f8           lea ax, [bp - 8]                         
  2071  50               push ax                                  
  2072  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  2077  83c40c           add sp, 0xc                              
  207a  666800017d00     push 0x7d0100                            
  2080  16               push ss                                  
  2081  8d46f4           lea ax, [bp - 0xc]                       
  2084  50               push ax                                  
  2085  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  208a  83c408           add sp, 8                                
  208d  66ff76f4         push dword ptr [bp - 0xc]                
  2091  8d46f8           lea ax, [bp - 8]                         
  2094  8cd2             mov dx, ss                               
  2096  b90800           mov cx, 8                                
  2099  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  209e  6a2e             push 0x2e                                
  20a0  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  20a5  83c40e           add sp, 0xe                              
  20a8  eb14             jmp 0x20be                               
  20aa  6668a801b600     push 0xb601a8                            
  20b0  666830005800     push 0x580030                            
  20b6  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  20bb  83c408           add sp, 8                                
  20be  666800000300     push 0x30000                             
  20c4  666802000f00     push 0xf0002                             
  20ca  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  20cf  83c408           add sp, 8                                
  20d2  33f6             xor si, si                               
  20d4  e97301           jmp 0x224a                               
  20d7  a1d867           mov ax, word ptr [0x67d8]                
  20da  03c6             add ax, si                               
  20dc  d1e0             shl ax, 1                                
  20de  c41eda67         les bx, ptr [0x67da]                     
  20e2  03d8             add bx, ax                               
  20e4  268b3f           mov di, word ptr es:[bx]                 
  20e7  666a00           push 0                                   
  20ea  b8042c           mov ax, 0x2c04                           
  20ed  8ec0             mov es, ax                               
  20ef  26a11001         mov ax, word ptr es:[0x110]              
  20f3  050200           add ax, 2                                
  20f6  50               push ax                                  
  20f7  666a00           push 0                                   
  20fa  666a00           push 0                                   
  20fd  8bc6             mov ax, si                               
  20ff  6bc01e           imul ax, ax, 0x1e                        
  2102  059400           add ax, 0x94                             
  2105  50               push ax                                  
  2106  688000           push 0x80                                
  2109  1e               push ds                                  
  210a  682a34           push 0x342a                              
  210d  b8042c           mov ax, 0x2c04                           
  2110  8ec0             mov es, ax                               
  2112  26ff361001       push word ptr es:[0x110]                 
  2117  57               push di                                  
  2118  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  211d  83c41a           add sp, 0x1a                             
  2120  16               push ss                                  
  2121  8d46b6           lea ax, [bp - 0x4a]                      
  2124  50               push ax                                  
  2125  57               push di                                  
  2126  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  212b  83c406           add sp, 6                                
  212e  16               push ss                                  
  212f  8d46b8           lea ax, [bp - 0x48]                      
  2132  50               push ax                                  
  2133  8bc6             mov ax, si                               
  2135  6bc01e           imul ax, ax, 0x1e                        
  2138  059900           add ax, 0x99                             
  213b  50               push ax                                  
  213c  68a800           push 0xa8                                
  213f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  2144  83c408           add sp, 8                                
  2147  ff76cc           push word ptr [bp - 0x34]                
  214a  1e               push ds                                  
  214b  684932           push 0x3249                              
  214e  1e               push ds                                  
  214f  68885c           push 0x5c88                              
  2152  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  2157  83c40a           add sp, 0xa                              
  215a  1e               push ds                                  
  215b  68885c           push 0x5c88                              
  215e  8bc6             mov ax, si                               
  2160  6bc01e           imul ax, ax, 0x1e                        
  2163  059900           add ax, 0x99                             
  2166  50               push ax                                  
  2167  681801           push 0x118                               
  216a  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  216f  83c408           add sp, 8                                
  2172  ff76d2           push word ptr [bp - 0x2e]                
  2175  1e               push ds                                  
  2176  684c32           push 0x324c                              
  2179  1e               push ds                                  
  217a  68885c           push 0x5c88                              
  217d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  2182  83c40a           add sp, 0xa                              
  2185  1e               push ds                                  
  2186  68885c           push 0x5c88                              
  2189  8bc6             mov ax, si                               
  218b  6bc01e           imul ax, ax, 0x1e                        
  218e  059900           add ax, 0x99                             
  2191  50               push ax                                  
  2192  684801           push 0x148                               
  2195  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  219a  83c408           add sp, 8                                
  219d  8bc6             mov ax, si                               
  219f  6bc01e           imul ax, ax, 0x1e                        
  21a2  059c00           add ax, 0x9c                             
  21a5  50               push ax                                  
  21a6  686001           push 0x160                               
  21a9  16               push ss                                  
  21aa  8d46f4           lea ax, [bp - 0xc]                       
  21ad  50               push ax                                  
  21ae  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  21b3  83c408           add sp, 8                                
  21b6  8bdf             mov bx, di                               
  21b8  6bdb06           imul bx, bx, 6                           
  21bb  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  21c0  7409             je 0x21cb                                
  21c2  66ff76f4         push dword ptr [bp - 0xc]                
  21c6  b84630           mov ax, 0x3046                           
  21c9  eb49             jmp 0x2214                               
  21cb  8bdf             mov bx, di                               
  21cd  6bdb06           imul bx, bx, 6                           
  21d0  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  21d5  7415             je 0x21ec                                
  21d7  8bdf             mov bx, di                               
  21d9  6bdb06           imul bx, bx, 6                           
  21dc  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  21e1  7409             je 0x21ec                                
  21e3  66ff76f4         push dword ptr [bp - 0xc]                
  21e7  b85e30           mov ax, 0x305e                           
  21ea  eb28             jmp 0x2214                               
  21ec  8bdf             mov bx, di                               
  21ee  6bdb06           imul bx, bx, 6                           
  21f1  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  21f6  7409             je 0x2201                                
  21f8  66ff76f4         push dword ptr [bp - 0xc]                
  21fc  b85630           mov ax, 0x3056                           
  21ff  eb13             jmp 0x2214                               
  2201  8bdf             mov bx, di                               
  2203  6bdb06           imul bx, bx, 6                           
  2206  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  220b  741b             je 0x2228                                
  220d  66ff76f4         push dword ptr [bp - 0xc]                
  2211  b84e30           mov ax, 0x304e                           
  2214  8cda             mov dx, ds                               
  2216  b90800           mov cx, 8                                
  2219  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  221e  6a08             push 8                                   
  2220  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  2225  83c40e           add sp, 0xe                              
  2228  666a00           push 0                                   
  222b  57               push di                                  
  222c  0e               push cs                                  
  222d  e8d7f7           call 0x1a07                              
  2230  83c406           add sp, 6                                
  2233  52               push dx                                  
  2234  50               push ax                                  
  2235  8bc6             mov ax, si                               
  2237  6bc01e           imul ax, ax, 0x1e                        
  223a  059a00           add ax, 0x9a                             
  223d  50               push ax                                  
  223e  689001           push 0x190                               
  2241  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  2246  83c408           add sp, 8                                
  2249  46               inc si                                   
  224a  83fe06           cmp si, 6                                
  224d  7d03             jge 0x2252                               
  224f  e985fe           jmp 0x20d7                               
  2252  5f               pop di                                   
  2253  5e               pop si                                   
  2254  c9               leave                                    
  2255  cb               retf                                     
