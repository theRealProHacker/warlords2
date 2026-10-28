; seg 09e8  img 0x9e80..0xaa30  file off 0xaa80
  09e8:0000  cb               retf                                     
  09e8:0001  cb               retf                                     
  09e8:0002  c8080000         enter 8, 0                               
  09e8:0006  56               push si                                  
  09e8:0007  57               push di                                  
  09e8:0008  66837e0600       cmp dword ptr [bp + 6], 0                
  09e8:000d  754f             jne 0x5e                                 
  09e8:000f  666a00           push 0                                   
  09e8:0012  6a20             push 0x20                                
  09e8:0014  666a2a           push 0x2a                                
  09e8:0017  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  09e8:001c  83c40a           add sp, 0xa                              
  09e8:001f  8956fa           mov word ptr [bp - 6], dx                
  09e8:0022  8946f8           mov word ptr [bp - 8], ax                
  09e8:0025  66837ef800       cmp dword ptr [bp - 8], 0                
  09e8:002a  7513             jne 0x3f                                 
  09e8:002c  1e               push ds                                  
  09e8:002d  686008           push 0x860                                ; "Font: Can't create font"
  09e8:0030  9a9900c30b       lcall 0xbc3, 0x99                        -> 0bc3:0099 [reloc]
  09e8:0035  83c404           add sp, 4                                
  09e8:0038  33d2             xor dx, dx                               
  09e8:003a  33c0             xor ax, ax                               
  09e8:003c  e9ae01           jmp 0x1ed                                
  09e8:003f  ff76fa           push word ptr [bp - 6]                   
  09e8:0042  ff76f8           push word ptr [bp - 8]                   
  09e8:0045  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  09e8:004a  83c404           add sp, 4                                
  09e8:004d  895608           mov word ptr [bp + 8], dx                
  09e8:0050  894606           mov word ptr [bp + 6], ax                
  09e8:0053  c45e06           les bx, ptr [bp + 6]                     
  09e8:0056  26c747260100     mov word ptr es:[bx + 0x26], 1           
  09e8:005c  eb09             jmp 0x67                                 
  09e8:005e  c45e06           les bx, ptr [bp + 6]                     
  09e8:0061  26c747260000     mov word ptr es:[bx + 0x26], 0           
  09e8:0067  c45e06           les bx, ptr [bp + 6]                     
  09e8:006a  8b4624           mov ax, word ptr [bp + 0x24]             
  09e8:006d  26094726         or word ptr es:[bx + 0x26], ax           
  09e8:0071  c45e06           les bx, ptr [bp + 6]                     
  09e8:0074  668b460a         mov eax, dword ptr [bp + 0xa]            
  09e8:0078  66268907         mov dword ptr es:[bx], eax               
  09e8:007c  c45e06           les bx, ptr [bp + 6]                     
  09e8:007f  668b460e         mov eax, dword ptr [bp + 0xe]            
  09e8:0083  6626894704       mov dword ptr es:[bx + 4], eax           
  09e8:0088  c45e06           les bx, ptr [bp + 6]                     
  09e8:008b  668b461a         mov eax, dword ptr [bp + 0x1a]           
  09e8:008f  6626894714       mov dword ptr es:[bx + 0x14], eax        
  09e8:0094  c45e06           les bx, ptr [bp + 6]                     
  09e8:0097  668b461e         mov eax, dword ptr [bp + 0x1e]           
  09e8:009b  6626894718       mov dword ptr es:[bx + 0x18], eax        
  09e8:00a0  8a4622           mov al, byte ptr [bp + 0x22]             
  09e8:00a3  b400             mov ah, 0                                
  09e8:00a5  c45e06           les bx, ptr [bp + 6]                     
  09e8:00a8  26894724         mov word ptr es:[bx + 0x24], ax          
  09e8:00ac  8a4616           mov al, byte ptr [bp + 0x16]             
  09e8:00af  98               cwde                                     
  09e8:00b0  c45e06           les bx, ptr [bp + 6]                     
  09e8:00b3  26894710         mov word ptr es:[bx + 0x10], ax          
  09e8:00b7  8a4618           mov al, byte ptr [bp + 0x18]             
  09e8:00ba  98               cwde                                     
  09e8:00bb  c45e06           les bx, ptr [bp + 6]                     
  09e8:00be  26894712         mov word ptr es:[bx + 0x12], ax          
  09e8:00c2  c45e06           les bx, ptr [bp + 6]                     
  09e8:00c5  8b4626           mov ax, word ptr [bp + 0x26]             
  09e8:00c8  26894728         mov word ptr es:[bx + 0x28], ax          
  09e8:00cc  8b4606           mov ax, word ptr [bp + 6]                
  09e8:00cf  050800           add ax, 8                                
  09e8:00d2  ff7608           push word ptr [bp + 8]                   
  09e8:00d5  50               push ax                                  
  09e8:00d6  ff7614           push word ptr [bp + 0x14]                
  09e8:00d9  ff7612           push word ptr [bp + 0x12]                
  09e8:00dc  b90800           mov cx, 8                                
  09e8:00df  9a6b1c0000       lcall 0, 0x1c6b                          -> 0000:1c6b [reloc]
  09e8:00e4  c45e12           les bx, ptr [bp + 0x12]                  
  09e8:00e7  268b3f           mov di, word ptr es:[bx]                 
  09e8:00ea  c45e12           les bx, ptr [bp + 0x12]                  
  09e8:00ed  268b4702         mov ax, word ptr es:[bx + 2]             
  09e8:00f1  8946fc           mov word ptr [bp - 4], ax                
  09e8:00f4  666a00           push 0                                   
  09e8:00f7  6a20             push 0x20                                
  09e8:00f9  6668c0000000     push 0xc0                                
  09e8:00ff  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  09e8:0104  83c40a           add sp, 0xa                              
  09e8:0107  8956fa           mov word ptr [bp - 6], dx                
  09e8:010a  8946f8           mov word ptr [bp - 8], ax                
  09e8:010d  ff76fa           push word ptr [bp - 6]                   
  09e8:0110  ff76f8           push word ptr [bp - 8]                   
  09e8:0113  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  09e8:0118  83c404           add sp, 4                                
  09e8:011b  c45e06           les bx, ptr [bp + 6]                     
  09e8:011e  2689571e         mov word ptr es:[bx + 0x1e], dx          
  09e8:0122  2689471c         mov word ptr es:[bx + 0x1c], ax          
  09e8:0126  666a00           push 0                                   
  09e8:0129  6a20             push 0x20                                
  09e8:012b  6668c0000000     push 0xc0                                
  09e8:0131  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  09e8:0136  83c40a           add sp, 0xa                              
  09e8:0139  8956fa           mov word ptr [bp - 6], dx                
  09e8:013c  8946f8           mov word ptr [bp - 8], ax                
  09e8:013f  ff76fa           push word ptr [bp - 6]                   
  09e8:0142  ff76f8           push word ptr [bp - 8]                   
  09e8:0145  9a5707870c       lcall 0xc87, 0x757                       -> 0c87:0757 [reloc]
  09e8:014a  83c404           add sp, 4                                
  09e8:014d  c45e06           les bx, ptr [bp + 6]                     
  09e8:0150  26895722         mov word ptr es:[bx + 0x22], dx          
  09e8:0154  26894720         mov word ptr es:[bx + 0x20], ax          
  09e8:0158  33c9             xor cx, cx                               
  09e8:015a  e97f00           jmp 0x1dc                                
  09e8:015d  c45e1a           les bx, ptr [bp + 0x1a]                  
  09e8:0160  03d9             add bx, cx                               
  09e8:0162  268a07           mov al, byte ptr es:[bx]                 
  09e8:0165  b400             mov ah, 0                                
  09e8:0167  050700           add ax, 7                                
  09e8:016a  bb0800           mov bx, 8                                
  09e8:016d  99               cdq                                      
  09e8:016e  f7fb             idiv bx                                  
  09e8:0170  c1e003           shl ax, 3                                
  09e8:0173  8bd7             mov dx, di                               
  09e8:0175  03d0             add dx, ax                               
  09e8:0177  8956fe           mov word ptr [bp - 2], dx                
  09e8:017a  c45e12           les bx, ptr [bp + 0x12]                  
  09e8:017d  06               push es                                  
  09e8:017e  c47612           les si, ptr [bp + 0x12]                  
  09e8:0181  268b04           mov ax, word ptr es:[si]                 
  09e8:0184  07               pop es                                   
  09e8:0185  26034704         add ax, word ptr es:[bx + 4]             
  09e8:0189  3b46fe           cmp ax, word ptr [bp - 2]                
  09e8:018c  7d27             jge 0x1b5                                
  09e8:018e  c45e12           les bx, ptr [bp + 0x12]                  
  09e8:0191  268b3f           mov di, word ptr es:[bx]                 
  09e8:0194  c45e1a           les bx, ptr [bp + 0x1a]                  
  09e8:0197  03d9             add bx, cx                               
  09e8:0199  268a07           mov al, byte ptr es:[bx]                 
  09e8:019c  b400             mov ah, 0                                
  09e8:019e  050700           add ax, 7                                
  09e8:01a1  bb0800           mov bx, 8                                
  09e8:01a4  99               cdq                                      
  09e8:01a5  f7fb             idiv bx                                  
  09e8:01a7  c1e003           shl ax, 3                                
  09e8:01aa  8946fe           mov word ptr [bp - 2], ax                
  09e8:01ad  8a4622           mov al, byte ptr [bp + 0x22]             
  09e8:01b0  b400             mov ah, 0                                
  09e8:01b2  0146fc           add word ptr [bp - 4], ax                
  09e8:01b5  c45e06           les bx, ptr [bp + 6]                     
  09e8:01b8  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  09e8:01bc  8bc1             mov ax, cx                               
  09e8:01be  d1e0             shl ax, 1                                
  09e8:01c0  03d8             add bx, ax                               
  09e8:01c2  26893f           mov word ptr es:[bx], di                 
  09e8:01c5  c45e06           les bx, ptr [bp + 6]                     
  09e8:01c8  26c45f20         les bx, ptr es:[bx + 0x20]               
  09e8:01cc  8bc1             mov ax, cx                               
  09e8:01ce  d1e0             shl ax, 1                                
  09e8:01d0  03d8             add bx, ax                               
  09e8:01d2  8b46fc           mov ax, word ptr [bp - 4]                
  09e8:01d5  268907           mov word ptr es:[bx], ax                 
  09e8:01d8  8b7efe           mov di, word ptr [bp - 2]                
  09e8:01db  41               inc cx                                   
  09e8:01dc  83f960           cmp cx, 0x60                             
  09e8:01df  7d03             jge 0x1e4                                
  09e8:01e1  e979ff           jmp 0x15d                                
  09e8:01e4  8b5608           mov dx, word ptr [bp + 8]                
  09e8:01e7  8b4606           mov ax, word ptr [bp + 6]                
  09e8:01ea  e94ffe           jmp 0x3c                                 
  09e8:01ed  5f               pop di                                   
  09e8:01ee  5e               pop si                                   
  09e8:01ef  c9               leave                                    
  09e8:01f0  cb               retf                                     
  09e8:01f1  c8160000         enter 0x16, 0                            
  09e8:01f5  56               push si                                  
  09e8:01f6  57               push di                                  
  09e8:01f7  8b7e0a           mov di, word ptr [bp + 0xa]              
  09e8:01fa  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:01fe  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:0203  668946ec         mov dword ptr [bp - 0x14], eax           
  09e8:0207  57               push di                                  
  09e8:0208  90               nop                                      
  09e8:0209  0e               push cs                                  
  09e8:020a  e8d008           call 0xadd                               -> 09e8:0add
  09e8:020d  59               pop cx                                   
  09e8:020e  8bf8             mov di, ax                               
  09e8:0210  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0213  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  09e8:0217  8bc7             mov ax, di                               
  09e8:0219  d1e0             shl ax, 1                                
  09e8:021b  03d8             add bx, ax                               
  09e8:021d  268b07           mov ax, word ptr es:[bx]                 
  09e8:0220  8946f6           mov word ptr [bp - 0xa], ax              
  09e8:0223  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0226  26c45f20         les bx, ptr es:[bx + 0x20]               
  09e8:022a  8bc7             mov ax, di                               
  09e8:022c  d1e0             shl ax, 1                                
  09e8:022e  03d8             add bx, ax                               
  09e8:0230  268b07           mov ax, word ptr es:[bx]                 
  09e8:0233  8946f4           mov word ptr [bp - 0xc], ax              
  09e8:0236  b89d10           mov ax, 0x109d                            [reloc]
  09e8:0239  8ec0             mov es, ax                               
  09e8:023b  26c41e0000       les bx, ptr es:[0]                       
  09e8:0240  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  09e8:0244  8bc7             mov ax, di                               
  09e8:0246  d1e0             shl ax, 1                                
  09e8:0248  03d8             add bx, ax                               
  09e8:024a  268b07           mov ax, word ptr es:[bx]                 
  09e8:024d  8946f2           mov word ptr [bp - 0xe], ax              
  09e8:0250  b89d10           mov ax, 0x109d                            [reloc]
  09e8:0253  8ec0             mov es, ax                               
  09e8:0255  26c41e0000       les bx, ptr es:[0]                       
  09e8:025a  26c45f20         les bx, ptr es:[bx + 0x20]               
  09e8:025e  8bc7             mov ax, di                               
  09e8:0260  d1e0             shl ax, 1                                
  09e8:0262  03d8             add bx, ax                               
  09e8:0264  268b07           mov ax, word ptr es:[bx]                 
  09e8:0267  8946f0           mov word ptr [bp - 0x10], ax             
  09e8:026a  837e0c00         cmp word ptr [bp + 0xc], 0               
  09e8:026e  7503             jne 0x273                                
  09e8:0270  e92a01           jmp 0x39d                                
  09e8:0273  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0276  6626837f0400     cmp dword ptr es:[bx + 4], 0             
  09e8:027c  7503             jne 0x281                                
  09e8:027e  e91c01           jmp 0x39d                                
  09e8:0281  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0284  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0288  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:028c  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:0290  7461             je 0x2f3                                 
  09e8:0292  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0295  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0299  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:029f  7552             jne 0x2f3                                
  09e8:02a1  c746ea0000       mov word ptr [bp - 0x16], 0              
  09e8:02a6  eb39             jmp 0x2e1                                
  09e8:02a8  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:02ab  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:02af  8b46ea           mov ax, word ptr [bp - 0x16]             
  09e8:02b2  c1e002           shl ax, 2                                
  09e8:02b5  03d8             add bx, ax                               
  09e8:02b7  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:02bb  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:02bf  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:02c4  83c404           add sp, 4                                
  09e8:02c7  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:02ca  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:02ce  8b76ea           mov si, word ptr [bp - 0x16]             
  09e8:02d1  c1e602           shl si, 2                                
  09e8:02d4  03de             add bx, si                               
  09e8:02d6  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:02da  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:02de  ff46ea           inc word ptr [bp - 0x16]                 
  09e8:02e1  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:02e4  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:02e8  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:02ec  b400             mov ah, 0                                
  09e8:02ee  3b46ea           cmp ax, word ptr [bp - 0x16]             
  09e8:02f1  7fb5             jg 0x2a8                                 
  09e8:02f3  ff76f0           push word ptr [bp - 0x10]                
  09e8:02f6  ff76f2           push word ptr [bp - 0xe]                 
  09e8:02f9  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:02fc  26ff7706         push word ptr es:[bx + 6]                
  09e8:0300  26ff7704         push word ptr es:[bx + 4]                
  09e8:0304  ff7608           push word ptr [bp + 8]                   
  09e8:0307  ff7606           push word ptr [bp + 6]                   
  09e8:030a  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:030d  26ff7724         push word ptr es:[bx + 0x24]             
  09e8:0311  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0314  26c45f14         les bx, ptr es:[bx + 0x14]               
  09e8:0318  03df             add bx, di                               
  09e8:031a  268a07           mov al, byte ptr es:[bx]                 
  09e8:031d  b400             mov ah, 0                                
  09e8:031f  50               push ax                                  
  09e8:0320  ff76f4           push word ptr [bp - 0xc]                 
  09e8:0323  ff76f6           push word ptr [bp - 0xa]                 
  09e8:0326  16               push ss                                  
  09e8:0327  8d46f8           lea ax, [bp - 8]                         
  09e8:032a  50               push ax                                  
  09e8:032b  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  09e8:0330  83c40c           add sp, 0xc                              
  09e8:0333  52               push dx                                  
  09e8:0334  50               push ax                                  
  09e8:0335  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:0338  26ff7702         push word ptr es:[bx + 2]                
  09e8:033c  26ff37           push word ptr es:[bx]                    
  09e8:033f  9a0401750b       lcall 0xb75, 0x104                       -> 0b75:0104 [reloc]
  09e8:0344  83c414           add sp, 0x14                             
  09e8:0347  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:034a  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:034e  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:0352  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:0356  7443             je 0x39b                                 
  09e8:0358  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:035b  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:035f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:0365  7534             jne 0x39b                                
  09e8:0367  33f6             xor si, si                               
  09e8:0369  eb1f             jmp 0x38a                                
  09e8:036b  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:036e  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0372  8bc6             mov ax, si                               
  09e8:0374  c1e002           shl ax, 2                                
  09e8:0377  03d8             add bx, ax                               
  09e8:0379  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:037d  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:0381  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  09e8:0386  83c404           add sp, 4                                
  09e8:0389  46               inc si                                   
  09e8:038a  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:038d  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0391  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0395  b400             mov ah, 0                                
  09e8:0397  3bc6             cmp ax, si                               
  09e8:0399  7fd0             jg 0x36b                                 
  09e8:039b  eb43             jmp 0x3e0                                
  09e8:039d  ff7608           push word ptr [bp + 8]                   
  09e8:03a0  ff7606           push word ptr [bp + 6]                   
  09e8:03a3  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:03a6  26ff7724         push word ptr es:[bx + 0x24]             
  09e8:03aa  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:03ad  26c45f14         les bx, ptr es:[bx + 0x14]               
  09e8:03b1  03df             add bx, di                               
  09e8:03b3  268a07           mov al, byte ptr es:[bx]                 
  09e8:03b6  b400             mov ah, 0                                
  09e8:03b8  50               push ax                                  
  09e8:03b9  ff76f4           push word ptr [bp - 0xc]                 
  09e8:03bc  ff76f6           push word ptr [bp - 0xa]                 
  09e8:03bf  16               push ss                                  
  09e8:03c0  8d46f8           lea ax, [bp - 8]                         
  09e8:03c3  50               push ax                                  
  09e8:03c4  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  09e8:03c9  83c40c           add sp, 0xc                              
  09e8:03cc  52               push dx                                  
  09e8:03cd  50               push ax                                  
  09e8:03ce  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:03d1  26ff7702         push word ptr es:[bx + 2]                
  09e8:03d5  26ff37           push word ptr es:[bx]                    
  09e8:03d8  9aa900750b       lcall 0xb75, 0xa9                        -> 0b75:00a9 [reloc]
  09e8:03dd  83c40c           add sp, 0xc                              
  09e8:03e0  c45eec           les bx, ptr [bp - 0x14]                  
  09e8:03e3  26c45f18         les bx, ptr es:[bx + 0x18]               
  09e8:03e7  03df             add bx, di                               
  09e8:03e9  268a07           mov al, byte ptr es:[bx]                 
  09e8:03ec  b400             mov ah, 0                                
  09e8:03ee  50               push ax                                  
  09e8:03ef  8b4606           mov ax, word ptr [bp + 6]                
  09e8:03f2  5a               pop dx                                   
  09e8:03f3  03c2             add ax, dx                               
  09e8:03f5  eb00             jmp 0x3f7                                
  09e8:03f7  5f               pop di                                   
  09e8:03f8  5e               pop si                                   
  09e8:03f9  c9               leave                                    
  09e8:03fa  cb               retf                                     
  09e8:03fb  c8040000         enter 4, 0                               
  09e8:03ff  56               push si                                  
  09e8:0400  57               push di                                  
  09e8:0401  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0405  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:040a  668946fc         mov dword ptr [bp - 4], eax              
  09e8:040e  c45efc           les bx, ptr [bp - 4]                     
  09e8:0411  26c41f           les bx, ptr es:[bx]                      
  09e8:0414  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:0418  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:041c  7455             je 0x473                                 
  09e8:041e  c45efc           les bx, ptr [bp - 4]                     
  09e8:0421  26c41f           les bx, ptr es:[bx]                      
  09e8:0424  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:042a  7547             jne 0x473                                
  09e8:042c  33ff             xor di, di                               
  09e8:042e  eb33             jmp 0x463                                
  09e8:0430  c45efc           les bx, ptr [bp - 4]                     
  09e8:0433  26c41f           les bx, ptr es:[bx]                      
  09e8:0436  8bc7             mov ax, di                               
  09e8:0438  c1e002           shl ax, 2                                
  09e8:043b  03d8             add bx, ax                               
  09e8:043d  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:0441  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:0445  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:044a  83c404           add sp, 4                                
  09e8:044d  c45efc           les bx, ptr [bp - 4]                     
  09e8:0450  26c41f           les bx, ptr es:[bx]                      
  09e8:0453  8bf7             mov si, di                               
  09e8:0455  c1e602           shl si, 2                                
  09e8:0458  03de             add bx, si                               
  09e8:045a  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:045e  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:0462  47               inc di                                   
  09e8:0463  c45efc           les bx, ptr [bp - 4]                     
  09e8:0466  26c41f           les bx, ptr es:[bx]                      
  09e8:0469  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:046d  b400             mov ah, 0                                
  09e8:046f  3bc7             cmp ax, di                               
  09e8:0471  7fbd             jg 0x430                                 
  09e8:0473  eb1d             jmp 0x492                                
  09e8:0475  6a00             push 0                                   
  09e8:0477  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:047a  ff460a           inc word ptr [bp + 0xa]                  
  09e8:047d  268a07           mov al, byte ptr es:[bx]                 
  09e8:0480  98               cwde                                     
  09e8:0481  50               push ax                                  
  09e8:0482  ff7608           push word ptr [bp + 8]                   
  09e8:0485  ff7606           push word ptr [bp + 6]                   
  09e8:0488  0e               push cs                                  
  09e8:0489  e865fd           call 0x1f1                               -> 09e8:01f1
  09e8:048c  83c408           add sp, 8                                
  09e8:048f  894606           mov word ptr [bp + 6], ax                
  09e8:0492  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0495  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0499  75da             jne 0x475                                
  09e8:049b  8b4606           mov ax, word ptr [bp + 6]                
  09e8:049e  eb00             jmp 0x4a0                                
  09e8:04a0  5f               pop di                                   
  09e8:04a1  5e               pop si                                   
  09e8:04a2  c9               leave                                    
  09e8:04a3  cb               retf                                     
  09e8:04a4  c8040000         enter 4, 0                               
  09e8:04a8  56               push si                                  
  09e8:04a9  57               push di                                  
  09e8:04aa  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:04ae  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:04b3  668946fc         mov dword ptr [bp - 4], eax              
  09e8:04b7  c45efc           les bx, ptr [bp - 4]                     
  09e8:04ba  26c41f           les bx, ptr es:[bx]                      
  09e8:04bd  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:04c1  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:04c5  7455             je 0x51c                                 
  09e8:04c7  c45efc           les bx, ptr [bp - 4]                     
  09e8:04ca  26c41f           les bx, ptr es:[bx]                      
  09e8:04cd  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:04d3  7547             jne 0x51c                                
  09e8:04d5  33ff             xor di, di                               
  09e8:04d7  eb33             jmp 0x50c                                
  09e8:04d9  c45efc           les bx, ptr [bp - 4]                     
  09e8:04dc  26c41f           les bx, ptr es:[bx]                      
  09e8:04df  8bc7             mov ax, di                               
  09e8:04e1  c1e002           shl ax, 2                                
  09e8:04e4  03d8             add bx, ax                               
  09e8:04e6  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:04ea  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:04ee  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:04f3  83c404           add sp, 4                                
  09e8:04f6  c45efc           les bx, ptr [bp - 4]                     
  09e8:04f9  26c41f           les bx, ptr es:[bx]                      
  09e8:04fc  8bf7             mov si, di                               
  09e8:04fe  c1e602           shl si, 2                                
  09e8:0501  03de             add bx, si                               
  09e8:0503  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:0507  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:050b  47               inc di                                   
  09e8:050c  c45efc           les bx, ptr [bp - 4]                     
  09e8:050f  26c41f           les bx, ptr es:[bx]                      
  09e8:0512  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0516  b400             mov ah, 0                                
  09e8:0518  3bc7             cmp ax, di                               
  09e8:051a  7fbd             jg 0x4d9                                 
  09e8:051c  eb1d             jmp 0x53b                                
  09e8:051e  6a01             push 1                                   
  09e8:0520  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0523  ff460a           inc word ptr [bp + 0xa]                  
  09e8:0526  268a07           mov al, byte ptr es:[bx]                 
  09e8:0529  98               cwde                                     
  09e8:052a  50               push ax                                  
  09e8:052b  ff7608           push word ptr [bp + 8]                   
  09e8:052e  ff7606           push word ptr [bp + 6]                   
  09e8:0531  0e               push cs                                  
  09e8:0532  e8bcfc           call 0x1f1                               -> 09e8:01f1
  09e8:0535  83c408           add sp, 8                                
  09e8:0538  894606           mov word ptr [bp + 6], ax                
  09e8:053b  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:053e  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0542  75da             jne 0x51e                                
  09e8:0544  8b4606           mov ax, word ptr [bp + 6]                
  09e8:0547  eb00             jmp 0x549                                
  09e8:0549  5f               pop di                                   
  09e8:054a  5e               pop si                                   
  09e8:054b  c9               leave                                    
  09e8:054c  cb               retf                                     
  09e8:054d  c80e0000         enter 0xe, 0                             
  09e8:0551  56               push si                                  
  09e8:0552  57               push di                                  
  09e8:0553  8b7e0a           mov di, word ptr [bp + 0xa]              
  09e8:0556  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:055a  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:055f  668946f4         mov dword ptr [bp - 0xc], eax            
  09e8:0563  57               push di                                  
  09e8:0564  90               nop                                      
  09e8:0565  0e               push cs                                  
  09e8:0566  e87405           call 0xadd                               -> 09e8:0add
  09e8:0569  59               pop cx                                   
  09e8:056a  8bf8             mov di, ax                               
  09e8:056c  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:056f  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  09e8:0573  8bc7             mov ax, di                               
  09e8:0575  d1e0             shl ax, 1                                
  09e8:0577  03d8             add bx, ax                               
  09e8:0579  268b07           mov ax, word ptr es:[bx]                 
  09e8:057c  8946fe           mov word ptr [bp - 2], ax                
  09e8:057f  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0582  26c45f20         les bx, ptr es:[bx + 0x20]               
  09e8:0586  8bc7             mov ax, di                               
  09e8:0588  d1e0             shl ax, 1                                
  09e8:058a  03d8             add bx, ax                               
  09e8:058c  268b07           mov ax, word ptr es:[bx]                 
  09e8:058f  8946fc           mov word ptr [bp - 4], ax                
  09e8:0592  b89d10           mov ax, 0x109d                            [reloc]
  09e8:0595  8ec0             mov es, ax                               
  09e8:0597  26c41e0000       les bx, ptr es:[0]                       
  09e8:059c  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  09e8:05a0  8bc7             mov ax, di                               
  09e8:05a2  d1e0             shl ax, 1                                
  09e8:05a4  03d8             add bx, ax                               
  09e8:05a6  268b07           mov ax, word ptr es:[bx]                 
  09e8:05a9  8946fa           mov word ptr [bp - 6], ax                
  09e8:05ac  b89d10           mov ax, 0x109d                            [reloc]
  09e8:05af  8ec0             mov es, ax                               
  09e8:05b1  26c41e0000       les bx, ptr es:[0]                       
  09e8:05b6  26c45f20         les bx, ptr es:[bx + 0x20]               
  09e8:05ba  8bc7             mov ax, di                               
  09e8:05bc  d1e0             shl ax, 1                                
  09e8:05be  03d8             add bx, ax                               
  09e8:05c0  268b07           mov ax, word ptr es:[bx]                 
  09e8:05c3  8946f8           mov word ptr [bp - 8], ax                
  09e8:05c6  837e0c00         cmp word ptr [bp + 0xc], 0               
  09e8:05ca  7503             jne 0x5cf                                
  09e8:05cc  e9be01           jmp 0x78d                                
  09e8:05cf  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:05d2  6626837f0400     cmp dword ptr es:[bx + 4], 0             
  09e8:05d8  7503             jne 0x5dd                                
  09e8:05da  e9b001           jmp 0x78d                                
  09e8:05dd  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:05e0  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:05e4  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:05e8  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:05ec  7461             je 0x64f                                 
  09e8:05ee  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:05f1  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:05f5  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:05fb  7552             jne 0x64f                                
  09e8:05fd  c746f20000       mov word ptr [bp - 0xe], 0               
  09e8:0602  eb39             jmp 0x63d                                
  09e8:0604  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0607  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:060b  8b46f2           mov ax, word ptr [bp - 0xe]              
  09e8:060e  c1e002           shl ax, 2                                
  09e8:0611  03d8             add bx, ax                               
  09e8:0613  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:0617  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:061b  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:0620  83c404           add sp, 4                                
  09e8:0623  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0626  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:062a  8b76f2           mov si, word ptr [bp - 0xe]              
  09e8:062d  c1e602           shl si, 2                                
  09e8:0630  03de             add bx, si                               
  09e8:0632  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:0636  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:063a  ff46f2           inc word ptr [bp - 0xe]                  
  09e8:063d  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0640  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0644  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0648  b400             mov ah, 0                                
  09e8:064a  3b46f2           cmp ax, word ptr [bp - 0xe]              
  09e8:064d  7fb5             jg 0x604                                 
  09e8:064f  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:0652  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  09e8:0658  7451             je 0x6ab                                 
  09e8:065a  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:065d  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:0663  7546             jne 0x6ab                                
  09e8:0665  c746f20000       mov word ptr [bp - 0xe], 0               
  09e8:066a  eb31             jmp 0x69d                                
  09e8:066c  8b46f2           mov ax, word ptr [bp - 0xe]              
  09e8:066f  c1e002           shl ax, 2                                
  09e8:0672  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:0675  03d8             add bx, ax                               
  09e8:0677  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:067b  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:067f  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:0684  83c404           add sp, 4                                
  09e8:0687  8b5ef2           mov bx, word ptr [bp - 0xe]              
  09e8:068a  c1e302           shl bx, 2                                
  09e8:068d  c4760e           les si, ptr [bp + 0xe]                   
  09e8:0690  03f3             add si, bx                               
  09e8:0692  2689541c         mov word ptr es:[si + 0x1c], dx          
  09e8:0696  2689441a         mov word ptr es:[si + 0x1a], ax          
  09e8:069a  ff46f2           inc word ptr [bp - 0xe]                  
  09e8:069d  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:06a0  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:06a4  b400             mov ah, 0                                
  09e8:06a6  3b46f2           cmp ax, word ptr [bp - 0xe]              
  09e8:06a9  7fc1             jg 0x66c                                 
  09e8:06ab  ff7608           push word ptr [bp + 8]                   
  09e8:06ae  ff7606           push word ptr [bp + 6]                   
  09e8:06b1  ff7610           push word ptr [bp + 0x10]                
  09e8:06b4  ff760e           push word ptr [bp + 0xe]                 
  09e8:06b7  ff76f8           push word ptr [bp - 8]                   
  09e8:06ba  ff76fa           push word ptr [bp - 6]                   
  09e8:06bd  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:06c0  26ff7706         push word ptr es:[bx + 6]                
  09e8:06c4  26ff7704         push word ptr es:[bx + 4]                
  09e8:06c8  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:06cb  26ff7724         push word ptr es:[bx + 0x24]             
  09e8:06cf  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:06d2  26c45f14         les bx, ptr es:[bx + 0x14]               
  09e8:06d6  03df             add bx, di                               
  09e8:06d8  268a07           mov al, byte ptr es:[bx]                 
  09e8:06db  b400             mov ah, 0                                
  09e8:06dd  50               push ax                                  
  09e8:06de  ff76fc           push word ptr [bp - 4]                   
  09e8:06e1  ff76fe           push word ptr [bp - 2]                   
  09e8:06e4  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:06e7  26ff7702         push word ptr es:[bx + 2]                
  09e8:06eb  26ff37           push word ptr es:[bx]                    
  09e8:06ee  ff1eea15         lcall [0x15ea]                           
  09e8:06f2  83c41c           add sp, 0x1c                             
  09e8:06f5  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:06f8  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  09e8:06fe  7437             je 0x737                                 
  09e8:0700  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:0703  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:0709  752c             jne 0x737                                
  09e8:070b  33f6             xor si, si                               
  09e8:070d  eb1b             jmp 0x72a                                
  09e8:070f  8bc6             mov ax, si                               
  09e8:0711  c1e002           shl ax, 2                                
  09e8:0714  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:0717  03d8             add bx, ax                               
  09e8:0719  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:071d  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:0721  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  09e8:0726  83c404           add sp, 4                                
  09e8:0729  46               inc si                                   
  09e8:072a  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:072d  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0731  b400             mov ah, 0                                
  09e8:0733  3bc6             cmp ax, si                               
  09e8:0735  7fd8             jg 0x70f                                 
  09e8:0737  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:073a  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:073e  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:0742  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:0746  7443             je 0x78b                                 
  09e8:0748  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:074b  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:074f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:0755  7534             jne 0x78b                                
  09e8:0757  33f6             xor si, si                               
  09e8:0759  eb1f             jmp 0x77a                                
  09e8:075b  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:075e  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0762  8bc6             mov ax, si                               
  09e8:0764  c1e002           shl ax, 2                                
  09e8:0767  03d8             add bx, ax                               
  09e8:0769  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:076d  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:0771  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  09e8:0776  83c404           add sp, 4                                
  09e8:0779  46               inc si                                   
  09e8:077a  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:077d  26c45f04         les bx, ptr es:[bx + 4]                  
  09e8:0781  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0785  b400             mov ah, 0                                
  09e8:0787  3bc6             cmp ax, si                               
  09e8:0789  7fd0             jg 0x75b                                 
  09e8:078b  eb39             jmp 0x7c6                                
  09e8:078d  ff7608           push word ptr [bp + 8]                   
  09e8:0790  ff7606           push word ptr [bp + 6]                   
  09e8:0793  ff7610           push word ptr [bp + 0x10]                
  09e8:0796  ff760e           push word ptr [bp + 0xe]                 
  09e8:0799  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:079c  26ff7724         push word ptr es:[bx + 0x24]             
  09e8:07a0  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:07a3  26c45f14         les bx, ptr es:[bx + 0x14]               
  09e8:07a7  03df             add bx, di                               
  09e8:07a9  268a07           mov al, byte ptr es:[bx]                 
  09e8:07ac  b400             mov ah, 0                                
  09e8:07ae  50               push ax                                  
  09e8:07af  ff76fc           push word ptr [bp - 4]                   
  09e8:07b2  ff76fe           push word ptr [bp - 2]                   
  09e8:07b5  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:07b8  26ff7702         push word ptr es:[bx + 2]                
  09e8:07bc  26ff37           push word ptr es:[bx]                    
  09e8:07bf  ff1ef615         lcall [0x15f6]                           
  09e8:07c3  83c414           add sp, 0x14                             
  09e8:07c6  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:07c9  26c45f18         les bx, ptr es:[bx + 0x18]               
  09e8:07cd  03df             add bx, di                               
  09e8:07cf  268a07           mov al, byte ptr es:[bx]                 
  09e8:07d2  b400             mov ah, 0                                
  09e8:07d4  50               push ax                                  
  09e8:07d5  8b4606           mov ax, word ptr [bp + 6]                
  09e8:07d8  5a               pop dx                                   
  09e8:07d9  03c2             add ax, dx                               
  09e8:07db  eb00             jmp 0x7dd                                
  09e8:07dd  5f               pop di                                   
  09e8:07de  5e               pop si                                   
  09e8:07df  c9               leave                                    
  09e8:07e0  cb               retf                                     
  09e8:07e1  c8040000         enter 4, 0                               
  09e8:07e5  56               push si                                  
  09e8:07e6  57               push di                                  
  09e8:07e7  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:07eb  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:07f0  668946fc         mov dword ptr [bp - 4], eax              
  09e8:07f4  c45efc           les bx, ptr [bp - 4]                     
  09e8:07f7  26c41f           les bx, ptr es:[bx]                      
  09e8:07fa  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:07fe  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:0802  7455             je 0x859                                 
  09e8:0804  c45efc           les bx, ptr [bp - 4]                     
  09e8:0807  26c41f           les bx, ptr es:[bx]                      
  09e8:080a  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:0810  7547             jne 0x859                                
  09e8:0812  33ff             xor di, di                               
  09e8:0814  eb33             jmp 0x849                                
  09e8:0816  c45efc           les bx, ptr [bp - 4]                     
  09e8:0819  26c41f           les bx, ptr es:[bx]                      
  09e8:081c  8bc7             mov ax, di                               
  09e8:081e  c1e002           shl ax, 2                                
  09e8:0821  03d8             add bx, ax                               
  09e8:0823  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:0827  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:082b  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:0830  83c404           add sp, 4                                
  09e8:0833  c45efc           les bx, ptr [bp - 4]                     
  09e8:0836  26c41f           les bx, ptr es:[bx]                      
  09e8:0839  8bf7             mov si, di                               
  09e8:083b  c1e602           shl si, 2                                
  09e8:083e  03de             add bx, si                               
  09e8:0840  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:0844  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:0848  47               inc di                                   
  09e8:0849  c45efc           les bx, ptr [bp - 4]                     
  09e8:084c  26c41f           les bx, ptr es:[bx]                      
  09e8:084f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0853  b400             mov ah, 0                                
  09e8:0855  3bc7             cmp ax, di                               
  09e8:0857  7fbd             jg 0x816                                 
  09e8:0859  eb23             jmp 0x87e                                
  09e8:085b  ff7610           push word ptr [bp + 0x10]                
  09e8:085e  ff760e           push word ptr [bp + 0xe]                 
  09e8:0861  6a00             push 0                                   
  09e8:0863  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0866  ff460a           inc word ptr [bp + 0xa]                  
  09e8:0869  268a07           mov al, byte ptr es:[bx]                 
  09e8:086c  98               cwde                                     
  09e8:086d  50               push ax                                  
  09e8:086e  ff7608           push word ptr [bp + 8]                   
  09e8:0871  ff7606           push word ptr [bp + 6]                   
  09e8:0874  0e               push cs                                  
  09e8:0875  e8d5fc           call 0x54d                               -> 09e8:054d
  09e8:0878  83c40c           add sp, 0xc                              
  09e8:087b  894606           mov word ptr [bp + 6], ax                
  09e8:087e  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0881  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0885  75d4             jne 0x85b                                
  09e8:0887  8b4606           mov ax, word ptr [bp + 6]                
  09e8:088a  eb00             jmp 0x88c                                
  09e8:088c  5f               pop di                                   
  09e8:088d  5e               pop si                                   
  09e8:088e  c9               leave                                    
  09e8:088f  cb               retf                                     
  09e8:0890  c8040000         enter 4, 0                               
  09e8:0894  56               push si                                  
  09e8:0895  57               push di                                  
  09e8:0896  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:089a  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:089f  668946fc         mov dword ptr [bp - 4], eax              
  09e8:08a3  c45efc           les bx, ptr [bp - 4]                     
  09e8:08a6  26c41f           les bx, ptr es:[bx]                      
  09e8:08a9  268b470a         mov ax, word ptr es:[bx + 0xa]           
  09e8:08ad  260b470c         or ax, word ptr es:[bx + 0xc]            
  09e8:08b1  7455             je 0x908                                 
  09e8:08b3  c45efc           les bx, ptr [bp - 4]                     
  09e8:08b6  26c41f           les bx, ptr es:[bx]                      
  09e8:08b9  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  09e8:08bf  7547             jne 0x908                                
  09e8:08c1  33ff             xor di, di                               
  09e8:08c3  eb33             jmp 0x8f8                                
  09e8:08c5  c45efc           les bx, ptr [bp - 4]                     
  09e8:08c8  26c41f           les bx, ptr es:[bx]                      
  09e8:08cb  8bc7             mov ax, di                               
  09e8:08cd  c1e002           shl ax, 2                                
  09e8:08d0  03d8             add bx, ax                               
  09e8:08d2  26ff770c         push word ptr es:[bx + 0xc]              
  09e8:08d6  26ff770a         push word ptr es:[bx + 0xa]              
  09e8:08da  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  09e8:08df  83c404           add sp, 4                                
  09e8:08e2  c45efc           les bx, ptr [bp - 4]                     
  09e8:08e5  26c41f           les bx, ptr es:[bx]                      
  09e8:08e8  8bf7             mov si, di                               
  09e8:08ea  c1e602           shl si, 2                                
  09e8:08ed  03de             add bx, si                               
  09e8:08ef  2689571c         mov word ptr es:[bx + 0x1c], dx          
  09e8:08f3  2689471a         mov word ptr es:[bx + 0x1a], ax          
  09e8:08f7  47               inc di                                   
  09e8:08f8  c45efc           les bx, ptr [bp - 4]                     
  09e8:08fb  26c41f           les bx, ptr es:[bx]                      
  09e8:08fe  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09e8:0902  b400             mov ah, 0                                
  09e8:0904  3bc7             cmp ax, di                               
  09e8:0906  7fbd             jg 0x8c5                                 
  09e8:0908  eb23             jmp 0x92d                                
  09e8:090a  ff7610           push word ptr [bp + 0x10]                
  09e8:090d  ff760e           push word ptr [bp + 0xe]                 
  09e8:0910  6a01             push 1                                   
  09e8:0912  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0915  ff460a           inc word ptr [bp + 0xa]                  
  09e8:0918  268a07           mov al, byte ptr es:[bx]                 
  09e8:091b  98               cwde                                     
  09e8:091c  50               push ax                                  
  09e8:091d  ff7608           push word ptr [bp + 8]                   
  09e8:0920  ff7606           push word ptr [bp + 6]                   
  09e8:0923  0e               push cs                                  
  09e8:0924  e826fc           call 0x54d                               -> 09e8:054d
  09e8:0927  83c40c           add sp, 0xc                              
  09e8:092a  894606           mov word ptr [bp + 6], ax                
  09e8:092d  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0930  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0934  75d4             jne 0x90a                                
  09e8:0936  8b4606           mov ax, word ptr [bp + 6]                
  09e8:0939  eb00             jmp 0x93b                                
  09e8:093b  5f               pop di                                   
  09e8:093c  5e               pop si                                   
  09e8:093d  c9               leave                                    
  09e8:093e  cb               retf                                     
  09e8:093f  c8a40000         enter 0xa4, 0                            
  09e8:0943  8d460e           lea ax, [bp + 0xe]                       
  09e8:0946  8c56fe           mov word ptr [bp - 2], ss                
  09e8:0949  8946fc           mov word ptr [bp - 4], ax                
  09e8:094c  ff76fe           push word ptr [bp - 2]                   
  09e8:094f  ff76fc           push word ptr [bp - 4]                   
  09e8:0952  ff760c           push word ptr [bp + 0xc]                 
  09e8:0955  ff760a           push word ptr [bp + 0xa]                 
  09e8:0958  16               push ss                                  
  09e8:0959  8d865cff         lea ax, [bp - 0xa4]                      
  09e8:095d  50               push ax                                  
  09e8:095e  9ac2450000       lcall 0, 0x45c2                          -> 0000:45c2 [reloc]
  09e8:0963  83c40c           add sp, 0xc                              
  09e8:0966  16               push ss                                  
  09e8:0967  8d865cff         lea ax, [bp - 0xa4]                      
  09e8:096b  50               push ax                                  
  09e8:096c  ff7608           push word ptr [bp + 8]                   
  09e8:096f  ff7606           push word ptr [bp + 6]                   
  09e8:0972  0e               push cs                                  
  09e8:0973  e885fa           call 0x3fb                               -> 09e8:03fb
  09e8:0976  83c408           add sp, 8                                
  09e8:0979  eb00             jmp 0x97b                                
  09e8:097b  c9               leave                                    
  09e8:097c  cb               retf                                     
  09e8:097d  c8060000         enter 6, 0                               
  09e8:0981  56               push si                                  
  09e8:0982  57               push di                                  
  09e8:0983  8b7606           mov si, word ptr [bp + 6]                
  09e8:0986  8b7e08           mov di, word ptr [bp + 8]                
  09e8:0989  6a0a             push 0xa                                 
  09e8:098b  16               push ss                                  
  09e8:098c  8d46fa           lea ax, [bp - 6]                         
  09e8:098f  50               push ax                                  
  09e8:0990  ff760a           push word ptr [bp + 0xa]                 
  09e8:0993  9a743f0000       lcall 0, 0x3f74                          -> 0000:3f74 [reloc]
  09e8:0998  83c408           add sp, 8                                
  09e8:099b  16               push ss                                  
  09e8:099c  8d46fa           lea ax, [bp - 6]                         
  09e8:099f  50               push ax                                  
  09e8:09a0  90               nop                                      
  09e8:09a1  0e               push cs                                  
  09e8:09a2  e8e300           call 0xa88                               -> 09e8:0a88
  09e8:09a5  83c404           add sp, 4                                
  09e8:09a8  8bd0             mov dx, ax                               
  09e8:09aa  3b560c           cmp dx, word ptr [bp + 0xc]              
  09e8:09ad  7e0f             jle 0x9be                                
  09e8:09af  ff760c           push word ptr [bp + 0xc]                 
  09e8:09b2  57               push di                                  
  09e8:09b3  56               push si                                  
  09e8:09b4  90               nop                                      
  09e8:09b5  0e               push cs                                  
  09e8:09b6  e87401           call 0xb2d                               -> 09e8:0b2d
  09e8:09b9  83c406           add sp, 6                                
  09e8:09bc  eb22             jmp 0x9e0                                
  09e8:09be  8b460c           mov ax, word ptr [bp + 0xc]              
  09e8:09c1  2bc2             sub ax, dx                               
  09e8:09c3  50               push ax                                  
  09e8:09c4  57               push di                                  
  09e8:09c5  56               push si                                  
  09e8:09c6  90               nop                                      
  09e8:09c7  0e               push cs                                  
  09e8:09c8  e86201           call 0xb2d                               -> 09e8:0b2d
  09e8:09cb  83c406           add sp, 6                                
  09e8:09ce  8bf0             mov si, ax                               
  09e8:09d0  16               push ss                                  
  09e8:09d1  8d46fa           lea ax, [bp - 6]                         
  09e8:09d4  50               push ax                                  
  09e8:09d5  57               push di                                  
  09e8:09d6  56               push si                                  
  09e8:09d7  0e               push cs                                  
  09e8:09d8  e820fa           call 0x3fb                               -> 09e8:03fb
  09e8:09db  83c408           add sp, 8                                
  09e8:09de  ebdc             jmp 0x9bc                                
  09e8:09e0  5f               pop di                                   
  09e8:09e1  5e               pop si                                   
  09e8:09e2  c9               leave                                    
  09e8:09e3  cb               retf                                     

