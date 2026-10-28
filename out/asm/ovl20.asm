; ovl20 stub 2fbd file_off 0x4ae30 size 0x1d38

ovl20_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec64           sub sp, 0x64                             
  0006  56               push si                                  
  0007  be6400           mov si, 0x64                             
  000a  eb04             jmp 0x10                                 
  000c  c6429c00         mov byte ptr [bp + si - 0x64], 0         
  0010  8bc6             mov ax, si                               
  0012  4e               dec si                                   
  0013  0bc0             or ax, ax                                
  0015  75f5             jne 0xc                                  
  0017  b8042c           mov ax, 0x2c04                           
  001a  8ec0             mov es, ax                               
  001c  268b0e8101       mov cx, word ptr es:[0x181]              
  0021  eb6c             jmp 0x8f                                 
  0023  8bd9             mov bx, cx                               
  0025  6bdb16           imul bx, bx, 0x16                        
  0028  b81d1e           mov ax, 0x1e1d                           
  002b  8ec0             mov es, ax                               
  002d  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0032  98               cwde                                     
  0033  ba042c           mov dx, 0x2c04                           
  0036  8ec2             mov es, dx                               
  0038  263b061001       cmp ax, word ptr es:[0x110]              
  003d  7550             jne 0x8f                                 
  003f  8bd9             mov bx, cx                               
  0041  6bdb16           imul bx, bx, 0x16                        
  0044  b81d1e           mov ax, 0x1e1d                           
  0047  8ec0             mov es, ax                               
  0049  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  004e  250f00           and ax, 0xf                              
  0051  3d0100           cmp ax, 1                                
  0054  7539             jne 0x8f                                 
  0056  8bd9             mov bx, cx                               
  0058  6bdb16           imul bx, bx, 0x16                        
  005b  b81d1e           mov ax, 0x1e1d                           
  005e  8ec0             mov es, ax                               
  0060  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0065  d1e8             shr ax, 1                                
  0067  257f00           and ax, 0x7f                             
  006a  8ec2             mov es, dx                               
  006c  263b067b15       cmp ax, word ptr es:[0x157b]             
  0071  731c             jae 0x8f                                 
  0073  8bd9             mov bx, cx                               
  0075  6bdb16           imul bx, bx, 0x16                        
  0078  b81d1e           mov ax, 0x1e1d                           
  007b  8ec0             mov es, ax                               
  007d  268a9f8f88       mov bl, byte ptr es:[bx - 0x7771]        
  0082  d1eb             shr bx, 1                                
  0084  83e37f           and bx, 0x7f                             
  0087  8d469c           lea ax, [bp - 0x64]                      
  008a  03d8             add bx, ax                               
  008c  36fe07           inc byte ptr ss:[bx]                     
  008f  8bc1             mov ax, cx                               
  0091  49               dec cx                                   
  0092  0bc0             or ax, ax                                
  0094  758d             jne 0x23                                 
  0096  33f6             xor si, si                               
  0098  eb13             jmp 0xad                                 
  009a  16               push ss                                  
  009b  8d469c           lea ax, [bp - 0x64]                      
  009e  50               push ax                                  
  009f  56               push si                                  
  00a0  90               nop                                      
  00a1  0e               push cs                                  
  00a2  e81000           call 0xb5                                
  00a5  83c406           add sp, 6                                
  00a8  0bc0             or ax, ax                                
  00aa  7406             je 0xb2                                  
  00ac  46               inc si                                   
  00ad  83fe0a           cmp si, 0xa                              
  00b0  7ce8             jl 0x9a                                  
  00b2  5e               pop si                                   
  00b3  c9               leave                                    
  00b4  cb               retf                                     

ovl20_00b5:  ; ENTRY
  00b5  55               push bp                                  
  00b6  8bec             mov bp, sp                               
  00b8  83ec06           sub sp, 6                                
  00bb  56               push si                                  
  00bc  57               push di                                  
  00bd  33ff             xor di, di                               
  00bf  b8042c           mov ax, 0x2c04                           
  00c2  8ec0             mov es, ax                               
  00c4  268b367b15       mov si, word ptr es:[0x157b]             
  00c9  e91a01           jmp 0x1e6                                
  00cc  8bde             mov bx, si                               
  00ce  6bdb41           imul bx, bx, 0x41                        
  00d1  b8042c           mov ax, 0x2c04                           
  00d4  8ec0             mov es, ax                               
  00d6  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  00db  98               cwde                                     
  00dc  ba042c           mov dx, 0x2c04                           
  00df  8ec2             mov es, dx                               
  00e1  263b061001       cmp ax, word ptr es:[0x110]              
  00e6  7403             je 0xeb                                  
  00e8  e9fb00           jmp 0x1e6                                
  00eb  837e0600         cmp word ptr [bp + 6], 0                 
  00ef  7410             je 0x101                                 
  00f1  c41eee40         les bx, ptr [0x40ee]                     
  00f5  03de             add bx, si                               
  00f7  26807f5601       cmp byte ptr es:[bx + 0x56], 1           
  00fc  7403             je 0x101                                 
  00fe  e9e500           jmp 0x1e6                                
  0101  c41eee40         les bx, ptr [0x40ee]                     
  0105  03de             add bx, si                               
  0107  26807f5601       cmp byte ptr es:[bx + 0x56], 1           
  010c  7516             jne 0x124                                
  010e  6a01             push 1                                   
  0110  56               push si                                  
  0111  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  0116  83c404           add sp, 4                                
  0119  c41eee40         les bx, ptr [0x40ee]                     
  011d  03de             add bx, si                               
  011f  26c6475603       mov byte ptr es:[bx + 0x56], 3           
  0124  666a00           push 0                                   
  0127  16               push ss                                  
  0128  8d46fa           lea ax, [bp - 6]                         
  012b  50               push ax                                  
  012c  56               push si                                  
  012d  90               nop                                      
  012e  0e               push cs                                  
  012f  e8c400           call 0x1f6                               
  0132  83c40a           add sp, 0xa                              
  0135  0bc0             or ax, ax                                
  0137  7549             jne 0x182                                
  0139  c41eee40         les bx, ptr [0x40ee]                     
  013d  03de             add bx, si                               
  013f  26807f5603       cmp byte ptr es:[bx + 0x56], 3           
  0144  740d             je 0x153                                 
  0146  8b1eee40         mov bx, word ptr [0x40ee]                
  014a  03de             add bx, si                               
  014c  26807f5602       cmp byte ptr es:[bx + 0x56], 2           
  0151  750b             jne 0x15e                                
  0153  c41eee40         les bx, ptr [0x40ee]                     
  0157  03de             add bx, si                               
  0159  26c6475604       mov byte ptr es:[bx + 0x56], 4           
  015e  b8042c           mov ax, 0x2c04                           
  0161  8ec0             mov es, ax                               
  0163  26833e280100     cmp word ptr es:[0x128], 0               
  0169  757b             jne 0x1e6                                
  016b  c41eee40         les bx, ptr [0x40ee]                     
  016f  03de             add bx, si                               
  0171  26807f5605       cmp byte ptr es:[bx + 0x56], 5           
  0176  756e             jne 0x1e6                                
  0178  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  017d  3d0500           cmp ax, 5                                
  0180  7f64             jg 0x1e6                                 
  0182  47               inc di                                   
  0183  66ff7608         push dword ptr [bp + 8]                  
  0187  56               push si                                  
  0188  90               nop                                      
  0189  0e               push cs                                  
  018a  e81d02           call 0x3aa                               
  018d  83c406           add sp, 6                                
  0190  0bc0             or ax, ax                                
  0192  7428             je 0x1bc                                 
  0194  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0199  3d0a00           cmp ax, 0xa                              
  019c  7e05             jle 0x1a3                                
  019e  b80100           mov ax, 1                                
  01a1  eb02             jmp 0x1a5                                
  01a3  33c0             xor ax, ax                               
  01a5  50               push ax                                  
  01a6  56               push si                                  
  01a7  90               nop                                      
  01a8  0e               push cs                                  
  01a9  e86d09           call 0xb19                               
  01ac  83c404           add sp, 4                                
  01af  c41eee40         les bx, ptr [0x40ee]                     
  01b3  03de             add bx, si                               
  01b5  26c6475602       mov byte ptr es:[bx + 0x56], 2           
  01ba  eb2a             jmp 0x1e6                                
  01bc  66ff7608         push dword ptr [bp + 8]                  
  01c0  56               push si                                  
  01c1  90               nop                                      
  01c2  0e               push cs                                  
  01c3  e86f07           call 0x935                               
  01c6  83c406           add sp, 6                                
  01c9  3dff00           cmp ax, 0xff                             
  01cc  750d             jne 0x1db                                
  01ce  c41eee40         les bx, ptr [0x40ee]                     
  01d2  03de             add bx, si                               
  01d4  26c6475604       mov byte ptr es:[bx + 0x56], 4           
  01d9  eb0b             jmp 0x1e6                                
  01db  c41eee40         les bx, ptr [0x40ee]                     
  01df  03de             add bx, si                               
  01e1  26c6475603       mov byte ptr es:[bx + 0x56], 3           
  01e6  8bc6             mov ax, si                               
  01e8  4e               dec si                                   
  01e9  0bc0             or ax, ax                                
  01eb  7403             je 0x1f0                                 
  01ed  e9dcfe           jmp 0xcc                                 
  01f0  8bc7             mov ax, di                               
  01f2  5f               pop di                                   
  01f3  5e               pop si                                   
  01f4  c9               leave                                    
  01f5  cb               retf                                     

ovl20_01f6:  ; ENTRY
  01f6  55               push bp                                  
  01f7  8bec             mov bp, sp                               
  01f9  56               push si                                  
  01fa  57               push di                                  
  01fb  33ff             xor di, di                               
  01fd  33d2             xor dx, dx                               
  01ff  e9ef00           jmp 0x2f1                                
  0202  66837e0800       cmp dword ptr [bp + 8], 0                
  0207  7409             je 0x212                                 
  0209  c45e08           les bx, ptr [bp + 8]                     
  020c  03da             add bx, dx                               
  020e  26c607ff         mov byte ptr es:[bx], 0xff               
  0212  66837e0c00       cmp dword ptr [bp + 0xc], 0              
  0217  7409             je 0x222                                 
  0219  c45e0c           les bx, ptr [bp + 0xc]                   
  021c  03da             add bx, dx                               
  021e  26c60700         mov byte ptr es:[bx], 0                  
  0222  8b4606           mov ax, word ptr [bp + 6]                
  0225  6bc006           imul ax, ax, 6                           
  0228  c41eea40         les bx, ptr [0x40ea]                     
  022c  03d8             add bx, ax                               
  022e  03da             add bx, dx                               
  0230  268a07           mov al, byte ptr es:[bx]                 
  0233  b400             mov ah, 0                                
  0235  8bc8             mov cx, ax                               
  0237  3dff00           cmp ax, 0xff                             
  023a  7503             jne 0x23f                                
  023c  e9b100           jmp 0x2f0                                
  023f  c41eee40         les bx, ptr [0x40ee]                     
  0243  26394f46         cmp word ptr es:[bx + 0x46], cx          
  0247  7503             jne 0x24c                                
  0249  e9a400           jmp 0x2f0                                
  024c  8bd9             mov bx, cx                               
  024e  6bdb41           imul bx, bx, 0x41                        
  0251  b8042c           mov ax, 0x2c04                           
  0254  8ec0             mov es, ax                               
  0256  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  025b  69dbe000         imul bx, bx, 0xe0                        
  025f  8bf1             mov si, cx                               
  0261  6bf641           imul si, si, 0x41                        
  0264  b8042c           mov ax, 0x2c04                           
  0267  8ec0             mov es, ax                               
  0269  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  026e  d1e0             shl ax, 1                                
  0270  03d8             add bx, ax                               
  0272  b81d1e           mov ax, 0x1e1d                           
  0275  8ec0             mov es, ax                               
  0277  268a9f0000       mov bl, byte ptr es:[bx]                 
  027c  81e3ff00         and bx, 0xff                             
  0280  b8042c           mov ax, 0x2c04                           
  0283  8ec0             mov es, ax                               
  0285  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  028b  7563             jne 0x2f0                                
  028d  8bd9             mov bx, cx                               
  028f  6bdb41           imul bx, bx, 0x41                        
  0292  b8042c           mov ax, 0x2c04                           
  0295  8ec0             mov es, ax                               
  0297  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  029d  7551             jne 0x2f0                                
  029f  0bff             or di, di                                
  02a1  741b             je 0x2be                                 
  02a3  83fa02           cmp dx, 2                                
  02a6  7c16             jl 0x2be                                 
  02a8  8b4606           mov ax, word ptr [bp + 6]                
  02ab  6bc006           imul ax, ax, 6                           
  02ae  c41eea40         les bx, ptr [0x40ea]                     
  02b2  03d8             add bx, ax                               
  02b4  03da             add bx, dx                               
  02b6  2680bf580214     cmp byte ptr es:[bx + 0x258], 0x14       
  02bc  7332             jae 0x2f0                                
  02be  66837e0800       cmp dword ptr [bp + 8], 0                
  02c3  7408             je 0x2cd                                 
  02c5  c45e08           les bx, ptr [bp + 8]                     
  02c8  03da             add bx, dx                               
  02ca  26880f           mov byte ptr es:[bx], cl                 
  02cd  66837e0c00       cmp dword ptr [bp + 0xc], 0              
  02d2  741b             je 0x2ef                                 
  02d4  8b4606           mov ax, word ptr [bp + 6]                
  02d7  6bc006           imul ax, ax, 6                           
  02da  c41eea40         les bx, ptr [0x40ea]                     
  02de  03d8             add bx, ax                               
  02e0  03da             add bx, dx                               
  02e2  268a875802       mov al, byte ptr es:[bx + 0x258]         
  02e7  c45e0c           les bx, ptr [bp + 0xc]                   
  02ea  03da             add bx, dx                               
  02ec  268807           mov byte ptr es:[bx], al                 
  02ef  47               inc di                                   
  02f0  42               inc dx                                   
  02f1  83fa06           cmp dx, 6                                
  02f4  7d03             jge 0x2f9                                
  02f6  e909ff           jmp 0x202                                
  02f9  8bc7             mov ax, di                               
  02fb  5f               pop di                                   
  02fc  5e               pop si                                   
  02fd  5d               pop bp                                   
  02fe  cb               retf                                     

ovl20_02ff:  ; ENTRY
  02ff  55               push bp                                  
  0300  8bec             mov bp, sp                               
  0302  83ec06           sub sp, 6                                
  0305  56               push si                                  
  0306  57               push di                                  
  0307  b8042c           mov ax, 0x2c04                           
  030a  8ec0             mov es, ax                               
  030c  268b367b15       mov si, word ptr es:[0x157b]             
  0311  e98800           jmp 0x39c                                
  0314  8bde             mov bx, si                               
  0316  6bdb41           imul bx, bx, 0x41                        
  0319  b8042c           mov ax, 0x2c04                           
  031c  8ec0             mov es, ax                               
  031e  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0323  ba042c           mov dx, 0x2c04                           
  0326  8ec2             mov es, dx                               
  0328  263a061001       cmp al, byte ptr es:[0x110]              
  032d  756d             jne 0x39c                                
  032f  c41eee40         les bx, ptr [0x40ee]                     
  0333  03de             add bx, si                               
  0335  26807f5603       cmp byte ptr es:[bx + 0x56], 3           
  033a  7560             jne 0x39c                                
  033c  666a00           push 0                                   
  033f  16               push ss                                  
  0340  8d46fa           lea ax, [bp - 6]                         
  0343  50               push ax                                  
  0344  56               push si                                  
  0345  0e               push cs                                  
  0346  e8adfe           call 0x1f6                               
  0349  83c40a           add sp, 0xa                              
  034c  0bc0             or ax, ax                                
  034e  744c             je 0x39c                                 
  0350  33d2             xor dx, dx                               
  0352  bf0600           mov di, 6                                
  0355  eb2f             jmp 0x386                                
  0357  8a43fa           mov al, byte ptr [bp + di - 6]           
  035a  b400             mov ah, 0                                
  035c  8bc8             mov cx, ax                               
  035e  3dff00           cmp ax, 0xff                             
  0361  7423             je 0x386                                 
  0363  8bd9             mov bx, cx                               
  0365  6bdb41           imul bx, bx, 0x41                        
  0368  b8042c           mov ax, 0x2c04                           
  036b  8ec0             mov es, ax                               
  036d  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0373  7511             jne 0x386                                
  0375  c41eee40         les bx, ptr [0x40ee]                     
  0379  03d9             add bx, cx                               
  037b  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0381  7503             jne 0x386                                
  0383  ba0100           mov dx, 1                                
  0386  8bc7             mov ax, di                               
  0388  4f               dec di                                   
  0389  0bc0             or ax, ax                                
  038b  75ca             jne 0x357                                
  038d  0bd2             or dx, dx                                
  038f  750b             jne 0x39c                                
  0391  c41eee40         les bx, ptr [0x40ee]                     
  0395  03de             add bx, si                               
  0397  26c6475602       mov byte ptr es:[bx + 0x56], 2           
  039c  8bc6             mov ax, si                               
  039e  4e               dec si                                   
  039f  0bc0             or ax, ax                                
  03a1  7403             je 0x3a6                                 
  03a3  e96eff           jmp 0x314                                
  03a6  5f               pop di                                   
  03a7  5e               pop si                                   
  03a8  c9               leave                                    
  03a9  cb               retf                                     

