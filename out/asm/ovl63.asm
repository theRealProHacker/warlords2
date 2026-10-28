; ovl63 stub 30f2 file_off 0x799f0 size 0x2c4a

ovl63_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec12           sub sp, 0x12                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7e06           mov di, word ptr [bp + 6]                
  000b  b8042c           mov ax, 0x2c04                           
  000e  8ec0             mov es, ax                               
  0010  26833e240100     cmp word ptr es:[0x124], 0               
  0016  742d             je 0x45                                  
  0018  8ec0             mov es, ax                               
  001a  268b1e1001       mov bx, word ptr es:[0x110]              
  001f  d1e3             shl bx, 1                                
  0021  b8042c           mov ax, 0x2c04                           
  0024  8ec0             mov es, ax                               
  0026  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  002c  7417             je 0x45                                  
  002e  b8042c           mov ax, 0x2c04                           
  0031  8ec0             mov es, ax                               
  0033  26833e590100     cmp word ptr es:[0x159], 0               
  0039  750a             jne 0x45                                 
  003b  833e282d00       cmp word ptr [0x2d28], 0                 
  0040  7503             jne 0x45                                 
  0042  e98a04           jmp 0x4cf                                
  0045  b8042c           mov ax, 0x2c04                           
  0048  8ec0             mov es, ax                               
  004a  26833e240100     cmp word ptr es:[0x124], 0               
  0050  7439             je 0x8b                                  
  0052  8ec0             mov es, ax                               
  0054  268b1e1001       mov bx, word ptr es:[0x110]              
  0059  d1e3             shl bx, 1                                
  005b  b8042c           mov ax, 0x2c04                           
  005e  8ec0             mov es, ax                               
  0060  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0066  7423             je 0x8b                                  
  0068  b8042c           mov ax, 0x2c04                           
  006b  8ec0             mov es, ax                               
  006d  26833e590100     cmp word ptr es:[0x159], 0               
  0073  7416             je 0x8b                                  
  0075  833e543200       cmp word ptr [0x3254], 0                 
  007a  740f             je 0x8b                                  
  007c  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  0081  7408             je 0x8b                                  
  0083  9a2f000831       lcall 0x3108, 0x2f                       -> ovl65:0698
  0088  e94404           jmp 0x4cf                                
  008b  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  0090  7416             je 0xa8                                  
  0092  c45e0a           les bx, ptr [bp + 0xa]                   
  0095  26837f0408       cmp word ptr es:[bx + 4], 8              
  009a  7f0c             jg 0xa8                                  
  009c  26837f0608       cmp word ptr es:[bx + 6], 8              
  00a1  7f05             jg 0xa8                                  
  00a3  b80100           mov ax, 1                                
  00a6  eb02             jmp 0xaa                                 
  00a8  33c0             xor ax, ax                               
  00aa  8bf0             mov si, ax                               
  00ac  803e1e2d00       cmp byte ptr [0x2d1e], 0                 
  00b1  751e             jne 0xd1                                 
  00b3  1e               push ds                                  
  00b4  68ea2c           push 0x2cea                              
  00b7  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  00bc  83c404           add sp, 4                                
  00bf  666820002000     push 0x200020                            
  00c5  1e               push ds                                  
  00c6  68ea2c           push 0x2cea                              
  00c9  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  00ce  83c408           add sp, 8                                
  00d1  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  00d6  7522             jne 0xfa                                 
  00d8  8d46f0           lea ax, [bp - 0x10]                      
  00db  16               push ss                                  
  00dc  50               push ax                                  
  00dd  1e               push ds                                  
  00de  68882a           push 0x2a88                              
  00e1  b90800           mov cx, 8                                
  00e4  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  00e9  666870009c00     push 0x9c0070                            
  00ef  666a00           push 0                                   
  00f2  16               push ss                                  
  00f3  8d46f8           lea ax, [bp - 8]                         
  00f6  50               push ax                                  
  00f7  e9e801           jmp 0x2e2                                
  00fa  8d46f8           lea ax, [bp - 8]                         
  00fd  16               push ss                                  
  00fe  50               push ax                                  
  00ff  66ff760a         push dword ptr [bp + 0xa]                
  0103  b90800           mov cx, 8                                
  0106  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  010b  c45e0a           les bx, ptr [bp + 0xa]                   
  010e  268b07           mov ax, word ptr es:[bx]                 
  0111  d1e0             shl ax, 1                                
  0113  8946f0           mov word ptr [bp - 0x10], ax             
  0116  268b4702         mov ax, word ptr es:[bx + 2]             
  011a  d1e0             shl ax, 1                                
  011c  8946f2           mov word ptr [bp - 0xe], ax              
  011f  268b4704         mov ax, word ptr es:[bx + 4]             
  0123  d1e0             shl ax, 1                                
  0125  8946f4           mov word ptr [bp - 0xc], ax              
  0128  268b4706         mov ax, word ptr es:[bx + 6]             
  012c  d1e0             shl ax, 1                                
  012e  8946f6           mov word ptr [bp - 0xa], ax              
  0131  8b46f0           mov ax, word ptr [bp - 0x10]             
  0134  bb1000           mov bx, 0x10                             
  0137  99               cdq                                      
  0138  f7fb             idiv bx                                  
  013a  c1e004           shl ax, 4                                
  013d  8946f0           mov word ptr [bp - 0x10], ax             
  0140  8b46f4           mov ax, word ptr [bp - 0xc]              
  0143  48               dec ax                                   
  0144  99               cdq                                      
  0145  f7fb             idiv bx                                  
  0147  40               inc ax                                   
  0148  c1e004           shl ax, 4                                
  014b  8946f4           mov word ptr [bp - 0xc], ax              
  014e  0bf6             or si, si                                
  0150  7503             jne 0x155                                
  0152  e99501           jmp 0x2ea                                
  0155  1e               push ds                                  
  0156  68ba5e           push 0x5eba                              
  0159  66ff760a         push dword ptr [bp + 0xa]                
  015d  b90800           mov cx, 8                                
  0160  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0165  1e               push ds                                  
  0166  68b25e           push 0x5eb2                              
  0169  66ff760a         push dword ptr [bp + 0xa]                
  016d  b90800           mov cx, 8                                
  0170  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0175  a1b25e           mov ax, word ptr [0x5eb2]                
  0178  c1f802           sar ax, 2                                
  017b  c1e002           shl ax, 2                                
  017e  a3b25e           mov word ptr [0x5eb2], ax                
  0181  a1b65e           mov ax, word ptr [0x5eb6]                
  0184  48               dec ax                                   
  0185  c1f803           sar ax, 3                                
  0188  40               inc ax                                   
  0189  c1e003           shl ax, 3                                
  018c  a3b65e           mov word ptr [0x5eb6], ax                
  018f  833eb25e00       cmp word ptr [0x5eb2], 0                 
  0194  7d0c             jge 0x1a2                                
  0196  c706b25e0000     mov word ptr [0x5eb2], 0                 
  019c  c706b65e0800     mov word ptr [0x5eb6], 8                 
  01a2  833eb45e00       cmp word ptr [0x5eb4], 0                 
  01a7  7d0c             jge 0x1b5                                
  01a9  c706b45e0000     mov word ptr [0x5eb4], 0                 
  01af  c706b85e0800     mov word ptr [0x5eb8], 8                 
  01b5  a1b25e           mov ax, word ptr [0x5eb2]                
  01b8  0306b65e         add ax, word ptr [0x5eb6]                
  01bc  3d7000           cmp ax, 0x70                             
  01bf  7e0c             jle 0x1cd                                
  01c1  c706b25e6800     mov word ptr [0x5eb2], 0x68              
  01c7  c706b65e0800     mov word ptr [0x5eb6], 8                 
  01cd  a1b45e           mov ax, word ptr [0x5eb4]                
  01d0  0306b85e         add ax, word ptr [0x5eb8]                
  01d4  3d9c00           cmp ax, 0x9c                             
  01d7  7e0c             jle 0x1e5                                
  01d9  c706b45e9400     mov word ptr [0x5eb4], 0x94              
  01df  c706b85e0800     mov word ptr [0x5eb8], 8                 
  01e5  1e               push ds                                  
  01e6  68aa5e           push 0x5eaa                              
  01e9  1e               push ds                                  
  01ea  68b25e           push 0x5eb2                              
  01ed  b90800           mov cx, 8                                
  01f0  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  01f5  832eaa5e04       sub word ptr [0x5eaa], 4                 
  01fa  832eac5e04       sub word ptr [0x5eac], 4                 
  01ff  8306ae5e08       add word ptr [0x5eae], 8                 
  0204  8306b05e08       add word ptr [0x5eb0], 8                 
  0209  833eaa5e00       cmp word ptr [0x5eaa], 0                 
  020e  7d06             jge 0x216                                
  0210  c706aa5e0000     mov word ptr [0x5eaa], 0                 
  0216  833eac5e00       cmp word ptr [0x5eac], 0                 
  021b  7d06             jge 0x223                                
  021d  c706ac5e0000     mov word ptr [0x5eac], 0                 
  0223  a1aa5e           mov ax, word ptr [0x5eaa]                
  0226  0306ae5e         add ax, word ptr [0x5eae]                
  022a  3d7000           cmp ax, 0x70                             
  022d  7e0c             jle 0x23b                                
  022f  c706aa5e6000     mov word ptr [0x5eaa], 0x60              
  0235  c706ae5e1000     mov word ptr [0x5eae], 0x10              
  023b  a1ac5e           mov ax, word ptr [0x5eac]                
  023e  0306b05e         add ax, word ptr [0x5eb0]                
  0242  3d9c00           cmp ax, 0x9c                             
  0245  7e0c             jle 0x253                                
  0247  c706ac5e8c00     mov word ptr [0x5eac], 0x8c              
  024d  c706b05e1000     mov word ptr [0x5eb0], 0x10              
  0253  a1b85e           mov ax, word ptr [0x5eb8]                
  0256  d1e0             shl ax, 1                                
  0258  50               push ax                                  
  0259  a1b65e           mov ax, word ptr [0x5eb6]                
  025c  d1e0             shl ax, 1                                
  025e  50               push ax                                  
  025f  a1b45e           mov ax, word ptr [0x5eb4]                
  0262  d1e0             shl ax, 1                                
  0264  50               push ax                                  
  0265  a1b25e           mov ax, word ptr [0x5eb2]                
  0268  d1e0             shl ax, 1                                
  026a  50               push ax                                  
  026b  1e               push ds                                  
  026c  68a25e           push 0x5ea2                              
  026f  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0274  83c40c           add sp, 0xc                              
  0277  a1b05e           mov ax, word ptr [0x5eb0]                
  027a  d1e0             shl ax, 1                                
  027c  50               push ax                                  
  027d  a1ae5e           mov ax, word ptr [0x5eae]                
  0280  d1e0             shl ax, 1                                
  0282  50               push ax                                  
  0283  a1ac5e           mov ax, word ptr [0x5eac]                
  0286  d1e0             shl ax, 1                                
  0288  50               push ax                                  
  0289  a1aa5e           mov ax, word ptr [0x5eaa]                
  028c  d1e0             shl ax, 1                                
  028e  50               push ax                                  
  028f  1e               push ds                                  
  0290  689a5e           push 0x5e9a                              
  0293  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0298  83c40c           add sp, 0xc                              
  029b  a1a45e           mov ax, word ptr [0x5ea4]                
  029e  051e00           add ax, 0x1e                             
  02a1  50               push ax                                  
  02a2  a1a25e           mov ax, word ptr [0x5ea2]                
  02a5  059001           add ax, 0x190                            
  02a8  50               push ax                                  
  02a9  1e               push ds                                  
  02aa  68965e           push 0x5e96                              
  02ad  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  02b2  83c408           add sp, 8                                
  02b5  66ff369e5e       push dword ptr [0x5e9e]                  
  02ba  666a00           push 0                                   
  02bd  1e               push ds                                  
  02be  68ca5e           push 0x5eca                              
  02c1  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  02c6  83c40c           add sp, 0xc                              
  02c9  66ff36a65e       push dword ptr [0x5ea6]                  
  02ce  a1a45e           mov ax, word ptr [0x5ea4]                
  02d1  2b069c5e         sub ax, word ptr [0x5e9c]                
  02d5  50               push ax                                  
  02d6  a1a25e           mov ax, word ptr [0x5ea2]                
  02d9  2b069a5e         sub ax, word ptr [0x5e9a]                
  02dd  50               push ax                                  
  02de  1e               push ds                                  
  02df  68c25e           push 0x5ec2                              
  02e2  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  02e7  83c40c           add sp, 0xc                              
  02ea  0bff             or di, di                                
  02ec  7410             je 0x2fe                                 
  02ee  833e252d00       cmp word ptr [0x2d25], 0                 
  02f3  7409             je 0x2fe                                 
  02f5  837e0800         cmp word ptr [bp + 8], 0                 
  02f9  7503             jne 0x2fe                                
  02fb  e9d101           jmp 0x4cf                                
  02fe  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0303  6a07             push 7                                   
  0305  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  030a  59               pop cx                                   
  030b  6a07             push 7                                   
  030d  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0312  59               pop cx                                   
  0313  b8042c           mov ax, 0x2c04                           
  0316  8ec0             mov es, ax                               
  0318  26833e240100     cmp word ptr es:[0x124], 0               
  031e  746a             je 0x38a                                 
  0320  0bf6             or si, si                                
  0322  7439             je 0x35d                                 
  0324  6a00             push 0                                   
  0326  1e               push ds                                  
  0327  68ca5e           push 0x5eca                              
  032a  1e               push ds                                  
  032b  68ea2c           push 0x2cea                              
  032e  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  0333  83c40a           add sp, 0xa                              
  0336  66ff369a5e       push dword ptr [0x5e9a]                  
  033b  1e               push ds                                  
  033c  68e354           push 0x54e3                              
  033f  666a00           push 0                                   
  0342  1e               push ds                                  
  0343  68ea2c           push 0x2cea                              
  0346  66ff369e5e       push dword ptr [0x5e9e]                  
  034b  66ff369a5e       push dword ptr [0x5e9a]                  
  0350  1e               push ds                                  
  0351  681d58           push 0x581d                              
  0354  ff1ec869         lcall [0x69c8]                           
  0358  83c41c           add sp, 0x1c                             
  035b  eb48             jmp 0x3a5                                
  035d  6a00             push 0                                   
  035f  16               push ss                                  
  0360  8d46f0           lea ax, [bp - 0x10]                      
  0363  50               push ax                                  
  0364  1e               push ds                                  
  0365  689567           push 0x6795                              
  0368  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  036d  83c40a           add sp, 0xa                              
  0370  66ff76f0         push dword ptr [bp - 0x10]               
  0374  1e               push ds                                  
  0375  68e354           push 0x54e3                              
  0378  66ff76f0         push dword ptr [bp - 0x10]               
  037c  1e               push ds                                  
  037d  689567           push 0x6795                              
  0380  66ff76f4         push dword ptr [bp - 0xc]                
  0384  66ff76f0         push dword ptr [bp - 0x10]               
  0388  ebc6             jmp 0x350                                
  038a  66ff76f0         push dword ptr [bp - 0x10]               
  038e  1e               push ds                                  
  038f  689567           push 0x6795                              
  0392  66ff76f4         push dword ptr [bp - 0xc]                
  0396  66ff76f0         push dword ptr [bp - 0x10]               
  039a  1e               push ds                                  
  039b  681d58           push 0x581d                              
  039e  ff1ed469         lcall [0x69d4]                           
  03a2  83c414           add sp, 0x14                             
  03a5  6a07             push 7                                   
  03a7  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  03ac  59               pop cx                                   
  03ad  0bff             or di, di                                
  03af  7424             je 0x3d5                                 
  03b1  833e252d00       cmp word ptr [0x2d25], 0                 
  03b6  7406             je 0x3be                                 
  03b8  837e0800         cmp word ptr [bp + 8], 0                 
  03bc  7417             je 0x3d5                                 
  03be  6aff             push -1                                  
  03c0  16               push ss                                  
  03c1  8d46f8           lea ax, [bp - 8]                         
  03c4  50               push ax                                  
  03c5  90               nop                                      
  03c6  0e               push cs                                  
  03c7  e80d0b           call 0xed7                               
  03ca  83c406           add sp, 6                                
  03cd  c706252d0100     mov word ptr [0x2d25], 1                 
  03d3  eb06             jmp 0x3db                                
  03d5  c706252d0000     mov word ptr [0x2d25], 0                 
  03db  9a3400ac2f       lcall 0x2fac, 0x34                       -> ovl17:08bf
  03e0  0bc0             or ax, ax                                
  03e2  7503             jne 0x3e7                                
  03e4  e98900           jmp 0x470                                
  03e7  9a3900ac2f       lcall 0x2fac, 0x39                       -> ovl17:08c7
  03ec  8946ee           mov word ptr [bp - 0x12], ax             
  03ef  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  03f4  7553             jne 0x449                                
  03f6  b8042c           mov ax, 0x2c04                           
  03f9  8ec0             mov es, ax                               
  03fb  26833e240100     cmp word ptr es:[0x124], 0               
  0401  7446             je 0x449                                 
  0403  6a04             push 4                                   
  0405  66ff76f2         push dword ptr [bp - 0xe]                
  0409  ff76f0           push word ptr [bp - 0x10]                
  040c  1e               push ds                                  
  040d  689567           push 0x6795                              
  0410  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0415  83c40c           add sp, 0xc                              
  0418  6a04             push 4                                   
  041a  ff76f6           push word ptr [bp - 0xa]                 
  041d  66ff76f0         push dword ptr [bp - 0x10]               
  0421  1e               push ds                                  
  0422  689567           push 0x6795                              
  0425  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  042a  83c40c           add sp, 0xc                              
  042d  6a04             push 4                                   
  042f  ff76f4           push word ptr [bp - 0xc]                 
  0432  8b46f2           mov ax, word ptr [bp - 0xe]              
  0435  0346f6           add ax, word ptr [bp - 0xa]              
  0438  48               dec ax                                   
  0439  50               push ax                                  
  043a  ff76f0           push word ptr [bp - 0x10]                
  043d  1e               push ds                                  
  043e  689567           push 0x6795                              
  0441  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0446  83c40c           add sp, 0xc                              
  0449  8b46f2           mov ax, word ptr [bp - 0xe]              
  044c  053c00           add ax, 0x3c                             
  044f  50               push ax                                  
  0450  8b46ee           mov ax, word ptr [bp - 0x12]             
  0453  0346f0           add ax, word ptr [bp - 0x10]             
  0456  50               push ax                                  
  0457  1e               push ds                                  
  0458  682a34           push 0x342a                              
  045b  66ff76f4         push dword ptr [bp - 0xc]                
  045f  66ff76f0         push dword ptr [bp - 0x10]               
  0463  1e               push ds                                  
  0464  689567           push 0x6795                              
  0467  ff1ed469         lcall [0x69d4]                           
  046b  83c414           add sp, 0x14                             
  046e  eb51             jmp 0x4c1                                
  0470  0bf6             or si, si                                
  0472  741e             je 0x492                                 
  0474  9a2a000831       lcall 0x3108, 0x2a                       -> ovl65:05ec
  0479  66ff36965e       push dword ptr [0x5e96]                  
  047e  1e               push ds                                  
  047f  682a34           push 0x342a                              
  0482  66ff36c65e       push dword ptr [0x5ec6]                  
  0487  66ff36c25e       push dword ptr [0x5ec2]                  
  048c  1e               push ds                                  
  048d  68ea2c           push 0x2cea                              
  0490  eb23             jmp 0x4b5                                
  0492  9a2a000831       lcall 0x3108, 0x2a                       -> ovl65:05ec
  0497  8b46f2           mov ax, word ptr [bp - 0xe]              
  049a  051e00           add ax, 0x1e                             
  049d  50               push ax                                  
  049e  8b46f0           mov ax, word ptr [bp - 0x10]             
  04a1  059001           add ax, 0x190                            
  04a4  50               push ax                                  
  04a5  1e               push ds                                  
  04a6  682a34           push 0x342a                              
  04a9  66ff76f4         push dword ptr [bp - 0xc]                
  04ad  66ff76f0         push dword ptr [bp - 0x10]               
  04b1  1e               push ds                                  
  04b2  689567           push 0x6795                              
  04b5  ff1ed469         lcall [0x69d4]                           
  04b9  83c414           add sp, 0x14                             
  04bc  9a2f000831       lcall 0x3108, 0x2f                       -> ovl65:0698
  04c1  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  04c6  0bf6             or si, si                                
  04c8  7505             jne 0x4cf                                
  04ca  9a2000f930       lcall 0x30f9, 0x20                       -> ovl64:1927
  04cf  5f               pop di                                   
  04d0  5e               pop si                                   
  04d1  c9               leave                                    
  04d2  cb               retf                                     

ovl63_04d3:  ; ENTRY
  04d3  55               push bp                                  
  04d4  8bec             mov bp, sp                               
  04d6  83ec0a           sub sp, 0xa                              
  04d9  66837e0600       cmp dword ptr [bp + 6], 0                
  04de  7513             jne 0x4f3                                
  04e0  8d46f8           lea ax, [bp - 8]                         
  04e3  16               push ss                                  
  04e4  50               push ax                                  
  04e5  1e               push ds                                  
  04e6  68882a           push 0x2a88                              
  04e9  b90800           mov cx, 8                                
  04ec  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  04f1  eb26             jmp 0x519                                
  04f3  c45e06           les bx, ptr [bp + 6]                     
  04f6  268b07           mov ax, word ptr es:[bx]                 
  04f9  d1e0             shl ax, 1                                
  04fb  8946f8           mov word ptr [bp - 8], ax                
  04fe  268b4702         mov ax, word ptr es:[bx + 2]             
  0502  d1e0             shl ax, 1                                
  0504  8946fa           mov word ptr [bp - 6], ax                
  0507  268b4704         mov ax, word ptr es:[bx + 4]             
  050b  d1e0             shl ax, 1                                
  050d  8946fc           mov word ptr [bp - 4], ax                
  0510  268b4706         mov ax, word ptr es:[bx + 6]             
  0514  d1e0             shl ax, 1                                
  0516  8946fe           mov word ptr [bp - 2], ax                
  0519  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  051e  9a3400ac2f       lcall 0x2fac, 0x34                       -> ovl17:08bf
  0523  0bc0             or ax, ax                                
  0525  7503             jne 0x52a                                
  0527  e98900           jmp 0x5b3                                
  052a  9a3900ac2f       lcall 0x2fac, 0x39                       -> ovl17:08c7
  052f  8946f6           mov word ptr [bp - 0xa], ax              
  0532  66837e0600       cmp dword ptr [bp + 6], 0                
  0537  7553             jne 0x58c                                
  0539  b8042c           mov ax, 0x2c04                           
  053c  8ec0             mov es, ax                               
  053e  26833e240100     cmp word ptr es:[0x124], 0               
  0544  7446             je 0x58c                                 
  0546  6a03             push 3                                   
  0548  66ff76fa         push dword ptr [bp - 6]                  
  054c  ff76f8           push word ptr [bp - 8]                   
  054f  1e               push ds                                  
  0550  689567           push 0x6795                              
  0553  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0558  83c40c           add sp, 0xc                              
  055b  6a03             push 3                                   
  055d  ff76fe           push word ptr [bp - 2]                   
  0560  66ff76f8         push dword ptr [bp - 8]                  
  0564  1e               push ds                                  
  0565  689567           push 0x6795                              
  0568  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  056d  83c40c           add sp, 0xc                              
  0570  6a03             push 3                                   
  0572  ff76fc           push word ptr [bp - 4]                   
  0575  8b46fa           mov ax, word ptr [bp - 6]                
  0578  0346fe           add ax, word ptr [bp - 2]                
  057b  48               dec ax                                   
  057c  50               push ax                                  
  057d  ff76f8           push word ptr [bp - 8]                   
  0580  1e               push ds                                  
  0581  689567           push 0x6795                              
  0584  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0589  83c40c           add sp, 0xc                              
  058c  8b46fa           mov ax, word ptr [bp - 6]                
  058f  053c00           add ax, 0x3c                             
  0592  50               push ax                                  
  0593  8b46f6           mov ax, word ptr [bp - 0xa]              
  0596  0346f8           add ax, word ptr [bp - 8]                
  0599  50               push ax                                  
  059a  1e               push ds                                  
  059b  682a34           push 0x342a                              
  059e  66ff76fc         push dword ptr [bp - 4]                  
  05a2  66ff76f8         push dword ptr [bp - 8]                  
  05a6  1e               push ds                                  
  05a7  689567           push 0x6795                              
  05aa  ff1ed469         lcall [0x69d4]                           
  05ae  83c414           add sp, 0x14                             
  05b1  eb2a             jmp 0x5dd                                
  05b3  8b46fa           mov ax, word ptr [bp - 6]                
  05b6  051e00           add ax, 0x1e                             
  05b9  50               push ax                                  
  05ba  8b46f8           mov ax, word ptr [bp - 8]                
  05bd  059001           add ax, 0x190                            
  05c0  50               push ax                                  
  05c1  1e               push ds                                  
  05c2  682a34           push 0x342a                              
  05c5  66ff76fc         push dword ptr [bp - 4]                  
  05c9  66ff76f8         push dword ptr [bp - 8]                  
  05cd  1e               push ds                                  
  05ce  689567           push 0x6795                              
  05d1  ff1ed469         lcall [0x69d4]                           
  05d5  83c414           add sp, 0x14                             
  05d8  9a2f000831       lcall 0x3108, 0x2f                       -> ovl65:0698
  05dd  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  05e2  c9               leave                                    
  05e3  cb               retf                                     