proc_09e8_09e4:
  09e8:09e4  55               push bp                                  
  09e8:09e5  8bec             mov bp, sp                               
  09e8:09e7  56               push si                                  
  09e8:09e8  57               push di                                  
  09e8:09e9  8b7e06           mov di, word ptr [bp + 6]                
  09e8:09ec  33f6             xor si, si                               
  09e8:09ee  eb31             jmp 0xa21                                
  09e8:09f0  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:09f3  268a07           mov al, byte ptr es:[bx]                 
  09e8:09f6  98               cwde                                     
  09e8:09f7  50               push ax                                  
  09e8:09f8  90               nop                                      
  09e8:09f9  0e               push cs                                  
  09e8:09fa  e85000           call 0xa4d                               -> 09e8:0a4d
  09e8:09fd  59               pop cx                                   
  09e8:09fe  03f0             add si, ax                               
  09e8:0a00  3b760e           cmp si, word ptr [bp + 0xe]              
  09e8:0a03  7c02             jl 0xa07                                 
  09e8:0a05  eb23             jmp 0xa2a                                
  09e8:0a07  6a00             push 0                                   
  09e8:0a09  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0a0c  ff460a           inc word ptr [bp + 0xa]                  
  09e8:0a0f  268a07           mov al, byte ptr es:[bx]                 
  09e8:0a12  98               cwde                                     
  09e8:0a13  50               push ax                                  
  09e8:0a14  ff7608           push word ptr [bp + 8]                   
  09e8:0a17  57               push di                                  
  09e8:0a18  0e               push cs                                  
  09e8:0a19  e8d5f7           call 0x1f1                               -> 09e8:01f1
  09e8:0a1c  83c408           add sp, 8                                
  09e8:0a1f  8bf8             mov di, ax                               
  09e8:0a21  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0a24  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0a28  75c6             jne 0x9f0                                
  09e8:0a2a  8bc6             mov ax, si                               
  09e8:0a2c  2b460e           sub ax, word ptr [bp + 0xe]              
  09e8:0a2f  7c04             jl 0xa35                                 
  09e8:0a31  8bc7             mov ax, di                               
  09e8:0a33  eb14             jmp 0xa49                                
  09e8:0a35  8b460e           mov ax, word ptr [bp + 0xe]              
  09e8:0a38  2bc6             sub ax, si                               
  09e8:0a3a  50               push ax                                  
  09e8:0a3b  ff7608           push word ptr [bp + 8]                   
  09e8:0a3e  57               push di                                  
  09e8:0a3f  90               nop                                      
  09e8:0a40  0e               push cs                                  
  09e8:0a41  e8e900           call 0xb2d                               -> 09e8:0b2d
  09e8:0a44  83c406           add sp, 6                                
  09e8:0a47  ebea             jmp 0xa33                                
  09e8:0a49  5f               pop di                                   
  09e8:0a4a  5e               pop si                                   
  09e8:0a4b  5d               pop bp                                   
  09e8:0a4c  cb               retf                                     