ovl20_03aa:  ; ENTRY
  03aa  55               push bp                                  
  03ab  8bec             mov bp, sp                               
  03ad  83ec28           sub sp, 0x28                             
  03b0  56               push si                                  
  03b1  57               push di                                  
  03b2  6aff             push -1                                  
  03b4  8b5e06           mov bx, word ptr [bp + 6]                
  03b7  6bdb41           imul bx, bx, 0x41                        
  03ba  b8042c           mov ax, 0x2c04                           
  03bd  8ec0             mov es, ax                               
  03bf  26ffb77f15       push word ptr es:[bx + 0x157f]           
  03c4  8b5e06           mov bx, word ptr [bp + 6]                
  03c7  6bdb41           imul bx, bx, 0x41                        
  03ca  b8042c           mov ax, 0x2c04                           
  03cd  8ec0             mov es, ax                               
  03cf  26ffb77d15       push word ptr es:[bx + 0x157d]           
  03d4  90               nop                                      
  03d5  0e               push cs                                  
  03d6  e86506           call 0xa3e                               
  03d9  83c406           add sp, 6                                
  03dc  8bd0             mov dx, ax                               
  03de  b8042c           mov ax, 0x2c04                           
  03e1  8ec0             mov es, ax                               
  03e3  26833e240100     cmp word ptr es:[0x124], 0               
  03e9  7405             je 0x3f0                                 
  03eb  b80100           mov ax, 1                                
  03ee  eb02             jmp 0x3f2                                
  03f0  33c0             xor ax, ax                               
  03f2  8946fa           mov word ptr [bp - 6], ax                
  03f5  b8042c           mov ax, 0x2c04                           
  03f8  8ec0             mov es, ax                               
  03fa  26833e1a0100     cmp word ptr es:[0x11a], 0               
  0400  7405             je 0x407                                 
  0402  b80800           mov ax, 8                                
  0405  eb03             jmp 0x40a                                
  0407  b80100           mov ax, 1                                
  040a  8946f8           mov word ptr [bp - 8], ax                
  040d  83fa0f           cmp dx, 0xf                              
  0410  7d05             jge 0x417                                
  0412  b80100           mov ax, 1                                
  0415  eb02             jmp 0x419                                
  0417  33c0             xor ax, ax                               
  0419  8bf8             mov di, ax                               
  041b  83fa05           cmp dx, 5                                
  041e  7d05             jge 0x425                                
  0420  b80200           mov ax, 2                                
  0423  eb02             jmp 0x427                                
  0425  33c0             xor ax, ax                               
  0427  03f8             add di, ax                               
  0429  c41eee40         les bx, ptr [0x40ee]                     
  042d  26837f4800       cmp word ptr es:[bx + 0x48], 0           
  0432  7401             je 0x435                                 
  0434  47               inc di                                   
  0435  33d2             xor dx, dx                               
  0437  b90800           mov cx, 8                                
  043a  eb0f             jmp 0x44b                                
  043c  8bc1             mov ax, cx                               
  043e  d1e0             shl ax, 1                                
  0440  c41eee40         les bx, ptr [0x40ee]                     
  0444  03d8             add bx, ax                               
  0446  2603970c04       add dx, word ptr es:[bx + 0x40c]         
  044b  8bc1             mov ax, cx                               
  044d  49               dec cx                                   
  044e  0bc0             or ax, ax                                
  0450  75ea             jne 0x43c                                
  0452  83fa02           cmp dx, 2                                
  0455  7e05             jle 0x45c                                
  0457  b80200           mov ax, 2                                
  045a  eb02             jmp 0x45e                                
  045c  8bc2             mov ax, dx                               
  045e  03f8             add di, ax                               
  0460  897efe           mov word ptr [bp - 2], di                
  0463  b90800           mov cx, 8                                
  0466  eb1b             jmp 0x483                                
  0468  8bd9             mov bx, cx                               
  046a  d1e3             shl bx, 1                                
  046c  8d46d8           lea ax, [bp - 0x28]                      
  046f  03d8             add bx, ax                               
  0471  b8ffff           mov ax, 0xffff                           
  0474  368907           mov word ptr ss:[bx], ax                 
  0477  8bd9             mov bx, cx                               
  0479  d1e3             shl bx, 1                                
  047b  8d56e8           lea dx, [bp - 0x18]                      
  047e  03da             add bx, dx                               
  0480  368907           mov word ptr ss:[bx], ax                 
  0483  8bc1             mov ax, cx                               
  0485  49               dec cx                                   
  0486  0bc0             or ax, ax                                
  0488  75de             jne 0x468                                
  048a  33f6             xor si, si                               
  048c  b8042c           mov ax, 0x2c04                           
  048f  8ec0             mov es, ax                               
  0491  268b0e8101       mov cx, word ptr es:[0x181]              
  0496  e9c200           jmp 0x55b                                
  0499  8bd9             mov bx, cx                               
  049b  6bdb16           imul bx, bx, 0x16                        
  049e  b81d1e           mov ax, 0x1e1d                           
  04a1  8ec0             mov es, ax                               
  04a3  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  04a8  ba042c           mov dx, 0x2c04                           
  04ab  8ec2             mov es, dx                               
  04ad  263a061001       cmp al, byte ptr es:[0x110]              
  04b2  7403             je 0x4b7                                 
  04b4  e9a400           jmp 0x55b                                
  04b7  8bd9             mov bx, cx                               
  04b9  6bdb16           imul bx, bx, 0x16                        
  04bc  b81d1e           mov ax, 0x1e1d                           
  04bf  8ec0             mov es, ax                               
  04c1  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  04c6  c1e804           shr ax, 4                                
  04c9  250700           and ax, 7                                
  04cc  0bc0             or ax, ax                                
  04ce  7403             je 0x4d3                                 
  04d0  e98800           jmp 0x55b                                
  04d3  8bd9             mov bx, cx                               
  04d5  6bdb16           imul bx, bx, 0x16                        
  04d8  b81d1e           mov ax, 0x1e1d                           
  04db  8ec0             mov es, ax                               
  04dd  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  04e4  7575             jne 0x55b                                
  04e6  8bd9             mov bx, cx                               
  04e8  6bdb16           imul bx, bx, 0x16                        
  04eb  b81d1e           mov ax, 0x1e1d                           
  04ee  8ec0             mov es, ax                               
  04f0  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  04f5  250f00           and ax, 0xf                              
  04f8  0bc0             or ax, ax                                
  04fa  755f             jne 0x55b                                
  04fc  8bd9             mov bx, cx                               
  04fe  6bdb16           imul bx, bx, 0x16                        
  0501  b81d1e           mov ax, 0x1e1d                           
  0504  8ec0             mov es, ax                               
  0506  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  050b  8b5e06           mov bx, word ptr [bp + 6]                
  050e  6bdb41           imul bx, bx, 0x41                        
  0511  ba042c           mov dx, 0x2c04                           
  0514  8ec2             mov es, dx                               
  0516  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  051b  753e             jne 0x55b                                
  051d  8bd9             mov bx, cx                               
  051f  6bdb16           imul bx, bx, 0x16                        
  0522  b81d1e           mov ax, 0x1e1d                           
  0525  8ec0             mov es, ax                               
  0527  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  052c  8b5e06           mov bx, word ptr [bp + 6]                
  052f  6bdb41           imul bx, bx, 0x41                        
  0532  ba042c           mov dx, 0x2c04                           
  0535  8ec2             mov es, dx                               
  0537  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  053c  751d             jne 0x55b                                
  053e  837efe00         cmp word ptr [bp - 2], 0                 
  0542  7405             je 0x549                                 
  0544  ff4efe           dec word ptr [bp - 2]                    
  0547  eb12             jmp 0x55b                                
  0549  8bde             mov bx, si                               
  054b  d1e3             shl bx, 1                                
  054d  8d46e8           lea ax, [bp - 0x18]                      
  0550  03d8             add bx, ax                               
  0552  36890f           mov word ptr ss:[bx], cx                 
  0555  46               inc si                                   
  0556  83fe08           cmp si, 8                                
  0559  7d0a             jge 0x565                                
  055b  8bc1             mov ax, cx                               
  055d  49               dec cx                                   
  055e  0bc0             or ax, ax                                
  0560  7403             je 0x565                                 
  0562  e934ff           jmp 0x499                                
  0565  0bf6             or si, si                                
  0567  7505             jne 0x56e                                
  0569  33c0             xor ax, ax                               
  056b  e95501           jmp 0x6c3                                
  056e  c746fc0000       mov word ptr [bp - 4], 0                 
  0573  beffff           mov si, 0xffff                           
  0576  33d2             xor dx, dx                               
  0578  b90800           mov cx, 8                                
  057b  eb48             jmp 0x5c5                                
  057d  8bd9             mov bx, cx                               
  057f  d1e3             shl bx, 1                                
  0581  8d46e8           lea ax, [bp - 0x18]                      
  0584  03d8             add bx, ax                               
  0586  36833fff         cmp word ptr ss:[bx], -1                 
  058a  7439             je 0x5c5                                 
  058c  8bd9             mov bx, cx                               
  058e  d1e3             shl bx, 1                                
  0590  03d8             add bx, ax                               
  0592  368b1f           mov bx, word ptr ss:[bx]                 
  0595  6bdb16           imul bx, bx, 0x16                        
  0598  b81d1e           mov ax, 0x1e1d                           
  059b  8ec0             mov es, ax                               
  059d  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  05a2  98               cwde                                     
  05a3  3bc2             cmp ax, dx                               
  05a5  7e1e             jle 0x5c5                                
  05a7  8bf1             mov si, cx                               
  05a9  8bd9             mov bx, cx                               
  05ab  d1e3             shl bx, 1                                
  05ad  8d46e8           lea ax, [bp - 0x18]                      
  05b0  03d8             add bx, ax                               
  05b2  368b1f           mov bx, word ptr ss:[bx]                 
  05b5  6bdb16           imul bx, bx, 0x16                        
  05b8  b81d1e           mov ax, 0x1e1d                           
  05bb  8ec0             mov es, ax                               
  05bd  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  05c2  98               cwde                                     
  05c3  8bd0             mov dx, ax                               
  05c5  8bc1             mov ax, cx                               
  05c7  49               dec cx                                   
  05c8  0bc0             or ax, ax                                
  05ca  75b1             jne 0x57d                                
  05cc  83feff           cmp si, -1                               
  05cf  742d             je 0x5fe                                 
  05d1  8bde             mov bx, si                               
  05d3  d1e3             shl bx, 1                                
  05d5  8d46e8           lea ax, [bp - 0x18]                      
  05d8  03d8             add bx, ax                               
  05da  368b07           mov ax, word ptr ss:[bx]                 
  05dd  8b5efc           mov bx, word ptr [bp - 4]                
  05e0  d1e3             shl bx, 1                                
  05e2  8d56d8           lea dx, [bp - 0x28]                      
  05e5  03da             add bx, dx                               
  05e7  368907           mov word ptr ss:[bx], ax                 
  05ea  ff46fc           inc word ptr [bp - 4]                    
  05ed  8bde             mov bx, si                               
  05ef  d1e3             shl bx, 1                                
  05f1  8d46e8           lea ax, [bp - 0x18]                      
  05f4  03d8             add bx, ax                               
  05f6  36c707ffff       mov word ptr ss:[bx], 0xffff             
  05fb  e975ff           jmp 0x573                                
  05fe  33f6             xor si, si                               
  0600  b90800           mov cx, 8                                
  0603  eb0e             jmp 0x613                                
  0605  8bd9             mov bx, cx                               
  0607  d1e3             shl bx, 1                                
  0609  8d46e8           lea ax, [bp - 0x18]                      
  060c  03d8             add bx, ax                               
  060e  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0613  8bc1             mov ax, cx                               
  0615  49               dec cx                                   
  0616  0bc0             or ax, ax                                
  0618  75eb             jne 0x605                                
  061a  33c9             xor cx, cx                               
  061c  eb3c             jmp 0x65a                                
  061e  3b76f8           cmp si, word ptr [bp - 8]                
  0621  7d3c             jge 0x65f                                
  0623  8bd9             mov bx, cx                               
  0625  d1e3             shl bx, 1                                
  0627  8d46d8           lea ax, [bp - 0x28]                      
  062a  03d8             add bx, ax                               
  062c  36833fff         cmp word ptr ss:[bx], -1                 
  0630  7427             je 0x659                                 
  0632  8bd9             mov bx, cx                               
  0634  d1e3             shl bx, 1                                
  0636  8d46d8           lea ax, [bp - 0x28]                      
  0639  03d8             add bx, ax                               
  063b  368b07           mov ax, word ptr ss:[bx]                 
  063e  8bde             mov bx, si                               
  0640  d1e3             shl bx, 1                                
  0642  8d56e8           lea dx, [bp - 0x18]                      
  0645  03da             add bx, dx                               
  0647  368907           mov word ptr ss:[bx], ax                 
  064a  46               inc si                                   
  064b  8bd9             mov bx, cx                               
  064d  d1e3             shl bx, 1                                
  064f  8d46d8           lea ax, [bp - 0x28]                      
  0652  03d8             add bx, ax                               
  0654  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0659  41               inc cx                                   
  065a  83f908           cmp cx, 8                                
  065d  7cbf             jl 0x61e                                 
  065f  0bf6             or si, si                                
  0661  745d             je 0x6c0                                 
  0663  0bff             or di, di                                
  0665  753c             jne 0x6a3                                
  0667  b8042c           mov ax, 0x2c04                           
  066a  8ec0             mov es, ax                               
  066c  26833e240100     cmp word ptr es:[0x124], 0               
  0672  742f             je 0x6a3                                 
  0674  6aff             push -1                                  
  0676  8b5e06           mov bx, word ptr [bp + 6]                
  0679  6bdb41           imul bx, bx, 0x41                        
  067c  b8042c           mov ax, 0x2c04                           
  067f  8ec0             mov es, ax                               
  0681  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0686  8b5e06           mov bx, word ptr [bp + 6]                
  0689  6bdb41           imul bx, bx, 0x41                        
  068c  b8042c           mov ax, 0x2c04                           
  068f  8ec0             mov es, ax                               
  0691  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0696  90               nop                                      
  0697  0e               push cs                                  
  0698  e8a303           call 0xa3e                               
  069b  83c406           add sp, 6                                
  069e  3d0f00           cmp ax, 0xf                              
  06a1  7c1d             jl 0x6c0                                 
  06a3  16               push ss                                  
  06a4  8d46fa           lea ax, [bp - 6]                         
  06a7  50               push ax                                  
  06a8  16               push ss                                  
  06a9  8d46e8           lea ax, [bp - 0x18]                      
  06ac  50               push ax                                  
  06ad  66ff7608         push dword ptr [bp + 8]                  
  06b1  56               push si                                  
  06b2  ff7606           push word ptr [bp + 6]                   
  06b5  90               nop                                      
  06b6  0e               push cs                                  
  06b7  e80d00           call 0x6c7                               
  06ba  83c410           add sp, 0x10                             
  06bd  e93eff           jmp 0x5fe                                
  06c0  8b46fa           mov ax, word ptr [bp - 6]                
  06c3  5f               pop di                                   
  06c4  5e               pop si                                   
  06c5  c9               leave                                    
  06c6  cb               retf                                     

