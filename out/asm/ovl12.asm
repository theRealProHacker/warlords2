; ovl12 stub 2f94 file_off 0x45c20 size 0xfa1

ovl12_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  56               push si                                  
  0007  666a00           push 0                                   
  000a  6a00             push 0                                   
  000c  6668bc020000     push 0x2bc                               
  0012  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0017  83c40a           add sp, 0xa                              
  001a  8916903f         mov word ptr [0x3f90], dx                
  001e  a38e3f           mov word ptr [0x3f8e], ax                
  0021  52               push dx                                  
  0022  50               push ax                                  
  0023  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0028  83c404           add sp, 4                                
  002b  8916943f         mov word ptr [0x3f94], dx                
  002f  a3923f           mov word ptr [0x3f92], ax                
  0032  6a51             push 0x51                                
  0034  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0039  59               pop cx                                   
  003a  9a2000832f       lcall 0x2f83, 0x20                       -> ovl09:0000
  003f  33d2             xor dx, dx                               
  0041  eb35             jmp 0x78                                 
  0043  33c9             xor cx, cx                               
  0045  eb2a             jmp 0x71                                 
  0047  8bd9             mov bx, cx                               
  0049  69dbe000         imul bx, bx, 0xe0                        
  004d  8bc2             mov ax, dx                               
  004f  d1e0             shl ax, 1                                
  0051  03d8             add bx, ax                               
  0053  b81d1e           mov ax, 0x1e1d                           
  0056  8ec0             mov es, ax                               
  0058  2680a701007f     and byte ptr es:[bx + 1], 0x7f           
  005e  8bd9             mov bx, cx                               
  0060  6bdb70           imul bx, bx, 0x70                        
  0063  03da             add bx, dx                               
  0065  b8d919           mov ax, 0x19d9                           
  0068  8ec0             mov es, ax                               
  006a  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0070  41               inc cx                                   
  0071  81f99c00         cmp cx, 0x9c                             
  0075  7cd0             jl 0x47                                  
  0077  42               inc dx                                   
  0078  83fa70           cmp dx, 0x70                             
  007b  7cc6             jl 0x43                                  
  007d  6a52             push 0x52                                
  007f  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0084  59               pop cx                                   
  0085  66ff36923f       push dword ptr [0x3f92]                  
  008a  90               nop                                      
  008b  0e               push cs                                  
  008c  e8d600           call 0x165                               
  008f  83c404           add sp, 4                                
  0092  ba6400           mov dx, 0x64                             
  0095  eb0c             jmp 0xa3                                 
  0097  c41e923f         les bx, ptr [0x3f92]                     
  009b  03da             add bx, dx                               
  009d  26c687580200     mov byte ptr es:[bx + 0x258], 0          
  00a3  8bc2             mov ax, dx                               
  00a5  4a               dec dx                                   
  00a6  0bc0             or ax, ax                                
  00a8  75ed             jne 0x97                                 
  00aa  6a53             push 0x53                                
  00ac  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  00b1  59               pop cx                                   
  00b2  be0400           mov si, 4                                
  00b5  eb47             jmp 0xfe                                 
  00b7  83fe0a           cmp si, 0xa                              
  00ba  7d21             jge 0xdd                                 
  00bc  66680300ffff     push 0xffff0003                          
  00c2  6a01             push 1                                   
  00c4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00c9  83c406           add sp, 6                                
  00cc  0bc0             or ax, ax                                
  00ce  750d             jne 0xdd                                 
  00d0  8bc6             mov ax, si                               
  00d2  46               inc si                                   
  00d3  055000           add ax, 0x50                             
  00d6  50               push ax                                  
  00d7  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  00dc  59               pop cx                                   
  00dd  66680e000100     push 0x1000e                             
  00e3  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  00e8  83c404           add sp, 4                                
  00eb  ff76fc           push word ptr [bp - 4]                   
  00ee  ff76fe           push word ptr [bp - 2]                   
  00f1  66ff36923f       push dword ptr [0x3f92]                  
  00f6  90               nop                                      
  00f7  0e               push cs                                  
  00f8  e88b0a           call 0xb86                               
  00fb  83c408           add sp, 8                                
  00fe  16               push ss                                  
  00ff  8d46fc           lea ax, [bp - 4]                         
  0102  50               push ax                                  
  0103  16               push ss                                  
  0104  8d46fe           lea ax, [bp - 2]                         
  0107  50               push ax                                  
  0108  66ff36923f       push dword ptr [0x3f92]                  
  010d  90               nop                                      
  010e  0e               push cs                                  
  010f  e8100d           call 0xe22                               
  0112  83c40c           add sp, 0xc                              
  0115  0bc0             or ax, ax                                
  0117  759e             jne 0xb7                                 
  0119  66ff368e3f       push dword ptr [0x3f8e]                  
  011e  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  0123  83c404           add sp, 4                                
  0126  33c9             xor cx, cx                               
  0128  eb32             jmp 0x15c                                
  012a  33d2             xor dx, dx                               
  012c  eb28             jmp 0x156                                
  012e  8bc1             mov ax, cx                               
  0130  6bc070           imul ax, ax, 0x70                        
  0133  c41e8a3f         les bx, ptr [0x3f8a]                     
  0137  03d8             add bx, ax                               
  0139  03da             add bx, dx                               
  013b  2680bf20610b     cmp byte ptr es:[bx + 0x6120], 0xb       
  0141  7512             jne 0x155                                
  0143  8bd9             mov bx, cx                               
  0145  6bdb70           imul bx, bx, 0x70                        
  0148  03da             add bx, dx                               
  014a  b8d919           mov ax, 0x19d9                           
  014d  8ec0             mov es, ax                               
  014f  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0155  42               inc dx                                   
  0156  83fa70           cmp dx, 0x70                             
  0159  7cd3             jl 0x12e                                 
  015b  41               inc cx                                   
  015c  81f99c00         cmp cx, 0x9c                             
  0160  7cc8             jl 0x12a                                 
  0162  5e               pop si                                   
  0163  c9               leave                                    
  0164  cb               retf                                     

ovl12_0165:  ; ENTRY
  0165  55               push bp                                  
  0166  8bec             mov bp, sp                               
  0168  b93200           mov cx, 0x32                             
  016b  eb29             jmp 0x196                                
  016d  8bc1             mov ax, cx                               
  016f  d1e0             shl ax, 1                                
  0171  c45e06           les bx, ptr [bp + 6]                     
  0174  03d8             add bx, ax                               
  0176  b8ffff           mov ax, 0xffff                           
  0179  268987f401       mov word ptr es:[bx + 0x1f4], ax         
  017e  2689879001       mov word ptr es:[bx + 0x190], ax         
  0183  268987c800       mov word ptr es:[bx + 0xc8], ax          
  0188  26894764         mov word ptr es:[bx + 0x64], ax          
  018c  268907           mov word ptr es:[bx], ax                 
  018f  26c7872c010000   mov word ptr es:[bx + 0x12c], 0          
  0196  8bc1             mov ax, cx                               
  0198  49               dec cx                                   
  0199  0bc0             or ax, ax                                
  019b  75d0             jne 0x16d                                
  019d  66ff7606         push dword ptr [bp + 6]                  
  01a1  90               nop                                      
  01a2  0e               push cs                                  
  01a3  e80e04           call 0x5b4                               
  01a6  83c404           add sp, 4                                
  01a9  b93200           mov cx, 0x32                             
  01ac  eb33             jmp 0x1e1                                
  01ae  8bc1             mov ax, cx                               
  01b0  d1e0             shl ax, 1                                
  01b2  c45e06           les bx, ptr [bp + 6]                     
  01b5  03d8             add bx, ax                               
  01b7  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  01bd  7522             jne 0x1e1                                
  01bf  8bc1             mov ax, cx                               
  01c1  d1e0             shl ax, 1                                
  01c3  c45e06           les bx, ptr [bp + 6]                     
  01c6  03d8             add bx, ax                               
  01c8  b8ffff           mov ax, 0xffff                           
  01cb  268987f401       mov word ptr es:[bx + 0x1f4], ax         
  01d0  2689879001       mov word ptr es:[bx + 0x190], ax         
  01d5  268987c800       mov word ptr es:[bx + 0xc8], ax          
  01da  26894764         mov word ptr es:[bx + 0x64], ax          
  01de  268907           mov word ptr es:[bx], ax                 
  01e1  8bc1             mov ax, cx                               
  01e3  49               dec cx                                   
  01e4  0bc0             or ax, ax                                
  01e6  75c6             jne 0x1ae                                
  01e8  66ff7606         push dword ptr [bp + 6]                  
  01ec  90               nop                                      
  01ed  0e               push cs                                  
  01ee  e80500           call 0x1f6                               
  01f1  83c404           add sp, 4                                
  01f4  5d               pop bp                                   
  01f5  cb               retf                                     