proc_09e8_0a4d:
  09e8:0a4d  55               push bp                                  
  09e8:0a4e  8bec             mov bp, sp                               
  09e8:0a50  ff7606           push word ptr [bp + 6]                   
  09e8:0a53  90               nop                                      
  09e8:0a54  0e               push cs                                  
  09e8:0a55  e88500           call 0xadd                               -> 09e8:0add
  09e8:0a58  59               pop cx                                   
  09e8:0a59  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0a5d  26c45f61         les bx, ptr es:[bx + 0x61]               
  09e8:0a61  26c45718         les dx, ptr es:[bx + 0x18]               
  09e8:0a65  03d0             add dx, ax                               
  09e8:0a67  8bda             mov bx, dx                               
  09e8:0a69  268a07           mov al, byte ptr es:[bx]                 
  09e8:0a6c  b400             mov ah, 0                                
  09e8:0a6e  eb00             jmp 0xa70                                
  09e8:0a70  5d               pop bp                                   
  09e8:0a71  cb               retf                                     

proc_09e8_0a72:
  09e8:0a72  55               push bp                                  
  09e8:0a73  8bec             mov bp, sp                               
  09e8:0a75  8b5606           mov dx, word ptr [bp + 6]                
  09e8:0a78  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0a7c  26c45f61         les bx, ptr es:[bx + 0x61]               
  09e8:0a80  268b4724         mov ax, word ptr es:[bx + 0x24]          
  09e8:0a84  eb00             jmp 0xa86                                
  09e8:0a86  5d               pop bp                                   
  09e8:0a87  cb               retf                                     

