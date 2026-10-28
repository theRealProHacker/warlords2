; res_11e2 file_off 0x13e20

res_11e2_0007:  ; ENTRY
  0007  cb               retf                                     

res_11e2_0008:  ; ENTRY
  0008  c8080000         enter 8, 0                               
  000c  56               push si                                  
  000d  57               push di                                  
  000e  66837e0600       cmp dword ptr [bp + 6], 0                
  0013  754f             jne 0x64                                 
  0015  666a00           push 0                                   
  0018  6a20             push 0x20                                
  001a  666a2a           push 0x2a                                
  001d  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0022  83c40a           add sp, 0xa                              
  0025  8956fa           mov word ptr [bp - 6], dx                
  0028  8946f8           mov word ptr [bp - 8], ax                
  002b  66837ef800       cmp dword ptr [bp - 8], 0                
  0030  7513             jne 0x45                                 
  0032  1e               push ds                                  
  0033  684235           push 0x3542                               ; "Font: Can't create font"
  0036  9a99001d15       lcall 0x151d, 0x99                       -> 151d:0099
  003b  83c404           add sp, 4                                
  003e  33d2             xor dx, dx                               
  0040  33c0             xor ax, ax                               
  0042  e9ae01           jmp 0x1f3                                
  0045  ff76fa           push word ptr [bp - 6]                   
  0048  ff76f8           push word ptr [bp - 8]                   
  004b  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  0050  83c404           add sp, 4                                
  0053  895608           mov word ptr [bp + 8], dx                
  0056  894606           mov word ptr [bp + 6], ax                
  0059  c45e06           les bx, ptr [bp + 6]                     
  005c  26c747260100     mov word ptr es:[bx + 0x26], 1           
  0062  eb09             jmp 0x6d                                 
  0064  c45e06           les bx, ptr [bp + 6]                     
  0067  26c747260000     mov word ptr es:[bx + 0x26], 0           
  006d  c45e06           les bx, ptr [bp + 6]                     
  0070  8b4624           mov ax, word ptr [bp + 0x24]             
  0073  26094726         or word ptr es:[bx + 0x26], ax           
  0077  c45e06           les bx, ptr [bp + 6]                     
  007a  668b460a         mov eax, dword ptr [bp + 0xa]            
  007e  66268907         mov dword ptr es:[bx], eax               
  0082  c45e06           les bx, ptr [bp + 6]                     
  0085  668b460e         mov eax, dword ptr [bp + 0xe]            
  0089  6626894704       mov dword ptr es:[bx + 4], eax           
  008e  c45e06           les bx, ptr [bp + 6]                     
  0091  668b461a         mov eax, dword ptr [bp + 0x1a]           
  0095  6626894714       mov dword ptr es:[bx + 0x14], eax        
  009a  c45e06           les bx, ptr [bp + 6]                     
  009d  668b461e         mov eax, dword ptr [bp + 0x1e]           
  00a1  6626894718       mov dword ptr es:[bx + 0x18], eax        
  00a6  8a4622           mov al, byte ptr [bp + 0x22]             
  00a9  b400             mov ah, 0                                
  00ab  c45e06           les bx, ptr [bp + 6]                     
  00ae  26894724         mov word ptr es:[bx + 0x24], ax          
  00b2  8a4616           mov al, byte ptr [bp + 0x16]             
  00b5  98               cwde                                     
  00b6  c45e06           les bx, ptr [bp + 6]                     
  00b9  26894710         mov word ptr es:[bx + 0x10], ax          
  00bd  8a4618           mov al, byte ptr [bp + 0x18]             
  00c0  98               cwde                                     
  00c1  c45e06           les bx, ptr [bp + 6]                     
  00c4  26894712         mov word ptr es:[bx + 0x12], ax          
  00c8  c45e06           les bx, ptr [bp + 6]                     
  00cb  8b4626           mov ax, word ptr [bp + 0x26]             
  00ce  26894728         mov word ptr es:[bx + 0x28], ax          
  00d2  8b4606           mov ax, word ptr [bp + 6]                
  00d5  050800           add ax, 8                                
  00d8  ff7608           push word ptr [bp + 8]                   
  00db  50               push ax                                  
  00dc  ff7614           push word ptr [bp + 0x14]                
  00df  ff7612           push word ptr [bp + 0x12]                
  00e2  b90800           mov cx, 8                                
  00e5  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  00ea  c45e12           les bx, ptr [bp + 0x12]                  
  00ed  268b3f           mov di, word ptr es:[bx]                 
  00f0  c45e12           les bx, ptr [bp + 0x12]                  
  00f3  268b4702         mov ax, word ptr es:[bx + 2]             
  00f7  8946fc           mov word ptr [bp - 4], ax                
  00fa  666a00           push 0                                   
  00fd  6a20             push 0x20                                
  00ff  6668c0000000     push 0xc0                                
  0105  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  010a  83c40a           add sp, 0xa                              
  010d  8956fa           mov word ptr [bp - 6], dx                
  0110  8946f8           mov word ptr [bp - 8], ax                
  0113  ff76fa           push word ptr [bp - 6]                   
  0116  ff76f8           push word ptr [bp - 8]                   
  0119  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  011e  83c404           add sp, 4                                
  0121  c45e06           les bx, ptr [bp + 6]                     
  0124  2689571e         mov word ptr es:[bx + 0x1e], dx          
  0128  2689471c         mov word ptr es:[bx + 0x1c], ax          
  012c  666a00           push 0                                   
  012f  6a20             push 0x20                                
  0131  6668c0000000     push 0xc0                                
  0137  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  013c  83c40a           add sp, 0xa                              
  013f  8956fa           mov word ptr [bp - 6], dx                
  0142  8946f8           mov word ptr [bp - 8], ax                
  0145  ff76fa           push word ptr [bp - 6]                   
  0148  ff76f8           push word ptr [bp - 8]                   
  014b  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  0150  83c404           add sp, 4                                
  0153  c45e06           les bx, ptr [bp + 6]                     
  0156  26895722         mov word ptr es:[bx + 0x22], dx          
  015a  26894720         mov word ptr es:[bx + 0x20], ax          
  015e  33c9             xor cx, cx                               
  0160  e97f00           jmp 0x1e2                                
  0163  c45e1a           les bx, ptr [bp + 0x1a]                  
  0166  03d9             add bx, cx                               
  0168  268a07           mov al, byte ptr es:[bx]                 
  016b  b400             mov ah, 0                                
  016d  050700           add ax, 7                                
  0170  bb0800           mov bx, 8                                
  0173  99               cdq                                      
  0174  f7fb             idiv bx                                  
  0176  c1e003           shl ax, 3                                
  0179  8bd7             mov dx, di                               
  017b  03d0             add dx, ax                               
  017d  8956fe           mov word ptr [bp - 2], dx                
  0180  c45e12           les bx, ptr [bp + 0x12]                  
  0183  06               push es                                  
  0184  c47612           les si, ptr [bp + 0x12]                  
  0187  268b04           mov ax, word ptr es:[si]                 
  018a  07               pop es                                   
  018b  26034704         add ax, word ptr es:[bx + 4]             
  018f  3b46fe           cmp ax, word ptr [bp - 2]                
  0192  7d27             jge 0x1bb                                
  0194  c45e12           les bx, ptr [bp + 0x12]                  
  0197  268b3f           mov di, word ptr es:[bx]                 
  019a  c45e1a           les bx, ptr [bp + 0x1a]                  
  019d  03d9             add bx, cx                               
  019f  268a07           mov al, byte ptr es:[bx]                 
  01a2  b400             mov ah, 0                                
  01a4  050700           add ax, 7                                
  01a7  bb0800           mov bx, 8                                
  01aa  99               cdq                                      
  01ab  f7fb             idiv bx                                  
  01ad  c1e003           shl ax, 3                                
  01b0  8946fe           mov word ptr [bp - 2], ax                
  01b3  8a4622           mov al, byte ptr [bp + 0x22]             
  01b6  b400             mov ah, 0                                
  01b8  0146fc           add word ptr [bp - 4], ax                
  01bb  c45e06           les bx, ptr [bp + 6]                     
  01be  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  01c2  8bc1             mov ax, cx                               
  01c4  d1e0             shl ax, 1                                
  01c6  03d8             add bx, ax                               
  01c8  26893f           mov word ptr es:[bx], di                 
  01cb  c45e06           les bx, ptr [bp + 6]                     
  01ce  26c45f20         les bx, ptr es:[bx + 0x20]               
  01d2  8bc1             mov ax, cx                               
  01d4  d1e0             shl ax, 1                                
  01d6  03d8             add bx, ax                               
  01d8  8b46fc           mov ax, word ptr [bp - 4]                
  01db  268907           mov word ptr es:[bx], ax                 
  01de  8b7efe           mov di, word ptr [bp - 2]                
  01e1  41               inc cx                                   
  01e2  83f960           cmp cx, 0x60                             
  01e5  7d03             jge 0x1ea                                
  01e7  e979ff           jmp 0x163                                
  01ea  8b5608           mov dx, word ptr [bp + 8]                
  01ed  8b4606           mov ax, word ptr [bp + 6]                
  01f0  e94ffe           jmp 0x42                                 
  01f3  5f               pop di                                   
  01f4  5e               pop si                                   
  01f5  c9               leave                                    
  01f6  cb               retf                                     

