; ovl68 stub 3120 file_off 0x83960 size 0xd8c

ovl68_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec52           sub sp, 0x52                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7606           mov si, word ptr [bp + 6]                
  000b  33c9             xor cx, cx                               
  000d  bf0100           mov di, 1                                
  0010  c746fe0000       mov word ptr [bp - 2], 0                 
  0015  8bde             mov bx, si                               
  0017  d1e3             shl bx, 1                                
  0019  b8042c           mov ax, 0x2c04                           
  001c  8ec0             mov es, ax                               
  001e  268b874701       mov ax, word ptr es:[bx + 0x147]         
  0023  ba042c           mov dx, 0x2c04                           
  0026  8ec2             mov es, dx                               
  0028  26a35901         mov word ptr es:[0x159], ax              
  002c  33d2             xor dx, dx                               
  002e  eb26             jmp 0x56                                 
  0030  8bda             mov bx, dx                               
  0032  d1e3             shl bx, 1                                
  0034  b8042c           mov ax, 0x2c04                           
  0037  8ec0             mov es, ax                               
  0039  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  003f  7414             je 0x55                                  
  0041  8bda             mov bx, dx                               
  0043  d1e3             shl bx, 1                                
  0045  b8042c           mov ax, 0x2c04                           
  0048  8ec0             mov es, ax                               
  004a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0050  7503             jne 0x55                                 
  0052  41               inc cx                                   
  0053  33ff             xor di, di                               
  0055  42               inc dx                                   
  0056  83fa08           cmp dx, 8                                
  0059  7cd5             jl 0x30                                  
  005b  83f901           cmp cx, 1                                
  005e  7512             jne 0x72                                 
  0060  b8042c           mov ax, 0x2c04                           
  0063  8ec0             mov es, ax                               
  0065  26833e240100     cmp word ptr es:[0x124], 0               
  006b  7405             je 0x72                                  
  006d  b80100           mov ax, 1                                
  0070  eb02             jmp 0x74                                 
  0072  33c0             xor ax, ax                               
  0074  a35432           mov word ptr [0x3254], ax                
  0077  0bff             or di, di                                
  0079  740c             je 0x87                                  
  007b  b8042c           mov ax, 0x2c04                           
  007e  8ec0             mov es, ax                               
  0080  26c70659010100   mov word ptr es:[0x159], 1               
  0087  83f901           cmp cx, 1                                
  008a  7e2a             jle 0xb6                                 
  008c  b8042c           mov ax, 0x2c04                           
  008f  8ec0             mov es, ax                               
  0091  26833e240100     cmp word ptr es:[0x124], 0               
  0097  741d             je 0xb6                                  
  0099  8bde             mov bx, si                               
  009b  d1e3             shl bx, 1                                
  009d  b8042c           mov ax, 0x2c04                           
  00a0  8ec0             mov es, ax                               
  00a2  2683bf470100     cmp word ptr es:[bx + 0x147], 0          
  00a8  750c             jne 0xb6                                 
  00aa  b8042c           mov ax, 0x2c04                           
  00ad  8ec0             mov es, ax                               
  00af  26c70659010000   mov word ptr es:[0x159], 0               
  00b6  b8042c           mov ax, 0x2c04                           
  00b9  8ec0             mov es, ax                               
  00bb  26833e240100     cmp word ptr es:[0x124], 0               
  00c1  742e             je 0xf1                                  
  00c3  c746fe0100       mov word ptr [bp - 2], 1                 
  00c8  9a7f00f930       lcall 0x30f9, 0x7f                       -> ovl64:0d39
  00cd  9a9800f930       lcall 0x30f9, 0x98                       -> ovl64:1558
  00d2  0bff             or di, di                                
  00d4  7514             jne 0xea                                 
  00d6  b8042c           mov ax, 0x2c04                           
  00d9  8ec0             mov es, ax                               
  00db  26833e590100     cmp word ptr es:[0x159], 0               
  00e1  740e             je 0xf1                                  
  00e3  833e543200       cmp word ptr [0x3254], 0                 
  00e8  7507             jne 0xf1                                 
  00ea  56               push si                                  
  00eb  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  00f0  59               pop cx                                   
  00f1  0bff             or di, di                                
  00f3  7514             jne 0x109                                
  00f5  b8042c           mov ax, 0x2c04                           
  00f8  8ec0             mov es, ax                               
  00fa  26833e590100     cmp word ptr es:[0x159], 0               
  0100  7418             je 0x11a                                 
  0102  833e543200       cmp word ptr [0x3254], 0                 
  0107  7511             jne 0x11a                                
  0109  666a00           push 0                                   
  010c  666801000100     push 0x10001                             
  0112  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0117  83c408           add sp, 8                                
  011a  8bc6             mov ax, si                               
  011c  6bc014           imul ax, ax, 0x14                        
  011f  050000           add ax, 0                                
  0122  68042c           push 0x2c04                              
  0125  50               push ax                                  
  0126  1e               push ds                                  
  0127  686032           push 0x3260                              
  012a  16               push ss                                  
  012b  8d46ae           lea ax, [bp - 0x52]                      
  012e  50               push ax                                  
  012f  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0134  83c40c           add sp, 0xc                              
  0137  6a00             push 0                                   
  0139  16               push ss                                  
  013a  8d46ae           lea ax, [bp - 0x52]                      
  013d  50               push ax                                  
  013e  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  0143  83c406           add sp, 6                                
  0146  9ade00d730       lcall 0x30d7, 0xde                       -> ovl61:1291
  014b  6a05             push 5                                   
  014d  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0152  59               pop cx                                   
  0153  9a4d00542f       lcall 0x2f54, 0x4d                       -> ovl00:0db3
  0158  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  015d  8bde             mov bx, si                               
  015f  d1e3             shl bx, 1                                
  0161  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  0166  7f33             jg 0x19b                                 
  0168  666a00           push 0                                   
  016b  90               nop                                      
  016c  0e               push cs                                  
  016d  e8e207           call 0x952                               
  0170  83c404           add sp, 4                                
  0173  9ade00d730       lcall 0x30d7, 0xde                       -> ovl61:1291
  0178  6a19             push 0x19                                
  017a  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  017f  59               pop cx                                   
  0180  6a32             push 0x32                                
  0182  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0187  59               pop cx                                   
  0188  6a4b             push 0x4b                                
  018a  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  018f  59               pop cx                                   
  0190  6a64             push 0x64                                
  0192  9ae300d730       lcall 0x30d7, 0xe3                       -> ovl61:131b
  0197  59               pop cx                                   
  0198  e98d00           jmp 0x228                                
  019b  9a20007330       lcall 0x3073, 0x20                       -> ovl47:0000
  01a0  0bc0             or ax, ax                                
  01a2  7405             je 0x1a9                                 
  01a4  9a2a007330       lcall 0x3073, 0x2a                       -> ovl47:0301
  01a9  9a66007330       lcall 0x3073, 0x66                       -> ovl47:0579
  01ae  90               nop                                      
  01af  0e               push cs                                  
  01b0  e87406           call 0x827                               
  01b3  9a25005130       lcall 0x3051, 0x25                       -> ovl43:0000
  01b8  9a850d620b       lcall 0xb62, 0xd85                       -> 0b62:0d85
  01bd  90               nop                                      
  01be  0e               push cs                                  
  01bf  e83904           call 0x5fb                               
  01c2  9a20001931       lcall 0x3119, 0x20                       -> ovl67:0000
  01c7  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  01cc  9a25001931       lcall 0x3119, 0x25                       -> ovl67:0113
  01d1  666a00           push 0                                   
  01d4  666a00           push 0                                   
  01d7  6aff             push -1                                  
  01d9  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  01de  83c40a           add sp, 0xa                              
  01e1  6a01             push 1                                   
  01e3  9a2500db2f       lcall 0x2fdb, 0x25                       -> ovl25:0000
  01e8  59               pop cx                                   
  01e9  ba0800           mov dx, 8                                
  01ec  eb11             jmp 0x1ff                                
  01ee  8bda             mov bx, dx                               
  01f0  c1e302           shl bx, 2                                
  01f3  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  01f9  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  01ff  8bc2             mov ax, dx                               
  0201  4a               dec dx                                   
  0202  0bc0             or ax, ax                                
  0204  75e8             jne 0x1ee                                
  0206  66c706625e000000 mov dword ptr [0x5e62], 0                
  020f  66c7065e5e000000 mov dword ptr [0x5e5e], 0                
  0218  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  021d  837efe00         cmp word ptr [bp - 2], 0                 
  0221  7405             je 0x228                                 
  0223  9a8400f930       lcall 0x30f9, 0x84                       -> ovl64:0e68
  0228  5f               pop di                                   
  0229  5e               pop si                                   
  022a  c9               leave                                    
  022b  cb               retf                                     