ovl20_06c7:  ; ENTRY
  06c7  55               push bp                                  
  06c8  8bec             mov bp, sp                               
  06ca  83ec16           sub sp, 0x16                             
  06cd  56               push si                                  
  06ce  57               push di                                  
  06cf  c746f86400       mov word ptr [bp - 8], 0x64              
  06d4  8b4606           mov ax, word ptr [bp + 6]                
  06d7  8946f6           mov word ptr [bp - 0xa], ax              
  06da  be0800           mov si, 8                                
  06dd  eb43             jmp 0x722                                
  06df  8bc6             mov ax, si                               
  06e1  d1e0             shl ax, 1                                
  06e3  c45e0e           les bx, ptr [bp + 0xe]                   
  06e6  03d8             add bx, ax                               
  06e8  26833fff         cmp word ptr es:[bx], -1                 
  06ec  7434             je 0x722                                 
  06ee  8bc6             mov ax, si                               
  06f0  d1e0             shl ax, 1                                
  06f2  c45e0e           les bx, ptr [bp + 0xe]                   
  06f5  03d8             add bx, ax                               
  06f7  268b1f           mov bx, word ptr es:[bx]                 
  06fa  6bdb16           imul bx, bx, 0x16                        
  06fd  b81d1e           mov ax, 0x1e1d                           
  0700  8ec0             mov es, ax                               
  0702  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0707  98               cwde                                     
  0708  ba042c           mov dx, 0x2c04                           
  070b  8ec2             mov es, dx                               
  070d  263b061001       cmp ax, word ptr es:[0x110]              
  0712  740e             je 0x722                                 
  0714  8bc6             mov ax, si                               
  0716  d1e0             shl ax, 1                                
  0718  c45e0e           les bx, ptr [bp + 0xe]                   
  071b  03d8             add bx, ax                               
  071d  26c707ffff       mov word ptr es:[bx], 0xffff             
  0722  8bc6             mov ax, si                               
  0724  4e               dec si                                   
  0725  0bc0             or ax, ax                                
  0727  75b6             jne 0x6df                                
  0729  b8042c           mov ax, 0x2c04                           
  072c  8ec0             mov es, ax                               
  072e  26833e1a0100     cmp word ptr es:[0x11a], 0               
  0734  740c             je 0x742                                 
  0736  66ff760e         push dword ptr [bp + 0xe]                
  073a  9a5c00f72f       lcall 0x2ff7, 0x5c                       -> ovl29:14d3
  073f  83c404           add sp, 4                                
  0742  bfffff           mov di, 0xffff                           
  0745  c746fee803       mov word ptr [bp - 2], 0x3e8             
  074a  16               push ss                                  
  074b  8d46ea           lea ax, [bp - 0x16]                      
  074e  50               push ax                                  
  074f  16               push ss                                  
  0750  8d46f0           lea ax, [bp - 0x10]                      
  0753  50               push ax                                  
  0754  ff76f6           push word ptr [bp - 0xa]                 
  0757  0e               push cs                                  
  0758  e89bfa           call 0x1f6                               
  075b  83c40a           add sp, 0xa                              
  075e  0bc0             or ax, ax                                
  0760  7503             jne 0x765                                
  0762  e9cc01           jmp 0x931                                
  0765  be0600           mov si, 6                                
  0768  e9d300           jmp 0x83e                                
  076b  8a42f0           mov al, byte ptr [bp + si - 0x10]        
  076e  b400             mov ah, 0                                
  0770  8946fc           mov word ptr [bp - 4], ax                
  0773  3dff00           cmp ax, 0xff                             
  0776  7503             jne 0x77b                                
  0778  e9c300           jmp 0x83e                                
  077b  c41eee40         les bx, ptr [0x40ee]                     
  077f  035efc           add bx, word ptr [bp - 4]                
  0782  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0788  7403             je 0x78d                                 
  078a  e9b100           jmp 0x83e                                
  078d  c45e12           les bx, ptr [bp + 0x12]                  
  0790  26c7070000       mov word ptr es:[bx], 0                  
  0795  c45e0a           les bx, ptr [bp + 0xa]                   
  0798  035efc           add bx, word ptr [bp - 4]                
  079b  26803f03         cmp byte ptr es:[bx], 3                  
  079f  7c03             jl 0x7a4                                 
  07a1  e99a00           jmp 0x83e                                
  07a4  b8042c           mov ax, 0x2c04                           
  07a7  8ec0             mov es, ax                               
  07a9  26833e1a0100     cmp word ptr es:[0x11a], 0               
  07af  742b             je 0x7dc                                 
  07b1  8b5efc           mov bx, word ptr [bp - 4]                
  07b4  6bdb41           imul bx, bx, 0x41                        
  07b7  b8042c           mov ax, 0x2c04                           
  07ba  8ec0             mov es, ax                               
  07bc  26ffb77f15       push word ptr es:[bx + 0x157f]           
  07c1  8b5efc           mov bx, word ptr [bp - 4]                
  07c4  6bdb41           imul bx, bx, 0x41                        
  07c7  b8042c           mov ax, 0x2c04                           
  07ca  8ec0             mov es, ax                               
  07cc  26ffb77d15       push word ptr es:[bx + 0x157d]           
  07d1  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  07d6  83c404           add sp, 4                                
  07d9  8946f8           mov word ptr [bp - 8], ax                
  07dc  837ef84b         cmp word ptr [bp - 8], 0x4b              
  07e0  7c5c             jl 0x83e                                 
  07e2  666a0a           push 0xa                                 
  07e5  6a01             push 1                                   
  07e7  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  07ec  83c406           add sp, 6                                
  07ef  8a52ea           mov dl, byte ptr [bp + si - 0x16]        
  07f2  b600             mov dh, 0                                
  07f4  03c2             add ax, dx                               
  07f6  c45e0a           les bx, ptr [bp + 0xa]                   
  07f9  035efc           add bx, word ptr [bp - 4]                
  07fc  50               push ax                                  
  07fd  268a07           mov al, byte ptr es:[bx]                 
  0800  98               cwde                                     
  0801  6bc00a           imul ax, ax, 0xa                         
  0804  59               pop cx                                   
  0805  03c8             add cx, ax                               
  0807  807aea28         cmp byte ptr [bp + si - 0x16], 0x28      
  080b  7605             jbe 0x812                                
  080d  b80a00           mov ax, 0xa                              
  0810  eb02             jmp 0x814                                
  0812  33c0             xor ax, ax                               
  0814  03c8             add cx, ax                               
  0816  807aea32         cmp byte ptr [bp + si - 0x16], 0x32      
  081a  7605             jbe 0x821                                
  081c  b81e00           mov ax, 0x1e                             
  081f  eb02             jmp 0x823                                
  0821  33c0             xor ax, ax                               
  0823  03c8             add cx, ax                               
  0825  b86400           mov ax, 0x64                             
  0828  2b46f8           sub ax, word ptr [bp - 8]                
  082b  03c8             add cx, ax                               
  082d  3b4efe           cmp cx, word ptr [bp - 2]                
  0830  7d0c             jge 0x83e                                
  0832  894efe           mov word ptr [bp - 2], cx                
  0835  8b7efc           mov di, word ptr [bp - 4]                
  0838  8b46f8           mov ax, word ptr [bp - 8]                
  083b  8946fa           mov word ptr [bp - 6], ax                
  083e  8bc6             mov ax, si                               
  0840  4e               dec si                                   
  0841  0bc0             or ax, ax                                
  0843  7403             je 0x848                                 
  0845  e923ff           jmp 0x76b                                
  0848  83ffff           cmp di, -1                               
  084b  753d             jne 0x88a                                
  084d  b8042c           mov ax, 0x2c04                           
  0850  8ec0             mov es, ax                               
  0852  26833e240100     cmp word ptr es:[0x124], 0               
  0858  7503             jne 0x85d                                
  085a  e9d400           jmp 0x931                                
  085d  a1c040           mov ax, word ptr [0x40c0]                
  0860  3b4606           cmp ax, word ptr [bp + 6]                
  0863  7403             je 0x868                                 
  0865  e9c900           jmp 0x931                                
  0868  833ec607ff       cmp word ptr [0x7c6], -1                 
  086d  7503             jne 0x872                                
  086f  e9bf00           jmp 0x931                                
  0872  688000           push 0x80                                
  0875  ff36c607         push word ptr [0x7c6]                    
  0879  6a01             push 1                                   
  087b  66ff760e         push dword ptr [bp + 0xe]                
  087f  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0884  83c40a           add sp, 0xa                              
  0887  e9a700           jmp 0x931                                
  088a  c45e0a           les bx, ptr [bp + 0xa]                   
  088d  03df             add bx, di                               
  088f  268a07           mov al, byte ptr es:[bx]                 
  0892  024608           add al, byte ptr [bp + 8]                
  0895  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0898  03df             add bx, di                               
  089a  268807           mov byte ptr es:[bx], al                 
  089d  8b46fa           mov ax, word ptr [bp - 6]                
  08a0  8946fa           mov word ptr [bp - 6], ax                
  08a3  893ec607         mov word ptr [0x7c6], di                 
  08a7  8b4606           mov ax, word ptr [bp + 6]                
  08aa  a3c040           mov word ptr [0x40c0], ax                
  08ad  688000           push 0x80                                
  08b0  57               push di                                  
  08b1  6a01             push 1                                   
  08b3  66ff760e         push dword ptr [bp + 0xe]                
  08b7  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  08bc  83c40a           add sp, 0xa                              
  08bf  6a00             push 0                                   
  08c1  c41e625e         les bx, ptr [0x5e62]                     
  08c5  26ff7714         push word ptr es:[bx + 0x14]             
  08c9  26ff7712         push word ptr es:[bx + 0x12]             
  08cd  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  08d2  83c406           add sp, 6                                
  08d5  8bdf             mov bx, di                               
  08d7  6bdb41           imul bx, bx, 0x41                        
  08da  b8042c           mov ax, 0x2c04                           
  08dd  8ec0             mov es, ax                               
  08df  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  08e4  98               cwde                                     
  08e5  ba042c           mov dx, 0x2c04                           
  08e8  8ec2             mov es, dx                               
  08ea  263b061001       cmp ax, word ptr es:[0x110]              
  08ef  7540             jne 0x931                                
  08f1  c41eee40         les bx, ptr [0x40ee]                     
  08f5  26837f4800       cmp word ptr es:[bx + 0x48], 0           
  08fa  7535             jne 0x931                                
  08fc  897ef6           mov word ptr [bp - 0xa], di              
  08ff  6aff             push -1                                  
  0901  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0904  6bdb41           imul bx, bx, 0x41                        
  0907  b8042c           mov ax, 0x2c04                           
  090a  8ec0             mov es, ax                               
  090c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0911  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0914  6bdb41           imul bx, bx, 0x41                        
  0917  b8042c           mov ax, 0x2c04                           
  091a  8ec0             mov es, ax                               
  091c  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0921  90               nop                                      
  0922  0e               push cs                                  
  0923  e81801           call 0xa3e                               
  0926  83c406           add sp, 6                                
  0929  3d0a00           cmp ax, 0xa                              
  092c  7c03             jl 0x931                                 
  092e  e9a9fd           jmp 0x6da                                
  0931  5f               pop di                                   
  0932  5e               pop si                                   
  0933  c9               leave                                    
  0934  cb               retf                                     

ovl20_0935:  ; ENTRY
  0935  55               push bp                                  
  0936  8bec             mov bp, sp                               
  0938  83ec0c           sub sp, 0xc                              
  093b  56               push si                                  
  093c  16               push ss                                  
  093d  8d46f4           lea ax, [bp - 0xc]                       
  0940  50               push ax                                  
  0941  16               push ss                                  
  0942  8d46fa           lea ax, [bp - 6]                         
  0945  50               push ax                                  
  0946  ff7606           push word ptr [bp + 6]                   
  0949  0e               push cs                                  
  094a  e8a9f8           call 0x1f6                               
  094d  83c40a           add sp, 0xa                              
  0950  0bc0             or ax, ax                                
  0952  7427             je 0x97b                                 
  0954  be0600           mov si, 6                                
  0957  eb1b             jmp 0x974                                
  0959  8a42fa           mov al, byte ptr [bp + si - 6]           
  095c  b400             mov ah, 0                                
  095e  8bd0             mov dx, ax                               
  0960  3dff00           cmp ax, 0xff                             
  0963  740f             je 0x974                                 
  0965  c45e08           les bx, ptr [bp + 8]                     
  0968  03da             add bx, dx                               
  096a  26803f03         cmp byte ptr es:[bx], 3                  
  096e  7d04             jge 0x974                                
  0970  8bc2             mov ax, dx                               
  0972  eb0a             jmp 0x97e                                
  0974  8bc6             mov ax, si                               
  0976  4e               dec si                                   
  0977  0bc0             or ax, ax                                
  0979  75de             jne 0x959                                
  097b  b8ff00           mov ax, 0xff                             
  097e  5e               pop si                                   
  097f  c9               leave                                    
  0980  cb               retf                                     

ovl20_0981:  ; ENTRY
  0981  55               push bp                                  
  0982  8bec             mov bp, sp                               
  0984  83ec02           sub sp, 2                                
  0987  56               push si                                  
  0988  57               push di                                  
  0989  c746fe1027       mov word ptr [bp - 2], 0x2710            
  098e  b8042c           mov ax, 0x2c04                           
  0991  8ec0             mov es, ax                               
  0993  268b3e7b15       mov di, word ptr es:[0x157b]             
  0998  e99200           jmp 0xa2d                                
  099b  8bdf             mov bx, di                               
  099d  6bdb41           imul bx, bx, 0x41                        
  09a0  b8042c           mov ax, 0x2c04                           
  09a3  8ec0             mov es, ax                               
  09a5  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  09aa  69dbe000         imul bx, bx, 0xe0                        
  09ae  8bf7             mov si, di                               
  09b0  6bf641           imul si, si, 0x41                        
  09b3  b8042c           mov ax, 0x2c04                           
  09b6  8ec0             mov es, ax                               
  09b8  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  09bd  d1e0             shl ax, 1                                
  09bf  03d8             add bx, ax                               
  09c1  b81d1e           mov ax, 0x1e1d                           
  09c4  8ec0             mov es, ax                               
  09c6  268a9f0000       mov bl, byte ptr es:[bx]                 
  09cb  81e3ff00         and bx, 0xff                             
  09cf  b8042c           mov ax, 0x2c04                           
  09d2  8ec0             mov es, ax                               
  09d4  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  09da  7551             jne 0xa2d                                
  09dc  837e0aff         cmp word ptr [bp + 0xa], -1              
  09e0  7415             je 0x9f7                                 
  09e2  8bdf             mov bx, di                               
  09e4  6bdb41           imul bx, bx, 0x41                        
  09e7  b8042c           mov ax, 0x2c04                           
  09ea  8ec0             mov es, ax                               
  09ec  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  09f1  98               cwde                                     
  09f2  3b460a           cmp ax, word ptr [bp + 0xa]              
  09f5  7536             jne 0xa2d                                
  09f7  8bdf             mov bx, di                               
  09f9  6bdb41           imul bx, bx, 0x41                        
  09fc  b8042c           mov ax, 0x2c04                           
  09ff  8ec0             mov es, ax                               
  0a01  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0a06  8bdf             mov bx, di                               
  0a08  6bdb41           imul bx, bx, 0x41                        
  0a0b  b8042c           mov ax, 0x2c04                           
  0a0e  8ec0             mov es, ax                               
  0a10  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0a15  ff7608           push word ptr [bp + 8]                   
  0a18  ff7606           push word ptr [bp + 6]                   
  0a1b  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0a20  83c408           add sp, 8                                
  0a23  8bd0             mov dx, ax                               
  0a25  3b56fe           cmp dx, word ptr [bp - 2]                
  0a28  7d03             jge 0xa2d                                
  0a2a  8956fe           mov word ptr [bp - 2], dx                
  0a2d  8bc7             mov ax, di                               
  0a2f  4f               dec di                                   
  0a30  0bc0             or ax, ax                                
  0a32  7403             je 0xa37                                 
  0a34  e964ff           jmp 0x99b                                
  0a37  8b46fe           mov ax, word ptr [bp - 2]                
  0a3a  5f               pop di                                   
  0a3b  5e               pop si                                   
  0a3c  c9               leave                                    
  0a3d  cb               retf                                     

ovl20_0a3e:  ; ENTRY
  0a3e  55               push bp                                  
  0a3f  8bec             mov bp, sp                               
  0a41  83ec04           sub sp, 4                                
  0a44  56               push si                                  
  0a45  57               push di                                  
  0a46  bfe803           mov di, 0x3e8                            
  0a49  b8042c           mov ax, 0x2c04                           
  0a4c  8ec0             mov es, ax                               
  0a4e  268b368101       mov si, word ptr es:[0x181]              
  0a53  e9b300           jmp 0xb09                                
  0a56  8bde             mov bx, si                               
  0a58  6bdb16           imul bx, bx, 0x16                        
  0a5b  b81d1e           mov ax, 0x1e1d                           
  0a5e  8ec0             mov es, ax                               
  0a60  2680bf85880f     cmp byte ptr es:[bx - 0x777b], 0xf       
  0a66  7503             jne 0xa6b                                
  0a68  e99e00           jmp 0xb09                                
  0a6b  8bde             mov bx, si                               
  0a6d  6bdb16           imul bx, bx, 0x16                        
  0a70  b81d1e           mov ax, 0x1e1d                           
  0a73  ba0000           mov dx, 0                                
  0a76  81c28088         add dx, 0x8880                           
  0a7a  03da             add bx, dx                               
  0a7c  8ec0             mov es, ax                               
  0a7e  268b07           mov ax, word ptr es:[bx]                 
  0a81  8946fe           mov word ptr [bp - 2], ax                
  0a84  8bde             mov bx, si                               
  0a86  6bdb16           imul bx, bx, 0x16                        
  0a89  b81d1e           mov ax, 0x1e1d                           
  0a8c  8ec0             mov es, ax                               
  0a8e  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0a93  8946fc           mov word ptr [bp - 4], ax                
  0a96  837e0aff         cmp word ptr [bp + 0xa], -1              
  0a9a  751d             jne 0xab9                                
  0a9c  8bde             mov bx, si                               
  0a9e  6bdb16           imul bx, bx, 0x16                        
  0aa1  b81d1e           mov ax, 0x1e1d                           
  0aa4  8ec0             mov es, ax                               
  0aa6  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0aab  ba042c           mov dx, 0x2c04                           
  0aae  8ec2             mov es, dx                               
  0ab0  263a061001       cmp al, byte ptr es:[0x110]              
  0ab5  7517             jne 0xace                                
  0ab7  eb50             jmp 0xb09                                
  0ab9  8bde             mov bx, si                               
  0abb  6bdb16           imul bx, bx, 0x16                        
  0abe  b81d1e           mov ax, 0x1e1d                           
  0ac1  8ec0             mov es, ax                               
  0ac3  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0ac8  98               cwde                                     
  0ac9  3b460a           cmp ax, word ptr [bp + 0xa]              
  0acc  753b             jne 0xb09                                
  0ace  b8042c           mov ax, 0x2c04                           
  0ad1  8ec0             mov es, ax                               
  0ad3  26833e240100     cmp word ptr es:[0x124], 0               
  0ad9  7412             je 0xaed                                 
  0adb  ff76fc           push word ptr [bp - 4]                   
  0ade  ff76fe           push word ptr [bp - 2]                   
  0ae1  9a7000f72f       lcall 0x2ff7, 0x70                       -> ovl29:16ae
  0ae6  83c404           add sp, 4                                
  0ae9  0bc0             or ax, ax                                
  0aeb  741c             je 0xb09                                 
  0aed  ff76fc           push word ptr [bp - 4]                   
  0af0  ff76fe           push word ptr [bp - 2]                   
  0af3  ff7608           push word ptr [bp + 8]                   
  0af6  ff7606           push word ptr [bp + 6]                   
  0af9  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0afe  83c408           add sp, 8                                
  0b01  8bd0             mov dx, ax                               
  0b03  3bd7             cmp dx, di                               
  0b05  7d02             jge 0xb09                                
  0b07  8bfa             mov di, dx                               
  0b09  8bc6             mov ax, si                               
  0b0b  4e               dec si                                   
  0b0c  0bc0             or ax, ax                                
  0b0e  7403             je 0xb13                                 
  0b10  e943ff           jmp 0xa56                                
  0b13  8bc7             mov ax, di                               
  0b15  5f               pop di                                   
  0b16  5e               pop si                                   
  0b17  c9               leave                                    
  0b18  cb               retf                                     