ovl63_05e4:  ; ENTRY
  05e4  55               push bp                                  
  05e5  8bec             mov bp, sp                               
  05e7  83ec1c           sub sp, 0x1c                             
  05ea  56               push si                                  
  05eb  57               push di                                  
  05ec  8d46f4           lea ax, [bp - 0xc]                       
  05ef  16               push ss                                  
  05f0  50               push ax                                  
  05f1  66837e0600       cmp dword ptr [bp + 6], 0                
  05f6  7408             je 0x600                                 
  05f8  8b5608           mov dx, word ptr [bp + 8]                
  05fb  8b4606           mov ax, word ptr [bp + 6]                
  05fe  eb05             jmp 0x605                                
  0600  b8882a           mov ax, 0x2a88                           
  0603  8cda             mov dx, ds                               
  0605  52               push dx                                  
  0606  50               push ax                                  
  0607  b90800           mov cx, 8                                
  060a  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  060f  836ef403         sub word ptr [bp - 0xc], 3               
  0613  8346f804         add word ptr [bp - 8], 4                 
  0617  836ef603         sub word ptr [bp - 0xa], 3               
  061b  8346fa04         add word ptr [bp - 6], 4                 
  061f  66837e0600       cmp dword ptr [bp + 6], 0                
  0624  7529             jne 0x64f                                
  0626  8d46ec           lea ax, [bp - 0x14]                      
  0629  16               push ss                                  
  062a  50               push ax                                  
  062b  1e               push ds                                  
  062c  68882a           push 0x2a88                              
  062f  b90800           mov cx, 8                                
  0632  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0637  666870009c00     push 0x9c0070                            
  063d  666a00           push 0                                   
  0640  16               push ss                                  
  0641  8d46e4           lea ax, [bp - 0x1c]                      
  0644  50               push ax                                  
  0645  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  064a  83c40c           add sp, 0xc                              
  064d  eb37             jmp 0x686                                
  064f  8d46e4           lea ax, [bp - 0x1c]                      
  0652  16               push ss                                  
  0653  50               push ax                                  
  0654  66ff7606         push dword ptr [bp + 6]                  
  0658  b90800           mov cx, 8                                
  065b  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0660  c45e06           les bx, ptr [bp + 6]                     
  0663  268b07           mov ax, word ptr es:[bx]                 
  0666  d1e0             shl ax, 1                                
  0668  8946ec           mov word ptr [bp - 0x14], ax             
  066b  268b4702         mov ax, word ptr es:[bx + 2]             
  066f  d1e0             shl ax, 1                                
  0671  8946ee           mov word ptr [bp - 0x12], ax             
  0674  268b4704         mov ax, word ptr es:[bx + 4]             
  0678  d1e0             shl ax, 1                                
  067a  8946f0           mov word ptr [bp - 0x10], ax             
  067d  268b4706         mov ax, word ptr es:[bx + 6]             
  0681  d1e0             shl ax, 1                                
  0683  8946f2           mov word ptr [bp - 0xe], ax              
  0686  6a07             push 7                                   
  0688  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  068d  59               pop cx                                   
  068e  b8042c           mov ax, 0x2c04                           
  0691  8ec0             mov es, ax                               
  0693  26833e240100     cmp word ptr es:[0x124], 0               
  0699  7438             je 0x6d3                                 
  069b  6a00             push 0                                   
  069d  16               push ss                                  
  069e  8d46ec           lea ax, [bp - 0x14]                      
  06a1  50               push ax                                  
  06a2  1e               push ds                                  
  06a3  689567           push 0x6795                              
  06a6  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  06ab  83c40a           add sp, 0xa                              
  06ae  66ff76ec         push dword ptr [bp - 0x14]               
  06b2  1e               push ds                                  
  06b3  68e354           push 0x54e3                              
  06b6  66ff76ec         push dword ptr [bp - 0x14]               
  06ba  1e               push ds                                  
  06bb  689567           push 0x6795                              
  06be  66ff76f0         push dword ptr [bp - 0x10]               
  06c2  66ff76ec         push dword ptr [bp - 0x14]               
  06c6  1e               push ds                                  
  06c7  681d58           push 0x581d                              
  06ca  ff1ec869         lcall [0x69c8]                           
  06ce  83c41c           add sp, 0x1c                             
  06d1  eb1b             jmp 0x6ee                                
  06d3  66ff76ec         push dword ptr [bp - 0x14]               
  06d7  1e               push ds                                  
  06d8  689567           push 0x6795                              
  06db  66ff76f0         push dword ptr [bp - 0x10]               
  06df  66ff76ec         push dword ptr [bp - 0x14]               
  06e3  1e               push ds                                  
  06e4  681d58           push 0x581d                              
  06e7  ff1ed469         lcall [0x69d4]                           
  06eb  83c414           add sp, 0x14                             
  06ee  c746fe0000       mov word ptr [bp - 2], 0                 
  06f3  e9d401           jmp 0x8ca                                
  06f6  8b5efe           mov bx, word ptr [bp - 2]                
  06f9  6bdb1f           imul bx, bx, 0x1f                        
  06fc  b8042c           mov ax, 0x2c04                           
  06ff  8ec0             mov es, ax                               
  0701  268bb71108       mov si, word ptr es:[bx + 0x811]         
  0706  8b5efe           mov bx, word ptr [bp - 2]                
  0709  6bdb1f           imul bx, bx, 0x1f                        
  070c  b8042c           mov ax, 0x2c04                           
  070f  8ec0             mov es, ax                               
  0711  268bbf1308       mov di, word ptr es:[bx + 0x813]         
  0716  3b76f4           cmp si, word ptr [bp - 0xc]              
  0719  7d03             jge 0x71e                                
  071b  e9a901           jmp 0x8c7                                
  071e  8b46f4           mov ax, word ptr [bp - 0xc]              
  0721  0346f8           add ax, word ptr [bp - 8]                
  0724  3bc6             cmp ax, si                               
  0726  7f03             jg 0x72b                                 
  0728  e99c01           jmp 0x8c7                                
  072b  3b7ef6           cmp di, word ptr [bp - 0xa]              
  072e  7d03             jge 0x733                                
  0730  e99401           jmp 0x8c7                                
  0733  8b46f6           mov ax, word ptr [bp - 0xa]              
  0736  0346fa           add ax, word ptr [bp - 6]                
  0739  3bc7             cmp ax, di                               
  073b  7f03             jg 0x740                                 
  073d  e98701           jmp 0x8c7                                
  0740  b8042c           mov ax, 0x2c04                           
  0743  8ec0             mov es, ax                               
  0745  26833e240100     cmp word ptr es:[0x124], 0               
  074b  741e             je 0x76b                                 
  074d  8bdf             mov bx, di                               
  074f  6bdb70           imul bx, bx, 0x70                        
  0752  03de             add bx, si                               
  0754  b8d919           mov ax, 0x19d9                           
  0757  8ec0             mov es, ax                               
  0759  268a870000       mov al, byte ptr es:[bx]                 
  075e  c1e805           shr ax, 5                                
  0761  250100           and ax, 1                                
  0764  0bc0             or ax, ax                                
  0766  7503             jne 0x76b                                
  0768  e95c01           jmp 0x8c7                                
  076b  8b5efe           mov bx, word ptr [bp - 2]                
  076e  6bdb1f           imul bx, bx, 0x1f                        
  0771  b8042c           mov ax, 0x2c04                           
  0774  ba042c           mov dx, 0x2c04                           
  0777  8ec2             mov es, dx                               
  0779  268a0e1001       mov cl, byte ptr es:[0x110]              
  077e  ba0100           mov dx, 1                                
  0781  d3e2             shl dx, cl                               
  0783  8ec0             mov es, ax                               
  0785  2685972e08       test word ptr es:[bx + 0x82e], dx        
  078a  7503             jne 0x78f                                
  078c  e93801           jmp 0x8c7                                
  078f  8b5efe           mov bx, word ptr [bp - 2]                
  0792  6bdb1f           imul bx, bx, 0x1f                        
  0795  b8042c           mov ax, 0x2c04                           
  0798  8ec0             mov es, ax                               
  079a  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  07a0  7507             jne 0x7a9                                
  07a2  c746fc0200       mov word ptr [bp - 4], 2                 
  07a7  eb44             jmp 0x7ed                                
  07a9  8bdf             mov bx, di                               
  07ab  69dbe000         imul bx, bx, 0xe0                        
  07af  8bc6             mov ax, si                               
  07b1  d1e0             shl ax, 1                                
  07b3  03d8             add bx, ax                               
  07b5  b81d1e           mov ax, 0x1e1d                           
  07b8  8ec0             mov es, ax                               
  07ba  268a870100       mov al, byte ptr es:[bx + 1]             
  07bf  c1e806           shr ax, 6                                
  07c2  250100           and ax, 1                                
  07c5  0bc0             or ax, ax                                
  07c7  7407             je 0x7d0                                 
  07c9  c746fc0100       mov word ptr [bp - 4], 1                 
  07ce  eb1d             jmp 0x7ed                                
  07d0  8b5efe           mov bx, word ptr [bp - 2]                
  07d3  6bdb1f           imul bx, bx, 0x1f                        
  07d6  b8042c           mov ax, 0x2c04                           
  07d9  8ec0             mov es, ax                               
  07db  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  07e1  7405             je 0x7e8                                 
  07e3  b80300           mov ax, 3                                
  07e6  eb02             jmp 0x7ea                                
  07e8  33c0             xor ax, ax                               
  07ea  8946fc           mov word ptr [bp - 4], ax                
  07ed  d1e6             shl si, 1                                
  07ef  4e               dec si                                   
  07f0  d1e7             shl di, 1                                
  07f2  4f               dec di                                   
  07f3  83c604           add si, 4                                
  07f6  c1fe03           sar si, 3                                
  07f9  c1e603           shl si, 3                                
  07fc  6a09             push 9                                   
  07fe  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0803  59               pop cx                                   
  0804  6a09             push 9                                   
  0806  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  080b  59               pop cx                                   
  080c  8b5efc           mov bx, word ptr [bp - 4]                
  080f  c1e303           shl bx, 3                                
  0812  ffb72a0f         push word ptr [bx + 0xf2a]               
  0816  8b5efc           mov bx, word ptr [bp - 4]                
  0819  c1e303           shl bx, 3                                
  081c  ffb7280f         push word ptr [bx + 0xf28]               
  0820  1e               push ds                                  
  0821  686c57           push 0x576c                              
  0824  57               push di                                  
  0825  56               push si                                  
  0826  1e               push ds                                  
  0827  689567           push 0x6795                              
  082a  8b5efc           mov bx, word ptr [bp - 4]                
  082d  c1e303           shl bx, 3                                
  0830  ffb72e0f         push word ptr [bx + 0xf2e]               
  0834  8b5efc           mov bx, word ptr [bp - 4]                
  0837  c1e303           shl bx, 3                                
  083a  ffb72c0f         push word ptr [bx + 0xf2c]               
  083e  8b5efc           mov bx, word ptr [bp - 4]                
  0841  c1e303           shl bx, 3                                
  0844  ffb72a0f         push word ptr [bx + 0xf2a]               
  0848  8b5efc           mov bx, word ptr [bp - 4]                
  084b  c1e303           shl bx, 3                                
  084e  ffb7280f         push word ptr [bx + 0xf28]               
  0852  1e               push ds                                  
  0853  68a757           push 0x57a7                              
  0856  ff1ec869         lcall [0x69c8]                           
  085a  83c41c           add sp, 0x1c                             
  085d  8b46fe           mov ax, word ptr [bp - 2]                
  0860  3b460a           cmp ax, word ptr [bp + 0xa]              
  0863  755a             jne 0x8bf                                
  0865  66680c000f00     push 0xf000c                             
  086b  57               push di                                  
  086c  56               push si                                  
  086d  1e               push ds                                  
  086e  689567           push 0x6795                              
  0871  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0876  83c40c           add sp, 0xc                              
  0879  66680c000f00     push 0xf000c                             
  087f  8bc7             mov ax, di                               
  0881  050900           add ax, 9                                
  0884  50               push ax                                  
  0885  56               push si                                  
  0886  1e               push ds                                  
  0887  689567           push 0x6795                              
  088a  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  088f  83c40c           add sp, 0xc                              
  0892  66680a000f00     push 0xf000a                             
  0898  57               push di                                  
  0899  56               push si                                  
  089a  1e               push ds                                  
  089b  689567           push 0x6795                              
  089e  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  08a3  83c40c           add sp, 0xc                              
  08a6  66680a000f00     push 0xf000a                             
  08ac  57               push di                                  
  08ad  8bc6             mov ax, si                               
  08af  050b00           add ax, 0xb                              
  08b2  50               push ax                                  
  08b3  1e               push ds                                  
  08b4  689567           push 0x6795                              
  08b7  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  08bc  83c40c           add sp, 0xc                              
  08bf  6a09             push 9                                   
  08c1  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  08c6  59               pop cx                                   
  08c7  ff46fe           inc word ptr [bp - 2]                    
  08ca  b8042c           mov ax, 0x2c04                           
  08cd  8ec0             mov es, ax                               
  08cf  26a10f08         mov ax, word ptr es:[0x80f]              
  08d3  3b46fe           cmp ax, word ptr [bp - 2]                
  08d6  7e03             jle 0x8db                                
  08d8  e91bfe           jmp 0x6f6                                
  08db  5f               pop di                                   
  08dc  5e               pop si                                   
  08dd  c9               leave                                    
  08de  cb               retf                                     

