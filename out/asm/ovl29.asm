; ovl29 stub 2ff7 file_off 0x55d40 size 0x1b71

ovl29_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  b96400           mov cx, 0x64                             
  0006  e9f600           jmp 0xff                                 
  0009  8bd9             mov bx, cx                               
  000b  6bdb41           imul bx, bx, 0x41                        
  000e  b8042c           mov ax, 0x2c04                           
  0011  b200             mov dl, 0                                
  0013  8ec0             mov es, ax                               
  0015  268897aa15       mov byte ptr es:[bx + 0x15aa], dl        
  001a  8ac2             mov al, dl                               
  001c  8bd9             mov bx, cx                               
  001e  6bdb41           imul bx, bx, 0x41                        
  0021  ba042c           mov dx, 0x2c04                           
  0024  8ec2             mov es, dx                               
  0026  268887ab15       mov byte ptr es:[bx + 0x15ab], al        
  002b  8bd9             mov bx, cx                               
  002d  6bdb41           imul bx, bx, 0x41                        
  0030  ba042c           mov dx, 0x2c04                           
  0033  8ec2             mov es, dx                               
  0035  268887a915       mov byte ptr es:[bx + 0x15a9], al        
  003a  8bd9             mov bx, cx                               
  003c  6bdb41           imul bx, bx, 0x41                        
  003f  b8042c           mov ax, 0x2c04                           
  0042  33d2             xor dx, dx                               
  0044  8ec0             mov es, ax                               
  0046  268997b215       mov word ptr es:[bx + 0x15b2], dx        
  004b  8bc2             mov ax, dx                               
  004d  8bd9             mov bx, cx                               
  004f  6bdb41           imul bx, bx, 0x41                        
  0052  ba042c           mov dx, 0x2c04                           
  0055  8ec2             mov es, dx                               
  0057  268987b015       mov word ptr es:[bx + 0x15b0], ax        
  005c  8bd9             mov bx, cx                               
  005e  6bdb41           imul bx, bx, 0x41                        
  0061  ba042c           mov dx, 0x2c04                           
  0064  8ec2             mov es, dx                               
  0066  268987ae15       mov word ptr es:[bx + 0x15ae], ax        
  006b  8bd9             mov bx, cx                               
  006d  6bdb41           imul bx, bx, 0x41                        
  0070  b8042c           mov ax, 0x2c04                           
  0073  8ec0             mov es, ax                               
  0075  2680a7b51500     and byte ptr es:[bx + 0x15b5], 0         
  007b  8bd9             mov bx, cx                               
  007d  6bdb41           imul bx, bx, 0x41                        
  0080  b8042c           mov ax, 0x2c04                           
  0083  8ec0             mov es, ax                               
  0085  2680a7b41500     and byte ptr es:[bx + 0x15b4], 0         
  008b  26808fb41500     or byte ptr es:[bx + 0x15b4], 0          
  0091  8bd9             mov bx, cx                               
  0093  6bdb41           imul bx, bx, 0x41                        
  0096  b8042c           mov ax, 0x2c04                           
  0099  33d2             xor dx, dx                               
  009b  8ec0             mov es, ax                               
  009d  268997bc15       mov word ptr es:[bx + 0x15bc], dx        
  00a2  8bc2             mov ax, dx                               
  00a4  8bd9             mov bx, cx                               
  00a6  6bdb41           imul bx, bx, 0x41                        
  00a9  ba042c           mov dx, 0x2c04                           
  00ac  8ec2             mov es, dx                               
  00ae  268987ba15       mov word ptr es:[bx + 0x15ba], ax        
  00b3  8bd9             mov bx, cx                               
  00b5  6bdb41           imul bx, bx, 0x41                        
  00b8  ba042c           mov dx, 0x2c04                           
  00bb  8ec2             mov es, dx                               
  00bd  268987b815       mov word ptr es:[bx + 0x15b8], ax        
  00c2  8bd9             mov bx, cx                               
  00c4  6bdb41           imul bx, bx, 0x41                        
  00c7  ba042c           mov dx, 0x2c04                           
  00ca  8ec2             mov es, dx                               
  00cc  268987b615       mov word ptr es:[bx + 0x15b6], ax        
  00d1  8bd9             mov bx, cx                               
  00d3  6bdb41           imul bx, bx, 0x41                        
  00d6  b8042c           mov ax, 0x2c04                           
  00d9  8ec0             mov es, ax                               
  00db  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  00e0  8bd9             mov bx, cx                               
  00e2  6bdb41           imul bx, bx, 0x41                        
  00e5  ba042c           mov dx, 0x2c04                           
  00e8  8ec2             mov es, dx                               
  00ea  268887ac15       mov byte ptr es:[bx + 0x15ac], al        
  00ef  8bd9             mov bx, cx                               
  00f1  6bdb41           imul bx, bx, 0x41                        
  00f4  b8042c           mov ax, 0x2c04                           
  00f7  8ec0             mov es, ax                               
  00f9  26c687ad1500     mov byte ptr es:[bx + 0x15ad], 0         
  00ff  8bc1             mov ax, cx                               
  0101  49               dec cx                                   
  0102  0bc0             or ax, ax                                
  0104  7403             je 0x109                                 
  0106  e900ff           jmp 9                                    
  0109  5d               pop bp                                   
  010a  cb               retf                                     

ovl29_010b:  ; ENTRY
  010b  55               push bp                                  
  010c  8bec             mov bp, sp                               
  010e  83ec36           sub sp, 0x36                             
  0111  56               push si                                  
  0112  57               push di                                  
  0113  33ff             xor di, di                               
  0115  c746fa0000       mov word ptr [bp - 6], 0                 
  011a  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  011f  9aac00d730       lcall 0x30d7, 0xac                       -> ovl61:137e
  0124  9a5200db2f       lcall 0x2fdb, 0x52                       -> ovl25:05e6
  0129  90               nop                                      
  012a  0e               push cs                                  
  012b  e86a02           call 0x398                               
  012e  9a5700db2f       lcall 0x2fdb, 0x57                       -> ovl25:063d
  0133  9ab600d730       lcall 0x30d7, 0xb6                       -> ovl61:1452
  0138  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  013d  c746fe0800       mov word ptr [bp - 2], 8                 
  0142  e9bf00           jmp 0x204                                
  0145  8b5efe           mov bx, word ptr [bp - 2]                
  0148  d1e3             shl bx, 1                                
  014a  8d46ca           lea ax, [bp - 0x36]                      
  014d  03d8             add bx, ax                               
  014f  36c7070000       mov word ptr ss:[bx], 0                  
  0154  8b5efe           mov bx, word ptr [bp - 2]                
  0157  d1e3             shl bx, 1                                
  0159  b8042c           mov ax, 0x2c04                           
  015c  8ec0             mov es, ax                               
  015e  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0164  7503             jne 0x169                                
  0166  e99b00           jmp 0x204                                
  0169  8b5efe           mov bx, word ptr [bp - 2]                
  016c  d1e3             shl bx, 1                                
  016e  b8042c           mov ax, 0x2c04                           
  0171  8ec0             mov es, ax                               
  0173  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0179  7503             jne 0x17e                                
  017b  47               inc di                                   
  017c  eb12             jmp 0x190                                
  017e  8b5efe           mov bx, word ptr [bp - 2]                
  0181  d1e3             shl bx, 1                                
  0183  8d46ca           lea ax, [bp - 0x36]                      
  0186  03d8             add bx, ax                               
  0188  36c7070100       mov word ptr ss:[bx], 1                  
  018d  ff46fa           inc word ptr [bp - 6]                    
  0190  8b5efe           mov bx, word ptr [bp - 2]                
  0193  6bdb14           imul bx, bx, 0x14                        
  0196  b8042c           mov ax, 0x2c04                           
  0199  8ec0             mov es, ax                               
  019b  268b878901       mov ax, word ptr es:[bx + 0x189]         
  01a0  8b5efe           mov bx, word ptr [bp - 2]                
  01a3  d1e3             shl bx, 1                                
  01a5  8d56ea           lea dx, [bp - 0x16]                      
  01a8  03da             add bx, dx                               
  01aa  368907           mov word ptr ss:[bx], ax                 
  01ad  8b5efe           mov bx, word ptr [bp - 2]                
  01b0  6bdb14           imul bx, bx, 0x14                        
  01b3  b8042c           mov ax, 0x2c04                           
  01b6  8ec0             mov es, ax                               
  01b8  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  01bd  8b5efe           mov bx, word ptr [bp - 2]                
  01c0  d1e3             shl bx, 1                                
  01c2  8d56da           lea dx, [bp - 0x26]                      
  01c5  03da             add bx, dx                               
  01c7  368907           mov word ptr ss:[bx], ax                 
  01ca  8b5efe           mov bx, word ptr [bp - 2]                
  01cd  d1e3             shl bx, 1                                
  01cf  8d46da           lea ax, [bp - 0x26]                      
  01d2  03d8             add bx, ax                               
  01d4  36ff37           push word ptr ss:[bx]                    
  01d7  8b5efe           mov bx, word ptr [bp - 2]                
  01da  d1e3             shl bx, 1                                
  01dc  8d46ea           lea ax, [bp - 0x16]                      
  01df  03d8             add bx, ax                               
  01e1  36ff37           push word ptr ss:[bx]                    
  01e4  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  01e9  83c404           add sp, 4                                
  01ec  8bf0             mov si, ax                               
  01ee  0bf6             or si, si                                
  01f0  7c12             jl 0x204                                 
  01f2  8bde             mov bx, si                               
  01f4  6bdb41           imul bx, bx, 0x41                        
  01f7  b8042c           mov ax, 0x2c04                           
  01fa  8a56fe           mov dl, byte ptr [bp - 2]                
  01fd  8ec0             mov es, ax                               
  01ff  268897ac15       mov byte ptr es:[bx + 0x15ac], dl        
  0204  8b46fe           mov ax, word ptr [bp - 2]                
  0207  ff4efe           dec word ptr [bp - 2]                    
  020a  0bc0             or ax, ax                                
  020c  7403             je 0x211                                 
  020e  e934ff           jmp 0x145                                
  0211  837efa00         cmp word ptr [bp - 6], 0                 
  0215  756b             jne 0x282                                
  0217  0bff             or di, di                                
  0219  7467             je 0x282                                 
  021b  beffff           mov si, 0xffff                           
  021e  33ff             xor di, di                               
  0220  c746fe0800       mov word ptr [bp - 2], 8                 
  0225  eb3e             jmp 0x265                                
  0227  8b5efe           mov bx, word ptr [bp - 2]                
  022a  d1e3             shl bx, 1                                
  022c  b8042c           mov ax, 0x2c04                           
  022f  8ec0             mov es, ax                               
  0231  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0237  742c             je 0x265                                 
  0239  8b5efe           mov bx, word ptr [bp - 2]                
  023c  d1e3             shl bx, 1                                
  023e  8d46ca           lea ax, [bp - 0x36]                      
  0241  03d8             add bx, ax                               
  0243  36c7070100       mov word ptr ss:[bx], 1                  
  0248  666a64           push 0x64                                
  024b  6a01             push 1                                   
  024d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0252  83c406           add sp, 6                                
  0255  8bd0             mov dx, ax                               
  0257  83feff           cmp si, -1                               
  025a  7404             je 0x260                                 
  025c  3bd7             cmp dx, di                               
  025e  7e05             jle 0x265                                
  0260  8b76fe           mov si, word ptr [bp - 2]                
  0263  8bfa             mov di, dx                               
  0265  8b46fe           mov ax, word ptr [bp - 2]                
  0268  ff4efe           dec word ptr [bp - 2]                    
  026b  0bc0             or ax, ax                                
  026d  75b8             jne 0x227                                
  026f  83feff           cmp si, -1                               
  0272  740e             je 0x282                                 
  0274  8bde             mov bx, si                               
  0276  d1e3             shl bx, 1                                
  0278  8d46ca           lea ax, [bp - 0x36]                      
  027b  03d8             add bx, ax                               
  027d  36c7070000       mov word ptr ss:[bx], 0                  
  0282  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0287  c746fe0800       mov word ptr [bp - 2], 8                 
  028c  eb18             jmp 0x2a6                                
  028e  8b5efe           mov bx, word ptr [bp - 2]                
  0291  d1e3             shl bx, 1                                
  0293  8d46ca           lea ax, [bp - 0x36]                      
  0296  03d8             add bx, ax                               
  0298  36833f00         cmp word ptr ss:[bx], 0                  
  029c  7408             je 0x2a6                                 
  029e  8b46fe           mov ax, word ptr [bp - 2]                
  02a1  8946fc           mov word ptr [bp - 4], ax                
  02a4  eb0a             jmp 0x2b0                                
  02a6  8b46fe           mov ax, word ptr [bp - 2]                
  02a9  ff4efe           dec word ptr [bp - 2]                    
  02ac  0bc0             or ax, ax                                
  02ae  75de             jne 0x28e                                
  02b0  837efcff         cmp word ptr [bp - 4], -1                
  02b4  7403             je 0x2b9                                 
  02b6  e9ae00           jmp 0x367                                
  02b9  e9d800           jmp 0x394                                
  02bc  8bde             mov bx, si                               
  02be  6bdb41           imul bx, bx, 0x41                        
  02c1  b8042c           mov ax, 0x2c04                           
  02c4  8a56fc           mov dl, byte ptr [bp - 4]                
  02c7  8ec0             mov es, ax                               
  02c9  268897ac15       mov byte ptr es:[bx + 0x15ac], dl        
  02ce  66680a00ffff     push 0xffff000a                          
  02d4  6a01             push 1                                   
  02d6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02db  83c406           add sp, 6                                
  02de  3d0400           cmp ax, 4                                
  02e1  7f2f             jg 0x312                                 
  02e3  8b5efc           mov bx, word ptr [bp - 4]                
  02e6  6bdb14           imul bx, bx, 0x14                        
  02e9  b8042c           mov ax, 0x2c04                           
  02ec  8ec0             mov es, ax                               
  02ee  268b878901       mov ax, word ptr es:[bx + 0x189]         
  02f3  8b5efc           mov bx, word ptr [bp - 4]                
  02f6  d1e3             shl bx, 1                                
  02f8  8d56ea           lea dx, [bp - 0x16]                      
  02fb  03da             add bx, dx                               
  02fd  368907           mov word ptr ss:[bx], ax                 
  0300  8b5efc           mov bx, word ptr [bp - 4]                
  0303  6bdb14           imul bx, bx, 0x14                        
  0306  b8042c           mov ax, 0x2c04                           
  0309  8ec0             mov es, ax                               
  030b  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  0310  eb2b             jmp 0x33d                                
  0312  8bde             mov bx, si                               
  0314  6bdb41           imul bx, bx, 0x41                        
  0317  b8042c           mov ax, 0x2c04                           
  031a  8ec0             mov es, ax                               
  031c  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0321  8b5efc           mov bx, word ptr [bp - 4]                
  0324  d1e3             shl bx, 1                                
  0326  8d56ea           lea dx, [bp - 0x16]                      
  0329  03da             add bx, dx                               
  032b  368907           mov word ptr ss:[bx], ax                 
  032e  8bde             mov bx, si                               
  0330  6bdb41           imul bx, bx, 0x41                        
  0333  b8042c           mov ax, 0x2c04                           
  0336  8ec0             mov es, ax                               
  0338  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  033d  8b5efc           mov bx, word ptr [bp - 4]                
  0340  d1e3             shl bx, 1                                
  0342  8d56da           lea dx, [bp - 0x26]                      
  0345  03da             add bx, dx                               
  0347  368907           mov word ptr ss:[bx], ax                 
  034a  8b46fc           mov ax, word ptr [bp - 4]                
  034d  40               inc ax                                   
  034e  bb0800           mov bx, 8                                
  0351  99               cdq                                      
  0352  f7fb             idiv bx                                  
  0354  8956fc           mov word ptr [bp - 4], dx                
  0357  8b5efc           mov bx, word ptr [bp - 4]                
  035a  d1e3             shl bx, 1                                
  035c  8d46ca           lea ax, [bp - 0x36]                      
  035f  03d8             add bx, ax                               
  0361  36833f00         cmp word ptr ss:[bx], 0                  
  0365  74e3             je 0x34a                                 
  0367  6a0f             push 0xf                                 
  0369  8b5efc           mov bx, word ptr [bp - 4]                
  036c  d1e3             shl bx, 1                                
  036e  8d46da           lea ax, [bp - 0x26]                      
  0371  03d8             add bx, ax                               
  0373  36ff37           push word ptr ss:[bx]                    
  0376  8b5efc           mov bx, word ptr [bp - 4]                
  0379  d1e3             shl bx, 1                                
  037b  8d46ea           lea ax, [bp - 0x16]                      
  037e  03d8             add bx, ax                               
  0380  36ff37           push word ptr ss:[bx]                    
  0383  90               nop                                      
  0384  0e               push cs                                  
  0385  e89f06           call 0xa27                               
  0388  83c406           add sp, 6                                
  038b  8bf0             mov si, ax                               
  038d  0bc0             or ax, ax                                
  038f  7c03             jl 0x394                                 
  0391  e928ff           jmp 0x2bc                                
  0394  5f               pop di                                   
  0395  5e               pop si                                   
  0396  c9               leave                                    
  0397  cb               retf                                     