ovl68_022c:  ; ENTRY
  022c  55               push bp                                  
  022d  8bec             mov bp, sp                               
  022f  9a25005130       lcall 0x3051, 0x25                       -> ovl43:0000
  0234  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0239  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  023e  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  0243  9a850d620b       lcall 0xb62, 0xd85                       -> 0b62:0d85
  0248  90               nop                                      
  0249  0e               push cs                                  
  024a  e8ae03           call 0x5fb                               
  024d  90               nop                                      
  024e  0e               push cs                                  
  024f  e8d505           call 0x827                               
  0252  9a25001931       lcall 0x3119, 0x25                       -> ovl67:0113
  0257  5d               pop bp                                   
  0258  cb               retf                                     

ovl68_0259:  ; ENTRY
  0259  55               push bp                                  
  025a  8bec             mov bp, sp                               
  025c  83ec32           sub sp, 0x32                             
  025f  56               push si                                  
  0260  57               push di                                  
  0261  8b7606           mov si, word ptr [bp + 6]                
  0264  bf0100           mov di, 1                                
  0267  c70654320000     mov word ptr [0x3254], 0                 
  026d  833ea61600       cmp word ptr [0x16a6], 0                 
  0272  7431             je 0x2a5                                 
  0274  c706a6160000     mov word ptr [0x16a6], 0                 
  027a  33d2             xor dx, dx                               
  027c  eb22             jmp 0x2a0                                
  027e  8bda             mov bx, dx                               
  0280  d1e3             shl bx, 1                                
  0282  b8042c           mov ax, 0x2c04                           
  0285  8ec0             mov es, ax                               
  0287  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  028d  7410             je 0x29f                                 
  028f  8bda             mov bx, dx                               
  0291  d1e3             shl bx, 1                                
  0293  b8042c           mov ax, 0x2c04                           
  0296  8ec0             mov es, ax                               
  0298  26c78747010100   mov word ptr es:[bx + 0x147], 1          
  029f  42               inc dx                                   
  02a0  83fa08           cmp dx, 8                                
  02a3  7cd9             jl 0x27e                                 
  02a5  33c9             xor cx, cx                               
  02a7  33d2             xor dx, dx                               
  02a9  eb24             jmp 0x2cf                                
  02ab  8bda             mov bx, dx                               
  02ad  d1e3             shl bx, 1                                
  02af  b8042c           mov ax, 0x2c04                           
  02b2  8ec0             mov es, ax                               
  02b4  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02ba  7412             je 0x2ce                                 
  02bc  8bda             mov bx, dx                               
  02be  d1e3             shl bx, 1                                
  02c0  b8042c           mov ax, 0x2c04                           
  02c3  8ec0             mov es, ax                               
  02c5  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  02cb  7501             jne 0x2ce                                
  02cd  41               inc cx                                   
  02ce  42               inc dx                                   
  02cf  83fa08           cmp dx, 8                                
  02d2  7cd7             jl 0x2ab                                 
  02d4  83f901           cmp cx, 1                                
  02d7  7e0f             jle 0x2e8                                
  02d9  b8042c           mov ax, 0x2c04                           
  02dc  8ec0             mov es, ax                               
  02de  26833e240100     cmp word ptr es:[0x124], 0               
  02e4  7402             je 0x2e8                                 
  02e6  33ff             xor di, di                               
  02e8  b8042c           mov ax, 0x2c04                           
  02eb  8ec0             mov es, ax                               
  02ed  26c70659010100   mov word ptr es:[0x159], 1               
  02f4  9a4d00542f       lcall 0x2f54, 0x4d                       -> ovl00:0db3
  02f9  9a7f00f930       lcall 0x30f9, 0x7f                       -> ovl64:0d39
  02fe  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0303  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  0308  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  030d  b8042c           mov ax, 0x2c04                           
  0310  8ec0             mov es, ax                               
  0312  26833e240100     cmp word ptr es:[0x124], 0               
  0318  7405             je 0x31f                                 
  031a  9a9800f930       lcall 0x30f9, 0x98                       -> ovl64:1558
  031f  b8042c           mov ax, 0x2c04                           
  0322  8ec0             mov es, ax                               
  0324  26833e240100     cmp word ptr es:[0x124], 0               
  032a  7407             je 0x333                                 
  032c  56               push si                                  
  032d  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  0332  59               pop cx                                   
  0333  89365e32         mov word ptr [0x325e], si                
  0337  0bff             or di, di                                
  0339  7411             je 0x34c                                 
  033b  666a00           push 0                                   
  033e  666801000100     push 0x10001                             
  0344  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0349  83c408           add sp, 8                                
  034c  9a7000d730       lcall 0x30d7, 0x70                       -> ovl61:0aeb
  0351  9a850d620b       lcall 0xb62, 0xd85                       -> 0b62:0d85
  0356  90               nop                                      
  0357  0e               push cs                                  
  0358  e8a002           call 0x5fb                               
  035b  9a20001931       lcall 0x3119, 0x20                       -> ovl67:0000
  0360  90               nop                                      
  0361  0e               push cs                                  
  0362  e8c204           call 0x827                               
  0365  9a25001931       lcall 0x3119, 0x25                       -> ovl67:0113
  036a  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  036f  666a00           push 0                                   
  0372  90               nop                                      
  0373  0e               push cs                                  
  0374  e8db05           call 0x952                               
  0377  83c404           add sp, 4                                
  037a  0bff             or di, di                                
  037c  742b             je 0x3a9                                 
  037e  8bde             mov bx, si                               
  0380  6bdb14           imul bx, bx, 0x14                        
  0383  b8042c           mov ax, 0x2c04                           
  0386  8ec0             mov es, ax                               
  0388  26ffb78b01       push word ptr es:[bx + 0x18b]            
  038d  8bde             mov bx, si                               
  038f  6bdb14           imul bx, bx, 0x14                        
  0392  b8042c           mov ax, 0x2c04                           
  0395  8ec0             mov es, ax                               
  0397  26ffb78901       push word ptr es:[bx + 0x189]            
  039c  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  03a1  83c404           add sp, 4                                
  03a4  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  03a9  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  03ae  6a06             push 6                                   
  03b0  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  03b5  59               pop cx                                   
  03b6  666800000300     push 0x30000                             
  03bc  666801000f00     push 0xf0001                             
  03c2  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  03c7  83c408           add sp, 8                                
  03ca  b8042c           mov ax, 0x2c04                           
  03cd  8ec0             mov es, ax                               
  03cf  26a11001         mov ax, word ptr es:[0x110]              
  03d3  6bc014           imul ax, ax, 0x14                        
  03d6  050000           add ax, 0                                
  03d9  68042c           push 0x2c04                              
  03dc  50               push ax                                  
  03dd  666840015500     push 0x550140                            
  03e3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  03e8  83c408           add sp, 8                                
  03eb  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  03f0  50               push ax                                  
  03f1  1e               push ds                                  
  03f2  686332           push 0x3263                               ; "Turn %d"
  03f5  16               push ss                                  
  03f6  8d46ce           lea ax, [bp - 0x32]                      
  03f9  50               push ax                                  
  03fa  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03ff  83c40a           add sp, 0xa                              
  0402  16               push ss                                  
  0403  8d46ce           lea ax, [bp - 0x32]                      
  0406  50               push ax                                  
  0407  666840018200     push 0x820140                            
  040d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0412  83c408           add sp, 8                                
  0415  9a4300ba30       lcall 0x30ba, 0x43                       -> ovl58:0b93
  041a  9a6100c130       lcall 0x30c1, 0x61                       -> ovl59:01f1
  041f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0424  c7066a160100     mov word ptr [0x166a], 1                 
  042a  9a2000c130       lcall 0x30c1, 0x20                       -> ovl59:0142
  042f  c7066a160000     mov word ptr [0x166a], 0                 
  0435  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  043a  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  043f  9a36075e15       lcall 0x155e, 0x736                      -> 155e:0736
  0444  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0449  0bff             or di, di                                
  044b  7537             jne 0x484                                
  044d  666a00           push 0                                   
  0450  666801000100     push 0x10001                             
  0456  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  045b  83c408           add sp, 8                                
  045e  8bde             mov bx, si                               
  0460  6bdb14           imul bx, bx, 0x14                        
  0463  b8042c           mov ax, 0x2c04                           
  0466  8ec0             mov es, ax                               
  0468  26ffb78b01       push word ptr es:[bx + 0x18b]            
  046d  8bde             mov bx, si                               
  046f  6bdb14           imul bx, bx, 0x14                        
  0472  b8042c           mov ax, 0x2c04                           
  0475  8ec0             mov es, ax                               
  0477  26ffb78901       push word ptr es:[bx + 0x189]            
  047c  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  0481  83c404           add sp, 4                                
  0484  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0489  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  048e  666aff           push -1                                  
  0491  9aa00e620b       lcall 0xb62, 0xea0                       -> 0b62:0ea0
  0496  83c404           add sp, 4                                
  0499  666a00           push 0                                   
  049c  666a00           push 0                                   
  049f  6aff             push -1                                  
  04a1  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  04a6  83c40a           add sp, 0xa                              
  04a9  6a05             push 5                                   
  04ab  9a6100ba30       lcall 0x30ba, 0x61                       -> ovl58:026f
  04b0  59               pop cx                                   
  04b1  6a00             push 0                                   
  04b3  90               nop                                      
  04b4  0e               push cs                                  
  04b5  e80500           call 0x4bd                               
  04b8  59               pop cx                                   
  04b9  5f               pop di                                   
  04ba  5e               pop si                                   
  04bb  c9               leave                                    
  04bc  cb               retf                                     