ovl63_08df:  ; ENTRY
  08df  55               push bp                                  
  08e0  8bec             mov bp, sp                               
  08e2  83ec30           sub sp, 0x30                             
  08e5  56               push si                                  
  08e6  57               push di                                  
  08e7  c746d00000       mov word ptr [bp - 0x30], 0              
  08ec  66837e0600       cmp dword ptr [bp + 6], 0                
  08f1  7529             jne 0x91c                                
  08f3  8d46de           lea ax, [bp - 0x22]                      
  08f6  16               push ss                                  
  08f7  50               push ax                                  
  08f8  1e               push ds                                  
  08f9  68882a           push 0x2a88                              
  08fc  b90800           mov cx, 8                                
  08ff  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0904  666870009c00     push 0x9c0070                            
  090a  666a00           push 0                                   
  090d  16               push ss                                  
  090e  8d46e6           lea ax, [bp - 0x1a]                      
  0911  50               push ax                                  
  0912  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0917  83c40c           add sp, 0xc                              
  091a  eb37             jmp 0x953                                
  091c  8d46e6           lea ax, [bp - 0x1a]                      
  091f  16               push ss                                  
  0920  50               push ax                                  
  0921  66ff7606         push dword ptr [bp + 6]                  
  0925  b90800           mov cx, 8                                
  0928  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  092d  c45e06           les bx, ptr [bp + 6]                     
  0930  268b07           mov ax, word ptr es:[bx]                 
  0933  d1e0             shl ax, 1                                
  0935  8946de           mov word ptr [bp - 0x22], ax             
  0938  268b4702         mov ax, word ptr es:[bx + 2]             
  093c  d1e0             shl ax, 1                                
  093e  8946e0           mov word ptr [bp - 0x20], ax             
  0941  268b4704         mov ax, word ptr es:[bx + 4]             
  0945  d1e0             shl ax, 1                                
  0947  8946e2           mov word ptr [bp - 0x1e], ax             
  094a  268b4706         mov ax, word ptr es:[bx + 6]             
  094e  d1e0             shl ax, 1                                
  0950  8946e4           mov word ptr [bp - 0x1c], ax             
  0953  6a07             push 7                                   
  0955  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  095a  59               pop cx                                   
  095b  6a07             push 7                                   
  095d  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0962  59               pop cx                                   
  0963  b8042c           mov ax, 0x2c04                           
  0966  8ec0             mov es, ax                               
  0968  26833e240100     cmp word ptr es:[0x124], 0               
  096e  7438             je 0x9a8                                 
  0970  6a00             push 0                                   
  0972  16               push ss                                  
  0973  8d46de           lea ax, [bp - 0x22]                      
  0976  50               push ax                                  
  0977  1e               push ds                                  
  0978  689567           push 0x6795                              
  097b  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  0980  83c40a           add sp, 0xa                              
  0983  66ff76de         push dword ptr [bp - 0x22]               
  0987  1e               push ds                                  
  0988  68e354           push 0x54e3                              
  098b  66ff76de         push dword ptr [bp - 0x22]               
  098f  1e               push ds                                  
  0990  689567           push 0x6795                              
  0993  66ff76e2         push dword ptr [bp - 0x1e]               
  0997  66ff76de         push dword ptr [bp - 0x22]               
  099b  1e               push ds                                  
  099c  681d58           push 0x581d                              
  099f  ff1ec869         lcall [0x69c8]                           
  09a3  83c41c           add sp, 0x1c                             
  09a6  eb1b             jmp 0x9c3                                
  09a8  66ff76de         push dword ptr [bp - 0x22]               
  09ac  1e               push ds                                  
  09ad  689567           push 0x6795                              
  09b0  66ff76e2         push dword ptr [bp - 0x1e]               
  09b4  66ff76de         push dword ptr [bp - 0x22]               
  09b8  1e               push ds                                  
  09b9  681d58           push 0x581d                              
  09bc  ff1ed469         lcall [0x69d4]                           
  09c0  83c414           add sp, 0x14                             
  09c3  6a07             push 7                                   
  09c5  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  09ca  59               pop cx                                   
  09cb  c746fe0000       mov word ptr [bp - 2], 0                 
  09d0  e98d01           jmp 0xb60                                
  09d3  8b5efe           mov bx, word ptr [bp - 2]                
  09d6  6bdb41           imul bx, bx, 0x41                        
  09d9  b8042c           mov ax, 0x2c04                           
  09dc  8ec0             mov es, ax                               
  09de  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  09e3  98               cwde                                     
  09e4  ba042c           mov dx, 0x2c04                           
  09e7  8ec2             mov es, dx                               
  09e9  263b061001       cmp ax, word ptr es:[0x110]              
  09ee  7403             je 0x9f3                                 
  09f0  e96a01           jmp 0xb5d                                
  09f3  837e0cff         cmp word ptr [bp + 0xc], -1              
  09f7  7529             jne 0xa22                                
  09f9  16               push ss                                  
  09fa  8d46d4           lea ax, [bp - 0x2c]                      
  09fd  50               push ax                                  
  09fe  16               push ss                                  
  09ff  8d46d6           lea ax, [bp - 0x2a]                      
  0a02  50               push ax                                  
  0a03  ff76fe           push word ptr [bp - 2]                   
  0a06  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  0a0b  83c40a           add sp, 0xa                              
  0a0e  8b46d4           mov ax, word ptr [bp - 0x2c]             
  0a11  40               inc ax                                   
  0a12  3d0400           cmp ax, 4                                
  0a15  7e3c             jle 0xa53                                
  0a17  8b46fe           mov ax, word ptr [bp - 2]                
  0a1a  3b460a           cmp ax, word ptr [bp + 0xa]              
  0a1d  7434             je 0xa53                                 
  0a1f  e93b01           jmp 0xb5d                                
  0a22  837e0c00         cmp word ptr [bp + 0xc], 0               
  0a26  7c2b             jl 0xa53                                 
  0a28  16               push ss                                  
  0a29  8d46d4           lea ax, [bp - 0x2c]                      
  0a2c  50               push ax                                  
  0a2d  16               push ss                                  
  0a2e  8d46d6           lea ax, [bp - 0x2a]                      
  0a31  50               push ax                                  
  0a32  ff76fe           push word ptr [bp - 2]                   
  0a35  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  0a3a  83c40a           add sp, 0xa                              
  0a3d  8b46d4           mov ax, word ptr [bp - 0x2c]             
  0a40  03460c           add ax, word ptr [bp + 0xc]              
  0a43  3d0400           cmp ax, 4                                
  0a46  7e0b             jle 0xa53                                
  0a48  8b46fe           mov ax, word ptr [bp - 2]                
  0a4b  3b460a           cmp ax, word ptr [bp + 0xa]              
  0a4e  7403             je 0xa53                                 
  0a50  e90a01           jmp 0xb5d                                
  0a53  8b5efe           mov bx, word ptr [bp - 2]                
  0a56  6bdb41           imul bx, bx, 0x41                        
  0a59  b8042c           mov ax, 0x2c04                           
  0a5c  8ec0             mov es, ax                               
  0a5e  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  0a63  8b5efe           mov bx, word ptr [bp - 2]                
  0a66  6bdb41           imul bx, bx, 0x41                        
  0a69  b8042c           mov ax, 0x2c04                           
  0a6c  8ec0             mov es, ax                               
  0a6e  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0a73  8946fc           mov word ptr [bp - 4], ax                
  0a76  8b5efe           mov bx, word ptr [bp - 2]                
  0a79  6bdb41           imul bx, bx, 0x41                        
  0a7c  b8042c           mov ax, 0x2c04                           
  0a7f  8ec0             mov es, ax                               
  0a81  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  0a87  7e04             jle 0xa8d                                
  0a89  33c0             xor ax, ax                               
  0a8b  eb03             jmp 0xa90                                
  0a8d  b80300           mov ax, 3                                
  0a90  8bf0             mov si, ax                               
  0a92  d1e7             shl di, 1                                
  0a94  83c7fe           add di, -2                               
  0a97  8b46fc           mov ax, word ptr [bp - 4]                
  0a9a  d1e0             shl ax, 1                                
  0a9c  48               dec ax                                   
  0a9d  8946fc           mov word ptr [bp - 4], ax                
  0aa0  837e0a00         cmp word ptr [bp + 0xa], 0               
  0aa4  7c27             jl 0xacd                                 
  0aa6  8b460a           mov ax, word ptr [bp + 0xa]              
  0aa9  3b46fe           cmp ax, word ptr [bp - 2]                
  0aac  751f             jne 0xacd                                
  0aae  0bf6             or si, si                                
  0ab0  7505             jne 0xab7                                
  0ab2  b80400           mov ax, 4                                
  0ab5  eb03             jmp 0xaba                                
  0ab7  b80600           mov ax, 6                                
  0aba  8bf0             mov si, ax                               
  0abc  8bc7             mov ax, di                               
  0abe  050400           add ax, 4                                
  0ac1  8946fa           mov word ptr [bp - 6], ax                
  0ac4  8b46fc           mov ax, word ptr [bp - 4]                
  0ac7  050300           add ax, 3                                
  0aca  8946f6           mov word ptr [bp - 0xa], ax              
  0acd  8bc7             mov ax, di                               
  0acf  250700           and ax, 7                                
  0ad2  8946d2           mov word ptr [bp - 0x2e], ax             
  0ad5  837ed207         cmp word ptr [bp - 0x2e], 7              
  0ad9  7505             jne 0xae0                                
  0adb  c746d20600       mov word ptr [bp - 0x2e], 6              
  0ae0  c1ff03           sar di, 3                                
  0ae3  c1e703           shl di, 3                                
  0ae6  6a09             push 9                                   
  0ae8  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0aed  59               pop cx                                   
  0aee  8bde             mov bx, si                               
  0af0  c1e303           shl bx, 3                                
  0af3  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0af7  8bde             mov bx, si                               
  0af9  c1e303           shl bx, 3                                
  0afc  50               push ax                                  
  0afd  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0b00  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0b04  5a               pop dx                                   
  0b05  03d0             add dx, ax                               
  0b07  52               push dx                                  
  0b08  8bde             mov bx, si                               
  0b0a  c1e303           shl bx, 3                                
  0b0d  ffb7762c         push word ptr [bx + 0x2c76]              
  0b11  1e               push ds                                  
  0b12  686c57           push 0x576c                              
  0b15  ff76fc           push word ptr [bp - 4]                   
  0b18  57               push di                                  
  0b19  1e               push ds                                  
  0b1a  689567           push 0x6795                              
  0b1d  8bde             mov bx, si                               
  0b1f  c1e303           shl bx, 3                                
  0b22  ffb77c2c         push word ptr [bx + 0x2c7c]              
  0b26  8bde             mov bx, si                               
  0b28  c1e303           shl bx, 3                                
  0b2b  ffb77a2c         push word ptr [bx + 0x2c7a]              
  0b2f  8bde             mov bx, si                               
  0b31  c1e303           shl bx, 3                                
  0b34  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0b38  8bde             mov bx, si                               
  0b3a  c1e303           shl bx, 3                                
  0b3d  50               push ax                                  
  0b3e  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0b41  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0b45  5a               pop dx                                   
  0b46  03d0             add dx, ax                               
  0b48  52               push dx                                  
  0b49  8bde             mov bx, si                               
  0b4b  c1e303           shl bx, 3                                
  0b4e  ffb7762c         push word ptr [bx + 0x2c76]              
  0b52  1e               push ds                                  
  0b53  68a757           push 0x57a7                              
  0b56  ff1ec869         lcall [0x69c8]                           
  0b5a  83c41c           add sp, 0x1c                             
  0b5d  ff46fe           inc word ptr [bp - 2]                    
  0b60  b8042c           mov ax, 0x2c04                           
  0b63  8ec0             mov es, ax                               
  0b65  26a17b15         mov ax, word ptr es:[0x157b]             
  0b69  3b46fe           cmp ax, word ptr [bp - 2]                
  0b6c  7e03             jle 0xb71                                
  0b6e  e962fe           jmp 0x9d3                                
  0b71  837e0a00         cmp word ptr [bp + 0xa], 0               
  0b75  7d03             jge 0xb7a                                
  0b77  e91e03           jmp 0xe98                                
  0b7a  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0b7d  6bdb41           imul bx, bx, 0x41                        
  0b80  b8042c           mov ax, 0x2c04                           
  0b83  8ec0             mov es, ax                               
  0b85  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  0b8b  747b             je 0xc08                                 
  0b8d  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0b90  6bdb41           imul bx, bx, 0x41                        
  0b93  b8042c           mov ax, 0x2c04                           
  0b96  8ec0             mov es, ax                               
  0b98  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  0b9e  7568             jne 0xc08                                
  0ba0  c746d00100       mov word ptr [bp - 0x30], 1              
  0ba5  16               push ss                                  
  0ba6  8d46ee           lea ax, [bp - 0x12]                      
  0ba9  50               push ax                                  
  0baa  16               push ss                                  
  0bab  8d46f0           lea ax, [bp - 0x10]                      
  0bae  50               push ax                                  
  0baf  b8042c           mov ax, 0x2c04                           
  0bb2  8ec0             mov es, ax                               
  0bb4  26ff361001       push word ptr es:[0x110]                 
  0bb9  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  0bbe  83c40a           add sp, 0xa                              
  0bc1  0bc0             or ax, ax                                
  0bc3  7443             je 0xc08                                 
  0bc5  8b46f0           mov ax, word ptr [bp - 0x10]             
  0bc8  d1e0             shl ax, 1                                
  0bca  8946f8           mov word ptr [bp - 8], ax                
  0bcd  8b46ee           mov ax, word ptr [bp - 0x12]             
  0bd0  d1e0             shl ax, 1                                
  0bd2  8946f4           mov word ptr [bp - 0xc], ax              
  0bd5  6a01             push 1                                   
  0bd7  ff76ee           push word ptr [bp - 0x12]                
  0bda  ff76f0           push word ptr [bp - 0x10]                
  0bdd  90               nop                                      
  0bde  0e               push cs                                  
  0bdf  e87d13           call 0x1f5f                              
  0be2  83c406           add sp, 6                                
  0be5  6a07             push 7                                   
  0be7  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0bec  59               pop cx                                   
  0bed  666a00           push 0                                   
  0bf0  ff76f4           push word ptr [bp - 0xc]                 
  0bf3  ff76f8           push word ptr [bp - 8]                   
  0bf6  ff76f6           push word ptr [bp - 0xa]                 
  0bf9  ff76fa           push word ptr [bp - 6]                   
  0bfc  1e               push ds                                  
  0bfd  689567           push 0x6795                              
  0c00  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  0c05  83c410           add sp, 0x10                             
  0c08  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0c0b  6bdb41           imul bx, bx, 0x41                        
  0c0e  b8042c           mov ax, 0x2c04                           
  0c11  8ec0             mov es, ax                               
  0c13  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  0c19  7503             jne 0xc1e                                
  0c1b  e94901           jmp 0xd67                                
  0c1e  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0c21  6bdb41           imul bx, bx, 0x41                        
  0c24  b8042c           mov ax, 0x2c04                           
  0c27  8ec0             mov es, ax                               
  0c29  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  0c2f  7503             jne 0xc34                                
  0c31  e93301           jmp 0xd67                                
  0c34  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0c37  6bdb41           imul bx, bx, 0x41                        
  0c3a  b8042c           mov ax, 0x2c04                           
  0c3d  8ec0             mov es, ax                               
  0c3f  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  0c44  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0c47  6bdb41           imul bx, bx, 0x41                        
  0c4a  b8042c           mov ax, 0x2c04                           
  0c4d  8ec0             mov es, ax                               
  0c4f  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  0c54  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0c59  83c404           add sp, 4                                
  0c5c  8bd0             mov dx, ax                               
  0c5e  8bda             mov bx, dx                               
  0c60  6bdb41           imul bx, bx, 0x41                        
  0c63  b8042c           mov ax, 0x2c04                           
  0c66  8ec0             mov es, ax                               
  0c68  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  0c6d  d1e7             shl di, 1                                
  0c6f  83c7fe           add di, -2                               
  0c72  8bda             mov bx, dx                               
  0c74  6bdb41           imul bx, bx, 0x41                        
  0c77  b8042c           mov ax, 0x2c04                           
  0c7a  8ec0             mov es, ax                               
  0c7c  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0c81  d1e0             shl ax, 1                                
  0c83  48               dec ax                                   
  0c84  8946fc           mov word ptr [bp - 4], ax                
  0c87  8bc7             mov ax, di                               
  0c89  050400           add ax, 4                                
  0c8c  8946f8           mov word ptr [bp - 8], ax                
  0c8f  8b46fc           mov ax, word ptr [bp - 4]                
  0c92  050300           add ax, 3                                
  0c95  8946f4           mov word ptr [bp - 0xc], ax              
  0c98  8bda             mov bx, dx                               
  0c9a  6bdb41           imul bx, bx, 0x41                        
  0c9d  b8042c           mov ax, 0x2c04                           
  0ca0  8ec0             mov es, ax                               
  0ca2  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  0ca8  7e05             jle 0xcaf                                
  0caa  b80100           mov ax, 1                                
  0cad  eb03             jmp 0xcb2                                
  0caf  b80500           mov ax, 5                                
  0cb2  8bf0             mov si, ax                               
  0cb4  8bc7             mov ax, di                               
  0cb6  250700           and ax, 7                                
  0cb9  8946d2           mov word ptr [bp - 0x2e], ax             
  0cbc  837ed207         cmp word ptr [bp - 0x2e], 7              
  0cc0  7505             jne 0xcc7                                
  0cc2  c746d20600       mov word ptr [bp - 0x2e], 6              
  0cc7  c1ff03           sar di, 3                                
  0cca  c1e703           shl di, 3                                
  0ccd  6a09             push 9                                   
  0ccf  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0cd4  59               pop cx                                   
  0cd5  8bde             mov bx, si                               
  0cd7  c1e303           shl bx, 3                                
  0cda  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0cde  8bde             mov bx, si                               
  0ce0  c1e303           shl bx, 3                                
  0ce3  50               push ax                                  
  0ce4  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0ce7  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0ceb  5a               pop dx                                   
  0cec  03d0             add dx, ax                               
  0cee  52               push dx                                  
  0cef  8bde             mov bx, si                               
  0cf1  c1e303           shl bx, 3                                
  0cf4  ffb7762c         push word ptr [bx + 0x2c76]              
  0cf8  1e               push ds                                  
  0cf9  686c57           push 0x576c                              
  0cfc  ff76fc           push word ptr [bp - 4]                   
  0cff  57               push di                                  
  0d00  1e               push ds                                  
  0d01  689567           push 0x6795                              
  0d04  8bde             mov bx, si                               
  0d06  c1e303           shl bx, 3                                
  0d09  ffb77c2c         push word ptr [bx + 0x2c7c]              
  0d0d  8bde             mov bx, si                               
  0d0f  c1e303           shl bx, 3                                
  0d12  ffb77a2c         push word ptr [bx + 0x2c7a]              
  0d16  8bde             mov bx, si                               
  0d18  c1e303           shl bx, 3                                
  0d1b  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0d1f  8bde             mov bx, si                               
  0d21  c1e303           shl bx, 3                                
  0d24  50               push ax                                  
  0d25  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0d28  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0d2c  5a               pop dx                                   
  0d2d  03d0             add dx, ax                               
  0d2f  52               push dx                                  
  0d30  8bde             mov bx, si                               
  0d32  c1e303           shl bx, 3                                
  0d35  ffb7762c         push word ptr [bx + 0x2c76]              
  0d39  1e               push ds                                  
  0d3a  68a757           push 0x57a7                              
  0d3d  ff1ec869         lcall [0x69c8]                           
  0d41  83c41c           add sp, 0x1c                             
  0d44  6a07             push 7                                   
  0d46  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0d4b  59               pop cx                                   
  0d4c  666a00           push 0                                   
  0d4f  ff76f4           push word ptr [bp - 0xc]                 
  0d52  ff76f8           push word ptr [bp - 8]                   
  0d55  ff76f6           push word ptr [bp - 0xa]                 
  0d58  ff76fa           push word ptr [bp - 6]                   
  0d5b  1e               push ds                                  
  0d5c  689567           push 0x6795                              
  0d5f  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  0d64  83c410           add sp, 0x10                             
  0d67  16               push ss                                  
  0d68  8d46d4           lea ax, [bp - 0x2c]                      
  0d6b  50               push ax                                  
  0d6c  16               push ss                                  
  0d6d  8d46d6           lea ax, [bp - 0x2a]                      
  0d70  50               push ax                                  
  0d71  ff760a           push word ptr [bp + 0xa]                 
  0d74  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  0d79  83c40a           add sp, 0xa                              
  0d7c  c746fe0000       mov word ptr [bp - 2], 0                 
  0d81  e90901           jmp 0xe8d                                
  0d84  8b5efe           mov bx, word ptr [bp - 2]                
  0d87  d1e3             shl bx, 1                                
  0d89  8d46d6           lea ax, [bp - 0x2a]                      
  0d8c  03d8             add bx, ax                               
  0d8e  368b1f           mov bx, word ptr ss:[bx]                 
  0d91  6bdb41           imul bx, bx, 0x41                        
  0d94  b8042c           mov ax, 0x2c04                           
  0d97  8ec0             mov es, ax                               
  0d99  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  0d9e  d1e7             shl di, 1                                
  0da0  83c7fe           add di, -2                               
  0da3  8b5efe           mov bx, word ptr [bp - 2]                
  0da6  d1e3             shl bx, 1                                
  0da8  8d46d6           lea ax, [bp - 0x2a]                      
  0dab  03d8             add bx, ax                               
  0dad  368b1f           mov bx, word ptr ss:[bx]                 
  0db0  6bdb41           imul bx, bx, 0x41                        
  0db3  b8042c           mov ax, 0x2c04                           
  0db6  8ec0             mov es, ax                               
  0db8  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0dbd  d1e0             shl ax, 1                                
  0dbf  48               dec ax                                   
  0dc0  8946fc           mov word ptr [bp - 4], ax                
  0dc3  8bc7             mov ax, di                               
  0dc5  050400           add ax, 4                                
  0dc8  8946f8           mov word ptr [bp - 8], ax                
  0dcb  8b46fc           mov ax, word ptr [bp - 4]                
  0dce  050300           add ax, 3                                
  0dd1  8946f4           mov word ptr [bp - 0xc], ax              
  0dd4  be0200           mov si, 2                                
  0dd7  8bc7             mov ax, di                               
  0dd9  250700           and ax, 7                                
  0ddc  8946d2           mov word ptr [bp - 0x2e], ax             
  0ddf  837ed207         cmp word ptr [bp - 0x2e], 7              
  0de3  7505             jne 0xdea                                
  0de5  c746d20600       mov word ptr [bp - 0x2e], 6              
  0dea  c1ff03           sar di, 3                                
  0ded  c1e703           shl di, 3                                
  0df0  6a09             push 9                                   
  0df2  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0df7  59               pop cx                                   
  0df8  8bde             mov bx, si                               
  0dfa  c1e303           shl bx, 3                                
  0dfd  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0e01  8bde             mov bx, si                               
  0e03  c1e303           shl bx, 3                                
  0e06  50               push ax                                  
  0e07  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0e0a  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0e0e  5a               pop dx                                   
  0e0f  03d0             add dx, ax                               
  0e11  52               push dx                                  
  0e12  8bde             mov bx, si                               
  0e14  c1e303           shl bx, 3                                
  0e17  ffb7762c         push word ptr [bx + 0x2c76]              
  0e1b  1e               push ds                                  
  0e1c  686c57           push 0x576c                              
  0e1f  ff76fc           push word ptr [bp - 4]                   
  0e22  57               push di                                  
  0e23  1e               push ds                                  
  0e24  689567           push 0x6795                              
  0e27  8bde             mov bx, si                               
  0e29  c1e303           shl bx, 3                                
  0e2c  ffb77c2c         push word ptr [bx + 0x2c7c]              
  0e30  8bde             mov bx, si                               
  0e32  c1e303           shl bx, 3                                
  0e35  ffb77a2c         push word ptr [bx + 0x2c7a]              
  0e39  8bde             mov bx, si                               
  0e3b  c1e303           shl bx, 3                                
  0e3e  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  0e42  8bde             mov bx, si                               
  0e44  c1e303           shl bx, 3                                
  0e47  50               push ax                                  
  0e48  8b46d2           mov ax, word ptr [bp - 0x2e]             
  0e4b  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  0e4f  5a               pop dx                                   
  0e50  03d0             add dx, ax                               
  0e52  52               push dx                                  
  0e53  8bde             mov bx, si                               
  0e55  c1e303           shl bx, 3                                
  0e58  ffb7762c         push word ptr [bx + 0x2c76]              
  0e5c  1e               push ds                                  
  0e5d  68a757           push 0x57a7                              
  0e60  ff1ec869         lcall [0x69c8]                           
  0e64  83c41c           add sp, 0x1c                             
  0e67  6a08             push 8                                   
  0e69  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0e6e  59               pop cx                                   
  0e6f  666a00           push 0                                   
  0e72  ff76f4           push word ptr [bp - 0xc]                 
  0e75  ff76f8           push word ptr [bp - 8]                   
  0e78  ff76f6           push word ptr [bp - 0xa]                 
  0e7b  ff76fa           push word ptr [bp - 6]                   
  0e7e  1e               push ds                                  
  0e7f  689567           push 0x6795                              
  0e82  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  0e87  83c410           add sp, 0x10                             
  0e8a  ff46fe           inc word ptr [bp - 2]                    
  0e8d  8b46fe           mov ax, word ptr [bp - 2]                
  0e90  3b46d4           cmp ax, word ptr [bp - 0x2c]             
  0e93  7d03             jge 0xe98                                
  0e95  e9ecfe           jmp 0xd84                                
  0e98  16               push ss                                  
  0e99  8d46f4           lea ax, [bp - 0xc]                       
  0e9c  50               push ax                                  
  0e9d  16               push ss                                  
  0e9e  8d46f8           lea ax, [bp - 8]                         
  0ea1  50               push ax                                  
  0ea2  b8042c           mov ax, 0x2c04                           
  0ea5  8ec0             mov es, ax                               
  0ea7  26ff361001       push word ptr es:[0x110]                 
  0eac  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  0eb1  83c40a           add sp, 0xa                              
  0eb4  8946f2           mov word ptr [bp - 0xe], ax              
  0eb7  837ef200         cmp word ptr [bp - 0xe], 0               
  0ebb  7416             je 0xed3                                 
  0ebd  837ed000         cmp word ptr [bp - 0x30], 0              
  0ec1  7510             jne 0xed3                                
  0ec3  6a00             push 0                                   
  0ec5  ff76f4           push word ptr [bp - 0xc]                 
  0ec8  ff76f8           push word ptr [bp - 8]                   
  0ecb  90               nop                                      
  0ecc  0e               push cs                                  
  0ecd  e88f10           call 0x1f5f                              
  0ed0  83c406           add sp, 6                                
  0ed3  5f               pop di                                   
  0ed4  5e               pop si                                   
  0ed5  c9               leave                                    
  0ed6  cb               retf                                     

ovl63_0ed7:  ; ENTRY
  0ed7  55               push bp                                  
  0ed8  8bec             mov bp, sp                               
  0eda  83ec14           sub sp, 0x14                             
  0edd  56               push si                                  
  0ede  57               push di                                  
  0edf  b8042c           mov ax, 0x2c04                           
  0ee2  8ec0             mov es, ax                               
  0ee4  26833e240100     cmp word ptr es:[0x124], 0               
  0eea  742d             je 0xf19                                 
  0eec  8ec0             mov es, ax                               
  0eee  268b1e1001       mov bx, word ptr es:[0x110]              
  0ef3  d1e3             shl bx, 1                                
  0ef5  b8042c           mov ax, 0x2c04                           
  0ef8  8ec0             mov es, ax                               
  0efa  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0f00  7417             je 0xf19                                 
  0f02  b8042c           mov ax, 0x2c04                           
  0f05  8ec0             mov es, ax                               
  0f07  26833e590100     cmp word ptr es:[0x159], 0               
  0f0d  750a             jne 0xf19                                
  0f0f  833e282d00       cmp word ptr [0x2d28], 0                 
  0f14  7503             jne 0xf19                                
  0f16  e9b603           jmp 0x12cf                               
  0f19  66837e0600       cmp dword ptr [bp + 6], 0                
  0f1e  7416             je 0xf36                                 
  0f20  c45e06           les bx, ptr [bp + 6]                     
  0f23  26837f0408       cmp word ptr es:[bx + 4], 8              
  0f28  7f0c             jg 0xf36                                 
  0f2a  26837f0608       cmp word ptr es:[bx + 6], 8              
  0f2f  7f05             jg 0xf36                                 
  0f31  b80100           mov ax, 1                                
  0f34  eb02             jmp 0xf38                                
  0f36  33c0             xor ax, ax                               
  0f38  8946f0           mov word ptr [bp - 0x10], ax             
  0f3b  837ef000         cmp word ptr [bp - 0x10], 0              
  0f3f  7407             je 0xf48                                 
  0f41  8cda             mov dx, ds                               
  0f43  b8ea2c           mov ax, 0x2cea                           
  0f46  eb05             jmp 0xf4d                                
  0f48  8cda             mov dx, ds                               
  0f4a  b89567           mov ax, 0x6795                           
  0f4d  8956ee           mov word ptr [bp - 0x12], dx             
  0f50  8946ec           mov word ptr [bp - 0x14], ax             
  0f53  8d46f2           lea ax, [bp - 0xe]                       
  0f56  16               push ss                                  
  0f57  50               push ax                                  
  0f58  66837e0600       cmp dword ptr [bp + 6], 0                
  0f5d  7408             je 0xf67                                 
  0f5f  8b5608           mov dx, word ptr [bp + 8]                
  0f62  8b4606           mov ax, word ptr [bp + 6]                
  0f65  eb05             jmp 0xf6c                                
  0f67  b8882a           mov ax, 0x2a88                           
  0f6a  8cda             mov dx, ds                               
  0f6c  52               push dx                                  
  0f6d  50               push ax                                  
  0f6e  b90800           mov cx, 8                                
  0f71  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0f76  836ef208         sub word ptr [bp - 0xe], 8               
  0f7a  8346f60c         add word ptr [bp - 0xa], 0xc             
  0f7e  836ef408         sub word ptr [bp - 0xc], 8               
  0f82  8346f80c         add word ptr [bp - 8], 0xc               
  0f86  c746fe0000       mov word ptr [bp - 2], 0                 
  0f8b  e93003           jmp 0x12be                               
  0f8e  8b5efe           mov bx, word ptr [bp - 2]                
  0f91  6bdb41           imul bx, bx, 0x41                        
  0f94  b8042c           mov ax, 0x2c04                           
  0f97  8ec0             mov es, ax                               
  0f99  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  0f9e  8b5efe           mov bx, word ptr [bp - 2]                
  0fa1  6bdb41           imul bx, bx, 0x41                        
  0fa4  b8042c           mov ax, 0x2c04                           
  0fa7  8ec0             mov es, ax                               
  0fa9  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0fae  8946fc           mov word ptr [bp - 4], ax                
  0fb1  b8042c           mov ax, 0x2c04                           
  0fb4  8ec0             mov es, ax                               
  0fb6  26833e240100     cmp word ptr es:[0x124], 0               
  0fbc  7503             jne 0xfc1                                
  0fbe  e92d01           jmp 0x10ee                               
  0fc1  66837e0600       cmp dword ptr [bp + 6], 0                
  0fc6  7430             je 0xff8                                 
  0fc8  3b7ef2           cmp di, word ptr [bp - 0xe]              
  0fcb  7d03             jge 0xfd0                                
  0fcd  e9eb02           jmp 0x12bb                               
  0fd0  8b46f2           mov ax, word ptr [bp - 0xe]              
  0fd3  0346f6           add ax, word ptr [bp - 0xa]              
  0fd6  48               dec ax                                   
  0fd7  3bc7             cmp ax, di                               
  0fd9  7d03             jge 0xfde                                
  0fdb  e9dd02           jmp 0x12bb                               
  0fde  8b46fc           mov ax, word ptr [bp - 4]                
  0fe1  3b46f4           cmp ax, word ptr [bp - 0xc]              
  0fe4  7d03             jge 0xfe9                                
  0fe6  e9d202           jmp 0x12bb                               
  0fe9  8b46f4           mov ax, word ptr [bp - 0xc]              
  0fec  0346f8           add ax, word ptr [bp - 8]                
  0fef  48               dec ax                                   
  0ff0  3b46fc           cmp ax, word ptr [bp - 4]                
  0ff3  7d03             jge 0xff8                                
  0ff5  e9c302           jmp 0x12bb                               
  0ff8  833e543200       cmp word ptr [0x3254], 0                 
  0ffd  757c             jne 0x107b                               
  0fff  8b5efc           mov bx, word ptr [bp - 4]                
  1002  6bdb70           imul bx, bx, 0x70                        
  1005  03df             add bx, di                               
  1007  b8d919           mov ax, 0x19d9                           
  100a  8ec0             mov es, ax                               
  100c  268a870000       mov al, byte ptr es:[bx]                 
  1011  c1e805           shr ax, 5                                
  1014  250100           and ax, 1                                
  1017  0bc0             or ax, ax                                
  1019  7403             je 0x101e                                
  101b  e9d000           jmp 0x10ee                               
  101e  8b5efc           mov bx, word ptr [bp - 4]                
  1021  6bdb70           imul bx, bx, 0x70                        
  1024  03df             add bx, di                               
  1026  b8d919           mov ax, 0x19d9                           
  1029  8ec0             mov es, ax                               
  102b  268a870100       mov al, byte ptr es:[bx + 1]             
  1030  c1e805           shr ax, 5                                
  1033  250100           and ax, 1                                
  1036  0bc0             or ax, ax                                
  1038  7403             je 0x103d                                
  103a  e9b100           jmp 0x10ee                               
  103d  8b5efc           mov bx, word ptr [bp - 4]                
  1040  6bdb70           imul bx, bx, 0x70                        
  1043  03df             add bx, di                               
  1045  b8d919           mov ax, 0x19d9                           
  1048  8ec0             mov es, ax                               
  104a  268a877000       mov al, byte ptr es:[bx + 0x70]          
  104f  c1e805           shr ax, 5                                
  1052  250100           and ax, 1                                
  1055  0bc0             or ax, ax                                
  1057  7403             je 0x105c                                
  1059  e99200           jmp 0x10ee                               
  105c  8b5efc           mov bx, word ptr [bp - 4]                
  105f  6bdb70           imul bx, bx, 0x70                        
  1062  03df             add bx, di                               
  1064  b8d919           mov ax, 0x19d9                           
  1067  8ec0             mov es, ax                               
  1069  268a877100       mov al, byte ptr es:[bx + 0x71]          
  106e  c1e805           shr ax, 5                                
  1071  250100           and ax, 1                                
  1074  0bc0             or ax, ax                                
  1076  7576             jne 0x10ee                               
  1078  e94002           jmp 0x12bb                               
  107b  8b5efc           mov bx, word ptr [bp - 4]                
  107e  6bdb70           imul bx, bx, 0x70                        
  1081  03df             add bx, di                               
  1083  b8d919           mov ax, 0x19d9                           
  1086  8ec0             mov es, ax                               
  1088  268a870000       mov al, byte ptr es:[bx]                 
  108d  c1e807           shr ax, 7                                
  1090  250100           and ax, 1                                
  1093  0bc0             or ax, ax                                
  1095  7557             jne 0x10ee                               
  1097  8b5efc           mov bx, word ptr [bp - 4]                
  109a  6bdb70           imul bx, bx, 0x70                        
  109d  03df             add bx, di                               
  109f  b8d919           mov ax, 0x19d9                           
  10a2  8ec0             mov es, ax                               
  10a4  268a870100       mov al, byte ptr es:[bx + 1]             
  10a9  c1e807           shr ax, 7                                
  10ac  250100           and ax, 1                                
  10af  0bc0             or ax, ax                                
  10b1  753b             jne 0x10ee                               
  10b3  8b5efc           mov bx, word ptr [bp - 4]                
  10b6  6bdb70           imul bx, bx, 0x70                        
  10b9  03df             add bx, di                               
  10bb  b8d919           mov ax, 0x19d9                           
  10be  8ec0             mov es, ax                               
  10c0  268a877000       mov al, byte ptr es:[bx + 0x70]          
  10c5  c1e807           shr ax, 7                                
  10c8  250100           and ax, 1                                
  10cb  0bc0             or ax, ax                                
  10cd  751f             jne 0x10ee                               
  10cf  8b5efc           mov bx, word ptr [bp - 4]                
  10d2  6bdb70           imul bx, bx, 0x70                        
  10d5  03df             add bx, di                               
  10d7  b8d919           mov ax, 0x19d9                           
  10da  8ec0             mov es, ax                               
  10dc  268a877100       mov al, byte ptr es:[bx + 0x71]          
  10e1  c1e807           shr ax, 7                                
  10e4  250100           and ax, 1                                
  10e7  0bc0             or ax, ax                                
  10e9  7503             jne 0x10ee                               
  10eb  e9cd01           jmp 0x12bb                               
  10ee  d1e7             shl di, 1                                
  10f0  4f               dec di                                   
  10f1  8b46fc           mov ax, word ptr [bp - 4]                
  10f4  d1e0             shl ax, 1                                
  10f6  48               dec ax                                   
  10f7  8946fc           mov word ptr [bp - 4], ax                
  10fa  8bc7             mov ax, di                               
  10fc  250700           and ax, 7                                
  10ff  8946fa           mov word ptr [bp - 6], ax                
  1102  c1ff03           sar di, 3                                
  1105  c1e703           shl di, 3                                
  1108  837ef000         cmp word ptr [bp - 0x10], 0              
  110c  740a             je 0x1118                                
  110e  2b3e9a5e         sub di, word ptr [0x5e9a]                
  1112  a19c5e           mov ax, word ptr [0x5e9c]                
  1115  2946fc           sub word ptr [bp - 4], ax                
  1118  837ef000         cmp word ptr [bp - 0x10], 0              
  111c  7421             je 0x113f                                
  111e  0bff             or di, di                                
  1120  7d03             jge 0x1125                               
  1122  e99601           jmp 0x12bb                               
  1125  837efc00         cmp word ptr [bp - 4], 0                 
  1129  7d03             jge 0x112e                               
  112b  e98d01           jmp 0x12bb                               
  112e  83ff10           cmp di, 0x10                             
  1131  7e03             jle 0x1136                               
  1133  e98501           jmp 0x12bb                               
  1136  837efc16         cmp word ptr [bp - 4], 0x16              
  113a  7e03             jle 0x113f                               
  113c  e97c01           jmp 0x12bb                               
  113f  8b5efe           mov bx, word ptr [bp - 2]                
  1142  6bdb41           imul bx, bx, 0x41                        
  1145  b8042c           mov ax, 0x2c04                           
  1148  8ec0             mov es, ax                               
  114a  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  114f  69dbe000         imul bx, bx, 0xe0                        
  1153  8b76fe           mov si, word ptr [bp - 2]                
  1156  6bf641           imul si, si, 0x41                        
  1159  b8042c           mov ax, 0x2c04                           
  115c  8ec0             mov es, ax                               
  115e  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1163  d1e0             shl ax, 1                                
  1165  03d8             add bx, ax                               
  1167  b81d1e           mov ax, 0x1e1d                           
  116a  8ec0             mov es, ax                               
  116c  268a9f0000       mov bl, byte ptr es:[bx]                 
  1171  81e3ff00         and bx, 0xff                             
  1175  b8042c           mov ax, 0x2c04                           
  1178  8ec0             mov es, ax                               
  117a  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1180  7405             je 0x1187                                
  1182  beffff           mov si, 0xffff                           
  1185  eb2b             jmp 0x11b2                               
  1187  8b5efe           mov bx, word ptr [bp - 2]                
  118a  6bdb41           imul bx, bx, 0x41                        
  118d  b8042c           mov ax, 0x2c04                           
  1190  8ec0             mov es, ax                               
  1192  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  1198  7505             jne 0x119f                               
  119a  be0800           mov si, 8                                
  119d  eb13             jmp 0x11b2                               
  119f  8b5efe           mov bx, word ptr [bp - 2]                
  11a2  6bdb41           imul bx, bx, 0x41                        
  11a5  b8042c           mov ax, 0x2c04                           
  11a8  8ec0             mov es, ax                               
  11aa  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  11af  98               cwde                                     
  11b0  8bf0             mov si, ax                               
  11b2  0bf6             or si, si                                
  11b4  7d03             jge 0x11b9                               
  11b6  e98700           jmp 0x1240                               
  11b9  6a09             push 9                                   
  11bb  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  11c0  59               pop cx                                   
  11c1  6a09             push 9                                   
  11c3  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  11c8  59               pop cx                                   
  11c9  8bde             mov bx, si                               
  11cb  c1e303           shl bx, 3                                
  11ce  8b87302c         mov ax, word ptr [bx + 0x2c30]           
  11d2  8bde             mov bx, si                               
  11d4  c1e303           shl bx, 3                                
  11d7  50               push ax                                  
  11d8  8b46fa           mov ax, word ptr [bp - 6]                
  11db  f7af342c         imul word ptr [bx + 0x2c34]              
  11df  5a               pop dx                                   
  11e0  03d0             add dx, ax                               
  11e2  52               push dx                                  
  11e3  8bde             mov bx, si                               
  11e5  c1e303           shl bx, 3                                
  11e8  ffb72e2c         push word ptr [bx + 0x2c2e]              
  11ec  1e               push ds                                  
  11ed  686c57           push 0x576c                              
  11f0  ff76fc           push word ptr [bp - 4]                   
  11f3  57               push di                                  
  11f4  66ff76ec         push dword ptr [bp - 0x14]               
  11f8  8bde             mov bx, si                               
  11fa  c1e303           shl bx, 3                                
  11fd  ffb7342c         push word ptr [bx + 0x2c34]              
  1201  8bde             mov bx, si                               
  1203  c1e303           shl bx, 3                                
  1206  ffb7322c         push word ptr [bx + 0x2c32]              
  120a  8bde             mov bx, si                               
  120c  c1e303           shl bx, 3                                
  120f  8b87302c         mov ax, word ptr [bx + 0x2c30]           
  1213  8bde             mov bx, si                               
  1215  c1e303           shl bx, 3                                
  1218  50               push ax                                  
  1219  8b46fa           mov ax, word ptr [bp - 6]                
  121c  f7af342c         imul word ptr [bx + 0x2c34]              
  1220  5a               pop dx                                   
  1221  03d0             add dx, ax                               
  1223  52               push dx                                  
  1224  8bde             mov bx, si                               
  1226  c1e303           shl bx, 3                                
  1229  ffb72e2c         push word ptr [bx + 0x2c2e]              
  122d  1e               push ds                                  
  122e  68a757           push 0x57a7                              
  1231  ff1ec869         lcall [0x69c8]                           
  1235  83c41c           add sp, 0x1c                             
  1238  6a09             push 9                                   
  123a  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  123f  59               pop cx                                   
  1240  8b46fe           mov ax, word ptr [bp - 2]                
  1243  3b460a           cmp ax, word ptr [bp + 0xa]              
  1246  7573             jne 0x12bb                               
  1248  037efa           add di, word ptr [bp - 6]                
  124b  66680a000f00     push 0xf000a                             
  1251  8b46fc           mov ax, word ptr [bp - 4]                
  1254  48               dec ax                                   
  1255  50               push ax                                  
  1256  8bc7             mov ax, di                               
  1258  48               dec ax                                   
  1259  50               push ax                                  
  125a  1e               push ds                                  
  125b  689567           push 0x6795                              
  125e  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  1263  83c40c           add sp, 0xc                              
  1266  66680a000f00     push 0xf000a                             
  126c  8b46fc           mov ax, word ptr [bp - 4]                
  126f  050900           add ax, 9                                
  1272  50               push ax                                  
  1273  8bc7             mov ax, di                               
  1275  48               dec ax                                   
  1276  50               push ax                                  
  1277  1e               push ds                                  
  1278  689567           push 0x6795                              
  127b  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  1280  83c40c           add sp, 0xc                              
  1283  66680a000f00     push 0xf000a                             
  1289  8b46fc           mov ax, word ptr [bp - 4]                
  128c  48               dec ax                                   
  128d  50               push ax                                  
  128e  8bc7             mov ax, di                               
  1290  48               dec ax                                   
  1291  50               push ax                                  
  1292  1e               push ds                                  
  1293  689567           push 0x6795                              
  1296  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  129b  83c40c           add sp, 0xc                              
  129e  66680a000f00     push 0xf000a                             
  12a4  8b46fc           mov ax, word ptr [bp - 4]                
  12a7  48               dec ax                                   
  12a8  50               push ax                                  
  12a9  8bc7             mov ax, di                               
  12ab  050900           add ax, 9                                
  12ae  50               push ax                                  
  12af  1e               push ds                                  
  12b0  689567           push 0x6795                              
  12b3  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  12b8  83c40c           add sp, 0xc                              
  12bb  ff46fe           inc word ptr [bp - 2]                    
  12be  b8042c           mov ax, 0x2c04                           
  12c1  8ec0             mov es, ax                               
  12c3  26a17b15         mov ax, word ptr es:[0x157b]             
  12c7  3b46fe           cmp ax, word ptr [bp - 2]                
  12ca  7e03             jle 0x12cf                               
  12cc  e9bffc           jmp 0xf8e                                
  12cf  5f               pop di                                   
  12d0  5e               pop si                                   
  12d1  c9               leave                                    
  12d2  cb               retf                                     

