; seg 083d  img 0x83d0..0x9660  file off 0x8fd0
  083d:0000  d85f5e           fcomp dword ptr [bx + 0x5e]              
  083d:0003  c9               leave                                    
  083d:0004  cb               retf                                     

proc_083d_0005:
  083d:0005  55               push bp                                  
  083d:0006  8bec             mov bp, sp                               
  083d:0008  83ec02           sub sp, 2                                
  083d:000b  56               push si                                  
  083d:000c  57               push di                                  
  083d:000d  8b4606           mov ax, word ptr [bp + 6]                
  083d:0010  d1e0             shl ax, 1                                
  083d:0012  8946fe           mov word ptr [bp - 2], ax                
  083d:0015  33c9             xor cx, cx                               
  083d:0017  33ff             xor di, di                               
  083d:0019  eb1f             jmp 0x3a                                 
  083d:001b  8bf7             mov si, di                               
  083d:001d  33d2             xor dx, dx                               
  083d:001f  eb0e             jmp 0x2f                                 
  083d:0021  8bd9             mov bx, cx                               
  083d:0023  03da             add bx, dx                               
  083d:0025  d1e3             shl bx, 1                                
  083d:0027  89b7fa15         mov word ptr [bx + 0x15fa], si           
  083d:002b  03760c           add si, word ptr [bp + 0xc]              
  083d:002e  42               inc dx                                   
  083d:002f  3b560a           cmp dx, word ptr [bp + 0xa]              
  083d:0032  7ced             jl 0x21                                  
  083d:0034  037efe           add di, word ptr [bp - 2]                
  083d:0037  034e0a           add cx, word ptr [bp + 0xa]              
  083d:003a  3b4e08           cmp cx, word ptr [bp + 8]                
  083d:003d  7cdc             jl 0x1b                                  
  083d:003f  5f               pop di                                   
  083d:0040  5e               pop si                                   
  083d:0041  c9               leave                                    
  083d:0042  cb               retf                                     

proc_083d_0043:
  083d:0043  55               push bp                                  
  083d:0044  8bec             mov bp, sp                               
  083d:0046  56               push si                                  
  083d:0047  8b4606           mov ax, word ptr [bp + 6]                
  083d:004a  6bc01a           imul ax, ax, 0x1a                        
  083d:004d  058707           add ax, 0x787                            
  083d:0050  8c1e0b08         mov word ptr [0x80b], ds                 
  083d:0054  a30908           mov word ptr [0x809], ax                 
  083d:0057  c41e0908         les bx, ptr [0x809]                      
  083d:005b  26ff770a         push word ptr es:[bx + 0xa]              
  083d:005f  26ff770c         push word ptr es:[bx + 0xc]              
  083d:0063  26ff7706         push word ptr es:[bx + 6]                
  083d:0067  26ff7702         push word ptr es:[bx + 2]                
  083d:006b  0e               push cs                                  
  083d:006c  e896ff           call 5                                   -> 083d:0005
  083d:006f  83c408           add sp, 8                                
  083d:0072  c41e0908         les bx, ptr [0x809]                      
  083d:0076  26ff7712         push word ptr es:[bx + 0x12]             
  083d:007a  90               nop                                      
  083d:007b  0e               push cs                                  
  083d:007c  e88601           call 0x205                               -> 083d:0205
  083d:007f  59               pop cx                                   
  083d:0080  c41e0908         les bx, ptr [0x809]                      
  083d:0084  26ff7714         push word ptr es:[bx + 0x14]             
  083d:0088  9a0c00fc0b       lcall 0xbfc, 0xc                         -> 0bfc:000c [reloc]
  083d:008d  59               pop cx                                   
  083d:008e  c41e0908         les bx, ptr [0x809]                      
  083d:0092  26ff7706         push word ptr es:[bx + 6]                
  083d:0096  26ff7704         push word ptr es:[bx + 4]                
  083d:009a  666a00           push 0                                   
  083d:009d  1e               push ds                                  
  083d:009e  684c07           push 0x74c                               
  083d:00a1  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  083d:00a6  83c40c           add sp, 0xc                              
  083d:00a9  c41e0908         les bx, ptr [0x809]                      
  083d:00ad  268b4702         mov ax, word ptr es:[bx + 2]             
  083d:00b1  a35407           mov word ptr [0x754], ax                 
  083d:00b4  c6067e0700       mov byte ptr [0x77e], 0                  
  083d:00b9  c6067f0700       mov byte ptr [0x77f], 0                  
  083d:00be  268a470e         mov al, byte ptr es:[bx + 0xe]           
  083d:00c2  a28007           mov byte ptr [0x780], al                 
  083d:00c5  33f6             xor si, si                               
  083d:00c7  eb19             jmp 0xe2                                 
  083d:00c9  c41e0908         les bx, ptr [0x809]                      
  083d:00cd  66260fb74708     movzx eax, word ptr es:[bx + 8]          
  083d:00d3  66c1e010         shl eax, 0x10                            
  083d:00d7  8bde             mov bx, si                               
  083d:00d9  c1e302           shl bx, 2                                
  083d:00dc  6689876607       mov dword ptr [bx + 0x766], eax          
  083d:00e1  46               inc si                                   
  083d:00e2  a08007           mov al, byte ptr [0x780]                 
  083d:00e5  b400             mov ah, 0                                
  083d:00e7  3bc6             cmp ax, si                               
  083d:00e9  7fde             jg 0xc9                                  
  083d:00eb  66c706760700000000 mov dword ptr [0x776], 0                 
  083d:00f4  8c1e7c07         mov word ptr [0x77c], ds                 
  083d:00f8  c7067a07fa15     mov word ptr [0x77a], 0x15fa             
  083d:00fe  830e810702       or word ptr [0x781], 2                   
  083d:0103  c41e0908         les bx, ptr [0x809]                      
  083d:0107  268b1f           mov bx, word ptr es:[bx]                 
  083d:010a  83fb04           cmp bx, 4                                
  083d:010d  773b             ja 0x14a                                 
  083d:010f  d1e3             shl bx, 1                                
  083d:0111  2effa7fb01       jmp word ptr cs:[bx + 0x1fb]             
  083d:0116  c706f8152b07     mov word ptr [0x15f8], 0x72b              [reloc]
  083d:011c  c706f615a103     mov word ptr [0x15f6], 0x3a1             
  083d:0122  c706ec152b07     mov word ptr [0x15ec], 0x72b              [reloc]
  083d:0128  c706ea154d0c     mov word ptr [0x15ea], 0xc4d             
  083d:012e  c706f4152b07     mov word ptr [0x15f4], 0x72b              [reloc]
  083d:0134  c706f2150c00     mov word ptr [0x15f2], 0xc               
  083d:013a  c706f0152b07     mov word ptr [0x15f0], 0x72b              [reloc]
  083d:0140  c706ee159c01     mov word ptr [0x15ee], 0x19c             
  083d:0146  eb02             jmp 0x14a                                
  083d:0148  eb00             jmp 0x14a                                
  083d:014a  9a8c03c30b       lcall 0xbc3, 0x38c                       -> 0bc3:038c [reloc]
  083d:014f  bb0a00           mov bx, 0xa                              
  083d:0152  99               cdq                                      
  083d:0153  f7fb             idiv bx                                  
  083d:0155  6bc00a           imul ax, ax, 0xa                         
  083d:0158  3d1801           cmp ax, 0x118                            
  083d:015b  7d26             jge 0x183                                
  083d:015d  c706e8158206     mov word ptr [0x15e8], 0x682              [reloc]
  083d:0163  c706e6154a02     mov word ptr [0x15e6], 0x24a             
  083d:0169  c706e4158206     mov word ptr [0x15e4], 0x682              [reloc]
  083d:016f  c706e2151a02     mov word ptr [0x15e2], 0x21a             
  083d:0175  c706e0158206     mov word ptr [0x15e0], 0x682              [reloc]
  083d:017b  c706de151a02     mov word ptr [0x15de], 0x21a             
  083d:0181  eb4c             jmp 0x1cf                                
  083d:0183  9a8c03c30b       lcall 0xbc3, 0x38c                       -> 0bc3:038c [reloc]
  083d:0188  bb0a00           mov bx, 0xa                              
  083d:018b  99               cdq                                      
  083d:018c  f7fb             idiv bx                                  
  083d:018e  6bc00a           imul ax, ax, 0xa                         
  083d:0191  3d1801           cmp ax, 0x118                            
  083d:0194  7502             jne 0x198                                
  083d:0196  ebc5             jmp 0x15d                                
  083d:0198  9a8c03c30b       lcall 0xbc3, 0x38c                       -> 0bc3:038c [reloc]
  083d:019d  bb0a00           mov bx, 0xa                              
  083d:01a0  99               cdq                                      
  083d:01a1  f7fb             idiv bx                                  
  083d:01a3  6bc00a           imul ax, ax, 0xa                         
  083d:01a6  3d7c01           cmp ax, 0x17c                            
  083d:01a9  7c24             jl 0x1cf                                 
  083d:01ab  c706e8158206     mov word ptr [0x15e8], 0x682              [reloc]
  083d:01b1  c706e6154a02     mov word ptr [0x15e6], 0x24a             
  083d:01b7  c706e4158206     mov word ptr [0x15e4], 0x682              [reloc]
  083d:01bd  c706e2151a02     mov word ptr [0x15e2], 0x21a             
  083d:01c3  c706e0158206     mov word ptr [0x15e0], 0x682              [reloc]
  083d:01c9  c706de15e801     mov word ptr [0x15de], 0x1e8             
  083d:01cf  9a8c03c30b       lcall 0xbc3, 0x38c                       -> 0bc3:038c [reloc]
  083d:01d4  bb0a00           mov bx, 0xa                              
  083d:01d7  99               cdq                                      
  083d:01d8  f7fb             idiv bx                                  
  083d:01da  0bd2             or dx, dx                                
  083d:01dc  750e             jne 0x1ec                                
  083d:01de  c706dc153d08     mov word ptr [0x15dc], 0x83d              [reloc]
  083d:01e4  c706da151712     mov word ptr [0x15da], 0x1217            
  083d:01ea  eb0c             jmp 0x1f8                                
  083d:01ec  c706dc15da06     mov word ptr [0x15dc], 0x6da              [reloc]
  083d:01f2  c706da15db00     mov word ptr [0x15da], 0xdb              
  083d:01f8  5e               pop si                                   
  083d:01f9  5d               pop bp                                   
  083d:01fa  cb               retf                                     
  083d:01fb  16               push ss                                  
  083d:01fc  01160116         add word ptr [0x1601], dx                
  083d:0200  014801           add word ptr [bx + si + 1], cx           
  083d:0203  16               push ss                                  
  083d:0204  01558b           add word ptr [di - 0x75], dx             
  083d:0207  ec               in al, dx                                
  083d:0208  8b4606           mov ax, word ptr [bp + 6]                
  083d:020b  a3d815           mov word ptr [0x15d8], ax                
  083d:020e  b80100           mov ax, 1                                
  083d:0211  8a0ed815         mov cl, byte ptr [0x15d8]                
  083d:0215  d3e0             shl ax, cl                               
  083d:0217  a3d615           mov word ptr [0x15d6], ax                
  083d:021a  c41e0908         les bx, ptr [0x809]                      
  083d:021e  26f76f0e         imul word ptr es:[bx + 0xe]              
  083d:0222  a3d415           mov word ptr [0x15d4], ax                
  083d:0225  b81000           mov ax, 0x10                             
  083d:0228  99               cdq                                      
  083d:0229  f73ed415         idiv word ptr [0x15d4]                   
  083d:022d  a3c415           mov word ptr [0x15c4], ax                
  083d:0230  b80100           mov ax, 1                                
  083d:0233  8a0ed615         mov cl, byte ptr [0x15d6]                
  083d:0237  d3e0             shl ax, cl                               
  083d:0239  48               dec ax                                   
  083d:023a  a3ce15           mov word ptr [0x15ce], ax                
  083d:023d  b81000           mov ax, 0x10                             
  083d:0240  8a0ed815         mov cl, byte ptr [0x15d8]                
  083d:0244  d3f8             sar ax, cl                               
  083d:0246  a3cc15           mov word ptr [0x15cc], ax                
  083d:0249  d1f8             sar ax, 1                                
  083d:024b  a3ca15           mov word ptr [0x15ca], ax                
  083d:024e  a1cc15           mov ax, word ptr [0x15cc]                
  083d:0251  48               dec ax                                   
  083d:0252  a3c815           mov word ptr [0x15c8], ax                
  083d:0255  a1ca15           mov ax, word ptr [0x15ca]                
  083d:0258  48               dec ax                                   
  083d:0259  a3c615           mov word ptr [0x15c6], ax                
  083d:025c  b80400           mov ax, 4                                
  083d:025f  2b06d815         sub ax, word ptr [0x15d8]                
  083d:0263  a3c215           mov word ptr [0x15c2], ax                
  083d:0266  48               dec ax                                   
  083d:0267  a3c015           mov word ptr [0x15c0], ax                
  083d:026a  b80100           mov ax, 1                                
  083d:026d  8a0ed415         mov cl, byte ptr [0x15d4]                
  083d:0271  d3e0             shl ax, cl                               
  083d:0273  a3d015           mov word ptr [0x15d0], ax                
  083d:0276  48               dec ax                                   
  083d:0277  a3d215           mov word ptr [0x15d2], ax                
  083d:027a  5d               pop bp                                   
  083d:027b  cb               retf                                     