ovl68_04bd:  ; ENTRY
  04bd  55               push bp                                  
  04be  8bec             mov bp, sp                               
  04c0  56               push si                                  
  04c1  57               push di                                  
  04c2  8b7606           mov si, word ptr [bp + 6]                
  04c5  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  04ca  8bf8             mov di, ax                               
  04cc  b8042c           mov ax, 0x2c04                           
  04cf  8ec0             mov es, ax                               
  04d1  26833e5b0100     cmp word ptr es:[0x15b], 0               
  04d7  7412             je 0x4eb                                 
  04d9  8ec0             mov es, ax                               
  04db  26833e570100     cmp word ptr es:[0x157], 0               
  04e1  7508             jne 0x4eb                                
  04e3  9acf00d730       lcall 0x30d7, 0xcf                       -> ovl61:1fbd
  04e8  e90c01           jmp 0x5f7                                
  04eb  b8042c           mov ax, 0x2c04                           
  04ee  8ec0             mov es, ax                               
  04f0  26833e5d0100     cmp word ptr es:[0x15d], 0               
  04f6  7412             je 0x50a                                 
  04f8  8ec0             mov es, ax                               
  04fa  26833e5f0100     cmp word ptr es:[0x15f], 0               
  0500  7508             jne 0x50a                                
  0502  9aa200d730       lcall 0x30d7, 0xa2                       -> ovl61:1f68
  0507  e9ed00           jmp 0x5f7                                
  050a  0bf6             or si, si                                
  050c  7f40             jg 0x54e                                 
  050e  9a66007330       lcall 0x3073, 0x66                       -> ovl47:0579
  0513  9a20007330       lcall 0x3073, 0x20                       -> ovl47:0000
  0518  0bc0             or ax, ax                                
  051a  741d             je 0x539                                 
  051c  b8042c           mov ax, 0x2c04                           
  051f  8ec0             mov es, ax                               
  0521  26833e5b0100     cmp word ptr es:[0x15b], 0               
  0527  7508             jne 0x531                                
  0529  6a04             push 4                                   
  052b  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0530  59               pop cx                                   
  0531  9a25007330       lcall 0x3073, 0x25                       -> ovl47:0d5c
  0536  e9be00           jmp 0x5f7                                
  0539  b8042c           mov ax, 0x2c04                           
  053c  8ec0             mov es, ax                               
  053e  26833e5b0100     cmp word ptr es:[0x15b], 0               
  0544  7508             jne 0x54e                                
  0546  6a01             push 1                                   
  0548  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  054d  59               pop cx                                   
  054e  83fe01           cmp si, 1                                
  0551  7f3f             jg 0x592                                 
  0553  83ff01           cmp di, 1                                
  0556  753a             jne 0x592                                
  0558  b8042c           mov ax, 0x2c04                           
  055b  8ec0             mov es, ax                               
  055d  268b1e1001       mov bx, word ptr es:[0x110]              
  0562  6bdb14           imul bx, bx, 0x14                        
  0565  b8042c           mov ax, 0x2c04                           
  0568  8ec0             mov es, ax                               
  056a  26ffb78b01       push word ptr es:[bx + 0x18b]            
  056f  b8042c           mov ax, 0x2c04                           
  0572  8ec0             mov es, ax                               
  0574  268b1e1001       mov bx, word ptr es:[0x110]              
  0579  6bdb14           imul bx, bx, 0x14                        
  057c  b8042c           mov ax, 0x2c04                           
  057f  8ec0             mov es, ax                               
  0581  26ffb78901       push word ptr es:[bx + 0x189]            
  0586  6a02             push 2                                   
  0588  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  058d  83c406           add sp, 6                                
  0590  eb65             jmp 0x5f7                                
  0592  83fe02           cmp si, 2                                
  0595  7f0e             jg 0x5a5                                 
  0597  9a25005130       lcall 0x3051, 0x25                       -> ovl43:0000
  059c  0bc0             or ax, ax                                
  059e  7405             je 0x5a5                                 
  05a0  9a34005130       lcall 0x3051, 0x34                       -> ovl43:06bd
  05a5  83fe03           cmp si, 3                                
  05a8  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  05ad  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  05b2  b8042c           mov ax, 0x2c04                           
  05b5  8ec0             mov es, ax                               
  05b7  26833e2e0100     cmp word ptr es:[0x12e], 0               
  05bd  7438             je 0x5f7                                 
  05bf  83ff02           cmp di, 2                                
  05c2  7533             jne 0x5f7                                
  05c4  8ec0             mov es, ax                               
  05c6  26a03401         mov al, byte ptr es:[0x134]              
  05ca  c1e806           shr ax, 6                                
  05cd  250100           and ax, 1                                
  05d0  0bc0             or ax, ax                                
  05d2  7523             jne 0x5f7                                
  05d4  b8042c           mov ax, 0x2c04                           
  05d7  8ec0             mov es, ax                               
  05d9  26800e340140     or byte ptr es:[0x134], 0x40             
  05df  666819000700     push 0x70019                             
  05e5  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  05ea  83c404           add sp, 4                                
  05ed  52               push dx                                  
  05ee  50               push ax                                  
  05ef  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  05f4  83c404           add sp, 4                                
  05f7  5f               pop di                                   
  05f8  5e               pop si                                   
  05f9  5d               pop bp                                   
  05fa  cb               retf                                     