ovl63_12d3:  ; ENTRY
  12d3  55               push bp                                  
  12d4  8bec             mov bp, sp                               
  12d6  83ec0e           sub sp, 0xe                              
  12d9  56               push si                                  
  12da  57               push di                                  
  12db  b8042c           mov ax, 0x2c04                           
  12de  8ec0             mov es, ax                               
  12e0  26833e240100     cmp word ptr es:[0x124], 0               
  12e6  7426             je 0x130e                                
  12e8  8ec0             mov es, ax                               
  12ea  268b1e1001       mov bx, word ptr es:[0x110]              
  12ef  d1e3             shl bx, 1                                
  12f1  b8042c           mov ax, 0x2c04                           
  12f4  8ec0             mov es, ax                               
  12f6  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  12fc  7410             je 0x130e                                
  12fe  b8042c           mov ax, 0x2c04                           
  1301  8ec0             mov es, ax                               
  1303  26833e590100     cmp word ptr es:[0x159], 0               
  1309  7503             jne 0x130e                               
  130b  e97b02           jmp 0x1589                               
  130e  8d46f2           lea ax, [bp - 0xe]                       
  1311  16               push ss                                  
  1312  50               push ax                                  
  1313  66837e0600       cmp dword ptr [bp + 6], 0                
  1318  7408             je 0x1322                                
  131a  8b5608           mov dx, word ptr [bp + 8]                
  131d  8b4606           mov ax, word ptr [bp + 6]                
  1320  eb05             jmp 0x1327                               
  1322  b8882a           mov ax, 0x2a88                           
  1325  8cda             mov dx, ds                               
  1327  52               push dx                                  
  1328  50               push ax                                  
  1329  b90800           mov cx, 8                                
  132c  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1331  836ef208         sub word ptr [bp - 0xe], 8               
  1335  8346f60c         add word ptr [bp - 0xa], 0xc             
  1339  836ef408         sub word ptr [bp - 0xc], 8               
  133d  8346f80c         add word ptr [bp - 8], 0xc               
  1341  c746fe0000       mov word ptr [bp - 2], 0                 
  1346  e92f02           jmp 0x1578                               
  1349  8b5efe           mov bx, word ptr [bp - 2]                
  134c  6bdb41           imul bx, bx, 0x41                        
  134f  b8042c           mov ax, 0x2c04                           
  1352  8ec0             mov es, ax                               
  1354  268bb77d15       mov si, word ptr es:[bx + 0x157d]        
  1359  8b5efe           mov bx, word ptr [bp - 2]                
  135c  6bdb41           imul bx, bx, 0x41                        
  135f  b8042c           mov ax, 0x2c04                           
  1362  8ec0             mov es, ax                               
  1364  268bbf7f15       mov di, word ptr es:[bx + 0x157f]        
  1369  b8042c           mov ax, 0x2c04                           
  136c  8ec0             mov es, ax                               
  136e  26833e240100     cmp word ptr es:[0x124], 0               
  1374  746f             je 0x13e5                                
  1376  8bdf             mov bx, di                               
  1378  6bdb70           imul bx, bx, 0x70                        
  137b  03de             add bx, si                               
  137d  b8d919           mov ax, 0x19d9                           
  1380  8ec0             mov es, ax                               
  1382  268a870000       mov al, byte ptr es:[bx]                 
  1387  c1e805           shr ax, 5                                
  138a  250100           and ax, 1                                
  138d  0bc0             or ax, ax                                
  138f  7554             jne 0x13e5                               
  1391  8bdf             mov bx, di                               
  1393  6bdb70           imul bx, bx, 0x70                        
  1396  03de             add bx, si                               
  1398  b8d919           mov ax, 0x19d9                           
  139b  8ec0             mov es, ax                               
  139d  268a870100       mov al, byte ptr es:[bx + 1]             
  13a2  c1e805           shr ax, 5                                
  13a5  250100           and ax, 1                                
  13a8  0bc0             or ax, ax                                
  13aa  7539             jne 0x13e5                               
  13ac  8bdf             mov bx, di                               
  13ae  6bdb70           imul bx, bx, 0x70                        
  13b1  03de             add bx, si                               
  13b3  b8d919           mov ax, 0x19d9                           
  13b6  8ec0             mov es, ax                               
  13b8  268a877000       mov al, byte ptr es:[bx + 0x70]          
  13bd  c1e805           shr ax, 5                                
  13c0  250100           and ax, 1                                
  13c3  0bc0             or ax, ax                                
  13c5  751e             jne 0x13e5                               
  13c7  8bdf             mov bx, di                               
  13c9  6bdb70           imul bx, bx, 0x70                        
  13cc  03de             add bx, si                               
  13ce  b8d919           mov ax, 0x19d9                           
  13d1  8ec0             mov es, ax                               
  13d3  268a877100       mov al, byte ptr es:[bx + 0x71]          
  13d8  c1e805           shr ax, 5                                
  13db  250100           and ax, 1                                
  13de  0bc0             or ax, ax                                
  13e0  7503             jne 0x13e5                               
  13e2  e99001           jmp 0x1575                               
  13e5  d1e6             shl si, 1                                
  13e7  4e               dec si                                   
  13e8  d1e7             shl di, 1                                
  13ea  4f               dec di                                   
  13eb  8bc6             mov ax, si                               
  13ed  250700           and ax, 7                                
  13f0  8946fa           mov word ptr [bp - 6], ax                
  13f3  c1fe03           sar si, 3                                
  13f6  c1e603           shl si, 3                                
  13f9  c45e0a           les bx, ptr [bp + 0xa]                   
  13fc  035efe           add bx, word ptr [bp - 2]                
  13ff  26803fff         cmp byte ptr es:[bx], 0xff               
  1403  7507             jne 0x140c                               
  1405  c746fcffff       mov word ptr [bp - 4], 0xffff            
  140a  eb20             jmp 0x142c                               
  140c  c45e0a           les bx, ptr [bp + 0xa]                   
  140f  035efe           add bx, word ptr [bp - 2]                
  1412  26803f0f         cmp byte ptr es:[bx], 0xf                
  1416  7507             jne 0x141f                               
  1418  c746fc0800       mov word ptr [bp - 4], 8                 
  141d  eb0d             jmp 0x142c                               
  141f  c45e0a           les bx, ptr [bp + 0xa]                   
  1422  035efe           add bx, word ptr [bp - 2]                
  1425  268a07           mov al, byte ptr es:[bx]                 
  1428  98               cwde                                     
  1429  8946fc           mov word ptr [bp - 4], ax                
  142c  837efc00         cmp word ptr [bp - 4], 0                 
  1430  7d03             jge 0x1435                               
  1432  e99000           jmp 0x14c5                               
  1435  6a09             push 9                                   
  1437  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  143c  59               pop cx                                   
  143d  6a09             push 9                                   
  143f  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  1444  59               pop cx                                   
  1445  8b5efc           mov bx, word ptr [bp - 4]                
  1448  c1e303           shl bx, 3                                
  144b  8b87302c         mov ax, word ptr [bx + 0x2c30]           
  144f  8b5efc           mov bx, word ptr [bp - 4]                
  1452  c1e303           shl bx, 3                                
  1455  50               push ax                                  
  1456  8b46fa           mov ax, word ptr [bp - 6]                
  1459  f7af342c         imul word ptr [bx + 0x2c34]              
  145d  5a               pop dx                                   
  145e  03d0             add dx, ax                               
  1460  52               push dx                                  
  1461  8b5efc           mov bx, word ptr [bp - 4]                
  1464  c1e303           shl bx, 3                                
  1467  ffb72e2c         push word ptr [bx + 0x2c2e]              
  146b  1e               push ds                                  
  146c  686c57           push 0x576c                              
  146f  57               push di                                  
  1470  56               push si                                  
  1471  1e               push ds                                  
  1472  689567           push 0x6795                              
  1475  8b5efc           mov bx, word ptr [bp - 4]                
  1478  c1e303           shl bx, 3                                
  147b  ffb7342c         push word ptr [bx + 0x2c34]              
  147f  8b5efc           mov bx, word ptr [bp - 4]                
  1482  c1e303           shl bx, 3                                
  1485  ffb7322c         push word ptr [bx + 0x2c32]              
  1489  8b5efc           mov bx, word ptr [bp - 4]                
  148c  c1e303           shl bx, 3                                
  148f  8b87302c         mov ax, word ptr [bx + 0x2c30]           
  1493  8b5efc           mov bx, word ptr [bp - 4]                
  1496  c1e303           shl bx, 3                                
  1499  50               push ax                                  
  149a  8b46fa           mov ax, word ptr [bp - 6]                
  149d  f7af342c         imul word ptr [bx + 0x2c34]              
  14a1  5a               pop dx                                   
  14a2  03d0             add dx, ax                               
  14a4  52               push dx                                  
  14a5  8b5efc           mov bx, word ptr [bp - 4]                
  14a8  c1e303           shl bx, 3                                
  14ab  ffb72e2c         push word ptr [bx + 0x2c2e]              
  14af  1e               push ds                                  
  14b0  68a757           push 0x57a7                              
  14b3  ff1ec869         lcall [0x69c8]                           
  14b7  83c41c           add sp, 0x1c                             
  14ba  6a09             push 9                                   
  14bc  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  14c1  59               pop cx                                   
  14c2  e9b000           jmp 0x1575                               
  14c5  6a09             push 9                                   
  14c7  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  14cc  59               pop cx                                   
  14cd  6a09             push 9                                   
  14cf  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  14d4  59               pop cx                                   
  14d5  8b46fa           mov ax, word ptr [bp - 6]                
  14d8  f72e742c         imul word ptr [0x2c74]                   
  14dc  8b16702c         mov dx, word ptr [0x2c70]                
  14e0  03d0             add dx, ax                               
  14e2  52               push dx                                  
  14e3  ff366e2c         push word ptr [0x2c6e]                   
  14e7  1e               push ds                                  
  14e8  686c57           push 0x576c                              
  14eb  57               push di                                  
  14ec  56               push si                                  
  14ed  1e               push ds                                  
  14ee  689567           push 0x6795                              
  14f1  66ff36722c       push dword ptr [0x2c72]                  
  14f6  8b46fa           mov ax, word ptr [bp - 6]                
  14f9  f72e742c         imul word ptr [0x2c74]                   
  14fd  8b16702c         mov dx, word ptr [0x2c70]                
  1501  03d0             add dx, ax                               
  1503  52               push dx                                  
  1504  ff366e2c         push word ptr [0x2c6e]                   
  1508  1e               push ds                                  
  1509  68a757           push 0x57a7                              
  150c  ff1ec869         lcall [0x69c8]                           
  1510  83c41c           add sp, 0x1c                             
  1513  6a09             push 9                                   
  1515  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  151a  59               pop cx                                   
  151b  6a00             push 0                                   
  151d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1522  59               pop cx                                   
  1523  666a00           push 0                                   
  1526  8bc7             mov ax, di                               
  1528  050600           add ax, 6                                
  152b  50               push ax                                  
  152c  8bc6             mov ax, si                               
  152e  0346fa           add ax, word ptr [bp - 6]                
  1531  050600           add ax, 6                                
  1534  50               push ax                                  
  1535  8bc7             mov ax, di                               
  1537  40               inc ax                                   
  1538  50               push ax                                  
  1539  8bc6             mov ax, si                               
  153b  0346fa           add ax, word ptr [bp - 6]                
  153e  40               inc ax                                   
  153f  50               push ax                                  
  1540  1e               push ds                                  
  1541  689567           push 0x6795                              
  1544  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  1549  83c410           add sp, 0x10                             
  154c  666a00           push 0                                   
  154f  8bc7             mov ax, di                               
  1551  40               inc ax                                   
  1552  50               push ax                                  
  1553  8bc6             mov ax, si                               
  1555  0346fa           add ax, word ptr [bp - 6]                
  1558  050600           add ax, 6                                
  155b  50               push ax                                  
  155c  8bc7             mov ax, di                               
  155e  050700           add ax, 7                                
  1561  50               push ax                                  
  1562  8bc6             mov ax, si                               
  1564  0346fa           add ax, word ptr [bp - 6]                
  1567  40               inc ax                                   
  1568  50               push ax                                  
  1569  1e               push ds                                  
  156a  689567           push 0x6795                              
  156d  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  1572  83c410           add sp, 0x10                             
  1575  ff46fe           inc word ptr [bp - 2]                    
  1578  b8042c           mov ax, 0x2c04                           
  157b  8ec0             mov es, ax                               
  157d  26a17b15         mov ax, word ptr es:[0x157b]             
  1581  3b46fe           cmp ax, word ptr [bp - 2]                
  1584  7e03             jle 0x1589                               
  1586  e9c0fd           jmp 0x1349                               
  1589  5f               pop di                                   
  158a  5e               pop si                                   
  158b  c9               leave                                    
  158c  cb               retf                                     