ovl29_0398:  ; ENTRY
  0398  55               push bp                                  
  0399  8bec             mov bp, sp                               
  039b  83ec06           sub sp, 6                                
  039e  56               push si                                  
  039f  57               push di                                  
  03a0  c746fe0000       mov word ptr [bp - 2], 0                 
  03a5  b8042c           mov ax, 0x2c04                           
  03a8  8ec0             mov es, ax                               
  03aa  26a11001         mov ax, word ptr es:[0x110]              
  03ae  8946fc           mov word ptr [bp - 4], ax                
  03b1  bf6400           mov di, 0x64                             
  03b4  eb30             jmp 0x3e6                                
  03b6  ba0600           mov dx, 6                                
  03b9  eb24             jmp 0x3df                                
  03bb  8bc7             mov ax, di                               
  03bd  6bc006           imul ax, ax, 6                           
  03c0  c41eea40         les bx, ptr [0x40ea]                     
  03c4  03d8             add bx, ax                               
  03c6  03da             add bx, dx                               
  03c8  26c607ff         mov byte ptr es:[bx], 0xff               
  03cc  8bc7             mov ax, di                               
  03ce  6bc006           imul ax, ax, 6                           
  03d1  8b1eea40         mov bx, word ptr [0x40ea]                
  03d5  03d8             add bx, ax                               
  03d7  03da             add bx, dx                               
  03d9  26c687580200     mov byte ptr es:[bx + 0x258], 0          
  03df  8bc2             mov ax, dx                               
  03e1  4a               dec dx                                   
  03e2  0bc0             or ax, ax                                
  03e4  75d5             jne 0x3bb                                
  03e6  8bc7             mov ax, di                               
  03e8  4f               dec di                                   
  03e9  0bc0             or ax, ax                                
  03eb  75c9             jne 0x3b6                                
  03ed  b8042c           mov ax, 0x2c04                           
  03f0  8ec0             mov es, ax                               
  03f2  26c70610010000   mov word ptr es:[0x110], 0               
  03f9  6a01             push 1                                   
  03fb  8ec0             mov es, ax                               
  03fd  26ff361001       push word ptr es:[0x110]                 
  0402  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  0407  83c404           add sp, 4                                
  040a  33ff             xor di, di                               
  040c  e91203           jmp 0x721                                
  040f  8bdf             mov bx, di                               
  0411  6bdb41           imul bx, bx, 0x41                        
  0414  b8042c           mov ax, 0x2c04                           
  0417  8ec0             mov es, ax                               
  0419  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  041e  98               cwde                                     
  041f  8946fa           mov word ptr [bp - 6], ax                
  0422  8bc7             mov ax, di                               
  0424  6bc014           imul ax, ax, 0x14                        
  0427  ba042c           mov dx, 0x2c04                           
  042a  52               push dx                                  
  042b  99               cdq                                      
  042c  07               pop es                                   
  042d  26f73e7b15       idiv word ptr es:[0x157b]                
  0432  8bd0             mov dx, ax                               
  0434  3956fe           cmp word ptr [bp - 2], dx                
  0437  7410             je 0x449                                 
  0439  8956fe           mov word ptr [bp - 2], dx                
  043c  8b46fe           mov ax, word ptr [bp - 2]                
  043f  6bc005           imul ax, ax, 5                           
  0442  50               push ax                                  
  0443  9ab100d730       lcall 0x30d7, 0xb1                       -> ovl61:1463
  0448  59               pop cx                                   
  0449  8bdf             mov bx, di                               
  044b  6bdb41           imul bx, bx, 0x41                        
  044e  b8042c           mov ax, 0x2c04                           
  0451  ba042c           mov dx, 0x2c04                           
  0454  8ec2             mov es, dx                               
  0456  268a161001       mov dl, byte ptr es:[0x110]              
  045b  8ec0             mov es, ax                               
  045d  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  0462  b8042c           mov ax, 0x2c04                           
  0465  8ec0             mov es, ax                               
  0467  26a11001         mov ax, word ptr es:[0x110]              
  046b  250f00           and ax, 0xf                              
  046e  8bdf             mov bx, di                               
  0470  6bdb41           imul bx, bx, 0x41                        
  0473  ba042c           mov dx, 0x2c04                           
  0476  8ec2             mov es, dx                               
  0478  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  047d  69dbe000         imul bx, bx, 0xe0                        
  0481  8bf7             mov si, di                               
  0483  6bf641           imul si, si, 0x41                        
  0486  ba042c           mov dx, 0x2c04                           
  0489  8ec2             mov es, dx                               
  048b  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0490  d1e2             shl dx, 1                                
  0492  03da             add bx, dx                               
  0494  ba1d1e           mov dx, 0x1e1d                           
  0497  8ec2             mov es, dx                               
  0499  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  049f  2608870100       or byte ptr es:[bx + 1], al              
  04a4  b8042c           mov ax, 0x2c04                           
  04a7  8ec0             mov es, ax                               
  04a9  26a11001         mov ax, word ptr es:[0x110]              
  04ad  250f00           and ax, 0xf                              
  04b0  8bdf             mov bx, di                               
  04b2  6bdb41           imul bx, bx, 0x41                        
  04b5  ba042c           mov dx, 0x2c04                           
  04b8  8ec2             mov es, dx                               
  04ba  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  04bf  69dbe000         imul bx, bx, 0xe0                        
  04c3  8bf7             mov si, di                               
  04c5  6bf641           imul si, si, 0x41                        
  04c8  ba042c           mov dx, 0x2c04                           
  04cb  8ec2             mov es, dx                               
  04cd  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  04d2  d1e2             shl dx, 1                                
  04d4  03da             add bx, dx                               
  04d6  ba1d1e           mov dx, 0x1e1d                           
  04d9  8ec2             mov es, dx                               
  04db  2680a7e300f0     and byte ptr es:[bx + 0xe3], 0xf0        
  04e1  260887e300       or byte ptr es:[bx + 0xe3], al           
  04e6  b8042c           mov ax, 0x2c04                           
  04e9  8ec0             mov es, ax                               
  04eb  26a11001         mov ax, word ptr es:[0x110]              
  04ef  250f00           and ax, 0xf                              
  04f2  8bdf             mov bx, di                               
  04f4  6bdb41           imul bx, bx, 0x41                        
  04f7  ba042c           mov dx, 0x2c04                           
  04fa  8ec2             mov es, dx                               
  04fc  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0501  69dbe000         imul bx, bx, 0xe0                        
  0505  8bf7             mov si, di                               
  0507  6bf641           imul si, si, 0x41                        
  050a  ba042c           mov dx, 0x2c04                           
  050d  8ec2             mov es, dx                               
  050f  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0514  d1e2             shl dx, 1                                
  0516  03da             add bx, dx                               
  0518  ba1d1e           mov dx, 0x1e1d                           
  051b  8ec2             mov es, dx                               
  051d  2680a7e100f0     and byte ptr es:[bx + 0xe1], 0xf0        
  0523  260887e100       or byte ptr es:[bx + 0xe1], al           
  0528  b8042c           mov ax, 0x2c04                           
  052b  8ec0             mov es, ax                               
  052d  26a11001         mov ax, word ptr es:[0x110]              
  0531  250f00           and ax, 0xf                              
  0534  8bdf             mov bx, di                               
  0536  6bdb41           imul bx, bx, 0x41                        
  0539  ba042c           mov dx, 0x2c04                           
  053c  8ec2             mov es, dx                               
  053e  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0543  69dbe000         imul bx, bx, 0xe0                        
  0547  8bf7             mov si, di                               
  0549  6bf641           imul si, si, 0x41                        
  054c  ba042c           mov dx, 0x2c04                           
  054f  8ec2             mov es, dx                               
  0551  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0556  d1e2             shl dx, 1                                
  0558  03da             add bx, dx                               
  055a  ba1d1e           mov dx, 0x1e1d                           
  055d  8ec2             mov es, dx                               
  055f  2680a70300f0     and byte ptr es:[bx + 3], 0xf0           
  0565  2608870300       or byte ptr es:[bx + 3], al              
  056a  666a01           push 1                                   
  056d  8bdf             mov bx, di                               
  056f  6bdb41           imul bx, bx, 0x41                        
  0572  b8042c           mov ax, 0x2c04                           
  0575  8ec0             mov es, ax                               
  0577  26ffb77f15       push word ptr es:[bx + 0x157f]           
  057c  8bdf             mov bx, di                               
  057e  6bdb41           imul bx, bx, 0x41                        
  0581  b8042c           mov ax, 0x2c04                           
  0584  8ec0             mov es, ax                               
  0586  26ffb77d15       push word ptr es:[bx + 0x157d]           
  058b  6a2d             push 0x2d                                
  058d  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  0592  83c40a           add sp, 0xa                              
  0595  8bc7             mov ax, di                               
  0597  6bc006           imul ax, ax, 6                           
  059a  8b16ea40         mov dx, word ptr [0x40ea]                
  059e  03d0             add dx, ax                               
  05a0  81c25802         add dx, 0x258                            
  05a4  ff36ec40         push word ptr [0x40ec]                   
  05a8  52               push dx                                  
  05a9  8bc7             mov ax, di                               
  05ab  6bc006           imul ax, ax, 6                           
  05ae  8b16ea40         mov dx, word ptr [0x40ea]                
  05b2  03d0             add dx, ax                               
  05b4  ff36ec40         push word ptr [0x40ec]                   
  05b8  52               push dx                                  
  05b9  57               push di                                  
  05ba  90               nop                                      
  05bb  0e               push cs                                  
  05bc  e88a01           call 0x749                               
  05bf  83c40a           add sp, 0xa                              
  05c2  0bc0             or ax, ax                                
  05c4  7558             jne 0x61e                                
  05c6  666a01           push 1                                   
  05c9  8bdf             mov bx, di                               
  05cb  6bdb41           imul bx, bx, 0x41                        
  05ce  b8042c           mov ax, 0x2c04                           
  05d1  8ec0             mov es, ax                               
  05d3  26ffb77f15       push word ptr es:[bx + 0x157f]           
  05d8  8bdf             mov bx, di                               
  05da  6bdb41           imul bx, bx, 0x41                        
  05dd  b8042c           mov ax, 0x2c04                           
  05e0  8ec0             mov es, ax                               
  05e2  26ffb77d15       push word ptr es:[bx + 0x157d]           
  05e7  6a3c             push 0x3c                                
  05e9  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  05ee  83c40a           add sp, 0xa                              
  05f1  8bc7             mov ax, di                               
  05f3  6bc006           imul ax, ax, 6                           
  05f6  8b16ea40         mov dx, word ptr [0x40ea]                
  05fa  03d0             add dx, ax                               
  05fc  81c25802         add dx, 0x258                            
  0600  ff36ec40         push word ptr [0x40ec]                   
  0604  52               push dx                                  
  0605  8bc7             mov ax, di                               
  0607  6bc006           imul ax, ax, 6                           
  060a  8b16ea40         mov dx, word ptr [0x40ea]                
  060e  03d0             add dx, ax                               
  0610  ff36ec40         push word ptr [0x40ec]                   
  0614  52               push dx                                  
  0615  57               push di                                  
  0616  90               nop                                      
  0617  0e               push cs                                  
  0618  e82e01           call 0x749                               
  061b  83c40a           add sp, 0xa                              
  061e  8bdf             mov bx, di                               
  0620  6bdb41           imul bx, bx, 0x41                        
  0623  b8042c           mov ax, 0x2c04                           
  0626  8a56fa           mov dl, byte ptr [bp - 6]                
  0629  8ec0             mov es, ax                               
  062b  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  0630  8b46fa           mov ax, word ptr [bp - 6]                
  0633  250f00           and ax, 0xf                              
  0636  8bdf             mov bx, di                               
  0638  6bdb41           imul bx, bx, 0x41                        
  063b  ba042c           mov dx, 0x2c04                           
  063e  8ec2             mov es, dx                               
  0640  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0645  69dbe000         imul bx, bx, 0xe0                        
  0649  8bf7             mov si, di                               
  064b  6bf641           imul si, si, 0x41                        
  064e  ba042c           mov dx, 0x2c04                           
  0651  8ec2             mov es, dx                               
  0653  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0658  d1e2             shl dx, 1                                
  065a  03da             add bx, dx                               
  065c  ba1d1e           mov dx, 0x1e1d                           
  065f  8ec2             mov es, dx                               
  0661  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  0667  2608870100       or byte ptr es:[bx + 1], al              
  066c  8b46fa           mov ax, word ptr [bp - 6]                
  066f  250f00           and ax, 0xf                              
  0672  8bdf             mov bx, di                               
  0674  6bdb41           imul bx, bx, 0x41                        
  0677  ba042c           mov dx, 0x2c04                           
  067a  8ec2             mov es, dx                               
  067c  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0681  69dbe000         imul bx, bx, 0xe0                        
  0685  8bf7             mov si, di                               
  0687  6bf641           imul si, si, 0x41                        
  068a  ba042c           mov dx, 0x2c04                           
  068d  8ec2             mov es, dx                               
  068f  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0694  d1e2             shl dx, 1                                
  0696  03da             add bx, dx                               
  0698  ba1d1e           mov dx, 0x1e1d                           
  069b  8ec2             mov es, dx                               
  069d  2680a7e300f0     and byte ptr es:[bx + 0xe3], 0xf0        
  06a3  260887e300       or byte ptr es:[bx + 0xe3], al           
  06a8  8b46fa           mov ax, word ptr [bp - 6]                
  06ab  250f00           and ax, 0xf                              
  06ae  8bdf             mov bx, di                               
  06b0  6bdb41           imul bx, bx, 0x41                        
  06b3  ba042c           mov dx, 0x2c04                           
  06b6  8ec2             mov es, dx                               
  06b8  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  06bd  69dbe000         imul bx, bx, 0xe0                        
  06c1  8bf7             mov si, di                               
  06c3  6bf641           imul si, si, 0x41                        
  06c6  ba042c           mov dx, 0x2c04                           
  06c9  8ec2             mov es, dx                               
  06cb  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  06d0  d1e2             shl dx, 1                                
  06d2  03da             add bx, dx                               
  06d4  ba1d1e           mov dx, 0x1e1d                           
  06d7  8ec2             mov es, dx                               
  06d9  2680a7e100f0     and byte ptr es:[bx + 0xe1], 0xf0        
  06df  260887e100       or byte ptr es:[bx + 0xe1], al           
  06e4  8b46fa           mov ax, word ptr [bp - 6]                
  06e7  250f00           and ax, 0xf                              
  06ea  8bdf             mov bx, di                               
  06ec  6bdb41           imul bx, bx, 0x41                        
  06ef  ba042c           mov dx, 0x2c04                           
  06f2  8ec2             mov es, dx                               
  06f4  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  06f9  69dbe000         imul bx, bx, 0xe0                        
  06fd  8bf7             mov si, di                               
  06ff  6bf641           imul si, si, 0x41                        
  0702  ba042c           mov dx, 0x2c04                           
  0705  8ec2             mov es, dx                               
  0707  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  070c  d1e2             shl dx, 1                                
  070e  03da             add bx, dx                               
  0710  ba1d1e           mov dx, 0x1e1d                           
  0713  8ec2             mov es, dx                               
  0715  2680a70300f0     and byte ptr es:[bx + 3], 0xf0           
  071b  2608870300       or byte ptr es:[bx + 3], al              
  0720  47               inc di                                   
  0721  b8042c           mov ax, 0x2c04                           
  0724  8ec0             mov es, ax                               
  0726  26393e7b15       cmp word ptr es:[0x157b], di             
  072b  7e03             jle 0x730                                
  072d  e9dffc           jmp 0x40f                                
  0730  6a64             push 0x64                                
  0732  9ab100d730       lcall 0x30d7, 0xb1                       -> ovl61:1463
  0737  59               pop cx                                   
  0738  b8042c           mov ax, 0x2c04                           
  073b  8b56fc           mov dx, word ptr [bp - 4]                
  073e  8ec0             mov es, ax                               
  0740  2689161001       mov word ptr es:[0x110], dx              
  0745  5f               pop di                                   
  0746  5e               pop si                                   
  0747  c9               leave                                    
  0748  cb               retf                                     