ovl68_05fb:  ; ENTRY
  05fb  55               push bp                                  
  05fc  8bec             mov bp, sp                               
  05fe  83ec02           sub sp, 2                                
  0601  56               push si                                  
  0602  b8042c           mov ax, 0x2c04                           
  0605  8ec0             mov es, ax                               
  0607  268b368101       mov si, word ptr es:[0x181]              
  060c  e90501           jmp 0x714                                
  060f  8bde             mov bx, si                               
  0611  6bdb16           imul bx, bx, 0x16                        
  0614  b81d1e           mov ax, 0x1e1d                           
  0617  8ec0             mov es, ax                               
  0619  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  061e  98               cwde                                     
  061f  ba042c           mov dx, 0x2c04                           
  0622  8ec2             mov es, dx                               
  0624  263b061001       cmp ax, word ptr es:[0x110]              
  0629  7403             je 0x62e                                 
  062b  e9e600           jmp 0x714                                
  062e  8bde             mov bx, si                               
  0630  6bdb16           imul bx, bx, 0x16                        
  0633  b81d1e           mov ax, 0x1e1d                           
  0636  8ec0             mov es, ax                               
  0638  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  063e  7d03             jge 0x643                                
  0640  e9d100           jmp 0x714                                
  0643  8bde             mov bx, si                               
  0645  6bdb16           imul bx, bx, 0x16                        
  0648  b81d1e           mov ax, 0x1e1d                           
  064b  8ec0             mov es, ax                               
  064d  2680bf878802     cmp byte ptr es:[bx - 0x7779], 2         
  0653  7e05             jle 0x65a                                
  0655  b80200           mov ax, 2                                
  0658  eb10             jmp 0x66a                                
  065a  8bde             mov bx, si                               
  065c  6bdb16           imul bx, bx, 0x16                        
  065f  b81d1e           mov ax, 0x1e1d                           
  0662  8ec0             mov es, ax                               
  0664  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  0669  98               cwde                                     
  066a  8bc8             mov cx, ax                               
  066c  8bde             mov bx, si                               
  066e  6bdb16           imul bx, bx, 0x16                        
  0671  b81d1e           mov ax, 0x1e1d                           
  0674  8ec0             mov es, ax                               
  0676  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  067d  7416             je 0x695                                 
  067f  8bde             mov bx, si                               
  0681  6bdb16           imul bx, bx, 0x16                        
  0684  b81d1e           mov ax, 0x1e1d                           
  0687  8ad1             mov dl, cl                               
  0689  80c214           add dl, 0x14                             
  068c  8ec0             mov es, ax                               
  068e  2688978788       mov byte ptr es:[bx - 0x7779], dl        
  0693  eb20             jmp 0x6b5                                
  0695  8bde             mov bx, si                               
  0697  6bdb16           imul bx, bx, 0x16                        
  069a  b81d1e           mov ax, 0x1e1d                           
  069d  8ec0             mov es, ax                               
  069f  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  06a4  02c1             add al, cl                               
  06a6  8bde             mov bx, si                               
  06a8  6bdb16           imul bx, bx, 0x16                        
  06ab  ba1d1e           mov dx, 0x1e1d                           
  06ae  8ec2             mov es, dx                               
  06b0  2688878788       mov byte ptr es:[bx - 0x7779], al        
  06b5  8bde             mov bx, si                               
  06b7  6bdb16           imul bx, bx, 0x16                        
  06ba  b81d1e           mov ax, 0x1e1d                           
  06bd  8ec0             mov es, ax                               
  06bf  268b879288       mov ax, word ptr es:[bx - 0x776e]        
  06c4  8bde             mov bx, si                               
  06c6  6bdb16           imul bx, bx, 0x16                        
  06c9  ba1d1e           mov dx, 0x1e1d                           
  06cc  8ec2             mov es, dx                               
  06ce  263b878088       cmp ax, word ptr es:[bx - 0x7780]        
  06d3  753f             jne 0x714                                
  06d5  8bde             mov bx, si                               
  06d7  6bdb16           imul bx, bx, 0x16                        
  06da  b81d1e           mov ax, 0x1e1d                           
  06dd  8ec0             mov es, ax                               
  06df  268b879488       mov ax, word ptr es:[bx - 0x776c]        
  06e4  8bde             mov bx, si                               
  06e6  6bdb16           imul bx, bx, 0x16                        
  06e9  ba1d1e           mov dx, 0x1e1d                           
  06ec  8ec2             mov es, dx                               
  06ee  263b878288       cmp ax, word ptr es:[bx - 0x777e]        
  06f3  751f             jne 0x714                                
  06f5  8bde             mov bx, si                               
  06f7  6bdb16           imul bx, bx, 0x16                        
  06fa  b81d1e           mov ax, 0x1e1d                           
  06fd  8ec0             mov es, ax                               
  06ff  26c7879288ffff   mov word ptr es:[bx - 0x776e], 0xffff    
  0706  8bde             mov bx, si                               
  0708  6bdb16           imul bx, bx, 0x16                        
  070b  8ec0             mov es, ax                               
  070d  26c7879488ffff   mov word ptr es:[bx - 0x776c], 0xffff    
  0714  8bc6             mov ax, si                               
  0716  4e               dec si                                   
  0717  0bc0             or ax, ax                                
  0719  7403             je 0x71e                                 
  071b  e9f1fe           jmp 0x60f                                
  071e  b8042c           mov ax, 0x2c04                           
  0721  8ec0             mov es, ax                               
  0723  268b368101       mov si, word ptr es:[0x181]              
  0728  e99e00           jmp 0x7c9                                
  072b  8bde             mov bx, si                               
  072d  6bdb16           imul bx, bx, 0x16                        
  0730  b81d1e           mov ax, 0x1e1d                           
  0733  8ec0             mov es, ax                               
  0735  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  073a  98               cwde                                     
  073b  ba042c           mov dx, 0x2c04                           
  073e  8ec2             mov es, dx                               
  0740  263b061001       cmp ax, word ptr es:[0x110]              
  0745  7403             je 0x74a                                 
  0747  e97f00           jmp 0x7c9                                
  074a  8bde             mov bx, si                               
  074c  6bdb16           imul bx, bx, 0x16                        
  074f  b81d1e           mov ax, 0x1e1d                           
  0752  8ec0             mov es, ax                               
  0754  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  075a  756d             jne 0x7c9                                
  075c  8bc6             mov ax, si                               
  075e  6bc016           imul ax, ax, 0x16                        
  0761  ba0000           mov dx, 0                                
  0764  81c28088         add dx, 0x8880                           
  0768  03c2             add ax, dx                               
  076a  681d1e           push 0x1e1d                              
  076d  50               push ax                                  
  076e  9a2a001d30       lcall 0x301d, 0x2a                       -> ovl35:0874
  0773  83c404           add sp, 4                                
  0776  0bc0             or ax, ax                                
  0778  744f             je 0x7c9                                 
  077a  16               push ss                                  
  077b  8d46fe           lea ax, [bp - 2]                         
  077e  50               push ax                                  
  077f  8bde             mov bx, si                               
  0781  6bdb16           imul bx, bx, 0x16                        
  0784  b81d1e           mov ax, 0x1e1d                           
  0787  8ec0             mov es, ax                               
  0789  26ffb78288       push word ptr es:[bx - 0x777e]           
  078e  8bde             mov bx, si                               
  0790  6bdb16           imul bx, bx, 0x16                        
  0793  b81d1e           mov ax, 0x1e1d                           
  0796  8ec0             mov es, ax                               
  0798  26ffb78088       push word ptr es:[bx - 0x7780]           
  079d  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  07a2  83c408           add sp, 8                                
  07a5  33d2             xor dx, dx                               
  07a7  eb1b             jmp 0x7c4                                
  07a9  8bda             mov bx, dx                               
  07ab  c1e302           shl bx, 2                                
  07ae  c49f1e5e         les bx, ptr [bx + 0x5e1e]                
  07b2  268a4706         mov al, byte ptr es:[bx + 6]             
  07b6  8bda             mov bx, dx                               
  07b8  c1e302           shl bx, 2                                
  07bb  8b9f1e5e         mov bx, word ptr [bx + 0x5e1e]           
  07bf  26004707         add byte ptr es:[bx + 7], al             
  07c3  42               inc dx                                   
  07c4  3b56fe           cmp dx, word ptr [bp - 2]                
  07c7  7ce0             jl 0x7a9                                 
  07c9  8bc6             mov ax, si                               
  07cb  4e               dec si                                   
  07cc  0bc0             or ax, ax                                
  07ce  7403             je 0x7d3                                 
  07d0  e958ff           jmp 0x72b                                
  07d3  b8042c           mov ax, 0x2c04                           
  07d6  8ec0             mov es, ax                               
  07d8  268b368101       mov si, word ptr es:[0x181]              
  07dd  eb3e             jmp 0x81d                                
  07df  8bde             mov bx, si                               
  07e1  6bdb16           imul bx, bx, 0x16                        
  07e4  b81d1e           mov ax, 0x1e1d                           
  07e7  8ec0             mov es, ax                               
  07e9  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  07ee  98               cwde                                     
  07ef  ba042c           mov dx, 0x2c04                           
  07f2  8ec2             mov es, dx                               
  07f4  263b061001       cmp ax, word ptr es:[0x110]              
  07f9  7522             jne 0x81d                                
  07fb  8bde             mov bx, si                               
  07fd  6bdb16           imul bx, bx, 0x16                        
  0800  b81d1e           mov ax, 0x1e1d                           
  0803  8ec0             mov es, ax                               
  0805  2680bf878863     cmp byte ptr es:[bx - 0x7779], 0x63      
  080b  7e10             jle 0x81d                                
  080d  8bde             mov bx, si                               
  080f  6bdb16           imul bx, bx, 0x16                        
  0812  b81d1e           mov ax, 0x1e1d                           
  0815  8ec0             mov es, ax                               
  0817  26c687878863     mov byte ptr es:[bx - 0x7779], 0x63      
  081d  8bc6             mov ax, si                               
  081f  4e               dec si                                   
  0820  0bc0             or ax, ax                                
  0822  75bb             jne 0x7df                                
  0824  5e               pop si                                   
  0825  c9               leave                                    
  0826  cb               retf                                     