ovl63_158d:  ; ENTRY
  158d  55               push bp                                  
  158e  8bec             mov bp, sp                               
  1590  83ec0e           sub sp, 0xe                              
  1593  56               push si                                  
  1594  57               push di                                  
  1595  b8042c           mov ax, 0x2c04                           
  1598  8ec0             mov es, ax                               
  159a  26833e240100     cmp word ptr es:[0x124], 0               
  15a0  7426             je 0x15c8                                
  15a2  8ec0             mov es, ax                               
  15a4  268b1e1001       mov bx, word ptr es:[0x110]              
  15a9  d1e3             shl bx, 1                                
  15ab  b8042c           mov ax, 0x2c04                           
  15ae  8ec0             mov es, ax                               
  15b0  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  15b6  7410             je 0x15c8                                
  15b8  b8042c           mov ax, 0x2c04                           
  15bb  8ec0             mov es, ax                               
  15bd  26833e590100     cmp word ptr es:[0x159], 0               
  15c3  7503             jne 0x15c8                               
  15c5  e94b02           jmp 0x1813                               
  15c8  8d46f2           lea ax, [bp - 0xe]                       
  15cb  16               push ss                                  
  15cc  50               push ax                                  
  15cd  66837e0600       cmp dword ptr [bp + 6], 0                
  15d2  7408             je 0x15dc                                
  15d4  8b5608           mov dx, word ptr [bp + 8]                
  15d7  8b4606           mov ax, word ptr [bp + 6]                
  15da  eb05             jmp 0x15e1                               
  15dc  b8882a           mov ax, 0x2a88                           
  15df  8cda             mov dx, ds                               
  15e1  52               push dx                                  
  15e2  50               push ax                                  
  15e3  b90800           mov cx, 8                                
  15e6  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  15eb  836ef208         sub word ptr [bp - 0xe], 8               
  15ef  8346f60c         add word ptr [bp - 0xa], 0xc             
  15f3  836ef408         sub word ptr [bp - 0xc], 8               
  15f7  8346f80c         add word ptr [bp - 8], 0xc               
  15fb  33f6             xor si, si                               
  15fd  eb23             jmp 0x1622                               
  15ff  33ff             xor di, di                               
  1601  eb18             jmp 0x161b                               
  1603  8bdf             mov bx, di                               
  1605  69dbe000         imul bx, bx, 0xe0                        
  1609  8bc6             mov ax, si                               
  160b  d1e0             shl ax, 1                                
  160d  03d8             add bx, ax                               
  160f  b81d1e           mov ax, 0x1e1d                           
  1612  8ec0             mov es, ax                               
  1614  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  161a  47               inc di                                   
  161b  81ff9c00         cmp di, 0x9c                             
  161f  7ce2             jl 0x1603                                
  1621  46               inc si                                   
  1622  83fe70           cmp si, 0x70                             
  1625  7cd8             jl 0x15ff                                
  1627  c746fa0000       mov word ptr [bp - 6], 0                 
  162c  e9d301           jmp 0x1802                               
  162f  8b5efa           mov bx, word ptr [bp - 6]                
  1632  6bdb16           imul bx, bx, 0x16                        
  1635  b81d1e           mov ax, 0x1e1d                           
  1638  ba0000           mov dx, 0                                
  163b  81c28088         add dx, 0x8880                           
  163f  03da             add bx, dx                               
  1641  8ec0             mov es, ax                               
  1643  268b37           mov si, word ptr es:[bx]                 
  1646  8b5efa           mov bx, word ptr [bp - 6]                
  1649  6bdb16           imul bx, bx, 0x16                        
  164c  b81d1e           mov ax, 0x1e1d                           
  164f  8ec0             mov es, ax                               
  1651  268bbf8288       mov di, word ptr es:[bx - 0x777e]        
  1656  0bf6             or si, si                                
  1658  7d03             jge 0x165d                               
  165a  e9a201           jmp 0x17ff                               
  165d  0bff             or di, di                                
  165f  7d03             jge 0x1664                               
  1661  e99b01           jmp 0x17ff                               
  1664  8bdf             mov bx, di                               
  1666  69dbe000         imul bx, bx, 0xe0                        
  166a  8bc6             mov ax, si                               
  166c  d1e0             shl ax, 1                                
  166e  03d8             add bx, ax                               
  1670  b81d1e           mov ax, 0x1e1d                           
  1673  8ec0             mov es, ax                               
  1675  268a870100       mov al, byte ptr es:[bx + 1]             
  167a  c1e804           shr ax, 4                                
  167d  250100           and ax, 1                                
  1680  0bc0             or ax, ax                                
  1682  7403             je 0x1687                                
  1684  e97801           jmp 0x17ff                               
  1687  8bdf             mov bx, di                               
  1689  69dbe000         imul bx, bx, 0xe0                        
  168d  8bc6             mov ax, si                               
  168f  d1e0             shl ax, 1                                
  1691  03d8             add bx, ax                               
  1693  b81d1e           mov ax, 0x1e1d                           
  1696  8ec0             mov es, ax                               
  1698  26808f010010     or byte ptr es:[bx + 1], 0x10            
  169e  b8042c           mov ax, 0x2c04                           
  16a1  8ec0             mov es, ax                               
  16a3  26833e240100     cmp word ptr es:[0x124], 0               
  16a9  741e             je 0x16c9                                
  16ab  8bdf             mov bx, di                               
  16ad  6bdb70           imul bx, bx, 0x70                        
  16b0  03de             add bx, si                               
  16b2  b8d919           mov ax, 0x19d9                           
  16b5  8ec0             mov es, ax                               
  16b7  268a870000       mov al, byte ptr es:[bx]                 
  16bc  c1e805           shr ax, 5                                
  16bf  250100           and ax, 1                                
  16c2  0bc0             or ax, ax                                
  16c4  7503             jne 0x16c9                               
  16c6  e93601           jmp 0x17ff                               
  16c9  837e1000         cmp word ptr [bp + 0x10], 0              
  16cd  742a             je 0x16f9                                
  16cf  8bdf             mov bx, di                               
  16d1  69dbe000         imul bx, bx, 0xe0                        
  16d5  8bc6             mov ax, si                               
  16d7  d1e0             shl ax, 1                                
  16d9  03d8             add bx, ax                               
  16db  b81d1e           mov ax, 0x1e1d                           
  16de  8ec0             mov es, ax                               
  16e0  268a9f0000       mov bl, byte ptr es:[bx]                 
  16e5  81e3ff00         and bx, 0xff                             
  16e9  b8042c           mov ax, 0x2c04                           
  16ec  8ec0             mov es, ax                               
  16ee  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  16f4  7503             jne 0x16f9                               
  16f6  e90601           jmp 0x17ff                               
  16f9  8b5efa           mov bx, word ptr [bp - 6]                
  16fc  6bdb16           imul bx, bx, 0x16                        
  16ff  b81d1e           mov ax, 0x1e1d                           
  1702  8ec0             mov es, ax                               
  1704  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1709  98               cwde                                     
  170a  8946fe           mov word ptr [bp - 2], ax                
  170d  837efe0f         cmp word ptr [bp - 2], 0xf               
  1711  7505             jne 0x1718                               
  1713  c746fe0800       mov word ptr [bp - 2], 8                 
  1718  837e0e00         cmp word ptr [bp + 0xe], 0               
  171c  7411             je 0x172f                                
  171e  b8042c           mov ax, 0x2c04                           
  1721  8ec0             mov es, ax                               
  1723  26a11001         mov ax, word ptr es:[0x110]              
  1727  3b46fe           cmp ax, word ptr [bp - 2]                
  172a  7503             jne 0x172f                               
  172c  e9d000           jmp 0x17ff                               
  172f  837e0a00         cmp word ptr [bp + 0xa], 0               
  1733  7c19             jl 0x174e                                
  1735  8b5efa           mov bx, word ptr [bp - 6]                
  1738  6bdb16           imul bx, bx, 0x16                        
  173b  b81d1e           mov ax, 0x1e1d                           
  173e  8ec0             mov es, ax                               
  1740  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1745  98               cwde                                     
  1746  3b460a           cmp ax, word ptr [bp + 0xa]              
  1749  7403             je 0x174e                                
  174b  e9b100           jmp 0x17ff                               
  174e  837e0c00         cmp word ptr [bp + 0xc], 0               
  1752  7c19             jl 0x176d                                
  1754  8b5efa           mov bx, word ptr [bp - 6]                
  1757  6bdb16           imul bx, bx, 0x16                        
  175a  b81d1e           mov ax, 0x1e1d                           
  175d  8ec0             mov es, ax                               
  175f  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1764  98               cwde                                     
  1765  3b460c           cmp ax, word ptr [bp + 0xc]              
  1768  7403             je 0x176d                                
  176a  e99200           jmp 0x17ff                               
  176d  d1e6             shl si, 1                                
  176f  4e               dec si                                   
  1770  d1e7             shl di, 1                                
  1772  4f               dec di                                   
  1773  8bc6             mov ax, si                               
  1775  250700           and ax, 7                                
  1778  8946fc           mov word ptr [bp - 4], ax                
  177b  c1fe03           sar si, 3                                
  177e  c1e603           shl si, 3                                
  1781  0bf6             or si, si                                
  1783  7d02             jge 0x1787                               
  1785  33f6             xor si, si                               
  1787  0bff             or di, di                                
  1789  7d02             jge 0x178d                               
  178b  33ff             xor di, di                               
  178d  6a09             push 9                                   
  178f  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1794  59               pop cx                                   
  1795  6a09             push 9                                   
  1797  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  179c  59               pop cx                                   
  179d  8b5efe           mov bx, word ptr [bp - 2]                
  17a0  c1e302           shl bx, 2                                
  17a3  8b87c02c         mov ax, word ptr [bx + 0x2cc0]           
  17a7  50               push ax                                  
  17a8  8b46fc           mov ax, word ptr [bp - 4]                
  17ab  f72ee82c         imul word ptr [0x2ce8]                   
  17af  5a               pop dx                                   
  17b0  03d0             add dx, ax                               
  17b2  52               push dx                                  
  17b3  8b5efe           mov bx, word ptr [bp - 2]                
  17b6  c1e302           shl bx, 2                                
  17b9  ffb7be2c         push word ptr [bx + 0x2cbe]              
  17bd  1e               push ds                                  
  17be  686c57           push 0x576c                              
  17c1  57               push di                                  
  17c2  56               push si                                  
  17c3  1e               push ds                                  
  17c4  689567           push 0x6795                              
  17c7  66ff36e62c       push dword ptr [0x2ce6]                  
  17cc  8b5efe           mov bx, word ptr [bp - 2]                
  17cf  c1e302           shl bx, 2                                
  17d2  8b87c02c         mov ax, word ptr [bx + 0x2cc0]           
  17d6  50               push ax                                  
  17d7  8b46fc           mov ax, word ptr [bp - 4]                
  17da  f72ee82c         imul word ptr [0x2ce8]                   
  17de  5a               pop dx                                   
  17df  03d0             add dx, ax                               
  17e1  52               push dx                                  
  17e2  8b5efe           mov bx, word ptr [bp - 2]                
  17e5  c1e302           shl bx, 2                                
  17e8  ffb7be2c         push word ptr [bx + 0x2cbe]              
  17ec  1e               push ds                                  
  17ed  68a757           push 0x57a7                              
  17f0  ff1ec869         lcall [0x69c8]                           
  17f4  83c41c           add sp, 0x1c                             
  17f7  6a09             push 9                                   
  17f9  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  17fe  59               pop cx                                   
  17ff  ff46fa           inc word ptr [bp - 6]                    
  1802  b8042c           mov ax, 0x2c04                           
  1805  8ec0             mov es, ax                               
  1807  26a18101         mov ax, word ptr es:[0x181]              
  180b  3b46fa           cmp ax, word ptr [bp - 6]                
  180e  7e03             jle 0x1813                               
  1810  e91cfe           jmp 0x162f                               
  1813  5f               pop di                                   
  1814  5e               pop si                                   
  1815  c9               leave                                    
  1816  cb               retf                                     

ovl63_1817:  ; ENTRY
  1817  55               push bp                                  
  1818  8bec             mov bp, sp                               
  181a  81ecf800         sub sp, 0xf8                             
  181e  56               push si                                  
  181f  57               push di                                  
  1820  c746d00000       mov word ptr [bp - 0x30], 0              
  1825  66837e0600       cmp dword ptr [bp + 6], 0                
  182a  7529             jne 0x1855                               
  182c  8d46de           lea ax, [bp - 0x22]                      
  182f  16               push ss                                  
  1830  50               push ax                                  
  1831  1e               push ds                                  
  1832  68882a           push 0x2a88                              
  1835  b90800           mov cx, 8                                
  1838  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  183d  666870009c00     push 0x9c0070                            
  1843  666a00           push 0                                   
  1846  16               push ss                                  
  1847  8d46e6           lea ax, [bp - 0x1a]                      
  184a  50               push ax                                  
  184b  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1850  83c40c           add sp, 0xc                              
  1853  eb37             jmp 0x188c                               
  1855  8d46e6           lea ax, [bp - 0x1a]                      
  1858  16               push ss                                  
  1859  50               push ax                                  
  185a  66ff7606         push dword ptr [bp + 6]                  
  185e  b90800           mov cx, 8                                
  1861  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1866  c45e06           les bx, ptr [bp + 6]                     
  1869  268b07           mov ax, word ptr es:[bx]                 
  186c  d1e0             shl ax, 1                                
  186e  8946de           mov word ptr [bp - 0x22], ax             
  1871  268b4702         mov ax, word ptr es:[bx + 2]             
  1875  d1e0             shl ax, 1                                
  1877  8946e0           mov word ptr [bp - 0x20], ax             
  187a  268b4704         mov ax, word ptr es:[bx + 4]             
  187e  d1e0             shl ax, 1                                
  1880  8946e2           mov word ptr [bp - 0x1e], ax             
  1883  268b4706         mov ax, word ptr es:[bx + 6]             
  1887  d1e0             shl ax, 1                                
  1889  8946e4           mov word ptr [bp - 0x1c], ax             
  188c  6a07             push 7                                   
  188e  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1893  59               pop cx                                   
  1894  6a07             push 7                                   
  1896  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  189b  59               pop cx                                   
  189c  b8042c           mov ax, 0x2c04                           
  189f  8ec0             mov es, ax                               
  18a1  26833e240100     cmp word ptr es:[0x124], 0               
  18a7  7438             je 0x18e1                                
  18a9  6a00             push 0                                   
  18ab  16               push ss                                  
  18ac  8d46de           lea ax, [bp - 0x22]                      
  18af  50               push ax                                  
  18b0  1e               push ds                                  
  18b1  689567           push 0x6795                              
  18b4  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  18b9  83c40a           add sp, 0xa                              
  18bc  66ff76de         push dword ptr [bp - 0x22]               
  18c0  1e               push ds                                  
  18c1  68e354           push 0x54e3                              
  18c4  66ff76de         push dword ptr [bp - 0x22]               
  18c8  1e               push ds                                  
  18c9  689567           push 0x6795                              
  18cc  66ff76e2         push dword ptr [bp - 0x1e]               
  18d0  66ff76de         push dword ptr [bp - 0x22]               
  18d4  1e               push ds                                  
  18d5  681d58           push 0x581d                              
  18d8  ff1ec869         lcall [0x69c8]                           
  18dc  83c41c           add sp, 0x1c                             
  18df  eb1b             jmp 0x18fc                               
  18e1  66ff76de         push dword ptr [bp - 0x22]               
  18e5  1e               push ds                                  
  18e6  689567           push 0x6795                              
  18e9  66ff76e2         push dword ptr [bp - 0x1e]               
  18ed  66ff76de         push dword ptr [bp - 0x22]               
  18f1  1e               push ds                                  
  18f2  681d58           push 0x581d                              
  18f5  ff1ed469         lcall [0x69d4]                           
  18f9  83c414           add sp, 0x14                             
  18fc  6a07             push 7                                   
  18fe  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  1903  59               pop cx                                   
  1904  33f6             xor si, si                               
  1906  eb10             jmp 0x1918                               
  1908  8bde             mov bx, si                               
  190a  d1e3             shl bx, 1                                
  190c  8d8608ff         lea ax, [bp - 0xf8]                      
  1910  03d8             add bx, ax                               
  1912  36c7070000       mov word ptr ss:[bx], 0                  
  1917  46               inc si                                   
  1918  b8042c           mov ax, 0x2c04                           
  191b  8ec0             mov es, ax                               
  191d  2639367b15       cmp word ptr es:[0x157b], si             
  1922  7fe4             jg 0x1908                                
  1924  33f6             xor si, si                               
  1926  e95f04           jmp 0x1d88                               
  1929  8bde             mov bx, si                               
  192b  6bdb41           imul bx, bx, 0x41                        
  192e  b8042c           mov ax, 0x2c04                           
  1931  8ec0             mov es, ax                               
  1933  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1938  98               cwde                                     
  1939  ba042c           mov dx, 0x2c04                           
  193c  8ec2             mov es, dx                               
  193e  263b061001       cmp ax, word ptr es:[0x110]              
  1943  7403             je 0x1948                                
  1945  e93f04           jmp 0x1d87                               
  1948  8bde             mov bx, si                               
  194a  d1e3             shl bx, 1                                
  194c  8d8608ff         lea ax, [bp - 0xf8]                      
  1950  03d8             add bx, ax                               
  1952  36833f00         cmp word ptr ss:[bx], 0                  
  1956  7403             je 0x195b                                
  1958  e92c04           jmp 0x1d87                               
  195b  8bde             mov bx, si                               
  195d  d1e3             shl bx, 1                                
  195f  8d8608ff         lea ax, [bp - 0xf8]                      
  1963  03d8             add bx, ax                               
  1965  36c7070100       mov word ptr ss:[bx], 1                  
  196a  16               push ss                                  
  196b  8d46d4           lea ax, [bp - 0x2c]                      
  196e  50               push ax                                  
  196f  16               push ss                                  
  1970  8d46d6           lea ax, [bp - 0x2a]                      
  1973  50               push ax                                  
  1974  56               push si                                  
  1975  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  197a  83c40a           add sp, 0xa                              
  197d  8bde             mov bx, si                               
  197f  6bdb41           imul bx, bx, 0x41                        
  1982  b8042c           mov ax, 0x2c04                           
  1985  8ec0             mov es, ax                               
  1987  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  198c  8bde             mov bx, si                               
  198e  6bdb41           imul bx, bx, 0x41                        
  1991  b8042c           mov ax, 0x2c04                           
  1994  8ec0             mov es, ax                               
  1996  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  199b  8946fe           mov word ptr [bp - 2], ax                
  199e  8bde             mov bx, si                               
  19a0  6bdb41           imul bx, bx, 0x41                        
  19a3  b8042c           mov ax, 0x2c04                           
  19a6  8ec0             mov es, ax                               
  19a8  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  19ae  7e04             jle 0x19b4                               
  19b0  33c0             xor ax, ax                               
  19b2  eb03             jmp 0x19b7                               
  19b4  b80300           mov ax, 3                                
  19b7  8946fc           mov word ptr [bp - 4], ax                
  19ba  8bde             mov bx, si                               
  19bc  6bdb41           imul bx, bx, 0x41                        
  19bf  b8042c           mov ax, 0x2c04                           
  19c2  8ec0             mov es, ax                               
  19c4  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  19ca  7405             je 0x19d1                                
  19cc  c746fc0200       mov word ptr [bp - 4], 2                 
  19d1  837ed400         cmp word ptr [bp - 0x2c], 0              
  19d5  7e1d             jle 0x19f4                               
  19d7  8bde             mov bx, si                               
  19d9  6bdb41           imul bx, bx, 0x41                        
  19dc  b8042c           mov ax, 0x2c04                           
  19df  8ec0             mov es, ax                               
  19e1  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  19e7  7e05             jle 0x19ee                               
  19e9  b80100           mov ax, 1                                
  19ec  eb03             jmp 0x19f1                               
  19ee  b80500           mov ax, 5                                
  19f1  8946fc           mov word ptr [bp - 4], ax                
  19f4  d1e7             shl di, 1                                
  19f6  83c7fe           add di, -2                               
  19f9  8b46fe           mov ax, word ptr [bp - 2]                
  19fc  d1e0             shl ax, 1                                
  19fe  48               dec ax                                   
  19ff  8946fe           mov word ptr [bp - 2], ax                
  1a02  8bc7             mov ax, di                               
  1a04  050400           add ax, 4                                
  1a07  8946fa           mov word ptr [bp - 6], ax                
  1a0a  8b46fe           mov ax, word ptr [bp - 2]                
  1a0d  050300           add ax, 3                                
  1a10  8946f8           mov word ptr [bp - 8], ax                
  1a13  8bc7             mov ax, di                               
  1a15  250700           and ax, 7                                
  1a18  8946d2           mov word ptr [bp - 0x2e], ax             
  1a1b  837ed207         cmp word ptr [bp - 0x2e], 7              
  1a1f  7505             jne 0x1a26                               
  1a21  c746d20600       mov word ptr [bp - 0x2e], 6              
  1a26  c1ff03           sar di, 3                                
  1a29  c1e703           shl di, 3                                
  1a2c  6a09             push 9                                   
  1a2e  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1a33  59               pop cx                                   
  1a34  8b5efc           mov bx, word ptr [bp - 4]                
  1a37  c1e303           shl bx, 3                                
  1a3a  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1a3e  8b5efc           mov bx, word ptr [bp - 4]                
  1a41  c1e303           shl bx, 3                                
  1a44  50               push ax                                  
  1a45  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1a48  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1a4c  5a               pop dx                                   
  1a4d  03d0             add dx, ax                               
  1a4f  52               push dx                                  
  1a50  8b5efc           mov bx, word ptr [bp - 4]                
  1a53  c1e303           shl bx, 3                                
  1a56  ffb7762c         push word ptr [bx + 0x2c76]              
  1a5a  1e               push ds                                  
  1a5b  686c57           push 0x576c                              
  1a5e  ff76fe           push word ptr [bp - 2]                   
  1a61  57               push di                                  
  1a62  1e               push ds                                  
  1a63  689567           push 0x6795                              
  1a66  8b5efc           mov bx, word ptr [bp - 4]                
  1a69  c1e303           shl bx, 3                                
  1a6c  ffb77c2c         push word ptr [bx + 0x2c7c]              
  1a70  8b5efc           mov bx, word ptr [bp - 4]                
  1a73  c1e303           shl bx, 3                                
  1a76  ffb77a2c         push word ptr [bx + 0x2c7a]              
  1a7a  8b5efc           mov bx, word ptr [bp - 4]                
  1a7d  c1e303           shl bx, 3                                
  1a80  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1a84  8b5efc           mov bx, word ptr [bp - 4]                
  1a87  c1e303           shl bx, 3                                
  1a8a  50               push ax                                  
  1a8b  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1a8e  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1a92  5a               pop dx                                   
  1a93  03d0             add dx, ax                               
  1a95  52               push dx                                  
  1a96  8b5efc           mov bx, word ptr [bp - 4]                
  1a99  c1e303           shl bx, 3                                
  1a9c  ffb7762c         push word ptr [bx + 0x2c76]              
  1aa0  1e               push ds                                  
  1aa1  68a757           push 0x57a7                              
  1aa4  ff1ec869         lcall [0x69c8]                           
  1aa8  83c41c           add sp, 0x1c                             
  1aab  8bde             mov bx, si                               
  1aad  6bdb41           imul bx, bx, 0x41                        
  1ab0  b8042c           mov ax, 0x2c04                           
  1ab3  8ec0             mov es, ax                               
  1ab5  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  1abb  7417             je 0x1ad4                                
  1abd  8bde             mov bx, si                               
  1abf  6bdb41           imul bx, bx, 0x41                        
  1ac2  b8042c           mov ax, 0x2c04                           
  1ac5  8ec0             mov es, ax                               
  1ac7  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  1acd  7505             jne 0x1ad4                               
  1acf  c746d00200       mov word ptr [bp - 0x30], 2              
  1ad4  8bde             mov bx, si                               
  1ad6  6bdb41           imul bx, bx, 0x41                        
  1ad9  b8042c           mov ax, 0x2c04                           
  1adc  8ec0             mov es, ax                               
  1ade  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  1ae4  7503             jne 0x1ae9                               
  1ae6  e95e01           jmp 0x1c47                               
  1ae9  8bde             mov bx, si                               
  1aeb  6bdb41           imul bx, bx, 0x41                        
  1aee  b8042c           mov ax, 0x2c04                           
  1af1  8ec0             mov es, ax                               
  1af3  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  1af9  7503             jne 0x1afe                               
  1afb  e94901           jmp 0x1c47                               
  1afe  8bde             mov bx, si                               
  1b00  6bdb41           imul bx, bx, 0x41                        
  1b03  b8042c           mov ax, 0x2c04                           
  1b06  8ec0             mov es, ax                               
  1b08  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  1b0d  8bde             mov bx, si                               
  1b0f  6bdb41           imul bx, bx, 0x41                        
  1b12  b8042c           mov ax, 0x2c04                           
  1b15  8ec0             mov es, ax                               
  1b17  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  1b1c  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  1b21  83c404           add sp, 4                                
  1b24  8bd0             mov dx, ax                               
  1b26  8bda             mov bx, dx                               
  1b28  d1e3             shl bx, 1                                
  1b2a  8d8608ff         lea ax, [bp - 0xf8]                      
  1b2e  03d8             add bx, ax                               
  1b30  36c7070100       mov word ptr ss:[bx], 1                  
  1b35  8bda             mov bx, dx                               
  1b37  6bdb41           imul bx, bx, 0x41                        
  1b3a  b8042c           mov ax, 0x2c04                           
  1b3d  8ec0             mov es, ax                               
  1b3f  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  1b44  d1e7             shl di, 1                                
  1b46  83c7fe           add di, -2                               
  1b49  8bda             mov bx, dx                               
  1b4b  6bdb41           imul bx, bx, 0x41                        
  1b4e  b8042c           mov ax, 0x2c04                           
  1b51  8ec0             mov es, ax                               
  1b53  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1b58  d1e0             shl ax, 1                                
  1b5a  48               dec ax                                   
  1b5b  8946fe           mov word ptr [bp - 2], ax                
  1b5e  8bc7             mov ax, di                               
  1b60  050400           add ax, 4                                
  1b63  8946f6           mov word ptr [bp - 0xa], ax              
  1b66  8b46fe           mov ax, word ptr [bp - 2]                
  1b69  050300           add ax, 3                                
  1b6c  8946f4           mov word ptr [bp - 0xc], ax              
  1b6f  8bda             mov bx, dx                               
  1b71  6bdb41           imul bx, bx, 0x41                        
  1b74  b8042c           mov ax, 0x2c04                           
  1b77  8ec0             mov es, ax                               
  1b79  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  1b7f  7e05             jle 0x1b86                               
  1b81  b80100           mov ax, 1                                
  1b84  eb03             jmp 0x1b89                               
  1b86  b80500           mov ax, 5                                
  1b89  8946fc           mov word ptr [bp - 4], ax                
  1b8c  8bc7             mov ax, di                               
  1b8e  250700           and ax, 7                                
  1b91  8946d2           mov word ptr [bp - 0x2e], ax             
  1b94  837ed207         cmp word ptr [bp - 0x2e], 7              
  1b98  7505             jne 0x1b9f                               
  1b9a  c746d20600       mov word ptr [bp - 0x2e], 6              
  1b9f  c1ff03           sar di, 3                                
  1ba2  c1e703           shl di, 3                                
  1ba5  6a09             push 9                                   
  1ba7  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1bac  59               pop cx                                   
  1bad  8b5efc           mov bx, word ptr [bp - 4]                
  1bb0  c1e303           shl bx, 3                                
  1bb3  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1bb7  8b5efc           mov bx, word ptr [bp - 4]                
  1bba  c1e303           shl bx, 3                                
  1bbd  50               push ax                                  
  1bbe  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1bc1  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1bc5  5a               pop dx                                   
  1bc6  03d0             add dx, ax                               
  1bc8  52               push dx                                  
  1bc9  8b5efc           mov bx, word ptr [bp - 4]                
  1bcc  c1e303           shl bx, 3                                
  1bcf  ffb7762c         push word ptr [bx + 0x2c76]              
  1bd3  1e               push ds                                  
  1bd4  686c57           push 0x576c                              
  1bd7  ff76fe           push word ptr [bp - 2]                   
  1bda  57               push di                                  
  1bdb  1e               push ds                                  
  1bdc  689567           push 0x6795                              
  1bdf  8b5efc           mov bx, word ptr [bp - 4]                
  1be2  c1e303           shl bx, 3                                
  1be5  ffb77c2c         push word ptr [bx + 0x2c7c]              
  1be9  8b5efc           mov bx, word ptr [bp - 4]                
  1bec  c1e303           shl bx, 3                                
  1bef  ffb77a2c         push word ptr [bx + 0x2c7a]              
  1bf3  8b5efc           mov bx, word ptr [bp - 4]                
  1bf6  c1e303           shl bx, 3                                
  1bf9  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1bfd  8b5efc           mov bx, word ptr [bp - 4]                
  1c00  c1e303           shl bx, 3                                
  1c03  50               push ax                                  
  1c04  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1c07  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1c0b  5a               pop dx                                   
  1c0c  03d0             add dx, ax                               
  1c0e  52               push dx                                  
  1c0f  8b5efc           mov bx, word ptr [bp - 4]                
  1c12  c1e303           shl bx, 3                                
  1c15  ffb7762c         push word ptr [bx + 0x2c76]              
  1c19  1e               push ds                                  
  1c1a  68a757           push 0x57a7                              
  1c1d  ff1ec869         lcall [0x69c8]                           
  1c21  83c41c           add sp, 0x1c                             
  1c24  6a07             push 7                                   
  1c26  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1c2b  59               pop cx                                   
  1c2c  666a00           push 0                                   
  1c2f  ff76f8           push word ptr [bp - 8]                   
  1c32  ff76fa           push word ptr [bp - 6]                   
  1c35  ff76f4           push word ptr [bp - 0xc]                 
  1c38  ff76f6           push word ptr [bp - 0xa]                 
  1c3b  1e               push ds                                  
  1c3c  689567           push 0x6795                              
  1c3f  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  1c44  83c410           add sp, 0x10                             
  1c47  c746f20000       mov word ptr [bp - 0xe], 0               
  1c4c  e92d01           jmp 0x1d7c                               
  1c4f  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1c52  d1e3             shl bx, 1                                
  1c54  8d46d6           lea ax, [bp - 0x2a]                      
  1c57  03d8             add bx, ax                               
  1c59  368b1f           mov bx, word ptr ss:[bx]                 
  1c5c  d1e3             shl bx, 1                                
  1c5e  8d8608ff         lea ax, [bp - 0xf8]                      
  1c62  03d8             add bx, ax                               
  1c64  36c7070100       mov word ptr ss:[bx], 1                  
  1c69  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1c6c  d1e3             shl bx, 1                                
  1c6e  8d46d6           lea ax, [bp - 0x2a]                      
  1c71  03d8             add bx, ax                               
  1c73  368b1f           mov bx, word ptr ss:[bx]                 
  1c76  6bdb41           imul bx, bx, 0x41                        
  1c79  b8042c           mov ax, 0x2c04                           
  1c7c  8ec0             mov es, ax                               
  1c7e  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  1c83  d1e7             shl di, 1                                
  1c85  83c7fe           add di, -2                               
  1c88  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1c8b  d1e3             shl bx, 1                                
  1c8d  8d46d6           lea ax, [bp - 0x2a]                      
  1c90  03d8             add bx, ax                               
  1c92  368b1f           mov bx, word ptr ss:[bx]                 
  1c95  6bdb41           imul bx, bx, 0x41                        
  1c98  b8042c           mov ax, 0x2c04                           
  1c9b  8ec0             mov es, ax                               
  1c9d  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1ca2  d1e0             shl ax, 1                                
  1ca4  48               dec ax                                   
  1ca5  8946fe           mov word ptr [bp - 2], ax                
  1ca8  8bc7             mov ax, di                               
  1caa  050400           add ax, 4                                
  1cad  8946f6           mov word ptr [bp - 0xa], ax              
  1cb0  8b46fe           mov ax, word ptr [bp - 2]                
  1cb3  050300           add ax, 3                                
  1cb6  8946f4           mov word ptr [bp - 0xc], ax              
  1cb9  c746fc0200       mov word ptr [bp - 4], 2                 
  1cbe  8bc7             mov ax, di                               
  1cc0  250700           and ax, 7                                
  1cc3  8946d2           mov word ptr [bp - 0x2e], ax             
  1cc6  837ed207         cmp word ptr [bp - 0x2e], 7              
  1cca  7505             jne 0x1cd1                               
  1ccc  c746d20600       mov word ptr [bp - 0x2e], 6              
  1cd1  c1ff03           sar di, 3                                
  1cd4  c1e703           shl di, 3                                
  1cd7  6a09             push 9                                   
  1cd9  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1cde  59               pop cx                                   
  1cdf  8b5efc           mov bx, word ptr [bp - 4]                
  1ce2  c1e303           shl bx, 3                                
  1ce5  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1ce9  8b5efc           mov bx, word ptr [bp - 4]                
  1cec  c1e303           shl bx, 3                                
  1cef  50               push ax                                  
  1cf0  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1cf3  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1cf7  5a               pop dx                                   
  1cf8  03d0             add dx, ax                               
  1cfa  52               push dx                                  
  1cfb  8b5efc           mov bx, word ptr [bp - 4]                
  1cfe  c1e303           shl bx, 3                                
  1d01  ffb7762c         push word ptr [bx + 0x2c76]              
  1d05  1e               push ds                                  
  1d06  686c57           push 0x576c                              
  1d09  ff76fe           push word ptr [bp - 2]                   
  1d0c  57               push di                                  
  1d0d  1e               push ds                                  
  1d0e  689567           push 0x6795                              
  1d11  8b5efc           mov bx, word ptr [bp - 4]                
  1d14  c1e303           shl bx, 3                                
  1d17  ffb77c2c         push word ptr [bx + 0x2c7c]              
  1d1b  8b5efc           mov bx, word ptr [bp - 4]                
  1d1e  c1e303           shl bx, 3                                
  1d21  ffb77a2c         push word ptr [bx + 0x2c7a]              
  1d25  8b5efc           mov bx, word ptr [bp - 4]                
  1d28  c1e303           shl bx, 3                                
  1d2b  8b87782c         mov ax, word ptr [bx + 0x2c78]           
  1d2f  8b5efc           mov bx, word ptr [bp - 4]                
  1d32  c1e303           shl bx, 3                                
  1d35  50               push ax                                  
  1d36  8b46d2           mov ax, word ptr [bp - 0x2e]             
  1d39  f7af7c2c         imul word ptr [bx + 0x2c7c]              
  1d3d  5a               pop dx                                   
  1d3e  03d0             add dx, ax                               
  1d40  52               push dx                                  
  1d41  8b5efc           mov bx, word ptr [bp - 4]                
  1d44  c1e303           shl bx, 3                                
  1d47  ffb7762c         push word ptr [bx + 0x2c76]              
  1d4b  1e               push ds                                  
  1d4c  68a757           push 0x57a7                              
  1d4f  ff1ec869         lcall [0x69c8]                           
  1d53  83c41c           add sp, 0x1c                             
  1d56  6a08             push 8                                   
  1d58  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1d5d  59               pop cx                                   
  1d5e  666a00           push 0                                   
  1d61  ff76f8           push word ptr [bp - 8]                   
  1d64  ff76fa           push word ptr [bp - 6]                   
  1d67  ff76f4           push word ptr [bp - 0xc]                 
  1d6a  ff76f6           push word ptr [bp - 0xa]                 
  1d6d  1e               push ds                                  
  1d6e  689567           push 0x6795                              
  1d71  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  1d76  83c410           add sp, 0x10                             
  1d79  ff46f2           inc word ptr [bp - 0xe]                  
  1d7c  8b46f2           mov ax, word ptr [bp - 0xe]              
  1d7f  3b46d4           cmp ax, word ptr [bp - 0x2c]             
  1d82  7d03             jge 0x1d87                               
  1d84  e9c8fe           jmp 0x1c4f                               
  1d87  46               inc si                                   
  1d88  b8042c           mov ax, 0x2c04                           
  1d8b  8ec0             mov es, ax                               
  1d8d  2639367b15       cmp word ptr es:[0x157b], si             
  1d92  7e03             jle 0x1d97                               
  1d94  e992fb           jmp 0x1929                               
  1d97  16               push ss                                  
  1d98  8d46ee           lea ax, [bp - 0x12]                      
  1d9b  50               push ax                                  
  1d9c  16               push ss                                  
  1d9d  8d46f0           lea ax, [bp - 0x10]                      
  1da0  50               push ax                                  
  1da1  b8042c           mov ax, 0x2c04                           
  1da4  8ec0             mov es, ax                               
  1da6  26ff361001       push word ptr es:[0x110]                 
  1dab  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  1db0  83c40a           add sp, 0xa                              
  1db3  8bf0             mov si, ax                               
  1db5  0bf6             or si, si                                
  1db7  740b             je 0x1dc4                                
  1db9  837ed000         cmp word ptr [bp - 0x30], 0              
  1dbd  7505             jne 0x1dc4                               
  1dbf  c746d00100       mov word ptr [bp - 0x30], 1              
  1dc4  0bf6             or si, si                                
  1dc6  741c             je 0x1de4                                
  1dc8  837ed002         cmp word ptr [bp - 0x30], 2              
  1dcc  7505             jne 0x1dd3                               
  1dce  b80100           mov ax, 1                                
  1dd1  eb02             jmp 0x1dd5                               
  1dd3  33c0             xor ax, ax                               
  1dd5  50               push ax                                  
  1dd6  ff76ee           push word ptr [bp - 0x12]                
  1dd9  ff76f0           push word ptr [bp - 0x10]                
  1ddc  90               nop                                      
  1ddd  0e               push cs                                  
  1dde  e87e01           call 0x1f5f                              
  1de1  83c406           add sp, 6                                
  1de4  0bf6             or si, si                                
  1de6  7503             jne 0x1deb                               
  1de8  e9ca00           jmp 0x1eb5                               
  1deb  837ed002         cmp word ptr [bp - 0x30], 2              
  1def  7403             je 0x1df4                                
  1df1  e9c100           jmp 0x1eb5                               
  1df4  33f6             xor si, si                               
  1df6  e9b400           jmp 0x1ead                               
  1df9  8bde             mov bx, si                               
  1dfb  6bdb41           imul bx, bx, 0x41                        
  1dfe  b8042c           mov ax, 0x2c04                           
  1e01  8ec0             mov es, ax                               
  1e03  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  1e09  7503             jne 0x1e0e                               
  1e0b  e99e00           jmp 0x1eac                               
  1e0e  8bde             mov bx, si                               
  1e10  6bdb41           imul bx, bx, 0x41                        
  1e13  b8042c           mov ax, 0x2c04                           
  1e16  8ec0             mov es, ax                               
  1e18  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  1e1e  7403             je 0x1e23                                
  1e20  e98900           jmp 0x1eac                               
  1e23  8bde             mov bx, si                               
  1e25  6bdb41           imul bx, bx, 0x41                        
  1e28  b8042c           mov ax, 0x2c04                           
  1e2b  8ec0             mov es, ax                               
  1e2d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1e32  98               cwde                                     
  1e33  ba042c           mov dx, 0x2c04                           
  1e36  8ec2             mov es, dx                               
  1e38  263b061001       cmp ax, word ptr es:[0x110]              
  1e3d  756d             jne 0x1eac                               
  1e3f  8bde             mov bx, si                               
  1e41  6bdb41           imul bx, bx, 0x41                        
  1e44  b8042c           mov ax, 0x2c04                           
  1e47  8ec0             mov es, ax                               
  1e49  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  1e4e  d1e7             shl di, 1                                
  1e50  83c7fe           add di, -2                               
  1e53  8bde             mov bx, si                               
  1e55  6bdb41           imul bx, bx, 0x41                        
  1e58  b8042c           mov ax, 0x2c04                           
  1e5b  8ec0             mov es, ax                               
  1e5d  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1e62  d1e0             shl ax, 1                                
  1e64  48               dec ax                                   
  1e65  8946fe           mov word ptr [bp - 2], ax                
  1e68  8bc7             mov ax, di                               
  1e6a  050400           add ax, 4                                
  1e6d  8946fa           mov word ptr [bp - 6], ax                
  1e70  8b46fe           mov ax, word ptr [bp - 2]                
  1e73  050300           add ax, 3                                
  1e76  8946f8           mov word ptr [bp - 8], ax                
  1e79  8b46f0           mov ax, word ptr [bp - 0x10]             
  1e7c  d1e0             shl ax, 1                                
  1e7e  8946f6           mov word ptr [bp - 0xa], ax              
  1e81  8b46ee           mov ax, word ptr [bp - 0x12]             
  1e84  d1e0             shl ax, 1                                
  1e86  8946f4           mov word ptr [bp - 0xc], ax              
  1e89  6a08             push 8                                   
  1e8b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1e90  59               pop cx                                   
  1e91  666a00           push 0                                   
  1e94  ff76f4           push word ptr [bp - 0xc]                 
  1e97  ff76f6           push word ptr [bp - 0xa]                 
  1e9a  ff76f8           push word ptr [bp - 8]                   
  1e9d  ff76fa           push word ptr [bp - 6]                   
  1ea0  1e               push ds                                  
  1ea1  689567           push 0x6795                              
  1ea4  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  1ea9  83c410           add sp, 0x10                             
  1eac  46               inc si                                   
  1ead  83fe64           cmp si, 0x64                             
  1eb0  7d03             jge 0x1eb5                               
  1eb2  e944ff           jmp 0x1df9                               
  1eb5  837e0a00         cmp word ptr [bp + 0xa], 0               
  1eb9  7d03             jge 0x1ebe                               
  1ebb  e99d00           jmp 0x1f5b                               
  1ebe  8b5e0a           mov bx, word ptr [bp + 0xa]              
  1ec1  6bdb41           imul bx, bx, 0x41                        
  1ec4  b8042c           mov ax, 0x2c04                           
  1ec7  8ec0             mov es, ax                               
  1ec9  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  1ece  d1e7             shl di, 1                                
  1ed0  8b5e0a           mov bx, word ptr [bp + 0xa]              
  1ed3  6bdb41           imul bx, bx, 0x41                        
  1ed6  b8042c           mov ax, 0x2c04                           
  1ed9  8ec0             mov es, ax                               
  1edb  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1ee0  d1e0             shl ax, 1                                
  1ee2  8946fe           mov word ptr [bp - 2], ax                
  1ee5  83ef02           sub di, 2                                
  1ee8  ff4efe           dec word ptr [bp - 2]                    
  1eeb  66680b000f00     push 0xf000b                             
  1ef1  8b46fe           mov ax, word ptr [bp - 2]                
  1ef4  48               dec ax                                   
  1ef5  50               push ax                                  
  1ef6  8bc7             mov ax, di                               
  1ef8  48               dec ax                                   
  1ef9  50               push ax                                  
  1efa  1e               push ds                                  
  1efb  689567           push 0x6795                              
  1efe  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  1f03  83c40c           add sp, 0xc                              
  1f06  66680b000f00     push 0xf000b                             
  1f0c  8b46fe           mov ax, word ptr [bp - 2]                
  1f0f  050a00           add ax, 0xa                              
  1f12  50               push ax                                  
  1f13  8bc7             mov ax, di                               
  1f15  48               dec ax                                   
  1f16  50               push ax                                  
  1f17  1e               push ds                                  
  1f18  689567           push 0x6795                              
  1f1b  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  1f20  83c40c           add sp, 0xc                              
  1f23  66680b000f00     push 0xf000b                             
  1f29  8b46fe           mov ax, word ptr [bp - 2]                
  1f2c  48               dec ax                                   
  1f2d  50               push ax                                  
  1f2e  8bc7             mov ax, di                               
  1f30  48               dec ax                                   
  1f31  50               push ax                                  
  1f32  1e               push ds                                  
  1f33  689567           push 0x6795                              
  1f36  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  1f3b  83c40c           add sp, 0xc                              
  1f3e  66680b000f00     push 0xf000b                             
  1f44  8b46fe           mov ax, word ptr [bp - 2]                
  1f47  48               dec ax                                   
  1f48  50               push ax                                  
  1f49  8bc7             mov ax, di                               
  1f4b  050a00           add ax, 0xa                              
  1f4e  50               push ax                                  
  1f4f  1e               push ds                                  
  1f50  689567           push 0x6795                              
  1f53  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  1f58  83c40c           add sp, 0xc                              
  1f5b  5f               pop di                                   
  1f5c  5e               pop si                                   
  1f5d  c9               leave                                    
  1f5e  cb               retf                                     