ovl20_0b19:  ; ENTRY
  0b19  55               push bp                                  
  0b1a  8bec             mov bp, sp                               
  0b1c  83ec2c           sub sp, 0x2c                             
  0b1f  56               push si                                  
  0b20  57               push di                                  
  0b21  c746fc0000       mov word ptr [bp - 4], 0                 
  0b26  8b5e06           mov bx, word ptr [bp + 6]                
  0b29  6bdb41           imul bx, bx, 0x41                        
  0b2c  b8042c           mov ax, 0x2c04                           
  0b2f  8ec0             mov es, ax                               
  0b31  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0b36  8946f8           mov word ptr [bp - 8], ax                
  0b39  8b5e06           mov bx, word ptr [bp + 6]                
  0b3c  6bdb41           imul bx, bx, 0x41                        
  0b3f  b8042c           mov ax, 0x2c04                           
  0b42  8ec0             mov es, ax                               
  0b44  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0b49  8946f6           mov word ptr [bp - 0xa], ax              
  0b4c  6aff             push -1                                  
  0b4e  50               push ax                                  
  0b4f  ff76f8           push word ptr [bp - 8]                   
  0b52  0e               push cs                                  
  0b53  e8e8fe           call 0xa3e                               
  0b56  83c406           add sp, 6                                
  0b59  8bd0             mov dx, ax                               
  0b5b  c746f40000       mov word ptr [bp - 0xc], 0               
  0b60  b90400           mov cx, 4                                
  0b63  eb18             jmp 0xb7d                                
  0b65  8bc1             mov ax, cx                               
  0b67  6bc05c           imul ax, ax, 0x5c                        
  0b6a  c41eee40         les bx, ptr [0x40ee]                     
  0b6e  03d8             add bx, ax                               
  0b70  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0b76  7405             je 0xb7d                                 
  0b78  c746f40100       mov word ptr [bp - 0xc], 1               
  0b7d  8bc1             mov ax, cx                               
  0b7f  49               dec cx                                   
  0b80  0bc0             or ax, ax                                
  0b82  75e1             jne 0xb65                                
  0b84  83fa0f           cmp dx, 0xf                              
  0b87  7d05             jge 0xb8e                                
  0b89  b80100           mov ax, 1                                
  0b8c  eb02             jmp 0xb90                                
  0b8e  33c0             xor ax, ax                               
  0b90  8bf8             mov di, ax                               
  0b92  83fa05           cmp dx, 5                                
  0b95  7d05             jge 0xb9c                                
  0b97  b80200           mov ax, 2                                
  0b9a  eb02             jmp 0xb9e                                
  0b9c  33c0             xor ax, ax                               
  0b9e  03f8             add di, ax                               
  0ba0  c41eee40         les bx, ptr [0x40ee]                     
  0ba4  26837f4800       cmp word ptr es:[bx + 0x48], 0           
  0ba9  7401             je 0xbac                                 
  0bab  47               inc di                                   
  0bac  33d2             xor dx, dx                               
  0bae  b90800           mov cx, 8                                
  0bb1  eb0f             jmp 0xbc2                                
  0bb3  8bc1             mov ax, cx                               
  0bb5  d1e0             shl ax, 1                                
  0bb7  c41eee40         les bx, ptr [0x40ee]                     
  0bbb  03d8             add bx, ax                               
  0bbd  2603970c04       add dx, word ptr es:[bx + 0x40c]         
  0bc2  8bc1             mov ax, cx                               
  0bc4  49               dec cx                                   
  0bc5  0bc0             or ax, ax                                
  0bc7  75ea             jne 0xbb3                                
  0bc9  83fa02           cmp dx, 2                                
  0bcc  7e05             jle 0xbd3                                
  0bce  b80200           mov ax, 2                                
  0bd1  eb02             jmp 0xbd5                                
  0bd3  8bc2             mov ax, dx                               
  0bd5  03f8             add di, ax                               
  0bd7  897efe           mov word ptr [bp - 2], di                
  0bda  b90800           mov cx, 8                                
  0bdd  eb1b             jmp 0xbfa                                
  0bdf  8bd9             mov bx, cx                               
  0be1  d1e3             shl bx, 1                                
  0be3  8d46d4           lea ax, [bp - 0x2c]                      
  0be6  03d8             add bx, ax                               
  0be8  b8ffff           mov ax, 0xffff                           
  0beb  368907           mov word ptr ss:[bx], ax                 
  0bee  8bd9             mov bx, cx                               
  0bf0  d1e3             shl bx, 1                                
  0bf2  8d56e4           lea dx, [bp - 0x1c]                      
  0bf5  03da             add bx, dx                               
  0bf7  368907           mov word ptr ss:[bx], ax                 
  0bfa  8bc1             mov ax, cx                               
  0bfc  49               dec cx                                   
  0bfd  0bc0             or ax, ax                                
  0bff  75de             jne 0xbdf                                
  0c01  b8042c           mov ax, 0x2c04                           
  0c04  8ec0             mov es, ax                               
  0c06  268b368101       mov si, word ptr es:[0x181]              
  0c0b  e9ec00           jmp 0xcfa                                
  0c0e  8bde             mov bx, si                               
  0c10  6bdb16           imul bx, bx, 0x16                        
  0c13  b81d1e           mov ax, 0x1e1d                           
  0c16  8ec0             mov es, ax                               
  0c18  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0c1d  ba042c           mov dx, 0x2c04                           
  0c20  8ec2             mov es, dx                               
  0c22  263a061001       cmp al, byte ptr es:[0x110]              
  0c27  7403             je 0xc2c                                 
  0c29  e9ce00           jmp 0xcfa                                
  0c2c  8bde             mov bx, si                               
  0c2e  6bdb16           imul bx, bx, 0x16                        
  0c31  b81d1e           mov ax, 0x1e1d                           
  0c34  8ec0             mov es, ax                               
  0c36  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0c3b  c1e804           shr ax, 4                                
  0c3e  250700           and ax, 7                                
  0c41  0bc0             or ax, ax                                
  0c43  7403             je 0xc48                                 
  0c45  e9b200           jmp 0xcfa                                
  0c48  8bde             mov bx, si                               
  0c4a  6bdb16           imul bx, bx, 0x16                        
  0c4d  b81d1e           mov ax, 0x1e1d                           
  0c50  8ec0             mov es, ax                               
  0c52  26f7878c884000   test word ptr es:[bx - 0x7774], 0x40     
  0c59  7403             je 0xc5e                                 
  0c5b  e99c00           jmp 0xcfa                                
  0c5e  8bde             mov bx, si                               
  0c60  6bdb16           imul bx, bx, 0x16                        
  0c63  b81d1e           mov ax, 0x1e1d                           
  0c66  8ec0             mov es, ax                               
  0c68  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0c6e  7509             jne 0xc79                                
  0c70  837ef400         cmp word ptr [bp - 0xc], 0               
  0c74  7403             je 0xc79                                 
  0c76  e98100           jmp 0xcfa                                
  0c79  8bde             mov bx, si                               
  0c7b  6bdb16           imul bx, bx, 0x16                        
  0c7e  b81d1e           mov ax, 0x1e1d                           
  0c81  8ec0             mov es, ax                               
  0c83  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0c88  250f00           and ax, 0xf                              
  0c8b  0bc0             or ax, ax                                
  0c8d  756b             jne 0xcfa                                
  0c8f  837e0800         cmp word ptr [bp + 8], 0                 
  0c93  741c             je 0xcb1                                 
  0c95  8bde             mov bx, si                               
  0c97  6bdb16           imul bx, bx, 0x16                        
  0c9a  b81d1e           mov ax, 0x1e1d                           
  0c9d  8ec0             mov es, ax                               
  0c9f  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0ca4  98               cwde                                     
  0ca5  6bc006           imul ax, ax, 6                           
  0ca8  8bd8             mov bx, ax                               
  0caa  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0caf  7449             je 0xcfa                                 
  0cb1  8bde             mov bx, si                               
  0cb3  6bdb16           imul bx, bx, 0x16                        
  0cb6  b81d1e           mov ax, 0x1e1d                           
  0cb9  8ec0             mov es, ax                               
  0cbb  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0cc0  3b46f8           cmp ax, word ptr [bp - 8]                
  0cc3  7535             jne 0xcfa                                
  0cc5  8bde             mov bx, si                               
  0cc7  6bdb16           imul bx, bx, 0x16                        
  0cca  b81d1e           mov ax, 0x1e1d                           
  0ccd  8ec0             mov es, ax                               
  0ccf  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0cd4  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0cd7  7521             jne 0xcfa                                
  0cd9  837efe00         cmp word ptr [bp - 2], 0                 
  0cdd  7405             je 0xce4                                 
  0cdf  ff4efe           dec word ptr [bp - 2]                    
  0ce2  eb16             jmp 0xcfa                                
  0ce4  8b5efc           mov bx, word ptr [bp - 4]                
  0ce7  d1e3             shl bx, 1                                
  0ce9  8d46e4           lea ax, [bp - 0x1c]                      
  0cec  03d8             add bx, ax                               
  0cee  368937           mov word ptr ss:[bx], si                 
  0cf1  ff46fc           inc word ptr [bp - 4]                    
  0cf4  837efc08         cmp word ptr [bp - 4], 8                 
  0cf8  7d0a             jge 0xd04                                
  0cfa  8bc6             mov ax, si                               
  0cfc  4e               dec si                                   
  0cfd  0bc0             or ax, ax                                
  0cff  7403             je 0xd04                                 
  0d01  e90aff           jmp 0xc0e                                
  0d04  837efc00         cmp word ptr [bp - 4], 0                 
  0d08  7503             jne 0xd0d                                
  0d0a  e93a01           jmp 0xe47                                
  0d0d  c746fa0000       mov word ptr [bp - 6], 0                 
  0d12  beffff           mov si, 0xffff                           
  0d15  33d2             xor dx, dx                               
  0d17  b90800           mov cx, 8                                
  0d1a  eb48             jmp 0xd64                                
  0d1c  8bd9             mov bx, cx                               
  0d1e  d1e3             shl bx, 1                                
  0d20  8d46e4           lea ax, [bp - 0x1c]                      
  0d23  03d8             add bx, ax                               
  0d25  36833fff         cmp word ptr ss:[bx], -1                 
  0d29  7439             je 0xd64                                 
  0d2b  8bd9             mov bx, cx                               
  0d2d  d1e3             shl bx, 1                                
  0d2f  03d8             add bx, ax                               
  0d31  368b1f           mov bx, word ptr ss:[bx]                 
  0d34  6bdb16           imul bx, bx, 0x16                        
  0d37  b81d1e           mov ax, 0x1e1d                           
  0d3a  8ec0             mov es, ax                               
  0d3c  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0d41  98               cwde                                     
  0d42  3bc2             cmp ax, dx                               
  0d44  7e1e             jle 0xd64                                
  0d46  8bf1             mov si, cx                               
  0d48  8bd9             mov bx, cx                               
  0d4a  d1e3             shl bx, 1                                
  0d4c  8d46e4           lea ax, [bp - 0x1c]                      
  0d4f  03d8             add bx, ax                               
  0d51  368b1f           mov bx, word ptr ss:[bx]                 
  0d54  6bdb16           imul bx, bx, 0x16                        
  0d57  b81d1e           mov ax, 0x1e1d                           
  0d5a  8ec0             mov es, ax                               
  0d5c  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0d61  98               cwde                                     
  0d62  8bd0             mov dx, ax                               
  0d64  8bc1             mov ax, cx                               
  0d66  49               dec cx                                   
  0d67  0bc0             or ax, ax                                
  0d69  75b1             jne 0xd1c                                
  0d6b  83feff           cmp si, -1                               
  0d6e  742d             je 0xd9d                                 
  0d70  8bde             mov bx, si                               
  0d72  d1e3             shl bx, 1                                
  0d74  8d46e4           lea ax, [bp - 0x1c]                      
  0d77  03d8             add bx, ax                               
  0d79  368b07           mov ax, word ptr ss:[bx]                 
  0d7c  8b5efa           mov bx, word ptr [bp - 6]                
  0d7f  d1e3             shl bx, 1                                
  0d81  8d56d4           lea dx, [bp - 0x2c]                      
  0d84  03da             add bx, dx                               
  0d86  368907           mov word ptr ss:[bx], ax                 
  0d89  ff46fa           inc word ptr [bp - 6]                    
  0d8c  8bde             mov bx, si                               
  0d8e  d1e3             shl bx, 1                                
  0d90  8d46e4           lea ax, [bp - 0x1c]                      
  0d93  03d8             add bx, ax                               
  0d95  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0d9a  e975ff           jmp 0xd12                                
  0d9d  b90800           mov cx, 8                                
  0da0  eb0e             jmp 0xdb0                                
  0da2  8bd9             mov bx, cx                               
  0da4  d1e3             shl bx, 1                                
  0da6  8d46e4           lea ax, [bp - 0x1c]                      
  0da9  03d8             add bx, ax                               
  0dab  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0db0  8bc1             mov ax, cx                               
  0db2  49               dec cx                                   
  0db3  0bc0             or ax, ax                                
  0db5  75eb             jne 0xda2                                
  0db7  33c9             xor cx, cx                               
  0db9  eb2f             jmp 0xdea                                
  0dbb  8bd9             mov bx, cx                               
  0dbd  d1e3             shl bx, 1                                
  0dbf  8d46d4           lea ax, [bp - 0x2c]                      
  0dc2  03d8             add bx, ax                               
  0dc4  36833fff         cmp word ptr ss:[bx], -1                 
  0dc8  741f             je 0xde9                                 
  0dca  8bd9             mov bx, cx                               
  0dcc  d1e3             shl bx, 1                                
  0dce  8d46d4           lea ax, [bp - 0x2c]                      
  0dd1  03d8             add bx, ax                               
  0dd3  368b07           mov ax, word ptr ss:[bx]                 
  0dd6  8946e4           mov word ptr [bp - 0x1c], ax             
  0dd9  8bd9             mov bx, cx                               
  0ddb  d1e3             shl bx, 1                                
  0ddd  8d46d4           lea ax, [bp - 0x2c]                      
  0de0  03d8             add bx, ax                               
  0de2  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0de7  eb06             jmp 0xdef                                
  0de9  41               inc cx                                   
  0dea  83f908           cmp cx, 8                                
  0ded  7ccc             jl 0xdbb                                 
  0def  8b76e4           mov si, word ptr [bp - 0x1c]             
  0df2  8bc6             mov ax, si                               
  0df4  3dffff           cmp ax, 0xffff                           
  0df7  744e             je 0xe47                                 
  0df9  0bff             or di, di                                
  0dfb  753b             jne 0xe38                                
  0dfd  b8042c           mov ax, 0x2c04                           
  0e00  8ec0             mov es, ax                               
  0e02  26833e240100     cmp word ptr es:[0x124], 0               
  0e08  742e             je 0xe38                                 
  0e0a  6aff             push -1                                  
  0e0c  8b5e06           mov bx, word ptr [bp + 6]                
  0e0f  6bdb41           imul bx, bx, 0x41                        
  0e12  b8042c           mov ax, 0x2c04                           
  0e15  8ec0             mov es, ax                               
  0e17  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0e1c  8b5e06           mov bx, word ptr [bp + 6]                
  0e1f  6bdb41           imul bx, bx, 0x41                        
  0e22  b8042c           mov ax, 0x2c04                           
  0e25  8ec0             mov es, ax                               
  0e27  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0e2c  0e               push cs                                  
  0e2d  e80efc           call 0xa3e                               
  0e30  83c406           add sp, 6                                
  0e33  3d0f00           cmp ax, 0xf                              
  0e36  7c0f             jl 0xe47                                 
  0e38  ff7606           push word ptr [bp + 6]                   
  0e3b  56               push si                                  
  0e3c  90               nop                                      
  0e3d  0e               push cs                                  
  0e3e  e80a00           call 0xe4b                               
  0e41  83c404           add sp, 4                                
  0e44  e956ff           jmp 0xd9d                                
  0e47  5f               pop di                                   
  0e48  5e               pop si                                   
  0e49  c9               leave                                    
  0e4a  cb               retf                                     