res_11e2_01f7:  ; ENTRY
  01f7  c8160000         enter 0x16, 0                            
  01fb  56               push si                                  
  01fc  57               push di                                  
  01fd  8b7e0a           mov di, word ptr [bp + 0xa]              
  0200  c41e4970         les bx, ptr [0x7049]                     
  0204  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  0209  668946ec         mov dword ptr [bp - 0x14], eax           
  020d  57               push di                                  
  020e  90               nop                                      
  020f  0e               push cs                                  
  0210  e8d008           call 0xae3                               
  0213  59               pop cx                                   
  0214  8bf8             mov di, ax                               
  0216  c45eec           les bx, ptr [bp - 0x14]                  
  0219  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  021d  8bc7             mov ax, di                               
  021f  d1e0             shl ax, 1                                
  0221  03d8             add bx, ax                               
  0223  268b07           mov ax, word ptr es:[bx]                 
  0226  8946f6           mov word ptr [bp - 0xa], ax              
  0229  c45eec           les bx, ptr [bp - 0x14]                  
  022c  26c45f20         les bx, ptr es:[bx + 0x20]               
  0230  8bc7             mov ax, di                               
  0232  d1e0             shl ax, 1                                
  0234  03d8             add bx, ax                               
  0236  268b07           mov ax, word ptr es:[bx]                 
  0239  8946f4           mov word ptr [bp - 0xc], ax              
  023c  b8f32e           mov ax, 0x2ef3                           
  023f  8ec0             mov es, ax                               
  0241  26c41e0000       les bx, ptr es:[0]                       
  0246  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  024a  8bc7             mov ax, di                               
  024c  d1e0             shl ax, 1                                
  024e  03d8             add bx, ax                               
  0250  268b07           mov ax, word ptr es:[bx]                 
  0253  8946f2           mov word ptr [bp - 0xe], ax              
  0256  b8f32e           mov ax, 0x2ef3                           
  0259  8ec0             mov es, ax                               
  025b  26c41e0000       les bx, ptr es:[0]                       
  0260  26c45f20         les bx, ptr es:[bx + 0x20]               
  0264  8bc7             mov ax, di                               
  0266  d1e0             shl ax, 1                                
  0268  03d8             add bx, ax                               
  026a  268b07           mov ax, word ptr es:[bx]                 
  026d  8946f0           mov word ptr [bp - 0x10], ax             
  0270  837e0c00         cmp word ptr [bp + 0xc], 0               
  0274  7503             jne 0x279                                
  0276  e92a01           jmp 0x3a3                                
  0279  c45eec           les bx, ptr [bp - 0x14]                  
  027c  6626837f0400     cmp dword ptr es:[bx + 4], 0             
  0282  7503             jne 0x287                                
  0284  e91c01           jmp 0x3a3                                
  0287  c45eec           les bx, ptr [bp - 0x14]                  
  028a  26c45f04         les bx, ptr es:[bx + 4]                  
  028e  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0292  260b470c         or ax, word ptr es:[bx + 0xc]            
  0296  7461             je 0x2f9                                 
  0298  c45eec           les bx, ptr [bp - 0x14]                  
  029b  26c45f04         les bx, ptr es:[bx + 4]                  
  029f  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  02a5  7552             jne 0x2f9                                
  02a7  c746ea0000       mov word ptr [bp - 0x16], 0              
  02ac  eb39             jmp 0x2e7                                
  02ae  c45eec           les bx, ptr [bp - 0x14]                  
  02b1  26c45f04         les bx, ptr es:[bx + 4]                  
  02b5  8b46ea           mov ax, word ptr [bp - 0x16]             
  02b8  c1e002           shl ax, 2                                
  02bb  03d8             add bx, ax                               
  02bd  26ff770c         push word ptr es:[bx + 0xc]              
  02c1  26ff770a         push word ptr es:[bx + 0xa]              
  02c5  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  02ca  83c404           add sp, 4                                
  02cd  c45eec           les bx, ptr [bp - 0x14]                  
  02d0  26c45f04         les bx, ptr es:[bx + 4]                  
  02d4  8b76ea           mov si, word ptr [bp - 0x16]             
  02d7  c1e602           shl si, 2                                
  02da  03de             add bx, si                               
  02dc  2689571c         mov word ptr es:[bx + 0x1c], dx          
  02e0  2689471a         mov word ptr es:[bx + 0x1a], ax          
  02e4  ff46ea           inc word ptr [bp - 0x16]                 
  02e7  c45eec           les bx, ptr [bp - 0x14]                  
  02ea  26c45f04         les bx, ptr es:[bx + 4]                  
  02ee  268a4734         mov al, byte ptr es:[bx + 0x34]          
  02f2  b400             mov ah, 0                                
  02f4  3b46ea           cmp ax, word ptr [bp - 0x16]             
  02f7  7fb5             jg 0x2ae                                 
  02f9  ff76f0           push word ptr [bp - 0x10]                
  02fc  ff76f2           push word ptr [bp - 0xe]                 
  02ff  c45eec           les bx, ptr [bp - 0x14]                  
  0302  26ff7706         push word ptr es:[bx + 6]                
  0306  26ff7704         push word ptr es:[bx + 4]                
  030a  ff7608           push word ptr [bp + 8]                   
  030d  ff7606           push word ptr [bp + 6]                   
  0310  c45eec           les bx, ptr [bp - 0x14]                  
  0313  26ff7724         push word ptr es:[bx + 0x24]             
  0317  c45eec           les bx, ptr [bp - 0x14]                  
  031a  26c45f14         les bx, ptr es:[bx + 0x14]               
  031e  03df             add bx, di                               
  0320  268a07           mov al, byte ptr es:[bx]                 
  0323  b400             mov ah, 0                                
  0325  50               push ax                                  
  0326  ff76f4           push word ptr [bp - 0xc]                 
  0329  ff76f6           push word ptr [bp - 0xa]                 
  032c  16               push ss                                  
  032d  8d46f8           lea ax, [bp - 8]                         
  0330  50               push ax                                  
  0331  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0336  83c40c           add sp, 0xc                              
  0339  52               push dx                                  
  033a  50               push ax                                  
  033b  c45eec           les bx, ptr [bp - 0x14]                  
  033e  26ff7702         push word ptr es:[bx + 2]                
  0342  26ff37           push word ptr es:[bx]                    
  0345  9af800d014       lcall 0x14d0, 0xf8                       -> 14d0:00f8
  034a  83c414           add sp, 0x14                             
  034d  c45eec           les bx, ptr [bp - 0x14]                  
  0350  26c45f04         les bx, ptr es:[bx + 4]                  
  0354  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0358  260b470c         or ax, word ptr es:[bx + 0xc]            
  035c  7443             je 0x3a1                                 
  035e  c45eec           les bx, ptr [bp - 0x14]                  
  0361  26c45f04         les bx, ptr es:[bx + 4]                  
  0365  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  036b  7534             jne 0x3a1                                
  036d  33f6             xor si, si                               
  036f  eb1f             jmp 0x390                                
  0371  c45eec           les bx, ptr [bp - 0x14]                  
  0374  26c45f04         les bx, ptr es:[bx + 4]                  
  0378  8bc6             mov ax, si                               
  037a  c1e002           shl ax, 2                                
  037d  03d8             add bx, ax                               
  037f  26ff770c         push word ptr es:[bx + 0xc]              
  0383  26ff770a         push word ptr es:[bx + 0xa]              
  0387  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  038c  83c404           add sp, 4                                
  038f  46               inc si                                   
  0390  c45eec           les bx, ptr [bp - 0x14]                  
  0393  26c45f04         les bx, ptr es:[bx + 4]                  
  0397  268a4734         mov al, byte ptr es:[bx + 0x34]          
  039b  b400             mov ah, 0                                
  039d  3bc6             cmp ax, si                               
  039f  7fd0             jg 0x371                                 
  03a1  eb43             jmp 0x3e6                                
  03a3  ff7608           push word ptr [bp + 8]                   
  03a6  ff7606           push word ptr [bp + 6]                   
  03a9  c45eec           les bx, ptr [bp - 0x14]                  
  03ac  26ff7724         push word ptr es:[bx + 0x24]             
  03b0  c45eec           les bx, ptr [bp - 0x14]                  
  03b3  26c45f14         les bx, ptr es:[bx + 0x14]               
  03b7  03df             add bx, di                               
  03b9  268a07           mov al, byte ptr es:[bx]                 
  03bc  b400             mov ah, 0                                
  03be  50               push ax                                  
  03bf  ff76f4           push word ptr [bp - 0xc]                 
  03c2  ff76f6           push word ptr [bp - 0xa]                 
  03c5  16               push ss                                  
  03c6  8d46f8           lea ax, [bp - 8]                         
  03c9  50               push ax                                  
  03ca  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  03cf  83c40c           add sp, 0xc                              
  03d2  52               push dx                                  
  03d3  50               push ax                                  
  03d4  c45eec           les bx, ptr [bp - 0x14]                  
  03d7  26ff7702         push word ptr es:[bx + 2]                
  03db  26ff37           push word ptr es:[bx]                    
  03de  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  03e3  83c40c           add sp, 0xc                              
  03e6  c45eec           les bx, ptr [bp - 0x14]                  
  03e9  26c45f18         les bx, ptr es:[bx + 0x18]               
  03ed  03df             add bx, di                               
  03ef  268a07           mov al, byte ptr es:[bx]                 
  03f2  b400             mov ah, 0                                
  03f4  50               push ax                                  
  03f5  8b4606           mov ax, word ptr [bp + 6]                
  03f8  5a               pop dx                                   
  03f9  03c2             add ax, dx                               
  03fb  eb00             jmp 0x3fd                                
  03fd  5f               pop di                                   
  03fe  5e               pop si                                   
  03ff  c9               leave                                    
  0400  cb               retf                                     