proc_083d_027c:
  083d:027c  55               push bp                                  
  083d:027d  8bec             mov bp, sp                               
  083d:027f  c41e0908         les bx, ptr [0x809]                      
  083d:0283  26ff770e         push word ptr es:[bx + 0xe]              
  083d:0287  ff760c           push word ptr [bp + 0xc]                 
  083d:028a  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:028d  0306c815         add ax, word ptr [0x15c8]                
  083d:0291  8b16c815         mov dx, word ptr [0x15c8]                
  083d:0295  f7d2             not dx                                   
  083d:0297  23c2             and ax, dx                               
  083d:0299  8a0ec215         mov cl, byte ptr [0x15c2]                
  083d:029d  d3f8             sar ax, cl                               
  083d:029f  50               push ax                                  
  083d:02a0  66ff7606         push dword ptr [bp + 6]                  
  083d:02a4  90               nop                                      
  083d:02a5  0e               push cs                                  
  083d:02a6  e8d007           call 0xa79                               -> 083d:0a79
  083d:02a9  83c40a           add sp, 0xa                              
  083d:02ac  eb00             jmp 0x2ae                                
  083d:02ae  5d               pop bp                                   
  083d:02af  cb               retf                                     

proc_083d_02b0:
  083d:02b0  55               push bp                                  
  083d:02b1  8bec             mov bp, sp                               
  083d:02b3  ff760e           push word ptr [bp + 0xe]                 
  083d:02b6  ff760c           push word ptr [bp + 0xc]                 
  083d:02b9  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:02bc  0306c815         add ax, word ptr [0x15c8]                
  083d:02c0  8b16c815         mov dx, word ptr [0x15c8]                
  083d:02c4  f7d2             not dx                                   
  083d:02c6  23c2             and ax, dx                               
  083d:02c8  8a0ec215         mov cl, byte ptr [0x15c2]                
  083d:02cc  d3f8             sar ax, cl                               
  083d:02ce  50               push ax                                  
  083d:02cf  66ff7606         push dword ptr [bp + 6]                  
  083d:02d3  90               nop                                      
  083d:02d4  0e               push cs                                  
  083d:02d5  e8a107           call 0xa79                               -> 083d:0a79
  083d:02d8  83c40a           add sp, 0xa                              
  083d:02db  eb00             jmp 0x2dd                                
  083d:02dd  5d               pop bp                                   
  083d:02de  cb               retf                                     

proc_083d_02df:
  083d:02df  55               push bp                                  
  083d:02e0  8bec             mov bp, sp                               
  083d:02e2  83ec06           sub sp, 6                                
  083d:02e5  56               push si                                  
  083d:02e6  57               push di                                  
  083d:02e7  8b760c           mov si, word ptr [bp + 0xc]              
  083d:02ea  8b7e18           mov di, word ptr [bp + 0x18]             
  083d:02ed  eb47             jmp 0x336                                
  083d:02ef  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:02f2  8946fe           mov word ptr [bp - 2], ax                
  083d:02f5  8b4616           mov ax, word ptr [bp + 0x16]             
  083d:02f8  8946fc           mov word ptr [bp - 4], ax                
  083d:02fb  8b460e           mov ax, word ptr [bp + 0xe]              
  083d:02fe  8946fa           mov word ptr [bp - 6], ax                
  083d:0301  eb27             jmp 0x32a                                
  083d:0303  56               push si                                  
  083d:0304  8b46fe           mov ax, word ptr [bp - 2]                
  083d:0307  ff46fe           inc word ptr [bp - 2]                    
  083d:030a  50               push ax                                  
  083d:030b  66ff7606         push dword ptr [bp + 6]                  
  083d:030f  ff1eee15         lcall [0x15ee]                           
  083d:0313  83c408           add sp, 8                                
  083d:0316  50               push ax                                  
  083d:0317  57               push di                                  
  083d:0318  8b46fc           mov ax, word ptr [bp - 4]                
  083d:031b  ff46fc           inc word ptr [bp - 4]                    
  083d:031e  50               push ax                                  
  083d:031f  66ff7612         push dword ptr [bp + 0x12]               
  083d:0323  ff1ef215         lcall [0x15f2]                           
  083d:0327  83c40a           add sp, 0xa                              
  083d:032a  8b46fa           mov ax, word ptr [bp - 6]                
  083d:032d  ff4efa           dec word ptr [bp - 6]                    
  083d:0330  0bc0             or ax, ax                                
  083d:0332  75cf             jne 0x303                                
  083d:0334  46               inc si                                   
  083d:0335  47               inc di                                   
  083d:0336  8b4610           mov ax, word ptr [bp + 0x10]             
  083d:0339  ff4e10           dec word ptr [bp + 0x10]                 
  083d:033c  0bc0             or ax, ax                                
  083d:033e  75af             jne 0x2ef                                
  083d:0340  5f               pop di                                   
  083d:0341  5e               pop si                                   
  083d:0342  c9               leave                                    
  083d:0343  cb               retf                                     

proc_083d_0344:
  083d:0344  55               push bp                                  
  083d:0345  8bec             mov bp, sp                               
  083d:0347  ff7606           push word ptr [bp + 6]                   
  083d:034a  90               nop                                      
  083d:034b  0e               push cs                                  
  083d:034c  e80700           call 0x356                               -> 083d:0356
  083d:034f  59               pop cx                                   
  083d:0350  24ff             and al, 0xff                             
  083d:0352  eb00             jmp 0x354                                
  083d:0354  5d               pop bp                                   
  083d:0355  cb               retf                                     

proc_083d_0356:
  083d:0356  55               push bp                                  
  083d:0357  8bec             mov bp, sp                               
  083d:0359  56               push si                                  
  083d:035a  8b5606           mov dx, word ptr [bp + 6]                
  083d:035d  2316d215         and dx, word ptr [0x15d2]                
  083d:0361  8bc2             mov ax, dx                               
  083d:0363  8bd8             mov bx, ax                               
  083d:0365  be0100           mov si, 1                                
  083d:0368  eb0d             jmp 0x377                                
  083d:036a  8bc3             mov ax, bx                               
  083d:036c  8a0ed415         mov cl, byte ptr [0x15d4]                
  083d:0370  d3e0             shl ax, cl                               
  083d:0372  0bc2             or ax, dx                                
  083d:0374  8bd8             mov bx, ax                               
  083d:0376  46               inc si                                   
  083d:0377  3b36c415         cmp si, word ptr [0x15c4]                
  083d:037b  72ed             jb 0x36a                                 
  083d:037d  8bc3             mov ax, bx                               
  083d:037f  eb00             jmp 0x381                                
  083d:0381  5e               pop si                                   
  083d:0382  5d               pop bp                                   
  083d:0383  cb               retf                                     

proc_083d_0384:
  083d:0384  55               push bp                                  
  083d:0385  8bec             mov bp, sp                               
  083d:0387  c45e06           les bx, ptr [bp + 6]                     
  083d:038a  26834f3501       or word ptr es:[bx + 0x35], 1            
  083d:038f  668b460a         mov eax, dword ptr [bp + 0xa]            
  083d:0393  6626894737       mov dword ptr es:[bx + 0x37], eax        
  083d:0398  5d               pop bp                                   
  083d:0399  cb               retf                                     

proc_083d_039a:
  083d:039a  55               push bp                                  
  083d:039b  8bec             mov bp, sp                               
  083d:039d  83ec02           sub sp, 2                                
  083d:03a0  56               push si                                  
  083d:03a1  57               push di                                  
  083d:03a2  8b7e0a           mov di, word ptr [bp + 0xa]              
  083d:03a5  8b760c           mov si, word ptr [bp + 0xc]              
  083d:03a8  c45e06           les bx, ptr [bp + 6]                     
  083d:03ab  26397706         cmp word ptr es:[bx + 6], si             
  083d:03af  7f2e             jg 0x3df                                 
  083d:03b1  ff7618           push word ptr [bp + 0x18]                
  083d:03b4  ff7616           push word ptr [bp + 0x16]                
  083d:03b7  66ff7612         push dword ptr [bp + 0x12]               
  083d:03bb  ff7610           push word ptr [bp + 0x10]                
  083d:03be  ff760e           push word ptr [bp + 0xe]                 
  083d:03c1  8bc6             mov ax, si                               
  083d:03c3  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:03c7  50               push ax                                  
  083d:03c8  57               push di                                  
  083d:03c9  c45e06           les bx, ptr [bp + 6]                     
  083d:03cc  6626ff7737       push dword ptr es:[bx + 0x37]            
  083d:03d1  ff1ef615         lcall [0x15f6]                           
  083d:03d5  83c414           add sp, 0x14                             
  083d:03d8  b80100           mov ax, 1                                
  083d:03db  eb54             jmp 0x431                                
  083d:03dd  eb4e             jmp 0x42d                                
  083d:03df  c45e06           les bx, ptr [bp + 6]                     
  083d:03e2  8bc6             mov ax, si                               
  083d:03e4  034610           add ax, word ptr [bp + 0x10]             
  083d:03e7  26394706         cmp word ptr es:[bx + 6], ax             
  083d:03eb  7d40             jge 0x42d                                
  083d:03ed  ff7618           push word ptr [bp + 0x18]                
  083d:03f0  ff7616           push word ptr [bp + 0x16]                
  083d:03f3  66ff7612         push dword ptr [bp + 0x12]               
  083d:03f7  268b4706         mov ax, word ptr es:[bx + 6]             
  083d:03fb  2bc6             sub ax, si                               
  083d:03fd  8946fe           mov word ptr [bp - 2], ax                
  083d:0400  50               push ax                                  
  083d:0401  ff760e           push word ptr [bp + 0xe]                 
  083d:0404  56               push si                                  
  083d:0405  57               push di                                  
  083d:0406  ff7608           push word ptr [bp + 8]                   
  083d:0409  53               push bx                                  
  083d:040a  ff1ef615         lcall [0x15f6]                           
  083d:040e  83c414           add sp, 0x14                             
  083d:0411  8b4618           mov ax, word ptr [bp + 0x18]             
  083d:0414  0346fe           add ax, word ptr [bp - 2]                
  083d:0417  50               push ax                                  
  083d:0418  ff7616           push word ptr [bp + 0x16]                
  083d:041b  66ff7612         push dword ptr [bp + 0x12]               
  083d:041f  8b4610           mov ax, word ptr [bp + 0x10]             
  083d:0422  2b46fe           sub ax, word ptr [bp - 2]                
  083d:0425  50               push ax                                  
  083d:0426  ff760e           push word ptr [bp + 0xe]                 
  083d:0429  6a00             push 0                                   
  083d:042b  eb9b             jmp 0x3c8                                
  083d:042d  33c0             xor ax, ax                               
  083d:042f  ebaa             jmp 0x3db                                
  083d:0431  5f               pop di                                   
  083d:0432  5e               pop si                                   
  083d:0433  c9               leave                                    
  083d:0434  cb               retf                                     

