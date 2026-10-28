; seg 048a  img 0x48a0..0x5510  file off 0x54a0
  048a:0000  0bf6             or si, si                                
  048a:0002  75e1             jne 0xffffffe5                           
  048a:0004  5e               pop si                                   
  048a:0005  8be5             mov sp, bp                               
  048a:0007  5d               pop bp                                   
  048a:0008  cb               retf                                     
  048a:0009  1e               push ds                                  
  048a:000a  683b13           push 0x133b                              
  048a:000d  1e               push ds                                  
  048a:000e  688001           push 0x180                               
  048a:0011  1e               push ds                                  
  048a:0012  684501           push 0x145                               
  048a:0015  1e               push ds                                  
  048a:0016  683f13           push 0x133f                              
  048a:0019  1e               push ds                                  
  048a:001a  683102           push 0x231                                ; "Chance36"
  048a:001d  90               nop                                      
  048a:001e  0e               push cs                                  
  048a:001f  e82000           call 0x42                                -> 048a:0042
  048a:0022  83c414           add sp, 0x14                             
  048a:0025  1e               push ds                                  
  048a:0026  681a13           push 0x131a                              
  048a:0029  1e               push ds                                  
  048a:002a  68f601           push 0x1f6                               
  048a:002d  1e               push ds                                  
  048a:002e  68bb01           push 0x1bb                               
  048a:0031  1e               push ds                                  
  048a:0032  681e13           push 0x131e                              
  048a:0035  1e               push ds                                  
  048a:0036  683a02           push 0x23a                                ; "Chance17"
  048a:0039  90               nop                                      
  048a:003a  0e               push cs                                  
  048a:003b  e80400           call 0x42                                -> 048a:0042
  048a:003e  83c414           add sp, 0x14                             
  048a:0041  cb               retf                                     
  048a:0042  c8e80000         enter 0xe8, 0                            
  048a:0046  56               push si                                  
  048a:0047  57               push di                                  
  048a:0048  c746fa0100       mov word ptr [bp - 6], 1                 
  048a:004d  1e               push ds                                  
  048a:004e  684302           push 0x243                               
  048a:0051  16               push ss                                  
  048a:0052  8d8626ff         lea ax, [bp - 0xda]                      
  048a:0056  50               push ax                                  
  048a:0057  9a9c460000       lcall 0, 0x469c                          -> 0000:469c [reloc]
  048a:005c  83c408           add sp, 8                                
  048a:005f  ff7608           push word ptr [bp + 8]                   
  048a:0062  ff7606           push word ptr [bp + 6]                   
  048a:0065  1e               push ds                                  
  048a:0066  684402           push 0x244                                ; "%s.fnt"
  048a:0069  16               push ss                                  
  048a:006a  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:006e  50               push ax                                  
  048a:006f  9aa0450000       lcall 0, 0x45a0                          -> 0000:45a0 [reloc]
  048a:0074  83c40c           add sp, 0xc                              
  048a:0077  16               push ss                                  
  048a:0078  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:007c  50               push ax                                  
  048a:007d  16               push ss                                  
  048a:007e  8d8626ff         lea ax, [bp - 0xda]                      
  048a:0082  50               push ax                                  
  048a:0083  ff7610           push word ptr [bp + 0x10]                
  048a:0086  ff760e           push word ptr [bp + 0xe]                 
  048a:0089  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  048a:008e  83c40c           add sp, 0xc                              
  048a:0091  0bc0             or ax, ax                                
  048a:0093  7526             jne 0xbb                                 
  048a:0095  16               push ss                                  
  048a:0096  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:009a  50               push ax                                  
  048a:009b  1e               push ds                                  
  048a:009c  684b02           push 0x24b                                ; "Couldn't load the file '%s'."
  048a:009f  16               push ss                                  
  048a:00a0  8d8626ff         lea ax, [bp - 0xda]                      
  048a:00a4  50               push ax                                  
  048a:00a5  9aa0450000       lcall 0, 0x45a0                          -> 0000:45a0 [reloc]
  048a:00aa  83c40c           add sp, 0xc                              
  048a:00ad  16               push ss                                  
  048a:00ae  8d8626ff         lea ax, [bp - 0xda]                      
  048a:00b2  50               push ax                                  
  048a:00b3  9a6f077905       lcall 0x579, 0x76f                       -> 0579:076f [reloc]
  048a:00b8  83c404           add sp, 4                                
  048a:00bb  ff7608           push word ptr [bp + 8]                   
  048a:00be  ff7606           push word ptr [bp + 6]                   
  048a:00c1  1e               push ds                                  
  048a:00c2  686802           push 0x268                                ; "%s.fin"
  048a:00c5  16               push ss                                  
  048a:00c6  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:00ca  50               push ax                                  
  048a:00cb  9aa0450000       lcall 0, 0x45a0                          -> 0000:45a0 [reloc]
  048a:00d0  83c40c           add sp, 0xc                              
  048a:00d3  16               push ss                                  
  048a:00d4  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:00d8  50               push ax                                  
  048a:00d9  16               push ss                                  
  048a:00da  8d8626ff         lea ax, [bp - 0xda]                      
  048a:00de  50               push ax                                  
  048a:00df  ff7610           push word ptr [bp + 0x10]                
  048a:00e2  ff760e           push word ptr [bp + 0xe]                 
  048a:00e5  ff760c           push word ptr [bp + 0xc]                 
  048a:00e8  ff760a           push word ptr [bp + 0xa]                 
  048a:00eb  90               nop                                      
  048a:00ec  0e               push cs                                  
  048a:00ed  e81c03           call 0x40c                               -> 048a:040c
  048a:00f0  83c410           add sp, 0x10                             
  048a:00f3  0bc0             or ax, ax                                
  048a:00f5  7526             jne 0x11d                                
  048a:00f7  16               push ss                                  
  048a:00f8  8d8618ff         lea ax, [bp - 0xe8]                      
  048a:00fc  50               push ax                                  
  048a:00fd  1e               push ds                                  
  048a:00fe  686f02           push 0x26f                                ; "Couldn't load the file '%s'."
  048a:0101  16               push ss                                  
  048a:0102  8d8626ff         lea ax, [bp - 0xda]                      
  048a:0106  50               push ax                                  
  048a:0107  9aa0450000       lcall 0, 0x45a0                          -> 0000:45a0 [reloc]
  048a:010c  83c40c           add sp, 0xc                              
  048a:010f  16               push ss                                  
  048a:0110  8d8626ff         lea ax, [bp - 0xda]                      
  048a:0114  50               push ax                                  
  048a:0115  9a6f077905       lcall 0x579, 0x76f                       -> 0579:076f [reloc]
  048a:011a  83c404           add sp, 4                                
  048a:011d  8b4612           mov ax, word ptr [bp + 0x12]             
  048a:0120  0b4614           or ax, word ptr [bp + 0x14]              
  048a:0123  7503             jne 0x128                                
  048a:0125  e91302           jmp 0x33b                                
  048a:0128  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:012b  268b4702         mov ax, word ptr es:[bx + 2]             
  048a:012f  8946f8           mov word ptr [bp - 8], ax                
  048a:0132  268b470d         mov ax, word ptr es:[bx + 0xd]           
  048a:0136  8946f6           mov word ptr [bp - 0xa], ax              
  048a:0139  c7069c000000     mov word ptr [0x9c], 0                   
  048a:013f  50               push ax                                  
  048a:0140  ff76f8           push word ptr [bp - 8]                   
  048a:0143  1e               push ds                                  
  048a:0144  689400           push 0x94                                
  048a:0147  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  048a:014c  83c408           add sp, 8                                
  048a:014f  0bc0             or ax, ax                                
  048a:0151  750c             jne 0x15f                                
  048a:0153  1e               push ds                                  
  048a:0154  688c02           push 0x28c                                ; "Couldn't allocate the temp mask bitmap."
  048a:0157  9a6f077905       lcall 0x579, 0x76f                       -> 0579:076f [reloc]
  048a:015c  83c404           add sp, 4                                
  048a:015f  6a01             push 1                                   
  048a:0161  ff76f6           push word ptr [bp - 0xa]                 
  048a:0164  ff76f8           push word ptr [bp - 8]                   
  048a:0167  ff7614           push word ptr [bp + 0x14]                
  048a:016a  ff7612           push word ptr [bp + 0x12]                
  048a:016d  9ab0023d08       lcall 0x83d, 0x2b0                       -> 083d:02b0 [reloc]
  048a:0172  83c40a           add sp, 0xa                              
  048a:0175  0bc0             or ax, ax                                
  048a:0177  750c             jne 0x185                                
  048a:0179  1e               push ds                                  
  048a:017a  68b502           push 0x2b5                                ; "Couldn't allocate the mask bitmap."
  048a:017d  9a6f077905       lcall 0x579, 0x76f                       -> 0579:076f [reloc]
  048a:0182  83c404           add sp, 4                                
  048a:0185  a19e00           mov ax, word ptr [0x9e]                  
  048a:0188  0b06a000         or ax, word ptr [0xa0]                   
  048a:018c  7438             je 0x1c6                                 
  048a:018e  f706c9000a00     test word ptr [0xc9], 0xa                
  048a:0194  7530             jne 0x1c6                                
  048a:0196  33f6             xor si, si                               
  048a:0198  eb23             jmp 0x1bd                                
  048a:019a  8bde             mov bx, si                               
  048a:019c  c1e302           shl bx, 2                                
  048a:019f  ffb7a000         push word ptr [bx + 0xa0]                
  048a:01a3  ffb79e00         push word ptr [bx + 0x9e]                
  048a:01a7  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  048a:01ac  83c404           add sp, 4                                
  048a:01af  8bde             mov bx, si                               
  048a:01b1  c1e302           shl bx, 2                                
  048a:01b4  8997b000         mov word ptr [bx + 0xb0], dx             
  048a:01b8  8987ae00         mov word ptr [bx + 0xae], ax             
  048a:01bc  46               inc si                                   
  048a:01bd  a0c800           mov al, byte ptr [0xc8]                  
  048a:01c0  b400             mov ah, 0                                
  048a:01c2  3bc6             cmp ax, si                               
  048a:01c4  7fd4             jg 0x19a                                 
  048a:01c6  c45e12           les bx, ptr [bp + 0x12]                  
  048a:01c9  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:01cd  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:01d1  7446             je 0x219                                 
  048a:01d3  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:01d9  753e             jne 0x219                                
  048a:01db  33ff             xor di, di                               
  048a:01dd  eb2d             jmp 0x20c                                
  048a:01df  8bc7             mov ax, di                               
  048a:01e1  c1e002           shl ax, 2                                
  048a:01e4  c45e12           les bx, ptr [bp + 0x12]                  
  048a:01e7  03d8             add bx, ax                               
  048a:01e9  26ff770c         push word ptr es:[bx + 0xc]              
  048a:01ed  26ff770a         push word ptr es:[bx + 0xa]              
  048a:01f1  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  048a:01f6  83c404           add sp, 4                                
  048a:01f9  8bdf             mov bx, di                               
  048a:01fb  c1e302           shl bx, 2                                
  048a:01fe  c47612           les si, ptr [bp + 0x12]                  
  048a:0201  03f3             add si, bx                               
  048a:0203  2689541c         mov word ptr es:[si + 0x1c], dx          
  048a:0207  2689441a         mov word ptr es:[si + 0x1a], ax          
  048a:020b  47               inc di                                   
  048a:020c  c45e12           les bx, ptr [bp + 0x12]                  
  048a:020f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:0213  b400             mov ah, 0                                
  048a:0215  3bc7             cmp ax, di                               
  048a:0217  7fc6             jg 0x1df                                 
  048a:0219  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:021c  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:0220  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:0224  7446             je 0x26c                                 
  048a:0226  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:022c  753e             jne 0x26c                                
  048a:022e  33ff             xor di, di                               
  048a:0230  eb2d             jmp 0x25f                                
  048a:0232  8bc7             mov ax, di                               
  048a:0234  c1e002           shl ax, 2                                
  048a:0237  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:023a  03d8             add bx, ax                               
  048a:023c  26ff770c         push word ptr es:[bx + 0xc]              
  048a:0240  26ff770a         push word ptr es:[bx + 0xa]              
  048a:0244  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  048a:0249  83c404           add sp, 4                                
  048a:024c  8bdf             mov bx, di                               
  048a:024e  c1e302           shl bx, 2                                
  048a:0251  c4760e           les si, ptr [bp + 0xe]                   
  048a:0254  03f3             add si, bx                               
  048a:0256  2689541c         mov word ptr es:[si + 0x1c], dx          
  048a:025a  2689441a         mov word ptr es:[si + 0x1a], ax          
  048a:025e  47               inc di                                   
  048a:025f  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:0262  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:0266  b400             mov ah, 0                                
  048a:0268  3bc7             cmp ax, di                               
  048a:026a  7fc6             jg 0x232                                 
  048a:026c  6a00             push 0                                   
  048a:026e  6a00             push 0                                   
  048a:0270  1e               push ds                                  
  048a:0271  689400           push 0x94                                
  048a:0274  ff76f6           push word ptr [bp - 0xa]                 
  048a:0277  ff76f8           push word ptr [bp - 8]                   
  048a:027a  6a00             push 0                                   
  048a:027c  6a00             push 0                                   
  048a:027e  ff7610           push word ptr [bp + 0x10]                
  048a:0281  ff760e           push word ptr [bp + 0xe]                 
  048a:0284  ff1ef615         lcall [0x15f6]                           
  048a:0288  83c414           add sp, 0x14                             
  048a:028b  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:028e  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0292  26ff7704         push word ptr es:[bx + 4]                
  048a:0296  ff7614           push word ptr [bp + 0x14]                
  048a:0299  ff7612           push word ptr [bp + 0x12]                
  048a:029c  1e               push ds                                  
  048a:029d  689400           push 0x94                                
  048a:02a0  16               push ss                                  
  048a:02a1  8d46fa           lea ax, [bp - 6]                         
  048a:02a4  50               push ax                                  
  048a:02a5  9ad000c30b       lcall 0xbc3, 0xd0                        -> 0bc3:00d0 [reloc]
  048a:02aa  83c40e           add sp, 0xe                              
  048a:02ad  c45e12           les bx, ptr [bp + 0x12]                  
  048a:02b0  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:02b4  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:02b8  7434             je 0x2ee                                 
  048a:02ba  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:02c0  752c             jne 0x2ee                                
  048a:02c2  33f6             xor si, si                               
  048a:02c4  eb1b             jmp 0x2e1                                
  048a:02c6  8bc6             mov ax, si                               
  048a:02c8  c1e002           shl ax, 2                                
  048a:02cb  c45e12           les bx, ptr [bp + 0x12]                  
  048a:02ce  03d8             add bx, ax                               
  048a:02d0  26ff770c         push word ptr es:[bx + 0xc]              
  048a:02d4  26ff770a         push word ptr es:[bx + 0xa]              
  048a:02d8  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  048a:02dd  83c404           add sp, 4                                
  048a:02e0  46               inc si                                   
  048a:02e1  c45e12           les bx, ptr [bp + 0x12]                  
  048a:02e4  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:02e8  b400             mov ah, 0                                
  048a:02ea  3bc6             cmp ax, si                               
  048a:02ec  7fd8             jg 0x2c6                                 
  048a:02ee  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:02f1  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:02f5  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:02f9  7434             je 0x32f                                 
  048a:02fb  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:0301  752c             jne 0x32f                                
  048a:0303  33f6             xor si, si                               
  048a:0305  eb1b             jmp 0x322                                
  048a:0307  8bc6             mov ax, si                               
  048a:0309  c1e002           shl ax, 2                                
  048a:030c  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:030f  03d8             add bx, ax                               
  048a:0311  26ff770c         push word ptr es:[bx + 0xc]              
  048a:0315  26ff770a         push word ptr es:[bx + 0xa]              
  048a:0319  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  048a:031e  83c404           add sp, 4                                
  048a:0321  46               inc si                                   
  048a:0322  c45e0e           les bx, ptr [bp + 0xe]                   
  048a:0325  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:0329  b400             mov ah, 0                                
  048a:032b  3bc6             cmp ax, si                               
  048a:032d  7fd8             jg 0x307                                 
  048a:032f  1e               push ds                                  
  048a:0330  689400           push 0x94                                
  048a:0333  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  048a:0338  83c404           add sp, 4                                
  048a:033b  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:033e  268b7f0f         mov di, word ptr es:[bx + 0xf]           
  048a:0342  6a00             push 0                                   
  048a:0344  6a00             push 0                                   
  048a:0346  6a20             push 0x20                                
  048a:0348  8bc7             mov ax, di                               
  048a:034a  6bc02a           imul ax, ax, 0x2a                        
  048a:034d  6a00             push 0                                   
  048a:034f  50               push ax                                  
  048a:0350  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  048a:0355  83c40a           add sp, 0xa                              
  048a:0358  52               push dx                                  
  048a:0359  50               push ax                                  
  048a:035a  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  048a:035f  83c404           add sp, 4                                
  048a:0362  8956fe           mov word ptr [bp - 2], dx                
  048a:0365  8946fc           mov word ptr [bp - 4], ax                
  048a:0368  33f6             xor si, si                               
  048a:036a  e98400           jmp 0x3f1                                
  048a:036d  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:0370  26ff770d         push word ptr es:[bx + 0xd]              
  048a:0374  26ff7702         push word ptr es:[bx + 2]                
  048a:0378  8bc6             mov ax, si                               
  048a:037a  26f76f0d         imul word ptr es:[bx + 0xd]              
  048a:037e  50               push ax                                  
  048a:037f  6a00             push 0                                   
  048a:0381  16               push ss                                  
  048a:0382  8d46ee           lea ax, [bp - 0x12]                      
  048a:0385  50               push ax                                  
  048a:0386  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  048a:038b  83c40c           add sp, 0xc                              
  048a:038e  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:0391  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0395  8bc6             mov ax, si                               
  048a:0397  6bc006           imul ax, ax, 6                           
  048a:039a  03d8             add bx, ax                               
  048a:039c  26ff7704         push word ptr es:[bx + 4]                
  048a:03a0  6a00             push 0                                   
  048a:03a2  c45e0a           les bx, ptr [bp + 0xa]                   
  048a:03a5  268a4708         mov al, byte ptr es:[bx + 8]             
  048a:03a9  50               push ax                                  
  048a:03aa  26ff7717         push word ptr es:[bx + 0x17]             
  048a:03ae  26ff7715         push word ptr es:[bx + 0x15]             
  048a:03b2  26ff7713         push word ptr es:[bx + 0x13]             
  048a:03b6  26ff7711         push word ptr es:[bx + 0x11]             
  048a:03ba  268a4701         mov al, byte ptr es:[bx + 1]             
  048a:03be  260207           add al, byte ptr es:[bx]                 
  048a:03c1  fec8             dec al                                   
  048a:03c3  50               push ax                                  
  048a:03c4  268a4701         mov al, byte ptr es:[bx + 1]             
  048a:03c8  50               push ax                                  
  048a:03c9  16               push ss                                  
  048a:03ca  8d46ee           lea ax, [bp - 0x12]                      
  048a:03cd  50               push ax                                  
  048a:03ce  ff7614           push word ptr [bp + 0x14]                
  048a:03d1  ff7612           push word ptr [bp + 0x12]                
  048a:03d4  ff7610           push word ptr [bp + 0x10]                
  048a:03d7  ff760e           push word ptr [bp + 0xe]                 
  048a:03da  8bc6             mov ax, si                               
  048a:03dc  6bc02a           imul ax, ax, 0x2a                        
  048a:03df  8b56fc           mov dx, word ptr [bp - 4]                
  048a:03e2  03d0             add dx, ax                               
  048a:03e4  ff76fe           push word ptr [bp - 2]                   
  048a:03e7  52               push dx                                  
  048a:03e8  9a0200e809       lcall 0x9e8, 2                           -> 09e8:0002 [reloc]
  048a:03ed  83c422           add sp, 0x22                             
  048a:03f0  46               inc si                                   
  048a:03f1  3bf7             cmp si, di                               
  048a:03f3  7d03             jge 0x3f8                                
  048a:03f5  e975ff           jmp 0x36d                                
  048a:03f8  c45e16           les bx, ptr [bp + 0x16]                  
  048a:03fb  8b46fe           mov ax, word ptr [bp - 2]                
  048a:03fe  8b56fc           mov dx, word ptr [bp - 4]                
  048a:0401  26894702         mov word ptr es:[bx + 2], ax             
  048a:0405  268917           mov word ptr es:[bx], dx                 
  048a:0408  5f               pop di                                   
  048a:0409  5e               pop si                                   
  048a:040a  c9               leave                                    
  048a:040b  cb               retf                                     
  048a:040c  c8ca0000         enter 0xca, 0                            
  048a:0410  56               push si                                  
  048a:0411  57               push di                                  
  048a:0412  ff7610           push word ptr [bp + 0x10]                
  048a:0415  ff760e           push word ptr [bp + 0xe]                 
  048a:0418  16               push ss                                  
  048a:0419  8d8636ff         lea ax, [bp - 0xca]                      
  048a:041d  50               push ax                                  
  048a:041e  9a9c460000       lcall 0, 0x469c                          -> 0000:469c [reloc]
  048a:0423  83c408           add sp, 8                                
  048a:0426  ff7614           push word ptr [bp + 0x14]                
  048a:0429  ff7612           push word ptr [bp + 0x12]                
  048a:042c  16               push ss                                  
  048a:042d  8d8636ff         lea ax, [bp - 0xca]                      
  048a:0431  50               push ax                                  
  048a:0432  9a5d460000       lcall 0, 0x465d                          -> 0000:465d [reloc]
  048a:0437  83c408           add sp, 8                                
  048a:043a  6a02             push 2                                   
  048a:043c  16               push ss                                  
  048a:043d  8d8636ff         lea ax, [bp - 0xca]                      
  048a:0441  50               push ax                                  
  048a:0442  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  048a:0447  83c406           add sp, 6                                
  048a:044a  8bf0             mov si, ax                               
  048a:044c  3dffff           cmp ax, 0xffff                           
  048a:044f  7505             jne 0x456                                
  048a:0451  33c0             xor ax, ax                               
  048a:0453  e91202           jmp 0x668                                
  048a:0456  bf0100           mov di, 1                                
  048a:0459  57               push di                                  
  048a:045a  16               push ss                                  
  048a:045b  8d46fe           lea ax, [bp - 2]                         
  048a:045e  50               push ax                                  
  048a:045f  56               push si                                  
  048a:0460  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0465  83c408           add sp, 8                                
  048a:0468  c45e06           les bx, ptr [bp + 6]                     
  048a:046b  8a46fe           mov al, byte ptr [bp - 2]                
  048a:046e  268807           mov byte ptr es:[bx], al                 
  048a:0471  6a00             push 0                                   
  048a:0473  6a00             push 0                                   
  048a:0475  6a20             push 0x20                                
  048a:0477  b400             mov ah, 0                                
  048a:0479  6a00             push 0                                   
  048a:047b  50               push ax                                  
  048a:047c  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  048a:0481  83c40a           add sp, 0xa                              
  048a:0484  52               push dx                                  
  048a:0485  50               push ax                                  
  048a:0486  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  048a:048b  83c404           add sp, 4                                
  048a:048e  c45e06           les bx, ptr [bp + 6]                     
  048a:0491  26895713         mov word ptr es:[bx + 0x13], dx          
  048a:0495  26894711         mov word ptr es:[bx + 0x11], ax          
  048a:0499  268b4711         mov ax, word ptr es:[bx + 0x11]          
  048a:049d  260b4713         or ax, word ptr es:[bx + 0x13]           
  048a:04a1  7509             jne 0x4ac                                
  048a:04a3  56               push si                                  
  048a:04a4  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  048a:04a9  59               pop cx                                   
  048a:04aa  eba5             jmp 0x451                                
  048a:04ac  6a00             push 0                                   
  048a:04ae  6a00             push 0                                   
  048a:04b0  6a20             push 0x20                                
  048a:04b2  8a46fe           mov al, byte ptr [bp - 2]                
  048a:04b5  b400             mov ah, 0                                
  048a:04b7  6a00             push 0                                   
  048a:04b9  50               push ax                                  
  048a:04ba  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  048a:04bf  83c40a           add sp, 0xa                              
  048a:04c2  52               push dx                                  
  048a:04c3  50               push ax                                  
  048a:04c4  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  048a:04c9  83c404           add sp, 4                                
  048a:04cc  c45e06           les bx, ptr [bp + 6]                     
  048a:04cf  26895717         mov word ptr es:[bx + 0x17], dx          
  048a:04d3  26894715         mov word ptr es:[bx + 0x15], ax          
  048a:04d7  268b4715         mov ax, word ptr es:[bx + 0x15]          
  048a:04db  260b4717         or ax, word ptr es:[bx + 0x17]           
  048a:04df  74c2             je 0x4a3                                 
  048a:04e1  bf0100           mov di, 1                                
  048a:04e4  57               push di                                  
  048a:04e5  16               push ss                                  
  048a:04e6  8d46ff           lea ax, [bp - 1]                         
  048a:04e9  50               push ax                                  
  048a:04ea  56               push si                                  
  048a:04eb  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:04f0  83c408           add sp, 8                                
  048a:04f3  c45e06           les bx, ptr [bp + 6]                     
  048a:04f6  8a46ff           mov al, byte ptr [bp - 1]                
  048a:04f9  26884701         mov byte ptr es:[bx + 1], al             
  048a:04fd  56               push si                                  
  048a:04fe  90               nop                                      
  048a:04ff  0e               push cs                                  
  048a:0500  e8ed06           call 0xbf0                               -> 048a:0bf0
  048a:0503  59               pop cx                                   
  048a:0504  c45e06           les bx, ptr [bp + 6]                     
  048a:0507  26894702         mov word ptr es:[bx + 2], ax             
  048a:050b  8b460c           mov ax, word ptr [bp + 0xc]              
  048a:050e  8b560a           mov dx, word ptr [bp + 0xa]              
  048a:0511  26894706         mov word ptr es:[bx + 6], ax             
  048a:0515  26895704         mov word ptr es:[bx + 4], dx             
  048a:0519  bf0100           mov di, 1                                
  048a:051c  57               push di                                  
  048a:051d  16               push ss                                  
  048a:051e  8d46ff           lea ax, [bp - 1]                         
  048a:0521  50               push ax                                  
  048a:0522  56               push si                                  
  048a:0523  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0528  83c408           add sp, 8                                
  048a:052b  c45e06           les bx, ptr [bp + 6]                     
  048a:052e  8a46ff           mov al, byte ptr [bp - 1]                
  048a:0531  26884708         mov byte ptr es:[bx + 8], al             
  048a:0535  bf0100           mov di, 1                                
  048a:0538  57               push di                                  
  048a:0539  16               push ss                                  
  048a:053a  8d46ff           lea ax, [bp - 1]                         
  048a:053d  50               push ax                                  
  048a:053e  56               push si                                  
  048a:053f  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0544  83c408           add sp, 8                                
  048a:0547  c45e06           les bx, ptr [bp + 6]                     
  048a:054a  8a46ff           mov al, byte ptr [bp - 1]                
  048a:054d  26884709         mov byte ptr es:[bx + 9], al             
  048a:0551  bf0100           mov di, 1                                
  048a:0554  57               push di                                  
  048a:0555  16               push ss                                  
  048a:0556  8d46ff           lea ax, [bp - 1]                         
  048a:0559  50               push ax                                  
  048a:055a  56               push si                                  
  048a:055b  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0560  83c408           add sp, 8                                
  048a:0563  c45e06           les bx, ptr [bp + 6]                     
  048a:0566  8a46ff           mov al, byte ptr [bp - 1]                
  048a:0569  2688470a         mov byte ptr es:[bx + 0xa], al           
  048a:056d  56               push si                                  
  048a:056e  90               nop                                      
  048a:056f  0e               push cs                                  
  048a:0570  e87d06           call 0xbf0                               -> 048a:0bf0
  048a:0573  59               pop cx                                   
  048a:0574  c45e06           les bx, ptr [bp + 6]                     
  048a:0577  2689470b         mov word ptr es:[bx + 0xb], ax           
  048a:057b  268a4708         mov al, byte ptr es:[bx + 8]             
  048a:057f  b400             mov ah, 0                                
  048a:0581  50               push ax                                  
  048a:0582  268b470b         mov ax, word ptr es:[bx + 0xb]           
  048a:0586  5a               pop dx                                   
  048a:0587  f7ea             imul dx                                  
  048a:0589  2689470d         mov word ptr es:[bx + 0xd], ax           
  048a:058d  56               push si                                  
  048a:058e  90               nop                                      
  048a:058f  0e               push cs                                  
  048a:0590  e85d06           call 0xbf0                               -> 048a:0bf0
  048a:0593  59               pop cx                                   
  048a:0594  c45e06           les bx, ptr [bp + 6]                     
  048a:0597  2689470f         mov word ptr es:[bx + 0xf], ax           
  048a:059b  268a07           mov al, byte ptr es:[bx]                 
  048a:059e  b400             mov ah, 0                                
  048a:05a0  8bf8             mov di, ax                               
  048a:05a2  50               push ax                                  
  048a:05a3  26ff7713         push word ptr es:[bx + 0x13]             
  048a:05a7  26ff7711         push word ptr es:[bx + 0x11]             
  048a:05ab  56               push si                                  
  048a:05ac  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:05b1  83c408           add sp, 8                                
  048a:05b4  57               push di                                  
  048a:05b5  c45e06           les bx, ptr [bp + 6]                     
  048a:05b8  26ff7717         push word ptr es:[bx + 0x17]             
  048a:05bc  26ff7715         push word ptr es:[bx + 0x15]             
  048a:05c0  56               push si                                  
  048a:05c1  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:05c6  83c408           add sp, 8                                
  048a:05c9  6a00             push 0                                   
  048a:05cb  6a00             push 0                                   
  048a:05cd  6a20             push 0x20                                
  048a:05cf  c45e06           les bx, ptr [bp + 6]                     
  048a:05d2  268b470f         mov ax, word ptr es:[bx + 0xf]           
  048a:05d6  6bc006           imul ax, ax, 6                           
  048a:05d9  6a00             push 0                                   
  048a:05db  50               push ax                                  
  048a:05dc  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  048a:05e1  83c40a           add sp, 0xa                              
  048a:05e4  52               push dx                                  
  048a:05e5  50               push ax                                  
  048a:05e6  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  048a:05eb  83c404           add sp, 4                                
  048a:05ee  c45e06           les bx, ptr [bp + 6]                     
  048a:05f1  2689571b         mov word ptr es:[bx + 0x1b], dx          
  048a:05f5  26894719         mov word ptr es:[bx + 0x19], ax          
  048a:05f9  268b4719         mov ax, word ptr es:[bx + 0x19]          
  048a:05fd  260b471b         or ax, word ptr es:[bx + 0x1b]           
  048a:0601  7503             jne 0x606                                
  048a:0603  e99dfe           jmp 0x4a3                                
  048a:0606  33ff             xor di, di                               
  048a:0608  eb4b             jmp 0x655                                
  048a:060a  56               push si                                  
  048a:060b  90               nop                                      
  048a:060c  0e               push cs                                  
  048a:060d  e8e005           call 0xbf0                               -> 048a:0bf0
  048a:0610  59               pop cx                                   
  048a:0611  c45e06           les bx, ptr [bp + 6]                     
  048a:0614  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0618  8bd7             mov dx, di                               
  048a:061a  6bd206           imul dx, dx, 6                           
  048a:061d  03da             add bx, dx                               
  048a:061f  268907           mov word ptr es:[bx], ax                 
  048a:0622  56               push si                                  
  048a:0623  90               nop                                      
  048a:0624  0e               push cs                                  
  048a:0625  e8c805           call 0xbf0                               -> 048a:0bf0
  048a:0628  59               pop cx                                   
  048a:0629  c45e06           les bx, ptr [bp + 6]                     
  048a:062c  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0630  8bd7             mov dx, di                               
  048a:0632  6bd206           imul dx, dx, 6                           
  048a:0635  03da             add bx, dx                               
  048a:0637  26894702         mov word ptr es:[bx + 2], ax             
  048a:063b  56               push si                                  
  048a:063c  90               nop                                      
  048a:063d  0e               push cs                                  
  048a:063e  e8af05           call 0xbf0                               -> 048a:0bf0
  048a:0641  59               pop cx                                   
  048a:0642  c45e06           les bx, ptr [bp + 6]                     
  048a:0645  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0649  8bd7             mov dx, di                               
  048a:064b  6bd206           imul dx, dx, 6                           
  048a:064e  03da             add bx, dx                               
  048a:0650  26894704         mov word ptr es:[bx + 4], ax             
  048a:0654  47               inc di                                   
  048a:0655  c45e06           les bx, ptr [bp + 6]                     
  048a:0658  26397f0f         cmp word ptr es:[bx + 0xf], di           
  048a:065c  7fac             jg 0x60a                                 
  048a:065e  56               push si                                  
  048a:065f  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  048a:0664  59               pop cx                                   
  048a:0665  b80100           mov ax, 1                                
  048a:0668  5f               pop di                                   
  048a:0669  5e               pop si                                   
  048a:066a  c9               leave                                    
  048a:066b  cb               retf                                     
  048a:066c  56               push si                                  
  048a:066d  33f6             xor si, si                               
  048a:066f  eb19             jmp 0x68a                                
  048a:0671  8bc6             mov ax, si                               
  048a:0673  6bc02a           imul ax, ax, 0x2a                        
  048a:0676  8b165c13         mov dx, word ptr [0x135c]                
  048a:067a  03d0             add dx, ax                               
  048a:067c  ff365e13         push word ptr [0x135e]                   
  048a:0680  52               push dx                                  
  048a:0681  9a930be809       lcall 0x9e8, 0xb93                       -> 09e8:0b93 [reloc]
  048a:0686  83c404           add sp, 4                                
  048a:0689  46               inc si                                   
  048a:068a  3b366f13         cmp si, word ptr [0x136f]                
  048a:068e  7ce1             jl 0x671                                 
  048a:0690  33f6             xor si, si                               
  048a:0692  eb19             jmp 0x6ad                                
  048a:0694  8bc6             mov ax, si                               
  048a:0696  6bc02a           imul ax, ax, 0x2a                        
  048a:0699  8b163b13         mov dx, word ptr [0x133b]                
  048a:069d  03d0             add dx, ax                               
  048a:069f  ff363d13         push word ptr [0x133d]                   
  048a:06a3  52               push dx                                  
  048a:06a4  9a930be809       lcall 0x9e8, 0xb93                       -> 09e8:0b93 [reloc]
  048a:06a9  83c404           add sp, 4                                
  048a:06ac  46               inc si                                   
  048a:06ad  3b364e13         cmp si, word ptr [0x134e]                
  048a:06b1  7ce1             jl 0x694                                 
  048a:06b3  33f6             xor si, si                               
  048a:06b5  eb19             jmp 0x6d0                                
  048a:06b7  8bc6             mov ax, si                               
  048a:06b9  6bc02a           imul ax, ax, 0x2a                        
  048a:06bc  8b161a13         mov dx, word ptr [0x131a]                
  048a:06c0  03d0             add dx, ax                               
  048a:06c2  ff361c13         push word ptr [0x131c]                   
  048a:06c6  52               push dx                                  
  048a:06c7  9a930be809       lcall 0x9e8, 0xb93                       -> 09e8:0b93 [reloc]
  048a:06cc  83c404           add sp, 4                                
  048a:06cf  46               inc si                                   
  048a:06d0  3b362d13         cmp si, word ptr [0x132d]                
  048a:06d4  7ce1             jl 0x6b7                                 
  048a:06d6  5e               pop si                                   
  048a:06d7  cb               retf                                     
  048a:06d8  c8140000         enter 0x14, 0                            
  048a:06dc  56               push si                                  
  048a:06dd  57               push di                                  
  048a:06de  8b7608           mov si, word ptr [bp + 8]                
  048a:06e1  8b7e0a           mov di, word ptr [bp + 0xa]              
  048a:06e4  8b4606           mov ax, word ptr [bp + 6]                
  048a:06e7  0bc0             or ax, ax                                
  048a:06e9  740c             je 0x6f7                                 
  048a:06eb  3d0100           cmp ax, 1                                
  048a:06ee  7422             je 0x712                                 
  048a:06f0  3d0200           cmp ax, 2                                
  048a:06f3  7438             je 0x72d                                 
  048a:06f5  eb4f             jmp 0x746                                
  048a:06f7  8c5efe           mov word ptr [bp - 2], ds                
  048a:06fa  c746fc6013       mov word ptr [bp - 4], 0x1360            
  048a:06ff  a15e13           mov ax, word ptr [0x135e]                
  048a:0702  8b165c13         mov dx, word ptr [0x135c]                
  048a:0706  8946fa           mov word ptr [bp - 6], ax                
  048a:0709  8956f8           mov word ptr [bp - 8], dx                
  048a:070c  8b166f13         mov dx, word ptr [0x136f]                
  048a:0710  eb34             jmp 0x746                                
  048a:0712  8c5efe           mov word ptr [bp - 2], ds                
  048a:0715  c746fc3f13       mov word ptr [bp - 4], 0x133f            
  048a:071a  a13d13           mov ax, word ptr [0x133d]                
  048a:071d  8b163b13         mov dx, word ptr [0x133b]                
  048a:0721  8946fa           mov word ptr [bp - 6], ax                
  048a:0724  8956f8           mov word ptr [bp - 8], dx                
  048a:0727  8b164e13         mov dx, word ptr [0x134e]                
  048a:072b  eb19             jmp 0x746                                
  048a:072d  8c5efe           mov word ptr [bp - 2], ds                
  048a:0730  c746fc1e13       mov word ptr [bp - 4], 0x131e            
  048a:0735  a11c13           mov ax, word ptr [0x131c]                
  048a:0738  8b161a13         mov dx, word ptr [0x131a]                
  048a:073c  8946fa           mov word ptr [bp - 6], ax                
  048a:073f  8956f8           mov word ptr [bp - 8], dx                
  048a:0742  8b162d13         mov dx, word ptr [0x132d]                
  048a:0746  c746f40000       mov word ptr [bp - 0xc], 0               
  048a:074b  33c9             xor cx, cx                               
  048a:074d  eb44             jmp 0x793                                
  048a:074f  c45efc           les bx, ptr [bp - 4]                     
  048a:0752  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0756  8bc1             mov ax, cx                               
  048a:0758  6bc006           imul ax, ax, 6                           
  048a:075b  03d8             add bx, ax                               
  048a:075d  263937           cmp word ptr es:[bx], si                 
  048a:0760  7530             jne 0x792                                
  048a:0762  c45efc           les bx, ptr [bp - 4]                     
  048a:0765  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:0769  8bc1             mov ax, cx                               
  048a:076b  6bc006           imul ax, ax, 6                           
  048a:076e  03d8             add bx, ax                               
  048a:0770  26397f02         cmp word ptr es:[bx + 2], di             
  048a:0774  751c             jne 0x792                                
  048a:0776  c45efc           les bx, ptr [bp - 4]                     
  048a:0779  26c45f19         les bx, ptr es:[bx + 0x19]               
  048a:077d  8bc1             mov ax, cx                               
  048a:077f  6bc006           imul ax, ax, 6                           
  048a:0782  03d8             add bx, ax                               
  048a:0784  268b4704         mov ax, word ptr es:[bx + 4]             
  048a:0788  3b460c           cmp ax, word ptr [bp + 0xc]              
  048a:078b  7505             jne 0x792                                
  048a:078d  c746f40100       mov word ptr [bp - 0xc], 1               
  048a:0792  41               inc cx                                   
  048a:0793  837ef400         cmp word ptr [bp - 0xc], 0               
  048a:0797  7504             jne 0x79d                                
  048a:0799  3bca             cmp cx, dx                               
  048a:079b  7cb2             jl 0x74f                                 
  048a:079d  837ef400         cmp word ptr [bp - 0xc], 0               
  048a:07a1  741b             je 0x7be                                 
  048a:07a3  b89d10           mov ax, 0x109d                            [reloc]
  048a:07a6  8b56fa           mov dx, word ptr [bp - 6]                
  048a:07a9  8b5ef8           mov bx, word ptr [bp - 8]                
  048a:07ac  8ec0             mov es, ax                               
  048a:07ae  2689160200       mov word ptr es:[2], dx                  
  048a:07b3  26891e0000       mov word ptr es:[0], bx                  
  048a:07b8  49               dec cx                                   
  048a:07b9  8bc1             mov ax, cx                               
  048a:07bb  e9a900           jmp 0x867                                
  048a:07be  8bc2             mov ax, dx                               
  048a:07c0  48               dec ax                                   
  048a:07c1  8946f6           mov word ptr [bp - 0xa], ax              
  048a:07c4  c45efc           les bx, ptr [bp - 4]                     
  048a:07c7  268b471b         mov ax, word ptr es:[bx + 0x1b]          
  048a:07cb  268b5719         mov dx, word ptr es:[bx + 0x19]          
  048a:07cf  8946f2           mov word ptr [bp - 0xe], ax              
  048a:07d2  8956f0           mov word ptr [bp - 0x10], dx             
  048a:07d5  8b5ef6           mov bx, word ptr [bp - 0xa]              
  048a:07d8  6bdb06           imul bx, bx, 6                           
  048a:07db  03d3             add dx, bx                               
  048a:07dd  8946ee           mov word ptr [bp - 0x12], ax             
  048a:07e0  8956ec           mov word ptr [bp - 0x14], dx             
  048a:07e3  c45eec           les bx, ptr [bp - 0x14]                  
  048a:07e6  263937           cmp word ptr es:[bx], si                 
  048a:07e9  7418             je 0x803                                 
  048a:07eb  268937           mov word ptr es:[bx], si                 
  048a:07ee  56               push si                                  
  048a:07ef  c45ef0           les bx, ptr [bp - 0x10]                  
  048a:07f2  26ff37           push word ptr es:[bx]                    
  048a:07f5  ff76fe           push word ptr [bp - 2]                   
  048a:07f8  ff76fc           push word ptr [bp - 4]                   
  048a:07fb  90               nop                                      
  048a:07fc  0e               push cs                                  
  048a:07fd  e87f00           call 0x87f                               -> 048a:087f
  048a:0800  83c408           add sp, 8                                
  048a:0803  c45eec           les bx, ptr [bp - 0x14]                  
  048a:0806  26397f02         cmp word ptr es:[bx + 2], di             
  048a:080a  741a             je 0x826                                 
  048a:080c  26897f02         mov word ptr es:[bx + 2], di             
  048a:0810  57               push di                                  
  048a:0811  c45ef0           les bx, ptr [bp - 0x10]                  
  048a:0814  26ff7702         push word ptr es:[bx + 2]                
  048a:0818  ff76fe           push word ptr [bp - 2]                   
  048a:081b  ff76fc           push word ptr [bp - 4]                   
  048a:081e  90               nop                                      
  048a:081f  0e               push cs                                  
  048a:0820  e85c00           call 0x87f                               -> 048a:087f
  048a:0823  83c408           add sp, 8                                
  048a:0826  c45eec           les bx, ptr [bp - 0x14]                  
  048a:0829  268b4704         mov ax, word ptr es:[bx + 4]             
  048a:082d  3b460c           cmp ax, word ptr [bp + 0xc]              
  048a:0830  741d             je 0x84f                                 
  048a:0832  8b460c           mov ax, word ptr [bp + 0xc]              
  048a:0835  26894704         mov word ptr es:[bx + 4], ax             
  048a:0839  50               push ax                                  
  048a:083a  c45ef0           les bx, ptr [bp - 0x10]                  
  048a:083d  26ff7704         push word ptr es:[bx + 4]                
  048a:0841  ff76fe           push word ptr [bp - 2]                   
  048a:0844  ff76fc           push word ptr [bp - 4]                   
  048a:0847  90               nop                                      
  048a:0848  0e               push cs                                  
  048a:0849  e83300           call 0x87f                               -> 048a:087f
  048a:084c  83c408           add sp, 8                                
  048a:084f  b89d10           mov ax, 0x109d                            [reloc]
  048a:0852  8b56fa           mov dx, word ptr [bp - 6]                
  048a:0855  8b5ef8           mov bx, word ptr [bp - 8]                
  048a:0858  8ec0             mov es, ax                               
  048a:085a  2689160200       mov word ptr es:[2], dx                  
  048a:085f  26891e0000       mov word ptr es:[0], bx                  
  048a:0864  8b46f6           mov ax, word ptr [bp - 0xa]              
  048a:0867  6bc02a           imul ax, ax, 0x2a                        
  048a:086a  8b56f8           mov dx, word ptr [bp - 8]                
  048a:086d  03d0             add dx, ax                               
  048a:086f  ff76fa           push word ptr [bp - 6]                   
  048a:0872  52               push dx                                  
  048a:0873  9aec01560b       lcall 0xb56, 0x1ec                       -> 0b56:01ec [reloc]
  048a:0878  83c404           add sp, 4                                
  048a:087b  5f               pop di                                   
  048a:087c  5e               pop si                                   
  048a:087d  c9               leave                                    
  048a:087e  cb               retf                                     
  048a:087f  c83a0000         enter 0x3a, 0                            
  048a:0883  56               push si                                  
  048a:0884  57               push di                                  
  048a:0885  8b4e0a           mov cx, word ptr [bp + 0xa]              
  048a:0888  8b760c           mov si, word ptr [bp + 0xc]              
  048a:088b  c45e06           les bx, ptr [bp + 6]                     
  048a:088e  268b4706         mov ax, word ptr es:[bx + 6]             
  048a:0892  268b5704         mov dx, word ptr es:[bx + 4]             
  048a:0896  8946fe           mov word ptr [bp - 2], ax                
  048a:0899  8956fc           mov word ptr [bp - 4], dx                
  048a:089c  c746f20000       mov word ptr [bp - 0xe], 0               
  048a:08a1  268b470d         mov ax, word ptr es:[bx + 0xd]           
  048a:08a5  8946f0           mov word ptr [bp - 0x10], ax             
  048a:08a8  268b470f         mov ax, word ptr es:[bx + 0xf]           
  048a:08ac  48               dec ax                                   
  048a:08ad  26f76f0d         imul word ptr es:[bx + 0xd]              
  048a:08b1  8946ee           mov word ptr [bp - 0x12], ax             
  048a:08b4  8bc1             mov ax, cx                               
  048a:08b6  250100           and ax, 1                                
  048a:08b9  8946ec           mov word ptr [bp - 0x14], ax             
  048a:08bc  8bc1             mov ax, cx                               
  048a:08be  250200           and ax, 2                                
  048a:08c1  8946ea           mov word ptr [bp - 0x16], ax             
  048a:08c4  8bc1             mov ax, cx                               
  048a:08c6  250400           and ax, 4                                
  048a:08c9  8946e8           mov word ptr [bp - 0x18], ax             
  048a:08cc  8bc1             mov ax, cx                               
  048a:08ce  250800           and ax, 8                                
  048a:08d1  8946e6           mov word ptr [bp - 0x1a], ax             
  048a:08d4  f7c60100         test si, 1                               
  048a:08d8  7405             je 0x8df                                 
  048a:08da  b8ffff           mov ax, 0xffff                           
  048a:08dd  eb02             jmp 0x8e1                                
  048a:08df  33c0             xor ax, ax                               
  048a:08e1  8946f4           mov word ptr [bp - 0xc], ax              
  048a:08e4  f7c60200         test si, 2                               
  048a:08e8  7405             je 0x8ef                                 
  048a:08ea  b8ffff           mov ax, 0xffff                           
  048a:08ed  eb02             jmp 0x8f1                                
  048a:08ef  33c0             xor ax, ax                               
  048a:08f1  8946f6           mov word ptr [bp - 0xa], ax              
  048a:08f4  f7c60400         test si, 4                               
  048a:08f8  7405             je 0x8ff                                 
  048a:08fa  b8ffff           mov ax, 0xffff                           
  048a:08fd  eb02             jmp 0x901                                
  048a:08ff  33c0             xor ax, ax                               
  048a:0901  8946f8           mov word ptr [bp - 8], ax                
  048a:0904  f7c60800         test si, 8                               
  048a:0908  7405             je 0x90f                                 
  048a:090a  b8ffff           mov ax, 0xffff                           
  048a:090d  eb02             jmp 0x911                                
  048a:090f  33c0             xor ax, ax                               
  048a:0911  8946fa           mov word ptr [bp - 6], ax                
  048a:0914  c45efc           les bx, ptr [bp - 4]                     
  048a:0917  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:091b  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:091f  7446             je 0x967                                 
  048a:0921  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:0927  753e             jne 0x967                                
  048a:0929  33ff             xor di, di                               
  048a:092b  eb2d             jmp 0x95a                                
  048a:092d  8bc7             mov ax, di                               
  048a:092f  c1e002           shl ax, 2                                
  048a:0932  c45efc           les bx, ptr [bp - 4]                     
  048a:0935  03d8             add bx, ax                               
  048a:0937  26ff770c         push word ptr es:[bx + 0xc]              
  048a:093b  26ff770a         push word ptr es:[bx + 0xa]              
  048a:093f  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  048a:0944  83c404           add sp, 4                                
  048a:0947  8bdf             mov bx, di                               
  048a:0949  c1e302           shl bx, 2                                
  048a:094c  c476fc           les si, ptr [bp - 4]                     
  048a:094f  03f3             add si, bx                               
  048a:0951  2689541c         mov word ptr es:[si + 0x1c], dx          
  048a:0955  2689441a         mov word ptr es:[si + 0x1a], ax          
  048a:0959  47               inc di                                   
  048a:095a  c45efc           les bx, ptr [bp - 4]                     
  048a:095d  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:0961  b400             mov ah, 0                                
  048a:0963  3bc7             cmp ax, di                               
  048a:0965  7fc6             jg 0x92d                                 
  048a:0967  33c9             xor cx, cx                               
  048a:0969  eb36             jmp 0x9a1                                
  048a:096b  8bc1             mov ax, cx                               
  048a:096d  c1e002           shl ax, 2                                
  048a:0970  c45efc           les bx, ptr [bp - 4]                     
  048a:0973  03d8             add bx, ax                               
  048a:0975  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  048a:0979  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  048a:097d  8b5efc           mov bx, word ptr [bp - 4]                
  048a:0980  50               push ax                                  
  048a:0981  268b4708         mov ax, word ptr es:[bx + 8]             
  048a:0985  52               push dx                                  
  048a:0986  f76ef2           imul word ptr [bp - 0xe]                 
  048a:0989  d1e0             shl ax, 1                                
  048a:098b  5a               pop dx                                   
  048a:098c  03d0             add dx, ax                               
  048a:098e  8bd9             mov bx, cx                               
  048a:0990  c1e302           shl bx, 2                                
  048a:0993  8d46d6           lea ax, [bp - 0x2a]                      
  048a:0996  03d8             add bx, ax                               
  048a:0998  58               pop ax                                   
  048a:0999  36894702         mov word ptr ss:[bx + 2], ax             
  048a:099d  368917           mov word ptr ss:[bx], dx                 
  048a:09a0  41               inc cx                                   
  048a:09a1  c45efc           les bx, ptr [bp - 4]                     
  048a:09a4  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:09a8  b400             mov ah, 0                                
  048a:09aa  3bc1             cmp ax, cx                               
  048a:09ac  7fbd             jg 0x96b                                 
  048a:09ae  33c9             xor cx, cx                               
  048a:09b0  eb36             jmp 0x9e8                                
  048a:09b2  8bc1             mov ax, cx                               
  048a:09b4  c1e002           shl ax, 2                                
  048a:09b7  c45efc           les bx, ptr [bp - 4]                     
  048a:09ba  03d8             add bx, ax                               
  048a:09bc  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  048a:09c0  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  048a:09c4  8b5efc           mov bx, word ptr [bp - 4]                
  048a:09c7  50               push ax                                  
  048a:09c8  268b4708         mov ax, word ptr es:[bx + 8]             
  048a:09cc  52               push dx                                  
  048a:09cd  f76eee           imul word ptr [bp - 0x12]                
  048a:09d0  d1e0             shl ax, 1                                
  048a:09d2  5a               pop dx                                   
  048a:09d3  03d0             add dx, ax                               
  048a:09d5  8bd9             mov bx, cx                               
  048a:09d7  c1e302           shl bx, 2                                
  048a:09da  8d46c6           lea ax, [bp - 0x3a]                      
  048a:09dd  03d8             add bx, ax                               
  048a:09df  58               pop ax                                   
  048a:09e0  36894702         mov word ptr ss:[bx + 2], ax             
  048a:09e4  368917           mov word ptr ss:[bx], dx                 
  048a:09e7  41               inc cx                                   
  048a:09e8  c45efc           les bx, ptr [bp - 4]                     
  048a:09eb  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:09ef  b400             mov ah, 0                                
  048a:09f1  3bc1             cmp ax, cx                               
  048a:09f3  7fbd             jg 0x9b2                                 
  048a:09f5  8b46f0           mov ax, word ptr [bp - 0x10]             
  048a:09f8  2b46f2           sub ax, word ptr [bp - 0xe]              
  048a:09fb  26f76f08         imul word ptr es:[bx + 8]                
  048a:09ff  8bf8             mov di, ax                               
  048a:0a01  e91c01           jmp 0xb20                                
  048a:0a04  837eec00         cmp word ptr [bp - 0x14], 0              
  048a:0a08  7404             je 0xa0e                                 
  048a:0a0a  33c0             xor ax, ax                               
  048a:0a0c  eb06             jmp 0xa14                                
  048a:0a0e  c45ed6           les bx, ptr [bp - 0x2a]                  
  048a:0a11  268b07           mov ax, word ptr es:[bx]                 
  048a:0a14  50               push ax                                  
  048a:0a15  837eea00         cmp word ptr [bp - 0x16], 0              
  048a:0a19  7404             je 0xa1f                                 
  048a:0a1b  33c0             xor ax, ax                               
  048a:0a1d  eb06             jmp 0xa25                                
  048a:0a1f  c45eda           les bx, ptr [bp - 0x26]                  
  048a:0a22  268b07           mov ax, word ptr es:[bx]                 
  048a:0a25  59               pop cx                                   
  048a:0a26  0bc8             or cx, ax                                
  048a:0a28  51               push cx                                  
  048a:0a29  837ee800         cmp word ptr [bp - 0x18], 0              
  048a:0a2d  7404             je 0xa33                                 
  048a:0a2f  33c0             xor ax, ax                               
  048a:0a31  eb06             jmp 0xa39                                
  048a:0a33  c45ede           les bx, ptr [bp - 0x22]                  
  048a:0a36  268b07           mov ax, word ptr es:[bx]                 
  048a:0a39  59               pop cx                                   
  048a:0a3a  0bc8             or cx, ax                                
  048a:0a3c  51               push cx                                  
  048a:0a3d  837ee600         cmp word ptr [bp - 0x1a], 0              
  048a:0a41  7404             je 0xa47                                 
  048a:0a43  33c0             xor ax, ax                               
  048a:0a45  eb06             jmp 0xa4d                                
  048a:0a47  c45ee2           les bx, ptr [bp - 0x1e]                  
  048a:0a4a  268b07           mov ax, word ptr es:[bx]                 
  048a:0a4d  59               pop cx                                   
  048a:0a4e  0bc8             or cx, ax                                
  048a:0a50  83f1ff           xor cx, 0xffff                           
  048a:0a53  51               push cx                                  
  048a:0a54  837eec00         cmp word ptr [bp - 0x14], 0              
  048a:0a58  7408             je 0xa62                                 
  048a:0a5a  c45ed6           les bx, ptr [bp - 0x2a]                  
  048a:0a5d  268b07           mov ax, word ptr es:[bx]                 
  048a:0a60  eb03             jmp 0xa65                                
  048a:0a62  b8ffff           mov ax, 0xffff                           
  048a:0a65  59               pop cx                                   
  048a:0a66  23c8             and cx, ax                               
  048a:0a68  51               push cx                                  
  048a:0a69  837eea00         cmp word ptr [bp - 0x16], 0              
  048a:0a6d  7408             je 0xa77                                 
  048a:0a6f  c45eda           les bx, ptr [bp - 0x26]                  
  048a:0a72  268b07           mov ax, word ptr es:[bx]                 
  048a:0a75  eb03             jmp 0xa7a                                
  048a:0a77  b8ffff           mov ax, 0xffff                           
  048a:0a7a  59               pop cx                                   
  048a:0a7b  23c8             and cx, ax                               
  048a:0a7d  51               push cx                                  
  048a:0a7e  837ee800         cmp word ptr [bp - 0x18], 0              
  048a:0a82  7408             je 0xa8c                                 
  048a:0a84  c45ede           les bx, ptr [bp - 0x22]                  
  048a:0a87  268b07           mov ax, word ptr es:[bx]                 
  048a:0a8a  eb03             jmp 0xa8f                                
  048a:0a8c  b8ffff           mov ax, 0xffff                           
  048a:0a8f  59               pop cx                                   
  048a:0a90  23c8             and cx, ax                               
  048a:0a92  51               push cx                                  
  048a:0a93  837ee600         cmp word ptr [bp - 0x1a], 0              
  048a:0a97  7408             je 0xaa1                                 
  048a:0a99  c45ee2           les bx, ptr [bp - 0x1e]                  
  048a:0a9c  268b07           mov ax, word ptr es:[bx]                 
  048a:0a9f  eb03             jmp 0xaa4                                
  048a:0aa1  b8ffff           mov ax, 0xffff                           
  048a:0aa4  59               pop cx                                   
  048a:0aa5  23c8             and cx, ax                               
  048a:0aa7  8bf1             mov si, cx                               
  048a:0aa9  83f6ff           xor si, 0xffff                           
  048a:0aac  8b46f4           mov ax, word ptr [bp - 0xc]              
  048a:0aaf  23c1             and ax, cx                               
  048a:0ab1  c45ec6           les bx, ptr [bp - 0x3a]                  
  048a:0ab4  268b17           mov dx, word ptr es:[bx]                 
  048a:0ab7  23d6             and dx, si                               
  048a:0ab9  0bc2             or ax, dx                                
  048a:0abb  8b5ec6           mov bx, word ptr [bp - 0x3a]             
  048a:0abe  8346c602         add word ptr [bp - 0x3a], 2              
  048a:0ac2  268907           mov word ptr es:[bx], ax                 
  048a:0ac5  8b46f6           mov ax, word ptr [bp - 0xa]              
  048a:0ac8  23c1             and ax, cx                               
  048a:0aca  c45eca           les bx, ptr [bp - 0x36]                  
  048a:0acd  268b17           mov dx, word ptr es:[bx]                 
  048a:0ad0  23d6             and dx, si                               
  048a:0ad2  0bc2             or ax, dx                                
  048a:0ad4  8b5eca           mov bx, word ptr [bp - 0x36]             
  048a:0ad7  8346ca02         add word ptr [bp - 0x36], 2              
  048a:0adb  268907           mov word ptr es:[bx], ax                 
  048a:0ade  8b46f8           mov ax, word ptr [bp - 8]                
  048a:0ae1  23c1             and ax, cx                               
  048a:0ae3  c45ece           les bx, ptr [bp - 0x32]                  
  048a:0ae6  268b17           mov dx, word ptr es:[bx]                 
  048a:0ae9  23d6             and dx, si                               
  048a:0aeb  0bc2             or ax, dx                                
  048a:0aed  8b5ece           mov bx, word ptr [bp - 0x32]             
  048a:0af0  8346ce02         add word ptr [bp - 0x32], 2              
  048a:0af4  268907           mov word ptr es:[bx], ax                 
  048a:0af7  8b46fa           mov ax, word ptr [bp - 6]                
  048a:0afa  23c1             and ax, cx                               
  048a:0afc  c45ed2           les bx, ptr [bp - 0x2e]                  
  048a:0aff  268b17           mov dx, word ptr es:[bx]                 
  048a:0b02  23d6             and dx, si                               
  048a:0b04  0bc2             or ax, dx                                
  048a:0b06  8b5ed2           mov bx, word ptr [bp - 0x2e]             
  048a:0b09  8346d202         add word ptr [bp - 0x2e], 2              
  048a:0b0d  268907           mov word ptr es:[bx], ax                 
  048a:0b10  8346d602         add word ptr [bp - 0x2a], 2              
  048a:0b14  8346da02         add word ptr [bp - 0x26], 2              
  048a:0b18  8346de02         add word ptr [bp - 0x22], 2              
  048a:0b1c  8346e202         add word ptr [bp - 0x1e], 2              
  048a:0b20  8bc7             mov ax, di                               
  048a:0b22  4f               dec di                                   
  048a:0b23  0bc0             or ax, ax                                
  048a:0b25  7403             je 0xb2a                                 
  048a:0b27  e9dafe           jmp 0xa04                                
  048a:0b2a  c45efc           les bx, ptr [bp - 4]                     
  048a:0b2d  268b470a         mov ax, word ptr es:[bx + 0xa]           
  048a:0b31  260b470c         or ax, word ptr es:[bx + 0xc]            
  048a:0b35  7434             je 0xb6b                                 
  048a:0b37  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  048a:0b3d  752c             jne 0xb6b                                
  048a:0b3f  33f6             xor si, si                               
  048a:0b41  eb1b             jmp 0xb5e                                
  048a:0b43  8bc6             mov ax, si                               
  048a:0b45  c1e002           shl ax, 2                                
  048a:0b48  c45efc           les bx, ptr [bp - 4]                     
  048a:0b4b  03d8             add bx, ax                               
  048a:0b4d  26ff770c         push word ptr es:[bx + 0xc]              
  048a:0b51  26ff770a         push word ptr es:[bx + 0xa]              
  048a:0b55  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  048a:0b5a  83c404           add sp, 4                                
  048a:0b5d  46               inc si                                   
  048a:0b5e  c45efc           les bx, ptr [bp - 4]                     
  048a:0b61  268a4734         mov al, byte ptr es:[bx + 0x34]          
  048a:0b65  b400             mov ah, 0                                
  048a:0b67  3bc6             cmp ax, si                               
  048a:0b69  7fd8             jg 0xb43                                 
  048a:0b6b  5f               pop di                                   
  048a:0b6c  5e               pop si                                   
  048a:0b6d  c9               leave                                    
  048a:0b6e  cb               retf                                     