ovl12_01f6:  ; ENTRY
  01f6  55               push bp                                  
  01f7  8bec             mov bp, sp                               
  01f9  83ec02           sub sp, 2                                
  01fc  56               push si                                  
  01fd  57               push di                                  
  01fe  c746fe0000       mov word ptr [bp - 2], 0                 
  0203  bf0100           mov di, 1                                
  0206  e94b01           jmp 0x354                                
  0209  be0100           mov si, 1                                
  020c  e93c01           jmp 0x34b                                
  020f  66680200ffff     push 0xffff0002                          
  0215  6a01             push 1                                   
  0217  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  021c  83c406           add sp, 6                                
  021f  0bc0             or ax, ax                                
  0221  7403             je 0x226                                 
  0223  e92401           jmp 0x34a                                
  0226  33c9             xor cx, cx                               
  0228  8bdf             mov bx, di                               
  022a  69dbe000         imul bx, bx, 0xe0                        
  022e  8bc6             mov ax, si                               
  0230  d1e0             shl ax, 1                                
  0232  03d8             add bx, ax                               
  0234  b81d1e           mov ax, 0x1e1d                           
  0237  8ec0             mov es, ax                               
  0239  268a9f0000       mov bl, byte ptr es:[bx]                 
  023e  81e3ff00         and bx, 0xff                             
  0242  83eb20           sub bx, 0x20                             
  0245  83fb05           cmp bx, 5                                
  0248  7603             jbe 0x24d                                
  024a  e9b100           jmp 0x2fe                                
  024d  d1e3             shl bx, 1                                
  024f  2effa7b703       jmp word ptr cs:[bx + 0x3b7]             
ovl12_0254:  ; case
  0254  b90100           mov cx, 1                                
  0257  ba0300           mov dx, 3                                
  025a  eb1b             jmp 0x277                                
  025c  8bc7             mov ax, di                               
  025e  6bc070           imul ax, ax, 0x70                        
  0261  c41e8a3f         les bx, ptr [0x3f8a]                     
  0265  03d8             add bx, ax                               
  0267  8bc6             mov ax, si                               
  0269  2bc2             sub ax, dx                               
  026b  03d8             add bx, ax                               
  026d  2680bf1f6102     cmp byte ptr es:[bx + 0x611f], 2         
  0273  7402             je 0x277                                 
  0275  33c9             xor cx, cx                               
  0277  8bc2             mov ax, dx                               
  0279  4a               dec dx                                   
  027a  0bc0             or ax, ax                                
  027c  75de             jne 0x25c                                
  027e  eb7e             jmp 0x2fe                                
ovl12_0280:  ; case
  0280  b90100           mov cx, 1                                
  0283  ba0300           mov dx, 3                                
  0286  eb1a             jmp 0x2a2                                
  0288  8bc7             mov ax, di                               
  028a  2bc2             sub ax, dx                               
  028c  48               dec ax                                   
  028d  6bc070           imul ax, ax, 0x70                        
  0290  c41e8a3f         les bx, ptr [0x3f8a]                     
  0294  03d8             add bx, ax                               
  0296  03de             add bx, si                               
  0298  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  029e  7402             je 0x2a2                                 
  02a0  33c9             xor cx, cx                               
  02a2  8bc2             mov ax, dx                               
  02a4  4a               dec dx                                   
  02a5  0bc0             or ax, ax                                
  02a7  75df             jne 0x288                                
  02a9  eb53             jmp 0x2fe                                
ovl12_02ab:  ; case
  02ab  b90100           mov cx, 1                                
  02ae  ba0300           mov dx, 3                                
  02b1  eb19             jmp 0x2cc                                
  02b3  8bc7             mov ax, di                               
  02b5  6bc070           imul ax, ax, 0x70                        
  02b8  c41e8a3f         les bx, ptr [0x3f8a]                     
  02bc  03d8             add bx, ax                               
  02be  03de             add bx, si                               
  02c0  03da             add bx, dx                               
  02c2  2680bf216102     cmp byte ptr es:[bx + 0x6121], 2         
  02c8  7402             je 0x2cc                                 
  02ca  33c9             xor cx, cx                               
  02cc  8bc2             mov ax, dx                               
  02ce  4a               dec dx                                   
  02cf  0bc0             or ax, ax                                
  02d1  75e0             jne 0x2b3                                
  02d3  eb29             jmp 0x2fe                                
ovl12_02d5:  ; case
  02d5  b90100           mov cx, 1                                
  02d8  ba0300           mov dx, 3                                
  02db  eb1a             jmp 0x2f7                                
  02dd  8bc7             mov ax, di                               
  02df  03c2             add ax, dx                               
  02e1  40               inc ax                                   
  02e2  6bc070           imul ax, ax, 0x70                        
  02e5  c41e8a3f         les bx, ptr [0x3f8a]                     
  02e9  03d8             add bx, ax                               
  02eb  03de             add bx, si                               
  02ed  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  02f3  7402             je 0x2f7                                 
  02f5  33c9             xor cx, cx                               
  02f7  8bc2             mov ax, dx                               
  02f9  4a               dec dx                                   
  02fa  0bc0             or ax, ax                                
  02fc  75df             jne 0x2dd                                
  02fe  0bc9             or cx, cx                                
  0300  7448             je 0x34a                                 
  0302  57               push di                                  
  0303  56               push si                                  
  0304  66ff7606         push dword ptr [bp + 6]                  
  0308  90               nop                                      
  0309  0e               push cs                                  
  030a  e85802           call 0x565                               
  030d  83c408           add sp, 8                                
  0310  3d0f00           cmp ax, 0xf                              
  0313  7c35             jl 0x34a                                 
  0315  b9ffff           mov cx, 0xffff                           
  0318  33d2             xor dx, dx                               
  031a  eb14             jmp 0x330                                
  031c  8bc2             mov ax, dx                               
  031e  d1e0             shl ax, 1                                
  0320  c45e06           les bx, ptr [bp + 6]                     
  0323  03d8             add bx, ax                               
  0325  26833fff         cmp word ptr es:[bx], -1                 
  0329  7504             jne 0x32f                                
  032b  8bca             mov cx, dx                               
  032d  eb06             jmp 0x335                                
  032f  42               inc dx                                   
  0330  83fa32           cmp dx, 0x32                             
  0333  7ce7             jl 0x31c                                 
  0335  83f9ff           cmp cx, -1                               
  0338  7410             je 0x34a                                 
  033a  8bc1             mov ax, cx                               
  033c  d1e0             shl ax, 1                                
  033e  c45e06           les bx, ptr [bp + 6]                     
  0341  03d8             add bx, ax                               
  0343  268937           mov word ptr es:[bx], si                 
  0346  26897f64         mov word ptr es:[bx + 0x64], di          
  034a  46               inc si                                   
  034b  83fe6e           cmp si, 0x6e                             
  034e  7d03             jge 0x353                                
  0350  e9bcfe           jmp 0x20f                                
  0353  47               inc di                                   
  0354  81ff9a00         cmp di, 0x9a                             
  0358  7d03             jge 0x35d                                
  035a  e9acfe           jmp 0x209                                
  035d  c45e06           les bx, ptr [bp + 6]                     
  0360  26c7879001ffff   mov word ptr es:[bx + 0x190], 0xffff     
  0367  eb31             jmp 0x39a                                
  0369  ff46fe           inc word ptr [bp - 2]                    
  036c  8bc2             mov ax, dx                               
  036e  d1e0             shl ax, 1                                
  0370  c45e06           les bx, ptr [bp + 6]                     
  0373  03d8             add bx, ax                               
  0375  26c7872c010100   mov word ptr es:[bx + 0x12c], 1          
  037c  268b37           mov si, word ptr es:[bx]                 
  037f  268b7f64         mov di, word ptr es:[bx + 0x64]          
  0383  8bdf             mov bx, di                               
  0385  69dbe000         imul bx, bx, 0xe0                        
  0389  8bc6             mov ax, si                               
  038b  d1e0             shl ax, 1                                
  038d  03d8             add bx, ax                               
  038f  b81d1e           mov ax, 0x1e1d                           
  0392  8ec0             mov es, ax                               
  0394  26808f010080     or byte ptr es:[bx + 1], 0x80            
  039a  66ff7606         push dword ptr [bp + 6]                  
  039e  90               nop                                      
  039f  0e               push cs                                  
  03a0  e82000           call 0x3c3                               
  03a3  83c404           add sp, 4                                
  03a6  8bd0             mov dx, ax                               
  03a8  3dffff           cmp ax, 0xffff                           
  03ab  7406             je 0x3b3                                 
  03ad  837efe0a         cmp word ptr [bp - 2], 0xa               
  03b1  7cb6             jl 0x369                                 
  03b3  5f               pop di                                   
  03b4  5e               pop si                                   
  03b5  c9               leave                                    
  03b6  cb               retf                                     
  03b7  54028002ab025402 dw 0254,0280,02ab,0254,02d5,02ab         jump table