proc_083d_0435:
  083d:0435  55               push bp                                  
  083d:0436  8bec             mov bp, sp                               
  083d:0438  83ec02           sub sp, 2                                
  083d:043b  56               push si                                  
  083d:043c  57               push di                                  
  083d:043d  8b7e0a           mov di, word ptr [bp + 0xa]              
  083d:0440  8b7618           mov si, word ptr [bp + 0x18]             
  083d:0443  c45e12           les bx, ptr [bp + 0x12]                  
  083d:0446  26397706         cmp word ptr es:[bx + 6], si             
  083d:044a  7f2b             jg 0x477                                 
  083d:044c  8bc6             mov ax, si                               
  083d:044e  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:0452  50               push ax                                  
  083d:0453  ff7616           push word ptr [bp + 0x16]                
  083d:0456  6626ff7737       push dword ptr es:[bx + 0x37]            
  083d:045b  ff7610           push word ptr [bp + 0x10]                
  083d:045e  ff760e           push word ptr [bp + 0xe]                 
  083d:0461  ff760c           push word ptr [bp + 0xc]                 
  083d:0464  57               push di                                  
  083d:0465  66ff7606         push dword ptr [bp + 6]                  
  083d:0469  ff1ef615         lcall [0x15f6]                           
  083d:046d  83c414           add sp, 0x14                             
  083d:0470  b80100           mov ax, 1                                
  083d:0473  eb54             jmp 0x4c9                                
  083d:0475  eb4e             jmp 0x4c5                                
  083d:0477  c45e12           les bx, ptr [bp + 0x12]                  
  083d:047a  8bc6             mov ax, si                               
  083d:047c  034610           add ax, word ptr [bp + 0x10]             
  083d:047f  26394706         cmp word ptr es:[bx + 6], ax             
  083d:0483  7d40             jge 0x4c5                                
  083d:0485  56               push si                                  
  083d:0486  ff7616           push word ptr [bp + 0x16]                
  083d:0489  ff7614           push word ptr [bp + 0x14]                
  083d:048c  53               push bx                                  
  083d:048d  268b4706         mov ax, word ptr es:[bx + 6]             
  083d:0491  2bc6             sub ax, si                               
  083d:0493  8946fe           mov word ptr [bp - 2], ax                
  083d:0496  50               push ax                                  
  083d:0497  ff760e           push word ptr [bp + 0xe]                 
  083d:049a  ff760c           push word ptr [bp + 0xc]                 
  083d:049d  57               push di                                  
  083d:049e  66ff7606         push dword ptr [bp + 6]                  
  083d:04a2  ff1ef615         lcall [0x15f6]                           
  083d:04a6  83c414           add sp, 0x14                             
  083d:04a9  6a00             push 0                                   
  083d:04ab  ff7616           push word ptr [bp + 0x16]                
  083d:04ae  c45e12           les bx, ptr [bp + 0x12]                  
  083d:04b1  6626ff7737       push dword ptr es:[bx + 0x37]            
  083d:04b6  8b4610           mov ax, word ptr [bp + 0x10]             
  083d:04b9  2b46fe           sub ax, word ptr [bp - 2]                
  083d:04bc  50               push ax                                  
  083d:04bd  ff760e           push word ptr [bp + 0xe]                 
  083d:04c0  ff76fe           push word ptr [bp - 2]                   
  083d:04c3  eb9f             jmp 0x464                                
  083d:04c5  33c0             xor ax, ax                               
  083d:04c7  ebaa             jmp 0x473                                
  083d:04c9  5f               pop di                                   
  083d:04ca  5e               pop si                                   
  083d:04cb  c9               leave                                    
  083d:04cc  cb               retf                                     

proc_083d_04cd:
  083d:04cd  55               push bp                                  
  083d:04ce  8bec             mov bp, sp                               
  083d:04d0  83ec20           sub sp, 0x20                             
  083d:04d3  56               push si                                  
  083d:04d4  57               push di                                  
  083d:04d5  668b4606         mov eax, dword ptr [bp + 6]              
  083d:04d9  668946e0         mov dword ptr [bp - 0x20], eax           
  083d:04dd  6a08             push 8                                   
  083d:04df  66ff760a         push dword ptr [bp + 0xa]                
  083d:04e3  16               push ss                                  
  083d:04e4  8d46f8           lea ax, [bp - 8]                         
  083d:04e7  50               push ax                                  
  083d:04e8  9ae43f0000       lcall 0, 0x3fe4                          -> 0000:3fe4 [reloc]
  083d:04ed  83c40a           add sp, 0xa                              
  083d:04f0  c746ecff00       mov word ptr [bp - 0x14], 0xff           
  083d:04f5  8b46f8           mov ax, word ptr [bp - 8]                
  083d:04f8  2306c615         and ax, word ptr [0x15c6]                
  083d:04fc  8946f2           mov word ptr [bp - 0xe], ax              
  083d:04ff  837ef200         cmp word ptr [bp - 0xe], 0               
  083d:0503  7430             je 0x535                                 
  083d:0505  a1c615           mov ax, word ptr [0x15c6]                
  083d:0508  f7d0             not ax                                   
  083d:050a  2146f8           and word ptr [bp - 8], ax                
  083d:050d  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:0510  0146fc           add word ptr [bp - 4], ax                
  083d:0513  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0518  7407             je 0x521                                 
  083d:051a  8cda             mov dx, ds                               
  083d:051c  b80d08           mov ax, 0x80d                            
  083d:051f  eb05             jmp 0x526                                
  083d:0521  8cda             mov dx, ds                               
  083d:0523  b81d08           mov ax, 0x81d                            
  083d:0526  0346f2           add ax, word ptr [bp - 0xe]              
  083d:0529  8bd8             mov bx, ax                               
  083d:052b  8ec2             mov es, dx                               
  083d:052d  268a07           mov al, byte ptr es:[bx]                 
  083d:0530  b400             mov ah, 0                                
  083d:0532  8946ec           mov word ptr [bp - 0x14], ax             
  083d:0535  8b46fc           mov ax, word ptr [bp - 4]                
  083d:0538  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:053c  d3f8             sar ax, cl                               
  083d:053e  48               dec ax                                   
  083d:053f  8946ee           mov word ptr [bp - 0x12], ax             
  083d:0542  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0547  7407             je 0x550                                 
  083d:0549  8cda             mov dx, ds                               
  083d:054b  b81508           mov ax, 0x815                            
  083d:054e  eb05             jmp 0x555                                
  083d:0550  8cda             mov dx, ds                               
  083d:0552  b82108           mov ax, 0x821                            
  083d:0555  8b5efc           mov bx, word ptr [bp - 4]                
  083d:0558  035ef8           add bx, word ptr [bp - 8]                
  083d:055b  231ec615         and bx, word ptr [0x15c6]                
  083d:055f  03c3             add ax, bx                               
  083d:0561  8bd8             mov bx, ax                               
  083d:0563  8ec2             mov es, dx                               
  083d:0565  268a07           mov al, byte ptr es:[bx]                 
  083d:0568  b400             mov ah, 0                                
  083d:056a  8946ea           mov word ptr [bp - 0x16], ax             
  083d:056d  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0572  7503             jne 0x577                                
  083d:0574  e99001           jmp 0x707                                
  083d:0577  c746e40100       mov word ptr [bp - 0x1c], 1              
  083d:057c  c746f20000       mov word ptr [bp - 0xe], 0               
  083d:0581  e96f01           jmp 0x6f3                                
  083d:0584  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:0587  c1e002           shl ax, 2                                
  083d:058a  c45ee0           les bx, ptr [bp - 0x20]                  
  083d:058d  03d8             add bx, ax                               
  083d:058f  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:0593  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0597  7433             je 0x5cc                                 
  083d:0599  8b5ee0           mov bx, word ptr [bp - 0x20]             
  083d:059c  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:05a2  7528             jne 0x5cc                                
  083d:05a4  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:05a7  c1e002           shl ax, 2                                
  083d:05aa  03d8             add bx, ax                               
  083d:05ac  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:05b1  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  083d:05b6  83c404           add sp, 4                                
  083d:05b9  8b5ef2           mov bx, word ptr [bp - 0xe]              
  083d:05bc  c1e302           shl bx, 2                                
  083d:05bf  c476e0           les si, ptr [bp - 0x20]                  
  083d:05c2  03f3             add si, bx                               
  083d:05c4  2689541c         mov word ptr es:[si + 0x1c], dx          
  083d:05c8  2689441a         mov word ptr es:[si + 0x1a], ax          
  083d:05cc  ff76f2           push word ptr [bp - 0xe]                 
  083d:05cf  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  083d:05d4  59               pop cx                                   
  083d:05d5  8b46e4           mov ax, word ptr [bp - 0x1c]             
  083d:05d8  85460e           test word ptr [bp + 0xe], ax             
  083d:05db  7405             je 0x5e2                                 
  083d:05dd  b8ff00           mov ax, 0xff                             
  083d:05e0  eb02             jmp 0x5e4                                
  083d:05e2  33c0             xor ax, ax                               
  083d:05e4  8946e8           mov word ptr [bp - 0x18], ax             
  083d:05e7  8b7efa           mov di, word ptr [bp - 6]                
  083d:05ea  e9be00           jmp 0x6ab                                
  083d:05ed  c45e06           les bx, ptr [bp + 6]                     
  083d:05f0  26f747350100     test word ptr es:[bx + 0x35], 1          
  083d:05f6  7442             je 0x63a                                 
  083d:05f8  26397f06         cmp word ptr es:[bx + 6], di             
  083d:05fc  7f3c             jg 0x63a                                 
  083d:05fe  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:0602  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:0605  c1e002           shl ax, 2                                
  083d:0608  03d8             add bx, ax                               
  083d:060a  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:060e  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:0612  c45e06           les bx, ptr [bp + 6]                     
  083d:0615  52               push dx                                  
  083d:0616  50               push ax                                  
  083d:0617  8bc7             mov ax, di                               
  083d:0619  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:061d  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:0621  26f76f08         imul word ptr es:[bx + 8]                
  083d:0625  d1e0             shl ax, 1                                
  083d:0627  8bd0             mov dx, ax                               
  083d:0629  58               pop ax                                   
  083d:062a  03c2             add ax, dx                               
  083d:062c  8b56f8           mov dx, word ptr [bp - 8]                
  083d:062f  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0633  d3fa             sar dx, cl                               
  083d:0635  03c2             add ax, dx                               
  083d:0637  5a               pop dx                                   
  083d:0638  eb31             jmp 0x66b                                
  083d:063a  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:063d  c1e002           shl ax, 2                                
  083d:0640  c45e06           les bx, ptr [bp + 6]                     
  083d:0643  03d8             add bx, ax                               
  083d:0645  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:0649  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:064d  8b5e06           mov bx, word ptr [bp + 6]                
  083d:0650  52               push dx                                  
  083d:0651  50               push ax                                  
  083d:0652  8bc7             mov ax, di                               
  083d:0654  26f76f08         imul word ptr es:[bx + 8]                
  083d:0658  d1e0             shl ax, 1                                
  083d:065a  8bd0             mov dx, ax                               
  083d:065c  58               pop ax                                   
  083d:065d  03c2             add ax, dx                               
  083d:065f  8b56f8           mov dx, word ptr [bp - 8]                
  083d:0662  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0666  d3fa             sar dx, cl                               
  083d:0668  03c2             add ax, dx                               
  083d:066a  5a               pop dx                                   
  083d:066b  8956f6           mov word ptr [bp - 0xa], dx              
  083d:066e  8946f4           mov word ptr [bp - 0xc], ax              
  083d:0671  8a46e8           mov al, byte ptr [bp - 0x18]             
  083d:0674  2246ec           and al, byte ptr [bp - 0x14]             
  083d:0677  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:067a  263007           xor byte ptr es:[bx], al                 
  083d:067d  ff46f4           inc word ptr [bp - 0xc]                  
  083d:0680  8b46ee           mov ax, word ptr [bp - 0x12]             
  083d:0683  8946f0           mov word ptr [bp - 0x10], ax             
  083d:0686  eb0c             jmp 0x694                                
  083d:0688  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:068b  8a46e8           mov al, byte ptr [bp - 0x18]             
  083d:068e  263007           xor byte ptr es:[bx], al                 
  083d:0691  ff46f4           inc word ptr [bp - 0xc]                  
  083d:0694  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:0697  ff4ef0           dec word ptr [bp - 0x10]                 
  083d:069a  0bc0             or ax, ax                                
  083d:069c  75ea             jne 0x688                                
  083d:069e  8a46e8           mov al, byte ptr [bp - 0x18]             
  083d:06a1  2246ea           and al, byte ptr [bp - 0x16]             
  083d:06a4  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:06a7  263007           xor byte ptr es:[bx], al                 
  083d:06aa  47               inc di                                   
  083d:06ab  8b46fa           mov ax, word ptr [bp - 6]                
  083d:06ae  0346fe           add ax, word ptr [bp - 2]                
  083d:06b1  3bc7             cmp ax, di                               
  083d:06b3  7e03             jle 0x6b8                                
  083d:06b5  e935ff           jmp 0x5ed                                
  083d:06b8  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:06bb  c1e002           shl ax, 2                                
  083d:06be  c45ee0           les bx, ptr [bp - 0x20]                  
  083d:06c1  03d8             add bx, ax                               
  083d:06c3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:06c7  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:06cb  7420             je 0x6ed                                 
  083d:06cd  8b5ee0           mov bx, word ptr [bp - 0x20]             
  083d:06d0  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:06d6  7515             jne 0x6ed                                
  083d:06d8  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:06db  c1e002           shl ax, 2                                
  083d:06de  03d8             add bx, ax                               
  083d:06e0  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:06e5  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  083d:06ea  83c404           add sp, 4                                
  083d:06ed  ff46f2           inc word ptr [bp - 0xe]                  
  083d:06f0  d166e4           shl word ptr [bp - 0x1c], 1              
  083d:06f3  c45e06           les bx, ptr [bp + 6]                     
  083d:06f6  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:06fa  b400             mov ah, 0                                
  083d:06fc  3b46f2           cmp ax, word ptr [bp - 0xe]              
  083d:06ff  7e03             jle 0x704                                
  083d:0701  e980fe           jmp 0x584                                
  083d:0704  e93f01           jmp 0x846                                
  083d:0707  ff760e           push word ptr [bp + 0xe]                 
  083d:070a  0e               push cs                                  
  083d:070b  e836fc           call 0x344                               -> 083d:0344
  083d:070e  59               pop cx                                   
  083d:070f  b400             mov ah, 0                                
  083d:0711  8946e6           mov word ptr [bp - 0x1a], ax             
  083d:0714  8cd8             mov ax, ds                               
  083d:0716  394608           cmp word ptr [bp + 8], ax                
  083d:0719  7578             jne 0x793                                
  083d:071b  817e064c07       cmp word ptr [bp + 6], 0x74c             
  083d:0720  7571             jne 0x793                                
  083d:0722  8b7efa           mov di, word ptr [bp - 6]                
  083d:0725  eb5f             jmp 0x786                                
  083d:0727  c41e0908         les bx, ptr [0x809]                      
  083d:072b  268b4718         mov ax, word ptr es:[bx + 0x18]          
  083d:072f  268b5716         mov dx, word ptr es:[bx + 0x16]          
  083d:0733  8bdf             mov bx, di                               
  083d:0735  d1e3             shl bx, 1                                
  083d:0737  0397fa15         add dx, word ptr [bx + 0x15fa]           
  083d:073b  8b5ef8           mov bx, word ptr [bp - 8]                
  083d:073e  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0742  d3fb             sar bx, cl                               
  083d:0744  03d3             add dx, bx                               
  083d:0746  8946f6           mov word ptr [bp - 0xa], ax              
  083d:0749  8956f4           mov word ptr [bp - 0xc], dx              
  083d:074c  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:074f  2246ec           and al, byte ptr [bp - 0x14]             
  083d:0752  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0755  263007           xor byte ptr es:[bx], al                 
  083d:0758  ff46f4           inc word ptr [bp - 0xc]                  
  083d:075b  8b46ee           mov ax, word ptr [bp - 0x12]             
  083d:075e  8946f0           mov word ptr [bp - 0x10], ax             
  083d:0761  eb0c             jmp 0x76f                                
  083d:0763  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0766  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:0769  263007           xor byte ptr es:[bx], al                 
  083d:076c  ff46f4           inc word ptr [bp - 0xc]                  
  083d:076f  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:0772  ff4ef0           dec word ptr [bp - 0x10]                 
  083d:0775  0bc0             or ax, ax                                
  083d:0777  75ea             jne 0x763                                
  083d:0779  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:077c  2246ea           and al, byte ptr [bp - 0x16]             
  083d:077f  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0782  263007           xor byte ptr es:[bx], al                 
  083d:0785  47               inc di                                   
  083d:0786  8b46fa           mov ax, word ptr [bp - 6]                
  083d:0789  0346fe           add ax, word ptr [bp - 2]                
  083d:078c  3bc7             cmp ax, di                               
  083d:078e  7f97             jg 0x727                                 
  083d:0790  e9b300           jmp 0x846                                
  083d:0793  8b7efa           mov di, word ptr [bp - 6]                
  083d:0796  e9a000           jmp 0x839                                
  083d:0799  c45e06           les bx, ptr [bp + 6]                     
  083d:079c  26f747350100     test word ptr es:[bx + 0x35], 1          
  083d:07a2  742f             je 0x7d3                                 
  083d:07a4  26397f06         cmp word ptr es:[bx + 6], di             
  083d:07a8  7f29             jg 0x7d3                                 
  083d:07aa  8bc7             mov ax, di                               
  083d:07ac  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:07b0  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:07b4  26f76f08         imul word ptr es:[bx + 8]                
  083d:07b8  d1e0             shl ax, 1                                
  083d:07ba  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:07be  50               push ax                                  
  083d:07bf  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:07c3  5b               pop bx                                   
  083d:07c4  03c3             add ax, bx                               
  083d:07c6  8b5ef8           mov bx, word ptr [bp - 8]                
  083d:07c9  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:07cd  d3fb             sar bx, cl                               
  083d:07cf  03c3             add ax, bx                               
  083d:07d1  eb26             jmp 0x7f9                                
  083d:07d3  c45e06           les bx, ptr [bp + 6]                     
  083d:07d6  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:07da  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:07de  52               push dx                                  
  083d:07df  50               push ax                                  
  083d:07e0  8bc7             mov ax, di                               
  083d:07e2  26f76f08         imul word ptr es:[bx + 8]                
  083d:07e6  d1e0             shl ax, 1                                
  083d:07e8  8bd0             mov dx, ax                               
  083d:07ea  58               pop ax                                   
  083d:07eb  03c2             add ax, dx                               
  083d:07ed  8b56f8           mov dx, word ptr [bp - 8]                
  083d:07f0  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:07f4  d3fa             sar dx, cl                               
  083d:07f6  03c2             add ax, dx                               
  083d:07f8  5a               pop dx                                   
  083d:07f9  8956f6           mov word ptr [bp - 0xa], dx              
  083d:07fc  8946f4           mov word ptr [bp - 0xc], ax              
  083d:07ff  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:0802  2246ec           and al, byte ptr [bp - 0x14]             
  083d:0805  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0808  263007           xor byte ptr es:[bx], al                 
  083d:080b  ff46f4           inc word ptr [bp - 0xc]                  
  083d:080e  8b46ee           mov ax, word ptr [bp - 0x12]             
  083d:0811  8946f0           mov word ptr [bp - 0x10], ax             
  083d:0814  eb0c             jmp 0x822                                
  083d:0816  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0819  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:081c  263007           xor byte ptr es:[bx], al                 
  083d:081f  ff46f4           inc word ptr [bp - 0xc]                  
  083d:0822  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:0825  ff4ef0           dec word ptr [bp - 0x10]                 
  083d:0828  0bc0             or ax, ax                                
  083d:082a  75ea             jne 0x816                                
  083d:082c  8a46e6           mov al, byte ptr [bp - 0x1a]             
  083d:082f  2246ea           and al, byte ptr [bp - 0x16]             
  083d:0832  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0835  263007           xor byte ptr es:[bx], al                 
  083d:0838  47               inc di                                   
  083d:0839  8b46fa           mov ax, word ptr [bp - 6]                
  083d:083c  0346fe           add ax, word ptr [bp - 2]                
  083d:083f  3bc7             cmp ax, di                               
  083d:0841  7e03             jle 0x846                                
  083d:0843  e953ff           jmp 0x799                                
  083d:0846  5f               pop di                                   
  083d:0847  5e               pop si                                   
  083d:0848  c9               leave                                    
  083d:0849  cb               retf                                     