ovl68_0827:  ; ENTRY
  0827  55               push bp                                  
  0828  8bec             mov bp, sp                               
  082a  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  082f  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  0834  b8042c           mov ax, 0x2c04                           
  0837  8ec0             mov es, ax                               
  0839  268b1e1001       mov bx, word ptr es:[0x110]              
  083e  d1e3             shl bx, 1                                
  0840  8b87ca5d         mov ax, word ptr [bx + 0x5dca]           
  0844  ba042c           mov dx, 0x2c04                           
  0847  8ec2             mov es, dx                               
  0849  268b1e1001       mov bx, word ptr es:[0x110]              
  084e  d1e3             shl bx, 1                                
  0850  2b87da5d         sub ax, word ptr [bx + 0x5dda]           
  0854  8ec2             mov es, dx                               
  0856  268b1e1001       mov bx, word ptr es:[0x110]              
  085b  6bdb14           imul bx, bx, 0x14                        
  085e  ba042c           mov dx, 0x2c04                           
  0861  8ec2             mov es, dx                               
  0863  2601878501       add word ptr es:[bx + 0x185], ax         
  0868  b8042c           mov ax, 0x2c04                           
  086b  8ec0             mov es, ax                               
  086d  268b1e1001       mov bx, word ptr es:[0x110]              
  0872  6bdb14           imul bx, bx, 0x14                        
  0875  b8042c           mov ax, 0x2c04                           
  0878  8ec0             mov es, ax                               
  087a  2683bf850100     cmp word ptr es:[bx + 0x185], 0          
  0880  7d19             jge 0x89b                                
  0882  b8042c           mov ax, 0x2c04                           
  0885  8ec0             mov es, ax                               
  0887  268b1e1001       mov bx, word ptr es:[0x110]              
  088c  6bdb14           imul bx, bx, 0x14                        
  088f  b8042c           mov ax, 0x2c04                           
  0892  8ec0             mov es, ax                               
  0894  26c78785010000   mov word ptr es:[bx + 0x185], 0          
  089b  5d               pop bp                                   
  089c  cb               retf                                     