proc_09e8_0a88:
  09e8:0a88  55               push bp                                  
  09e8:0a89  8bec             mov bp, sp                               
  09e8:0a8b  56               push si                                  
  09e8:0a8c  33f6             xor si, si                               
  09e8:0a8e  eb12             jmp 0xaa2                                
  09e8:0a90  c45e06           les bx, ptr [bp + 6]                     
  09e8:0a93  ff4606           inc word ptr [bp + 6]                    
  09e8:0a96  268a07           mov al, byte ptr es:[bx]                 
  09e8:0a99  98               cwde                                     
  09e8:0a9a  50               push ax                                  
  09e8:0a9b  0e               push cs                                  
  09e8:0a9c  e8aeff           call 0xa4d                               -> 09e8:0a4d
  09e8:0a9f  59               pop cx                                   
  09e8:0aa0  03f0             add si, ax                               
  09e8:0aa2  c45e06           les bx, ptr [bp + 6]                     
  09e8:0aa5  26803f00         cmp byte ptr es:[bx], 0                  
  09e8:0aa9  75e5             jne 0xa90                                
  09e8:0aab  8bc6             mov ax, si                               
  09e8:0aad  eb00             jmp 0xaaf                                
  09e8:0aaf  5e               pop si                                   
  09e8:0ab0  5d               pop bp                                   
  09e8:0ab1  cb               retf                                     