ovl63_1f5f:  ; ENTRY
  1f5f  55               push bp                                  
  1f60  8bec             mov bp, sp                               
  1f62  56               push si                                  
  1f63  57               push di                                  
  1f64  8b7606           mov si, word ptr [bp + 6]                
  1f67  8b7e0a           mov di, word ptr [bp + 0xa]              
  1f6a  d1e6             shl si, 1                                
  1f6c  83c6fa           add si, -6                               
  1f6f  8b4608           mov ax, word ptr [bp + 8]                
  1f72  d1e0             shl ax, 1                                
  1f74  05faff           add ax, 0xfffa                           
  1f77  894608           mov word ptr [bp + 8], ax                
  1f7a  83c604           add si, 4                                
  1f7d  c1fe03           sar si, 3                                
  1f80  c1e603           shl si, 3                                
  1f83  0bf6             or si, si                                
  1f85  7d02             jge 0x1f89                               
  1f87  33f6             xor si, si                               
  1f89  837e0800         cmp word ptr [bp + 8], 0                 
  1f8d  7d05             jge 0x1f94                               
  1f8f  c746080000       mov word ptr [bp + 8], 0                 
  1f94  6a09             push 9                                   
  1f96  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1f9b  59               pop cx                                   
  1f9c  8bdf             mov bx, di                               
  1f9e  c1e303           shl bx, 3                                
  1fa1  ffb7b02c         push word ptr [bx + 0x2cb0]              
  1fa5  8bdf             mov bx, di                               
  1fa7  c1e303           shl bx, 3                                
  1faa  ffb7ae2c         push word ptr [bx + 0x2cae]              
  1fae  1e               push ds                                  
  1faf  686c57           push 0x576c                              
  1fb2  ff7608           push word ptr [bp + 8]                   
  1fb5  56               push si                                  
  1fb6  1e               push ds                                  
  1fb7  689567           push 0x6795                              
  1fba  8bdf             mov bx, di                               
  1fbc  c1e303           shl bx, 3                                
  1fbf  ffb7b42c         push word ptr [bx + 0x2cb4]              
  1fc3  8bdf             mov bx, di                               
  1fc5  c1e303           shl bx, 3                                
  1fc8  ffb7b22c         push word ptr [bx + 0x2cb2]              
  1fcc  8bdf             mov bx, di                               
  1fce  c1e303           shl bx, 3                                
  1fd1  ffb7b02c         push word ptr [bx + 0x2cb0]              
  1fd5  8bdf             mov bx, di                               
  1fd7  c1e303           shl bx, 3                                
  1fda  ffb7ae2c         push word ptr [bx + 0x2cae]              
  1fde  1e               push ds                                  
  1fdf  68a757           push 0x57a7                              
  1fe2  ff1ec869         lcall [0x69c8]                           
  1fe6  83c41c           add sp, 0x1c                             
  1fe9  5f               pop di                                   
  1fea  5e               pop si                                   
  1feb  5d               pop bp                                   
  1fec  cb               retf                                     

ovl63_1fed:  ; ENTRY
  1fed  55               push bp                                  
  1fee  8bec             mov bp, sp                               
  1ff0  83ec14           sub sp, 0x14                             
  1ff3  56               push si                                  
  1ff4  57               push di                                  
  1ff5  8b5606           mov dx, word ptr [bp + 6]                
  1ff8  8b4e08           mov cx, word ptr [bp + 8]                
  1ffb  b8042c           mov ax, 0x2c04                           
  1ffe  8ec0             mov es, ax                               
  2000  26833e240100     cmp word ptr es:[0x124], 0               
  2006  7503             jne 0x200b                               
  2008  e9f101           jmp 0x21fc                               
  200b  b8042c           mov ax, 0x2c04                           
  200e  8ec0             mov es, ax                               
  2010  268b1e1001       mov bx, word ptr es:[0x110]              
  2015  d1e3             shl bx, 1                                
  2017  b8042c           mov ax, 0x2c04                           
  201a  8ec0             mov es, ax                               
  201c  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  2022  7410             je 0x2034                                
  2024  b8042c           mov ax, 0x2c04                           
  2027  8ec0             mov es, ax                               
  2029  26833e590100     cmp word ptr es:[0x159], 0               
  202f  7503             jne 0x2034                               
  2031  e9c801           jmp 0x21fc                               
  2034  833e543200       cmp word ptr [0x3254], 0                 
  2039  7403             je 0x203e                                
  203b  e9be01           jmp 0x21fc                               
  203e  8bd9             mov bx, cx                               
  2040  69dbe000         imul bx, bx, 0xe0                        
  2044  8bc2             mov ax, dx                               
  2046  d1e0             shl ax, 1                                
  2048  03d8             add bx, ax                               
  204a  b81d1e           mov ax, 0x1e1d                           
  204d  8ec0             mov es, ax                               
  204f  268a9f0000       mov bl, byte ptr es:[bx]                 
  2054  81e3ff00         and bx, 0xff                             
  2058  b8042c           mov ax, 0x2c04                           
  205b  8ec0             mov es, ax                               
  205d  268a871007       mov al, byte ptr es:[bx + 0x710]         
  2062  98               cwde                                     
  2063  8946ee           mov word ptr [bp - 0x12], ax             
  2066  837eee0a         cmp word ptr [bp - 0x12], 0xa            
  206a  7427             je 0x2093                                
  206c  8bd9             mov bx, cx                               
  206e  69dbe000         imul bx, bx, 0xe0                        
  2072  8bc2             mov ax, dx                               
  2074  d1e0             shl ax, 1                                
  2076  03d8             add bx, ax                               
  2078  b81d1e           mov ax, 0x1e1d                           
  207b  8ec0             mov es, ax                               
  207d  268a870100       mov al, byte ptr es:[bx + 1]             
  2082  c1e805           shr ax, 5                                
  2085  250100           and ax, 1                                
  2088  0bc0             or ax, ax                                
  208a  7507             jne 0x2093                               
  208c  833efc5d02       cmp word ptr [0x5dfc], 2                 
  2091  7505             jne 0x2098                               
  2093  b80100           mov ax, 1                                
  2096  eb02             jmp 0x209a                               
  2098  33c0             xor ax, ax                               
  209a  8946ec           mov word ptr [bp - 0x14], ax             
  209d  837eec00         cmp word ptr [bp - 0x14], 0              
  20a1  7413             je 0x20b6                                
  20a3  666805000500     push 0x50005                             
  20a9  8bc1             mov ax, cx                               
  20ab  05feff           add ax, 0xfffe                           
  20ae  50               push ax                                  
  20af  8bc2             mov ax, dx                               
  20b1  05feff           add ax, 0xfffe                           
  20b4  eb0d             jmp 0x20c3                               
  20b6  666803000300     push 0x30003                             
  20bc  8bc1             mov ax, cx                               
  20be  48               dec ax                                   
  20bf  50               push ax                                  
  20c0  8bc2             mov ax, dx                               
  20c2  48               dec ax                                   
  20c3  50               push ax                                  
  20c4  16               push ss                                  
  20c5  8d46f0           lea ax, [bp - 0x10]                      
  20c8  50               push ax                                  
  20c9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  20ce  83c40c           add sp, 0xc                              
  20d1  837ef000         cmp word ptr [bp - 0x10], 0              
  20d5  7d0b             jge 0x20e2                               
  20d7  8b46f0           mov ax, word ptr [bp - 0x10]             
  20da  0146f4           add word ptr [bp - 0xc], ax              
  20dd  c746f00000       mov word ptr [bp - 0x10], 0              
  20e2  837ef200         cmp word ptr [bp - 0xe], 0               
  20e6  7d0b             jge 0x20f3                               
  20e8  8b46f2           mov ax, word ptr [bp - 0xe]              
  20eb  0146f6           add word ptr [bp - 0xa], ax              
  20ee  c746f20000       mov word ptr [bp - 0xe], 0               
  20f3  8b46f0           mov ax, word ptr [bp - 0x10]             
  20f6  0346f4           add ax, word ptr [bp - 0xc]              
  20f9  3d7000           cmp ax, 0x70                             
  20fc  7c0c             jl 0x210a                                
  20fe  8b46f0           mov ax, word ptr [bp - 0x10]             
  2101  0346f4           add ax, word ptr [bp - 0xc]              
  2104  0591ff           add ax, 0xff91                           
  2107  2946f4           sub word ptr [bp - 0xc], ax              
  210a  8b46f2           mov ax, word ptr [bp - 0xe]              
  210d  0346f6           add ax, word ptr [bp - 0xa]              
  2110  3d9c00           cmp ax, 0x9c                             
  2113  7c0c             jl 0x2121                                
  2115  8b46f2           mov ax, word ptr [bp - 0xe]              
  2118  0346f6           add ax, word ptr [bp - 0xa]              
  211b  0565ff           add ax, 0xff65                           
  211e  2946f6           sub word ptr [bp - 0xa], ax              
  2121  8b46f0           mov ax, word ptr [bp - 0x10]             
  2124  d1e0             shl ax, 1                                
  2126  8946f8           mov word ptr [bp - 8], ax                
  2129  8b46f2           mov ax, word ptr [bp - 0xe]              
  212c  d1e0             shl ax, 1                                
  212e  8946fa           mov word ptr [bp - 6], ax                
  2131  8b46f4           mov ax, word ptr [bp - 0xc]              
  2134  d1e0             shl ax, 1                                
  2136  8946fc           mov word ptr [bp - 4], ax                
  2139  8b46f6           mov ax, word ptr [bp - 0xa]              
  213c  d1e0             shl ax, 1                                
  213e  8946fe           mov word ptr [bp - 2], ax                
  2141  66833eed5400     cmp dword ptr [0x54ed], 0                
  2147  7435             je 0x217e                                
  2149  f70618550a00     test word ptr [0x5518], 0xa              
  214f  752d             jne 0x217e                               
  2151  33f6             xor si, si                               
  2153  eb20             jmp 0x2175                               
  2155  8bde             mov bx, si                               
  2157  c1e302           shl bx, 2                                
  215a  66ffb7ed54       push dword ptr [bx + 0x54ed]             
  215f  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  2164  83c404           add sp, 4                                
  2167  8bde             mov bx, si                               
  2169  c1e302           shl bx, 2                                
  216c  8997ff54         mov word ptr [bx + 0x54ff], dx           
  2170  8987fd54         mov word ptr [bx + 0x54fd], ax           
  2174  46               inc si                                   
  2175  a01755           mov al, byte ptr [0x5517]                
  2178  b400             mov ah, 0                                
  217a  3bc6             cmp ax, si                               
  217c  7fd7             jg 0x2155                                
  217e  8b76f8           mov si, word ptr [bp - 8]                
  2181  eb20             jmp 0x21a3                               
  2183  8b7efa           mov di, word ptr [bp - 6]                
  2186  eb10             jmp 0x2198                               
  2188  6a00             push 0                                   
  218a  57               push di                                  
  218b  56               push si                                  
  218c  1e               push ds                                  
  218d  68e354           push 0x54e3                              
  2190  ff1ed069         lcall [0x69d0]                           
  2194  83c40a           add sp, 0xa                              
  2197  47               inc di                                   
  2198  8b46fa           mov ax, word ptr [bp - 6]                
  219b  0346fe           add ax, word ptr [bp - 2]                
  219e  3bc7             cmp ax, di                               
  21a0  7de6             jge 0x2188                               
  21a2  46               inc si                                   
  21a3  8b46f8           mov ax, word ptr [bp - 8]                
  21a6  0346fc           add ax, word ptr [bp - 4]                
  21a9  3bc6             cmp ax, si                               
  21ab  7dd6             jge 0x2183                               
  21ad  66833eed5400     cmp dword ptr [0x54ed], 0                
  21b3  7428             je 0x21dd                                
  21b5  f70618550a00     test word ptr [0x5518], 0xa              
  21bb  7520             jne 0x21dd                               
  21bd  33f6             xor si, si                               
  21bf  eb13             jmp 0x21d4                               
  21c1  8bde             mov bx, si                               
  21c3  c1e302           shl bx, 2                                
  21c6  66ffb7ed54       push dword ptr [bx + 0x54ed]             
  21cb  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  21d0  83c404           add sp, 4                                
  21d3  46               inc si                                   
  21d4  a01755           mov al, byte ptr [0x5517]                
  21d7  b400             mov ah, 0                                
  21d9  3bc6             cmp ax, si                               
  21db  7fe4             jg 0x21c1                                
  21dd  9a3400ac2f       lcall 0x2fac, 0x34                       -> ovl17:08bf
  21e2  0bc0             or ax, ax                                
  21e4  7516             jne 0x21fc                               
  21e6  9a2a000831       lcall 0x3108, 0x2a                       -> ovl65:05ec
  21eb  16               push ss                                  
  21ec  8d46f0           lea ax, [bp - 0x10]                      
  21ef  50               push ax                                  
  21f0  6a01             push 1                                   
  21f2  ff760a           push word ptr [bp + 0xa]                 
  21f5  0e               push cs                                  
  21f6  e807de           call 0                                   
  21f9  83c408           add sp, 8                                
  21fc  5f               pop di                                   
  21fd  5e               pop si                                   
  21fe  c9               leave                                    
  21ff  cb               retf                                     