ovl29_0749:  ; ENTRY
  0749  55               push bp                                  
  074a  8bec             mov bp, sp                               
  074c  83ec7a           sub sp, 0x7a                             
  074f  56               push si                                  
  0750  57               push di                                  
  0751  9a0a1b5505       lcall 0x555, 0x1b0a                      -> 0555:1b0a
  0756  8956fe           mov word ptr [bp - 2], dx                
  0759  8946fc           mov word ptr [bp - 4], ax                
  075c  c746f20000       mov word ptr [bp - 0xe], 0               
  0761  c746fa3200       mov word ptr [bp - 6], 0x32              
  0766  eb18             jmp 0x780                                
  0768  8d46b8           lea ax, [bp - 0x48]                      
  076b  8b5efa           mov bx, word ptr [bp - 6]                
  076e  03d8             add bx, ax                               
  0770  36c607ff         mov byte ptr ss:[bx], 0xff               
  0774  8d4686           lea ax, [bp - 0x7a]                      
  0777  8b5efa           mov bx, word ptr [bp - 6]                
  077a  03d8             add bx, ax                               
  077c  36c60700         mov byte ptr ss:[bx], 0                  
  0780  8b46fa           mov ax, word ptr [bp - 6]                
  0783  ff4efa           dec word ptr [bp - 6]                    
  0786  0bc0             or ax, ax                                
  0788  75de             jne 0x768                                
  078a  b8042c           mov ax, 0x2c04                           
  078d  8ec0             mov es, ax                               
  078f  26a17b15         mov ax, word ptr es:[0x157b]             
  0793  8946fa           mov word ptr [bp - 6], ax                
  0796  eb79             jmp 0x811                                
  0798  8b46fa           mov ax, word ptr [bp - 6]                
  079b  3b4606           cmp ax, word ptr [bp + 6]                
  079e  7471             je 0x811                                 
  07a0  6a00             push 0                                   
  07a2  66ff76fc         push dword ptr [bp - 4]                  
  07a6  16               push ss                                  
  07a7  8d46f4           lea ax, [bp - 0xc]                       
  07aa  50               push ax                                  
  07ab  16               push ss                                  
  07ac  8d46f6           lea ax, [bp - 0xa]                       
  07af  50               push ax                                  
  07b0  ff76fa           push word ptr [bp - 6]                   
  07b3  9a3900c52f       lcall 0x2fc5, 0x39                       -> ovl21:0a85
  07b8  83c410           add sp, 0x10                             
  07bb  8bd0             mov dx, ax                               
  07bd  837ef6ff         cmp word ptr [bp - 0xa], -1              
  07c1  744e             je 0x811                                 
  07c3  ff46f2           inc word ptr [bp - 0xe]                  
  07c6  bfffff           mov di, 0xffff                           
  07c9  8956f8           mov word ptr [bp - 8], dx                
  07cc  33f6             xor si, si                               
  07ce  eb1f             jmp 0x7ef                                
  07d0  807ab8ff         cmp byte ptr [bp + si - 0x48], 0xff      
  07d4  7504             jne 0x7da                                
  07d6  8bfe             mov di, si                               
  07d8  eb1a             jmp 0x7f4                                
  07da  8a4286           mov al, byte ptr [bp + si - 0x7a]        
  07dd  b400             mov ah, 0                                
  07df  3b46f8           cmp ax, word ptr [bp - 8]                
  07e2  7e0a             jle 0x7ee                                
  07e4  8bfe             mov di, si                               
  07e6  8a4286           mov al, byte ptr [bp + si - 0x7a]        
  07e9  b400             mov ah, 0                                
  07eb  8946f8           mov word ptr [bp - 8], ax                
  07ee  46               inc si                                   
  07ef  83fe32           cmp si, 0x32                             
  07f2  7cdc             jl 0x7d0                                 
  07f4  83ffff           cmp di, -1                               
  07f7  7418             je 0x811                                 
  07f9  807bb8ff         cmp byte ptr [bp + di - 0x48], 0xff      
  07fd  7409             je 0x808                                 
  07ff  8a4386           mov al, byte ptr [bp + di - 0x7a]        
  0802  b400             mov ah, 0                                
  0804  3bc2             cmp ax, dx                               
  0806  7e09             jle 0x811                                
  0808  8a46fa           mov al, byte ptr [bp - 6]                
  080b  8843b8           mov byte ptr [bp + di - 0x48], al        
  080e  885386           mov byte ptr [bp + di - 0x7a], dl        
  0811  8b46fa           mov ax, word ptr [bp - 6]                
  0814  ff4efa           dec word ptr [bp - 6]                    
  0817  0bc0             or ax, ax                                
  0819  7403             je 0x81e                                 
  081b  e97aff           jmp 0x798                                
  081e  33c9             xor cx, cx                               
  0820  33c0             xor ax, ax                               
  0822  8946ec           mov word ptr [bp - 0x14], ax             
  0825  8946ee           mov word ptr [bp - 0x12], ax             
  0828  8946f0           mov word ptr [bp - 0x10], ax             
  082b  8bf8             mov di, ax                               
  082d  beffff           mov si, 0xffff                           
  0830  c746ea1027       mov word ptr [bp - 0x16], 0x2710         
  0835  c746fa3200       mov word ptr [bp - 6], 0x32              
  083a  e9fc00           jmp 0x939                                
  083d  8d46b8           lea ax, [bp - 0x48]                      
  0840  8b5efa           mov bx, word ptr [bp - 6]                
  0843  03d8             add bx, ax                               
  0845  36803fff         cmp byte ptr ss:[bx], 0xff               
  0849  7503             jne 0x84e                                
  084b  e9eb00           jmp 0x939                                
  084e  8d4686           lea ax, [bp - 0x7a]                      
  0851  8b5efa           mov bx, word ptr [bp - 6]                
  0854  03d8             add bx, ax                               
  0856  368a07           mov al, byte ptr ss:[bx]                 
  0859  b400             mov ah, 0                                
  085b  8946f8           mov word ptr [bp - 8], ax                
  085e  8d46b8           lea ax, [bp - 0x48]                      
  0861  8b5efa           mov bx, word ptr [bp - 6]                
  0864  03d8             add bx, ax                               
  0866  368a07           mov al, byte ptr ss:[bx]                 
  0869  b400             mov ah, 0                                
  086b  6bc041           imul ax, ax, 0x41                        
  086e  ba042c           mov dx, 0x2c04                           
  0871  8bd8             mov bx, ax                               
  0873  8ec2             mov es, dx                               
  0875  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  087a  8b5e06           mov bx, word ptr [bp + 6]                
  087d  6bdb41           imul bx, bx, 0x41                        
  0880  8ec2             mov es, dx                               
  0882  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  0887  7d09             jge 0x892                                
  0889  837ef002         cmp word ptr [bp - 0x10], 2              
  088d  7e03             jle 0x892                                
  088f  e99200           jmp 0x924                                
  0892  8d46b8           lea ax, [bp - 0x48]                      
  0895  8b5efa           mov bx, word ptr [bp - 6]                
  0898  03d8             add bx, ax                               
  089a  368a07           mov al, byte ptr ss:[bx]                 
  089d  b400             mov ah, 0                                
  089f  6bc041           imul ax, ax, 0x41                        
  08a2  ba042c           mov dx, 0x2c04                           
  08a5  8bd8             mov bx, ax                               
  08a7  8ec2             mov es, dx                               
  08a9  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  08ae  8b5e06           mov bx, word ptr [bp + 6]                
  08b1  6bdb41           imul bx, bx, 0x41                        
  08b4  8ec2             mov es, dx                               
  08b6  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  08bb  7e05             jle 0x8c2                                
  08bd  83ff02           cmp di, 2                                
  08c0  7f62             jg 0x924                                 
  08c2  8d46b8           lea ax, [bp - 0x48]                      
  08c5  8b5efa           mov bx, word ptr [bp - 6]                
  08c8  03d8             add bx, ax                               
  08ca  368a07           mov al, byte ptr ss:[bx]                 
  08cd  b400             mov ah, 0                                
  08cf  6bc041           imul ax, ax, 0x41                        
  08d2  ba042c           mov dx, 0x2c04                           
  08d5  8bd8             mov bx, ax                               
  08d7  8ec2             mov es, dx                               
  08d9  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  08de  8b5e06           mov bx, word ptr [bp + 6]                
  08e1  6bdb41           imul bx, bx, 0x41                        
  08e4  8ec2             mov es, dx                               
  08e6  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  08eb  7d06             jge 0x8f3                                
  08ed  837eec02         cmp word ptr [bp - 0x14], 2              
  08f1  7f31             jg 0x924                                 
  08f3  8d46b8           lea ax, [bp - 0x48]                      
  08f6  8b5efa           mov bx, word ptr [bp - 6]                
  08f9  03d8             add bx, ax                               
  08fb  368a07           mov al, byte ptr ss:[bx]                 
  08fe  b400             mov ah, 0                                
  0900  6bc041           imul ax, ax, 0x41                        
  0903  ba042c           mov dx, 0x2c04                           
  0906  8bd8             mov bx, ax                               
  0908  8ec2             mov es, dx                               
  090a  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  090f  8b5e06           mov bx, word ptr [bp + 6]                
  0912  6bdb41           imul bx, bx, 0x41                        
  0915  8ec2             mov es, dx                               
  0917  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  091c  7e0a             jle 0x928                                
  091e  837eee02         cmp word ptr [bp - 0x12], 2              
  0922  7e04             jle 0x928                                
  0924  8346f832         add word ptr [bp - 8], 0x32              
  0928  8b46f8           mov ax, word ptr [bp - 8]                
  092b  3b46ea           cmp ax, word ptr [bp - 0x16]             
  092e  7d09             jge 0x939                                
  0930  8b76fa           mov si, word ptr [bp - 6]                
  0933  8b46f8           mov ax, word ptr [bp - 8]                
  0936  8946ea           mov word ptr [bp - 0x16], ax             
  0939  8b46fa           mov ax, word ptr [bp - 6]                
  093c  ff4efa           dec word ptr [bp - 6]                    
  093f  0bc0             or ax, ax                                
  0941  7403             je 0x946                                 
  0943  e9f7fe           jmp 0x83d                                
  0946  83feff           cmp si, -1                               
  0949  7503             jne 0x94e                                
  094b  e9cd00           jmp 0xa1b                                
  094e  8a42b8           mov al, byte ptr [bp + si - 0x48]        
  0951  c45e08           les bx, ptr [bp + 8]                     
  0954  03d9             add bx, cx                               
  0956  268807           mov byte ptr es:[bx], al                 
  0959  8b5e08           mov bx, word ptr [bp + 8]                
  095c  03d9             add bx, cx                               
  095e  268a07           mov al, byte ptr es:[bx]                 
  0961  b400             mov ah, 0                                
  0963  6bc041           imul ax, ax, 0x41                        
  0966  ba042c           mov dx, 0x2c04                           
  0969  8bd8             mov bx, ax                               
  096b  8ec2             mov es, dx                               
  096d  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0972  8b5e06           mov bx, word ptr [bp + 6]                
  0975  6bdb41           imul bx, bx, 0x41                        
  0978  8ec2             mov es, dx                               
  097a  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  097f  7d03             jge 0x984                                
  0981  ff46f0           inc word ptr [bp - 0x10]                 
  0984  c45e08           les bx, ptr [bp + 8]                     
  0987  03d9             add bx, cx                               
  0989  268a07           mov al, byte ptr es:[bx]                 
  098c  b400             mov ah, 0                                
  098e  6bc041           imul ax, ax, 0x41                        
  0991  ba042c           mov dx, 0x2c04                           
  0994  8bd8             mov bx, ax                               
  0996  8ec2             mov es, dx                               
  0998  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  099d  8b5e06           mov bx, word ptr [bp + 6]                
  09a0  6bdb41           imul bx, bx, 0x41                        
  09a3  8ec2             mov es, dx                               
  09a5  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  09aa  7e01             jle 0x9ad                                
  09ac  47               inc di                                   
  09ad  c45e08           les bx, ptr [bp + 8]                     
  09b0  03d9             add bx, cx                               
  09b2  268a07           mov al, byte ptr es:[bx]                 
  09b5  b400             mov ah, 0                                
  09b7  6bc041           imul ax, ax, 0x41                        
  09ba  ba042c           mov dx, 0x2c04                           
  09bd  8bd8             mov bx, ax                               
  09bf  8ec2             mov es, dx                               
  09c1  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  09c6  8b5e06           mov bx, word ptr [bp + 6]                
  09c9  6bdb41           imul bx, bx, 0x41                        
  09cc  8ec2             mov es, dx                               
  09ce  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  09d3  7d03             jge 0x9d8                                
  09d5  ff46ec           inc word ptr [bp - 0x14]                 
  09d8  c45e08           les bx, ptr [bp + 8]                     
  09db  03d9             add bx, cx                               
  09dd  268a07           mov al, byte ptr es:[bx]                 
  09e0  b400             mov ah, 0                                
  09e2  6bc041           imul ax, ax, 0x41                        
  09e5  ba042c           mov dx, 0x2c04                           
  09e8  8bd8             mov bx, ax                               
  09ea  8ec2             mov es, dx                               
  09ec  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  09f1  8b5e06           mov bx, word ptr [bp + 6]                
  09f4  6bdb41           imul bx, bx, 0x41                        
  09f7  8ec2             mov es, dx                               
  09f9  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  09fe  7e03             jle 0xa03                                
  0a00  ff46ee           inc word ptr [bp - 0x12]                 
  0a03  8a4286           mov al, byte ptr [bp + si - 0x7a]        
  0a06  c45e0c           les bx, ptr [bp + 0xc]                   
  0a09  03d9             add bx, cx                               
  0a0b  268807           mov byte ptr es:[bx], al                 
  0a0e  41               inc cx                                   
  0a0f  c642b8ff         mov byte ptr [bp + si - 0x48], 0xff      
  0a13  83f906           cmp cx, 6                                
  0a16  7403             je 0xa1b                                 
  0a18  e912fe           jmp 0x82d                                
  0a1b  9a2e1b5505       lcall 0x555, 0x1b2e                      -> 0555:1b2e
  0a20  8b46f2           mov ax, word ptr [bp - 0xe]              
  0a23  5f               pop di                                   
  0a24  5e               pop si                                   
  0a25  c9               leave                                    
  0a26  cb               retf                                     

ovl29_0a27:  ; ENTRY
  0a27  55               push bp                                  
  0a28  8bec             mov bp, sp                               
  0a2a  83ec04           sub sp, 4                                
  0a2d  56               push si                                  
  0a2e  57               push di                                  
  0a2f  c746feffff       mov word ptr [bp - 2], 0xffff            
  0a34  c746fce803       mov word ptr [bp - 4], 0x3e8             
  0a39  b8042c           mov ax, 0x2c04                           
  0a3c  8ec0             mov es, ax                               
  0a3e  268b3e7b15       mov di, word ptr es:[0x157b]             
  0a43  e99000           jmp 0xad6                                
  0a46  8bdf             mov bx, di                               
  0a48  6bdb41           imul bx, bx, 0x41                        
  0a4b  b8042c           mov ax, 0x2c04                           
  0a4e  8ec0             mov es, ax                               
  0a50  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0a55  69dbe000         imul bx, bx, 0xe0                        
  0a59  8bf7             mov si, di                               
  0a5b  6bf641           imul si, si, 0x41                        
  0a5e  b8042c           mov ax, 0x2c04                           
  0a61  8ec0             mov es, ax                               
  0a63  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0a68  d1e0             shl ax, 1                                
  0a6a  03d8             add bx, ax                               
  0a6c  b81d1e           mov ax, 0x1e1d                           
  0a6f  8ec0             mov es, ax                               
  0a71  268a9f0000       mov bl, byte ptr es:[bx]                 
  0a76  81e3ff00         and bx, 0xff                             
  0a7a  b8042c           mov ax, 0x2c04                           
  0a7d  8ec0             mov es, ax                               
  0a7f  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0a85  754f             jne 0xad6                                
  0a87  8bdf             mov bx, di                               
  0a89  6bdb41           imul bx, bx, 0x41                        
  0a8c  b8042c           mov ax, 0x2c04                           
  0a8f  8ec0             mov es, ax                               
  0a91  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  0a96  b400             mov ah, 0                                
  0a98  3b460a           cmp ax, word ptr [bp + 0xa]              
  0a9b  7539             jne 0xad6                                
  0a9d  8bdf             mov bx, di                               
  0a9f  6bdb41           imul bx, bx, 0x41                        
  0aa2  b8042c           mov ax, 0x2c04                           
  0aa5  8ec0             mov es, ax                               
  0aa7  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0aac  8bdf             mov bx, di                               
  0aae  6bdb41           imul bx, bx, 0x41                        
  0ab1  b8042c           mov ax, 0x2c04                           
  0ab4  8ec0             mov es, ax                               
  0ab6  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0abb  ff7608           push word ptr [bp + 8]                   
  0abe  ff7606           push word ptr [bp + 6]                   
  0ac1  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0ac6  83c408           add sp, 8                                
  0ac9  8bd0             mov dx, ax                               
  0acb  3b56fc           cmp dx, word ptr [bp - 4]                
  0ace  7d06             jge 0xad6                                
  0ad0  8956fc           mov word ptr [bp - 4], dx                
  0ad3  897efe           mov word ptr [bp - 2], di                
  0ad6  8bc7             mov ax, di                               
  0ad8  4f               dec di                                   
  0ad9  0bc0             or ax, ax                                
  0adb  7403             je 0xae0                                 
  0add  e966ff           jmp 0xa46                                
  0ae0  8b46fe           mov ax, word ptr [bp - 2]                
  0ae3  5f               pop di                                   
  0ae4  5e               pop si                                   
  0ae5  c9               leave                                    
  0ae6  cb               retf                                     