ovl20_0e4b:  ; ENTRY
  0e4b  55               push bp                                  
  0e4c  8bec             mov bp, sp                               
  0e4e  83ec14           sub sp, 0x14                             
  0e51  56               push si                                  
  0e52  57               push di                                  
  0e53  8b7606           mov si, word ptr [bp + 6]                
  0e56  ba0800           mov dx, 8                                
  0e59  eb0e             jmp 0xe69                                
  0e5b  8bda             mov bx, dx                               
  0e5d  d1e3             shl bx, 1                                
  0e5f  8d46ec           lea ax, [bp - 0x14]                      
  0e62  03d8             add bx, ax                               
  0e64  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0e69  8bc2             mov ax, dx                               
  0e6b  4a               dec dx                                   
  0e6c  0bc0             or ax, ax                                
  0e6e  75eb             jne 0xe5b                                
  0e70  8976ec           mov word ptr [bp - 0x14], si             
  0e73  666800002000     push 0x200000                            
  0e79  6a04             push 4                                   
  0e7b  16               push ss                                  
  0e7c  8d46ec           lea ax, [bp - 0x14]                      
  0e7f  50               push ax                                  
  0e80  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0e85  83c40a           add sp, 0xa                              
  0e88  8bde             mov bx, si                               
  0e8a  6bdb16           imul bx, bx, 0x16                        
  0e8d  b81d1e           mov ax, 0x1e1d                           
  0e90  8ec0             mov es, ax                               
  0e92  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  0e97  98               cwde                                     
  0e98  bb0500           mov bx, 5                                
  0e9b  99               cdq                                      
  0e9c  f7fb             idiv bx                                  
  0e9e  40               inc ax                                   
  0e9f  8bf8             mov di, ax                               
  0ea1  e98900           jmp 0xf2d                                
  0ea4  8bde             mov bx, si                               
  0ea6  6bdb16           imul bx, bx, 0x16                        
  0ea9  b81d1e           mov ax, 0x1e1d                           
  0eac  ba0000           mov dx, 0                                
  0eaf  81c28088         add dx, 0x8880                           
  0eb3  03da             add bx, dx                               
  0eb5  8ec0             mov es, ax                               
  0eb7  268b07           mov ax, word ptr es:[bx]                 
  0eba  8946fe           mov word ptr [bp - 2], ax                
  0ebd  8bde             mov bx, si                               
  0ebf  6bdb16           imul bx, bx, 0x16                        
  0ec2  b81d1e           mov ax, 0x1e1d                           
  0ec5  8ec0             mov es, ax                               
  0ec7  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0ecc  8946fc           mov word ptr [bp - 4], ax                
  0ecf  ff7608           push word ptr [bp + 8]                   
  0ed2  56               push si                                  
  0ed3  90               nop                                      
  0ed4  0e               push cs                                  
  0ed5  e86e00           call 0xf46                               
  0ed8  83c404           add sp, 4                                
  0edb  8bde             mov bx, si                               
  0edd  6bdb16           imul bx, bx, 0x16                        
  0ee0  b81d1e           mov ax, 0x1e1d                           
  0ee3  8ec0             mov es, ax                               
  0ee5  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0eea  3b46fe           cmp ax, word ptr [bp - 2]                
  0eed  7514             jne 0xf03                                
  0eef  8bde             mov bx, si                               
  0ef1  6bdb16           imul bx, bx, 0x16                        
  0ef4  b81d1e           mov ax, 0x1e1d                           
  0ef7  8ec0             mov es, ax                               
  0ef9  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0efe  3b46fc           cmp ax, word ptr [bp - 4]                
  0f01  743f             je 0xf42                                 
  0f03  8bde             mov bx, si                               
  0f05  6bdb16           imul bx, bx, 0x16                        
  0f08  b81d1e           mov ax, 0x1e1d                           
  0f0b  8ec0             mov es, ax                               
  0f0d  2680bf878804     cmp byte ptr es:[bx - 0x7779], 4         
  0f13  7c2d             jl 0xf42                                 
  0f15  0bff             or di, di                                
  0f17  7429             je 0xf42                                 
  0f19  8bde             mov bx, si                               
  0f1b  6bdb16           imul bx, bx, 0x16                        
  0f1e  b81d1e           mov ax, 0x1e1d                           
  0f21  8ec0             mov es, ax                               
  0f23  26f7878c882000   test word ptr es:[bx - 0x7774], 0x20     
  0f2a  7416             je 0xf42                                 
  0f2c  4f               dec di                                   
  0f2d  8bde             mov bx, si                               
  0f2f  6bdb16           imul bx, bx, 0x16                        
  0f32  b81d1e           mov ax, 0x1e1d                           
  0f35  8ec0             mov es, ax                               
  0f37  2680bf878802     cmp byte ptr es:[bx - 0x7779], 2         
  0f3d  7c03             jl 0xf42                                 
  0f3f  e962ff           jmp 0xea4                                
  0f42  5f               pop di                                   
  0f43  5e               pop si                                   
  0f44  c9               leave                                    
  0f45  cb               retf                                     

ovl20_0f46:  ; ENTRY
  0f46  55               push bp                                  
  0f47  8bec             mov bp, sp                               
  0f49  83ec6e           sub sp, 0x6e                             
  0f4c  56               push si                                  
  0f4d  57               push di                                  
  0f4e  8b7606           mov si, word ptr [bp + 6]                
  0f51  16               push ss                                  
  0f52  8d46f6           lea ax, [bp - 0xa]                       
  0f55  50               push ax                                  
  0f56  16               push ss                                  
  0f57  8d46f8           lea ax, [bp - 8]                         
  0f5a  50               push ax                                  
  0f5b  16               push ss                                  
  0f5c  8d46fa           lea ax, [bp - 6]                         
  0f5f  50               push ax                                  
  0f60  16               push ss                                  
  0f61  8d46fc           lea ax, [bp - 4]                         
  0f64  50               push ax                                  
  0f65  16               push ss                                  
  0f66  8d46fe           lea ax, [bp - 2]                         
  0f69  50               push ax                                  
  0f6a  56               push si                                  
  0f6b  90               nop                                      
  0f6c  0e               push cs                                  
  0f6d  e80f08           call 0x177f                              
  0f70  83c416           add sp, 0x16                             
  0f73  0bc0             or ax, ax                                
  0f75  7450             je 0xfc7                                 
  0f77  837efa00         cmp word ptr [bp - 6], 0                 
  0f7b  7438             je 0xfb5                                 
  0f7d  837efa01         cmp word ptr [bp - 6], 1                 
  0f81  7513             jne 0xf96                                
  0f83  ff76f6           push word ptr [bp - 0xa]                 
  0f86  ff76f8           push word ptr [bp - 8]                   
  0f89  56               push si                                  
  0f8a  90               nop                                      
  0f8b  0e               push cs                                  
  0f8c  e81901           call 0x10a8                              
  0f8f  83c406           add sp, 6                                
  0f92  0bc0             or ax, ax                                
  0f94  741f             je 0xfb5                                 
  0f96  837efa02         cmp word ptr [bp - 6], 2                 
  0f9a  7403             je 0xf9f                                 
  0f9c  e90501           jmp 0x10a4                               
  0f9f  ff76f6           push word ptr [bp - 0xa]                 
  0fa2  ff76f8           push word ptr [bp - 8]                   
  0fa5  56               push si                                  
  0fa6  90               nop                                      
  0fa7  0e               push cs                                  
  0fa8  e84003           call 0x12eb                              
  0fab  83c406           add sp, 6                                
  0fae  0bc0             or ax, ax                                
  0fb0  7403             je 0xfb5                                 
  0fb2  e9ef00           jmp 0x10a4                               
  0fb5  ff76fc           push word ptr [bp - 4]                   
  0fb8  ff76fe           push word ptr [bp - 2]                   
  0fbb  56               push si                                  
  0fbc  90               nop                                      
  0fbd  0e               push cs                                  
  0fbe  e8c005           call 0x1581                              
  0fc1  83c406           add sp, 6                                
  0fc4  e9dd00           jmp 0x10a4                               
  0fc7  8bde             mov bx, si                               
  0fc9  6bdb16           imul bx, bx, 0x16                        
  0fcc  b81d1e           mov ax, 0x1e1d                           
  0fcf  8ec0             mov es, ax                               
  0fd1  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0fd6  98               cwde                                     
  0fd7  6bc006           imul ax, ax, 6                           
  0fda  8bd8             mov bx, ax                               
  0fdc  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0fe1  7417             je 0xffa                                 
  0fe3  16               push ss                                  
  0fe4  8d46fc           lea ax, [bp - 4]                         
  0fe7  50               push ax                                  
  0fe8  16               push ss                                  
  0fe9  8d46fe           lea ax, [bp - 2]                         
  0fec  50               push ax                                  
  0fed  56               push si                                  
  0fee  90               nop                                      
  0fef  0e               push cs                                  
  0ff0  e85b06           call 0x164e                              
  0ff3  83c40a           add sp, 0xa                              
  0ff6  0bc0             or ax, ax                                
  0ff8  75bb             jne 0xfb5                                
  0ffa  bf6400           mov di, 0x64                             
  0ffd  eb04             jmp 0x1003                               
  0fff  c6439200         mov byte ptr [bp + di - 0x6e], 0         
  1003  8bc7             mov ax, di                               
  1005  4f               dec di                                   
  1006  0bc0             or ax, ax                                
  1008  75f5             jne 0xfff                                
  100a  837e08ff         cmp word ptr [bp + 8], -1                
  100e  7437             je 0x1047                                
  1010  16               push ss                                  
  1011  8d4692           lea ax, [bp - 0x6e]                      
  1014  50               push ax                                  
  1015  ff7608           push word ptr [bp + 8]                   
  1018  0e               push cs                                  
  1019  e819f9           call 0x935                               
  101c  83c406           add sp, 6                                
  101f  8bd0             mov dx, ax                               
  1021  3dff00           cmp ax, 0xff                             
  1024  7421             je 0x1047                                
  1026  8bda             mov bx, dx                               
  1028  6bdb41           imul bx, bx, 0x41                        
  102b  b8042c           mov ax, 0x2c04                           
  102e  8ec0             mov es, ax                               
  1030  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1035  8bda             mov bx, dx                               
  1037  6bdb41           imul bx, bx, 0x41                        
  103a  b8042c           mov ax, 0x2c04                           
  103d  8ec0             mov es, ax                               
  103f  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1044  e974ff           jmp 0xfbb                                
  1047  8bde             mov bx, si                               
  1049  6bdb16           imul bx, bx, 0x16                        
  104c  b81d1e           mov ax, 0x1e1d                           
  104f  8ec0             mov es, ax                               
  1051  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  1057  8bde             mov bx, si                               
  1059  6bdb16           imul bx, bx, 0x16                        
  105c  8ec0             mov es, ax                               
  105e  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  1064  8bde             mov bx, si                               
  1066  6bdb16           imul bx, bx, 0x16                        
  1069  8ec0             mov es, ax                               
  106b  2683a78c88df     and word ptr es:[bx - 0x7774], 0xffdf    
  1071  8bde             mov bx, si                               
  1073  6bdb16           imul bx, bx, 0x16                        
  1076  b81d1e           mov ax, 0x1e1d                           
  1079  baffff           mov dx, 0xffff                           
  107c  8ec0             mov es, ax                               
  107e  2689979488       mov word ptr es:[bx - 0x776c], dx        
  1083  8bc2             mov ax, dx                               
  1085  8bde             mov bx, si                               
  1087  6bdb16           imul bx, bx, 0x16                        
  108a  ba1d1e           mov dx, 0x1e1d                           
  108d  8ec2             mov es, dx                               
  108f  2689879288       mov word ptr es:[bx - 0x776e], ax        
  1094  8bde             mov bx, si                               
  1096  6bdb16           imul bx, bx, 0x16                        
  1099  b81d1e           mov ax, 0x1e1d                           
  109c  8ec0             mov es, ax                               
  109e  26c687918800     mov byte ptr es:[bx - 0x776f], 0         
  10a4  5f               pop di                                   
  10a5  5e               pop si                                   
  10a6  c9               leave                                    
  10a7  cb               retf                                     

ovl20_10a8:  ; ENTRY
  10a8  55               push bp                                  
  10a9  8bec             mov bp, sp                               
  10ab  83ec16           sub sp, 0x16                             
  10ae  56               push si                                  
  10af  57               push di                                  
  10b0  c746fcffff       mov word ptr [bp - 4], 0xffff            
  10b5  b8042c           mov ax, 0x2c04                           
  10b8  8ec0             mov es, ax                               
  10ba  268b3e7b15       mov di, word ptr es:[0x157b]             
  10bf  e9d300           jmp 0x1195                               
  10c2  8bdf             mov bx, di                               
  10c4  6bdb41           imul bx, bx, 0x41                        
  10c7  b8042c           mov ax, 0x2c04                           
  10ca  8ec0             mov es, ax                               
  10cc  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  10d1  69dbe000         imul bx, bx, 0xe0                        
  10d5  8bf7             mov si, di                               
  10d7  6bf641           imul si, si, 0x41                        
  10da  b8042c           mov ax, 0x2c04                           
  10dd  8ec0             mov es, ax                               
  10df  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  10e4  d1e0             shl ax, 1                                
  10e6  03d8             add bx, ax                               
  10e8  b81d1e           mov ax, 0x1e1d                           
  10eb  8ec0             mov es, ax                               
  10ed  268a9f0000       mov bl, byte ptr es:[bx]                 
  10f2  81e3ff00         and bx, 0xff                             
  10f6  b8042c           mov ax, 0x2c04                           
  10f9  8ec0             mov es, ax                               
  10fb  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1101  7403             je 0x1106                                
  1103  e98f00           jmp 0x1195                               
  1106  8bdf             mov bx, di                               
  1108  6bdb41           imul bx, bx, 0x41                        
  110b  b8042c           mov ax, 0x2c04                           
  110e  8ec0             mov es, ax                               
  1110  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1115  98               cwde                                     
  1116  ba042c           mov dx, 0x2c04                           
  1119  8ec2             mov es, dx                               
  111b  263b061001       cmp ax, word ptr es:[0x110]              
  1120  7473             je 0x1195                                
  1122  c41eee40         les bx, ptr [0x40ee]                     
  1126  26397f46         cmp word ptr es:[bx + 0x46], di          
  112a  7469             je 0x1195                                
  112c  ff760a           push word ptr [bp + 0xa]                 
  112f  ff7608           push word ptr [bp + 8]                   
  1132  8bdf             mov bx, di                               
  1134  6bdb41           imul bx, bx, 0x41                        
  1137  b8042c           mov ax, 0x2c04                           
  113a  8ec0             mov es, ax                               
  113c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1141  8bdf             mov bx, di                               
  1143  6bdb41           imul bx, bx, 0x41                        
  1146  b8042c           mov ax, 0x2c04                           
  1149  8ec0             mov es, ax                               
  114b  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1150  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1155  83c408           add sp, 8                                
  1158  3d0200           cmp ax, 2                                
  115b  7f38             jg 0x1195                                
  115d  57               push di                                  
  115e  9a2500b12f       lcall 0x2fb1, 0x25                       -> ovl18:0851
  1163  59               pop cx                                   
  1164  8946fa           mov word ptr [bp - 6], ax                
  1167  837efa00         cmp word ptr [bp - 6], 0                 
  116b  7428             je 0x1195                                
  116d  c41eee40         les bx, ptr [0x40ee]                     
  1171  03df             add bx, di                               
  1173  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  1179  7407             je 0x1182                                
  117b  57               push di                                  
  117c  9a3400c52f       lcall 0x2fc5, 0x34                       -> ovl21:0b95
  1181  59               pop cx                                   
  1182  c41eee40         les bx, ptr [0x40ee]                     
  1186  03df             add bx, di                               
  1188  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  118e  7505             jne 0x1195                               
  1190  897efc           mov word ptr [bp - 4], di                
  1193  eb0a             jmp 0x119f                               
  1195  8bc7             mov ax, di                               
  1197  4f               dec di                                   
  1198  0bc0             or ax, ax                                
  119a  7403             je 0x119f                                
  119c  e923ff           jmp 0x10c2                               
  119f  837efcff         cmp word ptr [bp - 4], -1                
  11a3  7505             jne 0x11aa                               
  11a5  33c0             xor ax, ax                               
  11a7  e93d01           jmp 0x12e7                               
  11aa  ba0800           mov dx, 8                                
  11ad  eb0e             jmp 0x11bd                               
  11af  8bda             mov bx, dx                               
  11b1  d1e3             shl bx, 1                                
  11b3  8d46ea           lea ax, [bp - 0x16]                      
  11b6  03d8             add bx, ax                               
  11b8  36c707ffff       mov word ptr ss:[bx], 0xffff             
  11bd  8bc2             mov ax, dx                               
  11bf  4a               dec dx                                   
  11c0  0bc0             or ax, ax                                
  11c2  75eb             jne 0x11af                               
  11c4  8b4606           mov ax, word ptr [bp + 6]                
  11c7  8946ea           mov word ptr [bp - 0x16], ax             
  11ca  666800002000     push 0x200000                            
  11d0  6a04             push 4                                   
  11d2  16               push ss                                  
  11d3  8d46ea           lea ax, [bp - 0x16]                      
  11d6  50               push ax                                  
  11d7  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  11dc  83c40a           add sp, 0xa                              
  11df  8b5efc           mov bx, word ptr [bp - 4]                
  11e2  6bdb41           imul bx, bx, 0x41                        
  11e5  b8042c           mov ax, 0x2c04                           
  11e8  8ec0             mov es, ax                               
  11ea  26ffb77f15       push word ptr es:[bx + 0x157f]           
  11ef  8b5efc           mov bx, word ptr [bp - 4]                
  11f2  6bdb41           imul bx, bx, 0x41                        
  11f5  b8042c           mov ax, 0x2c04                           
  11f8  8ec0             mov es, ax                               
  11fa  26ffb77d15       push word ptr es:[bx + 0x157d]           
  11ff  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  1204  83c404           add sp, 4                                
  1207  8946fe           mov word ptr [bp - 2], ax                
  120a  8b5e06           mov bx, word ptr [bp + 6]                
  120d  6bdb16           imul bx, bx, 0x16                        
  1210  b81d1e           mov ax, 0x1e1d                           
  1213  8ec0             mov es, ax                               
  1215  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  121b  7460             je 0x127d                                
  121d  8b5e06           mov bx, word ptr [bp + 6]                
  1220  6bdb16           imul bx, bx, 0x16                        
  1223  b81d1e           mov ax, 0x1e1d                           
  1226  8ec0             mov es, ax                               
  1228  2680bf888803     cmp byte ptr es:[bx - 0x7778], 3         
  122e  7f4d             jg 0x127d                                
  1230  c41eee40         les bx, ptr [0x40ee]                     
  1234  b8042c           mov ax, 0x2c04                           
  1237  06               push es                                  
  1238  8ec0             mov es, ax                               
  123a  26a17b15         mov ax, word ptr es:[0x157b]             
  123e  b90a00           mov cx, 0xa                              
  1241  99               cdq                                      
  1242  f7f9             idiv cx                                  
  1244  07               pop es                                   
  1245  26394706         cmp word ptr es:[bx + 6], ax             
  1249  7d05             jge 0x1250                               
  124b  ba3200           mov dx, 0x32                             
  124e  eb30             jmp 0x1280                               
  1250  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1255  99               cdq                                      
  1256  2bc2             sub ax, dx                               
  1258  d1f8             sar ax, 1                                
  125a  3d0a00           cmp ax, 0xa                              
  125d  7e05             jle 0x1264                               
  125f  b80a00           mov ax, 0xa                              
  1262  eb0a             jmp 0x126e                               
  1264  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1269  99               cdq                                      
  126a  2bc2             sub ax, dx                               
  126c  d1f8             sar ax, 1                                
  126e  c41eee40         les bx, ptr [0x40ee]                     
  1272  263b4702         cmp ax, word ptr es:[bx + 2]             
  1276  7c05             jl 0x127d                                
  1278  ba2800           mov dx, 0x28                             
  127b  eb03             jmp 0x1280                               
  127d  ba4b00           mov dx, 0x4b                             
  1280  3956fe           cmp word ptr [bp - 2], dx                
  1283  7d03             jge 0x1288                               
  1285  e91dff           jmp 0x11a5                               
  1288  ba0800           mov dx, 8                                
  128b  eb0e             jmp 0x129b                               
  128d  8bda             mov bx, dx                               
  128f  d1e3             shl bx, 1                                
  1291  8d46ea           lea ax, [bp - 0x16]                      
  1294  03d8             add bx, ax                               
  1296  36c707ffff       mov word ptr ss:[bx], 0xffff             
  129b  8bc2             mov ax, dx                               
  129d  4a               dec dx                                   
  129e  0bc0             or ax, ax                                
  12a0  75eb             jne 0x128d                               
  12a2  8b4606           mov ax, word ptr [bp + 6]                
  12a5  8946ea           mov word ptr [bp - 0x16], ax             
  12a8  8b5e06           mov bx, word ptr [bp + 6]                
  12ab  6bdb16           imul bx, bx, 0x16                        
  12ae  b81d1e           mov ax, 0x1e1d                           
  12b1  8ec0             mov es, ax                               
  12b3  2683a78c88df     and word ptr es:[bx - 0x7774], 0xffdf    
  12b9  688000           push 0x80                                
  12bc  ff76fc           push word ptr [bp - 4]                   
  12bf  6a01             push 1                                   
  12c1  16               push ss                                  
  12c2  8d46ea           lea ax, [bp - 0x16]                      
  12c5  50               push ax                                  
  12c6  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  12cb  83c40a           add sp, 0xa                              
  12ce  6a00             push 0                                   
  12d0  c41e625e         les bx, ptr [0x5e62]                     
  12d4  26ff7714         push word ptr es:[bx + 0x14]             
  12d8  26ff7712         push word ptr es:[bx + 0x12]             
  12dc  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  12e1  83c406           add sp, 6                                
  12e4  b80100           mov ax, 1                                
  12e7  5f               pop di                                   
  12e8  5e               pop si                                   
  12e9  c9               leave                                    
  12ea  cb               retf                                     