ovl63_2200:  ; ENTRY
  2200  55               push bp                                  
  2201  8bec             mov bp, sp                               
  2203  56               push si                                  
  2204  57               push di                                  
  2205  b8042c           mov ax, 0x2c04                           
  2208  8ec0             mov es, ax                               
  220a  26833e240100     cmp word ptr es:[0x124], 0               
  2210  7503             jne 0x2215                               
  2212  e91201           jmp 0x2327                               
  2215  66833eed5400     cmp dword ptr [0x54ed], 0                
  221b  7435             je 0x2252                                
  221d  f70618550a00     test word ptr [0x5518], 0xa              
  2223  752d             jne 0x2252                               
  2225  33f6             xor si, si                               
  2227  eb20             jmp 0x2249                               
  2229  8bde             mov bx, si                               
  222b  c1e302           shl bx, 2                                
  222e  66ffb7ed54       push dword ptr [bx + 0x54ed]             
  2233  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  2238  83c404           add sp, 4                                
  223b  8bde             mov bx, si                               
  223d  c1e302           shl bx, 2                                
  2240  8997ff54         mov word ptr [bx + 0x54ff], dx           
  2244  8987fd54         mov word ptr [bx + 0x54fd], ax           
  2248  46               inc si                                   
  2249  a01755           mov al, byte ptr [0x5517]                
  224c  b400             mov ah, 0                                
  224e  3bc6             cmp ax, si                               
  2250  7fd7             jg 0x2229                                
  2252  6a01             push 1                                   
  2254  1e               push ds                                  
  2255  68e354           push 0x54e3                              
  2258  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  225d  83c406           add sp, 6                                
  2260  33f6             xor si, si                               
  2262  e98a00           jmp 0x22ef                               
  2265  33ff             xor di, di                               
  2267  eb7c             jmp 0x22e5                               
  2269  8bdf             mov bx, di                               
  226b  6bdb70           imul bx, bx, 0x70                        
  226e  03de             add bx, si                               
  2270  b8d919           mov ax, 0x19d9                           
  2273  8ec0             mov es, ax                               
  2275  268a870000       mov al, byte ptr es:[bx]                 
  227a  c1e805           shr ax, 5                                
  227d  250100           and ax, 1                                
  2280  0bc0             or ax, ax                                
  2282  7460             je 0x22e4                                
  2284  6a00             push 0                                   
  2286  8bc7             mov ax, di                               
  2288  d1e0             shl ax, 1                                
  228a  50               push ax                                  
  228b  8bc6             mov ax, si                               
  228d  d1e0             shl ax, 1                                
  228f  50               push ax                                  
  2290  1e               push ds                                  
  2291  68e354           push 0x54e3                              
  2294  ff1ed069         lcall [0x69d0]                           
  2298  83c40a           add sp, 0xa                              
  229b  6a00             push 0                                   
  229d  8bc7             mov ax, di                               
  229f  d1e0             shl ax, 1                                
  22a1  50               push ax                                  
  22a2  8bc6             mov ax, si                               
  22a4  d1e0             shl ax, 1                                
  22a6  40               inc ax                                   
  22a7  50               push ax                                  
  22a8  1e               push ds                                  
  22a9  68e354           push 0x54e3                              
  22ac  ff1ed069         lcall [0x69d0]                           
  22b0  83c40a           add sp, 0xa                              
  22b3  6a00             push 0                                   
  22b5  8bc7             mov ax, di                               
  22b7  d1e0             shl ax, 1                                
  22b9  40               inc ax                                   
  22ba  50               push ax                                  
  22bb  8bc6             mov ax, si                               
  22bd  d1e0             shl ax, 1                                
  22bf  50               push ax                                  
  22c0  1e               push ds                                  
  22c1  68e354           push 0x54e3                              
  22c4  ff1ed069         lcall [0x69d0]                           
  22c8  83c40a           add sp, 0xa                              
  22cb  6a00             push 0                                   
  22cd  8bc7             mov ax, di                               
  22cf  d1e0             shl ax, 1                                
  22d1  40               inc ax                                   
  22d2  50               push ax                                  
  22d3  8bc6             mov ax, si                               
  22d5  d1e0             shl ax, 1                                
  22d7  40               inc ax                                   
  22d8  50               push ax                                  
  22d9  1e               push ds                                  
  22da  68e354           push 0x54e3                              
  22dd  ff1ed069         lcall [0x69d0]                           
  22e1  83c40a           add sp, 0xa                              
  22e4  47               inc di                                   
  22e5  81ff9c00         cmp di, 0x9c                             
  22e9  7d03             jge 0x22ee                               
  22eb  e97bff           jmp 0x2269                               
  22ee  46               inc si                                   
  22ef  83fe70           cmp si, 0x70                             
  22f2  7d03             jge 0x22f7                               
  22f4  e96eff           jmp 0x2265                               
  22f7  66833eed5400     cmp dword ptr [0x54ed], 0                
  22fd  7428             je 0x2327                                
  22ff  f70618550a00     test word ptr [0x5518], 0xa              
  2305  7520             jne 0x2327                               
  2307  33f6             xor si, si                               
  2309  eb13             jmp 0x231e                               
  230b  8bde             mov bx, si                               
  230d  c1e302           shl bx, 2                                
  2310  66ffb7ed54       push dword ptr [bx + 0x54ed]             
  2315  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  231a  83c404           add sp, 4                                
  231d  46               inc si                                   
  231e  a01755           mov al, byte ptr [0x5517]                
  2321  b400             mov ah, 0                                
  2323  3bc6             cmp ax, si                               
  2325  7fe4             jg 0x230b                                
  2327  5f               pop di                                   
  2328  5e               pop si                                   
  2329  5d               pop bp                                   
  232a  cb               retf                                     

ovl63_232b:  ; ENTRY
  232b  55               push bp                                  
  232c  8bec             mov bp, sp                               
  232e  81ec0a01         sub sp, 0x10a                            
  2332  56               push si                                  
  2333  57               push di                                  
  2334  9a3400ac2f       lcall 0x2fac, 0x34                       -> ovl17:08bf
  2339  8946fa           mov word ptr [bp - 6], ax                
  233c  837efa00         cmp word ptr [bp - 6], 0                 
  2340  7430             je 0x2372                                
  2342  16               push ss                                  
  2343  8d46fc           lea ax, [bp - 4]                         
  2346  50               push ax                                  
  2347  16               push ss                                  
  2348  8d46fe           lea ax, [bp - 2]                         
  234b  50               push ax                                  
  234c  9a3e00ac2f       lcall 0x2fac, 0x3e                       -> ovl17:08f6
  2351  83c408           add sp, 8                                
  2354  6668f8006900     push 0x6900f8                            
  235a  b8af00           mov ax, 0xaf                             
  235d  2b46fc           sub ax, word ptr [bp - 4]                
  2360  50               push ax                                  
  2361  b8c800           mov ax, 0xc8                              ; "Quest"
  2364  2b46fe           sub ax, word ptr [bp - 2]                
  2367  50               push ax                                  
  2368  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  236d  83c408           add sp, 8                                
  2370  eb08             jmp 0x237a                               
  2372  6a17             push 0x17                                
  2374  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  2379  59               pop cx                                   
  237a  666889000600     push 0x60089                             
  2380  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2385  83c404           add sp, 4                                
  2388  52               push dx                                  
  2389  50               push ax                                  
  238a  666889000500     push 0x50089                             
  2390  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2395  83c404           add sp, 4                                
  2398  52               push dx                                  
  2399  50               push ax                                  
  239a  666889000400     push 0x40089                             
  23a0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23a5  83c404           add sp, 4                                
  23a8  52               push dx                                  
  23a9  50               push ax                                  
  23aa  666889000300     push 0x30089                             
  23b0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23b5  83c404           add sp, 4                                
  23b8  52               push dx                                  
  23b9  50               push ax                                  
  23ba  666889000200     push 0x20089                             
  23c0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23c5  83c404           add sp, 4                                
  23c8  52               push dx                                  
  23c9  50               push ax                                  
  23ca  666889000100     push 0x10089                             
  23d0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23d5  83c404           add sp, 4                                
  23d8  52               push dx                                  
  23d9  50               push ax                                  
  23da  666889000000     push 0x89                                
  23e0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23e5  83c404           add sp, 4                                
  23e8  52               push dx                                  
  23e9  50               push ax                                  
  23ea  9abb00d730       lcall 0x30d7, 0xbb                       -> ovl61:1471
  23ef  83c41c           add sp, 0x1c                             
  23f2  9a4300622f       lcall 0x2f62, 0x43                       -> ovl02:01b5
  23f7  6a00             push 0                                   
  23f9  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  23fe  59               pop cx                                   
  23ff  90               nop                                      
  2400  0e               push cs                                  
  2401  e80d06           call 0x2a11                              
  2404  b8042c           mov ax, 0x2c04                           
  2407  8ec0             mov es, ax                               
  2409  268b166101       mov dx, word ptr es:[0x161]              
  240e  66a1725e         mov eax, dword ptr [0x5e72]              
  2412  66a3665e         mov dword ptr [0x5e66], eax              
  2416  83fa01           cmp dx, 1                                
  2419  7508             jne 0x2423                               
  241b  66a16e5e         mov eax, dword ptr [0x5e6e]              
  241f  66a3665e         mov dword ptr [0x5e66], eax              
  2423  83fa02           cmp dx, 2                                
  2426  7508             jne 0x2430                               
  2428  66a16a5e         mov eax, dword ptr [0x5e6a]              
  242c  66a3665e         mov dword ptr [0x5e66], eax              
  2430  6a07             push 7                                   
  2432  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  2437  59               pop cx                                   
  2438  66833e275800     cmp dword ptr [0x5827], 0                
  243e  7435             je 0x2475                                
  2440  f70652580a00     test word ptr [0x5852], 0xa              
  2446  752d             jne 0x2475                               
  2448  33f6             xor si, si                               
  244a  eb20             jmp 0x246c                               
  244c  8bde             mov bx, si                               
  244e  c1e302           shl bx, 2                                
  2451  66ffb72758       push dword ptr [bx + 0x5827]             
  2456  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  245b  83c404           add sp, 4                                
  245e  8bde             mov bx, si                               
  2460  c1e302           shl bx, 2                                
  2463  89973958         mov word ptr [bx + 0x5839], dx           
  2467  89873758         mov word ptr [bx + 0x5837], ax           
  246b  46               inc si                                   
  246c  a05158           mov al, byte ptr [0x5851]                
  246f  b400             mov ah, 0                                
  2471  3bc6             cmp ax, si                               
  2473  7fd7             jg 0x244c                                
  2475  33f6             xor si, si                               
  2477  eb15             jmp 0x248e                               
  2479  666803000100     push 0x10003                             
  247f  6a01             push 1                                   
  2481  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  2486  83c406           add sp, 6                                
  2489  8882f6fe         mov byte ptr [bp + si - 0x10a], al       
  248d  46               inc si                                   
  248e  81fe0001         cmp si, 0x100                            
  2492  7ce5             jl 0x2479                                
  2494  33f6             xor si, si                               
  2496  c746f80000       mov word ptr [bp - 8], 0                 
  249b  c746fe0000       mov word ptr [bp - 2], 0                 
  24a0  e99502           jmp 0x2738                               
  24a3  8b46fe           mov ax, word ptr [bp - 2]                
  24a6  6bc00a           imul ax, ax, 0xa                         
  24a9  bb7000           mov bx, 0x70                             
  24ac  99               cdq                                      
  24ad  f7fb             idiv bx                                  
  24af  8946f6           mov word ptr [bp - 0xa], ax              
  24b2  3b46f8           cmp ax, word ptr [bp - 8]                
  24b5  7e10             jle 0x24c7                               
  24b7  ff46f8           inc word ptr [bp - 8]                    
  24ba  8b46f8           mov ax, word ptr [bp - 8]                
  24bd  6bc00a           imul ax, ax, 0xa                         
  24c0  50               push ax                                  
  24c1  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  24c6  59               pop cx                                   
  24c7  c746fc0000       mov word ptr [bp - 4], 0                 
  24cc  e95c02           jmp 0x272b                               
  24cf  8b5efc           mov bx, word ptr [bp - 4]                
  24d2  69dbe000         imul bx, bx, 0xe0                        
  24d6  8b46fe           mov ax, word ptr [bp - 2]                
  24d9  d1e0             shl ax, 1                                
  24db  03d8             add bx, ax                               
  24dd  b81d1e           mov ax, 0x1e1d                           
  24e0  8ec0             mov es, ax                               
  24e2  268a870000       mov al, byte ptr es:[bx]                 
  24e7  25ff00           and ax, 0xff                             
  24ea  8bf8             mov di, ax                               
  24ec  8b5efc           mov bx, word ptr [bp - 4]                
  24ef  6bdb70           imul bx, bx, 0x70                        
  24f2  035efe           add bx, word ptr [bp - 2]                
  24f5  b8d919           mov ax, 0x19d9                           
  24f8  8ec0             mov es, ax                               
  24fa  268a970000       mov dl, byte ptr es:[bx]                 
  24ff  83e21f           and dx, 0x1f                             
  2502  0bd2             or dx, dx                                
  2504  7416             je 0x251c                                
  2506  8b5efc           mov bx, word ptr [bp - 4]                
  2509  6bdb70           imul bx, bx, 0x70                        
  250c  035efe           add bx, word ptr [bp - 2]                
  250f  8ec0             mov es, ax                               
  2511  268a870000       mov al, byte ptr es:[bx]                 
  2516  251f00           and ax, 0x1f                             
  2519  48               dec ax                                   
  251a  8bf8             mov di, ax                               
  251c  83ff50           cmp di, 0x50                             
  251f  7d03             jge 0x2524                               
  2521  e9ae00           jmp 0x25d2                               
  2524  83ff60           cmp di, 0x60                             
  2527  7c03             jl 0x252c                                
  2529  e9a600           jmp 0x25d2                               
  252c  8bde             mov bx, si                               
  252e  46               inc si                                   
  252f  8d86f6fe         lea ax, [bp - 0x10a]                     
  2533  03d8             add bx, ax                               
  2535  368a07           mov al, byte ptr ss:[bx]                 
  2538  98               cwde                                     
  2539  50               push ax                                  
  253a  8b46fc           mov ax, word ptr [bp - 4]                
  253d  d1e0             shl ax, 1                                
  253f  50               push ax                                  
  2540  8b46fe           mov ax, word ptr [bp - 2]                
  2543  d1e0             shl ax, 1                                
  2545  50               push ax                                  
  2546  1e               push ds                                  
  2547  681d58           push 0x581d                              
  254a  ff1ed069         lcall [0x69d0]                           
  254e  83c40a           add sp, 0xa                              
  2551  8bde             mov bx, si                               
  2553  46               inc si                                   
  2554  8d86f6fe         lea ax, [bp - 0x10a]                     
  2558  03d8             add bx, ax                               
  255a  368a07           mov al, byte ptr ss:[bx]                 
  255d  98               cwde                                     
  255e  50               push ax                                  
  255f  8b46fc           mov ax, word ptr [bp - 4]                
  2562  d1e0             shl ax, 1                                
  2564  50               push ax                                  
  2565  8b46fe           mov ax, word ptr [bp - 2]                
  2568  d1e0             shl ax, 1                                
  256a  40               inc ax                                   
  256b  50               push ax                                  
  256c  1e               push ds                                  
  256d  681d58           push 0x581d                              
  2570  ff1ed069         lcall [0x69d0]                           
  2574  83c40a           add sp, 0xa                              
  2577  8bde             mov bx, si                               
  2579  46               inc si                                   
  257a  8d86f6fe         lea ax, [bp - 0x10a]                     
  257e  03d8             add bx, ax                               
  2580  368a07           mov al, byte ptr ss:[bx]                 
  2583  98               cwde                                     
  2584  50               push ax                                  
  2585  8b46fc           mov ax, word ptr [bp - 4]                
  2588  d1e0             shl ax, 1                                
  258a  40               inc ax                                   
  258b  50               push ax                                  
  258c  8b46fe           mov ax, word ptr [bp - 2]                
  258f  d1e0             shl ax, 1                                
  2591  50               push ax                                  
  2592  1e               push ds                                  
  2593  681d58           push 0x581d                              
  2596  ff1ed069         lcall [0x69d0]                           
  259a  83c40a           add sp, 0xa                              
  259d  8bde             mov bx, si                               
  259f  46               inc si                                   
  25a0  8d86f6fe         lea ax, [bp - 0x10a]                     
  25a4  03d8             add bx, ax                               
  25a6  368a07           mov al, byte ptr ss:[bx]                 
  25a9  98               cwde                                     
  25aa  50               push ax                                  
  25ab  8b46fc           mov ax, word ptr [bp - 4]                
  25ae  d1e0             shl ax, 1                                
  25b0  40               inc ax                                   
  25b1  50               push ax                                  
  25b2  8b46fe           mov ax, word ptr [bp - 2]                
  25b5  d1e0             shl ax, 1                                
  25b7  40               inc ax                                   
  25b8  50               push ax                                  
  25b9  1e               push ds                                  
  25ba  681d58           push 0x581d                              
  25bd  ff1ed069         lcall [0x69d0]                           
  25c1  83c40a           add sp, 0xa                              
  25c4  81fe0001         cmp si, 0x100                            
  25c8  7d03             jge 0x25cd                               
  25ca  e95b01           jmp 0x2728                               
  25cd  33f6             xor si, si                               
  25cf  e95601           jmp 0x2728                               
  25d2  0bd2             or dx, dx                                
  25d4  7503             jne 0x25d9                               
  25d6  e99300           jmp 0x266c                               
  25d9  c41e825e         les bx, ptr [0x5e82]                     
  25dd  03df             add bx, di                               
  25df  268a07           mov al, byte ptr es:[bx]                 
  25e2  98               cwde                                     
  25e3  8bd0             mov dx, ax                               
  25e5  d1e0             shl ax, 1                                
  25e7  c41e665e         les bx, ptr [0x5e66]                     
  25eb  03d8             add bx, ax                               
  25ed  26ff37           push word ptr es:[bx]                    
  25f0  8b46fc           mov ax, word ptr [bp - 4]                
  25f3  d1e0             shl ax, 1                                
  25f5  50               push ax                                  
  25f6  8b46fe           mov ax, word ptr [bp - 2]                
  25f9  d1e0             shl ax, 1                                
  25fb  50               push ax                                  
  25fc  1e               push ds                                  
  25fd  681d58           push 0x581d                              
  2600  ff1ed069         lcall [0x69d0]                           
  2604  83c40a           add sp, 0xa                              
  2607  c41e7e5e         les bx, ptr [0x5e7e]                     
  260b  03df             add bx, di                               
  260d  268a07           mov al, byte ptr es:[bx]                 
  2610  98               cwde                                     
  2611  8bd0             mov dx, ax                               
  2613  d1e0             shl ax, 1                                
  2615  c41e665e         les bx, ptr [0x5e66]                     
  2619  03d8             add bx, ax                               
  261b  26ff37           push word ptr es:[bx]                    
  261e  8b46fc           mov ax, word ptr [bp - 4]                
  2621  d1e0             shl ax, 1                                
  2623  50               push ax                                  
  2624  8b46fe           mov ax, word ptr [bp - 2]                
  2627  d1e0             shl ax, 1                                
  2629  40               inc ax                                   
  262a  50               push ax                                  
  262b  1e               push ds                                  
  262c  681d58           push 0x581d                              
  262f  ff1ed069         lcall [0x69d0]                           
  2633  83c40a           add sp, 0xa                              
  2636  c41e7a5e         les bx, ptr [0x5e7a]                     
  263a  03df             add bx, di                               
  263c  268a07           mov al, byte ptr es:[bx]                 
  263f  98               cwde                                     
  2640  8bd0             mov dx, ax                               
  2642  d1e0             shl ax, 1                                
  2644  c41e665e         les bx, ptr [0x5e66]                     
  2648  03d8             add bx, ax                               
  264a  26ff37           push word ptr es:[bx]                    
  264d  8b46fc           mov ax, word ptr [bp - 4]                
  2650  d1e0             shl ax, 1                                
  2652  40               inc ax                                   
  2653  50               push ax                                  
  2654  8b46fe           mov ax, word ptr [bp - 2]                
  2657  d1e0             shl ax, 1                                
  2659  50               push ax                                  
  265a  1e               push ds                                  
  265b  681d58           push 0x581d                              
  265e  ff1ed069         lcall [0x69d0]                           
  2662  83c40a           add sp, 0xa                              
  2665  c41e765e         les bx, ptr [0x5e76]                     
  2669  e99000           jmp 0x26fc                               
  266c  c41e925e         les bx, ptr [0x5e92]                     
  2670  03df             add bx, di                               
  2672  268a07           mov al, byte ptr es:[bx]                 
  2675  98               cwde                                     
  2676  8bd0             mov dx, ax                               
  2678  d1e0             shl ax, 1                                
  267a  c41e665e         les bx, ptr [0x5e66]                     
  267e  03d8             add bx, ax                               
  2680  26ff37           push word ptr es:[bx]                    
  2683  8b46fc           mov ax, word ptr [bp - 4]                
  2686  d1e0             shl ax, 1                                
  2688  50               push ax                                  
  2689  8b46fe           mov ax, word ptr [bp - 2]                
  268c  d1e0             shl ax, 1                                
  268e  50               push ax                                  
  268f  1e               push ds                                  
  2690  681d58           push 0x581d                              
  2693  ff1ed069         lcall [0x69d0]                           
  2697  83c40a           add sp, 0xa                              
  269a  c41e8e5e         les bx, ptr [0x5e8e]                     
  269e  03df             add bx, di                               
  26a0  268a07           mov al, byte ptr es:[bx]                 
  26a3  98               cwde                                     
  26a4  8bd0             mov dx, ax                               
  26a6  d1e0             shl ax, 1                                
  26a8  c41e665e         les bx, ptr [0x5e66]                     
  26ac  03d8             add bx, ax                               
  26ae  26ff37           push word ptr es:[bx]                    
  26b1  8b46fc           mov ax, word ptr [bp - 4]                
  26b4  d1e0             shl ax, 1                                
  26b6  50               push ax                                  
  26b7  8b46fe           mov ax, word ptr [bp - 2]                
  26ba  d1e0             shl ax, 1                                
  26bc  40               inc ax                                   
  26bd  50               push ax                                  
  26be  1e               push ds                                  
  26bf  681d58           push 0x581d                              
  26c2  ff1ed069         lcall [0x69d0]                           
  26c6  83c40a           add sp, 0xa                              
  26c9  c41e8a5e         les bx, ptr [0x5e8a]                     
  26cd  03df             add bx, di                               
  26cf  268a07           mov al, byte ptr es:[bx]                 
  26d2  98               cwde                                     
  26d3  8bd0             mov dx, ax                               
  26d5  d1e0             shl ax, 1                                
  26d7  c41e665e         les bx, ptr [0x5e66]                     
  26db  03d8             add bx, ax                               
  26dd  26ff37           push word ptr es:[bx]                    
  26e0  8b46fc           mov ax, word ptr [bp - 4]                
  26e3  d1e0             shl ax, 1                                
  26e5  40               inc ax                                   
  26e6  50               push ax                                  
  26e7  8b46fe           mov ax, word ptr [bp - 2]                
  26ea  d1e0             shl ax, 1                                
  26ec  50               push ax                                  
  26ed  1e               push ds                                  
  26ee  681d58           push 0x581d                              
  26f1  ff1ed069         lcall [0x69d0]                           
  26f5  83c40a           add sp, 0xa                              
  26f8  c41e865e         les bx, ptr [0x5e86]                     
  26fc  03df             add bx, di                               
  26fe  268a07           mov al, byte ptr es:[bx]                 
  2701  98               cwde                                     
  2702  8bd0             mov dx, ax                               
  2704  d1e0             shl ax, 1                                
  2706  c41e665e         les bx, ptr [0x5e66]                     
  270a  03d8             add bx, ax                               
  270c  26ff37           push word ptr es:[bx]                    
  270f  8b46fc           mov ax, word ptr [bp - 4]                
  2712  d1e0             shl ax, 1                                
  2714  40               inc ax                                   
  2715  50               push ax                                  
  2716  8b46fe           mov ax, word ptr [bp - 2]                
  2719  d1e0             shl ax, 1                                
  271b  40               inc ax                                   
  271c  50               push ax                                  
  271d  1e               push ds                                  
  271e  681d58           push 0x581d                              
  2721  ff1ed069         lcall [0x69d0]                           
  2725  83c40a           add sp, 0xa                              
  2728  ff46fc           inc word ptr [bp - 4]                    
  272b  817efc9c00       cmp word ptr [bp - 4], 0x9c              
  2730  7d03             jge 0x2735                               
  2732  e99afd           jmp 0x24cf                               
  2735  ff46fe           inc word ptr [bp - 2]                    
  2738  837efe70         cmp word ptr [bp - 2], 0x70              
  273c  7d03             jge 0x2741                               
  273e  e962fd           jmp 0x24a3                               
  2741  66833e275800     cmp dword ptr [0x5827], 0                
  2747  7428             je 0x2771                                
  2749  f70652580a00     test word ptr [0x5852], 0xa              
  274f  7520             jne 0x2771                               
  2751  33f6             xor si, si                               
  2753  eb13             jmp 0x2768                               
  2755  8bde             mov bx, si                               
  2757  c1e302           shl bx, 2                                
  275a  66ffb72758       push dword ptr [bx + 0x5827]             
  275f  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  2764  83c404           add sp, 4                                
  2767  46               inc si                                   
  2768  a05158           mov al, byte ptr [0x5851]                
  276b  b400             mov ah, 0                                
  276d  3bc6             cmp ax, si                               
  276f  7fe4             jg 0x2755                                
  2771  90               nop                                      
  2772  0e               push cs                                  
  2773  e84004           call 0x2bb6                              
  2776  837efa00         cmp word ptr [bp - 6], 0                 
  277a  7505             jne 0x2781                               
  277c  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  2781  5f               pop di                                   
  2782  5e               pop si                                   
  2783  c9               leave                                    
  2784  cb               retf                                     