ovl29_0ae7:  ; ENTRY
  0ae7  55               push bp                                  
  0ae8  8bec             mov bp, sp                               
  0aea  83ec08           sub sp, 8                                
  0aed  56               push si                                  
  0aee  57               push di                                  
  0aef  c746feffff       mov word ptr [bp - 2], 0xffff            
  0af4  b8042c           mov ax, 0x2c04                           
  0af7  8ec0             mov es, ax                               
  0af9  26ff361001       push word ptr es:[0x110]                 
  0afe  9a2400620b       lcall 0xb62, 0x24                        -> 0b62:0024
  0b03  59               pop cx                                   
  0b04  8956fc           mov word ptr [bp - 4], dx                
  0b07  8946fa           mov word ptr [bp - 6], ax                
  0b0a  c746f80000       mov word ptr [bp - 8], 0                 
  0b0f  33d2             xor dx, dx                               
  0b11  33f6             xor si, si                               
  0b13  eb11             jmp 0xb26                                
  0b15  8bc6             mov ax, si                               
  0b17  d1e0             shl ax, 1                                
  0b19  c45e06           les bx, ptr [bp + 6]                     
  0b1c  03d8             add bx, ax                               
  0b1e  26833fff         cmp word ptr es:[bx], -1                 
  0b22  7401             je 0xb25                                 
  0b24  42               inc dx                                   
  0b25  46               inc si                                   
  0b26  83fe08           cmp si, 8                                
  0b29  7cea             jl 0xb15                                 
  0b2b  0bd2             or dx, dx                                
  0b2d  7505             jne 0xb34                                
  0b2f  33c0             xor ax, ax                               
  0b31  e94601           jmp 0xc7a                                
  0b34  83fa01           cmp dx, 1                                
  0b37  7e08             jle 0xb41                                
  0b39  9ade0c620b       lcall 0xb62, 0xcde                       -> 0b62:0cde
  0b3e  8946f8           mov word ptr [bp - 8], ax                
  0b41  33f6             xor si, si                               
  0b43  e92401           jmp 0xc6a                                
  0b46  8bc6             mov ax, si                               
  0b48  d1e0             shl ax, 1                                
  0b4a  c45e06           les bx, ptr [bp + 6]                     
  0b4d  03d8             add bx, ax                               
  0b4f  268b3f           mov di, word ptr es:[bx]                 
  0b52  8bc7             mov ax, di                               
  0b54  3dffff           cmp ax, 0xffff                           
  0b57  7514             jne 0xb6d                                
  0b59  8bde             mov bx, si                               
  0b5b  c1e302           shl bx, 2                                
  0b5e  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  0b64  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0b6a  e9fc00           jmp 0xc69                                
  0b6d  8bc7             mov ax, di                               
  0b6f  6bc016           imul ax, ax, 0x16                        
  0b72  ba0000           mov dx, 0                                
  0b75  81c28088         add dx, 0x8880                           
  0b79  03c2             add ax, dx                               
  0b7b  8bde             mov bx, si                               
  0b7d  c1e302           shl bx, 2                                
  0b80  c787405e1d1e     mov word ptr [bx + 0x5e40], 0x1e1d       
  0b86  89873e5e         mov word ptr [bx + 0x5e3e], ax           
  0b8a  8bde             mov bx, si                               
  0b8c  c1e302           shl bx, 2                                
  0b8f  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0b93  268a4704         mov al, byte ptr es:[bx + 4]             
  0b97  98               cwde                                     
  0b98  c45efa           les bx, ptr [bp - 6]                     
  0b9b  03d8             add bx, ax                               
  0b9d  268a07           mov al, byte ptr es:[bx]                 
  0ba0  3a46fe           cmp al, byte ptr [bp - 2]                
  0ba3  7e31             jle 0xbd6                                
  0ba5  8bde             mov bx, si                               
  0ba7  c1e302           shl bx, 2                                
  0baa  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0bae  268a4704         mov al, byte ptr es:[bx + 4]             
  0bb2  98               cwde                                     
  0bb3  c45efa           les bx, ptr [bp - 6]                     
  0bb6  03d8             add bx, ax                               
  0bb8  268a07           mov al, byte ptr es:[bx]                 
  0bbb  98               cwde                                     
  0bbc  8946fe           mov word ptr [bp - 2], ax                
  0bbf  8bc7             mov ax, di                               
  0bc1  6bc016           imul ax, ax, 0x16                        
  0bc4  ba0000           mov dx, 0                                
  0bc7  81c28088         add dx, 0x8880                           
  0bcb  03c2             add ax, dx                               
  0bcd  c706645e1d1e     mov word ptr [0x5e64], 0x1e1d            
  0bd3  a3625e           mov word ptr [0x5e62], ax                
  0bd6  837e0aff         cmp word ptr [bp + 0xa], -1              
  0bda  7467             je 0xc43                                 
  0bdc  8b460a           mov ax, word ptr [bp + 0xa]              
  0bdf  250f00           and ax, 0xf                              
  0be2  8bdf             mov bx, di                               
  0be4  6bdb16           imul bx, bx, 0x16                        
  0be7  ba1d1e           mov dx, 0x1e1d                           
  0bea  8ec2             mov es, dx                               
  0bec  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0bf2  2608878e88       or byte ptr es:[bx - 0x7772], al         
  0bf7  8b460c           mov ax, word ptr [bp + 0xc]              
  0bfa  257f00           and ax, 0x7f                             
  0bfd  8bdf             mov bx, di                               
  0bff  6bdb16           imul bx, bx, 0x16                        
  0c02  8ec2             mov es, dx                               
  0c04  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  0c0a  d0e0             shl al, 1                                
  0c0c  2608878f88       or byte ptr es:[bx - 0x7771], al         
  0c11  8bdf             mov bx, di                               
  0c13  6bdb16           imul bx, bx, 0x16                        
  0c16  b81d1e           mov ax, 0x1e1d                           
  0c19  8a56f8           mov dl, byte ptr [bp - 8]                
  0c1c  8ec0             mov es, ax                               
  0c1e  2688979188       mov byte ptr es:[bx - 0x776f], dl        
  0c23  ff760c           push word ptr [bp + 0xc]                 
  0c26  ff760a           push word ptr [bp + 0xa]                 
  0c29  8bc7             mov ax, di                               
  0c2b  6bc016           imul ax, ax, 0x16                        
  0c2e  ba0000           mov dx, 0                                
  0c31  03d0             add dx, ax                               
  0c33  81c28088         add dx, 0x8880                           
  0c37  681d1e           push 0x1e1d                              
  0c3a  52               push dx                                  
  0c3b  90               nop                                      
  0c3c  0e               push cs                                  
  0c3d  e83e00           call 0xc7e                               
  0c40  83c408           add sp, 8                                
  0c43  8bdf             mov bx, di                               
  0c45  6bdb16           imul bx, bx, 0x16                        
  0c48  b81d1e           mov ax, 0x1e1d                           
  0c4b  8ec0             mov es, ax                               
  0c4d  2681a78c885fff   and word ptr es:[bx - 0x7774], 0xff5f    
  0c54  837e0e00         cmp word ptr [bp + 0xe], 0               
  0c58  740f             je 0xc69                                 
  0c5a  8bdf             mov bx, di                               
  0c5c  6bdb16           imul bx, bx, 0x16                        
  0c5f  8b560e           mov dx, word ptr [bp + 0xe]              
  0c62  8ec0             mov es, ax                               
  0c64  2609978c88       or word ptr es:[bx - 0x7774], dx         
  0c69  46               inc si                                   
  0c6a  83fe08           cmp si, 8                                
  0c6d  7d03             jge 0xc72                                
  0c6f  e9d4fe           jmp 0xb46                                
  0c72  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  0c77  b80100           mov ax, 1                                
  0c7a  5f               pop di                                   
  0c7b  5e               pop si                                   
  0c7c  c9               leave                                    
  0c7d  cb               retf                                     

ovl29_0c7e:  ; ENTRY
  0c7e  55               push bp                                  
  0c7f  8bec             mov bp, sp                               
  0c81  83ec04           sub sp, 4                                
  0c84  8b460a           mov ax, word ptr [bp + 0xa]              
  0c87  8b560c           mov dx, word ptr [bp + 0xc]              
  0c8a  c746feffff       mov word ptr [bp - 2], 0xffff            
  0c8f  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0c94  3d0400           cmp ax, 4                                
  0c97  7503             jne 0xc9c                                
  0c99  e9ea00           jmp 0xd86                                
  0c9c  3d0100           cmp ax, 1                                
  0c9f  7566             jne 0xd07                                
  0ca1  8bda             mov bx, dx                               
  0ca3  6bdb41           imul bx, bx, 0x41                        
  0ca6  b8042c           mov ax, 0x2c04                           
  0ca9  8ec0             mov es, ax                               
  0cab  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0cb0  8946fe           mov word ptr [bp - 2], ax                
  0cb3  8bda             mov bx, dx                               
  0cb5  6bdb41           imul bx, bx, 0x41                        
  0cb8  b8042c           mov ax, 0x2c04                           
  0cbb  8ec0             mov es, ax                               
  0cbd  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0cc2  8946fc           mov word ptr [bp - 4], ax                
  0cc5  8bda             mov bx, dx                               
  0cc7  6bdb41           imul bx, bx, 0x41                        
  0cca  b8042c           mov ax, 0x2c04                           
  0ccd  8ec0             mov es, ax                               
  0ccf  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0cd4  98               cwde                                     
  0cd5  ba042c           mov dx, 0x2c04                           
  0cd8  8ec2             mov es, dx                               
  0cda  263b061001       cmp ax, word ptr es:[0x110]              
  0cdf  7508             jne 0xce9                                
  0ce1  ff46fe           inc word ptr [bp - 2]                    
  0ce4  ff46fc           inc word ptr [bp - 4]                    
  0ce7  eb6f             jmp 0xd58                                
  0ce9  16               push ss                                  
  0cea  8d46fc           lea ax, [bp - 4]                         
  0ced  50               push ax                                  
  0cee  16               push ss                                  
  0cef  8d46fe           lea ax, [bp - 2]                         
  0cf2  50               push ax                                  
  0cf3  c45e06           les bx, ptr [bp + 6]                     
  0cf6  26ff7702         push word ptr es:[bx + 2]                
  0cfa  26ff37           push word ptr es:[bx]                    
  0cfd  90               nop                                      
  0cfe  0e               push cs                                  
  0cff  e88600           call 0xd88                               
  0d02  83c40c           add sp, 0xc                              
  0d05  eb51             jmp 0xd58                                
  0d07  3d0200           cmp ax, 2                                
  0d0a  7523             jne 0xd2f                                
  0d0c  8bda             mov bx, dx                               
  0d0e  6bdb1d           imul bx, bx, 0x1d                        
  0d11  b8042c           mov ax, 0x2c04                           
  0d14  8ec0             mov es, ax                               
  0d16  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  0d1b  8946fe           mov word ptr [bp - 2], ax                
  0d1e  8bda             mov bx, dx                               
  0d20  6bdb1d           imul bx, bx, 0x1d                        
  0d23  b8042c           mov ax, 0x2c04                           
  0d26  8ec0             mov es, ax                               
  0d28  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  0d2d  eb26             jmp 0xd55                                
  0d2f  3d0300           cmp ax, 3                                
  0d32  7524             jne 0xd58                                
  0d34  8bda             mov bx, dx                               
  0d36  6bdb1f           imul bx, bx, 0x1f                        
  0d39  b8042c           mov ax, 0x2c04                           
  0d3c  8ec0             mov es, ax                               
  0d3e  268b871108       mov ax, word ptr es:[bx + 0x811]         
  0d43  8946fe           mov word ptr [bp - 2], ax                
  0d46  8bda             mov bx, dx                               
  0d48  6bdb1f           imul bx, bx, 0x1f                        
  0d4b  b8042c           mov ax, 0x2c04                           
  0d4e  8ec0             mov es, ax                               
  0d50  268b871308       mov ax, word ptr es:[bx + 0x813]         
  0d55  8946fc           mov word ptr [bp - 4], ax                
  0d58  837efeff         cmp word ptr [bp - 2], -1                
  0d5c  7508             jne 0xd66                                
  0d5e  c45e06           les bx, ptr [bp + 6]                     
  0d61  268b07           mov ax, word ptr es:[bx]                 
  0d64  eb03             jmp 0xd69                                
  0d66  8b46fe           mov ax, word ptr [bp - 2]                
  0d69  c45e06           les bx, ptr [bp + 6]                     
  0d6c  26894712         mov word ptr es:[bx + 0x12], ax          
  0d70  837efcff         cmp word ptr [bp - 4], -1                
  0d74  7506             jne 0xd7c                                
  0d76  268b4702         mov ax, word ptr es:[bx + 2]             
  0d7a  eb03             jmp 0xd7f                                
  0d7c  8b46fc           mov ax, word ptr [bp - 4]                
  0d7f  c45e06           les bx, ptr [bp + 6]                     
  0d82  26894714         mov word ptr es:[bx + 0x14], ax          
  0d86  c9               leave                                    
  0d87  cb               retf                                     

ovl29_0d88:  ; ENTRY
  0d88  55               push bp                                  
  0d89  8bec             mov bp, sp                               
  0d8b  c45e0a           les bx, ptr [bp + 0xa]                   
  0d8e  268b07           mov ax, word ptr es:[bx]                 
  0d91  3b4606           cmp ax, word ptr [bp + 6]                
  0d94  7d03             jge 0xd99                                
  0d96  26ff07           inc word ptr es:[bx]                     
  0d99  c45e0e           les bx, ptr [bp + 0xe]                   
  0d9c  268b07           mov ax, word ptr es:[bx]                 
  0d9f  3b4608           cmp ax, word ptr [bp + 8]                
  0da2  7d03             jge 0xda7                                
  0da4  26ff07           inc word ptr es:[bx]                     
  0da7  5d               pop bp                                   
  0da8  cb               retf                                     

ovl29_0da9:  ; ENTRY
  0da9  55               push bp                                  
  0daa  8bec             mov bp, sp                               
  0dac  83ec04           sub sp, 4                                
  0daf  56               push si                                  
  0db0  57               push di                                  
  0db1  8b7e06           mov di, word ptr [bp + 6]                
  0db4  33f6             xor si, si                               
  0db6  eb23             jmp 0xddb                                
  0db8  56               push si                                  
  0db9  9a2f00db2f       lcall 0x2fdb, 0x2f                       -> ovl25:056c
  0dbe  59               pop cx                                   
  0dbf  8956fe           mov word ptr [bp - 2], dx                
  0dc2  8946fc           mov word ptr [bp - 4], ax                
  0dc5  682c04           push 0x42c                               
  0dc8  52               push dx                                  
  0dc9  50               push ax                                  
  0dca  57               push di                                  
  0dcb  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0dd0  83c408           add sp, 8                                
  0dd3  56               push si                                  
  0dd4  9a3400db2f       lcall 0x2fdb, 0x34                       -> ovl25:05b9
  0dd9  59               pop cx                                   
  0dda  46               inc si                                   
  0ddb  83fe08           cmp si, 8                                
  0dde  7cd8             jl 0xdb8                                 
  0de0  9a5200db2f       lcall 0x2fdb, 0x52                       -> ovl25:05e6
  0de5  68b004           push 0x4b0                               
  0de8  66ff36ea40       push dword ptr [0x40ea]                  
  0ded  57               push di                                  
  0dee  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0df3  83c408           add sp, 8                                
  0df6  9a5700db2f       lcall 0x2fdb, 0x57                       -> ovl25:063d
  0dfb  5f               pop di                                   
  0dfc  5e               pop si                                   
  0dfd  c9               leave                                    
  0dfe  cb               retf                                     