res_11e2_0401:  ; ENTRY
  0401  c8040000         enter 4, 0                               
  0405  56               push si                                  
  0406  57               push di                                  
  0407  c41e4970         les bx, ptr [0x7049]                     
  040b  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  0410  668946fc         mov dword ptr [bp - 4], eax              
  0414  c45efc           les bx, ptr [bp - 4]                     
  0417  26c41f           les bx, ptr es:[bx]                      
  041a  268b470a         mov ax, word ptr es:[bx + 0xa]           
  041e  260b470c         or ax, word ptr es:[bx + 0xc]            
  0422  7455             je 0x479                                 
  0424  c45efc           les bx, ptr [bp - 4]                     
  0427  26c41f           les bx, ptr es:[bx]                      
  042a  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0430  7547             jne 0x479                                
  0432  33ff             xor di, di                               
  0434  eb33             jmp 0x469                                
  0436  c45efc           les bx, ptr [bp - 4]                     
  0439  26c41f           les bx, ptr es:[bx]                      
  043c  8bc7             mov ax, di                               
  043e  c1e002           shl ax, 2                                
  0441  03d8             add bx, ax                               
  0443  26ff770c         push word ptr es:[bx + 0xc]              
  0447  26ff770a         push word ptr es:[bx + 0xa]              
  044b  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0450  83c404           add sp, 4                                
  0453  c45efc           les bx, ptr [bp - 4]                     
  0456  26c41f           les bx, ptr es:[bx]                      
  0459  8bf7             mov si, di                               
  045b  c1e602           shl si, 2                                
  045e  03de             add bx, si                               
  0460  2689571c         mov word ptr es:[bx + 0x1c], dx          
  0464  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0468  47               inc di                                   
  0469  c45efc           les bx, ptr [bp - 4]                     
  046c  26c41f           les bx, ptr es:[bx]                      
  046f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0473  b400             mov ah, 0                                
  0475  3bc7             cmp ax, di                               
  0477  7fbd             jg 0x436                                 
  0479  eb1d             jmp 0x498                                
  047b  6a00             push 0                                   
  047d  c45e0a           les bx, ptr [bp + 0xa]                   
  0480  ff460a           inc word ptr [bp + 0xa]                  
  0483  268a07           mov al, byte ptr es:[bx]                 
  0486  98               cwde                                     
  0487  50               push ax                                  
  0488  ff7608           push word ptr [bp + 8]                   
  048b  ff7606           push word ptr [bp + 6]                   
  048e  0e               push cs                                  
  048f  e865fd           call 0x1f7                               
  0492  83c408           add sp, 8                                
  0495  894606           mov word ptr [bp + 6], ax                
  0498  c45e0a           les bx, ptr [bp + 0xa]                   
  049b  26803f00         cmp byte ptr es:[bx], 0                  
  049f  75da             jne 0x47b                                
  04a1  8b4606           mov ax, word ptr [bp + 6]                
  04a4  eb00             jmp 0x4a6                                
  04a6  5f               pop di                                   
  04a7  5e               pop si                                   
  04a8  c9               leave                                    
  04a9  cb               retf                                     