proc_048a_0b6f:
  048a:0b6f  55               push bp                                  
  048a:0b70  8bec             mov bp, sp                               
  048a:0b72  8b4606           mov ax, word ptr [bp + 6]                
  048a:0b75  0bc0             or ax, ax                                
  048a:0b77  740c             je 0xb85                                 
  048a:0b79  3d0100           cmp ax, 1                                
  048a:0b7c  740e             je 0xb8c                                 
  048a:0b7e  3d0200           cmp ax, 2                                
  048a:0b81  740e             je 0xb91                                 
  048a:0b83  eb11             jmp 0xb96                                
  048a:0b85  a06813           mov al, byte ptr [0x1368]                
  048a:0b88  b400             mov ah, 0                                
  048a:0b8a  eb0c             jmp 0xb98                                
  048a:0b8c  a04713           mov al, byte ptr [0x1347]                
  048a:0b8f  ebf7             jmp 0xb88                                
  048a:0b91  a02613           mov al, byte ptr [0x1326]                
  048a:0b94  ebf2             jmp 0xb88                                
  048a:0b96  33c0             xor ax, ax                               
  048a:0b98  5d               pop bp                                   
  048a:0b99  cb               retf                                     

proc_048a_0b9a:
  048a:0b9a  55               push bp                                  
  048a:0b9b  8bec             mov bp, sp                               
  048a:0b9d  8b4606           mov ax, word ptr [bp + 6]                
  048a:0ba0  0bc0             or ax, ax                                
  048a:0ba2  740c             je 0xbb0                                 
  048a:0ba4  3d0100           cmp ax, 1                                
  048a:0ba7  740e             je 0xbb7                                 
  048a:0ba9  3d0200           cmp ax, 2                                
  048a:0bac  740e             je 0xbbc                                 
  048a:0bae  eb11             jmp 0xbc1                                
  048a:0bb0  a06913           mov al, byte ptr [0x1369]                
  048a:0bb3  b400             mov ah, 0                                
  048a:0bb5  eb0c             jmp 0xbc3                                
  048a:0bb7  a04813           mov al, byte ptr [0x1348]                
  048a:0bba  ebf7             jmp 0xbb3                                
  048a:0bbc  a02713           mov al, byte ptr [0x1327]                
  048a:0bbf  ebf2             jmp 0xbb3                                
  048a:0bc1  33c0             xor ax, ax                               
  048a:0bc3  5d               pop bp                                   
  048a:0bc4  cb               retf                                     