proc_09e8_0ab2:
  09e8:0ab2  55               push bp                                  
  09e8:0ab3  8bec             mov bp, sp                               
  09e8:0ab5  ff7608           push word ptr [bp + 8]                   
  09e8:0ab8  ff7606           push word ptr [bp + 6]                   
  09e8:0abb  0e               push cs                                  
  09e8:0abc  e8c9ff           call 0xa88                               -> 09e8:0a88
  09e8:0abf  83c404           add sp, 4                                
  09e8:0ac2  c45e0a           les bx, ptr [bp + 0xa]                   
  09e8:0ac5  268907           mov word ptr es:[bx], ax                 
  09e8:0ac8  c45e06           les bx, ptr [bp + 6]                     
  09e8:0acb  268a07           mov al, byte ptr es:[bx]                 
  09e8:0ace  98               cwde                                     
  09e8:0acf  50               push ax                                  
  09e8:0ad0  0e               push cs                                  
  09e8:0ad1  e89eff           call 0xa72                               -> 09e8:0a72
  09e8:0ad4  59               pop cx                                   
  09e8:0ad5  c45e0e           les bx, ptr [bp + 0xe]                   
  09e8:0ad8  268907           mov word ptr es:[bx], ax                 
  09e8:0adb  5d               pop bp                                   
  09e8:0adc  cb               retf                                     