res_11e2_04aa:  ; ENTRY
  04aa  c8040000         enter 4, 0                               
  04ae  56               push si                                  
  04af  57               push di                                  
  04b0  c41e4970         les bx, ptr [0x7049]                     
  04b4  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  04b9  668946fc         mov dword ptr [bp - 4], eax              
  04bd  c45efc           les bx, ptr [bp - 4]                     
  04c0  26c41f           les bx, ptr es:[bx]                      
  04c3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  04c7  260b470c         or ax, word ptr es:[bx + 0xc]            
  04cb  7455             je 0x522                                 
  04cd  c45efc           les bx, ptr [bp - 4]                     
  04d0  26c41f           les bx, ptr es:[bx]                      
  04d3  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  04d9  7547             jne 0x522                                
  04db  33ff             xor di, di                               
  04dd  eb33             jmp 0x512                                
  04df  c45efc           les bx, ptr [bp - 4]                     
  04e2  26c41f           les bx, ptr es:[bx]                      
  04e5  8bc7             mov ax, di                               
  04e7  c1e002           shl ax, 2                                
  04ea  03d8             add bx, ax                               
  04ec  26ff770c         push word ptr es:[bx + 0xc]              
  04f0  26ff770a         push word ptr es:[bx + 0xa]              
  04f4  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  04f9  83c404           add sp, 4                                
  04fc  c45efc           les bx, ptr [bp - 4]                     
  04ff  26c41f           les bx, ptr es:[bx]                      
  0502  8bf7             mov si, di                               
  0504  c1e602           shl si, 2                                
  0507  03de             add bx, si                               
  0509  2689571c         mov word ptr es:[bx + 0x1c], dx          
  050d  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0511  47               inc di                                   
  0512  c45efc           les bx, ptr [bp - 4]                     
  0515  26c41f           les bx, ptr es:[bx]                      
  0518  268a4734         mov al, byte ptr es:[bx + 0x34]          
  051c  b400             mov ah, 0                                
  051e  3bc7             cmp ax, di                               
  0520  7fbd             jg 0x4df                                 
  0522  eb1d             jmp 0x541                                
  0524  6a01             push 1                                   
  0526  c45e0a           les bx, ptr [bp + 0xa]                   
  0529  ff460a           inc word ptr [bp + 0xa]                  
  052c  268a07           mov al, byte ptr es:[bx]                 
  052f  98               cwde                                     
  0530  50               push ax                                  
  0531  ff7608           push word ptr [bp + 8]                   
  0534  ff7606           push word ptr [bp + 6]                   
  0537  0e               push cs                                  
  0538  e8bcfc           call 0x1f7                               
  053b  83c408           add sp, 8                                
  053e  894606           mov word ptr [bp + 6], ax                
  0541  c45e0a           les bx, ptr [bp + 0xa]                   
  0544  26803f00         cmp byte ptr es:[bx], 0                  
  0548  75da             jne 0x524                                
  054a  8b4606           mov ax, word ptr [bp + 6]                
  054d  eb00             jmp 0x54f                                
  054f  5f               pop di                                   
  0550  5e               pop si                                   
  0551  c9               leave                                    
  0552  cb               retf                                     