ovl68_089d:  ; ENTRY
  089d  55               push bp                                  
  089e  8bec             mov bp, sp                               
  08a0  83ec02           sub sp, 2                                
  08a3  56               push si                                  
  08a4  b8042c           mov ax, 0x2c04                           
  08a7  8ec0             mov es, ax                               
  08a9  268b368101       mov si, word ptr es:[0x181]              
  08ae  eb75             jmp 0x925                                
  08b0  8bde             mov bx, si                               
  08b2  6bdb16           imul bx, bx, 0x16                        
  08b5  b81d1e           mov ax, 0x1e1d                           
  08b8  8ec0             mov es, ax                               
  08ba  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  08bf  98               cwde                                     
  08c0  ba042c           mov dx, 0x2c04                           
  08c3  8ec2             mov es, dx                               
  08c5  263b061001       cmp ax, word ptr es:[0x110]              
  08ca  7559             jne 0x925                                
  08cc  8bde             mov bx, si                               
  08ce  6bdb16           imul bx, bx, 0x16                        
  08d1  b81d1e           mov ax, 0x1e1d                           
  08d4  8ec0             mov es, ax                               
  08d6  2683bf8c8800     cmp word ptr es:[bx - 0x7774], 0         
  08dc  7447             je 0x925                                 
  08de  8bde             mov bx, si                               
  08e0  6bdb16           imul bx, bx, 0x16                        
  08e3  b81d1e           mov ax, 0x1e1d                           
  08e6  8ec0             mov es, ax                               
  08e8  26ffb78288       push word ptr es:[bx - 0x777e]           
  08ed  8bde             mov bx, si                               
  08ef  6bdb16           imul bx, bx, 0x16                        
  08f2  b81d1e           mov ax, 0x1e1d                           
  08f5  ba0000           mov dx, 0                                
  08f8  81c28088         add dx, 0x8880                           
  08fc  03da             add bx, dx                               
  08fe  8ec0             mov es, ax                               
  0900  26ff37           push word ptr es:[bx]                    
  0903  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0908  83c404           add sp, 4                                
  090b  8946fe           mov word ptr [bp - 2], ax                
  090e  837efe00         cmp word ptr [bp - 2], 0                 
  0912  7c11             jl 0x925                                 
  0914  8bde             mov bx, si                               
  0916  6bdb16           imul bx, bx, 0x16                        
  0919  b81d1e           mov ax, 0x1e1d                           
  091c  8ec0             mov es, ax                               
  091e  2681a78c88ffef   and word ptr es:[bx - 0x7774], 0xefff    
  0925  8bc6             mov ax, si                               
  0927  4e               dec si                                   
  0928  0bc0             or ax, ax                                
  092a  7584             jne 0x8b0                                
  092c  5e               pop si                                   
  092d  c9               leave                                    
  092e  cb               retf                                     

ovl68_092f:  ; ENTRY
  092f  55               push bp                                  
  0930  8bec             mov bp, sp                               
  0932  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0937  6a0f             push 0xf                                 
  0939  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  093e  59               pop cx                                   
  093f  1e               push ds                                  
  0940  685632           push 0x3256                              
  0943  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0948  83c404           add sp, 4                                
  094b  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0950  5d               pop bp                                   
  0951  cb               retf                                     