proc_083d_084a:
  083d:084a  55               push bp                                  
  083d:084b  8bec             mov bp, sp                               
  083d:084d  83ec10           sub sp, 0x10                             
  083d:0850  56               push si                                  
  083d:0851  57               push di                                  
  083d:0852  ff760a           push word ptr [bp + 0xa]                 
  083d:0855  0e               push cs                                  
  083d:0856  e8fdfa           call 0x356                               -> 083d:0356
  083d:0859  59               pop cx                                   
  083d:085a  8946f8           mov word ptr [bp - 8], ax                
  083d:085d  668b4606         mov eax, dword ptr [bp + 6]              
  083d:0861  668946f0         mov dword ptr [bp - 0x10], eax           
  083d:0865  c41e0908         les bx, ptr [0x809]                      
  083d:0869  26833f04         cmp word ptr es:[bx], 4                  
  083d:086d  7415             je 0x884                                 
  083d:086f  26833f00         cmp word ptr es:[bx], 0                  
  083d:0873  740f             je 0x884                                 
  083d:0875  26833f01         cmp word ptr es:[bx], 1                  
  083d:0879  7409             je 0x884                                 
  083d:087b  26833f02         cmp word ptr es:[bx], 2                  
  083d:087f  7403             je 0x884                                 
  083d:0881  e9f000           jmp 0x974                                
  083d:0884  c746fc0100       mov word ptr [bp - 4], 1                 
  083d:0889  33ff             xor di, di                               
  083d:088b  e9d400           jmp 0x962                                
  083d:088e  8bc7             mov ax, di                               
  083d:0890  c1e002           shl ax, 2                                
  083d:0893  c45ef0           les bx, ptr [bp - 0x10]                  
  083d:0896  03d8             add bx, ax                               
  083d:0898  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:089c  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:08a0  7431             je 0x8d3                                 
  083d:08a2  8b5ef0           mov bx, word ptr [bp - 0x10]             
  083d:08a5  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:08ab  7526             jne 0x8d3                                
  083d:08ad  8bc7             mov ax, di                               
  083d:08af  c1e002           shl ax, 2                                
  083d:08b2  03d8             add bx, ax                               
  083d:08b4  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:08b9  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  083d:08be  83c404           add sp, 4                                
  083d:08c1  8bdf             mov bx, di                               
  083d:08c3  c1e302           shl bx, 2                                
  083d:08c6  c476f0           les si, ptr [bp - 0x10]                  
  083d:08c9  03f3             add si, bx                               
  083d:08cb  2689541c         mov word ptr es:[si + 0x1c], dx          
  083d:08cf  2689441a         mov word ptr es:[si + 0x1a], ax          
  083d:08d3  8bc7             mov ax, di                               
  083d:08d5  c1e002           shl ax, 2                                
  083d:08d8  c45e06           les bx, ptr [bp + 6]                     
  083d:08db  03d8             add bx, ax                               
  083d:08dd  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  083d:08e1  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  083d:08e5  8946f6           mov word ptr [bp - 0xa], ax              
  083d:08e8  8956f4           mov word ptr [bp - 0xc], dx              
  083d:08eb  57               push di                                  
  083d:08ec  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  083d:08f1  59               pop cx                                   
  083d:08f2  8b46fc           mov ax, word ptr [bp - 4]                
  083d:08f5  85460a           test word ptr [bp + 0xa], ax             
  083d:08f8  7405             je 0x8ff                                 
  083d:08fa  b8ffff           mov ax, 0xffff                           
  083d:08fd  eb02             jmp 0x901                                
  083d:08ff  33c0             xor ax, ax                               
  083d:0901  8946fa           mov word ptr [bp - 6], ax                
  083d:0904  c45e06           les bx, ptr [bp + 6]                     
  083d:0907  268b4708         mov ax, word ptr es:[bx + 8]             
  083d:090b  26f76f06         imul word ptr es:[bx + 6]                
  083d:090f  8946fe           mov word ptr [bp - 2], ax                
  083d:0912  eb0d             jmp 0x921                                
  083d:0914  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0917  8b46fa           mov ax, word ptr [bp - 6]                
  083d:091a  268907           mov word ptr es:[bx], ax                 
  083d:091d  8346f402         add word ptr [bp - 0xc], 2               
  083d:0921  8b46fe           mov ax, word ptr [bp - 2]                
  083d:0924  ff4efe           dec word ptr [bp - 2]                    
  083d:0927  0bc0             or ax, ax                                
  083d:0929  75e9             jne 0x914                                
  083d:092b  d166fc           shl word ptr [bp - 4], 1                 
  083d:092e  8bc7             mov ax, di                               
  083d:0930  c1e002           shl ax, 2                                
  083d:0933  c45ef0           les bx, ptr [bp - 0x10]                  
  083d:0936  03d8             add bx, ax                               
  083d:0938  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:093c  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0940  741f             je 0x961                                 
  083d:0942  8b5ef0           mov bx, word ptr [bp - 0x10]             
  083d:0945  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:094b  7514             jne 0x961                                
  083d:094d  8bc7             mov ax, di                               
  083d:094f  c1e002           shl ax, 2                                
  083d:0952  03d8             add bx, ax                               
  083d:0954  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:0959  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  083d:095e  83c404           add sp, 4                                
  083d:0961  47               inc di                                   
  083d:0962  c45e06           les bx, ptr [bp + 6]                     
  083d:0965  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:0969  b400             mov ah, 0                                
  083d:096b  3bc7             cmp ax, di                               
  083d:096d  7603             jbe 0x972                                
  083d:096f  e91cff           jmp 0x88e                                
  083d:0972  eb7b             jmp 0x9ef                                
  083d:0974  c45ef0           les bx, ptr [bp - 0x10]                  
  083d:0977  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  083d:097d  7420             je 0x99f                                 
  083d:097f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:0985  7518             jne 0x99f                                
  083d:0987  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:098c  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  083d:0991  83c404           add sp, 4                                
  083d:0994  c45ef0           les bx, ptr [bp - 0x10]                  
  083d:0997  2689571c         mov word ptr es:[bx + 0x1c], dx          
  083d:099b  2689471a         mov word ptr es:[bx + 0x1a], ax          
  083d:099f  c45e06           les bx, ptr [bp + 6]                     
  083d:09a2  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  083d:09a7  668946f4         mov dword ptr [bp - 0xc], eax            
  083d:09ab  268b4708         mov ax, word ptr es:[bx + 8]             
  083d:09af  26f76f06         imul word ptr es:[bx + 6]                
  083d:09b3  8946fe           mov word ptr [bp - 2], ax                
  083d:09b6  eb0d             jmp 0x9c5                                
  083d:09b8  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:09bb  8b46f8           mov ax, word ptr [bp - 8]                
  083d:09be  268907           mov word ptr es:[bx], ax                 
  083d:09c1  8346f402         add word ptr [bp - 0xc], 2               
  083d:09c5  8b46fe           mov ax, word ptr [bp - 2]                
  083d:09c8  ff4efe           dec word ptr [bp - 2]                    
  083d:09cb  0bc0             or ax, ax                                
  083d:09cd  75e9             jne 0x9b8                                
  083d:09cf  c45ef0           les bx, ptr [bp - 0x10]                  
  083d:09d2  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  083d:09d8  7415             je 0x9ef                                 
  083d:09da  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:09e0  750d             jne 0x9ef                                
  083d:09e2  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:09e7  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  083d:09ec  83c404           add sp, 4                                
  083d:09ef  5f               pop di                                   
  083d:09f0  5e               pop si                                   
  083d:09f1  c9               leave                                    
  083d:09f2  cb               retf                                     