ovl12_03c3:  ; ENTRY
  03c3  55               push bp                                  
  03c4  8bec             mov bp, sp                               
  03c6  83ec06           sub sp, 6                                
  03c9  56               push si                                  
  03ca  57               push di                                  
  03cb  c746feffff       mov word ptr [bp - 2], 0xffff            
  03d0  c746fcffff       mov word ptr [bp - 4], 0xffff            
  03d5  c45e06           les bx, ptr [bp + 6]                     
  03d8  2683bf9001ff     cmp word ptr es:[bx + 0x190], -1         
  03de  7403             je 0x3e3                                 
  03e0  e98400           jmp 0x467                                
  03e3  be3200           mov si, 0x32                             
  03e6  eb78             jmp 0x460                                
  03e8  c746fa1027       mov word ptr [bp - 6], 0x2710            
  03ed  8bc6             mov ax, si                               
  03ef  d1e0             shl ax, 1                                
  03f1  c45e06           les bx, ptr [bp + 6]                     
  03f4  03d8             add bx, ax                               
  03f6  26833fff         cmp word ptr es:[bx], -1                 
  03fa  7464             je 0x460                                 
  03fc  b8042c           mov ax, 0x2c04                           
  03ff  8ec0             mov es, ax                               
  0401  268b3e7b15       mov di, word ptr es:[0x157b]             
  0406  eb40             jmp 0x448                                
  0408  8bdf             mov bx, di                               
  040a  6bdb41           imul bx, bx, 0x41                        
  040d  b8042c           mov ax, 0x2c04                           
  0410  8ec0             mov es, ax                               
  0412  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0417  8bdf             mov bx, di                               
  0419  6bdb41           imul bx, bx, 0x41                        
  041c  b8042c           mov ax, 0x2c04                           
  041f  8ec0             mov es, ax                               
  0421  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0426  8bc6             mov ax, si                               
  0428  d1e0             shl ax, 1                                
  042a  c45e06           les bx, ptr [bp + 6]                     
  042d  03d8             add bx, ax                               
  042f  26ff7764         push word ptr es:[bx + 0x64]             
  0433  26ff37           push word ptr es:[bx]                    
  0436  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  043b  83c408           add sp, 8                                
  043e  8bd0             mov dx, ax                               
  0440  3b56fa           cmp dx, word ptr [bp - 6]                
  0443  7d03             jge 0x448                                
  0445  8956fa           mov word ptr [bp - 6], dx                
  0448  8bc7             mov ax, di                               
  044a  4f               dec di                                   
  044b  0bc0             or ax, ax                                
  044d  75b9             jne 0x408                                
  044f  8bc6             mov ax, si                               
  0451  d1e0             shl ax, 1                                
  0453  c45e06           les bx, ptr [bp + 6]                     
  0456  03d8             add bx, ax                               
  0458  8b46fa           mov ax, word ptr [bp - 6]                
  045b  2689879001       mov word ptr es:[bx + 0x190], ax         
  0460  8bc6             mov ax, si                               
  0462  4e               dec si                                   
  0463  0bc0             or ax, ax                                
  0465  7581             jne 0x3e8                                
  0467  be3200           mov si, 0x32                             
  046a  eb7c             jmp 0x4e8                                
  046c  c746fa1027       mov word ptr [bp - 6], 0x2710            
  0471  8bc6             mov ax, si                               
  0473  d1e0             shl ax, 1                                
  0475  c45e06           les bx, ptr [bp + 6]                     
  0478  03d8             add bx, ax                               
  047a  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  0480  7566             jne 0x4e8                                
  0482  26833fff         cmp word ptr es:[bx], -1                 
  0486  7460             je 0x4e8                                 
  0488  bf3200           mov di, 0x32                             
  048b  eb43             jmp 0x4d0                                
  048d  8bc7             mov ax, di                               
  048f  d1e0             shl ax, 1                                
  0491  c45e06           les bx, ptr [bp + 6]                     
  0494  03d8             add bx, ax                               
  0496  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  049c  7432             je 0x4d0                                 
  049e  8bc7             mov ax, di                               
  04a0  d1e0             shl ax, 1                                
  04a2  c45e06           les bx, ptr [bp + 6]                     
  04a5  03d8             add bx, ax                               
  04a7  26ff7764         push word ptr es:[bx + 0x64]             
  04ab  26ff37           push word ptr es:[bx]                    
  04ae  8bc6             mov ax, si                               
  04b0  d1e0             shl ax, 1                                
  04b2  8b5e06           mov bx, word ptr [bp + 6]                
  04b5  03d8             add bx, ax                               
  04b7  26ff7764         push word ptr es:[bx + 0x64]             
  04bb  26ff37           push word ptr es:[bx]                    
  04be  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  04c3  83c408           add sp, 8                                
  04c6  8bd0             mov dx, ax                               
  04c8  3b56fa           cmp dx, word ptr [bp - 6]                
  04cb  7d03             jge 0x4d0                                
  04cd  8956fa           mov word ptr [bp - 6], dx                
  04d0  8bc7             mov ax, di                               
  04d2  4f               dec di                                   
  04d3  0bc0             or ax, ax                                
  04d5  75b6             jne 0x48d                                
  04d7  8bc6             mov ax, si                               
  04d9  d1e0             shl ax, 1                                
  04db  c45e06           les bx, ptr [bp + 6]                     
  04de  03d8             add bx, ax                               
  04e0  8b46fa           mov ax, word ptr [bp - 6]                
  04e3  268987f401       mov word ptr es:[bx + 0x1f4], ax         
  04e8  8bc6             mov ax, si                               
  04ea  4e               dec si                                   
  04eb  0bc0             or ax, ax                                
  04ed  7403             je 0x4f2                                 
  04ef  e97aff           jmp 0x46c                                
  04f2  be3200           mov si, 0x32                             
  04f5  eb60             jmp 0x557                                
  04f7  8bc6             mov ax, si                               
  04f9  d1e0             shl ax, 1                                
  04fb  c45e06           les bx, ptr [bp + 6]                     
  04fe  03d8             add bx, ax                               
  0500  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  0506  754f             jne 0x557                                
  0508  26833fff         cmp word ptr es:[bx], -1                 
  050c  7449             je 0x557                                 
  050e  66680f000100     push 0x1000f                             
  0514  6a01             push 1                                   
  0516  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  051b  83c406           add sp, 6                                
  051e  50               push ax                                  
  051f  8bc6             mov ax, si                               
  0521  d1e0             shl ax, 1                                
  0523  c45e06           les bx, ptr [bp + 6]                     
  0526  03d8             add bx, ax                               
  0528  b81e00           mov ax, 0x1e                             
  052b  262b879001       sub ax, word ptr es:[bx + 0x190]         
  0530  7d04             jge 0x536                                
  0532  33c0             xor ax, ax                               
  0534  eb11             jmp 0x547                                
  0536  8bc6             mov ax, si                               
  0538  d1e0             shl ax, 1                                
  053a  c45e06           les bx, ptr [bp + 6]                     
  053d  03d8             add bx, ax                               
  053f  b81e00           mov ax, 0x1e                             
  0542  262b879001       sub ax, word ptr es:[bx + 0x190]         
  0547  5a               pop dx                                   
  0548  03c2             add ax, dx                               
  054a  8bd0             mov dx, ax                               
  054c  3b56fc           cmp dx, word ptr [bp - 4]                
  054f  7e06             jle 0x557                                
  0551  8956fc           mov word ptr [bp - 4], dx                
  0554  8976fe           mov word ptr [bp - 2], si                
  0557  8bc6             mov ax, si                               
  0559  4e               dec si                                   
  055a  0bc0             or ax, ax                                
  055c  7599             jne 0x4f7                                
  055e  8b46fe           mov ax, word ptr [bp - 2]                
  0561  5f               pop di                                   
  0562  5e               pop si                                   
  0563  c9               leave                                    
  0564  cb               retf                                     

ovl12_0565:  ; ENTRY
  0565  55               push bp                                  
  0566  8bec             mov bp, sp                               
  0568  56               push si                                  
  0569  57               push di                                  
  056a  bf1027           mov di, 0x2710                           
  056d  be3200           mov si, 0x32                             
  0570  eb35             jmp 0x5a7                                
  0572  8bc6             mov ax, si                               
  0574  d1e0             shl ax, 1                                
  0576  c45e06           les bx, ptr [bp + 6]                     
  0579  03d8             add bx, ax                               
  057b  26833fff         cmp word ptr es:[bx], -1                 
  057f  7426             je 0x5a7                                 
  0581  8bc6             mov ax, si                               
  0583  d1e0             shl ax, 1                                
  0585  c45e06           les bx, ptr [bp + 6]                     
  0588  03d8             add bx, ax                               
  058a  26ff7764         push word ptr es:[bx + 0x64]             
  058e  26ff37           push word ptr es:[bx]                    
  0591  ff760c           push word ptr [bp + 0xc]                 
  0594  ff760a           push word ptr [bp + 0xa]                 
  0597  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  059c  83c408           add sp, 8                                
  059f  8bd0             mov dx, ax                               
  05a1  3bd7             cmp dx, di                               
  05a3  7d02             jge 0x5a7                                
  05a5  8bfa             mov di, dx                               
  05a7  8bc6             mov ax, si                               
  05a9  4e               dec si                                   
  05aa  0bc0             or ax, ax                                
  05ac  75c4             jne 0x572                                
  05ae  8bc7             mov ax, di                               
  05b0  5f               pop di                                   
  05b1  5e               pop si                                   
  05b2  5d               pop bp                                   
  05b3  cb               retf                                     