ovl68_0952:  ; ENTRY
  0952  55               push bp                                  
  0953  8bec             mov bp, sp                               
  0955  83ec66           sub sp, 0x66                             
  0958  56               push si                                  
  0959  57               push di                                  
  095a  33ff             xor di, di                               
  095c  33f6             xor si, si                               
  095e  eb13             jmp 0x973                                
  0960  8bde             mov bx, si                               
  0962  d1e3             shl bx, 1                                
  0964  b8042c           mov ax, 0x2c04                           
  0967  8ec0             mov es, ax                               
  0969  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  096f  7401             je 0x972                                 
  0971  47               inc di                                   
  0972  46               inc si                                   
  0973  83fe08           cmp si, 8                                
  0976  7ce8             jl 0x960                                 
  0978  0bff             or di, di                                
  097a  7503             jne 0x97f                                
  097c  e90904           jmp 0xd88                                
  097f  33f6             xor si, si                               
  0981  eb39             jmp 0x9bc                                
  0983  8bde             mov bx, si                               
  0985  d1e3             shl bx, 1                                
  0987  8d46ca           lea ax, [bp - 0x36]                      
  098a  03d8             add bx, ax                               
  098c  36c7070000       mov word ptr ss:[bx], 0                  
  0991  8bde             mov bx, si                               
  0993  d1e3             shl bx, 1                                
  0995  8d46ba           lea ax, [bp - 0x46]                      
  0998  03d8             add bx, ax                               
  099a  36c707ffff       mov word ptr ss:[bx], 0xffff             
  099f  8bde             mov bx, si                               
  09a1  d1e3             shl bx, 1                                
  09a3  8d46aa           lea ax, [bp - 0x56]                      
  09a6  03d8             add bx, ax                               
  09a8  36c7070000       mov word ptr ss:[bx], 0                  
  09ad  8bde             mov bx, si                               
  09af  d1e3             shl bx, 1                                
  09b1  8d469a           lea ax, [bp - 0x66]                      
  09b4  03d8             add bx, ax                               
  09b6  36c7070000       mov word ptr ss:[bx], 0                  
  09bb  46               inc si                                   
  09bc  83fe08           cmp si, 8                                
  09bf  7cc2             jl 0x983                                 
  09c1  897eee           mov word ptr [bp - 0x12], di             
  09c4  33f6             xor si, si                               
  09c6  33c9             xor cx, cx                               
  09c8  eb6f             jmp 0xa39                                
  09ca  8bde             mov bx, si                               
  09cc  d1e3             shl bx, 1                                
  09ce  b8042c           mov ax, 0x2c04                           
  09d1  8ec0             mov es, ax                               
  09d3  268b9f6301       mov bx, word ptr es:[bx + 0x163]         
  09d8  d1e3             shl bx, 1                                
  09da  b8042c           mov ax, 0x2c04                           
  09dd  8ec0             mov es, ax                               
  09df  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  09e5  7451             je 0xa38                                 
  09e7  8bde             mov bx, si                               
  09e9  d1e3             shl bx, 1                                
  09eb  b8042c           mov ax, 0x2c04                           
  09ee  8ec0             mov es, ax                               
  09f0  268b876301       mov ax, word ptr es:[bx + 0x163]         
  09f5  8bd9             mov bx, cx                               
  09f7  d1e3             shl bx, 1                                
  09f9  8d56ba           lea dx, [bp - 0x46]                      
  09fc  03da             add bx, dx                               
  09fe  368907           mov word ptr ss:[bx], ax                 
  0a01  8bd9             mov bx, cx                               
  0a03  d1e3             shl bx, 1                                
  0a05  8d46ca           lea ax, [bp - 0x36]                      
  0a08  03d8             add bx, ax                               
  0a0a  b80800           mov ax, 8                                
  0a0d  2bc7             sub ax, di                               
  0a0f  03c1             add ax, cx                               
  0a11  c1e004           shl ax, 4                                
  0a14  050002           add ax, 0x200                            
  0a17  368907           mov word ptr ss:[bx], ax                 
  0a1a  8bde             mov bx, si                               
  0a1c  d1e3             shl bx, 1                                
  0a1e  b8042c           mov ax, 0x2c04                           
  0a21  8ec0             mov es, ax                               
  0a23  268b876301       mov ax, word ptr es:[bx + 0x163]         
  0a28  ba042c           mov dx, 0x2c04                           
  0a2b  8ec2             mov es, dx                               
  0a2d  263b061001       cmp ax, word ptr es:[0x110]              
  0a32  7503             jne 0xa37                                
  0a34  894ef0           mov word ptr [bp - 0x10], cx             
  0a37  41               inc cx                                   
  0a38  46               inc si                                   
  0a39  83fe08           cmp si, 8                                
  0a3c  7c8c             jl 0x9ca                                 
  0a3e  837ef000         cmp word ptr [bp - 0x10], 0              
  0a42  7405             je 0xa49                                 
  0a44  83ff01           cmp di, 1                                
  0a47  7514             jne 0xa5d                                
  0a49  83ff01           cmp di, 1                                
  0a4c  7504             jne 0xa52                                
  0a4e  33c0             xor ax, ax                               
  0a50  eb03             jmp 0xa55                                
  0a52  b80100           mov ax, 1                                
  0a55  8946aa           mov word ptr [bp - 0x56], ax             
  0a58  8b5eee           mov bx, word ptr [bp - 0x12]             
  0a5b  eb4c             jmp 0xaa9                                
  0a5d  8b46ee           mov ax, word ptr [bp - 0x12]             
  0a60  48               dec ax                                   
  0a61  3b46f0           cmp ax, word ptr [bp - 0x10]             
  0a64  7525             jne 0xa8b                                
  0a66  8b5eee           mov bx, word ptr [bp - 0x12]             
  0a69  d1e3             shl bx, 1                                
  0a6b  8d46a8           lea ax, [bp - 0x58]                      
  0a6e  03d8             add bx, ax                               
  0a70  53               push bx                                  
  0a71  83ff01           cmp di, 1                                
  0a74  7f04             jg 0xa7a                                 
  0a76  33c0             xor ax, ax                               
  0a78  eb03             jmp 0xa7d                                
  0a7a  b80100           mov ax, 1                                
  0a7d  5b               pop bx                                   
  0a7e  368907           mov word ptr ss:[bx], ax                 
  0a81  8b5eee           mov bx, word ptr [bp - 0x12]             
  0a84  d1e3             shl bx, 1                                
  0a86  8d4696           lea ax, [bp - 0x6a]                      
  0a89  eb23             jmp 0xaae                                
  0a8b  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0a8e  d1e3             shl bx, 1                                
  0a90  8d46aa           lea ax, [bp - 0x56]                      
  0a93  03d8             add bx, ax                               
  0a95  53               push bx                                  
  0a96  83ff01           cmp di, 1                                
  0a99  7f04             jg 0xa9f                                 
  0a9b  33c0             xor ax, ax                               
  0a9d  eb03             jmp 0xaa2                                
  0a9f  b80100           mov ax, 1                                
  0aa2  5b               pop bx                                   
  0aa3  368907           mov word ptr ss:[bx], ax                 
  0aa6  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0aa9  d1e3             shl bx, 1                                
  0aab  8d4698           lea ax, [bp - 0x68]                      
  0aae  03d8             add bx, ax                               
  0ab0  36c7070100       mov word ptr ss:[bx], 1                  
  0ab5  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0aba  837e0600         cmp word ptr [bp + 6], 0                 
  0abe  7503             jne 0xac3                                
  0ac0  e9df00           jmp 0xba2                                
  0ac3  6a0f             push 0xf                                 
  0ac5  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0aca  59               pop cx                                   
  0acb  1e               push ds                                  
  0acc  685632           push 0x3256                              
  0acf  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0ad4  83c404           add sp, 4                                
  0ad7  66680f000300     push 0x3000f                             
  0add  666a02           push 2                                   
  0ae0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ae5  83c408           add sp, 8                                
  0ae8  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0aed  50               push ax                                  
  0aee  1e               push ds                                  
  0aef  686b32           push 0x326b                               ; "Turn %d"
  0af2  16               push ss                                  
  0af3  8d46da           lea ax, [bp - 0x26]                      
  0af6  50               push ax                                  
  0af7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0afc  83c40a           add sp, 0xa                              
  0aff  16               push ss                                  
  0b00  8d46da           lea ax, [bp - 0x26]                      
  0b03  50               push ax                                  
  0b04  6a00             push 0                                   
  0b06  b80800           mov ax, 8                                
  0b09  2bc7             sub ax, di                               
  0b0b  c1e004           shl ax, 4                                
  0b0e  05fc01           add ax, 0x1fc                            
  0b11  50               push ax                                  
  0b12  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0b17  83c408           add sp, 8                                
  0b1a  33f6             xor si, si                               
  0b1c  eb7c             jmp 0xb9a                                
  0b1e  6a02             push 2                                   
  0b20  8bde             mov bx, si                               
  0b22  d1e3             shl bx, 1                                
  0b24  8d46ca           lea ax, [bp - 0x36]                      
  0b27  03d8             add bx, ax                               
  0b29  36ff37           push word ptr ss:[bx]                    
  0b2c  16               push ss                                  
  0b2d  8d46f4           lea ax, [bp - 0xc]                       
  0b30  50               push ax                                  
  0b31  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0b36  83c408           add sp, 8                                
  0b39  666810000e00     push 0xe0010                             
  0b3f  8bde             mov bx, si                               
  0b41  d1e3             shl bx, 1                                
  0b43  8d46ba           lea ax, [bp - 0x46]                      
  0b46  03d8             add bx, ax                               
  0b48  368b07           mov ax, word ptr ss:[bx]                 
  0b4b  bb0400           mov bx, 4                                
  0b4e  99               cdq                                      
  0b4f  f7fb             idiv bx                                  
  0b51  6bd20e           imul dx, dx, 0xe                         
  0b54  83c25e           add dx, 0x5e                             
  0b57  52               push dx                                  
  0b58  8bde             mov bx, si                               
  0b5a  d1e3             shl bx, 1                                
  0b5c  8d46ba           lea ax, [bp - 0x46]                      
  0b5f  03d8             add bx, ax                               
  0b61  368b07           mov ax, word ptr ss:[bx]                 
  0b64  bb0400           mov bx, 4                                
  0b67  99               cdq                                      
  0b68  f7fb             idiv bx                                  
  0b6a  c1e004           shl ax, 4                                
  0b6d  057000           add ax, 0x70                             
  0b70  50               push ax                                  
  0b71  16               push ss                                  
  0b72  8d46f8           lea ax, [bp - 8]                         
  0b75  50               push ax                                  
  0b76  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0b7b  83c40c           add sp, 0xc                              
  0b7e  66ff76f4         push dword ptr [bp - 0xc]                
  0b82  8d46f8           lea ax, [bp - 8]                         
  0b85  8cd2             mov dx, ss                               
  0b87  b90800           mov cx, 8                                
  0b8a  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0b8f  6a09             push 9                                   
  0b91  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0b96  83c40e           add sp, 0xe                              
  0b99  46               inc si                                   
  0b9a  3b76ee           cmp si, word ptr [bp - 0x12]             
  0b9d  7d03             jge 0xba2                                
  0b9f  e97cff           jmp 0xb1e                                
  0ba2  bfffff           mov di, 0xffff                           
  0ba5  c746f2ffff       mov word ptr [bp - 0xe], 0xffff          
  0baa  33f6             xor si, si                               
  0bac  eb12             jmp 0xbc0                                
  0bae  8bde             mov bx, si                               
  0bb0  d1e3             shl bx, 1                                
  0bb2  8d469a           lea ax, [bp - 0x66]                      
  0bb5  03d8             add bx, ax                               
  0bb7  36833f00         cmp word ptr ss:[bx], 0                  
  0bbb  7402             je 0xbbf                                 
  0bbd  8bfe             mov di, si                               
  0bbf  46               inc si                                   
  0bc0  3b76ee           cmp si, word ptr [bp - 0x12]             
  0bc3  7ce9             jl 0xbae                                 
  0bc5  33f6             xor si, si                               
  0bc7  eb13             jmp 0xbdc                                
  0bc9  8bde             mov bx, si                               
  0bcb  d1e3             shl bx, 1                                
  0bcd  8d46aa           lea ax, [bp - 0x56]                      
  0bd0  03d8             add bx, ax                               
  0bd2  36833f00         cmp word ptr ss:[bx], 0                  
  0bd6  7403             je 0xbdb                                 
  0bd8  8976f2           mov word ptr [bp - 0xe], si              
  0bdb  46               inc si                                   
  0bdc  3b76ee           cmp si, word ptr [bp - 0x12]             
  0bdf  7ce8             jl 0xbc9                                 
  0be1  837e0600         cmp word ptr [bp + 6], 0                 
  0be5  7403             je 0xbea                                 
  0be7  e9c500           jmp 0xcaf                                
  0bea  0bff             or di, di                                
  0bec  7d03             jge 0xbf1                                
  0bee  e9be00           jmp 0xcaf                                
  0bf1  837e0800         cmp word ptr [bp + 8], 0                 
  0bf5  7403             je 0xbfa                                 
  0bf7  e9b500           jmp 0xcaf                                
  0bfa  6a0f             push 0xf                                 
  0bfc  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0c01  59               pop cx                                   
  0c02  666811000f00     push 0xf0011                             
  0c08  6a01             push 1                                   
  0c0a  8bdf             mov bx, di                               
  0c0c  d1e3             shl bx, 1                                
  0c0e  8d46ca           lea ax, [bp - 0x36]                      
  0c11  03d8             add bx, ax                               
  0c13  368b07           mov ax, word ptr ss:[bx]                 
  0c16  05fdff           add ax, 0xfffd                           
  0c19  50               push ax                                  
  0c1a  16               push ss                                  
  0c1b  8d46f8           lea ax, [bp - 8]                         
  0c1e  50               push ax                                  
  0c1f  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0c24  83c40c           add sp, 0xc                              
  0c27  16               push ss                                  
  0c28  8d46f8           lea ax, [bp - 8]                         
  0c2b  50               push ax                                  
  0c2c  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0c31  83c404           add sp, 4                                
  0c34  6a02             push 2                                   
  0c36  8bdf             mov bx, di                               
  0c38  d1e3             shl bx, 1                                
  0c3a  8d46ca           lea ax, [bp - 0x36]                      
  0c3d  03d8             add bx, ax                               
  0c3f  36ff37           push word ptr ss:[bx]                    
  0c42  16               push ss                                  
  0c43  8d46f4           lea ax, [bp - 0xc]                       
  0c46  50               push ax                                  
  0c47  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0c4c  83c408           add sp, 8                                
  0c4f  666810000e00     push 0xe0010                             
  0c55  8bdf             mov bx, di                               
  0c57  d1e3             shl bx, 1                                
  0c59  8d46ba           lea ax, [bp - 0x46]                      
  0c5c  03d8             add bx, ax                               
  0c5e  368b07           mov ax, word ptr ss:[bx]                 
  0c61  bb0400           mov bx, 4                                
  0c64  99               cdq                                      
  0c65  f7fb             idiv bx                                  
  0c67  6bd20e           imul dx, dx, 0xe                         
  0c6a  83c25e           add dx, 0x5e                             
  0c6d  52               push dx                                  
  0c6e  8bdf             mov bx, di                               
  0c70  d1e3             shl bx, 1                                
  0c72  8d46ba           lea ax, [bp - 0x46]                      
  0c75  03d8             add bx, ax                               
  0c77  368b07           mov ax, word ptr ss:[bx]                 
  0c7a  bb0400           mov bx, 4                                
  0c7d  99               cdq                                      
  0c7e  f7fb             idiv bx                                  
  0c80  c1e004           shl ax, 4                                
  0c83  057000           add ax, 0x70                             
  0c86  50               push ax                                  
  0c87  16               push ss                                  
  0c88  8d46f8           lea ax, [bp - 8]                         
  0c8b  50               push ax                                  
  0c8c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0c91  83c40c           add sp, 0xc                              
  0c94  66ff76f4         push dword ptr [bp - 0xc]                
  0c98  8d46f8           lea ax, [bp - 8]                         
  0c9b  8cd2             mov dx, ss                               
  0c9d  b90800           mov cx, 8                                
  0ca0  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0ca5  6a09             push 9                                   
  0ca7  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0cac  83c40e           add sp, 0xe                              
  0caf  837e0600         cmp word ptr [bp + 6], 0                 
  0cb3  7403             je 0xcb8                                 
  0cb5  e9cb00           jmp 0xd83                                
  0cb8  837ef200         cmp word ptr [bp - 0xe], 0               
  0cbc  7d03             jge 0xcc1                                
  0cbe  e9c200           jmp 0xd83                                
  0cc1  837e0800         cmp word ptr [bp + 8], 0                 
  0cc5  7403             je 0xcca                                 
  0cc7  e9b900           jmp 0xd83                                
  0cca  6a00             push 0                                   
  0ccc  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0cd1  59               pop cx                                   
  0cd2  666811000f00     push 0xf0011                             
  0cd8  6a01             push 1                                   
  0cda  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0cdd  d1e3             shl bx, 1                                
  0cdf  8d46ca           lea ax, [bp - 0x36]                      
  0ce2  03d8             add bx, ax                               
  0ce4  368b07           mov ax, word ptr ss:[bx]                 
  0ce7  05fdff           add ax, 0xfffd                           
  0cea  50               push ax                                  
  0ceb  16               push ss                                  
  0cec  8d46f8           lea ax, [bp - 8]                         
  0cef  50               push ax                                  
  0cf0  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0cf5  83c40c           add sp, 0xc                              
  0cf8  16               push ss                                  
  0cf9  8d46f8           lea ax, [bp - 8]                         
  0cfc  50               push ax                                  
  0cfd  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0d02  83c404           add sp, 4                                
  0d05  6a02             push 2                                   
  0d07  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0d0a  d1e3             shl bx, 1                                
  0d0c  8d46ca           lea ax, [bp - 0x36]                      
  0d0f  03d8             add bx, ax                               
  0d11  36ff37           push word ptr ss:[bx]                    
  0d14  16               push ss                                  
  0d15  8d46f4           lea ax, [bp - 0xc]                       
  0d18  50               push ax                                  
  0d19  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0d1e  83c408           add sp, 8                                
  0d21  666810000e00     push 0xe0010                             
  0d27  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0d2a  d1e3             shl bx, 1                                
  0d2c  8d46ba           lea ax, [bp - 0x46]                      
  0d2f  03d8             add bx, ax                               
  0d31  368b07           mov ax, word ptr ss:[bx]                 
  0d34  bb0400           mov bx, 4                                
  0d37  99               cdq                                      
  0d38  f7fb             idiv bx                                  
  0d3a  6bd20e           imul dx, dx, 0xe                         
  0d3d  83c25e           add dx, 0x5e                             
  0d40  52               push dx                                  
  0d41  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0d44  d1e3             shl bx, 1                                
  0d46  8d46ba           lea ax, [bp - 0x46]                      
  0d49  03d8             add bx, ax                               
  0d4b  368b07           mov ax, word ptr ss:[bx]                 
  0d4e  bb0400           mov bx, 4                                
  0d51  99               cdq                                      
  0d52  f7fb             idiv bx                                  
  0d54  c1e004           shl ax, 4                                
  0d57  057000           add ax, 0x70                             
  0d5a  50               push ax                                  
  0d5b  16               push ss                                  
  0d5c  8d46f8           lea ax, [bp - 8]                         
  0d5f  50               push ax                                  
  0d60  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0d65  83c40c           add sp, 0xc                              
  0d68  66ff76f4         push dword ptr [bp - 0xc]                
  0d6c  8d46f8           lea ax, [bp - 8]                         
  0d6f  8cd2             mov dx, ss                               
  0d71  b90800           mov cx, 8                                
  0d74  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0d79  6a09             push 9                                   
  0d7b  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0d80  83c40e           add sp, 0xe                              
  0d83  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0d88  5f               pop di                                   
  0d89  5e               pop si                                   
  0d8a  c9               leave                                    
  0d8b  cb               retf                                     