ovl29_0dff:  ; ENTRY
  0dff  55               push bp                                  
  0e00  8bec             mov bp, sp                               
  0e02  83ec04           sub sp, 4                                
  0e05  56               push si                                  
  0e06  57               push di                                  
  0e07  8b7e06           mov di, word ptr [bp + 6]                
  0e0a  33f6             xor si, si                               
  0e0c  eb23             jmp 0xe31                                
  0e0e  56               push si                                  
  0e0f  9a2f00db2f       lcall 0x2fdb, 0x2f                       -> ovl25:056c
  0e14  59               pop cx                                   
  0e15  8956fe           mov word ptr [bp - 2], dx                
  0e18  8946fc           mov word ptr [bp - 4], ax                
  0e1b  682c04           push 0x42c                               
  0e1e  52               push dx                                  
  0e1f  50               push ax                                  
  0e20  57               push di                                  
  0e21  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e26  83c408           add sp, 8                                
  0e29  56               push si                                  
  0e2a  9a3400db2f       lcall 0x2fdb, 0x34                       -> ovl25:05b9
  0e2f  59               pop cx                                   
  0e30  46               inc si                                   
  0e31  83fe08           cmp si, 8                                
  0e34  7cd8             jl 0xe0e                                 
  0e36  9a5200db2f       lcall 0x2fdb, 0x52                       -> ovl25:05e6
  0e3b  68b004           push 0x4b0                               
  0e3e  66ff36ea40       push dword ptr [0x40ea]                  
  0e43  57               push di                                  
  0e44  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e49  83c408           add sp, 8                                
  0e4c  9a5700db2f       lcall 0x2fdb, 0x57                       -> ovl25:063d
  0e51  9a50035505       lcall 0x555, 0x350                       -> 0555:0350
  0e56  5f               pop di                                   
  0e57  5e               pop si                                   
  0e58  c9               leave                                    
  0e59  cb               retf                                     

ovl29_0e5a:  ; ENTRY
  0e5a  55               push bp                                  
  0e5b  8bec             mov bp, sp                               
  0e5d  83ec02           sub sp, 2                                
  0e60  56               push si                                  
  0e61  57               push di                                  
  0e62  8b7e06           mov di, word ptr [bp + 6]                
  0e65  ff7608           push word ptr [bp + 8]                   
  0e68  57               push di                                  
  0e69  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  0e6e  83c404           add sp, 4                                
  0e71  8946fe           mov word ptr [bp - 2], ax                
  0e74  8bdf             mov bx, di                               
  0e76  6bdb41           imul bx, bx, 0x41                        
  0e79  035efe           add bx, word ptr [bp - 2]                
  0e7c  b8042c           mov ax, 0x2c04                           
  0e7f  8ec0             mov es, ax                               
  0e81  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  0e86  98               cwde                                     
  0e87  051e00           add ax, 0x1e                             
  0e8a  ba042c           mov dx, 0x2c04                           
  0e8d  8ec2             mov es, dx                               
  0e8f  268b1e1001       mov bx, word ptr es:[0x110]              
  0e94  6bdb14           imul bx, bx, 0x14                        
  0e97  ba042c           mov dx, 0x2c04                           
  0e9a  8ec2             mov es, dx                               
  0e9c  263b878501       cmp ax, word ptr es:[bx + 0x185]         
  0ea1  7e0e             jle 0xeb1                                
  0ea3  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0ea8  3d0500           cmp ax, 5                                
  0eab  7e04             jle 0xeb1                                
  0ead  33c0             xor ax, ax                               
  0eaf  eb5b             jmp 0xf0c                                
  0eb1  8bdf             mov bx, di                               
  0eb3  6bdb41           imul bx, bx, 0x41                        
  0eb6  b8042c           mov ax, 0x2c04                           
  0eb9  8a5608           mov dl, byte ptr [bp + 8]                
  0ebc  8ec0             mov es, ax                               
  0ebe  268897a915       mov byte ptr es:[bx + 0x15a9], dl        
  0ec3  8bdf             mov bx, di                               
  0ec5  6bdb41           imul bx, bx, 0x41                        
  0ec8  b8042c           mov ax, 0x2c04                           
  0ecb  8bf7             mov si, di                               
  0ecd  6bf641           imul si, si, 0x41                        
  0ed0  0376fe           add si, word ptr [bp - 2]                
  0ed3  ba042c           mov dx, 0x2c04                           
  0ed6  8ec2             mov es, dx                               
  0ed8  268a949715       mov dl, byte ptr es:[si + 0x1597]        
  0edd  8ec0             mov es, ax                               
  0edf  268897aa15       mov byte ptr es:[bx + 0x15aa], dl        
  0ee4  837e0a00         cmp word ptr [bp + 0xa], 0               
  0ee8  740e             je 0xef8                                 
  0eea  ff760c           push word ptr [bp + 0xc]                 
  0eed  57               push di                                  
  0eee  90               nop                                      
  0eef  0e               push cs                                  
  0ef0  e81d00           call 0xf10                               
  0ef3  83c404           add sp, 4                                
  0ef6  eb11             jmp 0xf09                                
  0ef8  8bdf             mov bx, di                               
  0efa  6bdb41           imul bx, bx, 0x41                        
  0efd  b8042c           mov ax, 0x2c04                           
  0f00  8ec0             mov es, ax                               
  0f02  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0f09  b80100           mov ax, 1                                
  0f0c  5f               pop di                                   
  0f0d  5e               pop si                                   
  0f0e  c9               leave                                    
  0f0f  cb               retf                                     

ovl29_0f10:  ; ENTRY
  0f10  55               push bp                                  
  0f11  8bec             mov bp, sp                               
  0f13  56               push si                                  
  0f14  57               push di                                  
  0f15  8b7606           mov si, word ptr [bp + 6]                
  0f18  8b7e08           mov di, word ptr [bp + 8]                
  0f1b  56               push si                                  
  0f1c  90               nop                                      
  0f1d  0e               push cs                                  
  0f1e  e8b400           call 0xfd5                               
  0f21  59               pop cx                                   
  0f22  0bc0             or ax, ax                                
  0f24  7535             jne 0xf5b                                
  0f26  8bde             mov bx, si                               
  0f28  6bdb41           imul bx, bx, 0x41                        
  0f2b  b8042c           mov ax, 0x2c04                           
  0f2e  8ec0             mov es, ax                               
  0f30  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0f37  8bde             mov bx, si                               
  0f39  6bdb41           imul bx, bx, 0x41                        
  0f3c  b8042c           mov ax, 0x2c04                           
  0f3f  8ec0             mov es, ax                               
  0f41  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  0f48  8bde             mov bx, si                               
  0f4a  6bdb41           imul bx, bx, 0x41                        
  0f4d  b8042c           mov ax, 0x2c04                           
  0f50  8ec0             mov es, ax                               
  0f52  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  0f59  eb76             jmp 0xfd1                                
  0f5b  83fe64           cmp si, 0x64                             
  0f5e  7d3e             jge 0xf9e                                
  0f60  8bdf             mov bx, di                               
  0f62  6bdb41           imul bx, bx, 0x41                        
  0f65  b8042c           mov ax, 0x2c04                           
  0f68  8ec0             mov es, ax                               
  0f6a  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0f6f  8bde             mov bx, si                               
  0f71  6bdb41           imul bx, bx, 0x41                        
  0f74  ba042c           mov dx, 0x2c04                           
  0f77  8ec2             mov es, dx                               
  0f79  268987b015       mov word ptr es:[bx + 0x15b0], ax        
  0f7e  8bdf             mov bx, di                               
  0f80  6bdb41           imul bx, bx, 0x41                        
  0f83  b8042c           mov ax, 0x2c04                           
  0f86  8ec0             mov es, ax                               
  0f88  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0f8d  8bde             mov bx, si                               
  0f8f  6bdb41           imul bx, bx, 0x41                        
  0f92  ba042c           mov dx, 0x2c04                           
  0f95  8ec2             mov es, dx                               
  0f97  268987b215       mov word ptr es:[bx + 0x15b2], ax        
  0f9c  eb22             jmp 0xfc0                                
  0f9e  8bde             mov bx, si                               
  0fa0  6bdb41           imul bx, bx, 0x41                        
  0fa3  b8042c           mov ax, 0x2c04                           
  0fa6  8ec0             mov es, ax                               
  0fa8  26c787b015feff   mov word ptr es:[bx + 0x15b0], 0xfffe    
  0faf  8bde             mov bx, si                               
  0fb1  6bdb41           imul bx, bx, 0x41                        
  0fb4  b8042c           mov ax, 0x2c04                           
  0fb7  8ec0             mov es, ax                               
  0fb9  26c787b215feff   mov word ptr es:[bx + 0x15b2], 0xfffe    
  0fc0  8bde             mov bx, si                               
  0fc2  6bdb41           imul bx, bx, 0x41                        
  0fc5  b8042c           mov ax, 0x2c04                           
  0fc8  8ec0             mov es, ax                               
  0fca  26c787ae150100   mov word ptr es:[bx + 0x15ae], 1         
  0fd1  5f               pop di                                   
  0fd2  5e               pop si                                   
  0fd3  5d               pop bp                                   
  0fd4  cb               retf                                     

ovl29_0fd5:  ; ENTRY
  0fd5  55               push bp                                  
  0fd6  8bec             mov bp, sp                               
  0fd8  83ec02           sub sp, 2                                
  0fdb  56               push si                                  
  0fdc  8b7606           mov si, word ptr [bp + 6]                
  0fdf  8bde             mov bx, si                               
  0fe1  6bdb41           imul bx, bx, 0x41                        
  0fe4  b8042c           mov ax, 0x2c04                           
  0fe7  8ec0             mov es, ax                               
  0fe9  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  0fee  98               cwde                                     
  0fef  0bc0             or ax, ax                                
  0ff1  7504             jne 0xff7                                
  0ff3  33c0             xor ax, ax                               
  0ff5  eb43             jmp 0x103a                               
  0ff7  8bde             mov bx, si                               
  0ff9  6bdb41           imul bx, bx, 0x41                        
  0ffc  b8042c           mov ax, 0x2c04                           
  0fff  8ec0             mov es, ax                               
  1001  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  1006  98               cwde                                     
  1007  50               push ax                                  
  1008  56               push si                                  
  1009  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  100e  83c404           add sp, 4                                
  1011  8946fe           mov word ptr [bp - 2], ax                
  1014  8bde             mov bx, si                               
  1016  6bdb41           imul bx, bx, 0x41                        
  1019  b8042c           mov ax, 0x2c04                           
  101c  8ec0             mov es, ax                               
  101e  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  1023  8bde             mov bx, si                               
  1025  6bdb41           imul bx, bx, 0x41                        
  1028  035efe           add bx, word ptr [bp - 2]                
  102b  ba042c           mov dx, 0x2c04                           
  102e  8ec2             mov es, dx                               
  1030  263a879715       cmp al, byte ptr es:[bx + 0x1597]        
  1035  74bc             je 0xff3                                 
  1037  b80100           mov ax, 1                                
  103a  5e               pop si                                   
  103b  c9               leave                                    
  103c  cb               retf                                     

ovl29_103d:  ; ENTRY
  103d  55               push bp                                  
  103e  8bec             mov bp, sp                               
  1040  83ec08           sub sp, 8                                
  1043  56               push si                                  
  1044  57               push di                                  
  1045  8b4e06           mov cx, word ptr [bp + 6]                
  1048  c746fc0000       mov word ptr [bp - 4], 0                 
  104d  c746faffff       mov word ptr [bp - 6], 0xffff            
  1052  be0400           mov si, 4                                
  1055  e93c01           jmp 0x1194                               
  1058  8bd9             mov bx, cx                               
  105a  6bdb41           imul bx, bx, 0x41                        
  105d  03de             add bx, si                               
  105f  b8042c           mov ax, 0x2c04                           
  1062  8ec0             mov es, ax                               
  1064  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1069  98               cwde                                     
  106a  8946fe           mov word ptr [bp - 2], ax                
  106d  0bc0             or ax, ax                                
  106f  7d03             jge 0x1074                               
  1071  e92001           jmp 0x1194                               
  1074  8bd9             mov bx, cx                               
  1076  6bdb41           imul bx, bx, 0x41                        
  1079  03de             add bx, si                               
  107b  b8042c           mov ax, 0x2c04                           
  107e  8ec0             mov es, ax                               
  1080  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  1085  98               cwde                                     
  1086  8bf8             mov di, ax                               
  1088  8bd9             mov bx, cx                               
  108a  6bdb41           imul bx, bx, 0x41                        
  108d  03de             add bx, si                               
  108f  b8042c           mov ax, 0x2c04                           
  1092  8ec0             mov es, ax                               
  1094  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  1099  98               cwde                                     
  109a  50               push ax                                  
  109b  b8042c           mov ax, 0x2c04                           
  109e  8ec0             mov es, ax                               
  10a0  268b1e1001       mov bx, word ptr es:[0x110]              
  10a5  d1e3             shl bx, 1                                
  10a7  b8042c           mov ax, 0x2c04                           
  10aa  8ec0             mov es, ax                               
  10ac  2683bff00000     cmp word ptr es:[bx + 0xf0], 0           
  10b2  7405             je 0x10b9                                
  10b4  b80200           mov ax, 2                                
  10b7  eb02             jmp 0x10bb                               
  10b9  33c0             xor ax, ax                               
  10bb  5a               pop dx                                   
  10bc  03d0             add dx, ax                               
  10be  83fa09           cmp dx, 9                                
  10c1  7e05             jle 0x10c8                               
  10c3  b80900           mov ax, 9                                
  10c6  eb38             jmp 0x1100                               
  10c8  8bd9             mov bx, cx                               
  10ca  6bdb41           imul bx, bx, 0x41                        
  10cd  03de             add bx, si                               
  10cf  b8042c           mov ax, 0x2c04                           
  10d2  8ec0             mov es, ax                               
  10d4  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  10d9  98               cwde                                     
  10da  50               push ax                                  
  10db  b8042c           mov ax, 0x2c04                           
  10de  8ec0             mov es, ax                               
  10e0  268b1e1001       mov bx, word ptr es:[0x110]              
  10e5  d1e3             shl bx, 1                                
  10e7  b8042c           mov ax, 0x2c04                           
  10ea  8ec0             mov es, ax                               
  10ec  2683bff00000     cmp word ptr es:[bx + 0xf0], 0           
  10f2  7405             je 0x10f9                                
  10f4  b80200           mov ax, 2                                
  10f7  eb02             jmp 0x10fb                               
  10f9  33c0             xor ax, ax                               
  10fb  8bd0             mov dx, ax                               
  10fd  58               pop ax                                   
  10fe  03c2             add ax, dx                               
  1100  8946f8           mov word ptr [bp - 8], ax                
  1103  8b5efe           mov bx, word ptr [bp - 2]                
  1106  6bdb06           imul bx, bx, 6                           
  1109  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  110e  7504             jne 0x1114                               
  1110  8346f802         add word ptr [bp - 8], 2                 
  1114  837e0806         cmp word ptr [bp + 8], 6                 
  1118  7407             je 0x1121                                
  111a  837ef803         cmp word ptr [bp - 8], 3                 
  111e  7d01             jge 0x1121                               
  1120  47               inc di                                   
  1121  83ff0a           cmp di, 0xa                              
  1124  7e05             jle 0x112b                               
  1126  b80a00           mov ax, 0xa                              
  1129  eb02             jmp 0x112d                               
  112b  8bc7             mov ax, di                               
  112d  8bf8             mov di, ax                               
  112f  8b5efe           mov bx, word ptr [bp - 2]                
  1132  6bdb06           imul bx, bx, 6                           
  1135  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  1139  98               cwde                                     
  113a  0bc0             or ax, ax                                
  113c  7506             jne 0x1144                               
  113e  837e0804         cmp word ptr [bp + 8], 4                 
  1142  7450             je 0x1194                                
  1144  8bd9             mov bx, cx                               
  1146  6bdb41           imul bx, bx, 0x41                        
  1149  03de             add bx, si                               
  114b  b8042c           mov ax, 0x2c04                           
  114e  8ec0             mov es, ax                               
  1150  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  1155  98               cwde                                     
  1156  8b5e08           mov bx, word ptr [bp + 8]                
  1159  d1e3             shl bx, 1                                
  115b  f7af2c0a         imul word ptr [bx + 0xa2c]               
  115f  99               cdq                                      
  1160  2bc2             sub ax, dx                               
  1162  d1f8             sar ax, 1                                
  1164  8b5e08           mov bx, word ptr [bp + 8]                
  1167  d1e3             shl bx, 1                                
  1169  50               push ax                                  
  116a  b80a00           mov ax, 0xa                              
  116d  2bc7             sub ax, di                               
  116f  f7af100a         imul word ptr [bx + 0xa10]               
  1173  8b5e08           mov bx, word ptr [bp + 8]                
  1176  d1e3             shl bx, 1                                
  1178  50               push ax                                  
  1179  8b46f8           mov ax, word ptr [bp - 8]                
  117c  f7af1e0a         imul word ptr [bx + 0xa1e]               
  1180  5b               pop bx                                   
  1181  03d8             add bx, ax                               
  1183  58               pop ax                                   
  1184  03d8             add bx, ax                               
  1186  3b5efc           cmp bx, word ptr [bp - 4]                
  1189  7e09             jle 0x1194                               
  118b  895efc           mov word ptr [bp - 4], bx                
  118e  8b46fe           mov ax, word ptr [bp - 2]                
  1191  8946fa           mov word ptr [bp - 6], ax                
  1194  8bc6             mov ax, si                               
  1196  4e               dec si                                   
  1197  0bc0             or ax, ax                                
  1199  7403             je 0x119e                                
  119b  e9bafe           jmp 0x1058                               
  119e  837e0c00         cmp word ptr [bp + 0xc], 0               
  11a2  7405             je 0x11a9                                
  11a4  8b46fa           mov ax, word ptr [bp - 6]                
  11a7  eb28             jmp 0x11d1                               
  11a9  837efaff         cmp word ptr [bp - 6], -1                
  11ad  7504             jne 0x11b3                               
  11af  33c0             xor ax, ax                               
  11b1  eb1e             jmp 0x11d1                               
  11b3  837e0aff         cmp word ptr [bp + 0xa], -1              
  11b7  7505             jne 0x11be                               
  11b9  666a00           push 0                                   
  11bc  eb05             jmp 0x11c3                               
  11be  ff760a           push word ptr [bp + 0xa]                 
  11c1  6a01             push 1                                   
  11c3  ff76fa           push word ptr [bp - 6]                   
  11c6  51               push cx                                  
  11c7  0e               push cs                                  
  11c8  e88ffc           call 0xe5a                               
  11cb  83c408           add sp, 8                                
  11ce  b80100           mov ax, 1                                
  11d1  5f               pop di                                   
  11d2  5e               pop si                                   
  11d3  c9               leave                                    
  11d4  cb               retf                                     