ovl12_05b4:  ; ENTRY
  05b4  55               push bp                                  
  05b5  8bec             mov bp, sp                               
  05b7  83ec06           sub sp, 6                                
  05ba  56               push si                                  
  05bb  57               push di                                  
  05bc  c746fa0000       mov word ptr [bp - 6], 0                 
  05c1  bf0100           mov di, 1                                
  05c4  e9b701           jmp 0x77e                                
  05c7  be0100           mov si, 1                                
  05ca  e9a801           jmp 0x775                                
  05cd  8bdf             mov bx, di                               
  05cf  69dbe000         imul bx, bx, 0xe0                        
  05d3  8bc6             mov ax, si                               
  05d5  d1e0             shl ax, 1                                
  05d7  03d8             add bx, ax                               
  05d9  b81d1e           mov ax, 0x1e1d                           
  05dc  8ec0             mov es, ax                               
  05de  268a870000       mov al, byte ptr es:[bx]                 
  05e3  25ff00           and ax, 0xff                             
  05e6  3d2600           cmp ax, 0x26                             
  05e9  741e             je 0x609                                 
  05eb  8bdf             mov bx, di                               
  05ed  69dbe000         imul bx, bx, 0xe0                        
  05f1  8bc6             mov ax, si                               
  05f3  d1e0             shl ax, 1                                
  05f5  03d8             add bx, ax                               
  05f7  b81d1e           mov ax, 0x1e1d                           
  05fa  8ec0             mov es, ax                               
  05fc  268a870000       mov al, byte ptr es:[bx]                 
  0601  25ff00           and ax, 0xff                             
  0604  3d1600           cmp ax, 0x16                             
  0607  753f             jne 0x648                                
  0609  8bdf             mov bx, di                               
  060b  69dbe000         imul bx, bx, 0xe0                        
  060f  8bc6             mov ax, si                               
  0611  d1e0             shl ax, 1                                
  0613  03d8             add bx, ax                               
  0615  b81d1e           mov ax, 0x1e1d                           
  0618  8ec0             mov es, ax                               
  061a  268a870200       mov al, byte ptr es:[bx + 2]             
  061f  25ff00           and ax, 0xff                             
  0622  3d2800           cmp ax, 0x28                             
  0625  7503             jne 0x62a                                
  0627  e99c00           jmp 0x6c6                                
  062a  8bdf             mov bx, di                               
  062c  69dbe000         imul bx, bx, 0xe0                        
  0630  8bc6             mov ax, si                               
  0632  d1e0             shl ax, 1                                
  0634  03d8             add bx, ax                               
  0636  b81d1e           mov ax, 0x1e1d                           
  0639  8ec0             mov es, ax                               
  063b  268a870200       mov al, byte ptr es:[bx + 2]             
  0640  25ff00           and ax, 0xff                             
  0643  3d1800           cmp ax, 0x18                             
  0646  747e             je 0x6c6                                 
  0648  8bdf             mov bx, di                               
  064a  69dbe000         imul bx, bx, 0xe0                        
  064e  8bc6             mov ax, si                               
  0650  d1e0             shl ax, 1                                
  0652  03d8             add bx, ax                               
  0654  b81d1e           mov ax, 0x1e1d                           
  0657  8ec0             mov es, ax                               
  0659  268a870000       mov al, byte ptr es:[bx]                 
  065e  25ff00           and ax, 0xff                             
  0661  3d2100           cmp ax, 0x21                             
  0664  7421             je 0x687                                 
  0666  8bdf             mov bx, di                               
  0668  69dbe000         imul bx, bx, 0xe0                        
  066c  8bc6             mov ax, si                               
  066e  d1e0             shl ax, 1                                
  0670  03d8             add bx, ax                               
  0672  b81d1e           mov ax, 0x1e1d                           
  0675  8ec0             mov es, ax                               
  0677  268a870000       mov al, byte ptr es:[bx]                 
  067c  25ff00           and ax, 0xff                             
  067f  3d1100           cmp ax, 0x11                             
  0682  7403             je 0x687                                 
  0684  e9ed00           jmp 0x774                                
  0687  8bdf             mov bx, di                               
  0689  69dbe000         imul bx, bx, 0xe0                        
  068d  8bc6             mov ax, si                               
  068f  d1e0             shl ax, 1                                
  0691  03d8             add bx, ax                               
  0693  b81d1e           mov ax, 0x1e1d                           
  0696  8ec0             mov es, ax                               
  0698  268a87e000       mov al, byte ptr es:[bx + 0xe0]          
  069d  25ff00           and ax, 0xff                             
  06a0  3d2400           cmp ax, 0x24                             
  06a3  7421             je 0x6c6                                 
  06a5  8bdf             mov bx, di                               
  06a7  69dbe000         imul bx, bx, 0xe0                        
  06ab  8bc6             mov ax, si                               
  06ad  d1e0             shl ax, 1                                
  06af  03d8             add bx, ax                               
  06b1  b81d1e           mov ax, 0x1e1d                           
  06b4  8ec0             mov es, ax                               
  06b6  268a87e000       mov al, byte ptr es:[bx + 0xe0]          
  06bb  25ff00           and ax, 0xff                             
  06be  3d1400           cmp ax, 0x14                             
  06c1  7403             je 0x6c6                                 
  06c3  e9ae00           jmp 0x774                                
  06c6  c746fc0000       mov word ptr [bp - 4], 0                 
  06cb  8bdf             mov bx, di                               
  06cd  69dbe000         imul bx, bx, 0xe0                        
  06d1  8bc6             mov ax, si                               
  06d3  d1e0             shl ax, 1                                
  06d5  03d8             add bx, ax                               
  06d7  b81d1e           mov ax, 0x1e1d                           
  06da  8ec0             mov es, ax                               
  06dc  268a870000       mov al, byte ptr es:[bx]                 
  06e1  25ff00           and ax, 0xff                             
  06e4  3d2600           cmp ax, 0x26                             
  06e7  7505             jne 0x6ee                                
  06e9  b80100           mov ax, 1                                
  06ec  eb02             jmp 0x6f0                                
  06ee  33c0             xor ax, ax                               
  06f0  8946fe           mov word ptr [bp - 2], ax                
  06f3  837efe00         cmp word ptr [bp - 2], 0                 
  06f7  7424             je 0x71d                                 
  06f9  57               push di                                  
  06fa  8bc6             mov ax, si                               
  06fc  48               dec ax                                   
  06fd  50               push ax                                  
  06fe  90               nop                                      
  06ff  0e               push cs                                  
  0700  e87c03           call 0xa7f                               
  0703  83c404           add sp, 4                                
  0706  0bc0             or ax, ax                                
  0708  7413             je 0x71d                                 
  070a  57               push di                                  
  070b  8bc6             mov ax, si                               
  070d  050200           add ax, 2                                
  0710  50               push ax                                  
  0711  90               nop                                      
  0712  0e               push cs                                  
  0713  e86903           call 0xa7f                               
  0716  83c404           add sp, 4                                
  0719  0bc0             or ax, ax                                
  071b  752a             jne 0x747                                
  071d  837efe00         cmp word ptr [bp - 2], 0                 
  0721  7429             je 0x74c                                 
  0723  8bc7             mov ax, di                               
  0725  48               dec ax                                   
  0726  50               push ax                                  
  0727  56               push si                                  
  0728  90               nop                                      
  0729  0e               push cs                                  
  072a  e85203           call 0xa7f                               
  072d  83c404           add sp, 4                                
  0730  0bc0             or ax, ax                                
  0732  7418             je 0x74c                                 
  0734  8bc7             mov ax, di                               
  0736  050200           add ax, 2                                
  0739  50               push ax                                  
  073a  56               push si                                  
  073b  90               nop                                      
  073c  0e               push cs                                  
  073d  e83f03           call 0xa7f                               
  0740  83c404           add sp, 4                                
  0743  0bc0             or ax, ax                                
  0745  7405             je 0x74c                                 
  0747  c746fc0100       mov word ptr [bp - 4], 1                 
  074c  837efc00         cmp word ptr [bp - 4], 0                 
  0750  7422             je 0x774                                 
  0752  837efa32         cmp word ptr [bp - 6], 0x32              
  0756  7d1c             jge 0x774                                
  0758  8b46fa           mov ax, word ptr [bp - 6]                
  075b  d1e0             shl ax, 1                                
  075d  c45e06           les bx, ptr [bp + 6]                     
  0760  03d8             add bx, ax                               
  0762  268937           mov word ptr es:[bx], si                 
  0765  26897f64         mov word ptr es:[bx + 0x64], di          
  0769  8b46fe           mov ax, word ptr [bp - 2]                
  076c  268987c800       mov word ptr es:[bx + 0xc8], ax          
  0771  ff46fa           inc word ptr [bp - 6]                    
  0774  46               inc si                                   
  0775  83fe6e           cmp si, 0x6e                             
  0778  7d03             jge 0x77d                                
  077a  e950fe           jmp 0x5cd                                
  077d  47               inc di                                   
  077e  81ff9a00         cmp di, 0x9a                             
  0782  7d03             jge 0x787                                
  0784  e940fe           jmp 0x5c7                                
  0787  837efa00         cmp word ptr [bp - 6], 0                 
  078b  7403             je 0x790                                 
  078d  e94901           jmp 0x8d9                                
  0790  e95f01           jmp 0x8f2                                
  0793  8bc2             mov ax, dx                               
  0795  d1e0             shl ax, 1                                
  0797  c45e06           les bx, ptr [bp + 6]                     
  079a  03d8             add bx, ax                               
  079c  26c7872c010100   mov word ptr es:[bx + 0x12c], 1          
  07a3  268b37           mov si, word ptr es:[bx]                 
  07a6  268b7f64         mov di, word ptr es:[bx + 0x64]          
  07aa  2683bfc80000     cmp word ptr es:[bx + 0xc8], 0           
  07b0  7503             jne 0x7b5                                
  07b2  e99300           jmp 0x848                                
  07b5  8bdf             mov bx, di                               
  07b7  69dbe000         imul bx, bx, 0xe0                        
  07bb  8bc6             mov ax, si                               
  07bd  d1e0             shl ax, 1                                
  07bf  03d8             add bx, ax                               
  07c1  b81d1e           mov ax, 0x1e1d                           
  07c4  8ec0             mov es, ax                               
  07c6  2680a7000000     and byte ptr es:[bx], 0                  
  07cc  26808f000085     or byte ptr es:[bx], 0x85                
  07d2  8bdf             mov bx, di                               
  07d4  69dbe000         imul bx, bx, 0xe0                        
  07d8  8bc6             mov ax, si                               
  07da  d1e0             shl ax, 1                                
  07dc  03d8             add bx, ax                               
  07de  b81d1e           mov ax, 0x1e1d                           
  07e1  8ec0             mov es, ax                               
  07e3  2680a7020000     and byte ptr es:[bx + 2], 0              
  07e9  26808f020086     or byte ptr es:[bx + 2], 0x86            
  07ef  8bc7             mov ax, di                               
  07f1  6bc070           imul ax, ax, 0x70                        
  07f4  c41e8a3f         les bx, ptr [0x3f8a]                     
  07f8  03d8             add bx, ax                               
  07fa  03de             add bx, si                               
  07fc  b001             mov al, 1                                
  07fe  2688872161       mov byte ptr es:[bx + 0x6121], al        
  0803  8bd7             mov dx, di                               
  0805  6bd270           imul dx, dx, 0x70                        
  0808  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  080c  03da             add bx, dx                               
  080e  03de             add bx, si                               
  0810  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0815  8bdf             mov bx, di                               
  0817  6bdb70           imul bx, bx, 0x70                        
  081a  03de             add bx, si                               
  081c  b8d919           mov ax, 0x19d9                           
  081f  8ec0             mov es, ax                               
  0821  2680a70200e0     and byte ptr es:[bx + 2], 0xe0           
  0827  26808f020001     or byte ptr es:[bx + 2], 1               
  082d  8bdf             mov bx, di                               
  082f  6bdb70           imul bx, bx, 0x70                        
  0832  03de             add bx, si                               
  0834  b8d919           mov ax, 0x19d9                           
  0837  8ec0             mov es, ax                               
  0839  2680a7ffffe0     and byte ptr es:[bx - 1], 0xe0           
  083f  26808fffff01     or byte ptr es:[bx - 1], 1               
  0845  e99100           jmp 0x8d9                                
  0848  8bdf             mov bx, di                               
  084a  69dbe000         imul bx, bx, 0xe0                        
  084e  8bc6             mov ax, si                               
  0850  d1e0             shl ax, 1                                
  0852  03d8             add bx, ax                               
  0854  b81d1e           mov ax, 0x1e1d                           
  0857  8ec0             mov es, ax                               
  0859  2680a7000000     and byte ptr es:[bx], 0                  
  085f  26808f000084     or byte ptr es:[bx], 0x84                
  0865  8bdf             mov bx, di                               
  0867  69dbe000         imul bx, bx, 0xe0                        
  086b  8bc6             mov ax, si                               
  086d  d1e0             shl ax, 1                                
  086f  03d8             add bx, ax                               
  0871  b81d1e           mov ax, 0x1e1d                           
  0874  8ec0             mov es, ax                               
  0876  2680a7e00000     and byte ptr es:[bx + 0xe0], 0           
  087c  26808fe00094     or byte ptr es:[bx + 0xe0], 0x94         
  0882  8bc7             mov ax, di                               
  0884  40               inc ax                                   
  0885  6bc070           imul ax, ax, 0x70                        
  0888  c41e8a3f         les bx, ptr [0x3f8a]                     
  088c  03d8             add bx, ax                               
  088e  03de             add bx, si                               
  0890  b001             mov al, 1                                
  0892  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0897  8bd7             mov dx, di                               
  0899  6bd270           imul dx, dx, 0x70                        
  089c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  08a0  03da             add bx, dx                               
  08a2  03de             add bx, si                               
  08a4  2688872061       mov byte ptr es:[bx + 0x6120], al        
  08a9  8bdf             mov bx, di                               
  08ab  6bdb70           imul bx, bx, 0x70                        
  08ae  03de             add bx, si                               
  08b0  b8d919           mov ax, 0x19d9                           
  08b3  8ec0             mov es, ax                               
  08b5  2680a7e000e0     and byte ptr es:[bx + 0xe0], 0xe0        
  08bb  26808fe00001     or byte ptr es:[bx + 0xe0], 1            
  08c1  8bdf             mov bx, di                               
  08c3  6bdb70           imul bx, bx, 0x70                        
  08c6  03de             add bx, si                               
  08c8  b8d919           mov ax, 0x19d9                           
  08cb  8ec0             mov es, ax                               
  08cd  2680a790ffe0     and byte ptr es:[bx - 0x70], 0xe0        
  08d3  26808f90ff01     or byte ptr es:[bx - 0x70], 1            
  08d9  ff76fa           push word ptr [bp - 6]                   
  08dc  66ff7606         push dword ptr [bp + 6]                  
  08e0  90               nop                                      
  08e1  0e               push cs                                  
  08e2  e81100           call 0x8f6                               
  08e5  83c406           add sp, 6                                
  08e8  8bd0             mov dx, ax                               
  08ea  3dffff           cmp ax, 0xffff                           
  08ed  7403             je 0x8f2                                 
  08ef  e9a1fe           jmp 0x793                                
  08f2  5f               pop di                                   
  08f3  5e               pop si                                   
  08f4  c9               leave                                    
  08f5  cb               retf                                     