proc_083d_09f3:
  083d:09f3  55               push bp                                  
  083d:09f4  8bec             mov bp, sp                               
  083d:09f6  56               push si                                  
  083d:09f7  c45e06           les bx, ptr [bp + 6]                     
  083d:09fa  26f747350200     test word ptr es:[bx + 0x35], 2          
  083d:0a00  7412             je 0xa14                                 
  083d:0a02  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  083d:0a07  66c1e804         shr eax, 4                               
  083d:0a0b  50               push ax                                  
  083d:0a0c  9a6601f706       lcall 0x6f7, 0x166                       -> 06f7:0166 [reloc]
  083d:0a11  59               pop cx                                   
  083d:0a12  eb29             jmp 0xa3d                                
  083d:0a14  33f6             xor si, si                               
  083d:0a16  eb18             jmp 0xa30                                
  083d:0a18  8bc6             mov ax, si                               
  083d:0a1a  c1e002           shl ax, 2                                
  083d:0a1d  c45e06           les bx, ptr [bp + 6]                     
  083d:0a20  03d8             add bx, ax                               
  083d:0a22  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:0a27  9a8804870c       lcall 0xc87, 0x488                       -> 0c87:0488 [reloc]
  083d:0a2c  83c404           add sp, 4                                
  083d:0a2f  46               inc si                                   
  083d:0a30  c45e06           les bx, ptr [bp + 6]                     
  083d:0a33  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:0a37  b400             mov ah, 0                                
  083d:0a39  3bc6             cmp ax, si                               
  083d:0a3b  7fdb             jg 0xa18                                 
  083d:0a3d  c45e06           les bx, ptr [bp + 6]                     
  083d:0a40  26c6473400       mov byte ptr es:[bx + 0x34], 0           
  083d:0a45  b80100           mov ax, 1                                
  083d:0a48  eb00             jmp 0xa4a                                
  083d:0a4a  5e               pop si                                   
  083d:0a4b  5d               pop bp                                   
  083d:0a4c  cb               retf                                     

proc_083d_0a4d:
  083d:0a4d  55               push bp                                  
  083d:0a4e  8bec             mov bp, sp                               
  083d:0a50  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0a55  7408             je 0xa5f                                 
  083d:0a57  c45e06           les bx, ptr [bp + 6]                     
  083d:0a5a  26834f3504       or word ptr es:[bx + 0x35], 4            
  083d:0a5f  5d               pop bp                                   
  083d:0a60  cb               retf                                     

proc_083d_0a61:
  083d:0a61  55               push bp                                  
  083d:0a62  8bec             mov bp, sp                               
  083d:0a64  c45e06           les bx, ptr [bp + 6]                     
  083d:0a67  26836735f7       and word ptr es:[bx + 0x35], 0xfff7      
  083d:0a6c  837e0a00         cmp word ptr [bp + 0xa], 0               
  083d:0a70  7405             je 0xa77                                 
  083d:0a72  26834f3508       or word ptr es:[bx + 0x35], 8            
  083d:0a77  5d               pop bp                                   
  083d:0a78  cb               retf                                     

proc_083d_0a79:
  083d:0a79  55               push bp                                  
  083d:0a7a  8bec             mov bp, sp                               
  083d:0a7c  83ec08           sub sp, 8                                
  083d:0a7f  56               push si                                  
  083d:0a80  57               push di                                  
  083d:0a81  c45e06           les bx, ptr [bp + 6]                     
  083d:0a84  268b4708         mov ax, word ptr es:[bx + 8]             
  083d:0a88  3b460a           cmp ax, word ptr [bp + 0xa]              
  083d:0a8b  751d             jne 0xaaa                                
  083d:0a8d  268b4706         mov ax, word ptr es:[bx + 6]             
  083d:0a91  3b460c           cmp ax, word ptr [bp + 0xc]              
  083d:0a94  7514             jne 0xaaa                                
  083d:0a96  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:0a9a  b400             mov ah, 0                                
  083d:0a9c  3b460e           cmp ax, word ptr [bp + 0xe]              
  083d:0a9f  7509             jne 0xaaa                                
  083d:0aa1  b80100           mov ax, 1                                
  083d:0aa4  e98a01           jmp 0xc31                                
  083d:0aa7  e91601           jmp 0xbc0                                
  083d:0aaa  66c746f800000000 mov dword ptr [bp - 8], 0                
  083d:0ab2  c45e06           les bx, ptr [bp + 6]                     
  083d:0ab5  26836735fd       and word ptr es:[bx + 0x35], 0xfffd      
  083d:0aba  ff7608           push word ptr [bp + 8]                   
  083d:0abd  53               push bx                                  
  083d:0abe  0e               push cs                                  
  083d:0abf  e831ff           call 0x9f3                               -> 083d:09f3
  083d:0ac2  83c404           add sp, 4                                
  083d:0ac5  0bc0             or ax, ax                                
  083d:0ac7  7506             jne 0xacf                                
  083d:0ac9  e9e900           jmp 0xbb5                                
  083d:0acc  e9f100           jmp 0xbc0                                
  083d:0acf  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0ad4  7450             je 0xb26                                 
  083d:0ad6  c45e06           les bx, ptr [bp + 6]                     
  083d:0ad9  26f747350400     test word ptr es:[bx + 0x35], 4          
  083d:0adf  7445             je 0xb26                                 
  083d:0ae1  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0ae4  f76e0c           imul word ptr [bp + 0xc]                 
  083d:0ae7  50               push ax                                  
  083d:0ae8  9a5c00f706       lcall 0x6f7, 0x5c                        -> 06f7:005c [reloc]
  083d:0aed  59               pop cx                                   
  083d:0aee  660fb7c0         movzx eax, ax                            
  083d:0af2  668946f8         mov dword ptr [bp - 8], eax              
  083d:0af6  66837ef800       cmp dword ptr [bp - 8], 0                
  083d:0afb  7429             je 0xb26                                 
  083d:0afd  c45e06           les bx, ptr [bp + 6]                     
  083d:0b00  26834f3502       or word ptr es:[bx + 0x35], 2            
  083d:0b05  33ff             xor di, di                               
  083d:0b07  eb18             jmp 0xb21                                
  083d:0b09  668b46f8         mov eax, dword ptr [bp - 8]              
  083d:0b0d  66c1e010         shl eax, 0x10                            
  083d:0b11  8bd7             mov dx, di                               
  083d:0b13  c1e202           shl dx, 2                                
  083d:0b16  c45e06           les bx, ptr [bp + 6]                     
  083d:0b19  03da             add bx, dx                               
  083d:0b1b  662689471a       mov dword ptr es:[bx + 0x1a], eax        
  083d:0b20  47               inc di                                   
  083d:0b21  3b7e0e           cmp di, word ptr [bp + 0xe]              
  083d:0b24  7ce3             jl 0xb09                                 
  083d:0b26  66837ef800       cmp dword ptr [bp - 8], 0                
  083d:0b2b  7403             je 0xb30                                 
  083d:0b2d  e99000           jmp 0xbc0                                
  083d:0b30  33ff             xor di, di                               
  083d:0b32  eb52             jmp 0xb86                                
  083d:0b34  660fbf460a       movsx eax, word ptr [bp + 0xa]           
  083d:0b39  660fbf560c       movsx edx, word ptr [bp + 0xc]           
  083d:0b3e  660fafc2         imul eax, edx                            
  083d:0b42  66d1e0           shl eax, 1                               
  083d:0b45  668946fc         mov dword ptr [bp - 4], eax              
  083d:0b49  8bc7             mov ax, di                               
  083d:0b4b  056400           add ax, 0x64                             
  083d:0b4e  660fbfc0         movsx eax, ax                            
  083d:0b52  6650             push eax                                 
  083d:0b54  6a00             push 0                                   
  083d:0b56  66ff76fc         push dword ptr [bp - 4]                  
  083d:0b5a  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  083d:0b5f  83c40a           add sp, 0xa                              
  083d:0b62  8bdf             mov bx, di                               
  083d:0b64  c1e302           shl bx, 2                                
  083d:0b67  c47606           les si, ptr [bp + 6]                     
  083d:0b6a  03f3             add si, bx                               
  083d:0b6c  2689540c         mov word ptr es:[si + 0xc], dx           
  083d:0b70  2689440a         mov word ptr es:[si + 0xa], ax           
  083d:0b74  0bc2             or ax, dx                                
  083d:0b76  750d             jne 0xb85                                
  083d:0b78  66ff7606         push dword ptr [bp + 6]                  
  083d:0b7c  0e               push cs                                  
  083d:0b7d  e873fe           call 0x9f3                               -> 083d:09f3
  083d:0b80  83c404           add sp, 4                                
  083d:0b83  eb30             jmp 0xbb5                                
  083d:0b85  47               inc di                                   
  083d:0b86  3b7e0e           cmp di, word ptr [bp + 0xe]              
  083d:0b89  7ca9             jl 0xb34                                 
  083d:0b8b  33ff             xor di, di                               
  083d:0b8d  eb2c             jmp 0xbbb                                
  083d:0b8f  8bc7             mov ax, di                               
  083d:0b91  c1e002           shl ax, 2                                
  083d:0b94  c45e06           les bx, ptr [bp + 6]                     
  083d:0b97  03d8             add bx, ax                               
  083d:0b99  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:0b9d  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0ba1  7517             jne 0xbba                                
  083d:0ba3  57               push di                                  
  083d:0ba4  1e               push ds                                  
  083d:0ba5  683108           push 0x831                                ; "Plane handle %d not allocated"
  083d:0ba8  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  083d:0bad  83c406           add sp, 6                                
  083d:0bb0  9af5340000       lcall 0, 0x34f5                          -> 0000:34f5 [reloc]
  083d:0bb5  33c0             xor ax, ax                               
  083d:0bb7  e9eafe           jmp 0xaa4                                
  083d:0bba  47               inc di                                   
  083d:0bbb  3b7e0e           cmp di, word ptr [bp + 0xe]              
  083d:0bbe  7ccf             jl 0xb8f                                 
  083d:0bc0  c45e06           les bx, ptr [bp + 6]                     
  083d:0bc3  8a460e           mov al, byte ptr [bp + 0xe]              
  083d:0bc6  26884734         mov byte ptr es:[bx + 0x34], al          
  083d:0bca  6626c7472a00000000 mov dword ptr es:[bx + 0x2a], 0          
  083d:0bd3  c41e0908         les bx, ptr [0x809]                      
  083d:0bd7  268b470e         mov ax, word ptr es:[bx + 0xe]           
  083d:0bdb  3b460e           cmp ax, word ptr [bp + 0xe]              
  083d:0bde  7406             je 0xbe6                                 
  083d:0be0  837e0e01         cmp word ptr [bp + 0xe], 1               
  083d:0be4  751c             jne 0xc02                                
  083d:0be6  ff760c           push word ptr [bp + 0xc]                 
  083d:0be9  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0bec  8a0ec215         mov cl, byte ptr [0x15c2]                
  083d:0bf0  d3e0             shl ax, cl                               
  083d:0bf2  50               push ax                                  
  083d:0bf3  666a00           push 0                                   
  083d:0bf6  66ff7606         push dword ptr [bp + 6]                  
  083d:0bfa  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  083d:0bff  83c40c           add sp, 0xc                              
  083d:0c02  c45e06           les bx, ptr [bp + 6]                     
  083d:0c05  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0c08  26894708         mov word ptr es:[bx + 8], ax             
  083d:0c0c  6626c7472e00000000 mov dword ptr es:[bx + 0x2e], 0          
  083d:0c15  26c6473200       mov byte ptr es:[bx + 0x32], 0           
  083d:0c1a  26c6473300       mov byte ptr es:[bx + 0x33], 0           
  083d:0c1f  26c747350000     mov word ptr es:[bx + 0x35], 0           
  083d:0c25  6626c7473700000000 mov dword ptr es:[bx + 0x37], 0          
  083d:0c2e  e970fe           jmp 0xaa1                                
  083d:0c31  5f               pop di                                   
  083d:0c32  5e               pop si                                   
  083d:0c33  c9               leave                                    
  083d:0c34  cb               retf                                     