ovl29_11d5:  ; ENTRY
  11d5  55               push bp                                  
  11d6  8bec             mov bp, sp                               
  11d8  83ec0e           sub sp, 0xe                              
  11db  56               push si                                  
  11dc  57               push di                                  
  11dd  8b7e06           mov di, word ptr [bp + 6]                
  11e0  57               push di                                  
  11e1  90               nop                                      
  11e2  0e               push cs                                  
  11e3  e80309           call 0x1ae9                              
  11e6  59               pop cx                                   
  11e7  8946f2           mov word ptr [bp - 0xe], ax              
  11ea  9a70005830       lcall 0x3058, 0x70                       -> ovl44:1128
  11ef  33f6             xor si, si                               
  11f1  e9c400           jmp 0x12b8                               
  11f4  8bde             mov bx, si                               
  11f6  6bdb06           imul bx, bx, 6                           
  11f9  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  11fd  98               cwde                                     
  11fe  0bc0             or ax, ax                                
  1200  7503             jne 0x1205                               
  1202  e9b200           jmp 0x12b7                               
  1205  8bde             mov bx, si                               
  1207  6bdb06           imul bx, bx, 6                           
  120a  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  120f  7403             je 0x1214                                
  1211  e9a300           jmp 0x12b7                               
  1214  ba0400           mov dx, 4                                
  1217  eb14             jmp 0x122d                               
  1219  8bdf             mov bx, di                               
  121b  6bdb41           imul bx, bx, 0x41                        
  121e  03da             add bx, dx                               
  1220  b8042c           mov ax, 0x2c04                           
  1223  8ec0             mov es, ax                               
  1225  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  122a  98               cwde                                     
  122b  3bc6             cmp ax, si                               
  122d  8bc2             mov ax, dx                               
  122f  4a               dec dx                                   
  1230  0bc0             or ax, ax                                
  1232  75e5             jne 0x1219                               
  1234  16               push ss                                  
  1235  8d46f6           lea ax, [bp - 0xa]                       
  1238  50               push ax                                  
  1239  16               push ss                                  
  123a  8d46f8           lea ax, [bp - 8]                         
  123d  50               push ax                                  
  123e  16               push ss                                  
  123f  8d46fa           lea ax, [bp - 6]                         
  1242  50               push ax                                  
  1243  16               push ss                                  
  1244  8d46fc           lea ax, [bp - 4]                         
  1247  50               push ax                                  
  1248  16               push ss                                  
  1249  8d46fe           lea ax, [bp - 2]                         
  124c  50               push ax                                  
  124d  56               push si                                  
  124e  9a8e005830       lcall 0x3058, 0x8e                       -> ovl44:138f
  1253  83c416           add sp, 0x16                             
  1256  8946f4           mov word ptr [bp - 0xc], ax              
  1259  8346f81e         add word ptr [bp - 8], 0x1e              
  125d  b8042c           mov ax, 0x2c04                           
  1260  8ec0             mov es, ax                               
  1262  268b1e1001       mov bx, word ptr es:[0x110]              
  1267  6bdb14           imul bx, bx, 0x14                        
  126a  b8042c           mov ax, 0x2c04                           
  126d  8ec0             mov es, ax                               
  126f  268b878501       mov ax, word ptr es:[bx + 0x185]         
  1274  3b46f8           cmp ax, word ptr [bp - 8]                
  1277  7c3e             jl 0x12b7                                
  1279  ff76f4           push word ptr [bp - 0xc]                 
  127c  ff76f2           push word ptr [bp - 0xe]                 
  127f  57               push di                                  
  1280  9a93005830       lcall 0x3058, 0x93                       -> ovl44:1299
  1285  83c406           add sp, 6                                
  1288  c41eee40         les bx, ptr [0x40ee]                     
  128c  03df             add bx, di                               
  128e  26808f1e0102     or byte ptr es:[bx + 0x11e], 2           
  1294  8bdf             mov bx, di                               
  1296  6bdb41           imul bx, bx, 0x41                        
  1299  b8042c           mov ax, 0x2c04                           
  129c  8ec0             mov es, ax                               
  129e  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  12a4  8bdf             mov bx, di                               
  12a6  6bdb41           imul bx, bx, 0x41                        
  12a9  b8042c           mov ax, 0x2c04                           
  12ac  8ec0             mov es, ax                               
  12ae  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  12b5  eb09             jmp 0x12c0                               
  12b7  46               inc si                                   
  12b8  83fe1d           cmp si, 0x1d                             
  12bb  7d03             jge 0x12c0                               
  12bd  e934ff           jmp 0x11f4                               
  12c0  9a75005830       lcall 0x3058, 0x75                       -> ovl44:11e2
  12c5  5f               pop di                                   
  12c6  5e               pop si                                   
  12c7  c9               leave                                    
  12c8  cb               retf                                     

ovl29_12c9:  ; ENTRY
  12c9  55               push bp                                  
  12ca  8bec             mov bp, sp                               
  12cc  83ec10           sub sp, 0x10                             
  12cf  56               push si                                  
  12d0  57               push di                                  
  12d1  8b7e0e           mov di, word ptr [bp + 0xe]              
  12d4  b90800           mov cx, 8                                
  12d7  eb0e             jmp 0x12e7                               
  12d9  8bd9             mov bx, cx                               
  12db  d1e3             shl bx, 1                                
  12dd  8d46f0           lea ax, [bp - 0x10]                      
  12e0  03d8             add bx, ax                               
  12e2  36c707ffff       mov word ptr ss:[bx], 0xffff             
  12e7  8bc1             mov ax, cx                               
  12e9  49               dec cx                                   
  12ea  0bc0             or ax, ax                                
  12ec  75eb             jne 0x12d9                               
  12ee  33f6             xor si, si                               
  12f0  b8042c           mov ax, 0x2c04                           
  12f3  8ec0             mov es, ax                               
  12f5  268b0e8101       mov cx, word ptr es:[0x181]              
  12fa  eb6d             jmp 0x1369                               
  12fc  8bd9             mov bx, cx                               
  12fe  6bdb16           imul bx, bx, 0x16                        
  1301  b81d1e           mov ax, 0x1e1d                           
  1304  8ec0             mov es, ax                               
  1306  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  130b  ba042c           mov dx, 0x2c04                           
  130e  8ec2             mov es, dx                               
  1310  263a061001       cmp al, byte ptr es:[0x110]              
  1315  7552             jne 0x1369                               
  1317  8bd9             mov bx, cx                               
  1319  6bdb16           imul bx, bx, 0x16                        
  131c  b81d1e           mov ax, 0x1e1d                           
  131f  8ec0             mov es, ax                               
  1321  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  1326  3b4606           cmp ax, word ptr [bp + 6]                
  1329  753e             jne 0x1369                               
  132b  8bd9             mov bx, cx                               
  132d  6bdb16           imul bx, bx, 0x16                        
  1330  b81d1e           mov ax, 0x1e1d                           
  1333  8ec0             mov es, ax                               
  1335  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  133a  3b4608           cmp ax, word ptr [bp + 8]                
  133d  752a             jne 0x1369                               
  133f  0bff             or di, di                                
  1341  7414             je 0x1357                                
  1343  8bd9             mov bx, cx                               
  1345  6bdb16           imul bx, bx, 0x16                        
  1348  b81d1e           mov ax, 0x1e1d                           
  134b  8ec0             mov es, ax                               
  134d  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  1352  98               cwde                                     
  1353  3bc7             cmp ax, di                               
  1355  7c12             jl 0x1369                                
  1357  8bde             mov bx, si                               
  1359  d1e3             shl bx, 1                                
  135b  8d46f0           lea ax, [bp - 0x10]                      
  135e  03d8             add bx, ax                               
  1360  36890f           mov word ptr ss:[bx], cx                 
  1363  46               inc si                                   
  1364  83fe08           cmp si, 8                                
  1367  7d07             jge 0x1370                               
  1369  8bc1             mov ax, cx                               
  136b  49               dec cx                                   
  136c  0bc0             or ax, ax                                
  136e  758c             jne 0x12fc                               
  1370  0bf6             or si, si                                
  1372  740d             je 0x1381                                
  1374  16               push ss                                  
  1375  8d46f0           lea ax, [bp - 0x10]                      
  1378  50               push ax                                  
  1379  90               nop                                      
  137a  0e               push cs                                  
  137b  e85501           call 0x14d3                              
  137e  83c404           add sp, 4                                
  1381  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  1386  7424             je 0x13ac                                
  1388  b90800           mov cx, 8                                
  138b  eb18             jmp 0x13a5                               
  138d  8bd9             mov bx, cx                               
  138f  d1e3             shl bx, 1                                
  1391  8d46f0           lea ax, [bp - 0x10]                      
  1394  03d8             add bx, ax                               
  1396  368b07           mov ax, word ptr ss:[bx]                 
  1399  8bd1             mov dx, cx                               
  139b  d1e2             shl dx, 1                                
  139d  c45e0a           les bx, ptr [bp + 0xa]                   
  13a0  03da             add bx, dx                               
  13a2  268907           mov word ptr es:[bx], ax                 
  13a5  8bc1             mov ax, cx                               
  13a7  49               dec cx                                   
  13a8  0bc0             or ax, ax                                
  13aa  75e1             jne 0x138d                               
  13ac  8bc6             mov ax, si                               
  13ae  5f               pop di                                   
  13af  5e               pop si                                   
  13b0  c9               leave                                    
  13b1  cb               retf                                     

ovl29_13b2:  ; ENTRY
  13b2  55               push bp                                  
  13b3  8bec             mov bp, sp                               
  13b5  83ec10           sub sp, 0x10                             
  13b8  56               push si                                  
  13b9  57               push di                                  
  13ba  8b7e12           mov di, word ptr [bp + 0x12]             
  13bd  b90800           mov cx, 8                                
  13c0  eb0e             jmp 0x13d0                               
  13c2  8bd9             mov bx, cx                               
  13c4  d1e3             shl bx, 1                                
  13c6  8d46f0           lea ax, [bp - 0x10]                      
  13c9  03d8             add bx, ax                               
  13cb  36c707ffff       mov word ptr ss:[bx], 0xffff             
  13d0  8bc1             mov ax, cx                               
  13d2  49               dec cx                                   
  13d3  0bc0             or ax, ax                                
  13d5  75eb             jne 0x13c2                               
  13d7  33f6             xor si, si                               
  13d9  b8042c           mov ax, 0x2c04                           
  13dc  8ec0             mov es, ax                               
  13de  268b0e8101       mov cx, word ptr es:[0x181]              
  13e3  e9a100           jmp 0x1487                               
  13e6  8bd9             mov bx, cx                               
  13e8  6bdb16           imul bx, bx, 0x16                        
  13eb  b81d1e           mov ax, 0x1e1d                           
  13ee  8ec0             mov es, ax                               
  13f0  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  13f5  ba042c           mov dx, 0x2c04                           
  13f8  8ec2             mov es, dx                               
  13fa  263a061001       cmp al, byte ptr es:[0x110]              
  13ff  7403             je 0x1404                                
  1401  e98300           jmp 0x1487                               
  1404  8bd9             mov bx, cx                               
  1406  6bdb16           imul bx, bx, 0x16                        
  1409  b81d1e           mov ax, 0x1e1d                           
  140c  8ec0             mov es, ax                               
  140e  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  1413  3b4606           cmp ax, word ptr [bp + 6]                
  1416  756f             jne 0x1487                               
  1418  8bd9             mov bx, cx                               
  141a  6bdb16           imul bx, bx, 0x16                        
  141d  b81d1e           mov ax, 0x1e1d                           
  1420  8ec0             mov es, ax                               
  1422  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1427  3b4608           cmp ax, word ptr [bp + 8]                
  142a  755b             jne 0x1487                               
  142c  8bd9             mov bx, cx                               
  142e  6bdb16           imul bx, bx, 0x16                        
  1431  b81d1e           mov ax, 0x1e1d                           
  1434  8ec0             mov es, ax                               
  1436  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  143b  c1e804           shr ax, 4                                
  143e  250700           and ax, 7                                
  1441  3b460e           cmp ax, word ptr [bp + 0xe]              
  1444  7541             jne 0x1487                               
  1446  8bd9             mov bx, cx                               
  1448  6bdb16           imul bx, bx, 0x16                        
  144b  b81d1e           mov ax, 0x1e1d                           
  144e  8ec0             mov es, ax                               
  1450  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  1455  250f00           and ax, 0xf                              
  1458  3b4610           cmp ax, word ptr [bp + 0x10]             
  145b  752a             jne 0x1487                               
  145d  0bff             or di, di                                
  145f  7414             je 0x1475                                
  1461  8bd9             mov bx, cx                               
  1463  6bdb16           imul bx, bx, 0x16                        
  1466  b81d1e           mov ax, 0x1e1d                           
  1469  8ec0             mov es, ax                               
  146b  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  1470  98               cwde                                     
  1471  3bc7             cmp ax, di                               
  1473  7c12             jl 0x1487                                
  1475  8bde             mov bx, si                               
  1477  d1e3             shl bx, 1                                
  1479  8d46f0           lea ax, [bp - 0x10]                      
  147c  03d8             add bx, ax                               
  147e  36890f           mov word ptr ss:[bx], cx                 
  1481  46               inc si                                   
  1482  83fe08           cmp si, 8                                
  1485  7d0a             jge 0x1491                               
  1487  8bc1             mov ax, cx                               
  1489  49               dec cx                                   
  148a  0bc0             or ax, ax                                
  148c  7403             je 0x1491                                
  148e  e955ff           jmp 0x13e6                               
  1491  0bf6             or si, si                                
  1493  740d             je 0x14a2                                
  1495  16               push ss                                  
  1496  8d46f0           lea ax, [bp - 0x10]                      
  1499  50               push ax                                  
  149a  90               nop                                      
  149b  0e               push cs                                  
  149c  e83400           call 0x14d3                              
  149f  83c404           add sp, 4                                
  14a2  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  14a7  7424             je 0x14cd                                
  14a9  b90800           mov cx, 8                                
  14ac  eb18             jmp 0x14c6                               
  14ae  8bd9             mov bx, cx                               
  14b0  d1e3             shl bx, 1                                
  14b2  8d46f0           lea ax, [bp - 0x10]                      
  14b5  03d8             add bx, ax                               
  14b7  368b07           mov ax, word ptr ss:[bx]                 
  14ba  8bd1             mov dx, cx                               
  14bc  d1e2             shl dx, 1                                
  14be  c45e0a           les bx, ptr [bp + 0xa]                   
  14c1  03da             add bx, dx                               
  14c3  268907           mov word ptr es:[bx], ax                 
  14c6  8bc1             mov ax, cx                               
  14c8  49               dec cx                                   
  14c9  0bc0             or ax, ax                                
  14cb  75e1             jne 0x14ae                               
  14cd  8bc6             mov ax, si                               
  14cf  5f               pop di                                   
  14d0  5e               pop si                                   
  14d1  c9               leave                                    
  14d2  cb               retf                                     