ovl12_08f6:  ; ENTRY
  08f6  55               push bp                                  
  08f7  8bec             mov bp, sp                               
  08f9  83ec06           sub sp, 6                                
  08fc  56               push si                                  
  08fd  57               push di                                  
  08fe  c746feffff       mov word ptr [bp - 2], 0xffff            
  0903  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0908  c45e06           les bx, ptr [bp + 6]                     
  090b  2683bf9001ff     cmp word ptr es:[bx + 0x190], -1         
  0911  7575             jne 0x988                                
  0913  8b760a           mov si, word ptr [bp + 0xa]              
  0916  eb69             jmp 0x981                                
  0918  c746fa1027       mov word ptr [bp - 6], 0x2710            
  091d  b8042c           mov ax, 0x2c04                           
  0920  8ec0             mov es, ax                               
  0922  268b3e7b15       mov di, word ptr es:[0x157b]             
  0927  eb40             jmp 0x969                                
  0929  8bdf             mov bx, di                               
  092b  6bdb41           imul bx, bx, 0x41                        
  092e  b8042c           mov ax, 0x2c04                           
  0931  8ec0             mov es, ax                               
  0933  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0938  8bdf             mov bx, di                               
  093a  6bdb41           imul bx, bx, 0x41                        
  093d  b8042c           mov ax, 0x2c04                           
  0940  8ec0             mov es, ax                               
  0942  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0947  8bc6             mov ax, si                               
  0949  d1e0             shl ax, 1                                
  094b  c45e06           les bx, ptr [bp + 6]                     
  094e  03d8             add bx, ax                               
  0950  26ff7764         push word ptr es:[bx + 0x64]             
  0954  26ff37           push word ptr es:[bx]                    
  0957  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  095c  83c408           add sp, 8                                
  095f  8bd0             mov dx, ax                               
  0961  3b56fa           cmp dx, word ptr [bp - 6]                
  0964  7d03             jge 0x969                                
  0966  8956fa           mov word ptr [bp - 6], dx                
  0969  8bc7             mov ax, di                               
  096b  4f               dec di                                   
  096c  0bc0             or ax, ax                                
  096e  75b9             jne 0x929                                
  0970  8bc6             mov ax, si                               
  0972  d1e0             shl ax, 1                                
  0974  c45e06           les bx, ptr [bp + 6]                     
  0977  03d8             add bx, ax                               
  0979  8b46fa           mov ax, word ptr [bp - 6]                
  097c  2689879001       mov word ptr es:[bx + 0x190], ax         
  0981  8bc6             mov ax, si                               
  0983  4e               dec si                                   
  0984  0bc0             or ax, ax                                
  0986  7590             jne 0x918                                
  0988  8b760a           mov si, word ptr [bp + 0xa]              
  098b  eb76             jmp 0xa03                                
  098d  c746fa1027       mov word ptr [bp - 6], 0x2710            
  0992  8bc6             mov ax, si                               
  0994  d1e0             shl ax, 1                                
  0996  c45e06           les bx, ptr [bp + 6]                     
  0999  03d8             add bx, ax                               
  099b  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  09a1  7560             jne 0xa03                                
  09a3  8b7e0a           mov di, word ptr [bp + 0xa]              
  09a6  eb43             jmp 0x9eb                                
  09a8  8bc7             mov ax, di                               
  09aa  d1e0             shl ax, 1                                
  09ac  c45e06           les bx, ptr [bp + 6]                     
  09af  03d8             add bx, ax                               
  09b1  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  09b7  7432             je 0x9eb                                 
  09b9  8bc7             mov ax, di                               
  09bb  d1e0             shl ax, 1                                
  09bd  c45e06           les bx, ptr [bp + 6]                     
  09c0  03d8             add bx, ax                               
  09c2  26ff7764         push word ptr es:[bx + 0x64]             
  09c6  26ff37           push word ptr es:[bx]                    
  09c9  8bc6             mov ax, si                               
  09cb  d1e0             shl ax, 1                                
  09cd  8b5e06           mov bx, word ptr [bp + 6]                
  09d0  03d8             add bx, ax                               
  09d2  26ff7764         push word ptr es:[bx + 0x64]             
  09d6  26ff37           push word ptr es:[bx]                    
  09d9  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  09de  83c408           add sp, 8                                
  09e1  8bd0             mov dx, ax                               
  09e3  3b56fa           cmp dx, word ptr [bp - 6]                
  09e6  7d03             jge 0x9eb                                
  09e8  8956fa           mov word ptr [bp - 6], dx                
  09eb  8bc7             mov ax, di                               
  09ed  4f               dec di                                   
  09ee  0bc0             or ax, ax                                
  09f0  75b6             jne 0x9a8                                
  09f2  8bc6             mov ax, si                               
  09f4  d1e0             shl ax, 1                                
  09f6  c45e06           les bx, ptr [bp + 6]                     
  09f9  03d8             add bx, ax                               
  09fb  8b46fa           mov ax, word ptr [bp - 6]                
  09fe  268987f401       mov word ptr es:[bx + 0x1f4], ax         
  0a03  8bc6             mov ax, si                               
  0a05  4e               dec si                                   
  0a06  0bc0             or ax, ax                                
  0a08  7583             jne 0x98d                                
  0a0a  8b760a           mov si, word ptr [bp + 0xa]              
  0a0d  eb62             jmp 0xa71                                
  0a0f  8bc6             mov ax, si                               
  0a11  d1e0             shl ax, 1                                
  0a13  c45e06           les bx, ptr [bp + 6]                     
  0a16  03d8             add bx, ax                               
  0a18  2683bf2c0100     cmp word ptr es:[bx + 0x12c], 0          
  0a1e  7551             jne 0xa71                                
  0a20  2683bff4010a     cmp word ptr es:[bx + 0x1f4], 0xa        
  0a26  7c49             jl 0xa71                                 
  0a28  66680f000100     push 0x1000f                             
  0a2e  6a01             push 1                                   
  0a30  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0a35  83c406           add sp, 6                                
  0a38  50               push ax                                  
  0a39  8bc6             mov ax, si                               
  0a3b  d1e0             shl ax, 1                                
  0a3d  c45e06           les bx, ptr [bp + 6]                     
  0a40  03d8             add bx, ax                               
  0a42  b81e00           mov ax, 0x1e                             
  0a45  262b879001       sub ax, word ptr es:[bx + 0x190]         
  0a4a  7d04             jge 0xa50                                
  0a4c  33c0             xor ax, ax                               
  0a4e  eb11             jmp 0xa61                                
  0a50  8bc6             mov ax, si                               
  0a52  d1e0             shl ax, 1                                
  0a54  c45e06           les bx, ptr [bp + 6]                     
  0a57  03d8             add bx, ax                               
  0a59  b81e00           mov ax, 0x1e                             
  0a5c  262b879001       sub ax, word ptr es:[bx + 0x190]         
  0a61  5a               pop dx                                   
  0a62  03c2             add ax, dx                               
  0a64  8bd0             mov dx, ax                               
  0a66  3b56fc           cmp dx, word ptr [bp - 4]                
  0a69  7e06             jle 0xa71                                
  0a6b  8956fc           mov word ptr [bp - 4], dx                
  0a6e  8976fe           mov word ptr [bp - 2], si                
  0a71  8bc6             mov ax, si                               
  0a73  4e               dec si                                   
  0a74  0bc0             or ax, ax                                
  0a76  7597             jne 0xa0f                                
  0a78  8b46fe           mov ax, word ptr [bp - 2]                
  0a7b  5f               pop di                                   
  0a7c  5e               pop si                                   
  0a7d  c9               leave                                    
  0a7e  cb               retf                                     