res_11e2_0553:  ; ENTRY
  0553  c80e0000         enter 0xe, 0                             
  0557  56               push si                                  
  0558  57               push di                                  
  0559  8b7e0a           mov di, word ptr [bp + 0xa]              
  055c  c41e4970         les bx, ptr [0x7049]                     
  0560  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  0565  668946f4         mov dword ptr [bp - 0xc], eax            
  0569  57               push di                                  
  056a  90               nop                                      
  056b  0e               push cs                                  
  056c  e87405           call 0xae3                               
  056f  59               pop cx                                   
  0570  8bf8             mov di, ax                               
  0572  c45ef4           les bx, ptr [bp - 0xc]                   
  0575  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  0579  8bc7             mov ax, di                               
  057b  d1e0             shl ax, 1                                
  057d  03d8             add bx, ax                               
  057f  268b07           mov ax, word ptr es:[bx]                 
  0582  8946fe           mov word ptr [bp - 2], ax                
  0585  c45ef4           les bx, ptr [bp - 0xc]                   
  0588  26c45f20         les bx, ptr es:[bx + 0x20]               
  058c  8bc7             mov ax, di                               
  058e  d1e0             shl ax, 1                                
  0590  03d8             add bx, ax                               
  0592  268b07           mov ax, word ptr es:[bx]                 
  0595  8946fc           mov word ptr [bp - 4], ax                
  0598  b8f32e           mov ax, 0x2ef3                           
  059b  8ec0             mov es, ax                               
  059d  26c41e0000       les bx, ptr es:[0]                       
  05a2  26c45f1c         les bx, ptr es:[bx + 0x1c]               
  05a6  8bc7             mov ax, di                               
  05a8  d1e0             shl ax, 1                                
  05aa  03d8             add bx, ax                               
  05ac  268b07           mov ax, word ptr es:[bx]                 
  05af  8946fa           mov word ptr [bp - 6], ax                
  05b2  b8f32e           mov ax, 0x2ef3                           
  05b5  8ec0             mov es, ax                               
  05b7  26c41e0000       les bx, ptr es:[0]                       
  05bc  26c45f20         les bx, ptr es:[bx + 0x20]               
  05c0  8bc7             mov ax, di                               
  05c2  d1e0             shl ax, 1                                
  05c4  03d8             add bx, ax                               
  05c6  268b07           mov ax, word ptr es:[bx]                 
  05c9  8946f8           mov word ptr [bp - 8], ax                
  05cc  837e0c00         cmp word ptr [bp + 0xc], 0               
  05d0  7503             jne 0x5d5                                
  05d2  e9be01           jmp 0x793                                
  05d5  c45ef4           les bx, ptr [bp - 0xc]                   
  05d8  6626837f0400     cmp dword ptr es:[bx + 4], 0             
  05de  7503             jne 0x5e3                                
  05e0  e9b001           jmp 0x793                                
  05e3  c45ef4           les bx, ptr [bp - 0xc]                   
  05e6  26c45f04         les bx, ptr es:[bx + 4]                  
  05ea  268b470a         mov ax, word ptr es:[bx + 0xa]           
  05ee  260b470c         or ax, word ptr es:[bx + 0xc]            
  05f2  7461             je 0x655                                 
  05f4  c45ef4           les bx, ptr [bp - 0xc]                   
  05f7  26c45f04         les bx, ptr es:[bx + 4]                  
  05fb  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0601  7552             jne 0x655                                
  0603  c746f20000       mov word ptr [bp - 0xe], 0               
  0608  eb39             jmp 0x643                                
  060a  c45ef4           les bx, ptr [bp - 0xc]                   
  060d  26c45f04         les bx, ptr es:[bx + 4]                  
  0611  8b46f2           mov ax, word ptr [bp - 0xe]              
  0614  c1e002           shl ax, 2                                
  0617  03d8             add bx, ax                               
  0619  26ff770c         push word ptr es:[bx + 0xc]              
  061d  26ff770a         push word ptr es:[bx + 0xa]              
  0621  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0626  83c404           add sp, 4                                
  0629  c45ef4           les bx, ptr [bp - 0xc]                   
  062c  26c45f04         les bx, ptr es:[bx + 4]                  
  0630  8b76f2           mov si, word ptr [bp - 0xe]              
  0633  c1e602           shl si, 2                                
  0636  03de             add bx, si                               
  0638  2689571c         mov word ptr es:[bx + 0x1c], dx          
  063c  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0640  ff46f2           inc word ptr [bp - 0xe]                  
  0643  c45ef4           les bx, ptr [bp - 0xc]                   
  0646  26c45f04         les bx, ptr es:[bx + 4]                  
  064a  268a4734         mov al, byte ptr es:[bx + 0x34]          
  064e  b400             mov ah, 0                                
  0650  3b46f2           cmp ax, word ptr [bp - 0xe]              
  0653  7fb5             jg 0x60a                                 
  0655  c45e0e           les bx, ptr [bp + 0xe]                   
  0658  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  065e  7451             je 0x6b1                                 
  0660  c45e0e           les bx, ptr [bp + 0xe]                   
  0663  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0669  7546             jne 0x6b1                                
  066b  c746f20000       mov word ptr [bp - 0xe], 0               
  0670  eb31             jmp 0x6a3                                
  0672  8b46f2           mov ax, word ptr [bp - 0xe]              
  0675  c1e002           shl ax, 2                                
  0678  c45e0e           les bx, ptr [bp + 0xe]                   
  067b  03d8             add bx, ax                               
  067d  26ff770c         push word ptr es:[bx + 0xc]              
  0681  26ff770a         push word ptr es:[bx + 0xa]              
  0685  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  068a  83c404           add sp, 4                                
  068d  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0690  c1e302           shl bx, 2                                
  0693  c4760e           les si, ptr [bp + 0xe]                   
  0696  03f3             add si, bx                               
  0698  2689541c         mov word ptr es:[si + 0x1c], dx          
  069c  2689441a         mov word ptr es:[si + 0x1a], ax          
  06a0  ff46f2           inc word ptr [bp - 0xe]                  
  06a3  c45e0e           les bx, ptr [bp + 0xe]                   
  06a6  268a4734         mov al, byte ptr es:[bx + 0x34]          
  06aa  b400             mov ah, 0                                
  06ac  3b46f2           cmp ax, word ptr [bp - 0xe]              
  06af  7fc1             jg 0x672                                 
  06b1  ff7608           push word ptr [bp + 8]                   
  06b4  ff7606           push word ptr [bp + 6]                   
  06b7  ff7610           push word ptr [bp + 0x10]                
  06ba  ff760e           push word ptr [bp + 0xe]                 
  06bd  ff76f8           push word ptr [bp - 8]                   
  06c0  ff76fa           push word ptr [bp - 6]                   
  06c3  c45ef4           les bx, ptr [bp - 0xc]                   
  06c6  26ff7706         push word ptr es:[bx + 6]                
  06ca  26ff7704         push word ptr es:[bx + 4]                
  06ce  c45ef4           les bx, ptr [bp - 0xc]                   
  06d1  26ff7724         push word ptr es:[bx + 0x24]             
  06d5  c45ef4           les bx, ptr [bp - 0xc]                   
  06d8  26c45f14         les bx, ptr es:[bx + 0x14]               
  06dc  03df             add bx, di                               
  06de  268a07           mov al, byte ptr es:[bx]                 
  06e1  b400             mov ah, 0                                
  06e3  50               push ax                                  
  06e4  ff76fc           push word ptr [bp - 4]                   
  06e7  ff76fe           push word ptr [bp - 2]                   
  06ea  c45ef4           les bx, ptr [bp - 0xc]                   
  06ed  26ff7702         push word ptr es:[bx + 2]                
  06f1  26ff37           push word ptr es:[bx]                    
  06f4  ff1ec869         lcall [0x69c8]                           
  06f8  83c41c           add sp, 0x1c                             
  06fb  c45e0e           les bx, ptr [bp + 0xe]                   
  06fe  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0704  7437             je 0x73d                                 
  0706  c45e0e           les bx, ptr [bp + 0xe]                   
  0709  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  070f  752c             jne 0x73d                                
  0711  33f6             xor si, si                               
  0713  eb1b             jmp 0x730                                
  0715  8bc6             mov ax, si                               
  0717  c1e002           shl ax, 2                                
  071a  c45e0e           les bx, ptr [bp + 0xe]                   
  071d  03d8             add bx, ax                               
  071f  26ff770c         push word ptr es:[bx + 0xc]              
  0723  26ff770a         push word ptr es:[bx + 0xa]              
  0727  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  072c  83c404           add sp, 4                                
  072f  46               inc si                                   
  0730  c45e0e           les bx, ptr [bp + 0xe]                   
  0733  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0737  b400             mov ah, 0                                
  0739  3bc6             cmp ax, si                               
  073b  7fd8             jg 0x715                                 
  073d  c45ef4           les bx, ptr [bp - 0xc]                   
  0740  26c45f04         les bx, ptr es:[bx + 4]                  
  0744  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0748  260b470c         or ax, word ptr es:[bx + 0xc]            
  074c  7443             je 0x791                                 
  074e  c45ef4           les bx, ptr [bp - 0xc]                   
  0751  26c45f04         les bx, ptr es:[bx + 4]                  
  0755  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  075b  7534             jne 0x791                                
  075d  33f6             xor si, si                               
  075f  eb1f             jmp 0x780                                
  0761  c45ef4           les bx, ptr [bp - 0xc]                   
  0764  26c45f04         les bx, ptr es:[bx + 4]                  
  0768  8bc6             mov ax, si                               
  076a  c1e002           shl ax, 2                                
  076d  03d8             add bx, ax                               
  076f  26ff770c         push word ptr es:[bx + 0xc]              
  0773  26ff770a         push word ptr es:[bx + 0xa]              
  0777  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  077c  83c404           add sp, 4                                
  077f  46               inc si                                   
  0780  c45ef4           les bx, ptr [bp - 0xc]                   
  0783  26c45f04         les bx, ptr es:[bx + 4]                  
  0787  268a4734         mov al, byte ptr es:[bx + 0x34]          
  078b  b400             mov ah, 0                                
  078d  3bc6             cmp ax, si                               
  078f  7fd0             jg 0x761                                 
  0791  eb39             jmp 0x7cc                                
  0793  ff7608           push word ptr [bp + 8]                   
  0796  ff7606           push word ptr [bp + 6]                   
  0799  ff7610           push word ptr [bp + 0x10]                
  079c  ff760e           push word ptr [bp + 0xe]                 
  079f  c45ef4           les bx, ptr [bp - 0xc]                   
  07a2  26ff7724         push word ptr es:[bx + 0x24]             
  07a6  c45ef4           les bx, ptr [bp - 0xc]                   
  07a9  26c45f14         les bx, ptr es:[bx + 0x14]               
  07ad  03df             add bx, di                               
  07af  268a07           mov al, byte ptr es:[bx]                 
  07b2  b400             mov ah, 0                                
  07b4  50               push ax                                  
  07b5  ff76fc           push word ptr [bp - 4]                   
  07b8  ff76fe           push word ptr [bp - 2]                   
  07bb  c45ef4           les bx, ptr [bp - 0xc]                   
  07be  26ff7702         push word ptr es:[bx + 2]                
  07c2  26ff37           push word ptr es:[bx]                    
  07c5  ff1ed469         lcall [0x69d4]                           
  07c9  83c414           add sp, 0x14                             
  07cc  c45ef4           les bx, ptr [bp - 0xc]                   
  07cf  26c45f18         les bx, ptr es:[bx + 0x18]               
  07d3  03df             add bx, di                               
  07d5  268a07           mov al, byte ptr es:[bx]                 
  07d8  b400             mov ah, 0                                
  07da  50               push ax                                  
  07db  8b4606           mov ax, word ptr [bp + 6]                
  07de  5a               pop dx                                   
  07df  03c2             add ax, dx                               
  07e1  eb00             jmp 0x7e3                                
  07e3  5f               pop di                                   
  07e4  5e               pop si                                   
  07e5  c9               leave                                    
  07e6  cb               retf                                     
  07e7  c8040000         enter 4, 0                               
  07eb  56               push si                                  
  07ec  57               push di                                  
  07ed  c41e4970         les bx, ptr [0x7049]                     
  07f1  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  07f6  668946fc         mov dword ptr [bp - 4], eax              
  07fa  c45efc           les bx, ptr [bp - 4]                     
  07fd  26c41f           les bx, ptr es:[bx]                      
  0800  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0804  260b470c         or ax, word ptr es:[bx + 0xc]            
  0808  7455             je 0x85f                                 
  080a  c45efc           les bx, ptr [bp - 4]                     
  080d  26c41f           les bx, ptr es:[bx]                      
  0810  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0816  7547             jne 0x85f                                
  0818  33ff             xor di, di                               
  081a  eb33             jmp 0x84f                                
  081c  c45efc           les bx, ptr [bp - 4]                     
  081f  26c41f           les bx, ptr es:[bx]                      
  0822  8bc7             mov ax, di                               
  0824  c1e002           shl ax, 2                                
  0827  03d8             add bx, ax                               
  0829  26ff770c         push word ptr es:[bx + 0xc]              
  082d  26ff770a         push word ptr es:[bx + 0xa]              
  0831  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0836  83c404           add sp, 4                                
  0839  c45efc           les bx, ptr [bp - 4]                     
  083c  26c41f           les bx, ptr es:[bx]                      
  083f  8bf7             mov si, di                               
  0841  c1e602           shl si, 2                                
  0844  03de             add bx, si                               
  0846  2689571c         mov word ptr es:[bx + 0x1c], dx          
  084a  2689471a         mov word ptr es:[bx + 0x1a], ax          
  084e  47               inc di                                   
  084f  c45efc           les bx, ptr [bp - 4]                     
  0852  26c41f           les bx, ptr es:[bx]                      
  0855  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0859  b400             mov ah, 0                                
  085b  3bc7             cmp ax, di                               
  085d  7fbd             jg 0x81c                                 
  085f  eb23             jmp 0x884                                
  0861  ff7610           push word ptr [bp + 0x10]                
  0864  ff760e           push word ptr [bp + 0xe]                 
  0867  6a00             push 0                                   
  0869  c45e0a           les bx, ptr [bp + 0xa]                   
  086c  ff460a           inc word ptr [bp + 0xa]                  
  086f  268a07           mov al, byte ptr es:[bx]                 
  0872  98               cwde                                     
  0873  50               push ax                                  
  0874  ff7608           push word ptr [bp + 8]                   
  0877  ff7606           push word ptr [bp + 6]                   
  087a  0e               push cs                                  
  087b  e8d5fc           call 0x553                               
  087e  83c40c           add sp, 0xc                              
  0881  894606           mov word ptr [bp + 6], ax                
  0884  c45e0a           les bx, ptr [bp + 0xa]                   
  0887  26803f00         cmp byte ptr es:[bx], 0                  
  088b  75d4             jne 0x861                                
  088d  8b4606           mov ax, word ptr [bp + 6]                
  0890  eb00             jmp 0x892                                
  0892  5f               pop di                                   
  0893  5e               pop si                                   
  0894  c9               leave                                    
  0895  cb               retf                                     
  0896  c8040000         enter 4, 0                               
  089a  56               push si                                  
  089b  57               push di                                  
  089c  c41e4970         les bx, ptr [0x7049]                     
  08a0  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  08a5  668946fc         mov dword ptr [bp - 4], eax              
  08a9  c45efc           les bx, ptr [bp - 4]                     
  08ac  26c41f           les bx, ptr es:[bx]                      
  08af  268b470a         mov ax, word ptr es:[bx + 0xa]           
  08b3  260b470c         or ax, word ptr es:[bx + 0xc]            
  08b7  7455             je 0x90e                                 
  08b9  c45efc           les bx, ptr [bp - 4]                     
  08bc  26c41f           les bx, ptr es:[bx]                      
  08bf  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  08c5  7547             jne 0x90e                                
  08c7  33ff             xor di, di                               
  08c9  eb33             jmp 0x8fe                                
  08cb  c45efc           les bx, ptr [bp - 4]                     
  08ce  26c41f           les bx, ptr es:[bx]                      
  08d1  8bc7             mov ax, di                               
  08d3  c1e002           shl ax, 2                                
  08d6  03d8             add bx, ax                               
  08d8  26ff770c         push word ptr es:[bx + 0xc]              
  08dc  26ff770a         push word ptr es:[bx + 0xa]              
  08e0  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  08e5  83c404           add sp, 4                                
  08e8  c45efc           les bx, ptr [bp - 4]                     
  08eb  26c41f           les bx, ptr es:[bx]                      
  08ee  8bf7             mov si, di                               
  08f0  c1e602           shl si, 2                                
  08f3  03de             add bx, si                               
  08f5  2689571c         mov word ptr es:[bx + 0x1c], dx          
  08f9  2689471a         mov word ptr es:[bx + 0x1a], ax          
  08fd  47               inc di                                   
  08fe  c45efc           les bx, ptr [bp - 4]                     
  0901  26c41f           les bx, ptr es:[bx]                      
  0904  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0908  b400             mov ah, 0                                
  090a  3bc7             cmp ax, di                               
  090c  7fbd             jg 0x8cb                                 
  090e  eb23             jmp 0x933                                
  0910  ff7610           push word ptr [bp + 0x10]                
  0913  ff760e           push word ptr [bp + 0xe]                 
  0916  6a01             push 1                                   
  0918  c45e0a           les bx, ptr [bp + 0xa]                   
  091b  ff460a           inc word ptr [bp + 0xa]                  
  091e  268a07           mov al, byte ptr es:[bx]                 
  0921  98               cwde                                     
  0922  50               push ax                                  
  0923  ff7608           push word ptr [bp + 8]                   
  0926  ff7606           push word ptr [bp + 6]                   
  0929  0e               push cs                                  
  092a  e826fc           call 0x553                               
  092d  83c40c           add sp, 0xc                              
  0930  894606           mov word ptr [bp + 6], ax                
  0933  c45e0a           les bx, ptr [bp + 0xa]                   
  0936  26803f00         cmp byte ptr es:[bx], 0                  
  093a  75d4             jne 0x910                                
  093c  8b4606           mov ax, word ptr [bp + 6]                
  093f  eb00             jmp 0x941                                
  0941  5f               pop di                                   
  0942  5e               pop si                                   
  0943  c9               leave                                    
  0944  cb               retf                                     
  0945  c8a40000         enter 0xa4, 0                            
  0949  8d460e           lea ax, [bp + 0xe]                       
  094c  8c56fe           mov word ptr [bp - 2], ss                
  094f  8946fc           mov word ptr [bp - 4], ax                
  0952  ff76fe           push word ptr [bp - 2]                   
  0955  ff76fc           push word ptr [bp - 4]                   
  0958  ff760c           push word ptr [bp + 0xc]                 
  095b  ff760a           push word ptr [bp + 0xa]                 
  095e  16               push ss                                  
  095f  8d865cff         lea ax, [bp - 0xa4]                      
  0963  50               push ax                                  
  0964  9a66490000       lcall 0, 0x4966                          -> 0000:4966
  0969  83c40c           add sp, 0xc                              
  096c  16               push ss                                  
  096d  8d865cff         lea ax, [bp - 0xa4]                      
  0971  50               push ax                                  
  0972  ff7608           push word ptr [bp + 8]                   
  0975  ff7606           push word ptr [bp + 6]                   
  0978  0e               push cs                                  
  0979  e885fa           call 0x401                               
  097c  83c408           add sp, 8                                
  097f  eb00             jmp 0x981                                
  0981  c9               leave                                    
  0982  cb               retf                                     
  0983  c8060000         enter 6, 0                               
  0987  56               push si                                  
  0988  57               push di                                  
  0989  8b7606           mov si, word ptr [bp + 6]                
  098c  8b7e08           mov di, word ptr [bp + 8]                
  098f  6a0a             push 0xa                                 
  0991  16               push ss                                  
  0992  8d46fa           lea ax, [bp - 6]                         
  0995  50               push ax                                  
  0996  ff760a           push word ptr [bp + 0xa]                 
  0999  9ad5420000       lcall 0, 0x42d5                          -> 0000:42d5
  099e  83c408           add sp, 8                                
  09a1  16               push ss                                  
  09a2  8d46fa           lea ax, [bp - 6]                         
  09a5  50               push ax                                  
  09a6  90               nop                                      
  09a7  0e               push cs                                  
  09a8  e8e300           call 0xa8e                               
  09ab  83c404           add sp, 4                                
  09ae  8bd0             mov dx, ax                               
  09b0  3b560c           cmp dx, word ptr [bp + 0xc]              
  09b3  7e0f             jle 0x9c4                                
  09b5  ff760c           push word ptr [bp + 0xc]                 
  09b8  57               push di                                  
  09b9  56               push si                                  
  09ba  90               nop                                      
  09bb  0e               push cs                                  
  09bc  e87401           call 0xb33                               
  09bf  83c406           add sp, 6                                
  09c2  eb22             jmp 0x9e6                                
  09c4  8b460c           mov ax, word ptr [bp + 0xc]              
  09c7  2bc2             sub ax, dx                               
  09c9  50               push ax                                  
  09ca  57               push di                                  
  09cb  56               push si                                  
  09cc  90               nop                                      
  09cd  0e               push cs                                  
  09ce  e86201           call 0xb33                               
  09d1  83c406           add sp, 6                                
  09d4  8bf0             mov si, ax                               
  09d6  16               push ss                                  
  09d7  8d46fa           lea ax, [bp - 6]                         
  09da  50               push ax                                  
  09db  57               push di                                  
  09dc  56               push si                                  
  09dd  0e               push cs                                  
  09de  e820fa           call 0x401                               
  09e1  83c408           add sp, 8                                
  09e4  ebdc             jmp 0x9c2                                
  09e6  5f               pop di                                   
  09e7  5e               pop si                                   
  09e8  c9               leave                                    
  09e9  cb               retf                                     
  09ea  55               push bp                                  
  09eb  8bec             mov bp, sp                               
  09ed  56               push si                                  
  09ee  57               push di                                  
  09ef  8b7e06           mov di, word ptr [bp + 6]                
  09f2  33f6             xor si, si                               
  09f4  eb31             jmp 0xa27                                
  09f6  c45e0a           les bx, ptr [bp + 0xa]                   
  09f9  268a07           mov al, byte ptr es:[bx]                 
  09fc  98               cwde                                     
  09fd  50               push ax                                  
  09fe  90               nop                                      
  09ff  0e               push cs                                  
  0a00  e85000           call 0xa53                               
  0a03  59               pop cx                                   
  0a04  03f0             add si, ax                               
  0a06  3b760e           cmp si, word ptr [bp + 0xe]              
  0a09  7c02             jl 0xa0d                                 
  0a0b  eb23             jmp 0xa30                                
  0a0d  6a00             push 0                                   
  0a0f  c45e0a           les bx, ptr [bp + 0xa]                   
  0a12  ff460a           inc word ptr [bp + 0xa]                  
  0a15  268a07           mov al, byte ptr es:[bx]                 
  0a18  98               cwde                                     
  0a19  50               push ax                                  
  0a1a  ff7608           push word ptr [bp + 8]                   
  0a1d  57               push di                                  
  0a1e  0e               push cs                                  
  0a1f  e8d5f7           call 0x1f7                               
  0a22  83c408           add sp, 8                                
  0a25  8bf8             mov di, ax                               
  0a27  c45e0a           les bx, ptr [bp + 0xa]                   
  0a2a  26803f00         cmp byte ptr es:[bx], 0                  
  0a2e  75c6             jne 0x9f6                                
  0a30  8bc6             mov ax, si                               
  0a32  2b460e           sub ax, word ptr [bp + 0xe]              
  0a35  7c04             jl 0xa3b                                 
  0a37  8bc7             mov ax, di                               
  0a39  eb14             jmp 0xa4f                                
  0a3b  8b460e           mov ax, word ptr [bp + 0xe]              
  0a3e  2bc6             sub ax, si                               
  0a40  50               push ax                                  
  0a41  ff7608           push word ptr [bp + 8]                   
  0a44  57               push di                                  
  0a45  90               nop                                      
  0a46  0e               push cs                                  
  0a47  e8e900           call 0xb33                               
  0a4a  83c406           add sp, 6                                
  0a4d  ebea             jmp 0xa39                                
  0a4f  5f               pop di                                   
  0a50  5e               pop si                                   
  0a51  5d               pop bp                                   
  0a52  cb               retf                                     