ovl20_12eb:  ; ENTRY
  12eb  55               push bp                                  
  12ec  8bec             mov bp, sp                               
  12ee  83ec14           sub sp, 0x14                             
  12f1  56               push si                                  
  12f2  57               push di                                  
  12f3  8b7606           mov si, word ptr [bp + 6]                
  12f6  8b7e08           mov di, word ptr [bp + 8]                
  12f9  16               push ss                                  
  12fa  8d46fe           lea ax, [bp - 2]                         
  12fd  50               push ax                                  
  12fe  ff760a           push word ptr [bp + 0xa]                 
  1301  57               push di                                  
  1302  9a2000ef2f       lcall 0x2fef, 0x20                       -> ovl28:056d
  1307  83c408           add sp, 8                                
  130a  8946fc           mov word ptr [bp - 4], ax                
  130d  837efcff         cmp word ptr [bp - 4], -1                
  1311  7413             je 0x1326                                
  1313  8bde             mov bx, si                               
  1315  6bdb16           imul bx, bx, 0x16                        
  1318  b81d1e           mov ax, 0x1e1d                           
  131b  8ec0             mov es, ax                               
  131d  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  1324  7405             je 0x132b                                
  1326  33c0             xor ax, ax                               
  1328  e95202           jmp 0x157d                               
  132b  837efe01         cmp word ptr [bp - 2], 1                 
  132f  751a             jne 0x134b                               
  1331  ff76fc           push word ptr [bp - 4]                   
  1334  9a2a00ef2f       lcall 0x2fef, 0x2a                       -> ovl28:063c
  1339  59               pop cx                                   
  133a  8bde             mov bx, si                               
  133c  6bdb16           imul bx, bx, 0x16                        
  133f  ba1d1e           mov dx, 0x1e1d                           
  1342  8ec2             mov es, dx                               
  1344  2685878c88       test word ptr es:[bx - 0x7774], ax       
  1349  75db             jne 0x1326                               
  134b  8bde             mov bx, si                               
  134d  6bdb16           imul bx, bx, 0x16                        
  1350  b81d1e           mov ax, 0x1e1d                           
  1353  8ec0             mov es, ax                               
  1355  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  135b  7406             je 0x1363                                
  135d  837efe01         cmp word ptr [bp - 2], 1                 
  1361  75c3             jne 0x1326                               
  1363  8b5e0a           mov bx, word ptr [bp + 0xa]              
  1366  69dbe000         imul bx, bx, 0xe0                        
  136a  8bc7             mov ax, di                               
  136c  d1e0             shl ax, 1                                
  136e  03d8             add bx, ax                               
  1370  b81d1e           mov ax, 0x1e1d                           
  1373  8ec0             mov es, ax                               
  1375  268a970100       mov dl, byte ptr es:[bx + 1]             
  137a  83e20f           and dx, 0xf                              
  137d  83fa0f           cmp dx, 0xf                              
  1380  740c             je 0x138e                                
  1382  b8042c           mov ax, 0x2c04                           
  1385  8ec0             mov es, ax                               
  1387  2639161001       cmp word ptr es:[0x110], dx              
  138c  7598             jne 0x1326                               
  138e  b90800           mov cx, 8                                
  1391  eb0e             jmp 0x13a1                               
  1393  8bd9             mov bx, cx                               
  1395  d1e3             shl bx, 1                                
  1397  8d46ec           lea ax, [bp - 0x14]                      
  139a  03d8             add bx, ax                               
  139c  36c707ffff       mov word ptr ss:[bx], 0xffff             
  13a1  8bc1             mov ax, cx                               
  13a3  49               dec cx                                   
  13a4  0bc0             or ax, ax                                
  13a6  75eb             jne 0x1393                               
  13a8  8976ec           mov word ptr [bp - 0x14], si             
  13ab  666a00           push 0                                   
  13ae  6a04             push 4                                   
  13b0  16               push ss                                  
  13b1  8d46ec           lea ax, [bp - 0x14]                      
  13b4  50               push ax                                  
  13b5  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  13ba  83c40a           add sp, 0xa                              
  13bd  c41e625e         les bx, ptr [0x5e62]                     
  13c1  26897f12         mov word ptr es:[bx + 0x12], di          
  13c5  8b460a           mov ax, word ptr [bp + 0xa]              
  13c8  26894714         mov word ptr es:[bx + 0x14], ax          
  13cc  6a00             push 0                                   
  13ce  26ff7714         push word ptr es:[bx + 0x14]             
  13d2  26ff7712         push word ptr es:[bx + 0x12]             
  13d6  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  13db  83c406           add sp, 6                                
  13de  3d0100           cmp ax, 1                                
  13e1  7503             jne 0x13e6                               
  13e3  e940ff           jmp 0x1326                               
  13e6  8bde             mov bx, si                               
  13e8  6bdb16           imul bx, bx, 0x16                        
  13eb  b81d1e           mov ax, 0x1e1d                           
  13ee  8ec0             mov es, ax                               
  13f0  2639bf8088       cmp word ptr es:[bx - 0x7780], di        
  13f5  7514             jne 0x140b                               
  13f7  8bde             mov bx, si                               
  13f9  6bdb16           imul bx, bx, 0x16                        
  13fc  b81d1e           mov ax, 0x1e1d                           
  13ff  8ec0             mov es, ax                               
  1401  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1406  3b460a           cmp ax, word ptr [bp + 0xa]              
  1409  7444             je 0x144f                                
  140b  837efe01         cmp word ptr [bp - 2], 1                 
  140f  752b             jne 0x143c                               
  1411  8bde             mov bx, si                               
  1413  6bdb16           imul bx, bx, 0x16                        
  1416  b81d1e           mov ax, 0x1e1d                           
  1419  8ec0             mov es, ax                               
  141b  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  1422  7418             je 0x143c                                
  1424  ff76fc           push word ptr [bp - 4]                   
  1427  9a2a00ef2f       lcall 0x2fef, 0x2a                       -> ovl28:063c
  142c  59               pop cx                                   
  142d  8bde             mov bx, si                               
  142f  6bdb16           imul bx, bx, 0x16                        
  1432  ba1d1e           mov dx, 0x1e1d                           
  1435  8ec2             mov es, dx                               
  1437  2609878c88       or word ptr es:[bx - 0x7774], ax         
  143c  8bde             mov bx, si                               
  143e  6bdb16           imul bx, bx, 0x16                        
  1441  b81d1e           mov ax, 0x1e1d                           
  1444  8ec0             mov es, ax                               
  1446  26838f8c8840     or word ptr es:[bx - 0x7774], 0x40       
  144c  e9de00           jmp 0x152d                               
  144f  8bc6             mov ax, si                               
  1451  6bc016           imul ax, ax, 0x16                        
  1454  ba0000           mov dx, 0                                
  1457  81c28088         add dx, 0x8880                           
  145b  03c2             add ax, dx                               
  145d  c706645e1d1e     mov word ptr [0x5e64], 0x1e1d            
  1463  a3625e           mov word ptr [0x5e62], ax                
  1466  8bde             mov bx, si                               
  1468  6bdb16           imul bx, bx, 0x16                        
  146b  b81d1e           mov ax, 0x1e1d                           
  146e  8ec0             mov es, ax                               
  1470  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  1476  750e             jne 0x1486                               
  1478  ff76fc           push word ptr [bp - 4]                   
  147b  56               push si                                  
  147c  9a3900cb2f       lcall 0x2fcb, 0x39                       -> ovl22:15c3
  1481  83c404           add sp, 4                                
  1484  eb05             jmp 0x148b                               
  1486  9a20001430       lcall 0x3014, 0x20                       -> ovl34:0000
  148b  837efe05         cmp word ptr [bp - 2], 5                 
  148f  7403             je 0x1494                                
  1491  e99900           jmp 0x152d                               
  1494  b8042c           mov ax, 0x2c04                           
  1497  8ec0             mov es, ax                               
  1499  268b0e8101       mov cx, word ptr es:[0x181]              
  149e  e98200           jmp 0x1523                               
  14a1  8bd9             mov bx, cx                               
  14a3  6bdb16           imul bx, bx, 0x16                        
  14a6  b81d1e           mov ax, 0x1e1d                           
  14a9  8ec0             mov es, ax                               
  14ab  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  14b0  ba042c           mov dx, 0x2c04                           
  14b3  8ec2             mov es, dx                               
  14b5  263a061001       cmp al, byte ptr es:[0x110]              
  14ba  7567             jne 0x1523                               
  14bc  8bd9             mov bx, cx                               
  14be  6bdb16           imul bx, bx, 0x16                        
  14c1  b81d1e           mov ax, 0x1e1d                           
  14c4  8ec0             mov es, ax                               
  14c6  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  14cb  250f00           and ax, 0xf                              
  14ce  0bc0             or ax, ax                                
  14d0  7551             jne 0x1523                               
  14d2  8bd9             mov bx, cx                               
  14d4  6bdb16           imul bx, bx, 0x16                        
  14d7  b81d1e           mov ax, 0x1e1d                           
  14da  8ec0             mov es, ax                               
  14dc  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  14e1  98               cwde                                     
  14e2  6bc006           imul ax, ax, 6                           
  14e5  8bd8             mov bx, ax                               
  14e7  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  14ec  7435             je 0x1523                                
  14ee  8bd9             mov bx, cx                               
  14f0  6bdb16           imul bx, bx, 0x16                        
  14f3  b81d1e           mov ax, 0x1e1d                           
  14f6  8ec0             mov es, ax                               
  14f8  2639bf8088       cmp word ptr es:[bx - 0x7780], di        
  14fd  7524             jne 0x1523                               
  14ff  8bd9             mov bx, cx                               
  1501  6bdb16           imul bx, bx, 0x16                        
  1504  b81d1e           mov ax, 0x1e1d                           
  1507  8ec0             mov es, ax                               
  1509  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  150e  3b460a           cmp ax, word ptr [bp + 0xa]              
  1511  7510             jne 0x1523                               
  1513  8bd9             mov bx, cx                               
  1515  6bdb16           imul bx, bx, 0x16                        
  1518  b81d1e           mov ax, 0x1e1d                           
  151b  8ec0             mov es, ax                               
  151d  26838f8c8820     or word ptr es:[bx - 0x7774], 0x20       
  1523  8bc1             mov ax, cx                               
  1525  49               dec cx                                   
  1526  0bc0             or ax, ax                                
  1528  7403             je 0x152d                                
  152a  e974ff           jmp 0x14a1                               
  152d  8bde             mov bx, si                               
  152f  6bdb16           imul bx, bx, 0x16                        
  1532  b81d1e           mov ax, 0x1e1d                           
  1535  8ec0             mov es, ax                               
  1537  26838f8c8820     or word ptr es:[bx - 0x7774], 0x20       
  153d  8bde             mov bx, si                               
  153f  6bdb16           imul bx, bx, 0x16                        
  1542  8ec0             mov es, ax                               
  1544  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  154a  8bde             mov bx, si                               
  154c  6bdb16           imul bx, bx, 0x16                        
  154f  8ec0             mov es, ax                               
  1551  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  1557  8bde             mov bx, si                               
  1559  6bdb16           imul bx, bx, 0x16                        
  155c  b81d1e           mov ax, 0x1e1d                           
  155f  baffff           mov dx, 0xffff                           
  1562  8ec0             mov es, ax                               
  1564  2689979488       mov word ptr es:[bx - 0x776c], dx        
  1569  8bc2             mov ax, dx                               
  156b  8bde             mov bx, si                               
  156d  6bdb16           imul bx, bx, 0x16                        
  1570  ba1d1e           mov dx, 0x1e1d                           
  1573  8ec2             mov es, dx                               
  1575  2689879288       mov word ptr es:[bx - 0x776e], ax        
  157a  b80100           mov ax, 1                                
  157d  5f               pop di                                   
  157e  5e               pop si                                   
  157f  c9               leave                                    
  1580  cb               retf                                     

ovl20_1581:  ; ENTRY
  1581  55               push bp                                  
  1582  8bec             mov bp, sp                               
  1584  56               push si                                  
  1585  8b7606           mov si, word ptr [bp + 6]                
  1588  8bde             mov bx, si                               
  158a  6bdb16           imul bx, bx, 0x16                        
  158d  b81d1e           mov ax, 0x1e1d                           
  1590  8b5608           mov dx, word ptr [bp + 8]                
  1593  8ec0             mov es, ax                               
  1595  2689979288       mov word ptr es:[bx - 0x776e], dx        
  159a  8bde             mov bx, si                               
  159c  6bdb16           imul bx, bx, 0x16                        
  159f  8b560a           mov dx, word ptr [bp + 0xa]              
  15a2  8ec0             mov es, ax                               
  15a4  2689979488       mov word ptr es:[bx - 0x776c], dx        
  15a9  8bc6             mov ax, si                               
  15ab  6bc016           imul ax, ax, 0x16                        
  15ae  ba0000           mov dx, 0                                
  15b1  03d0             add dx, ax                               
  15b3  81c28088         add dx, 0x8880                           
  15b7  681d1e           push 0x1e1d                              
  15ba  52               push dx                                  
  15bb  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  15c0  83c404           add sp, 4                                
  15c3  6a00             push 0                                   
  15c5  c41e625e         les bx, ptr [0x5e62]                     
  15c9  26ff7714         push word ptr es:[bx + 0x14]             
  15cd  26ff7712         push word ptr es:[bx + 0x12]             
  15d1  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  15d6  83c406           add sp, 6                                
  15d9  3d0100           cmp ax, 1                                
  15dc  752a             jne 0x1608                               
  15de  8bde             mov bx, si                               
  15e0  6bdb16           imul bx, bx, 0x16                        
  15e3  b81d1e           mov ax, 0x1e1d                           
  15e6  8ec0             mov es, ax                               
  15e8  2683a78c88df     and word ptr es:[bx - 0x7774], 0xffdf    
  15ee  8bde             mov bx, si                               
  15f0  6bdb16           imul bx, bx, 0x16                        
  15f3  8ec0             mov es, ax                               
  15f5  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  15fb  8bde             mov bx, si                               
  15fd  6bdb16           imul bx, bx, 0x16                        
  1600  8ec0             mov es, ax                               
  1602  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  1608  8bde             mov bx, si                               
  160a  6bdb16           imul bx, bx, 0x16                        
  160d  b81d1e           mov ax, 0x1e1d                           
  1610  8ec0             mov es, ax                               
  1612  26838f8c8840     or word ptr es:[bx - 0x7774], 0x40       
  1618  8bde             mov bx, si                               
  161a  6bdb16           imul bx, bx, 0x16                        
  161d  b81d1e           mov ax, 0x1e1d                           
  1620  baffff           mov dx, 0xffff                           
  1623  8ec0             mov es, ax                               
  1625  2689979488       mov word ptr es:[bx - 0x776c], dx        
  162a  8bc2             mov ax, dx                               
  162c  8bde             mov bx, si                               
  162e  6bdb16           imul bx, bx, 0x16                        
  1631  ba1d1e           mov dx, 0x1e1d                           
  1634  8ec2             mov es, dx                               
  1636  2689879288       mov word ptr es:[bx - 0x776e], ax        
  163b  8bde             mov bx, si                               
  163d  6bdb16           imul bx, bx, 0x16                        
  1640  b81d1e           mov ax, 0x1e1d                           
  1643  8ec0             mov es, ax                               
  1645  26c687918800     mov byte ptr es:[bx - 0x776f], 0         
  164b  5e               pop si                                   
  164c  5d               pop bp                                   
  164d  cb               retf                                     