proc_083d_0c35:
  083d:0c35  55               push bp                                  
  083d:0c36  8bec             mov bp, sp                               
  083d:0c38  83ec18           sub sp, 0x18                             
  083d:0c3b  56               push si                                  
  083d:0c3c  57               push di                                  
  083d:0c3d  c746f60000       mov word ptr [bp - 0xa], 0               
  083d:0c42  668b4606         mov eax, dword ptr [bp + 6]              
  083d:0c46  668946e8         mov dword ptr [bp - 0x18], eax           
  083d:0c4a  c746f40000       mov word ptr [bp - 0xc], 0               
  083d:0c4f  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0c52  2306c615         and ax, word ptr [0x15c6]                
  083d:0c56  8bf8             mov di, ax                               
  083d:0c58  0bff             or di, di                                
  083d:0c5a  740e             je 0xc6a                                 
  083d:0c5c  a1c615           mov ax, word ptr [0x15c6]                
  083d:0c5f  f7d0             not ax                                   
  083d:0c61  21460a           and word ptr [bp + 0xa], ax              
  083d:0c64  017e0e           add word ptr [bp + 0xe], di              
  083d:0c67  897ef4           mov word ptr [bp - 0xc], di              
  083d:0c6a  8b460e           mov ax, word ptr [bp + 0xe]              
  083d:0c6d  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0c71  d3f8             sar ax, cl                               
  083d:0c73  48               dec ax                                   
  083d:0c74  7d04             jge 0xc7a                                
  083d:0c76  33c0             xor ax, ax                               
  083d:0c78  eb0a             jmp 0xc84                                
  083d:0c7a  8b460e           mov ax, word ptr [bp + 0xe]              
  083d:0c7d  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0c81  d3f8             sar ax, cl                               
  083d:0c83  48               dec ax                                   
  083d:0c84  8946f8           mov word ptr [bp - 8], ax                
  083d:0c87  8b460e           mov ax, word ptr [bp + 0xe]              
  083d:0c8a  03460a           add ax, word ptr [bp + 0xa]              
  083d:0c8d  2306c615         and ax, word ptr [0x15c6]                
  083d:0c91  8946f2           mov word ptr [bp - 0xe], ax              
  083d:0c94  c45e06           les bx, ptr [bp + 6]                     
  083d:0c97  26807f3401       cmp byte ptr es:[bx + 0x34], 1           
  083d:0c9c  7703             ja 0xca1                                 
  083d:0c9e  e9cf01           jmp 0xe70                                
  083d:0ca1  8b5ef4           mov bx, word ptr [bp - 0xc]              
  083d:0ca4  8a870d08         mov al, byte ptr [bx + 0x80d]            
  083d:0ca8  b400             mov ah, 0                                
  083d:0caa  8946f4           mov word ptr [bp - 0xc], ax              
  083d:0cad  8b5ef2           mov bx, word ptr [bp - 0xe]              
  083d:0cb0  8a871508         mov al, byte ptr [bx + 0x815]            
  083d:0cb4  b400             mov ah, 0                                
  083d:0cb6  8946f2           mov word ptr [bp - 0xe], ax              
  083d:0cb9  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0cbc  c1f803           sar ax, 3                                
  083d:0cbf  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:0cc2  03560e           add dx, word ptr [bp + 0xe]              
  083d:0cc5  c1fa03           sar dx, 3                                
  083d:0cc8  3bc2             cmp ax, dx                               
  083d:0cca  7511             jne 0xcdd                                
  083d:0ccc  837ef800         cmp word ptr [bp - 8], 0                 
  083d:0cd0  750b             jne 0xcdd                                
  083d:0cd2  8b46f2           mov ax, word ptr [bp - 0xe]              
  083d:0cd5  2146f4           and word ptr [bp - 0xc], ax              
  083d:0cd8  c746f60100       mov word ptr [bp - 0xa], 1               
  083d:0cdd  c746ee0100       mov word ptr [bp - 0x12], 1              
  083d:0ce2  33ff             xor di, di                               
  083d:0ce4  e97601           jmp 0xe5d                                
  083d:0ce7  8bc7             mov ax, di                               
  083d:0ce9  c1e002           shl ax, 2                                
  083d:0cec  c45ee8           les bx, ptr [bp - 0x18]                  
  083d:0cef  03d8             add bx, ax                               
  083d:0cf1  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:0cf5  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0cf9  7431             je 0xd2c                                 
  083d:0cfb  8b5ee8           mov bx, word ptr [bp - 0x18]             
  083d:0cfe  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:0d04  7526             jne 0xd2c                                
  083d:0d06  8bc7             mov ax, di                               
  083d:0d08  c1e002           shl ax, 2                                
  083d:0d0b  03d8             add bx, ax                               
  083d:0d0d  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:0d12  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  083d:0d17  83c404           add sp, 4                                
  083d:0d1a  8bdf             mov bx, di                               
  083d:0d1c  c1e302           shl bx, 2                                
  083d:0d1f  c476e8           les si, ptr [bp - 0x18]                  
  083d:0d22  03f3             add si, bx                               
  083d:0d24  2689541c         mov word ptr es:[si + 0x1c], dx          
  083d:0d28  2689441a         mov word ptr es:[si + 0x1a], ax          
  083d:0d2c  57               push di                                  
  083d:0d2d  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  083d:0d32  59               pop cx                                   
  083d:0d33  8b46ee           mov ax, word ptr [bp - 0x12]             
  083d:0d36  854610           test word ptr [bp + 0x10], ax            
  083d:0d39  7405             je 0xd40                                 
  083d:0d3b  b8ff00           mov ax, 0xff                             
  083d:0d3e  eb02             jmp 0xd42                                
  083d:0d40  33c0             xor ax, ax                               
  083d:0d42  8946f0           mov word ptr [bp - 0x10], ax             
  083d:0d45  c45e06           les bx, ptr [bp + 6]                     
  083d:0d48  26f747350100     test word ptr es:[bx + 0x35], 1          
  083d:0d4e  7445             je 0xd95                                 
  083d:0d50  268b4706         mov ax, word ptr es:[bx + 6]             
  083d:0d54  3b460c           cmp ax, word ptr [bp + 0xc]              
  083d:0d57  7f3c             jg 0xd95                                 
  083d:0d59  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:0d5d  8bc7             mov ax, di                               
  083d:0d5f  c1e002           shl ax, 2                                
  083d:0d62  03d8             add bx, ax                               
  083d:0d64  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:0d68  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:0d6c  c45e06           les bx, ptr [bp + 6]                     
  083d:0d6f  52               push dx                                  
  083d:0d70  50               push ax                                  
  083d:0d71  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:0d74  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:0d78  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:0d7c  26f76f08         imul word ptr es:[bx + 8]                
  083d:0d80  d1e0             shl ax, 1                                
  083d:0d82  8bd0             mov dx, ax                               
  083d:0d84  58               pop ax                                   
  083d:0d85  03c2             add ax, dx                               
  083d:0d87  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:0d8a  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0d8e  d3fa             sar dx, cl                               
  083d:0d90  03c2             add ax, dx                               
  083d:0d92  5a               pop dx                                   
  083d:0d93  eb31             jmp 0xdc6                                
  083d:0d95  8bc7             mov ax, di                               
  083d:0d97  c1e002           shl ax, 2                                
  083d:0d9a  c45e06           les bx, ptr [bp + 6]                     
  083d:0d9d  03d8             add bx, ax                               
  083d:0d9f  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:0da3  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:0da7  8b5e06           mov bx, word ptr [bp + 6]                
  083d:0daa  52               push dx                                  
  083d:0dab  50               push ax                                  
  083d:0dac  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:0daf  26f76f08         imul word ptr es:[bx + 8]                
  083d:0db3  d1e0             shl ax, 1                                
  083d:0db5  8bd0             mov dx, ax                               
  083d:0db7  58               pop ax                                   
  083d:0db8  03c2             add ax, dx                               
  083d:0dba  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:0dbd  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0dc1  d3fa             sar dx, cl                               
  083d:0dc3  03c2             add ax, dx                               
  083d:0dc5  5a               pop dx                                   
  083d:0dc6  8956fe           mov word ptr [bp - 2], dx                
  083d:0dc9  8946fc           mov word ptr [bp - 4], ax                
  083d:0dcc  c45efc           les bx, ptr [bp - 4]                     
  083d:0dcf  268a07           mov al, byte ptr es:[bx]                 
  083d:0dd2  8a56f4           mov dl, byte ptr [bp - 0xc]              
  083d:0dd5  f6d2             not dl                                   
  083d:0dd7  22c2             and al, dl                               
  083d:0dd9  8a56f0           mov dl, byte ptr [bp - 0x10]             
  083d:0ddc  2256f4           and dl, byte ptr [bp - 0xc]              
  083d:0ddf  0ac2             or al, dl                                
  083d:0de1  268807           mov byte ptr es:[bx], al                 
  083d:0de4  ff46fc           inc word ptr [bp - 4]                    
  083d:0de7  8b46f8           mov ax, word ptr [bp - 8]                
  083d:0dea  8946fa           mov word ptr [bp - 6], ax                
  083d:0ded  eb0c             jmp 0xdfb                                
  083d:0def  c45efc           les bx, ptr [bp - 4]                     
  083d:0df2  8a46f0           mov al, byte ptr [bp - 0x10]             
  083d:0df5  268807           mov byte ptr es:[bx], al                 
  083d:0df8  ff46fc           inc word ptr [bp - 4]                    
  083d:0dfb  8b46fa           mov ax, word ptr [bp - 6]                
  083d:0dfe  ff4efa           dec word ptr [bp - 6]                    
  083d:0e01  0bc0             or ax, ax                                
  083d:0e03  75ea             jne 0xdef                                
  083d:0e05  837ef600         cmp word ptr [bp - 0xa], 0               
  083d:0e09  751b             jne 0xe26                                
  083d:0e0b  c45efc           les bx, ptr [bp - 4]                     
  083d:0e0e  268a07           mov al, byte ptr es:[bx]                 
  083d:0e11  8a56f2           mov dl, byte ptr [bp - 0xe]              
  083d:0e14  f6d2             not dl                                   
  083d:0e16  22c2             and al, dl                               
  083d:0e18  8a56f0           mov dl, byte ptr [bp - 0x10]             
  083d:0e1b  2256f2           and dl, byte ptr [bp - 0xe]              
  083d:0e1e  0ac2             or al, dl                                
  083d:0e20  268807           mov byte ptr es:[bx], al                 
  083d:0e23  ff46fc           inc word ptr [bp - 4]                    
  083d:0e26  8bc7             mov ax, di                               
  083d:0e28  c1e002           shl ax, 2                                
  083d:0e2b  c45ee8           les bx, ptr [bp - 0x18]                  
  083d:0e2e  03d8             add bx, ax                               
  083d:0e30  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:0e34  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0e38  741f             je 0xe59                                 
  083d:0e3a  8b5ee8           mov bx, word ptr [bp - 0x18]             
  083d:0e3d  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:0e43  7514             jne 0xe59                                
  083d:0e45  8bc7             mov ax, di                               
  083d:0e47  c1e002           shl ax, 2                                
  083d:0e4a  03d8             add bx, ax                               
  083d:0e4c  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:0e51  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  083d:0e56  83c404           add sp, 4                                
  083d:0e59  47               inc di                                   
  083d:0e5a  d166ee           shl word ptr [bp - 0x12], 1              
  083d:0e5d  c45e06           les bx, ptr [bp + 6]                     
  083d:0e60  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:0e64  b400             mov ah, 0                                
  083d:0e66  3bc7             cmp ax, di                               
  083d:0e68  7e03             jle 0xe6d                                
  083d:0e6a  e97afe           jmp 0xce7                                
  083d:0e6d  e91201           jmp 0xf82                                
  083d:0e70  8b5ef4           mov bx, word ptr [bp - 0xc]              
  083d:0e73  8a871d08         mov al, byte ptr [bx + 0x81d]            
  083d:0e77  b400             mov ah, 0                                
  083d:0e79  8946f4           mov word ptr [bp - 0xc], ax              
  083d:0e7c  8b5ef2           mov bx, word ptr [bp - 0xe]              
  083d:0e7f  8a872108         mov al, byte ptr [bx + 0x821]            
  083d:0e83  b400             mov ah, 0                                
  083d:0e85  8946f2           mov word ptr [bp - 0xe], ax              
  083d:0e88  ff7610           push word ptr [bp + 0x10]                
  083d:0e8b  0e               push cs                                  
  083d:0e8c  e8b5f4           call 0x344                               -> 083d:0344
  083d:0e8f  59               pop cx                                   
  083d:0e90  8846ed           mov byte ptr [bp - 0x13], al             
  083d:0e93  8cd8             mov ax, ds                               
  083d:0e95  394608           cmp word ptr [bp + 8], ax                
  083d:0e98  7529             jne 0xec3                                
  083d:0e9a  817e064c07       cmp word ptr [bp + 6], 0x74c             
  083d:0e9f  7522             jne 0xec3                                
  083d:0ea1  c41e0908         les bx, ptr [0x809]                      
  083d:0ea5  268b5718         mov dx, word ptr es:[bx + 0x18]          
  083d:0ea9  268b4716         mov ax, word ptr es:[bx + 0x16]          
  083d:0ead  8b5e0c           mov bx, word ptr [bp + 0xc]              
  083d:0eb0  d1e3             shl bx, 1                                
  083d:0eb2  0387fa15         add ax, word ptr [bx + 0x15fa]           
  083d:0eb6  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:0eb9  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0ebd  d3fb             sar bx, cl                               
  083d:0ebf  03c3             add ax, bx                               
  083d:0ec1  eb65             jmp 0xf28                                
  083d:0ec3  c45e06           les bx, ptr [bp + 6]                     
  083d:0ec6  26f747350100     test word ptr es:[bx + 0x35], 1          
  083d:0ecc  7433             je 0xf01                                 
  083d:0ece  268b4706         mov ax, word ptr es:[bx + 6]             
  083d:0ed2  3b460c           cmp ax, word ptr [bp + 0xc]              
  083d:0ed5  7f2a             jg 0xf01                                 
  083d:0ed7  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:0eda  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:0ede  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:0ee2  26f76f08         imul word ptr es:[bx + 8]                
  083d:0ee6  d1e0             shl ax, 1                                
  083d:0ee8  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:0eec  50               push ax                                  
  083d:0eed  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:0ef1  5b               pop bx                                   
  083d:0ef2  03c3             add ax, bx                               
  083d:0ef4  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:0ef7  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0efb  d3fb             sar bx, cl                               
  083d:0efd  03c3             add ax, bx                               
  083d:0eff  eb27             jmp 0xf28                                
  083d:0f01  c45e06           les bx, ptr [bp + 6]                     
  083d:0f04  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:0f08  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:0f0c  52               push dx                                  
  083d:0f0d  50               push ax                                  
  083d:0f0e  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:0f11  26f76f08         imul word ptr es:[bx + 8]                
  083d:0f15  d1e0             shl ax, 1                                
  083d:0f17  8bd0             mov dx, ax                               
  083d:0f19  58               pop ax                                   
  083d:0f1a  03c2             add ax, dx                               
  083d:0f1c  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:0f1f  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:0f23  d3fa             sar dx, cl                               
  083d:0f25  03c2             add ax, dx                               
  083d:0f27  5a               pop dx                                   
  083d:0f28  8956fe           mov word ptr [bp - 2], dx                
  083d:0f2b  8946fc           mov word ptr [bp - 4], ax                
  083d:0f2e  c45efc           les bx, ptr [bp - 4]                     
  083d:0f31  268a07           mov al, byte ptr es:[bx]                 
  083d:0f34  8a56f4           mov dl, byte ptr [bp - 0xc]              
  083d:0f37  f6d2             not dl                                   
  083d:0f39  22c2             and al, dl                               
  083d:0f3b  8a56ed           mov dl, byte ptr [bp - 0x13]             
  083d:0f3e  2256f4           and dl, byte ptr [bp - 0xc]              
  083d:0f41  0ac2             or al, dl                                
  083d:0f43  268807           mov byte ptr es:[bx], al                 
  083d:0f46  ff46fc           inc word ptr [bp - 4]                    
  083d:0f49  8b46f8           mov ax, word ptr [bp - 8]                
  083d:0f4c  8946fa           mov word ptr [bp - 6], ax                
  083d:0f4f  eb0c             jmp 0xf5d                                
  083d:0f51  c45efc           les bx, ptr [bp - 4]                     
  083d:0f54  8a46ed           mov al, byte ptr [bp - 0x13]             
  083d:0f57  268807           mov byte ptr es:[bx], al                 
  083d:0f5a  ff46fc           inc word ptr [bp - 4]                    
  083d:0f5d  8b46fa           mov ax, word ptr [bp - 6]                
  083d:0f60  ff4efa           dec word ptr [bp - 6]                    
  083d:0f63  0bc0             or ax, ax                                
  083d:0f65  75ea             jne 0xf51                                
  083d:0f67  c45efc           les bx, ptr [bp - 4]                     
  083d:0f6a  268a07           mov al, byte ptr es:[bx]                 
  083d:0f6d  8a56f2           mov dl, byte ptr [bp - 0xe]              
  083d:0f70  f6d2             not dl                                   
  083d:0f72  22c2             and al, dl                               
  083d:0f74  8a56ed           mov dl, byte ptr [bp - 0x13]             
  083d:0f77  2256f2           and dl, byte ptr [bp - 0xe]              
  083d:0f7a  0ac2             or al, dl                                
  083d:0f7c  268807           mov byte ptr es:[bx], al                 
  083d:0f7f  ff46fc           inc word ptr [bp - 4]                    
  083d:0f82  5f               pop di                                   
  083d:0f83  5e               pop si                                   
  083d:0f84  c9               leave                                    
  083d:0f85  cb               retf                                     