res_11e2_0a53:  ; ENTRY
  0a53  55               push bp                                  
  0a54  8bec             mov bp, sp                               
  0a56  ff7606           push word ptr [bp + 6]                   
  0a59  90               nop                                      
  0a5a  0e               push cs                                  
  0a5b  e88500           call 0xae3                               
  0a5e  59               pop cx                                   
  0a5f  c41e4970         les bx, ptr [0x7049]                     
  0a63  26c45f61         les bx, ptr es:[bx + 0x61]               
  0a67  26c45718         les dx, ptr es:[bx + 0x18]               
  0a6b  03d0             add dx, ax                               
  0a6d  8bda             mov bx, dx                               
  0a6f  268a07           mov al, byte ptr es:[bx]                 
  0a72  b400             mov ah, 0                                
  0a74  eb00             jmp 0xa76                                
  0a76  5d               pop bp                                   
  0a77  cb               retf                                     

res_11e2_0a78:  ; ENTRY
  0a78  55               push bp                                  
  0a79  8bec             mov bp, sp                               
  0a7b  8b5606           mov dx, word ptr [bp + 6]                
  0a7e  c41e4970         les bx, ptr [0x7049]                     
  0a82  26c45f61         les bx, ptr es:[bx + 0x61]               
  0a86  268b4724         mov ax, word ptr es:[bx + 0x24]          
  0a8a  eb00             jmp 0xa8c                                
  0a8c  5d               pop bp                                   
  0a8d  cb               retf                                     