ovl12_0a7f:  ; ENTRY
  0a7f  55               push bp                                  
  0a80  8bec             mov bp, sp                               
  0a82  8b5606           mov dx, word ptr [bp + 6]                
  0a85  8b4e08           mov cx, word ptr [bp + 8]                
  0a88  8bc1             mov ax, cx                               
  0a8a  6bc070           imul ax, ax, 0x70                        
  0a8d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0a91  03d8             add bx, ax                               
  0a93  03da             add bx, dx                               
  0a95  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0a9b  742a             je 0xac7                                 
  0a9d  8bc1             mov ax, cx                               
  0a9f  6bc070           imul ax, ax, 0x70                        
  0aa2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0aa6  03d8             add bx, ax                               
  0aa8  03da             add bx, dx                               
  0aaa  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  0ab0  7415             je 0xac7                                 
  0ab2  8bc1             mov ax, cx                               
  0ab4  6bc070           imul ax, ax, 0x70                        
  0ab7  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0abb  03d8             add bx, ax                               
  0abd  03da             add bx, dx                               
  0abf  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0ac5  7505             jne 0xacc                                
  0ac7  b80100           mov ax, 1                                
  0aca  eb02             jmp 0xace                                
  0acc  33c0             xor ax, ax                               
  0ace  5d               pop bp                                   
  0acf  cb               retf                                     

ovl12_0ad0:  ; ENTRY
  0ad0  55               push bp                                  
  0ad1  8bec             mov bp, sp                               
  0ad3  83ec02           sub sp, 2                                
  0ad6  56               push si                                  
  0ad7  be0800           mov si, 8                                
  0ada  e99a00           jmp 0xb77                                
  0add  66680c00ffff     push 0xffff000c                          
  0ae3  6a01             push 1                                   
  0ae5  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0aea  83c406           add sp, 6                                
  0aed  8946fe           mov word ptr [bp - 2], ax                
  0af0  8b5efe           mov bx, word ptr [bp - 2]                
  0af3  c1e302           shl bx, 2                                
  0af6  668b878203       mov eax, dword ptr [bx + 0x382]          
  0afb  c45e0a           les bx, ptr [bp + 0xa]                   
  0afe  66268907         mov dword ptr es:[bx], eax               
  0b02  8b4606           mov ax, word ptr [bp + 6]                
  0b05  260107           add word ptr es:[bx], ax                 
  0b08  8b4608           mov ax, word ptr [bp + 8]                
  0b0b  26014702         add word ptr es:[bx + 2], ax             
  0b0f  268b4702         mov ax, word ptr es:[bx + 2]             
  0b13  6bc070           imul ax, ax, 0x70                        
  0b16  c4168a3f         les dx, ptr [0x3f8a]                     
  0b1a  03d0             add dx, ax                               
  0b1c  06               push es                                  
  0b1d  8e460c           mov es, word ptr [bp + 0xc]              
  0b20  260317           add dx, word ptr es:[bx]                 
  0b23  8bda             mov bx, dx                               
  0b25  07               pop es                                   
  0b26  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0b2c  7444             je 0xb72                                 
  0b2e  c45e0a           les bx, ptr [bp + 0xa]                   
  0b31  268b4702         mov ax, word ptr es:[bx + 2]             
  0b35  6bc070           imul ax, ax, 0x70                        
  0b38  c4168a3f         les dx, ptr [0x3f8a]                     
  0b3c  03d0             add dx, ax                               
  0b3e  06               push es                                  
  0b3f  8e460c           mov es, word ptr [bp + 0xc]              
  0b42  260317           add dx, word ptr es:[bx]                 
  0b45  8bda             mov bx, dx                               
  0b47  07               pop es                                   
  0b48  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  0b4e  7422             je 0xb72                                 
  0b50  c45e0a           les bx, ptr [bp + 0xa]                   
  0b53  268b4702         mov ax, word ptr es:[bx + 2]             
  0b57  6bc070           imul ax, ax, 0x70                        
  0b5a  c4168a3f         les dx, ptr [0x3f8a]                     
  0b5e  03d0             add dx, ax                               
  0b60  06               push es                                  
  0b61  8e460c           mov es, word ptr [bp + 0xc]              
  0b64  260317           add dx, word ptr es:[bx]                 
  0b67  8bda             mov bx, dx                               
  0b69  07               pop es                                   
  0b6a  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0b70  7505             jne 0xb77                                
  0b72  b80100           mov ax, 1                                
  0b75  eb0c             jmp 0xb83                                
  0b77  8bc6             mov ax, si                               
  0b79  4e               dec si                                   
  0b7a  0bc0             or ax, ax                                
  0b7c  7403             je 0xb81                                 
  0b7e  e95cff           jmp 0xadd                                
  0b81  33c0             xor ax, ax                               
  0b83  5e               pop si                                   
  0b84  c9               leave                                    
  0b85  cb               retf                                     

