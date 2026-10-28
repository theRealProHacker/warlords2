; seg 0bc3  img 0xbc30..0xbfc0  file off 0xc830
  0bc3:0000  7fce             jg 0xffffffd0                            
  0bc3:0002  5e               pop si                                   
  0bc3:0003  5d               pop bp                                   
  0bc3:0004  cb               retf                                     
  0bc3:0005  c8040000         enter 4, 0                               
  0bc3:0009  8c1ef20b         mov word ptr [0xbf2], ds                 
  0bc3:000d  c706f00b920a     mov word ptr [0xbf0], 0xa92               ; "SWAP.DAT"
  0bc3:0013  6aff             push -1                                  
  0bc3:0015  6a01             push 1                                   
  0bc3:0017  6a02             push 2                                   
  0bc3:0019  6a00             push 0                                   
  0bc3:001b  688000           push 0x80                                
  0bc3:001e  682c01           push 0x12c                               
  0bc3:0021  9a0800870c       lcall 0xc87, 8                           -> 0c87:0008 [reloc]
  0bc3:0026  83c40c           add sp, 0xc                              
  0bc3:0029  9a0600560b       lcall 0xb56, 6                           -> 0b56:0006 [reloc]
  0bc3:002e  9a0100e809       lcall 0x9e8, 1                           -> 09e8:0001 [reloc]
  0bc3:0033  833ea20600       cmp word ptr [0x6a2], 0                  
  0bc3:0038  744c             je 0x86                                  
  0bc3:003a  c41e0908         les bx, ptr [0x809]                      
  0bc3:003e  268b4702         mov ax, word ptr es:[bx + 2]             
  0bc3:0042  c41e0908         les bx, ptr [0x809]                      
  0bc3:0046  26f76f06         imul word ptr es:[bx + 6]                
  0bc3:004a  d1e0             shl ax, 1                                
  0bc3:004c  c1e804           shr ax, 4                                
  0bc3:004f  c41e0908         les bx, ptr [0x809]                      
  0bc3:0053  268b5708         mov dx, word ptr es:[bx + 8]             
  0bc3:0057  03d0             add dx, ax                               
  0bc3:0059  8956fe           mov word ptr [bp - 2], dx                
  0bc3:005c  c41e0908         les bx, ptr [0x809]                      
  0bc3:0060  268b4702         mov ax, word ptr es:[bx + 2]             
  0bc3:0064  c41e0908         les bx, ptr [0x809]                      
  0bc3:0068  26f76f06         imul word ptr es:[bx + 6]                
  0bc3:006c  d1e0             shl ax, 1                                
  0bc3:006e  33d2             xor dx, dx                               
  0bc3:0070  2bd0             sub dx, ax                               
  0bc3:0072  c1ea04           shr dx, 4                                
  0bc3:0075  8956fc           mov word ptr [bp - 4], dx                
  0bc3:0078  ff76fc           push word ptr [bp - 4]                   
  0bc3:007b  ff76fe           push word ptr [bp - 2]                   
  0bc3:007e  9a0900f706       lcall 0x6f7, 9                           -> 06f7:0009 [reloc]
  0bc3:0083  83c404           add sp, 4                                
  0bc3:0086  c9               leave                                    
  0bc3:0087  cb               retf                                     
  0bc3:0088  9aed00870c       lcall 0xc87, 0xed                        -> 0c87:00ed [reloc]
  0bc3:008d  cb               retf                                     
  0bc3:008e  9ab002a30a       lcall 0xaa3, 0x2b0                       -> 0aa3:02b0 [reloc]
  0bc3:0093  9afc012b06       lcall 0x62b, 0x1fc                       -> 062b:01fc [reloc]
  0bc3:0098  cb               retf                                     
  0bc3:0099  c8a40000         enter 0xa4, 0                            
  0bc3:009d  8d460a           lea ax, [bp + 0xa]                       
  0bc3:00a0  8c56fe           mov word ptr [bp - 2], ss                
  0bc3:00a3  8946fc           mov word ptr [bp - 4], ax                
  0bc3:00a6  ff76fe           push word ptr [bp - 2]                   
  0bc3:00a9  ff76fc           push word ptr [bp - 4]                   
  0bc3:00ac  ff7608           push word ptr [bp + 8]                   
  0bc3:00af  ff7606           push word ptr [bp + 6]                   
  0bc3:00b2  16               push ss                                  
  0bc3:00b3  8d865cff         lea ax, [bp - 0xa4]                      
  0bc3:00b7  50               push ax                                  
  0bc3:00b8  9ac2450000       lcall 0, 0x45c2                          -> 0000:45c2 [reloc]
  0bc3:00bd  83c40c           add sp, 0xc                              
  0bc3:00c0  16               push ss                                  
  0bc3:00c1  8d865cff         lea ax, [bp - 0xa4]                      
  0bc3:00c5  50               push ax                                  
  0bc3:00c6  9aeb430000       lcall 0, 0x43eb                          -> 0000:43eb [reloc]
  0bc3:00cb  83c404           add sp, 4                                
  0bc3:00ce  c9               leave                                    
  0bc3:00cf  cb               retf                                     
  0bc3:00d0  c81a0000         enter 0x1a, 0                            
  0bc3:00d4  56               push si                                  
  0bc3:00d5  57               push di                                  
  0bc3:00d6  8b7e12           mov di, word ptr [bp + 0x12]             
  0bc3:00d9  833ea20600       cmp word ptr [0x6a2], 0                  
  0bc3:00de  7503             jne 0xe3                                 
  0bc3:00e0  e9a502           jmp 0x388                                
  0bc3:00e3  c45e06           les bx, ptr [bp + 6]                     
  0bc3:00e6  26833f00         cmp word ptr es:[bx], 0                  
  0bc3:00ea  7539             jne 0x125                                
  0bc3:00ec  6a01             push 1                                   
  0bc3:00ee  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:00f1  26ff7706         push word ptr es:[bx + 6]                
  0bc3:00f5  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:00f8  26ff7704         push word ptr es:[bx + 4]                
  0bc3:00fc  ff7610           push word ptr [bp + 0x10]                
  0bc3:00ff  ff760e           push word ptr [bp + 0xe]                 
  0bc3:0102  9ab0023d08       lcall 0x83d, 0x2b0                       -> 083d:02b0 [reloc]
  0bc3:0107  83c40a           add sp, 0xa                              
  0bc3:010a  0bc0             or ax, ax                                
  0bc3:010c  750f             jne 0x11d                                
  0bc3:010e  1e               push ds                                  
  0bc3:010f  689b0a           push 0xa9b                                ; "cannot allocate mask"
  0bc3:0112  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0bc3:0117  83c404           add sp, 4                                
  0bc3:011a  e96b02           jmp 0x388                                
  0bc3:011d  c45e06           les bx, ptr [bp + 6]                     
  0bc3:0120  26c7070100       mov word ptr es:[bx], 1                  
  0bc3:0125  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0128  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0bc3:012e  7451             je 0x181                                 
  0bc3:0130  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0133  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0bc3:0139  7546             jne 0x181                                
  0bc3:013b  c746f60000       mov word ptr [bp - 0xa], 0               
  0bc3:0140  eb31             jmp 0x173                                
  0bc3:0142  8b46f6           mov ax, word ptr [bp - 0xa]              
  0bc3:0145  c1e002           shl ax, 2                                
  0bc3:0148  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:014b  03d8             add bx, ax                               
  0bc3:014d  26ff770c         push word ptr es:[bx + 0xc]              
  0bc3:0151  26ff770a         push word ptr es:[bx + 0xa]              
  0bc3:0155  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0bc3:015a  83c404           add sp, 4                                
  0bc3:015d  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0bc3:0160  c1e302           shl bx, 2                                
  0bc3:0163  c4760a           les si, ptr [bp + 0xa]                   
  0bc3:0166  03f3             add si, bx                               
  0bc3:0168  2689541c         mov word ptr es:[si + 0x1c], dx          
  0bc3:016c  2689441a         mov word ptr es:[si + 0x1a], ax          
  0bc3:0170  ff46f6           inc word ptr [bp - 0xa]                  
  0bc3:0173  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0176  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0bc3:017a  b400             mov ah, 0                                
  0bc3:017c  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0bc3:017f  7fc1             jg 0x142                                 
  0bc3:0181  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:0184  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0bc3:018a  7451             je 0x1dd                                 
  0bc3:018c  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:018f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0bc3:0195  7546             jne 0x1dd                                
  0bc3:0197  c746f60000       mov word ptr [bp - 0xa], 0               
  0bc3:019c  eb31             jmp 0x1cf                                
  0bc3:019e  8b46f6           mov ax, word ptr [bp - 0xa]              
  0bc3:01a1  c1e002           shl ax, 2                                
  0bc3:01a4  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:01a7  03d8             add bx, ax                               
  0bc3:01a9  26ff770c         push word ptr es:[bx + 0xc]              
  0bc3:01ad  26ff770a         push word ptr es:[bx + 0xa]              
  0bc3:01b1  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0bc3:01b6  83c404           add sp, 4                                
  0bc3:01b9  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0bc3:01bc  c1e302           shl bx, 2                                
  0bc3:01bf  c4760e           les si, ptr [bp + 0xe]                   
  0bc3:01c2  03f3             add si, bx                               
  0bc3:01c4  2689541c         mov word ptr es:[si + 0x1c], dx          
  0bc3:01c8  2689441a         mov word ptr es:[si + 0x1a], ax          
  0bc3:01cc  ff46f6           inc word ptr [bp - 0xa]                  
  0bc3:01cf  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:01d2  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0bc3:01d6  b400             mov ah, 0                                
  0bc3:01d8  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0bc3:01db  7fc1             jg 0x19e                                 
  0bc3:01dd  c746fc0000       mov word ptr [bp - 4], 0                 
  0bc3:01e2  eb28             jmp 0x20c                                
  0bc3:01e4  8b5efc           mov bx, word ptr [bp - 4]                
  0bc3:01e7  c1e302           shl bx, 2                                
  0bc3:01ea  8d46e6           lea ax, [bp - 0x1a]                      
  0bc3:01ed  03d8             add bx, ax                               
  0bc3:01ef  8b46fc           mov ax, word ptr [bp - 4]                
  0bc3:01f2  c1e002           shl ax, 2                                
  0bc3:01f5  c4760a           les si, ptr [bp + 0xa]                   
  0bc3:01f8  03f0             add si, ax                               
  0bc3:01fa  268b441c         mov ax, word ptr es:[si + 0x1c]          
  0bc3:01fe  268b541a         mov dx, word ptr es:[si + 0x1a]          
  0bc3:0202  36894702         mov word ptr ss:[bx + 2], ax             
  0bc3:0206  368917           mov word ptr ss:[bx], dx                 
  0bc3:0209  ff46fc           inc word ptr [bp - 4]                    
  0bc3:020c  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:020f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0bc3:0213  b400             mov ah, 0                                
  0bc3:0215  3b46fc           cmp ax, word ptr [bp - 4]                
  0bc3:0218  77ca             ja 0x1e4                                 
  0bc3:021a  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:021d  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0bc3:0222  668946f8         mov dword ptr [bp - 8], eax              
  0bc3:0226  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0229  268b4708         mov ax, word ptr es:[bx + 8]             
  0bc3:022d  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0230  26f76f06         imul word ptr es:[bx + 6]                
  0bc3:0234  8946fe           mov word ptr [bp - 2], ax                
  0bc3:0237  e9bd00           jmp 0x2f7                                
  0bc3:023a  f7c70100         test di, 1                               
  0bc3:023e  7404             je 0x244                                 
  0bc3:0240  33c0             xor ax, ax                               
  0bc3:0242  eb06             jmp 0x24a                                
  0bc3:0244  c45ee6           les bx, ptr [bp - 0x1a]                  
  0bc3:0247  268b07           mov ax, word ptr es:[bx]                 
  0bc3:024a  50               push ax                                  
  0bc3:024b  f7c70200         test di, 2                               
  0bc3:024f  7404             je 0x255                                 
  0bc3:0251  33c0             xor ax, ax                               
  0bc3:0253  eb06             jmp 0x25b                                
  0bc3:0255  c45eea           les bx, ptr [bp - 0x16]                  
  0bc3:0258  268b07           mov ax, word ptr es:[bx]                 
  0bc3:025b  5a               pop dx                                   
  0bc3:025c  0bd0             or dx, ax                                
  0bc3:025e  52               push dx                                  
  0bc3:025f  f7c70400         test di, 4                               
  0bc3:0263  7404             je 0x269                                 
  0bc3:0265  33c0             xor ax, ax                               
  0bc3:0267  eb06             jmp 0x26f                                
  0bc3:0269  c45eee           les bx, ptr [bp - 0x12]                  
  0bc3:026c  268b07           mov ax, word ptr es:[bx]                 
  0bc3:026f  5a               pop dx                                   
  0bc3:0270  0bd0             or dx, ax                                
  0bc3:0272  52               push dx                                  
  0bc3:0273  f7c70800         test di, 8                               
  0bc3:0277  7404             je 0x27d                                 
  0bc3:0279  33c0             xor ax, ax                               
  0bc3:027b  eb06             jmp 0x283                                
  0bc3:027d  c45ef2           les bx, ptr [bp - 0xe]                   
  0bc3:0280  268b07           mov ax, word ptr es:[bx]                 
  0bc3:0283  5a               pop dx                                   
  0bc3:0284  0bd0             or dx, ax                                
  0bc3:0286  83f2ff           xor dx, 0xffff                           
  0bc3:0289  52               push dx                                  
  0bc3:028a  f7c70100         test di, 1                               
  0bc3:028e  7408             je 0x298                                 
  0bc3:0290  c45ee6           les bx, ptr [bp - 0x1a]                  
  0bc3:0293  268b07           mov ax, word ptr es:[bx]                 
  0bc3:0296  eb03             jmp 0x29b                                
  0bc3:0298  b8ffff           mov ax, 0xffff                           
  0bc3:029b  5a               pop dx                                   
  0bc3:029c  23d0             and dx, ax                               
  0bc3:029e  52               push dx                                  
  0bc3:029f  f7c70200         test di, 2                               
  0bc3:02a3  7408             je 0x2ad                                 
  0bc3:02a5  c45eea           les bx, ptr [bp - 0x16]                  
  0bc3:02a8  268b07           mov ax, word ptr es:[bx]                 
  0bc3:02ab  eb03             jmp 0x2b0                                
  0bc3:02ad  b8ffff           mov ax, 0xffff                           
  0bc3:02b0  5a               pop dx                                   
  0bc3:02b1  23d0             and dx, ax                               
  0bc3:02b3  52               push dx                                  
  0bc3:02b4  f7c70400         test di, 4                               
  0bc3:02b8  7408             je 0x2c2                                 
  0bc3:02ba  c45eee           les bx, ptr [bp - 0x12]                  
  0bc3:02bd  268b07           mov ax, word ptr es:[bx]                 
  0bc3:02c0  eb03             jmp 0x2c5                                
  0bc3:02c2  b8ffff           mov ax, 0xffff                           
  0bc3:02c5  5a               pop dx                                   
  0bc3:02c6  23d0             and dx, ax                               
  0bc3:02c8  52               push dx                                  
  0bc3:02c9  f7c70800         test di, 8                               
  0bc3:02cd  7408             je 0x2d7                                 
  0bc3:02cf  c45ef2           les bx, ptr [bp - 0xe]                   
  0bc3:02d2  268b07           mov ax, word ptr es:[bx]                 
  0bc3:02d5  eb03             jmp 0x2da                                
  0bc3:02d7  b8ffff           mov ax, 0xffff                           
  0bc3:02da  5a               pop dx                                   
  0bc3:02db  23d0             and dx, ax                               
  0bc3:02dd  c45ef8           les bx, ptr [bp - 8]                     
  0bc3:02e0  268917           mov word ptr es:[bx], dx                 
  0bc3:02e3  8346e602         add word ptr [bp - 0x1a], 2              
  0bc3:02e7  8346ea02         add word ptr [bp - 0x16], 2              
  0bc3:02eb  8346ee02         add word ptr [bp - 0x12], 2              
  0bc3:02ef  8346f202         add word ptr [bp - 0xe], 2               
  0bc3:02f3  8346f802         add word ptr [bp - 8], 2                 
  0bc3:02f7  8b46fe           mov ax, word ptr [bp - 2]                
  0bc3:02fa  ff4efe           dec word ptr [bp - 2]                    
  0bc3:02fd  0bc0             or ax, ax                                
  0bc3:02ff  7403             je 0x304                                 
  0bc3:0301  e936ff           jmp 0x23a                                
  0bc3:0304  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0307  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0bc3:030d  7437             je 0x346                                 
  0bc3:030f  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0312  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0bc3:0318  752c             jne 0x346                                
  0bc3:031a  33f6             xor si, si                               
  0bc3:031c  eb1b             jmp 0x339                                
  0bc3:031e  8bc6             mov ax, si                               
  0bc3:0320  c1e002           shl ax, 2                                
  0bc3:0323  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:0326  03d8             add bx, ax                               
  0bc3:0328  26ff770c         push word ptr es:[bx + 0xc]              
  0bc3:032c  26ff770a         push word ptr es:[bx + 0xa]              
  0bc3:0330  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  0bc3:0335  83c404           add sp, 4                                
  0bc3:0338  46               inc si                                   
  0bc3:0339  c45e0a           les bx, ptr [bp + 0xa]                   
  0bc3:033c  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0bc3:0340  b400             mov ah, 0                                
  0bc3:0342  3bc6             cmp ax, si                               
  0bc3:0344  7fd8             jg 0x31e                                 
  0bc3:0346  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:0349  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0bc3:034f  7437             je 0x388                                 
  0bc3:0351  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:0354  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0bc3:035a  752c             jne 0x388                                
  0bc3:035c  33f6             xor si, si                               
  0bc3:035e  eb1b             jmp 0x37b                                
  0bc3:0360  8bc6             mov ax, si                               
  0bc3:0362  c1e002           shl ax, 2                                
  0bc3:0365  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:0368  03d8             add bx, ax                               
  0bc3:036a  26ff770c         push word ptr es:[bx + 0xc]              
  0bc3:036e  26ff770a         push word ptr es:[bx + 0xa]              
  0bc3:0372  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  0bc3:0377  83c404           add sp, 4                                
  0bc3:037a  46               inc si                                   
  0bc3:037b  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc3:037e  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0bc3:0382  b400             mov ah, 0                                
  0bc3:0384  3bc6             cmp ax, si                               
  0bc3:0386  7fd8             jg 0x360                                 
  0bc3:0388  5f               pop di                                   
  0bc3:0389  5e               pop si                                   
  0bc3:038a  c9               leave                                    
  0bc3:038b  cb               retf                                     
  0bc3:038c  c8020000         enter 2, 0                               