ovl63_2785:  ; ENTRY
  2785  55               push bp                                  
  2786  8bec             mov bp, sp                               
  2788  83ec06           sub sp, 6                                
  278b  56               push si                                  
  278c  57               push di                                  
  278d  8b7608           mov si, word ptr [bp + 8]                
  2790  8b7e0a           mov di, word ptr [bp + 0xa]              
  2793  c746fc0000       mov word ptr [bp - 4], 0                 
  2798  837e0600         cmp word ptr [bp + 6], 0                 
  279c  7405             je 0x27a3                                
  279e  90               nop                                      
  279f  0e               push cs                                  
  27a0  e86e02           call 0x2a11                              
  27a3  66a1725e         mov eax, dword ptr [0x5e72]              
  27a7  66a3665e         mov dword ptr [0x5e66], eax              
  27ab  6a07             push 7                                   
  27ad  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  27b2  59               pop cx                                   
  27b3  66833e275800     cmp dword ptr [0x5827], 0                
  27b9  743d             je 0x27f8                                
  27bb  f70652580a00     test word ptr [0x5852], 0xa              
  27c1  7535             jne 0x27f8                               
  27c3  c746fa0000       mov word ptr [bp - 6], 0                 
  27c8  eb24             jmp 0x27ee                               
  27ca  8b5efa           mov bx, word ptr [bp - 6]                
  27cd  c1e302           shl bx, 2                                
  27d0  66ffb72758       push dword ptr [bx + 0x5827]             
  27d5  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  27da  83c404           add sp, 4                                
  27dd  8b5efa           mov bx, word ptr [bp - 6]                
  27e0  c1e302           shl bx, 2                                
  27e3  89973958         mov word ptr [bx + 0x5839], dx           
  27e7  89873758         mov word ptr [bx + 0x5837], ax           
  27eb  ff46fa           inc word ptr [bp - 6]                    
  27ee  a05158           mov al, byte ptr [0x5851]                
  27f1  b400             mov ah, 0                                
  27f3  3b46fa           cmp ax, word ptr [bp - 6]                
  27f6  7fd2             jg 0x27ca                                
  27f8  8bdf             mov bx, di                               
  27fa  69dbe000         imul bx, bx, 0xe0                        
  27fe  8bc6             mov ax, si                               
  2800  d1e0             shl ax, 1                                
  2802  03d8             add bx, ax                               
  2804  b81d1e           mov ax, 0x1e1d                           
  2807  8ec0             mov es, ax                               
  2809  268a870000       mov al, byte ptr es:[bx]                 
  280e  25ff00           and ax, 0xff                             
  2811  8946fe           mov word ptr [bp - 2], ax                
  2814  8bdf             mov bx, di                               
  2816  6bdb70           imul bx, bx, 0x70                        
  2819  03de             add bx, si                               
  281b  b8d919           mov ax, 0x19d9                           
  281e  8ec0             mov es, ax                               
  2820  268a870000       mov al, byte ptr es:[bx]                 
  2825  251f00           and ax, 0x1f                             
  2828  0bc0             or ax, ax                                
  282a  741d             je 0x2849                                
  282c  c746fc0100       mov word ptr [bp - 4], 1                 
  2831  8bdf             mov bx, di                               
  2833  6bdb70           imul bx, bx, 0x70                        
  2836  03de             add bx, si                               
  2838  b8d919           mov ax, 0x19d9                           
  283b  8ec0             mov es, ax                               
  283d  268a870000       mov al, byte ptr es:[bx]                 
  2842  251f00           and ax, 0x1f                             
  2845  48               dec ax                                   
  2846  8946fe           mov word ptr [bp - 2], ax                
  2849  837efe50         cmp word ptr [bp - 2], 0x50              
  284d  7d03             jge 0x2852                               
  284f  e9b000           jmp 0x2902                               
  2852  837efe60         cmp word ptr [bp - 2], 0x60              
  2856  7c03             jl 0x285b                                
  2858  e9a700           jmp 0x2902                               
  285b  666803000100     push 0x10003                             
  2861  6a01             push 1                                   
  2863  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  2868  83c406           add sp, 6                                
  286b  8bd0             mov dx, ax                               
  286d  50               push ax                                  
  286e  8bc7             mov ax, di                               
  2870  d1e0             shl ax, 1                                
  2872  50               push ax                                  
  2873  8bc6             mov ax, si                               
  2875  d1e0             shl ax, 1                                
  2877  50               push ax                                  
  2878  1e               push ds                                  
  2879  681d58           push 0x581d                              
  287c  ff1ed069         lcall [0x69d0]                           
  2880  83c40a           add sp, 0xa                              
  2883  666803000100     push 0x10003                             
  2889  6a01             push 1                                   
  288b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  2890  83c406           add sp, 6                                
  2893  8bd0             mov dx, ax                               
  2895  50               push ax                                  
  2896  8bc7             mov ax, di                               
  2898  d1e0             shl ax, 1                                
  289a  50               push ax                                  
  289b  8bc6             mov ax, si                               
  289d  d1e0             shl ax, 1                                
  289f  40               inc ax                                   
  28a0  50               push ax                                  
  28a1  1e               push ds                                  
  28a2  681d58           push 0x581d                              
  28a5  ff1ed069         lcall [0x69d0]                           
  28a9  83c40a           add sp, 0xa                              
  28ac  666803000100     push 0x10003                             
  28b2  6a01             push 1                                   
  28b4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  28b9  83c406           add sp, 6                                
  28bc  8bd0             mov dx, ax                               
  28be  50               push ax                                  
  28bf  8bc7             mov ax, di                               
  28c1  d1e0             shl ax, 1                                
  28c3  40               inc ax                                   
  28c4  50               push ax                                  
  28c5  8bc6             mov ax, si                               
  28c7  d1e0             shl ax, 1                                
  28c9  50               push ax                                  
  28ca  1e               push ds                                  
  28cb  681d58           push 0x581d                              
  28ce  ff1ed069         lcall [0x69d0]                           
  28d2  83c40a           add sp, 0xa                              
  28d5  666803000100     push 0x10003                             
  28db  6a01             push 1                                   
  28dd  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  28e2  83c406           add sp, 6                                
  28e5  8bd0             mov dx, ax                               
  28e7  50               push ax                                  
  28e8  8bc7             mov ax, di                               
  28ea  d1e0             shl ax, 1                                
  28ec  40               inc ax                                   
  28ed  50               push ax                                  
  28ee  8bc6             mov ax, si                               
  28f0  d1e0             shl ax, 1                                
  28f2  40               inc ax                                   
  28f3  50               push ax                                  
  28f4  1e               push ds                                  
  28f5  681d58           push 0x581d                              
  28f8  ff1ed069         lcall [0x69d0]                           
  28fc  83c40a           add sp, 0xa                              
  28ff  e90b01           jmp 0x2a0d                               
  2902  837efc00         cmp word ptr [bp - 4], 0                 
  2906  740c             je 0x2914                                
  2908  c41e825e         les bx, ptr [0x5e82]                     
  290c  035efe           add bx, word ptr [bp - 2]                
  290f  268a07           mov al, byte ptr es:[bx]                 
  2912  eb0a             jmp 0x291e                               
  2914  c41e925e         les bx, ptr [0x5e92]                     
  2918  035efe           add bx, word ptr [bp - 2]                
  291b  268a07           mov al, byte ptr es:[bx]                 
  291e  98               cwde                                     
  291f  8bd0             mov dx, ax                               
  2921  d1e0             shl ax, 1                                
  2923  c41e665e         les bx, ptr [0x5e66]                     
  2927  03d8             add bx, ax                               
  2929  26ff37           push word ptr es:[bx]                    
  292c  8bc7             mov ax, di                               
  292e  d1e0             shl ax, 1                                
  2930  50               push ax                                  
  2931  8bc6             mov ax, si                               
  2933  d1e0             shl ax, 1                                
  2935  50               push ax                                  
  2936  1e               push ds                                  
  2937  681d58           push 0x581d                              
  293a  ff1ed069         lcall [0x69d0]                           
  293e  83c40a           add sp, 0xa                              
  2941  837efc00         cmp word ptr [bp - 4], 0                 
  2945  740c             je 0x2953                                
  2947  c41e7e5e         les bx, ptr [0x5e7e]                     
  294b  035efe           add bx, word ptr [bp - 2]                
  294e  268a07           mov al, byte ptr es:[bx]                 
  2951  eb0a             jmp 0x295d                               
  2953  c41e8e5e         les bx, ptr [0x5e8e]                     
  2957  035efe           add bx, word ptr [bp - 2]                
  295a  268a07           mov al, byte ptr es:[bx]                 
  295d  98               cwde                                     
  295e  8bd0             mov dx, ax                               
  2960  d1e0             shl ax, 1                                
  2962  c41e665e         les bx, ptr [0x5e66]                     
  2966  03d8             add bx, ax                               
  2968  26ff37           push word ptr es:[bx]                    
  296b  8bc7             mov ax, di                               
  296d  d1e0             shl ax, 1                                
  296f  50               push ax                                  
  2970  8bc6             mov ax, si                               
  2972  d1e0             shl ax, 1                                
  2974  40               inc ax                                   
  2975  50               push ax                                  
  2976  1e               push ds                                  
  2977  681d58           push 0x581d                              
  297a  ff1ed069         lcall [0x69d0]                           
  297e  83c40a           add sp, 0xa                              
  2981  837efc00         cmp word ptr [bp - 4], 0                 
  2985  740c             je 0x2993                                
  2987  c41e7a5e         les bx, ptr [0x5e7a]                     
  298b  035efe           add bx, word ptr [bp - 2]                
  298e  268a07           mov al, byte ptr es:[bx]                 
  2991  eb0a             jmp 0x299d                               
  2993  c41e8a5e         les bx, ptr [0x5e8a]                     
  2997  035efe           add bx, word ptr [bp - 2]                
  299a  268a07           mov al, byte ptr es:[bx]                 
  299d  98               cwde                                     
  299e  8bd0             mov dx, ax                               
  29a0  d1e0             shl ax, 1                                
  29a2  c41e665e         les bx, ptr [0x5e66]                     
  29a6  03d8             add bx, ax                               
  29a8  26ff37           push word ptr es:[bx]                    
  29ab  8bc7             mov ax, di                               
  29ad  d1e0             shl ax, 1                                
  29af  40               inc ax                                   
  29b0  50               push ax                                  
  29b1  8bc6             mov ax, si                               
  29b3  d1e0             shl ax, 1                                
  29b5  50               push ax                                  
  29b6  1e               push ds                                  
  29b7  681d58           push 0x581d                              
  29ba  ff1ed069         lcall [0x69d0]                           
  29be  83c40a           add sp, 0xa                              
  29c1  837efc00         cmp word ptr [bp - 4], 0                 
  29c5  740c             je 0x29d3                                
  29c7  c41e765e         les bx, ptr [0x5e76]                     
  29cb  035efe           add bx, word ptr [bp - 2]                
  29ce  268a07           mov al, byte ptr es:[bx]                 
  29d1  eb0a             jmp 0x29dd                               
  29d3  c41e865e         les bx, ptr [0x5e86]                     
  29d7  035efe           add bx, word ptr [bp - 2]                
  29da  268a07           mov al, byte ptr es:[bx]                 
  29dd  98               cwde                                     
  29de  8bd0             mov dx, ax                               
  29e0  d1e0             shl ax, 1                                
  29e2  c41e665e         les bx, ptr [0x5e66]                     
  29e6  03d8             add bx, ax                               
  29e8  26ff37           push word ptr es:[bx]                    
  29eb  8bc7             mov ax, di                               
  29ed  d1e0             shl ax, 1                                
  29ef  40               inc ax                                   
  29f0  50               push ax                                  
  29f1  8bc6             mov ax, si                               
  29f3  d1e0             shl ax, 1                                
  29f5  40               inc ax                                   
  29f6  50               push ax                                  
  29f7  1e               push ds                                  
  29f8  681d58           push 0x581d                              
  29fb  ff1ed069         lcall [0x69d0]                           
  29ff  83c40a           add sp, 0xa                              
  2a02  837e0600         cmp word ptr [bp + 6], 0                 
  2a06  7405             je 0x2a0d                                
  2a08  90               nop                                      
  2a09  0e               push cs                                  
  2a0a  e8a901           call 0x2bb6                              
  2a0d  5f               pop di                                   
  2a0e  5e               pop si                                   
  2a0f  c9               leave                                    
  2a10  cb               retf                                     

ovl63_2a11:  ; ENTRY
  2a11  55               push bp                                  
  2a12  8bec             mov bp, sp                               
  2a14  56               push si                                  
  2a15  b8042c           mov ax, 0x2c04                           
  2a18  8ec0             mov es, ax                               
  2a1a  26ff366101       push word ptr es:[0x161]                 
  2a1f  666a17           push 0x17                                
  2a22  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  2a27  83c404           add sp, 4                                
  2a2a  52               push dx                                  
  2a2b  50               push ax                                  
  2a2c  1e               push ds                                  
  2a2d  68385c           push 0x5c38                              
  2a30  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  2a35  83c40a           add sp, 0xa                              
  2a38  6a02             push 2                                   
  2a3a  1e               push ds                                  
  2a3b  68385c           push 0x5c38                              
  2a3e  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  2a43  83c406           add sp, 6                                
  2a46  8bf0             mov si, ax                               
  2a48  0bf6             or si, si                                
  2a4a  7d03             jge 0x2a4f                               
  2a4c  e96401           jmp 0x2bb3                               
  2a4f  680001           push 0x100                               
  2a52  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2a57  59               pop cx                                   
  2a58  8916945e         mov word ptr [0x5e94], dx                
  2a5c  a3925e           mov word ptr [0x5e92], ax                
  2a5f  680001           push 0x100                               
  2a62  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2a67  59               pop cx                                   
  2a68  8916905e         mov word ptr [0x5e90], dx                
  2a6c  a38e5e           mov word ptr [0x5e8e], ax                
  2a6f  680001           push 0x100                               
  2a72  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2a77  59               pop cx                                   
  2a78  89168c5e         mov word ptr [0x5e8c], dx                
  2a7c  a38a5e           mov word ptr [0x5e8a], ax                
  2a7f  680001           push 0x100                               
  2a82  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2a87  59               pop cx                                   
  2a88  8916885e         mov word ptr [0x5e88], dx                
  2a8c  a3865e           mov word ptr [0x5e86], ax                
  2a8f  6a14             push 0x14                                
  2a91  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2a96  59               pop cx                                   
  2a97  8916845e         mov word ptr [0x5e84], dx                
  2a9b  a3825e           mov word ptr [0x5e82], ax                
  2a9e  6a14             push 0x14                                
  2aa0  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2aa5  59               pop cx                                   
  2aa6  8916805e         mov word ptr [0x5e80], dx                
  2aaa  a37e5e           mov word ptr [0x5e7e], ax                
  2aad  6a14             push 0x14                                
  2aaf  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2ab4  59               pop cx                                   
  2ab5  89167c5e         mov word ptr [0x5e7c], dx                
  2ab9  a37a5e           mov word ptr [0x5e7a], ax                
  2abc  6a14             push 0x14                                
  2abe  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2ac3  59               pop cx                                   
  2ac4  8916785e         mov word ptr [0x5e78], dx                
  2ac8  a3765e           mov word ptr [0x5e76], ax                
  2acb  6a20             push 0x20                                
  2acd  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2ad2  59               pop cx                                   
  2ad3  8916745e         mov word ptr [0x5e74], dx                
  2ad7  a3725e           mov word ptr [0x5e72], ax                
  2ada  6a20             push 0x20                                
  2adc  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2ae1  59               pop cx                                   
  2ae2  8916705e         mov word ptr [0x5e70], dx                
  2ae6  a36e5e           mov word ptr [0x5e6e], ax                
  2ae9  6a20             push 0x20                                
  2aeb  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2af0  59               pop cx                                   
  2af1  89166c5e         mov word ptr [0x5e6c], dx                
  2af5  a36a5e           mov word ptr [0x5e6a], ax                
  2af8  680001           push 0x100                               
  2afb  66ff36925e       push dword ptr [0x5e92]                  
  2b00  56               push si                                  
  2b01  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b06  83c408           add sp, 8                                
  2b09  680001           push 0x100                               
  2b0c  66ff368e5e       push dword ptr [0x5e8e]                  
  2b11  56               push si                                  
  2b12  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b17  83c408           add sp, 8                                
  2b1a  680001           push 0x100                               
  2b1d  66ff368a5e       push dword ptr [0x5e8a]                  
  2b22  56               push si                                  
  2b23  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b28  83c408           add sp, 8                                
  2b2b  680001           push 0x100                               
  2b2e  66ff36865e       push dword ptr [0x5e86]                  
  2b33  56               push si                                  
  2b34  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b39  83c408           add sp, 8                                
  2b3c  6a20             push 0x20                                
  2b3e  66ff36725e       push dword ptr [0x5e72]                  
  2b43  56               push si                                  
  2b44  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b49  83c408           add sp, 8                                
  2b4c  6a20             push 0x20                                
  2b4e  66ff366e5e       push dword ptr [0x5e6e]                  
  2b53  56               push si                                  
  2b54  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b59  83c408           add sp, 8                                
  2b5c  6a20             push 0x20                                
  2b5e  66ff366a5e       push dword ptr [0x5e6a]                  
  2b63  56               push si                                  
  2b64  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b69  83c408           add sp, 8                                
  2b6c  6a14             push 0x14                                
  2b6e  66ff36825e       push dword ptr [0x5e82]                  
  2b73  56               push si                                  
  2b74  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b79  83c408           add sp, 8                                
  2b7c  6a14             push 0x14                                
  2b7e  66ff367e5e       push dword ptr [0x5e7e]                  
  2b83  56               push si                                  
  2b84  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b89  83c408           add sp, 8                                
  2b8c  6a14             push 0x14                                
  2b8e  66ff367a5e       push dword ptr [0x5e7a]                  
  2b93  56               push si                                  
  2b94  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2b99  83c408           add sp, 8                                
  2b9c  6a14             push 0x14                                
  2b9e  66ff36765e       push dword ptr [0x5e76]                  
  2ba3  56               push si                                  
  2ba4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2ba9  83c408           add sp, 8                                
  2bac  56               push si                                  
  2bad  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  2bb2  59               pop cx                                   
  2bb3  5e               pop si                                   
  2bb4  5d               pop bp                                   
  2bb5  cb               retf                                     

ovl63_2bb6:  ; ENTRY
  2bb6  55               push bp                                  
  2bb7  8bec             mov bp, sp                               
  2bb9  66ff36925e       push dword ptr [0x5e92]                  
  2bbe  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2bc3  83c404           add sp, 4                                
  2bc6  66ff368e5e       push dword ptr [0x5e8e]                  
  2bcb  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2bd0  83c404           add sp, 4                                
  2bd3  66ff368a5e       push dword ptr [0x5e8a]                  
  2bd8  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2bdd  83c404           add sp, 4                                
  2be0  66ff36865e       push dword ptr [0x5e86]                  
  2be5  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2bea  83c404           add sp, 4                                
  2bed  66ff36825e       push dword ptr [0x5e82]                  
  2bf2  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2bf7  83c404           add sp, 4                                
  2bfa  66ff367e5e       push dword ptr [0x5e7e]                  
  2bff  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c04  83c404           add sp, 4                                
  2c07  66ff367a5e       push dword ptr [0x5e7a]                  
  2c0c  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c11  83c404           add sp, 4                                
  2c14  66ff36765e       push dword ptr [0x5e76]                  
  2c19  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c1e  83c404           add sp, 4                                
  2c21  66ff36725e       push dword ptr [0x5e72]                  
  2c26  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c2b  83c404           add sp, 4                                
  2c2e  66ff366e5e       push dword ptr [0x5e6e]                  
  2c33  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c38  83c404           add sp, 4                                
  2c3b  66ff366a5e       push dword ptr [0x5e6a]                  
  2c40  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  2c45  83c404           add sp, 4                                
  2c48  5d               pop bp                                   
  2c49  cb               retf                                     