ovl12_0b86:  ; ENTRY
  0b86  55               push bp                                  
  0b87  8bec             mov bp, sp                               
  0b89  83ec08           sub sp, 8                                
  0b8c  56               push si                                  
  0b8d  8b560a           mov dx, word ptr [bp + 0xa]              
  0b90  8b760c           mov si, word ptr [bp + 0xc]              
  0b93  16               push ss                                  
  0b94  8d46fc           lea ax, [bp - 4]                         
  0b97  50               push ax                                  
  0b98  8bda             mov bx, dx                               
  0b9a  6bdb41           imul bx, bx, 0x41                        
  0b9d  b8042c           mov ax, 0x2c04                           
  0ba0  8ec0             mov es, ax                               
  0ba2  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0ba7  8bda             mov bx, dx                               
  0ba9  6bdb41           imul bx, bx, 0x41                        
  0bac  b8042c           mov ax, 0x2c04                           
  0baf  8ec0             mov es, ax                               
  0bb1  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0bb6  0e               push cs                                  
  0bb7  e816ff           call 0xad0                               
  0bba  83c408           add sp, 8                                
  0bbd  0bc0             or ax, ax                                
  0bbf  742e             je 0xbef                                 
  0bc1  16               push ss                                  
  0bc2  8d46f8           lea ax, [bp - 8]                         
  0bc5  50               push ax                                  
  0bc6  8bde             mov bx, si                               
  0bc8  6bdb41           imul bx, bx, 0x41                        
  0bcb  b8042c           mov ax, 0x2c04                           
  0bce  8ec0             mov es, ax                               
  0bd0  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0bd5  8bde             mov bx, si                               
  0bd7  6bdb41           imul bx, bx, 0x41                        
  0bda  b8042c           mov ax, 0x2c04                           
  0bdd  8ec0             mov es, ax                               
  0bdf  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0be4  0e               push cs                                  
  0be5  e8e8fe           call 0xad0                               
  0be8  83c408           add sp, 8                                
  0beb  0bc0             or ax, ax                                
  0bed  7504             jne 0xbf3                                
  0bef  33c0             xor ax, ax                               
  0bf1  eb26             jmp 0xc19                                
  0bf3  8b46fc           mov ax, word ptr [bp - 4]                
  0bf6  3b46f8           cmp ax, word ptr [bp - 8]                
  0bf9  7508             jne 0xc03                                
  0bfb  8b46fe           mov ax, word ptr [bp - 2]                
  0bfe  3b46fa           cmp ax, word ptr [bp - 6]                
  0c01  74ec             je 0xbef                                 
  0c03  6a00             push 0                                   
  0c05  66ff76f8         push dword ptr [bp - 8]                  
  0c09  66ff76fc         push dword ptr [bp - 4]                  
  0c0d  66ff7606         push dword ptr [bp + 6]                  
  0c11  90               nop                                      
  0c12  0e               push cs                                  
  0c13  e80600           call 0xc1c                               
  0c16  83c40e           add sp, 0xe                              
  0c19  5e               pop si                                   
  0c1a  c9               leave                                    
  0c1b  cb               retf                                     

ovl12_0c1c:  ; ENTRY
  0c1c  55               push bp                                  
  0c1d  8bec             mov bp, sp                               
  0c1f  81ecdc00         sub sp, 0xdc                             
  0c23  56               push si                                  
  0c24  57               push di                                  
  0c25  8b760a           mov si, word ptr [bp + 0xa]              
  0c28  33ff             xor di, di                               
  0c2a  8976ec           mov word ptr [bp - 0x14], si             
  0c2d  8b460c           mov ax, word ptr [bp + 0xc]              
  0c30  8946ee           mov word ptr [bp - 0x12], ax             
  0c33  8b460e           mov ax, word ptr [bp + 0xe]              
  0c36  8946f0           mov word ptr [bp - 0x10], ax             
  0c39  8b4610           mov ax, word ptr [bp + 0x10]             
  0c3c  8946f2           mov word ptr [bp - 0xe], ax              
  0c3f  8d8624ff         lea ax, [bp - 0xdc]                      
  0c43  8c56fa           mov word ptr [bp - 6], ss                
  0c46  8946f8           mov word ptr [bp - 8], ax                
  0c49  c746f60100       mov word ptr [bp - 0xa], 1               
  0c4e  c746f40000       mov word ptr [bp - 0xc], 0               
  0c53  16               push ss                                  
  0c54  8d46ec           lea ax, [bp - 0x14]                      
  0c57  50               push ax                                  
  0c58  9a0a005505       lcall 0x555, 0xa                         -> 0555:000a
  0c5d  83c404           add sp, 4                                
  0c60  0bc0             or ax, ax                                
  0c62  7505             jne 0xc69                                
  0c64  33c0             xor ax, ax                               
  0c66  e9b501           jmp 0xe1e                                
  0c69  8976fe           mov word ptr [bp - 2], si                
  0c6c  8b460c           mov ax, word ptr [bp + 0xc]              
  0c6f  8946fc           mov word ptr [bp - 4], ax                
  0c72  33f6             xor si, si                               
  0c74  e99b01           jmp 0xe12                                
  0c77  47               inc di                                   
  0c78  8b46fe           mov ax, word ptr [bp - 2]                
  0c7b  3b460e           cmp ax, word ptr [bp + 0xe]              
  0c7e  750b             jne 0xc8b                                
  0c80  8b46fc           mov ax, word ptr [bp - 4]                
  0c83  3b4610           cmp ax, word ptr [bp + 0x10]             
  0c86  7503             jne 0xc8b                                
  0c88  e99001           jmp 0xe1b                                
  0c8b  8a8224ff         mov al, byte ptr [bp + si - 0xdc]        
  0c8f  b400             mov ah, 0                                
  0c91  8bd0             mov dx, ax                               
  0c93  81faff00         cmp dx, 0xff                             
  0c97  7503             jne 0xc9c                                
  0c99  e97f01           jmp 0xe1b                                
  0c9c  52               push dx                                  
  0c9d  16               push ss                                  
  0c9e  8d46fc           lea ax, [bp - 4]                         
  0ca1  50               push ax                                  
  0ca2  16               push ss                                  
  0ca3  8d46fe           lea ax, [bp - 2]                         
  0ca6  50               push ax                                  
  0ca7  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  0cac  83c40a           add sp, 0xa                              
  0caf  0bc0             or ax, ax                                
  0cb1  7503             jne 0xcb6                                
  0cb3  e96501           jmp 0xe1b                                
  0cb6  8b5efc           mov bx, word ptr [bp - 4]                
  0cb9  6bdb70           imul bx, bx, 0x70                        
  0cbc  035efe           add bx, word ptr [bp - 2]                
  0cbf  b8d919           mov ax, 0x19d9                           
  0cc2  8ec0             mov es, ax                               
  0cc4  268a870000       mov al, byte ptr es:[bx]                 
  0cc9  251f00           and ax, 0x1f                             
  0ccc  0bc0             or ax, ax                                
  0cce  7409             je 0xcd9                                 
  0cd0  837e1200         cmp word ptr [bp + 0x12], 0              
  0cd4  7403             je 0xcd9                                 
  0cd6  e94201           jmp 0xe1b                                
  0cd9  8b46fc           mov ax, word ptr [bp - 4]                
  0cdc  6bc070           imul ax, ax, 0x70                        
  0cdf  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ce3  03d8             add bx, ax                               
  0ce5  035efe           add bx, word ptr [bp - 2]                
  0ce8  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  0cee  742e             je 0xd1e                                 
  0cf0  8b46fc           mov ax, word ptr [bp - 4]                
  0cf3  6bc070           imul ax, ax, 0x70                        
  0cf6  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0cfa  03d8             add bx, ax                               
  0cfc  035efe           add bx, word ptr [bp - 2]                
  0cff  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0d05  7417             je 0xd1e                                 
  0d07  8b46fc           mov ax, word ptr [bp - 4]                
  0d0a  6bc070           imul ax, ax, 0x70                        
  0d0d  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0d11  03d8             add bx, ax                               
  0d13  035efe           add bx, word ptr [bp - 2]                
  0d16  2680bf206101     cmp byte ptr es:[bx + 0x6120], 1         
  0d1c  756d             jne 0xd8b                                
  0d1e  8b5efc           mov bx, word ptr [bp - 4]                
  0d21  69dbe000         imul bx, bx, 0xe0                        
  0d25  8b46fe           mov ax, word ptr [bp - 2]                
  0d28  d1e0             shl ax, 1                                
  0d2a  03d8             add bx, ax                               
  0d2c  b81d1e           mov ax, 0x1e1d                           
  0d2f  8ec0             mov es, ax                               
  0d31  268a9f0000       mov bl, byte ptr es:[bx]                 
  0d36  81e3ff00         and bx, 0xff                             
  0d3a  b8042c           mov ax, 0x2c04                           
  0d3d  8ec0             mov es, ax                               
  0d3f  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0d44  98               cwde                                     
  0d45  8bd0             mov dx, ax                               
  0d47  83fa03           cmp dx, 3                                
  0d4a  743f             je 0xd8b                                 
  0d4c  83fa02           cmp dx, 2                                
  0d4f  743a             je 0xd8b                                 
  0d51  83fa01           cmp dx, 1                                
  0d54  7435             je 0xd8b                                 
  0d56  b8042c           mov ax, 0x2c04                           
  0d59  8b56fe           mov dx, word ptr [bp - 2]                
  0d5c  8ec0             mov es, ax                               
  0d5e  2689167d01       mov word ptr es:[0x17d], dx              
  0d63  8b56fc           mov dx, word ptr [bp - 4]                
  0d66  8ec0             mov es, ax                               
  0d68  2689167f01       mov word ptr es:[0x17f], dx              
  0d6d  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0d72  666801000f00     push 0xf0001                             
  0d78  ff76fc           push word ptr [bp - 4]                   
  0d7b  ff76fe           push word ptr [bp - 2]                   
  0d7e  9a20007b07       lcall 0x77b, 0x20                        -> 077b:0020
  0d83  83c408           add sp, 8                                
  0d86  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  0d8b  8b46fc           mov ax, word ptr [bp - 4]                
  0d8e  6bc070           imul ax, ax, 0x70                        
  0d91  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d95  03d8             add bx, ax                               
  0d97  035efe           add bx, word ptr [bp - 2]                
  0d9a  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  0da0  7456             je 0xdf8                                 
  0da2  8b46fc           mov ax, word ptr [bp - 4]                
  0da5  6bc070           imul ax, ax, 0x70                        
  0da8  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0dac  03d8             add bx, ax                               
  0dae  035efe           add bx, word ptr [bp - 2]                
  0db1  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0db7  743f             je 0xdf8                                 
  0db9  8b46fc           mov ax, word ptr [bp - 4]                
  0dbc  6bc070           imul ax, ax, 0x70                        
  0dbf  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0dc3  03d8             add bx, ax                               
  0dc5  035efe           add bx, word ptr [bp - 2]                
  0dc8  2680bf206101     cmp byte ptr es:[bx + 0x6120], 1         
  0dce  7428             je 0xdf8                                 
  0dd0  8b5efc           mov bx, word ptr [bp - 4]                
  0dd3  6bdb70           imul bx, bx, 0x70                        
  0dd6  035efe           add bx, word ptr [bp - 2]                
  0dd9  b8d919           mov ax, 0x19d9                           
  0ddc  8ec0             mov es, ax                               
  0dde  2680a70000e0     and byte ptr es:[bx], 0xe0               
  0de4  26808f000001     or byte ptr es:[bx], 1                   
  0dea  ff76fc           push word ptr [bp - 4]                   
  0ded  ff76fe           push word ptr [bp - 2]                   
  0df0  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0df5  83c404           add sp, 4                                
  0df8  83ff05           cmp di, 5                                
  0dfb  7e14             jle 0xe11                                
  0dfd  33ff             xor di, di                               
  0dff  ff76fc           push word ptr [bp - 4]                   
  0e02  ff76fe           push word ptr [bp - 2]                   
  0e05  66ff7606         push dword ptr [bp + 6]                  
  0e09  90               nop                                      
  0e0a  0e               push cs                                  
  0e0b  e83d01           call 0xf4b                               
  0e0e  83c408           add sp, 8                                
  0e11  46               inc si                                   
  0e12  81fec800         cmp si, 0xc8                              ; "Quest"
  0e16  7d03             jge 0xe1b                                
  0e18  e95cfe           jmp 0xc77                                
  0e1b  b80100           mov ax, 1                                
  0e1e  5f               pop di                                   
  0e1f  5e               pop si                                   
  0e20  c9               leave                                    
  0e21  cb               retf                                     