ovl29_14d3:  ; ENTRY
  14d3  55               push bp                                  
  14d4  8bec             mov bp, sp                               
  14d6  c706da2b0000     mov word ptr [0x2bda], 0                 
  14dc  c706fe5d0000     mov word ptr [0x5dfe], 0                 
  14e2  c706005e6400     mov word ptr [0x5e00], 0x64              
  14e8  66c706625e000000 mov dword ptr [0x5e62], 0                
  14f1  33c9             xor cx, cx                               
  14f3  eb59             jmp 0x154e                               
  14f5  8bd9             mov bx, cx                               
  14f7  c1e302           shl bx, 2                                
  14fa  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  1500  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  1506  8bc1             mov ax, cx                               
  1508  d1e0             shl ax, 1                                
  150a  c45e06           les bx, ptr [bp + 6]                     
  150d  03d8             add bx, ax                               
  150f  26833fff         cmp word ptr es:[bx], -1                 
  1513  7438             je 0x154d                                
  1515  268b1f           mov bx, word ptr es:[bx]                 
  1518  6bdb16           imul bx, bx, 0x16                        
  151b  b81d1e           mov ax, 0x1e1d                           
  151e  8ec0             mov es, ax                               
  1520  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  1525  98               cwde                                     
  1526  3b06005e         cmp ax, word ptr [0x5e00]                
  152a  7d1d             jge 0x1549                               
  152c  8bc1             mov ax, cx                               
  152e  d1e0             shl ax, 1                                
  1530  c45e06           les bx, ptr [bp + 6]                     
  1533  03d8             add bx, ax                               
  1535  268b1f           mov bx, word ptr es:[bx]                 
  1538  6bdb16           imul bx, bx, 0x16                        
  153b  b81d1e           mov ax, 0x1e1d                           
  153e  8ec0             mov es, ax                               
  1540  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  1545  98               cwde                                     
  1546  a3005e           mov word ptr [0x5e00], ax                
  1549  ff06fe5d         inc word ptr [0x5dfe]                    
  154d  41               inc cx                                   
  154e  83f908           cmp cx, 8                                
  1551  7ca2             jl 0x14f5                                
  1553  833efe5d00       cmp word ptr [0x5dfe], 0                 
  1558  7469             je 0x15c3                                
  155a  833efe5d01       cmp word ptr [0x5dfe], 1                 
  155f  751d             jne 0x157e                               
  1561  c45e06           les bx, ptr [bp + 6]                     
  1564  268b07           mov ax, word ptr es:[bx]                 
  1567  6bc016           imul ax, ax, 0x16                        
  156a  ba0000           mov dx, 0                                
  156d  81c28088         add dx, 0x8880                           
  1571  03c2             add ax, dx                               
  1573  c706405e1d1e     mov word ptr [0x5e40], 0x1e1d            
  1579  a33e5e           mov word ptr [0x5e3e], ax                
  157c  eb3d             jmp 0x15bb                               
  157e  c706da2b0100     mov word ptr [0x2bda], 1                 
  1584  33c9             xor cx, cx                               
  1586  eb2e             jmp 0x15b6                               
  1588  8bc1             mov ax, cx                               
  158a  d1e0             shl ax, 1                                
  158c  c45e06           les bx, ptr [bp + 6]                     
  158f  03d8             add bx, ax                               
  1591  26833fff         cmp word ptr es:[bx], -1                 
  1595  741e             je 0x15b5                                
  1597  268b07           mov ax, word ptr es:[bx]                 
  159a  6bc016           imul ax, ax, 0x16                        
  159d  ba0000           mov dx, 0                                
  15a0  81c28088         add dx, 0x8880                           
  15a4  03c2             add ax, dx                               
  15a6  8bd9             mov bx, cx                               
  15a8  c1e302           shl bx, 2                                
  15ab  c787405e1d1e     mov word ptr [bx + 0x5e40], 0x1e1d       
  15b1  89873e5e         mov word ptr [bx + 0x5e3e], ax           
  15b5  41               inc cx                                   
  15b6  83f908           cmp cx, 8                                
  15b9  7ccd             jl 0x1588                                
  15bb  66a13e5e         mov eax, dword ptr [0x5e3e]              
  15bf  66a3625e         mov dword ptr [0x5e62], eax              
  15c3  5d               pop bp                                   
  15c4  cb               retf                                     

ovl29_15c5:  ; ENTRY
  15c5  55               push bp                                  
  15c6  8bec             mov bp, sp                               
  15c8  83ec02           sub sp, 2                                
  15cb  56               push si                                  
  15cc  57               push di                                  
  15cd  33f6             xor si, si                               
  15cf  c41eee40         les bx, ptr [0x40ee]                     
  15d3  26837f2001       cmp word ptr es:[bx + 0x20], 1           
  15d8  7d05             jge 0x15df                               
  15da  b80100           mov ax, 1                                
  15dd  eb08             jmp 0x15e7                               
  15df  c41eee40         les bx, ptr [0x40ee]                     
  15e3  268b4720         mov ax, word ptr es:[bx + 0x20]          
  15e7  8946fe           mov word ptr [bp - 2], ax                
  15ea  8b7efe           mov di, word ptr [bp - 2]                
  15ed  eb23             jmp 0x1612                               
  15ef  6a00             push 0                                   
  15f1  ff7608           push word ptr [bp + 8]                   
  15f4  ff7606           push word ptr [bp + 6]                   
  15f7  9a20002430       lcall 0x3024, 0x20                       -> ovl36:124a
  15fc  83c406           add sp, 6                                
  15ff  89160c41         mov word ptr [0x410c], dx                
  1603  a30a41           mov word ptr [0x410a], ax                
  1606  c41e0a41         les bx, ptr [0x410a]                     
  160a  26837f0200       cmp word ptr es:[bx + 2], 0              
  160f  7501             jne 0x1612                               
  1611  46               inc si                                   
  1612  8bc7             mov ax, di                               
  1614  4f               dec di                                   
  1615  0bc0             or ax, ax                                
  1617  75d6             jne 0x15ef                               
  1619  8bc6             mov ax, si                               
  161b  6bc064           imul ax, ax, 0x64                        
  161e  99               cdq                                      
  161f  f77efe           idiv word ptr [bp - 2]                   
  1622  5f               pop di                                   
  1623  5e               pop si                                   
  1624  c9               leave                                    
  1625  cb               retf                                     

ovl29_1626:  ; ENTRY
  1626  55               push bp                                  
  1627  8bec             mov bp, sp                               
  1629  c45e12           les bx, ptr [bp + 0x12]                  
  162c  33c0             xor ax, ax                               
  162e  268907           mov word ptr es:[bx], ax                 
  1631  c45e0e           les bx, ptr [bp + 0xe]                   
  1634  268907           mov word ptr es:[bx], ax                 
  1637  c45e0a           les bx, ptr [bp + 0xa]                   
  163a  268907           mov word ptr es:[bx], ax                 
  163d  b8042c           mov ax, 0x2c04                           
  1640  8ec0             mov es, ax                               
  1642  268b168101       mov dx, word ptr es:[0x181]              
  1647  eb5c             jmp 0x16a5                               
  1649  8bda             mov bx, dx                               
  164b  6bdb16           imul bx, bx, 0x16                        
  164e  b81d1e           mov ax, 0x1e1d                           
  1651  8ec0             mov es, ax                               
  1653  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  1658  3b4606           cmp ax, word ptr [bp + 6]                
  165b  7548             jne 0x16a5                               
  165d  8bda             mov bx, dx                               
  165f  6bdb16           imul bx, bx, 0x16                        
  1662  b81d1e           mov ax, 0x1e1d                           
  1665  8ec0             mov es, ax                               
  1667  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  166c  3b4608           cmp ax, word ptr [bp + 8]                
  166f  7534             jne 0x16a5                               
  1671  c45e0a           les bx, ptr [bp + 0xa]                   
  1674  26ff07           inc word ptr es:[bx]                     
  1677  8bda             mov bx, dx                               
  1679  6bdb16           imul bx, bx, 0x16                        
  167c  b81d1e           mov ax, 0x1e1d                           
  167f  8ec0             mov es, ax                               
  1681  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  1686  98               cwde                                     
  1687  c45e0e           les bx, ptr [bp + 0xe]                   
  168a  260107           add word ptr es:[bx], ax                 
  168d  8bda             mov bx, dx                               
  168f  6bdb16           imul bx, bx, 0x16                        
  1692  b81d1e           mov ax, 0x1e1d                           
  1695  8ec0             mov es, ax                               
  1697  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  169d  7506             jne 0x16a5                               
  169f  c45e12           les bx, ptr [bp + 0x12]                  
  16a2  26ff07           inc word ptr es:[bx]                     
  16a5  8bc2             mov ax, dx                               
  16a7  4a               dec dx                                   
  16a8  0bc0             or ax, ax                                
  16aa  759d             jne 0x1649                               
  16ac  5d               pop bp                                   
  16ad  cb               retf                                     

ovl29_16ae:  ; ENTRY
  16ae  55               push bp                                  
  16af  8bec             mov bp, sp                               
  16b1  56               push si                                  
  16b2  57               push di                                  
  16b3  8b7606           mov si, word ptr [bp + 6]                
  16b6  8b7e08           mov di, word ptr [bp + 8]                
  16b9  8bd6             mov dx, si                               
  16bb  4a               dec dx                                   
  16bc  eb41             jmp 0x16ff                               
  16be  8bcf             mov cx, di                               
  16c0  49               dec cx                                   
  16c1  eb34             jmp 0x16f7                               
  16c3  0bd2             or dx, dx                                
  16c5  7c2f             jl 0x16f6                                
  16c7  0bc9             or cx, cx                                
  16c9  7c2b             jl 0x16f6                                
  16cb  83fa70           cmp dx, 0x70                             
  16ce  7d26             jge 0x16f6                               
  16d0  81f99c00         cmp cx, 0x9c                             
  16d4  7d20             jge 0x16f6                               
  16d6  8bd9             mov bx, cx                               
  16d8  6bdb70           imul bx, bx, 0x70                        
  16db  03da             add bx, dx                               
  16dd  b8d919           mov ax, 0x19d9                           
  16e0  8ec0             mov es, ax                               
  16e2  268a870000       mov al, byte ptr es:[bx]                 
  16e7  c1e805           shr ax, 5                                
  16ea  250100           and ax, 1                                
  16ed  0bc0             or ax, ax                                
  16ef  7405             je 0x16f6                                
  16f1  b80100           mov ax, 1                                
  16f4  eb12             jmp 0x1708                               
  16f6  41               inc cx                                   
  16f7  8bc7             mov ax, di                               
  16f9  40               inc ax                                   
  16fa  3bc1             cmp ax, cx                               
  16fc  7dc5             jge 0x16c3                               
  16fe  42               inc dx                                   
  16ff  8bc6             mov ax, si                               
  1701  40               inc ax                                   
  1702  3bc2             cmp ax, dx                               
  1704  7db8             jge 0x16be                               
  1706  33c0             xor ax, ax                               
  1708  5f               pop di                                   
  1709  5e               pop si                                   
  170a  5d               pop bp                                   
  170b  cb               retf                                     

ovl29_170c:  ; ENTRY
  170c  55               push bp                                  
  170d  8bec             mov bp, sp                               
  170f  56               push si                                  
  1710  57               push di                                  
  1711  8b760a           mov si, word ptr [bp + 0xa]              
  1714  8b7e0c           mov di, word ptr [bp + 0xc]              
  1717  b8042c           mov ax, 0x2c04                           
  171a  8ec0             mov es, ax                               
  171c  268b1e1001       mov bx, word ptr es:[0x110]              
  1721  d1e3             shl bx, 1                                
  1723  b8042c           mov ax, 0x2c04                           
  1726  8ec0             mov es, ax                               
  1728  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  172e  753d             jne 0x176d                               
  1730  b8042c           mov ax, 0x2c04                           
  1733  8ec0             mov es, ax                               
  1735  2689367d01       mov word ptr es:[0x17d], si              
  173a  8ec0             mov es, ax                               
  173c  26893e7f01       mov word ptr es:[0x17f], di              
  1741  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1746  666801000f00     push 0xf0001                             
  174c  57               push di                                  
  174d  56               push si                                  
  174e  9a20007b07       lcall 0x77b, 0x20                        -> 077b:0020
  1753  83c408           add sp, 8                                
  1756  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  175b  666800000100     push 0x10000                             
  1761  66ff7606         push dword ptr [bp + 6]                  
  1765  9a3e00d12f       lcall 0x2fd1, 0x3e                       -> ovl23:0478
  176a  83c408           add sp, 8                                
  176d  5f               pop di                                   
  176e  5e               pop si                                   
  176f  5d               pop bp                                   
  1770  cb               retf                                     

ovl29_1771:  ; ENTRY
  1771  55               push bp                                  
  1772  8bec             mov bp, sp                               
  1774  83ec06           sub sp, 6                                
  1777  56               push si                                  
  1778  57               push di                                  
  1779  8b7606           mov si, word ptr [bp + 6]                
  177c  ff760a           push word ptr [bp + 0xa]                 
  177f  ff7608           push word ptr [bp + 8]                   
  1782  0e               push cs                                  
  1783  e83ffe           call 0x15c5                              
  1786  83c404           add sp, 4                                
  1789  8946fe           mov word ptr [bp - 2], ax                
  178c  c41e625e         les bx, ptr [0x5e62]                     
  1790  268b07           mov ax, word ptr es:[bx]                 
  1793  8946fc           mov word ptr [bp - 4], ax                
  1796  268b4702         mov ax, word ptr es:[bx + 2]             
  179a  8946fa           mov word ptr [bp - 6], ax                
  179d  8bde             mov bx, si                               
  179f  6bdb41           imul bx, bx, 0x41                        
  17a2  b8042c           mov ax, 0x2c04                           
  17a5  8ec0             mov es, ax                               
  17a7  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  17ac  98               cwde                                     
  17ad  8bc8             mov cx, ax                               
  17af  83f90f           cmp cx, 0xf                              
  17b2  7421             je 0x17d5                                
  17b4  c1e003           shl ax, 3                                
  17b7  ba042c           mov dx, 0x2c04                           
  17ba  8ec2             mov es, dx                               
  17bc  2603061001       add ax, word ptr es:[0x110]              
  17c1  ba042c           mov dx, 0x2c04                           
  17c4  8bd8             mov bx, ax                               
  17c6  8ec2             mov es, dx                               
  17c8  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  17cd  250300           and ax, 3                                
  17d0  3d0200           cmp ax, 2                                
  17d3  7505             jne 0x17da                               
  17d5  b80100           mov ax, 1                                
  17d8  eb02             jmp 0x17dc                               
  17da  33c0             xor ax, ax                               
  17dc  8bf8             mov di, ax                               
  17de  83f90f           cmp cx, 0xf                              
  17e1  7428             je 0x180b                                
  17e3  8bd9             mov bx, cx                               
  17e5  d1e3             shl bx, 1                                
  17e7  b8042c           mov ax, 0x2c04                           
  17ea  8ec0             mov es, ax                               
  17ec  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  17f2  7517             jne 0x180b                               
  17f4  66680400ffff     push 0xffff0004                          
  17fa  6a01             push 1                                   
  17fc  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1801  83c406           add sp, 6                                
  1804  0bc0             or ax, ax                                
  1806  7503             jne 0x180b                               
  1808  bf0100           mov di, 1                                
  180b  0bff             or di, di                                
  180d  740a             je 0x1819                                
  180f  837efe32         cmp word ptr [bp - 2], 0x32              
  1813  7e04             jle 0x1819                               
  1815  8bc6             mov ax, si                               
  1817  eb34             jmp 0x184d                               
  1819  ff36fa5d         push word ptr [0x5dfa]                   
  181d  ff36fc5d         push word ptr [0x5dfc]                   
  1821  ff76fa           push word ptr [bp - 6]                   
  1824  ff76fc           push word ptr [bp - 4]                   
  1827  6a0f             push 0xf                                 
  1829  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  182e  83c40a           add sp, 0xa                              
  1831  57               push di                                  
  1832  ff760a           push word ptr [bp + 0xa]                 
  1835  ff7608           push word ptr [bp + 8]                   
  1838  90               nop                                      
  1839  0e               push cs                                  
  183a  e84800           call 0x1885                              
  183d  83c406           add sp, 6                                
  1840  8bd0             mov dx, ax                               
  1842  83faff           cmp dx, -1                               
  1845  7504             jne 0x184b                               
  1847  8bc6             mov ax, si                               
  1849  eb02             jmp 0x184d                               
  184b  8bc2             mov ax, dx                               
  184d  5f               pop di                                   
  184e  5e               pop si                                   
  184f  c9               leave                                    
  1850  cb               retf                                     