ovl20_164e:  ; ENTRY
  164e  55               push bp                                  
  164f  8bec             mov bp, sp                               
  1651  83ec08           sub sp, 8                                
  1654  56               push si                                  
  1655  57               push di                                  
  1656  8b4e06           mov cx, word ptr [bp + 6]                
  1659  8bd9             mov bx, cx                               
  165b  6bdb16           imul bx, bx, 0x16                        
  165e  b81d1e           mov ax, 0x1e1d                           
  1661  ba0000           mov dx, 0                                
  1664  81c28088         add dx, 0x8880                           
  1668  03da             add bx, dx                               
  166a  8ec0             mov es, ax                               
  166c  268b07           mov ax, word ptr es:[bx]                 
  166f  8946fe           mov word ptr [bp - 2], ax                
  1672  8bd9             mov bx, cx                               
  1674  6bdb16           imul bx, bx, 0x16                        
  1677  b81d1e           mov ax, 0x1e1d                           
  167a  8ec0             mov es, ax                               
  167c  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1681  8946fc           mov word ptr [bp - 4], ax                
  1684  c746fa1027       mov word ptr [bp - 6], 0x2710            
  1689  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  168e  b8042c           mov ax, 0x2c04                           
  1691  8ec0             mov es, ax                               
  1693  268b3e7b15       mov di, word ptr es:[0x157b]             
  1698  e99b00           jmp 0x1736                               
  169b  8bdf             mov bx, di                               
  169d  6bdb41           imul bx, bx, 0x41                        
  16a0  b8042c           mov ax, 0x2c04                           
  16a3  8ec0             mov es, ax                               
  16a5  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  16aa  69dbe000         imul bx, bx, 0xe0                        
  16ae  8bf7             mov si, di                               
  16b0  6bf641           imul si, si, 0x41                        
  16b3  b8042c           mov ax, 0x2c04                           
  16b6  8ec0             mov es, ax                               
  16b8  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  16bd  d1e0             shl ax, 1                                
  16bf  03d8             add bx, ax                               
  16c1  b81d1e           mov ax, 0x1e1d                           
  16c4  8ec0             mov es, ax                               
  16c6  268a9f0000       mov bl, byte ptr es:[bx]                 
  16cb  81e3ff00         and bx, 0xff                             
  16cf  b8042c           mov ax, 0x2c04                           
  16d2  8ec0             mov es, ax                               
  16d4  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  16da  755a             jne 0x1736                               
  16dc  c41eee40         les bx, ptr [0x40ee]                     
  16e0  03df             add bx, di                               
  16e2  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  16e7  b400             mov ah, 0                                
  16e9  a90100           test ax, 1                               
  16ec  7448             je 0x1736                                
  16ee  ff76fc           push word ptr [bp - 4]                   
  16f1  ff76fe           push word ptr [bp - 2]                   
  16f4  8bdf             mov bx, di                               
  16f6  6bdb41           imul bx, bx, 0x41                        
  16f9  b8042c           mov ax, 0x2c04                           
  16fc  8ec0             mov es, ax                               
  16fe  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1703  8bdf             mov bx, di                               
  1705  6bdb41           imul bx, bx, 0x41                        
  1708  b8042c           mov ax, 0x2c04                           
  170b  8ec0             mov es, ax                               
  170d  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1712  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1717  83c408           add sp, 8                                
  171a  8bf0             mov si, ax                               
  171c  666a0a           push 0xa                                 
  171f  6a01             push 1                                   
  1721  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1726  83c406           add sp, 6                                
  1729  03f0             add si, ax                               
  172b  3b76fa           cmp si, word ptr [bp - 6]                
  172e  7d06             jge 0x1736                               
  1730  8976fa           mov word ptr [bp - 6], si                
  1733  897ef8           mov word ptr [bp - 8], di                
  1736  8bc7             mov ax, di                               
  1738  4f               dec di                                   
  1739  0bc0             or ax, ax                                
  173b  7403             je 0x1740                                
  173d  e95bff           jmp 0x169b                               
  1740  837ef8ff         cmp word ptr [bp - 8], -1                
  1744  7504             jne 0x174a                               
  1746  33c0             xor ax, ax                               
  1748  eb31             jmp 0x177b                               
  174a  8b5ef8           mov bx, word ptr [bp - 8]                
  174d  6bdb41           imul bx, bx, 0x41                        
  1750  b8042c           mov ax, 0x2c04                           
  1753  8ec0             mov es, ax                               
  1755  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  175a  48               dec ax                                   
  175b  c45e08           les bx, ptr [bp + 8]                     
  175e  268907           mov word ptr es:[bx], ax                 
  1761  8b5ef8           mov bx, word ptr [bp - 8]                
  1764  6bdb41           imul bx, bx, 0x41                        
  1767  b8042c           mov ax, 0x2c04                           
  176a  8ec0             mov es, ax                               
  176c  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1771  48               dec ax                                   
  1772  c45e0c           les bx, ptr [bp + 0xc]                   
  1775  268907           mov word ptr es:[bx], ax                 
  1778  b80100           mov ax, 1                                
  177b  5f               pop di                                   
  177c  5e               pop si                                   
  177d  c9               leave                                    
  177e  cb               retf                                     

ovl20_177f:  ; ENTRY
  177f  55               push bp                                  
  1780  8bec             mov bp, sp                               
  1782  83ec18           sub sp, 0x18                             
  1785  56               push si                                  
  1786  57               push di                                  
  1787  c746fe0000       mov word ptr [bp - 2], 0                 
  178c  8b5e06           mov bx, word ptr [bp + 6]                
  178f  6bdb16           imul bx, bx, 0x16                        
  1792  b81d1e           mov ax, 0x1e1d                           
  1795  ba0000           mov dx, 0                                
  1798  81c28088         add dx, 0x8880                           
  179c  03da             add bx, dx                               
  179e  8ec0             mov es, ax                               
  17a0  268b07           mov ax, word ptr es:[bx]                 
  17a3  8946fc           mov word ptr [bp - 4], ax                
  17a6  8b5e06           mov bx, word ptr [bp + 6]                
  17a9  6bdb16           imul bx, bx, 0x16                        
  17ac  b81d1e           mov ax, 0x1e1d                           
  17af  8ec0             mov es, ax                               
  17b1  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  17b6  8946fa           mov word ptr [bp - 6], ax                
  17b9  8b5e06           mov bx, word ptr [bp + 6]                
  17bc  6bdb16           imul bx, bx, 0x16                        
  17bf  b81d1e           mov ax, 0x1e1d                           
  17c2  8ec0             mov es, ax                               
  17c4  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  17c9  98               cwde                                     
  17ca  6bc041           imul ax, ax, 0x41                        
  17cd  ba042c           mov dx, 0x2c04                           
  17d0  8bd8             mov bx, ax                               
  17d2  8ec2             mov es, dx                               
  17d4  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  17d9  8946f8           mov word ptr [bp - 8], ax                
  17dc  8b5e06           mov bx, word ptr [bp + 6]                
  17df  6bdb16           imul bx, bx, 0x16                        
  17e2  b81d1e           mov ax, 0x1e1d                           
  17e5  8ec0             mov es, ax                               
  17e7  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  17ec  98               cwde                                     
  17ed  6bc041           imul ax, ax, 0x41                        
  17f0  ba042c           mov dx, 0x2c04                           
  17f3  8bd8             mov bx, ax                               
  17f5  8ec2             mov es, dx                               
  17f7  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  17fc  8946f6           mov word ptr [bp - 0xa], ax              
  17ff  c746f40000       mov word ptr [bp - 0xc], 0               
  1804  8b5e06           mov bx, word ptr [bp + 6]                
  1807  6bdb16           imul bx, bx, 0x16                        
  180a  b81d1e           mov ax, 0x1e1d                           
  180d  8ec0             mov es, ax                               
  180f  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  1816  7405             je 0x181d                                
  1818  b80100           mov ax, 1                                
  181b  eb02             jmp 0x181f                               
  181d  33c0             xor ax, ax                               
  181f  8946f0           mov word ptr [bp - 0x10], ax             
  1822  c746ee0500       mov word ptr [bp - 0x12], 5              
  1827  c45e10           les bx, ptr [bp + 0x10]                  
  182a  26c7070000       mov word ptr es:[bx], 0                  
  182f  66680400ffff     push 0xffff0004                          
  1835  6a01             push 1                                   
  1837  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  183c  83c406           add sp, 6                                
  183f  0bc0             or ax, ax                                
  1841  7553             jne 0x1896                               
  1843  8b5efa           mov bx, word ptr [bp - 6]                
  1846  69dbe000         imul bx, bx, 0xe0                        
  184a  8b46fc           mov ax, word ptr [bp - 4]                
  184d  d1e0             shl ax, 1                                
  184f  03d8             add bx, ax                               
  1851  b81d1e           mov ax, 0x1e1d                           
  1854  8ec0             mov es, ax                               
  1856  268a9f0000       mov bl, byte ptr es:[bx]                 
  185b  81e3ff00         and bx, 0xff                             
  185f  b8042c           mov ax, 0x2c04                           
  1862  8ec0             mov es, ax                               
  1864  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  186a  752a             jne 0x1896                               
  186c  ff76fa           push word ptr [bp - 6]                   
  186f  ff76fc           push word ptr [bp - 4]                   
  1872  9a9d105505       lcall 0x555, 0x109d                      -> 0555:109d
  1877  83c404           add sp, 4                                
  187a  0bc0             or ax, ax                                
  187c  7418             je 0x1896                                
  187e  8b5e06           mov bx, word ptr [bp + 6]                
  1881  6bdb16           imul bx, bx, 0x16                        
  1884  b81d1e           mov ax, 0x1e1d                           
  1887  8ec0             mov es, ax                               
  1889  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  188f  7405             je 0x1896                                
  1891  c746f00100       mov word ptr [bp - 0x10], 1              
  1896  8b76fc           mov si, word ptr [bp - 4]                
  1899  2b76ee           sub si, word ptr [bp - 0x12]             
  189c  e9f802           jmp 0x1b97                               
  189f  8b7efa           mov di, word ptr [bp - 6]                
  18a2  2b7eee           sub di, word ptr [bp - 0x12]             
  18a5  e9e102           jmp 0x1b89                               
  18a8  0bf6             or si, si                                
  18aa  7d03             jge 0x18af                               
  18ac  e9d902           jmp 0x1b88                               
  18af  0bff             or di, di                                
  18b1  7d03             jge 0x18b6                               
  18b3  e9d202           jmp 0x1b88                               
  18b6  83fe70           cmp si, 0x70                             
  18b9  7c03             jl 0x18be                                
  18bb  e9ca02           jmp 0x1b88                               
  18be  81ff9c00         cmp di, 0x9c                             
  18c2  7c03             jl 0x18c7                                
  18c4  e9c102           jmp 0x1b88                               
  18c7  8bdf             mov bx, di                               
  18c9  69dbe000         imul bx, bx, 0xe0                        
  18cd  8bc6             mov ax, si                               
  18cf  d1e0             shl ax, 1                                
  18d1  03d8             add bx, ax                               
  18d3  b81d1e           mov ax, 0x1e1d                           
  18d6  8ec0             mov es, ax                               
  18d8  268a9f0000       mov bl, byte ptr es:[bx]                 
  18dd  81e3ff00         and bx, 0xff                             
  18e1  b8042c           mov ax, 0x2c04                           
  18e4  8ec0             mov es, ax                               
  18e6  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  18ec  753e             jne 0x192c                               
  18ee  8bdf             mov bx, di                               
  18f0  69dbe000         imul bx, bx, 0xe0                        
  18f4  8bc6             mov ax, si                               
  18f6  d1e0             shl ax, 1                                
  18f8  03d8             add bx, ax                               
  18fa  b81d1e           mov ax, 0x1e1d                           
  18fd  8ec0             mov es, ax                               
  18ff  268a870100       mov al, byte ptr es:[bx + 1]             
  1904  250f00           and ax, 0xf                              
  1907  ba042c           mov dx, 0x2c04                           
  190a  8ec2             mov es, dx                               
  190c  263b061001       cmp ax, word ptr es:[0x110]              
  1911  7419             je 0x192c                                
  1913  66ff7618         push dword ptr [bp + 0x18]               
  1917  66ff7614         push dword ptr [bp + 0x14]               
  191b  66ff7610         push dword ptr [bp + 0x10]               
  191f  57               push di                                  
  1920  56               push si                                  
  1921  ff7606           push word ptr [bp + 6]                   
  1924  90               nop                                      
  1925  0e               push cs                                  
  1926  e88202           call 0x1bab                              
  1929  83c412           add sp, 0x12                             
  192c  8bdf             mov bx, di                               
  192e  69dbe000         imul bx, bx, 0xe0                        
  1932  8bc6             mov ax, si                               
  1934  d1e0             shl ax, 1                                
  1936  03d8             add bx, ax                               
  1938  b81d1e           mov ax, 0x1e1d                           
  193b  8ec0             mov es, ax                               
  193d  268a9f0000       mov bl, byte ptr es:[bx]                 
  1942  81e3ff00         and bx, 0xff                             
  1946  b8042c           mov ax, 0x2c04                           
  1949  8ec0             mov es, ax                               
  194b  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  1951  7519             jne 0x196c                               
  1953  66ff7618         push dword ptr [bp + 0x18]               
  1957  66ff7614         push dword ptr [bp + 0x14]               
  195b  66ff7610         push dword ptr [bp + 0x10]               
  195f  57               push di                                  
  1960  56               push si                                  
  1961  ff7606           push word ptr [bp + 6]                   
  1964  90               nop                                      
  1965  0e               push cs                                  
  1966  e83403           call 0x1c9d                              
  1969  83c412           add sp, 0x12                             
  196c  8bdf             mov bx, di                               
  196e  69dbe000         imul bx, bx, 0xe0                        
  1972  8bc6             mov ax, si                               
  1974  d1e0             shl ax, 1                                
  1976  03d8             add bx, ax                               
  1978  b81d1e           mov ax, 0x1e1d                           
  197b  8ec0             mov es, ax                               
  197d  268a9f0000       mov bl, byte ptr es:[bx]                 
  1982  81e3ff00         and bx, 0xff                             
  1986  b8042c           mov ax, 0x2c04                           
  1989  8ec0             mov es, ax                               
  198b  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1991  7503             jne 0x1996                               
  1993  e9f201           jmp 0x1b88                               
  1996  833efc5d02       cmp word ptr [0x5dfc], 2                 
  199b  744a             je 0x19e7                                
  199d  8bdf             mov bx, di                               
  199f  6bdb70           imul bx, bx, 0x70                        
  19a2  03de             add bx, si                               
  19a4  b8d919           mov ax, 0x19d9                           
  19a7  8ec0             mov es, ax                               
  19a9  268a870000       mov al, byte ptr es:[bx]                 
  19ae  251f00           and ax, 0x1f                             
  19b1  0bc0             or ax, ax                                
  19b3  7532             jne 0x19e7                               
  19b5  f706fa5d0100     test word ptr [0x5dfa], 1                
  19bb  752a             jne 0x19e7                               
  19bd  8bdf             mov bx, di                               
  19bf  69dbe000         imul bx, bx, 0xe0                        
  19c3  8bc6             mov ax, si                               
  19c5  d1e0             shl ax, 1                                
  19c7  03d8             add bx, ax                               
  19c9  b81d1e           mov ax, 0x1e1d                           
  19cc  8ec0             mov es, ax                               
  19ce  268a9f0000       mov bl, byte ptr es:[bx]                 
  19d3  81e3ff00         and bx, 0xff                             
  19d7  b8042c           mov ax, 0x2c04                           
  19da  8ec0             mov es, ax                               
  19dc  2680bf100705     cmp byte ptr es:[bx + 0x710], 5          
  19e2  7503             jne 0x19e7                               
  19e4  e9a101           jmp 0x1b88                               
  19e7  8bdf             mov bx, di                               
  19e9  6bdb70           imul bx, bx, 0x70                        
  19ec  03de             add bx, si                               
  19ee  b8d919           mov ax, 0x19d9                           
  19f1  8ec0             mov es, ax                               
  19f3  268a870000       mov al, byte ptr es:[bx]                 
  19f8  c1e805           shr ax, 5                                
  19fb  250100           and ax, 1                                
  19fe  0bc0             or ax, ax                                
  1a00  7403             je 0x1a05                                
  1a02  e98301           jmp 0x1b88                               
  1a05  833efc5d02       cmp word ptr [0x5dfc], 2                 
  1a0a  7433             je 0x1a3f                                
  1a0c  8bdf             mov bx, di                               
  1a0e  69dbe000         imul bx, bx, 0xe0                        
  1a12  8bc6             mov ax, si                               
  1a14  d1e0             shl ax, 1                                
  1a16  03d8             add bx, ax                               
  1a18  b81d1e           mov ax, 0x1e1d                           
  1a1b  8ec0             mov es, ax                               
  1a1d  268a9f0000       mov bl, byte ptr es:[bx]                 
  1a22  81e3ff00         and bx, 0xff                             
  1a26  b8042c           mov ax, 0x2c04                           
  1a29  8ec0             mov es, ax                               
  1a2b  268a871007       mov al, byte ptr es:[bx + 0x710]         
  1a30  98               cwde                                     
  1a31  d1e0             shl ax, 1                                
  1a33  8bd8             mov bx, ax                               
  1a35  83bf741200       cmp word ptr [bx + 0x1274], 0            
  1a3a  7503             jne 0x1a3f                               
  1a3c  e94901           jmp 0x1b88                               
  1a3f  c746f20000       mov word ptr [bp - 0xe], 0               
  1a44  8bd6             mov dx, si                               
  1a46  4a               dec dx                                   
  1a47  eb3f             jmp 0x1a88                               
  1a49  8bcf             mov cx, di                               
  1a4b  49               dec cx                                   
  1a4c  eb32             jmp 0x1a80                               
  1a4e  0bd2             or dx, dx                                
  1a50  7c2d             jl 0x1a7f                                
  1a52  0bc9             or cx, cx                                
  1a54  7c29             jl 0x1a7f                                
  1a56  83fa70           cmp dx, 0x70                             
  1a59  7d24             jge 0x1a7f                               
  1a5b  81f99c00         cmp cx, 0x9c                             
  1a5f  7d1e             jge 0x1a7f                               
  1a61  8bd9             mov bx, cx                               
  1a63  6bdb70           imul bx, bx, 0x70                        
  1a66  03da             add bx, dx                               
  1a68  b8d919           mov ax, 0x19d9                           
  1a6b  8ec0             mov es, ax                               
  1a6d  268a870000       mov al, byte ptr es:[bx]                 
  1a72  c1e805           shr ax, 5                                
  1a75  250100           and ax, 1                                
  1a78  0bc0             or ax, ax                                
  1a7a  7503             jne 0x1a7f                               
  1a7c  ff46f2           inc word ptr [bp - 0xe]                  
  1a7f  41               inc cx                                   
  1a80  8bc7             mov ax, di                               
  1a82  40               inc ax                                   
  1a83  3bc1             cmp ax, cx                               
  1a85  7dc7             jge 0x1a4e                               
  1a87  42               inc dx                                   
  1a88  8bc6             mov ax, si                               
  1a8a  40               inc ax                                   
  1a8b  3bc2             cmp ax, dx                               
  1a8d  7dba             jge 0x1a49                               
  1a8f  837ef202         cmp word ptr [bp - 0xe], 2               
  1a93  7d03             jge 0x1a98                               
  1a95  e9f000           jmp 0x1b88                               
  1a98  c746e80000       mov word ptr [bp - 0x18], 0              
  1a9d  8bdf             mov bx, di                               
  1a9f  69dbe000         imul bx, bx, 0xe0                        
  1aa3  8bc6             mov ax, si                               
  1aa5  d1e0             shl ax, 1                                
  1aa7  03d8             add bx, ax                               
  1aa9  b81d1e           mov ax, 0x1e1d                           
  1aac  8ec0             mov es, ax                               
  1aae  268a9f0000       mov bl, byte ptr es:[bx]                 
  1ab3  81e3ff00         and bx, 0xff                             
  1ab7  b8042c           mov ax, 0x2c04                           
  1aba  8ec0             mov es, ax                               
  1abc  268a871007       mov al, byte ptr es:[bx + 0x710]         
  1ac1  98               cwde                                     
  1ac2  8bd0             mov dx, ax                               
  1ac4  837ef000         cmp word ptr [bp - 0x10], 0              
  1ac8  740c             je 0x1ad6                                
  1aca  83fa02           cmp dx, 2                                
  1acd  7432             je 0x1b01                                
  1acf  83fa03           cmp dx, 3                                
  1ad2  7532             jne 0x1b06                               
  1ad4  eb2b             jmp 0x1b01                               
  1ad6  83fa02           cmp dx, 2                                
  1ad9  742b             je 0x1b06                                
  1adb  83fa03           cmp dx, 3                                
  1ade  7426             je 0x1b06                                
  1ae0  83fa05           cmp dx, 5                                
  1ae3  7404             je 0x1ae9                                
  1ae5  8346e864         add word ptr [bp - 0x18], 0x64           
  1ae9  8bdf             mov bx, di                               
  1aeb  6bdb70           imul bx, bx, 0x70                        
  1aee  03de             add bx, si                               
  1af0  b8d919           mov ax, 0x19d9                           
  1af3  8ec0             mov es, ax                               
  1af5  268a870000       mov al, byte ptr es:[bx]                 
  1afa  251f00           and ax, 0x1f                             
  1afd  0bc0             or ax, ax                                
  1aff  7405             je 0x1b06                                
  1b01  8146e8c800       add word ptr [bp - 0x18], 0xc8            ; "Quest"
  1b06  ff76fa           push word ptr [bp - 6]                   
  1b09  ff76fc           push word ptr [bp - 4]                   
  1b0c  57               push di                                  
  1b0d  56               push si                                  
  1b0e  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1b13  83c408           add sp, 8                                
  1b16  8946ec           mov word ptr [bp - 0x14], ax             
  1b19  ff76f6           push word ptr [bp - 0xa]                 
  1b1c  ff76f8           push word ptr [bp - 8]                   
  1b1f  57               push di                                  
  1b20  56               push si                                  
  1b21  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1b26  83c408           add sp, 8                                
  1b29  8946ea           mov word ptr [bp - 0x16], ax             
  1b2c  666a0a           push 0xa                                 
  1b2f  6a01             push 1                                   
  1b31  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1b36  83c406           add sp, 6                                
  1b39  8b56ec           mov dx, word ptr [bp - 0x14]             
  1b3c  d1e2             shl dx, 1                                
  1b3e  03c2             add ax, dx                               
  1b40  0346ea           add ax, word ptr [bp - 0x16]             
  1b43  8b56f2           mov dx, word ptr [bp - 0xe]              
  1b46  6bd20a           imul dx, dx, 0xa                         
  1b49  03c2             add ax, dx                               
  1b4b  0346e8           add ax, word ptr [bp - 0x18]             
  1b4e  8bd0             mov dx, ax                               
  1b50  837ef000         cmp word ptr [bp - 0x10], 0              
  1b54  7419             je 0x1b6f                                
  1b56  837ee800         cmp word ptr [bp - 0x18], 0              
  1b5a  7413             je 0x1b6f                                
  1b5c  837eea32         cmp word ptr [bp - 0x16], 0x32           
  1b60  7e05             jle 0x1b67                               
  1b62  b83200           mov ax, 0x32                             
  1b65  eb03             jmp 0x1b6a                               
  1b67  8b46ea           mov ax, word ptr [bp - 0x16]             
  1b6a  6bc00a           imul ax, ax, 0xa                         
  1b6d  03d0             add dx, ax                               
  1b6f  3956f4           cmp word ptr [bp - 0xc], dx              
  1b72  7d14             jge 0x1b88                               
  1b74  8956f4           mov word ptr [bp - 0xc], dx              
  1b77  c45e08           les bx, ptr [bp + 8]                     
  1b7a  268937           mov word ptr es:[bx], si                 
  1b7d  c45e0c           les bx, ptr [bp + 0xc]                   
  1b80  26893f           mov word ptr es:[bx], di                 
  1b83  c746fe0100       mov word ptr [bp - 2], 1                 
  1b88  47               inc di                                   
  1b89  8b46fa           mov ax, word ptr [bp - 6]                
  1b8c  0346ee           add ax, word ptr [bp - 0x12]             
  1b8f  3bc7             cmp ax, di                               
  1b91  7e03             jle 0x1b96                               
  1b93  e912fd           jmp 0x18a8                               
  1b96  46               inc si                                   
  1b97  8b46fc           mov ax, word ptr [bp - 4]                
  1b9a  0346ee           add ax, word ptr [bp - 0x12]             
  1b9d  3bc6             cmp ax, si                               
  1b9f  7e03             jle 0x1ba4                               
  1ba1  e9fbfc           jmp 0x189f                               
  1ba4  8b46fe           mov ax, word ptr [bp - 2]                
  1ba7  5f               pop di                                   
  1ba8  5e               pop si                                   
  1ba9  c9               leave                                    
  1baa  cb               retf                                     