res_11e2_0a8e:  ; ENTRY
  0a8e  55               push bp                                  
  0a8f  8bec             mov bp, sp                               
  0a91  56               push si                                  
  0a92  33f6             xor si, si                               
  0a94  eb12             jmp 0xaa8                                
  0a96  c45e06           les bx, ptr [bp + 6]                     
  0a99  ff4606           inc word ptr [bp + 6]                    
  0a9c  268a07           mov al, byte ptr es:[bx]                 
  0a9f  98               cwde                                     
  0aa0  50               push ax                                  
  0aa1  0e               push cs                                  
  0aa2  e8aeff           call 0xa53                               
  0aa5  59               pop cx                                   
  0aa6  03f0             add si, ax                               
  0aa8  c45e06           les bx, ptr [bp + 6]                     
  0aab  26803f00         cmp byte ptr es:[bx], 0                  
  0aaf  75e5             jne 0xa96                                
  0ab1  8bc6             mov ax, si                               
  0ab3  eb00             jmp 0xab5                                
  0ab5  5e               pop si                                   
  0ab6  5d               pop bp                                   
  0ab7  cb               retf                                     

res_11e2_0ab8:  ; ENTRY
  0ab8  55               push bp                                  
  0ab9  8bec             mov bp, sp                               
  0abb  ff7608           push word ptr [bp + 8]                   
  0abe  ff7606           push word ptr [bp + 6]                   
  0ac1  0e               push cs                                  
  0ac2  e8c9ff           call 0xa8e                               
  0ac5  83c404           add sp, 4                                
  0ac8  c45e0a           les bx, ptr [bp + 0xa]                   
  0acb  268907           mov word ptr es:[bx], ax                 
  0ace  c45e06           les bx, ptr [bp + 6]                     
  0ad1  268a07           mov al, byte ptr es:[bx]                 
  0ad4  98               cwde                                     
  0ad5  50               push ax                                  
  0ad6  0e               push cs                                  
  0ad7  e89eff           call 0xa78                               
  0ada  59               pop cx                                   
  0adb  c45e0e           les bx, ptr [bp + 0xe]                   
  0ade  268907           mov word ptr es:[bx], ax                 
  0ae1  5d               pop bp                                   
  0ae2  cb               retf                                     