ovl29_1851:  ; ENTRY
  1851  55               push bp                                  
  1852  8bec             mov bp, sp                               
  1854  56               push si                                  
  1855  57               push di                                  
  1856  c41e625e         les bx, ptr [0x5e62]                     
  185a  268b37           mov si, word ptr es:[bx]                 
  185d  268b7f02         mov di, word ptr es:[bx + 2]             
  1861  ff36fa5d         push word ptr [0x5dfa]                   
  1865  ff36fc5d         push word ptr [0x5dfc]                   
  1869  57               push di                                  
  186a  56               push si                                  
  186b  6a0f             push 0xf                                 
  186d  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  1872  83c40a           add sp, 0xa                              
  1875  6a01             push 1                                   
  1877  57               push di                                  
  1878  56               push si                                  
  1879  90               nop                                      
  187a  0e               push cs                                  
  187b  e80700           call 0x1885                              
  187e  83c406           add sp, 6                                
  1881  5f               pop di                                   
  1882  5e               pop si                                   
  1883  5d               pop bp                                   
  1884  cb               retf                                     

ovl29_1885:  ; ENTRY
  1885  55               push bp                                  
  1886  8bec             mov bp, sp                               
  1888  83ec08           sub sp, 8                                
  188b  56               push si                                  
  188c  57               push di                                  
  188d  9a0a1b5505       lcall 0x555, 0x1b0a                      -> 0555:1b0a
  1892  8956fe           mov word ptr [bp - 2], dx                
  1895  8946fc           mov word ptr [bp - 4], ax                
  1898  c746faffff       mov word ptr [bp - 6], 0xffff            
  189d  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  18a2  b8042c           mov ax, 0x2c04                           
  18a5  8ec0             mov es, ax                               
  18a7  268b3e7b15       mov di, word ptr es:[0x157b]             
  18ac  e98801           jmp 0x1a37                               
  18af  837e0a00         cmp word ptr [bp + 0xa], 0               
  18b3  741f             je 0x18d4                                
  18b5  8bdf             mov bx, di                               
  18b7  6bdb41           imul bx, bx, 0x41                        
  18ba  b8042c           mov ax, 0x2c04                           
  18bd  8ec0             mov es, ax                               
  18bf  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  18c4  98               cwde                                     
  18c5  ba042c           mov dx, 0x2c04                           
  18c8  8ec2             mov es, dx                               
  18ca  263b061001       cmp ax, word ptr es:[0x110]              
  18cf  7503             jne 0x18d4                               
  18d1  e96301           jmp 0x1a37                               
  18d4  8bdf             mov bx, di                               
  18d6  6bdb41           imul bx, bx, 0x41                        
  18d9  b8042c           mov ax, 0x2c04                           
  18dc  8ec0             mov es, ax                               
  18de  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  18e3  69dbe000         imul bx, bx, 0xe0                        
  18e7  8bf7             mov si, di                               
  18e9  6bf641           imul si, si, 0x41                        
  18ec  b8042c           mov ax, 0x2c04                           
  18ef  8ec0             mov es, ax                               
  18f1  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  18f6  d1e0             shl ax, 1                                
  18f8  03d8             add bx, ax                               
  18fa  b81d1e           mov ax, 0x1e1d                           
  18fd  8ec0             mov es, ax                               
  18ff  268a9f0000       mov bl, byte ptr es:[bx]                 
  1904  81e3ff00         and bx, 0xff                             
  1908  b8042c           mov ax, 0x2c04                           
  190b  8ec0             mov es, ax                               
  190d  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1913  7403             je 0x1918                                
  1915  e91f01           jmp 0x1a37                               
  1918  c41eee40         les bx, ptr [0x40ee]                     
  191c  26397f46         cmp word ptr es:[bx + 0x46], di          
  1920  7503             jne 0x1925                               
  1922  e91201           jmp 0x1a37                               
  1925  c41eee40         les bx, ptr [0x40ee]                     
  1929  03df             add bx, di                               
  192b  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  1931  7403             je 0x1936                                
  1933  e90101           jmp 0x1a37                               
  1936  8bdf             mov bx, di                               
  1938  6bdb41           imul bx, bx, 0x41                        
  193b  b8042c           mov ax, 0x2c04                           
  193e  8ec0             mov es, ax                               
  1940  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  1946  744a             je 0x1992                                
  1948  8bdf             mov bx, di                               
  194a  6bdb41           imul bx, bx, 0x41                        
  194d  8ec0             mov es, ax                               
  194f  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1954  98               cwde                                     
  1955  ba042c           mov dx, 0x2c04                           
  1958  8ec2             mov es, dx                               
  195a  263b061001       cmp ax, word ptr es:[0x110]              
  195f  7431             je 0x1992                                
  1961  8bdf             mov bx, di                               
  1963  6bdb41           imul bx, bx, 0x41                        
  1966  b8042c           mov ax, 0x2c04                           
  1969  8ec0             mov es, ax                               
  196b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1970  98               cwde                                     
  1971  c1e003           shl ax, 3                                
  1974  8ec2             mov es, dx                               
  1976  2603061001       add ax, word ptr es:[0x110]              
  197b  ba042c           mov dx, 0x2c04                           
  197e  8bd8             mov bx, ax                               
  1980  8ec2             mov es, dx                               
  1982  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1987  250300           and ax, 3                                
  198a  3d0200           cmp ax, 2                                
  198d  7403             je 0x1992                                
  198f  e9a500           jmp 0x1a37                               
  1992  6a00             push 0                                   
  1994  66ff76fc         push dword ptr [bp - 4]                  
  1998  16               push ss                                  
  1999  8d4608           lea ax, [bp + 8]                         
  199c  50               push ax                                  
  199d  16               push ss                                  
  199e  8d4606           lea ax, [bp + 6]                         
  19a1  50               push ax                                  
  19a2  57               push di                                  
  19a3  9a3900c52f       lcall 0x2fc5, 0x39                       -> ovl21:0a85
  19a8  83c410           add sp, 0x10                             
  19ab  8bf0             mov si, ax                               
  19ad  837e06ff         cmp word ptr [bp + 6], -1                
  19b1  7503             jne 0x19b6                               
  19b3  e98100           jmp 0x1a37                               
  19b6  8bdf             mov bx, di                               
  19b8  6bdb41           imul bx, bx, 0x41                        
  19bb  b8042c           mov ax, 0x2c04                           
  19be  8ec0             mov es, ax                               
  19c0  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  19c5  98               cwde                                     
  19c6  ba042c           mov dx, 0x2c04                           
  19c9  8ec2             mov es, dx                               
  19cb  263b061001       cmp ax, word ptr es:[0x110]              
  19d0  7508             jne 0x19da                               
  19d2  ba0f00           mov dx, 0xf                              
  19d5  83c614           add si, 0x14                             
  19d8  eb27             jmp 0x1a01                               
  19da  8bdf             mov bx, di                               
  19dc  6bdb41           imul bx, bx, 0x41                        
  19df  b8042c           mov ax, 0x2c04                           
  19e2  8ec0             mov es, ax                               
  19e4  26ffb77f15       push word ptr es:[bx + 0x157f]           
  19e9  8bdf             mov bx, di                               
  19eb  6bdb41           imul bx, bx, 0x41                        
  19ee  b8042c           mov ax, 0x2c04                           
  19f1  8ec0             mov es, ax                               
  19f3  26ffb77d15       push word ptr es:[bx + 0x157d]           
  19f8  0e               push cs                                  
  19f9  e8c9fb           call 0x15c5                              
  19fc  83c404           add sp, 4                                
  19ff  8bd0             mov dx, ax                               
  1a01  83fa32           cmp dx, 0x32                             
  1a04  7e14             jle 0x1a1a                               
  1a06  3b36005e         cmp si, word ptr [0x5e00]                
  1a0a  7d0e             jge 0x1a1a                               
  1a0c  8bc2             mov ax, dx                               
  1a0e  6bc00a           imul ax, ax, 0xa                         
  1a11  bb9001           mov bx, 0x190                            
  1a14  2bde             sub bx, si                               
  1a16  03d8             add bx, ax                               
  1a18  eb12             jmp 0x1a2c                               
  1a1a  83fa0a           cmp dx, 0xa                              
  1a1d  7e0a             jle 0x1a29                               
  1a1f  8bc2             mov ax, dx                               
  1a21  6bc005           imul ax, ax, 5                           
  1a24  bb6400           mov bx, 0x64                             
  1a27  ebeb             jmp 0x1a14                               
  1a29  bbfeff           mov bx, 0xfffe                           
  1a2c  3b5ef8           cmp bx, word ptr [bp - 8]                
  1a2f  7e06             jle 0x1a37                               
  1a31  895ef8           mov word ptr [bp - 8], bx                
  1a34  897efa           mov word ptr [bp - 6], di                
  1a37  8bc7             mov ax, di                               
  1a39  4f               dec di                                   
  1a3a  0bc0             or ax, ax                                
  1a3c  7403             je 0x1a41                                
  1a3e  e96efe           jmp 0x18af                               
  1a41  9a2e1b5505       lcall 0x555, 0x1b2e                      -> 0555:1b2e
  1a46  8b46fa           mov ax, word ptr [bp - 6]                
  1a49  5f               pop di                                   
  1a4a  5e               pop si                                   
  1a4b  c9               leave                                    
  1a4c  cb               retf                                     

ovl29_1a4d:  ; ENTRY
  1a4d  55               push bp                                  
  1a4e  8bec             mov bp, sp                               
  1a50  83ec02           sub sp, 2                                
  1a53  56               push si                                  
  1a54  8b7606           mov si, word ptr [bp + 6]                
  1a57  6668ffff0100     push 0x1ffff                             
  1a5d  6a03             push 3                                   
  1a5f  56               push si                                  
  1a60  0e               push cs                                  
  1a61  e8d9f5           call 0x103d                              
  1a64  83c408           add sp, 8                                
  1a67  8946fe           mov word ptr [bp - 2], ax                
  1a6a  3dffff           cmp ax, 0xffff                           
  1a6d  7504             jne 0x1a73                               
  1a6f  33c0             xor ax, ax                               
  1a71  eb73             jmp 0x1ae6                               
  1a73  ff76fe           push word ptr [bp - 2]                   
  1a76  56               push si                                  
  1a77  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  1a7c  83c404           add sp, 4                                
  1a7f  c45e08           les bx, ptr [bp + 8]                     
  1a82  268907           mov word ptr es:[bx], ax                 
  1a85  8bc6             mov ax, si                               
  1a87  6bc041           imul ax, ax, 0x41                        
  1a8a  260307           add ax, word ptr es:[bx]                 
  1a8d  ba042c           mov dx, 0x2c04                           
  1a90  8bd8             mov bx, ax                               
  1a92  8ec2             mov es, dx                               
  1a94  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  1a99  98               cwde                                     
  1a9a  8bc8             mov cx, ax                               
  1a9c  8bc6             mov ax, si                               
  1a9e  6bc041           imul ax, ax, 0x41                        
  1aa1  c45e08           les bx, ptr [bp + 8]                     
  1aa4  260307           add ax, word ptr es:[bx]                 
  1aa7  ba042c           mov dx, 0x2c04                           
  1aaa  8bd8             mov bx, ax                               
  1aac  8ec2             mov es, dx                               
  1aae  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1ab3  98               cwde                                     
  1ab4  6bc006           imul ax, ax, 6                           
  1ab7  8bd8             mov bx, ax                               
  1ab9  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  1abe  7503             jne 0x1ac3                               
  1ac0  83c102           add cx, 2                                
  1ac3  c41eee40         les bx, ptr [0x40ee]                     
  1ac7  26837f020b       cmp word ptr es:[bx + 2], 0xb            
  1acc  7e05             jle 0x1ad3                               
  1ace  83f903           cmp cx, 3                                
  1ad1  7c9c             jl 0x1a6f                                
  1ad3  c41eee40         les bx, ptr [0x40ee]                     
  1ad7  26837f0207       cmp word ptr es:[bx + 2], 7              
  1adc  7e05             jle 0x1ae3                               
  1ade  83f902           cmp cx, 2                                
  1ae1  7c8c             jl 0x1a6f                                
  1ae3  b80100           mov ax, 1                                
  1ae6  5e               pop si                                   
  1ae7  c9               leave                                    
  1ae8  cb               retf                                     

ovl29_1ae9:  ; ENTRY
  1ae9  55               push bp                                  
  1aea  8bec             mov bp, sp                               
  1aec  83ec04           sub sp, 4                                
  1aef  56               push si                                  
  1af0  57               push di                                  
  1af1  8b7e06           mov di, word ptr [bp + 6]                
  1af4  beffff           mov si, 0xffff                           
  1af7  c746feffff       mov word ptr [bp - 2], 0xffff            
  1afc  c746fc0a00       mov word ptr [bp - 4], 0xa               
  1b01  33d2             xor dx, dx                               
  1b03  eb59             jmp 0x1b5e                               
  1b05  8bdf             mov bx, di                               
  1b07  6bdb41           imul bx, bx, 0x41                        
  1b0a  03da             add bx, dx                               
  1b0c  b8042c           mov ax, 0x2c04                           
  1b0f  8ec0             mov es, ax                               
  1b11  2680bf9315ff     cmp byte ptr es:[bx + 0x1593], 0xff      
  1b17  7504             jne 0x1b1d                               
  1b19  8bf2             mov si, dx                               
  1b1b  eb46             jmp 0x1b63                               
  1b1d  8bdf             mov bx, di                               
  1b1f  6bdb41           imul bx, bx, 0x41                        
  1b22  03da             add bx, dx                               
  1b24  b8042c           mov ax, 0x2c04                           
  1b27  8ec0             mov es, ax                               
  1b29  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  1b2e  98               cwde                                     
  1b2f  8bc8             mov cx, ax                               
  1b31  8bdf             mov bx, di                               
  1b33  6bdb41           imul bx, bx, 0x41                        
  1b36  03da             add bx, dx                               
  1b38  b8042c           mov ax, 0x2c04                           
  1b3b  8ec0             mov es, ax                               
  1b3d  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1b42  98               cwde                                     
  1b43  6bc006           imul ax, ax, 6                           
  1b46  8bd8             mov bx, ax                               
  1b48  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  1b4d  7503             jne 0x1b52                               
  1b4f  83c102           add cx, 2                                
  1b52  3b4efc           cmp cx, word ptr [bp - 4]                
  1b55  7d06             jge 0x1b5d                               
  1b57  8956fe           mov word ptr [bp - 2], dx                
  1b5a  894efc           mov word ptr [bp - 4], cx                
  1b5d  42               inc dx                                   
  1b5e  83fa04           cmp dx, 4                                
  1b61  7ca2             jl 0x1b05                                
  1b63  83feff           cmp si, -1                               
  1b66  7503             jne 0x1b6b                               
  1b68  8b76fe           mov si, word ptr [bp - 2]                
  1b6b  8bc6             mov ax, si                               
  1b6d  5f               pop di                                   
  1b6e  5e               pop si                                   
  1b6f  c9               leave                                    
  1b70  cb               retf                                     