proc_083d_0f86:
  083d:0f86  55               push bp                                  
  083d:0f87  8bec             mov bp, sp                               
  083d:0f89  83ec10           sub sp, 0x10                             
  083d:0f8c  56               push si                                  
  083d:0f8d  57               push di                                  
  083d:0f8e  668b4606         mov eax, dword ptr [bp + 6]              
  083d:0f92  668946f4         mov dword ptr [bp - 0xc], eax            
  083d:0f96  833ea20600       cmp word ptr [0x6a2], 0                  
  083d:0f9b  7503             jne 0xfa0                                
  083d:0f9d  e97701           jmp 0x1117                               
  083d:0fa0  c646ff01         mov byte ptr [bp - 1], 1                 
  083d:0fa4  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:0fa7  250700           and ax, 7                                
  083d:0faa  ba0700           mov dx, 7                                
  083d:0fad  2bd0             sub dx, ax                               
  083d:0faf  8956f2           mov word ptr [bp - 0xe], dx              
  083d:0fb2  c746f00000       mov word ptr [bp - 0x10], 0              
  083d:0fb7  e94901           jmp 0x1103                               
  083d:0fba  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:0fbd  c1e002           shl ax, 2                                
  083d:0fc0  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:0fc3  03d8             add bx, ax                               
  083d:0fc5  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:0fc9  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:0fcd  7433             je 0x1002                                
  083d:0fcf  8b5ef4           mov bx, word ptr [bp - 0xc]              
  083d:0fd2  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:0fd8  7528             jne 0x1002                               
  083d:0fda  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:0fdd  c1e002           shl ax, 2                                
  083d:0fe0  03d8             add bx, ax                               
  083d:0fe2  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:0fe7  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  083d:0fec  83c404           add sp, 4                                
  083d:0fef  8b5ef0           mov bx, word ptr [bp - 0x10]             
  083d:0ff2  c1e302           shl bx, 2                                
  083d:0ff5  c476f4           les si, ptr [bp - 0xc]                   
  083d:0ff8  03f3             add si, bx                               
  083d:0ffa  2689541c         mov word ptr es:[si + 0x1c], dx          
  083d:0ffe  2689441a         mov word ptr es:[si + 0x1a], ax          
  083d:1002  ff76f0           push word ptr [bp - 0x10]                
  083d:1005  9a18008206       lcall 0x682, 0x18                        -> 0682:0018 [reloc]
  083d:100a  59               pop cx                                   
  083d:100b  8a46ff           mov al, byte ptr [bp - 1]                
  083d:100e  b400             mov ah, 0                                
  083d:1010  854610           test word ptr [bp + 0x10], ax            
  083d:1013  7404             je 0x1019                                
  083d:1015  b001             mov al, 1                                
  083d:1017  eb02             jmp 0x101b                               
  083d:1019  b000             mov al, 0                                
  083d:101b  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  083d:101e  d2e0             shl al, cl                               
  083d:1020  8846fe           mov byte ptr [bp - 2], al                
  083d:1023  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:1026  c1e002           shl ax, 2                                
  083d:1029  c45e06           les bx, ptr [bp + 6]                     
  083d:102c  03d8             add bx, ax                               
  083d:102e  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:1032  8b5e06           mov bx, word ptr [bp + 6]                
  083d:1035  268b5708         mov dx, word ptr es:[bx + 8]             
  083d:1039  d1e2             shl dx, 1                                
  083d:103b  03c2             add ax, dx                               
  083d:103d  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:1040  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:1044  d3fa             sar dx, cl                               
  083d:1046  03c2             add ax, dx                               
  083d:1048  8b56f0           mov dx, word ptr [bp - 0x10]             
  083d:104b  c1e202           shl dx, 2                                
  083d:104e  03da             add bx, dx                               
  083d:1050  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  083d:1054  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:1057  d3fb             sar bx, cl                               
  083d:1059  03d3             add dx, bx                               
  083d:105b  33db             xor bx, bx                               
  083d:105d  2bc2             sub ax, dx                               
  083d:105f  83db00           sbb bx, 0                                
  083d:1062  53               push bx                                  
  083d:1063  50               push ax                                  
  083d:1064  6658             pop eax                                  
  083d:1066  8946f8           mov word ptr [bp - 8], ax                
  083d:1069  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:106c  c1e002           shl ax, 2                                
  083d:106f  8b5e06           mov bx, word ptr [bp + 6]                
  083d:1072  03d8             add bx, ax                               
  083d:1074  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  083d:1078  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  083d:107c  8b5e06           mov bx, word ptr [bp + 6]                
  083d:107f  50               push ax                                  
  083d:1080  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:1083  52               push dx                                  
  083d:1084  26f76f08         imul word ptr es:[bx + 8]                
  083d:1088  d1e0             shl ax, 1                                
  083d:108a  5a               pop dx                                   
  083d:108b  03d0             add dx, ax                               
  083d:108d  8b460a           mov ax, word ptr [bp + 0xa]              
  083d:1090  d3f8             sar ax, cl                               
  083d:1092  03d0             add dx, ax                               
  083d:1094  58               pop ax                                   
  083d:1095  8946fc           mov word ptr [bp - 4], ax                
  083d:1098  8956fa           mov word ptr [bp - 6], dx                
  083d:109b  8b7e0c           mov di, word ptr [bp + 0xc]              
  083d:109e  eb1e             jmp 0x10be                               
  083d:10a0  c45efa           les bx, ptr [bp - 6]                     
  083d:10a3  268a07           mov al, byte ptr es:[bx]                 
  083d:10a6  b201             mov dl, 1                                
  083d:10a8  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  083d:10ab  d2e2             shl dl, cl                               
  083d:10ad  f6d2             not dl                                   
  083d:10af  22c2             and al, dl                               
  083d:10b1  0a46fe           or al, byte ptr [bp - 2]                 
  083d:10b4  268807           mov byte ptr es:[bx], al                 
  083d:10b7  8b46f8           mov ax, word ptr [bp - 8]                
  083d:10ba  0146fa           add word ptr [bp - 6], ax                
  083d:10bd  47               inc di                                   
  083d:10be  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:10c1  03460e           add ax, word ptr [bp + 0xe]              
  083d:10c4  3bc7             cmp ax, di                               
  083d:10c6  7fd8             jg 0x10a0                                
  083d:10c8  d066ff           shl byte ptr [bp - 1], 1                 
  083d:10cb  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:10ce  c1e002           shl ax, 2                                
  083d:10d1  c45ef4           les bx, ptr [bp - 0xc]                   
  083d:10d4  03d8             add bx, ax                               
  083d:10d6  268b470a         mov ax, word ptr es:[bx + 0xa]           
  083d:10da  260b470c         or ax, word ptr es:[bx + 0xc]            
  083d:10de  7420             je 0x1100                                
  083d:10e0  8b5ef4           mov bx, word ptr [bp - 0xc]              
  083d:10e3  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  083d:10e9  7515             jne 0x1100                               
  083d:10eb  8b46f0           mov ax, word ptr [bp - 0x10]             
  083d:10ee  c1e002           shl ax, 2                                
  083d:10f1  03d8             add bx, ax                               
  083d:10f3  6626ff770a       push dword ptr es:[bx + 0xa]             
  083d:10f8  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  083d:10fd  83c404           add sp, 4                                
  083d:1100  ff46f0           inc word ptr [bp - 0x10]                 
  083d:1103  c45e06           les bx, ptr [bp + 6]                     
  083d:1106  268a4734         mov al, byte ptr es:[bx + 0x34]          
  083d:110a  b400             mov ah, 0                                
  083d:110c  3b46f0           cmp ax, word ptr [bp - 0x10]             
  083d:110f  7e03             jle 0x1114                               
  083d:1111  e9a6fe           jmp 0xfba                                
  083d:1114  e9fc00           jmp 0x1213                               
  083d:1117  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:111a  231ec615         and bx, word ptr [0x15c6]                
  083d:111e  8a872508         mov al, byte ptr [bx + 0x825]            
  083d:1122  f6d0             not al                                   
  083d:1124  8846ff           mov byte ptr [bp - 1], al                
  083d:1127  ff7610           push word ptr [bp + 0x10]                
  083d:112a  0e               push cs                                  
  083d:112b  e816f2           call 0x344                               -> 083d:0344
  083d:112e  59               pop cx                                   
  083d:112f  8a56ff           mov dl, byte ptr [bp - 1]                
  083d:1132  f6d2             not dl                                   
  083d:1134  22c2             and al, dl                               
  083d:1136  8846fe           mov byte ptr [bp - 2], al                
  083d:1139  8cd8             mov ax, ds                               
  083d:113b  394608           cmp word ptr [bp + 8], ax                
  083d:113e  754e             jne 0x118e                               
  083d:1140  817e064c07       cmp word ptr [bp + 6], 0x74c             
  083d:1145  7547             jne 0x118e                               
  083d:1147  8b7e0c           mov di, word ptr [bp + 0xc]              
  083d:114a  eb35             jmp 0x1181                               
  083d:114c  c41e0908         les bx, ptr [0x809]                      
  083d:1150  268b4718         mov ax, word ptr es:[bx + 0x18]          
  083d:1154  268b5716         mov dx, word ptr es:[bx + 0x16]          
  083d:1158  8bdf             mov bx, di                               
  083d:115a  d1e3             shl bx, 1                                
  083d:115c  0397fa15         add dx, word ptr [bx + 0x15fa]           
  083d:1160  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:1163  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:1167  d3fb             sar bx, cl                               
  083d:1169  03d3             add dx, bx                               
  083d:116b  8946fc           mov word ptr [bp - 4], ax                
  083d:116e  8956fa           mov word ptr [bp - 6], dx                
  083d:1171  c45efa           les bx, ptr [bp - 6]                     
  083d:1174  268a07           mov al, byte ptr es:[bx]                 
  083d:1177  2246ff           and al, byte ptr [bp - 1]                
  083d:117a  0a46fe           or al, byte ptr [bp - 2]                 
  083d:117d  268807           mov byte ptr es:[bx], al                 
  083d:1180  47               inc di                                   
  083d:1181  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:1184  03460e           add ax, word ptr [bp + 0xe]              
  083d:1187  3bc7             cmp ax, di                               
  083d:1189  7fc1             jg 0x114c                                
  083d:118b  e98500           jmp 0x1213                               
  083d:118e  8b7e0c           mov di, word ptr [bp + 0xc]              
  083d:1191  eb76             jmp 0x1209                               
  083d:1193  c45e06           les bx, ptr [bp + 6]                     
  083d:1196  26f747350100     test word ptr es:[bx + 0x35], 1          
  083d:119c  742f             je 0x11cd                                
  083d:119e  26397f06         cmp word ptr es:[bx + 6], di             
  083d:11a2  7f29             jg 0x11cd                                
  083d:11a4  8bc7             mov ax, di                               
  083d:11a6  262b4706         sub ax, word ptr es:[bx + 6]             
  083d:11aa  26c45f37         les bx, ptr es:[bx + 0x37]               
  083d:11ae  26f76f08         imul word ptr es:[bx + 8]                
  083d:11b2  d1e0             shl ax, 1                                
  083d:11b4  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:11b8  50               push ax                                  
  083d:11b9  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:11bd  5b               pop bx                                   
  083d:11be  03c3             add ax, bx                               
  083d:11c0  8b5e0a           mov bx, word ptr [bp + 0xa]              
  083d:11c3  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:11c7  d3fb             sar bx, cl                               
  083d:11c9  03c3             add ax, bx                               
  083d:11cb  eb26             jmp 0x11f3                               
  083d:11cd  c45e06           les bx, ptr [bp + 6]                     
  083d:11d0  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  083d:11d4  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  083d:11d8  52               push dx                                  
  083d:11d9  50               push ax                                  
  083d:11da  8bc7             mov ax, di                               
  083d:11dc  26f76f08         imul word ptr es:[bx + 8]                
  083d:11e0  d1e0             shl ax, 1                                
  083d:11e2  8bd0             mov dx, ax                               
  083d:11e4  58               pop ax                                   
  083d:11e5  03c2             add ax, dx                               
  083d:11e7  8b560a           mov dx, word ptr [bp + 0xa]              
  083d:11ea  8a0ec015         mov cl, byte ptr [0x15c0]                
  083d:11ee  d3fa             sar dx, cl                               
  083d:11f0  03c2             add ax, dx                               
  083d:11f2  5a               pop dx                                   
  083d:11f3  8956fc           mov word ptr [bp - 4], dx                
  083d:11f6  8946fa           mov word ptr [bp - 6], ax                
  083d:11f9  c45efa           les bx, ptr [bp - 6]                     
  083d:11fc  268a07           mov al, byte ptr es:[bx]                 
  083d:11ff  2246ff           and al, byte ptr [bp - 1]                
  083d:1202  0a46fe           or al, byte ptr [bp - 2]                 
  083d:1205  268807           mov byte ptr es:[bx], al                 
  083d:1208  47               inc di                                   
  083d:1209  8b460c           mov ax, word ptr [bp + 0xc]              
  083d:120c  03460e           add ax, word ptr [bp + 0xe]              
  083d:120f  3bc7             cmp ax, di                               
  083d:1211  7f80             jg 0x1193                                
  083d:1213  5f               pop di                                   
  083d:1214  5e               pop si                                   
  083d:1215  c9               leave                                    
  083d:1216  cb               retf                                     