proc_048a_0bc5:
  048a:0bc5  55               push bp                                  
  048a:0bc6  8bec             mov bp, sp                               
  048a:0bc8  8b4606           mov ax, word ptr [bp + 6]                
  048a:0bcb  0bc0             or ax, ax                                
  048a:0bcd  740c             je 0xbdb                                 
  048a:0bcf  3d0100           cmp ax, 1                                
  048a:0bd2  740e             je 0xbe2                                 
  048a:0bd4  3d0200           cmp ax, 2                                
  048a:0bd7  740e             je 0xbe7                                 
  048a:0bd9  eb11             jmp 0xbec                                
  048a:0bdb  a06a13           mov al, byte ptr [0x136a]                
  048a:0bde  b400             mov ah, 0                                
  048a:0be0  eb0c             jmp 0xbee                                
  048a:0be2  a04913           mov al, byte ptr [0x1349]                
  048a:0be5  ebf7             jmp 0xbde                                
  048a:0be7  a02813           mov al, byte ptr [0x1328]                
  048a:0bea  ebf2             jmp 0xbde                                
  048a:0bec  33c0             xor ax, ax                               
  048a:0bee  5d               pop bp                                   
  048a:0bef  cb               retf                                     
  048a:0bf0  c8020000         enter 2, 0                               
  048a:0bf4  56               push si                                  
  048a:0bf5  57               push di                                  
  048a:0bf6  8b7606           mov si, word ptr [bp + 6]                
  048a:0bf9  bf0100           mov di, 1                                
  048a:0bfc  57               push di                                  
  048a:0bfd  16               push ss                                  
  048a:0bfe  8d46ff           lea ax, [bp - 1]                         
  048a:0c01  50               push ax                                  
  048a:0c02  56               push si                                  
  048a:0c03  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c08  83c408           add sp, 8                                
  048a:0c0b  57               push di                                  
  048a:0c0c  16               push ss                                  
  048a:0c0d  8d46fe           lea ax, [bp - 2]                         
  048a:0c10  50               push ax                                  
  048a:0c11  56               push si                                  
  048a:0c12  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c17  83c408           add sp, 8                                
  048a:0c1a  8b46fe           mov ax, word ptr [bp - 2]                
  048a:0c1d  5f               pop di                                   
  048a:0c1e  5e               pop si                                   
  048a:0c1f  c9               leave                                    
  048a:0c20  cb               retf                                     
  048a:0c21  c8040000         enter 4, 0                               
  048a:0c25  56               push si                                  
  048a:0c26  57               push di                                  
  048a:0c27  8b7606           mov si, word ptr [bp + 6]                
  048a:0c2a  bf0100           mov di, 1                                
  048a:0c2d  57               push di                                  
  048a:0c2e  16               push ss                                  
  048a:0c2f  8d46ff           lea ax, [bp - 1]                         
  048a:0c32  50               push ax                                  
  048a:0c33  56               push si                                  
  048a:0c34  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c39  83c408           add sp, 8                                
  048a:0c3c  57               push di                                  
  048a:0c3d  16               push ss                                  
  048a:0c3e  8d46fe           lea ax, [bp - 2]                         
  048a:0c41  50               push ax                                  
  048a:0c42  56               push si                                  
  048a:0c43  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c48  83c408           add sp, 8                                
  048a:0c4b  57               push di                                  
  048a:0c4c  16               push ss                                  
  048a:0c4d  8d46fd           lea ax, [bp - 3]                         
  048a:0c50  50               push ax                                  
  048a:0c51  56               push si                                  
  048a:0c52  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c57  83c408           add sp, 8                                
  048a:0c5a  57               push di                                  
  048a:0c5b  16               push ss                                  
  048a:0c5c  8d46fc           lea ax, [bp - 4]                         
  048a:0c5f  50               push ax                                  
  048a:0c60  56               push si                                  
  048a:0c61  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  048a:0c66  83c408           add sp, 8                                
  048a:0c69  8b56fe           mov dx, word ptr [bp - 2]                
  048a:0c6c  8b46fc           mov ax, word ptr [bp - 4]                
  048a:0c6f  5f               pop di                                   