ovl12_0e22:  ; ENTRY
  0e22  55               push bp                                  
  0e23  8bec             mov bp, sp                               
  0e25  83ec08           sub sp, 8                                
  0e28  56               push si                                  
  0e29  57               push di                                  
  0e2a  bfffff           mov di, 0xffff                           
  0e2d  be5000           mov si, 0x50                             
  0e30  eb2b             jmp 0xe5d                                
  0e32  6aff             push -1                                  
  0e34  b8042c           mov ax, 0x2c04                           
  0e37  8ec0             mov es, ax                               
  0e39  26ff367b15       push word ptr es:[0x157b]                
  0e3e  6a01             push 1                                   
  0e40  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e45  83c406           add sp, 6                                
  0e48  8bd0             mov dx, ax                               
  0e4a  c45e06           les bx, ptr [bp + 6]                     
  0e4d  03da             add bx, dx                               
  0e4f  268a875802       mov al, byte ptr es:[bx + 0x258]         
  0e54  98               cwde                                     
  0e55  0bc0             or ax, ax                                
  0e57  7504             jne 0xe5d                                
  0e59  8bfa             mov di, dx                               
  0e5b  eb07             jmp 0xe64                                
  0e5d  8bc6             mov ax, si                               
  0e5f  4e               dec si                                   
  0e60  0bc0             or ax, ax                                
  0e62  75ce             jne 0xe32                                
  0e64  83ffff           cmp di, -1                               
  0e67  7505             jne 0xe6e                                
  0e69  33c0             xor ax, ax                               
  0e6b  e9d900           jmp 0xf47                                
  0e6e  c45e06           les bx, ptr [bp + 6]                     
  0e71  03df             add bx, di                               
  0e73  26c687580201     mov byte ptr es:[bx + 0x258], 1          
  0e79  8bdf             mov bx, di                               
  0e7b  6bdb41           imul bx, bx, 0x41                        
  0e7e  b8042c           mov ax, 0x2c04                           
  0e81  8ec0             mov es, ax                               
  0e83  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0e88  8946fa           mov word ptr [bp - 6], ax                
  0e8b  8bdf             mov bx, di                               
  0e8d  6bdb41           imul bx, bx, 0x41                        
  0e90  b8042c           mov ax, 0x2c04                           
  0e93  8ec0             mov es, ax                               
  0e95  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0e9a  8946f8           mov word ptr [bp - 8], ax                
  0e9d  b8ffff           mov ax, 0xffff                           
  0ea0  8946fc           mov word ptr [bp - 4], ax                
  0ea3  8946fe           mov word ptr [bp - 2], ax                
  0ea6  b8042c           mov ax, 0x2c04                           
  0ea9  8ec0             mov es, ax                               
  0eab  268b367b15       mov si, word ptr es:[0x157b]             
  0eb0  eb64             jmp 0xf16                                
  0eb2  c45e06           les bx, ptr [bp + 6]                     
  0eb5  03de             add bx, si                               
  0eb7  268a875802       mov al, byte ptr es:[bx + 0x258]         
  0ebc  98               cwde                                     
  0ebd  0bc0             or ax, ax                                
  0ebf  7555             jne 0xf16                                
  0ec1  8bde             mov bx, si                               
  0ec3  6bdb41           imul bx, bx, 0x41                        
  0ec6  b8042c           mov ax, 0x2c04                           
  0ec9  8ec0             mov es, ax                               
  0ecb  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0ed0  8bde             mov bx, si                               
  0ed2  6bdb41           imul bx, bx, 0x41                        
  0ed5  b8042c           mov ax, 0x2c04                           
  0ed8  8ec0             mov es, ax                               
  0eda  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0edf  ff76f8           push word ptr [bp - 8]                   
  0ee2  ff76fa           push word ptr [bp - 6]                   
  0ee5  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0eea  83c408           add sp, 8                                
  0eed  8bd0             mov dx, ax                               
  0eef  83fa1e           cmp dx, 0x1e                             
  0ef2  7c22             jl 0xf16                                 
  0ef4  83fa46           cmp dx, 0x46                             
  0ef7  7f1d             jg 0xf16                                 
  0ef9  6668e8030000     push 0x3e8                               
  0eff  6a01             push 1                                   
  0f01  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f06  83c406           add sp, 6                                
  0f09  8bd0             mov dx, ax                               
  0f0b  3b56fe           cmp dx, word ptr [bp - 2]                
  0f0e  7e06             jle 0xf16                                
  0f10  8956fe           mov word ptr [bp - 2], dx                
  0f13  8976fc           mov word ptr [bp - 4], si                
  0f16  8bc6             mov ax, si                               
  0f18  4e               dec si                                   
  0f19  0bc0             or ax, ax                                
  0f1b  7595             jne 0xeb2                                
  0f1d  837efcff         cmp word ptr [bp - 4], -1                
  0f21  7503             jne 0xf26                                
  0f23  e904ff           jmp 0xe2a                                
  0f26  c45e06           les bx, ptr [bp + 6]                     
  0f29  035efc           add bx, word ptr [bp - 4]                
  0f2c  26c687580201     mov byte ptr es:[bx + 0x258], 1          
  0f32  c45e0a           les bx, ptr [bp + 0xa]                   
  0f35  26893f           mov word ptr es:[bx], di                 
  0f38  c45e0e           les bx, ptr [bp + 0xe]                   
  0f3b  8b46fc           mov ax, word ptr [bp - 4]                
  0f3e  268907           mov word ptr es:[bx], ax                 
  0f41  b80100           mov ax, 1                                
  0f44  e924ff           jmp 0xe6b                                
  0f47  5f               pop di                                   
  0f48  5e               pop si                                   
  0f49  c9               leave                                    
  0f4a  cb               retf                                     

ovl12_0f4b:  ; ENTRY
  0f4b  55               push bp                                  
  0f4c  8bec             mov bp, sp                               
  0f4e  56               push si                                  
  0f4f  b8042c           mov ax, 0x2c04                           
  0f52  8ec0             mov es, ax                               
  0f54  268b367b15       mov si, word ptr es:[0x157b]             
  0f59  eb3c             jmp 0xf97                                
  0f5b  8bde             mov bx, si                               
  0f5d  6bdb41           imul bx, bx, 0x41                        
  0f60  b8042c           mov ax, 0x2c04                           
  0f63  8ec0             mov es, ax                               
  0f65  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0f6a  8bde             mov bx, si                               
  0f6c  6bdb41           imul bx, bx, 0x41                        
  0f6f  b8042c           mov ax, 0x2c04                           
  0f72  8ec0             mov es, ax                               
  0f74  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0f79  ff760c           push word ptr [bp + 0xc]                 
  0f7c  ff760a           push word ptr [bp + 0xa]                 
  0f7f  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0f84  83c408           add sp, 8                                
  0f87  3d0a00           cmp ax, 0xa                              
  0f8a  7d0b             jge 0xf97                                
  0f8c  c45e06           les bx, ptr [bp + 6]                     
  0f8f  03de             add bx, si                               
  0f91  26c687580201     mov byte ptr es:[bx + 0x258], 1          
  0f97  8bc6             mov ax, si                               
  0f99  4e               dec si                                   
  0f9a  0bc0             or ax, ax                                
  0f9c  75bd             jne 0xf5b                                
  0f9e  5e               pop si                                   
  0f9f  5d               pop bp                                   
  0fa0  cb               retf                                     