proc_083d_1217:
  083d:1217  55               push bp                                  
  083d:1218  8bec             mov bp, sp                               
  083d:121a  83ec1a           sub sp, 0x1a                             
  083d:121d  8b4606           mov ax, word ptr [bp + 6]                
  083d:1220  2b460a           sub ax, word ptr [bp + 0xa]              
  083d:1223  99               cdq                                      
  083d:1224  33c2             xor ax, dx                               
  083d:1226  2bc2             sub ax, dx                               
  083d:1228  8946e6           mov word ptr [bp - 0x1a], ax             
  083d:122b  cd3b46e6         f-fild word ptr [bp - 0x1a]              ; emu int 3b
  083d:122f  cd395ef8         f-fstp qword ptr [bp - 8]                ; emu int 39
  083d:1233  cd3d             fwait                                    ; emu
  083d:1235  8b4608           mov ax, word ptr [bp + 8]                
  083d:1238  2b460c           sub ax, word ptr [bp + 0xc]              
  083d:123b  99               cdq                                      
  083d:123c  33c2             xor ax, dx                               
  083d:123e  2bc2             sub ax, dx                               
  083d:1240  8946e6           mov word ptr [bp - 0x1a], ax             
  083d:1243  cd3b46e6         f-fild word ptr [bp - 0x1a]              ; emu int 3b
  083d:1247  cd395ef0         f-fstp qword ptr [bp - 0x10]             ; emu int 39
  083d:124b  cd3946f8         f-fld qword ptr [bp - 8]                 ; emu int 39
  083d:124f  cd384ef8         f-fmul qword ptr [bp - 8]                ; emu int 38
  083d:1253  cd3946f0         f-fld qword ptr [bp - 0x10]              ; emu int 39
  083d:1257  cd384ef0         f-fmul qword ptr [bp - 0x10]             ; emu int 38
  083d:125b  cd3ac1           f-faddp st(1)                            ; emu int 3a
  083d:125e  cd395ee8         f-fstp qword ptr [bp - 0x18]             ; emu int 39
  083d:1262  cd3946e8         f-fld qword ptr [bp - 0x18]              ; emu int 39
  083d:1266  cd35ee           f-fldz                                   ; emu int 35
  083d:1269  cd3ad9           f-fcompp                                 ; emu int 3a
  083d:126c  cd397ee6         f-fnstsw word ptr [bp - 0x1a]            ; emu int 39
  083d:1270  cd3d             fwait                                    ; emu
  083d:1272  8b46e6           mov ax, word ptr [bp - 0x1a]             
  083d:1275  9e               sahf                                     
  083d:1276  7605             jbe 0x127d                               
  083d:1278  b81027           mov ax, 0x2710                           
  083d:127b  eb1c             jmp 0x1299                               
  083d:127d  cd3946e8         f-fld qword ptr [bp - 0x18]              ; emu int 39
  083d:1281  83ec08           sub sp, 8                                
  083d:1284  cd395ede         f-fstp qword ptr [bp - 0x22]             ; emu int 39
  083d:1288  cd3d             fwait                                    ; emu
  083d:128a  9a351a0000       lcall 0, 0x1a35                          -> 0000:1a35 [reloc]
  083d:128f  83               db 83