proc_09e8_0add:
  09e8:0add  55               push bp                                  
  09e8:0ade  8bec             mov bp, sp                               
  09e8:0ae0  56               push si                                  
  09e8:0ae1  8b7606           mov si, word ptr [bp + 6]                
  09e8:0ae4  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0ae8  26c45f61         les bx, ptr es:[bx + 0x61]               
  09e8:0aec  26f747260200     test word ptr es:[bx + 0x26], 2          
  09e8:0af2  7410             je 0xb04                                 
  09e8:0af4  f6846f0e08       test byte ptr [si + 0xe6f], 8            
  09e8:0af9  7409             je 0xb04                                 
  09e8:0afb  56               push si                                  
  09e8:0afc  9a2e260000       lcall 0, 0x262e                          -> 0000:262e [reloc]
  09e8:0b01  59               pop cx                                   
  09e8:0b02  8bf0             mov si, ax                               
  09e8:0b04  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0b08  26c45f61         les bx, ptr es:[bx + 0x61]               
  09e8:0b0c  262b7710         sub si, word ptr es:[bx + 0x10]          
  09e8:0b10  0bf6             or si, si                                
  09e8:0b12  7d02             jge 0xb16                                
  09e8:0b14  33f6             xor si, si                               
  09e8:0b16  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0b1a  26c45f61         les bx, ptr es:[bx + 0x61]               
  09e8:0b1e  26397712         cmp word ptr es:[bx + 0x12], si          
  09e8:0b22  7d02             jge 0xb26                                
  09e8:0b24  33f6             xor si, si                               
  09e8:0b26  8bc6             mov ax, si                               
  09e8:0b28  eb00             jmp 0xb2a                                
  09e8:0b2a  5e               pop si                                   
  09e8:0b2b  5d               pop bp                                   
  09e8:0b2c  cb               retf                                     
  09e8:0b2d  c80c0000         enter 0xc, 0                             
  09e8:0b31  56               push si                                  
  09e8:0b32  57               push di                                  
  09e8:0b33  8b7606           mov si, word ptr [bp + 6]                
  09e8:0b36  8b7e0a           mov di, word ptr [bp + 0xa]              
  09e8:0b39  c41e5b1a         les bx, ptr [0x1a5b]                     
  09e8:0b3d  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  09e8:0b42  668946f4         mov dword ptr [bp - 0xc], eax            
  09e8:0b46  0bff             or di, di                                
  09e8:0b48  7504             jne 0xb4e                                
  09e8:0b4a  8bc6             mov ax, si                               
  09e8:0b4c  eb41             jmp 0xb8f                                
  09e8:0b4e  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0b51  26ff7724         push word ptr es:[bx + 0x24]             
  09e8:0b55  57               push di                                  
  09e8:0b56  ff7608           push word ptr [bp + 8]                   
  09e8:0b59  56               push si                                  
  09e8:0b5a  16               push ss                                  
  09e8:0b5b  8d46f8           lea ax, [bp - 8]                         
  09e8:0b5e  50               push ax                                  
  09e8:0b5f  9a2c00a009       lcall 0x9a0, 0x2c                        -> 09a0:002c [reloc]
  09e8:0b64  83c40c           add sp, 0xc                              
  09e8:0b67  52               push dx                                  
  09e8:0b68  50               push ax                                  
  09e8:0b69  9a3301560b       lcall 0xb56, 0x133                       -> 0b56:0133 [reloc]
  09e8:0b6e  83c404           add sp, 4                                
  09e8:0b71  c45ef4           les bx, ptr [bp - 0xc]                   
  09e8:0b74  26ff7728         push word ptr es:[bx + 0x28]             
  09e8:0b78  16               push ss                                  
  09e8:0b79  8d46f8           lea ax, [bp - 8]                         
  09e8:0b7c  50               push ax                                  
  09e8:0b7d  1e               push ds                                  
  09e8:0b7e  684c07           push 0x74c                               
  09e8:0b81  9aa304750b       lcall 0xb75, 0x4a3                       -> 0b75:04a3 [reloc]
  09e8:0b86  83c40a           add sp, 0xa                              
  09e8:0b89  8bc6             mov ax, si                               
  09e8:0b8b  03c7             add ax, di                               
  09e8:0b8d  ebbd             jmp 0xb4c                                
  09e8:0b8f  5f               pop di                                   
  09e8:0b90  5e               pop si                                   
  09e8:0b91  c9               leave                                    
  09e8:0b92  cb               retf                                     

proc_09e8_0b93:
  09e8:0b93  55               push bp                                  
  09e8:0b94  8bec             mov bp, sp                               
  09e8:0b96  66837e0600       cmp dword ptr [bp + 6], 0                
  09e8:0b9b  7419             je 0xbb6                                 
  09e8:0b9d  c45e06           les bx, ptr [bp + 6]                     
  09e8:0ba0  26f747260100     test word ptr es:[bx + 0x26], 1          
  09e8:0ba6  740e             je 0xbb6                                 
  09e8:0ba8  ff7608           push word ptr [bp + 8]                   
  09e8:0bab  ff7606           push word ptr [bp + 6]                   
  09e8:0bae  9a               db 9a
  09e8:0baf  c3               ret                                      