res_11e2_0ae3:  ; ENTRY
  0ae3  55               push bp                                  
  0ae4  8bec             mov bp, sp                               
  0ae6  56               push si                                  
  0ae7  8b7606           mov si, word ptr [bp + 6]                
  0aea  c41e4970         les bx, ptr [0x7049]                     
  0aee  26c45f61         les bx, ptr es:[bx + 0x61]               
  0af2  26f747260200     test word ptr es:[bx + 0x26], 2          
  0af8  7410             je 0xb0a                                 
  0afa  f6845f3a08       test byte ptr [si + 0x3a5f], 8           
  0aff  7409             je 0xb0a                                 
  0b01  56               push si                                  
  0b02  9ab9280000       lcall 0, 0x28b9                          -> 0000:28b9
  0b07  59               pop cx                                   
  0b08  8bf0             mov si, ax                               
  0b0a  c41e4970         les bx, ptr [0x7049]                     
  0b0e  26c45f61         les bx, ptr es:[bx + 0x61]               
  0b12  262b7710         sub si, word ptr es:[bx + 0x10]          
  0b16  0bf6             or si, si                                
  0b18  7d02             jge 0xb1c                                
  0b1a  33f6             xor si, si                               
  0b1c  c41e4970         les bx, ptr [0x7049]                     
  0b20  26c45f61         les bx, ptr es:[bx + 0x61]               
  0b24  26397712         cmp word ptr es:[bx + 0x12], si          
  0b28  7d02             jge 0xb2c                                
  0b2a  33f6             xor si, si                               
  0b2c  8bc6             mov ax, si                               
  0b2e  eb00             jmp 0xb30                                
  0b30  5e               pop si                                   
  0b31  5d               pop bp                                   
  0b32  cb               retf                                     

res_11e2_0b33:  ; ENTRY
  0b33  c80c0000         enter 0xc, 0                             
  0b37  56               push si                                  
  0b38  57               push di                                  
  0b39  8b7606           mov si, word ptr [bp + 6]                
  0b3c  8b7e0a           mov di, word ptr [bp + 0xa]              
  0b3f  c41e4970         les bx, ptr [0x7049]                     
  0b43  66268b4761       mov eax, dword ptr es:[bx + 0x61]        
  0b48  668946f4         mov dword ptr [bp - 0xc], eax            
  0b4c  0bff             or di, di                                
  0b4e  7504             jne 0xb54                                
  0b50  8bc6             mov ax, si                               
  0b52  eb41             jmp 0xb95                                
  0b54  c45ef4           les bx, ptr [bp - 0xc]                   
  0b57  26ff7724         push word ptr es:[bx + 0x24]             
  0b5b  57               push di                                  
  0b5c  ff7608           push word ptr [bp + 8]                   
  0b5f  56               push si                                  
  0b60  16               push ss                                  
  0b61  8d46f8           lea ax, [bp - 8]                         
  0b64  50               push ax                                  
  0b65  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0b6a  83c40c           add sp, 0xc                              
  0b6d  52               push dx                                  
  0b6e  50               push ax                                  
  0b6f  9a3701b014       lcall 0x14b0, 0x137                      -> 14b0:0137
  0b74  83c404           add sp, 4                                
  0b77  c45ef4           les bx, ptr [bp - 0xc]                   
  0b7a  26ff7728         push word ptr es:[bx + 0x28]             
  0b7e  16               push ss                                  
  0b7f  8d46f8           lea ax, [bp - 8]                         
  0b82  50               push ax                                  
  0b83  1e               push ds                                  
  0b84  682a34           push 0x342a                              
  0b87  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  0b8c  83c40a           add sp, 0xa                              
  0b8f  8bc6             mov ax, si                               
  0b91  03c7             add ax, di                               
  0b93  ebbd             jmp 0xb52                                
  0b95  5f               pop di                                   
  0b96  5e               pop si                                   
  0b97  c9               leave                                    
  0b98  cb               retf                                     

res_11e2_0b99:  ; ENTRY
  0b99  55               push bp                                  
  0b9a  8bec             mov bp, sp                               
  0b9c  66837e0600       cmp dword ptr [bp + 6], 0                
  0ba1  7419             je 0xbbc                                 
  0ba3  c45e06           les bx, ptr [bp + 6]                     
  0ba6  26f747260100     test word ptr es:[bx + 0x26], 1          
  0bac  740e             je 0xbbc                                 
  0bae  ff7608           push word ptr [bp + 8]                   
  0bb1  ff7606           push word ptr [bp + 6]                   
  0bb4  9ad6320000       lcall 0, 0x32d6                          -> 0000:32d6
  0bb9  83c404           add sp, 4                                
  0bbc  5d               pop bp                                   
  0bbd  cb               retf                                     
  0bbe  56               push si                                  