ovl20_1bab:  ; ENTRY
  1bab  55               push bp                                  
  1bac  8bec             mov bp, sp                               
  1bae  83ec08           sub sp, 8                                
  1bb1  56               push si                                  
  1bb2  57               push di                                  
  1bb3  8b7608           mov si, word ptr [bp + 8]                
  1bb6  8b7e0a           mov di, word ptr [bp + 0xa]              
  1bb9  8b5e06           mov bx, word ptr [bp + 6]                
  1bbc  6bdb16           imul bx, bx, 0x16                        
  1bbf  b81d1e           mov ax, 0x1e1d                           
  1bc2  ba0000           mov dx, 0                                
  1bc5  81c28088         add dx, 0x8880                           
  1bc9  03da             add bx, dx                               
  1bcb  8ec0             mov es, ax                               
  1bcd  268b07           mov ax, word ptr es:[bx]                 
  1bd0  8946fe           mov word ptr [bp - 2], ax                
  1bd3  8b5e06           mov bx, word ptr [bp + 6]                
  1bd6  6bdb16           imul bx, bx, 0x16                        
  1bd9  b81d1e           mov ax, 0x1e1d                           
  1bdc  8ec0             mov es, ax                               
  1bde  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1be3  8946fc           mov word ptr [bp - 4], ax                
  1be6  833efc5d02       cmp word ptr [0x5dfc], 2                 
  1beb  7505             jne 0x1bf2                               
  1bed  b80200           mov ax, 2                                
  1bf0  eb10             jmp 0x1c02                               
  1bf2  57               push di                                  
  1bf3  56               push si                                  
  1bf4  ff76fc           push word ptr [bp - 4]                   
  1bf7  ff76fe           push word ptr [bp - 2]                   
  1bfa  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1bff  83c408           add sp, 8                                
  1c02  8946fa           mov word ptr [bp - 6], ax                
  1c05  8b5e06           mov bx, word ptr [bp + 6]                
  1c08  6bdb16           imul bx, bx, 0x16                        
  1c0b  b81d1e           mov ax, 0x1e1d                           
  1c0e  8ec0             mov es, ax                               
  1c10  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  1c17  7405             je 0x1c1e                                
  1c19  b80100           mov ax, 1                                
  1c1c  eb02             jmp 0x1c20                               
  1c1e  33c0             xor ax, ax                               
  1c20  8946f8           mov word ptr [bp - 8], ax                
  1c23  837efa04         cmp word ptr [bp - 6], 4                 
  1c27  7d70             jge 0x1c99                               
  1c29  837ef800         cmp word ptr [bp - 8], 0                 
  1c2d  740e             je 0x1c3d                                
  1c2f  57               push di                                  
  1c30  56               push si                                  
  1c31  9a9d105505       lcall 0x555, 0x109d                      -> 0555:109d
  1c36  83c404           add sp, 4                                
  1c39  0bc0             or ax, ax                                
  1c3b  745c             je 0x1c99                                
  1c3d  8bd6             mov dx, si                               
  1c3f  4a               dec dx                                   
  1c40  eb50             jmp 0x1c92                               
  1c42  8bcf             mov cx, di                               
  1c44  49               dec cx                                   
  1c45  eb43             jmp 0x1c8a                               
  1c47  0bd2             or dx, dx                                
  1c49  7c3e             jl 0x1c89                                
  1c4b  0bc9             or cx, cx                                
  1c4d  7c3a             jl 0x1c89                                
  1c4f  83fa70           cmp dx, 0x70                             
  1c52  7d35             jge 0x1c89                               
  1c54  81f99c00         cmp cx, 0x9c                             
  1c58  7d2f             jge 0x1c89                               
  1c5a  8bd9             mov bx, cx                               
  1c5c  6bdb70           imul bx, bx, 0x70                        
  1c5f  03da             add bx, dx                               
  1c61  b8d919           mov ax, 0x19d9                           
  1c64  8ec0             mov es, ax                               
  1c66  268a870000       mov al, byte ptr es:[bx]                 
  1c6b  c1e805           shr ax, 5                                
  1c6e  250100           and ax, 1                                
  1c71  0bc0             or ax, ax                                
  1c73  7414             je 0x1c89                                
  1c75  c45e0c           les bx, ptr [bp + 0xc]                   
  1c78  26c7070100       mov word ptr es:[bx], 1                  
  1c7d  c45e10           les bx, ptr [bp + 0x10]                  
  1c80  268937           mov word ptr es:[bx], si                 
  1c83  c45e14           les bx, ptr [bp + 0x14]                  
  1c86  26893f           mov word ptr es:[bx], di                 
  1c89  41               inc cx                                   
  1c8a  8bc7             mov ax, di                               
  1c8c  40               inc ax                                   
  1c8d  3bc1             cmp ax, cx                               
  1c8f  7db6             jge 0x1c47                               
  1c91  42               inc dx                                   
  1c92  8bc6             mov ax, si                               
  1c94  40               inc ax                                   
  1c95  3bc2             cmp ax, dx                               
  1c97  7da9             jge 0x1c42                               
  1c99  5f               pop di                                   
  1c9a  5e               pop si                                   
  1c9b  c9               leave                                    
  1c9c  cb               retf                                     

ovl20_1c9d:  ; ENTRY
  1c9d  55               push bp                                  
  1c9e  8bec             mov bp, sp                               
  1ca0  83ec02           sub sp, 2                                
  1ca3  56               push si                                  
  1ca4  57               push di                                  
  1ca5  8b7608           mov si, word ptr [bp + 8]                
  1ca8  8b7e0a           mov di, word ptr [bp + 0xa]              
  1cab  8b5e06           mov bx, word ptr [bp + 6]                
  1cae  6bdb16           imul bx, bx, 0x16                        
  1cb1  b81d1e           mov ax, 0x1e1d                           
  1cb4  8ec0             mov es, ax                               
  1cb6  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  1cbd  7405             je 0x1cc4                                
  1cbf  b80100           mov ax, 1                                
  1cc2  eb02             jmp 0x1cc6                               
  1cc4  33c0             xor ax, ax                               
  1cc6  8946fe           mov word ptr [bp - 2], ax                
  1cc9  c45e0c           les bx, ptr [bp + 0xc]                   
  1ccc  26833f00         cmp word ptr es:[bx], 0                  
  1cd0  7562             jne 0x1d34                               
  1cd2  837efe00         cmp word ptr [bp - 2], 0                 
  1cd6  755c             jne 0x1d34                               
  1cd8  8bd6             mov dx, si                               
  1cda  4a               dec dx                                   
  1cdb  eb50             jmp 0x1d2d                               
  1cdd  8bcf             mov cx, di                               
  1cdf  49               dec cx                                   
  1ce0  eb43             jmp 0x1d25                               
  1ce2  0bd2             or dx, dx                                
  1ce4  7c3e             jl 0x1d24                                
  1ce6  0bc9             or cx, cx                                
  1ce8  7c3a             jl 0x1d24                                
  1cea  83fa70           cmp dx, 0x70                             
  1ced  7d35             jge 0x1d24                               
  1cef  81f99c00         cmp cx, 0x9c                             
  1cf3  7d2f             jge 0x1d24                               
  1cf5  8bd9             mov bx, cx                               
  1cf7  6bdb70           imul bx, bx, 0x70                        
  1cfa  03da             add bx, dx                               
  1cfc  b8d919           mov ax, 0x19d9                           
  1cff  8ec0             mov es, ax                               
  1d01  268a870000       mov al, byte ptr es:[bx]                 
  1d06  c1e805           shr ax, 5                                
  1d09  250100           and ax, 1                                
  1d0c  0bc0             or ax, ax                                
  1d0e  7414             je 0x1d24                                
  1d10  c45e0c           les bx, ptr [bp + 0xc]                   
  1d13  26c7070200       mov word ptr es:[bx], 2                  
  1d18  c45e10           les bx, ptr [bp + 0x10]                  
  1d1b  268937           mov word ptr es:[bx], si                 
  1d1e  c45e14           les bx, ptr [bp + 0x14]                  
  1d21  26893f           mov word ptr es:[bx], di                 
  1d24  41               inc cx                                   
  1d25  8bc7             mov ax, di                               
  1d27  40               inc ax                                   
  1d28  3bc1             cmp ax, cx                               
  1d2a  7db6             jge 0x1ce2                               
  1d2c  42               inc dx                                   
  1d2d  8bc6             mov ax, si                               
  1d2f  40               inc ax                                   
  1d30  3bc2             cmp ax, dx                               
  1d32  7da9             jge 0x1cdd                               
  1d34  5f               pop di                                   
  1d35  5e               pop si                                   
  1d36  c9               leave                                    
  1d37  cb               retf                                     
