; ovl40 stub 303b file_off 0x607b0 size 0x134a

ovl40_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  bfe803           mov di, 0x3e8                            
  0008  c706680d0000     mov word ptr [0xd68], 0                  
  000e  b8042c           mov ax, 0x2c04                           
  0011  8ec0             mov es, ax                               
  0013  268b368101       mov si, word ptr es:[0x181]              
  0018  eb3c             jmp 0x56                                 
  001a  8bde             mov bx, si                               
  001c  6bdb16           imul bx, bx, 0x16                        
  001f  b81d1e           mov ax, 0x1e1d                           
  0022  8ec0             mov es, ax                               
  0024  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  002a  752a             jne 0x56                                 
  002c  8bde             mov bx, si                               
  002e  6bdb16           imul bx, bx, 0x16                        
  0031  b81d1e           mov ax, 0x1e1d                           
  0034  8ec0             mov es, ax                               
  0036  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  003b  98               cwde                                     
  003c  ba042c           mov dx, 0x2c04                           
  003f  8ec2             mov es, dx                               
  0041  263b061001       cmp ax, word ptr es:[0x110]              
  0046  750e             jne 0x56                                 
  0048  8b1e680d         mov bx, word ptr [0xd68]                 
  004c  d1e3             shl bx, 1                                
  004e  89b70e44         mov word ptr [bx + 0x440e], si           
  0052  ff06680d         inc word ptr [0xd68]                     
  0056  8bc6             mov ax, si                               
  0058  4e               dec si                                   
  0059  0bc0             or ax, ax                                
  005b  75bd             jne 0x1a                                 
  005d  833e680d00       cmp word ptr [0xd68], 0                  
  0062  7f03             jg 0x67                                  
  0064  e98e00           jmp 0xf5                                 
  0067  33f6             xor si, si                               
  0069  eb57             jmp 0xc2                                 
  006b  8bde             mov bx, si                               
  006d  d1e3             shl bx, 1                                
  006f  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0073  6bdb16           imul bx, bx, 0x16                        
  0076  b81d1e           mov ax, 0x1e1d                           
  0079  8ec0             mov es, ax                               
  007b  26ffb78288       push word ptr es:[bx - 0x777e]           
  0080  8bde             mov bx, si                               
  0082  d1e3             shl bx, 1                                
  0084  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0088  6bdb16           imul bx, bx, 0x16                        
  008b  b81d1e           mov ax, 0x1e1d                           
  008e  ba0000           mov dx, 0                                
  0091  81c28088         add dx, 0x8880                           
  0095  03da             add bx, dx                               
  0097  8ec0             mov es, ax                               
  0099  26ff37           push word ptr es:[bx]                    
  009c  b8042c           mov ax, 0x2c04                           
  009f  8ec0             mov es, ax                               
  00a1  26ff367f01       push word ptr es:[0x17f]                 
  00a6  8ec0             mov es, ax                               
  00a8  26ff367d01       push word ptr es:[0x17d]                 
  00ad  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  00b2  83c408           add sp, 8                                
  00b5  8bd0             mov dx, ax                               
  00b7  3bd7             cmp dx, di                               
  00b9  7d06             jge 0xc1                                 
  00bb  8bfa             mov di, dx                               
  00bd  89366a0d         mov word ptr [0xd6a], si                 
  00c1  46               inc si                                   
  00c2  3b36680d         cmp si, word ptr [0xd68]                 
  00c6  7ca3             jl 0x6b                                  
  00c8  c7066c0d0000     mov word ptr [0xd6c], 0                  
  00ce  6a08             push 8                                   
  00d0  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  00d5  59               pop cx                                   
  00d6  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00db  90               nop                                      
  00dc  0e               push cs                                  
  00dd  e81900           call 0xf9                                
  00e0  90               nop                                      
  00e1  0e               push cs                                  
  00e2  e83b05           call 0x620                               
  00e5  90               nop                                      
  00e6  0e               push cs                                  
  00e7  e8c20f           call 0x10ac                              
  00ea  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00ef  c7066a160100     mov word ptr [0x166a], 1                 
  00f5  5f               pop di                                   
  00f6  5e               pop si                                   
  00f7  5d               pop bp                                   
  00f8  cb               retf                                     

ovl40_00f9:  ; ENTRY
  00f9  55               push bp                                  
  00fa  8bec             mov bp, sp                               
  00fc  83ec60           sub sp, 0x60                             
  00ff  56               push si                                  
  0100  57               push di                                  
  0101  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0106  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  010a  d1e3             shl bx, 1                                
  010c  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0110  6bdb16           imul bx, bx, 0x16                        
  0113  b81d1e           mov ax, 0x1e1d                           
  0116  ba0000           mov dx, 0                                
  0119  81c28088         add dx, 0x8880                           
  011d  03da             add bx, dx                               
  011f  8ec0             mov es, ax                               
  0121  268b37           mov si, word ptr es:[bx]                 
  0124  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0128  d1e3             shl bx, 1                                
  012a  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  012e  6bdb16           imul bx, bx, 0x16                        
  0131  b81d1e           mov ax, 0x1e1d                           
  0134  8ec0             mov es, ax                               
  0136  268bbf8288       mov di, word ptr es:[bx - 0x777e]        
  013b  16               push ss                                  
  013c  8d46fe           lea ax, [bp - 2]                         
  013f  50               push ax                                  
  0140  57               push di                                  
  0141  56               push si                                  
  0142  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0147  83c408           add sp, 8                                
  014a  57               push di                                  
  014b  56               push si                                  
  014c  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0151  83c404           add sp, 4                                
  0154  8946fa           mov word ptr [bp - 6], ax                
  0157  66680e000100     push 0x1000e                             
  015d  57               push di                                  
  015e  56               push si                                  
  015f  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  0164  83c408           add sp, 8                                
  0167  8946fc           mov word ptr [bp - 4], ax                
  016a  833e6a1600       cmp word ptr [0x166a], 0                 
  016f  7424             je 0x195                                 
  0171  666800019100     push 0x910100                            
  0177  666a00           push 0                                   
  017a  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  017f  83c408           add sp, 8                                
  0182  666848001500     push 0x150048                            
  0188  666800001e01     push 0x11e0000                           
  018e  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0193  eb57             jmp 0x1ec                                
  0195  c7066a160100     mov word ptr [0x166a], 1                 
  019b  6a02             push 2                                   
  019d  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  01a2  59               pop cx                                   
  01a3  6a00             push 0                                   
  01a5  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  01aa  59               pop cx                                   
  01ab  6668f8008100     push 0x8100f8                            
  01b1  66683401ce00     push 0xce0134                            
  01b7  16               push ss                                  
  01b8  8d46f0           lea ax, [bp - 0x10]                      
  01bb  50               push ax                                  
  01bc  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  01c1  83c40c           add sp, 0xc                              
  01c4  52               push dx                                  
  01c5  50               push ax                                  
  01c6  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  01cb  83c404           add sp, 4                                
  01ce  ff4ef0           dec word ptr [bp - 0x10]                 
  01d1  ff4ef2           dec word ptr [bp - 0xe]                  
  01d4  8346f402         add word ptr [bp - 0xc], 2               
  01d8  8346f602         add word ptr [bp - 0xa], 2               
  01dc  666804000200     push 0x20004                             
  01e2  16               push ss                                  
  01e3  8d46f0           lea ax, [bp - 0x10]                      
  01e6  50               push ax                                  
  01e7  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  01ec  83c408           add sp, 8                                
  01ef  666800000300     push 0x30000                             
  01f5  666801000f00     push 0xf0001                             
  01fb  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0200  83c408           add sp, 8                                
  0203  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0207  d1e3             shl bx, 1                                
  0209  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  020d  6bdb16           imul bx, bx, 0x16                        
  0210  b81d1e           mov ax, 0x1e1d                           
  0213  8ec0             mov es, ax                               
  0215  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  021a  98               cwde                                     
  021b  6bc014           imul ax, ax, 0x14                        
  021e  052302           add ax, 0x223                            
  0221  68042c           push 0x2c04                              
  0224  50               push ax                                  
  0225  6668b0013e00     push 0x3e01b0                            
  022b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0230  83c408           add sp, 8                                
  0233  666a00           push 0                                   
  0236  666800000100     push 0x10000                             
  023c  666a00           push 0                                   
  023f  666a6e           push 0x6e                                
  0242  683001           push 0x130                               
  0245  1e               push ds                                  
  0246  682a34           push 0x342a                              
  0249  b8042c           mov ax, 0x2c04                           
  024c  8ec0             mov es, ax                               
  024e  26ff361001       push word ptr es:[0x110]                 
  0253  6a1c             push 0x1c                                
  0255  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  025a  83c41a           add sp, 0x1a                             
  025d  33f6             xor si, si                               
  025f  bf0100           mov di, 1                                
  0262  eb69             jmp 0x2cd                                
  0264  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0268  d1e3             shl bx, 1                                
  026a  8b870e44         mov ax, word ptr [bx + 0x440e]           
  026e  6bc016           imul ax, ax, 0x16                        
  0271  ba1d1e           mov dx, 0x1e1d                           
  0274  bb0000           mov bx, 0                                
  0277  81c38088         add bx, 0x8880                           
  027b  03c3             add ax, bx                               
  027d  8bde             mov bx, si                               
  027f  c1e302           shl bx, 2                                
  0282  3b97205e         cmp dx, word ptr [bx + 0x5e20]           
  0286  7506             jne 0x28e                                
  0288  3b871e5e         cmp ax, word ptr [bx + 0x5e1e]           
  028c  743e             je 0x2cc                                 
  028e  666a00           push 0                                   
  0291  666800000100     push 0x10000                             
  0297  666a00           push 0                                   
  029a  666a6e           push 0x6e                                
  029d  8bc7             mov ax, di                               
  029f  c1e005           shl ax, 5                                
  02a2  053001           add ax, 0x130                            
  02a5  50               push ax                                  
  02a6  1e               push ds                                  
  02a7  682a34           push 0x342a                              
  02aa  b8042c           mov ax, 0x2c04                           
  02ad  8ec0             mov es, ax                               
  02af  26ff361001       push word ptr es:[0x110]                 
  02b4  8bde             mov bx, si                               
  02b6  c1e302           shl bx, 2                                
  02b9  c49f1e5e         les bx, ptr [bx + 0x5e1e]                
  02bd  268a4704         mov al, byte ptr es:[bx + 4]             
  02c1  98               cwde                                     
  02c2  50               push ax                                  
  02c3  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  02c8  83c41a           add sp, 0x1a                             
  02cb  47               inc di                                   
  02cc  46               inc si                                   
  02cd  3b76fe           cmp si, word ptr [bp - 2]                
  02d0  7c92             jl 0x264                                 
  02d2  8bf7             mov si, di                               
  02d4  eb31             jmp 0x307                                
  02d6  666a00           push 0                                   
  02d9  666800000100     push 0x10000                             
  02df  666a00           push 0                                   
  02e2  666a6e           push 0x6e                                
  02e5  8bc6             mov ax, si                               
  02e7  c1e005           shl ax, 5                                
  02ea  053001           add ax, 0x130                            
  02ed  50               push ax                                  
  02ee  1e               push ds                                  
  02ef  682a34           push 0x342a                              
  02f2  b8042c           mov ax, 0x2c04                           
  02f5  8ec0             mov es, ax                               
  02f7  26ff361001       push word ptr es:[0x110]                 
  02fc  6aff             push -1                                  
  02fe  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0303  83c41a           add sp, 0x1a                             
  0306  46               inc si                                   
  0307  83fe08           cmp si, 8                                
  030a  7cca             jl 0x2d6                                 
  030c  666800000300     push 0x30000                             
  0312  666802000f00     push 0xf0002                             
  0318  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  031d  83c408           add sp, 8                                
  0320  837efa00         cmp word ptr [bp - 6], 0                 
  0324  7d04             jge 0x32a                                
  0326  6a00             push 0                                   
  0328  eb02             jmp 0x32c                                
  032a  6a01             push 1                                   
  032c  688300           push 0x83                                
  032f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0334  83c404           add sp, 4                                
  0337  52               push dx                                  
  0338  50               push ax                                  
  0339  666880019100     push 0x910180                            
  033f  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0344  83c408           add sp, 8                                
  0347  666883000200     push 0x20083                             
  034d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0352  83c404           add sp, 4                                
  0355  52               push dx                                  
  0356  50               push ax                                  
  0357  66688001a500     push 0xa50180                            
  035d  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0362  83c408           add sp, 8                                
  0365  666883000300     push 0x30083                             
  036b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0370  83c404           add sp, 4                                
  0373  52               push dx                                  
  0374  50               push ax                                  
  0375  66688001b900     push 0xb90180                            
  037b  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0380  83c408           add sp, 8                                
  0383  666883000400     push 0x40083                             
  0389  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  038e  83c404           add sp, 4                                
  0391  52               push dx                                  
  0392  50               push ax                                  
  0393  66681002a500     push 0xa50210                            
  0399  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  039e  83c408           add sp, 8                                
  03a1  666883000500     push 0x50083                             
  03a7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03ac  83c404           add sp, 4                                
  03af  52               push dx                                  
  03b0  50               push ax                                  
  03b1  66681002b900     push 0xb90210                            
  03b7  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  03bc  83c408           add sp, 8                                
  03bf  ff36680d         push word ptr [0xd68]                    
  03c3  a16a0d           mov ax, word ptr [0xd6a]                 
  03c6  40               inc ax                                   
  03c7  50               push ax                                  
  03c8  666883000600     push 0x60083                             
  03ce  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03d3  83c404           add sp, 4                                
  03d6  52               push dx                                  
  03d7  50               push ax                                  
  03d8  16               push ss                                  
  03d9  8d46a0           lea ax, [bp - 0x60]                      
  03dc  50               push ax                                  
  03dd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03e2  83c40c           add sp, 0xc                              
  03e5  16               push ss                                  
  03e6  8d46a0           lea ax, [bp - 0x60]                      
  03e9  50               push ax                                  
  03ea  666838015b01     push 0x15b0138                           
  03f0  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  03f5  83c408           add sp, 8                                
  03f8  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  03fc  d1e3             shl bx, 1                                
  03fe  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0402  6bdb16           imul bx, bx, 0x16                        
  0405  b81d1e           mov ax, 0x1e1d                           
  0408  8ec0             mov es, ax                               
  040a  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  040f  98               cwde                                     
  0410  50               push ax                                  
  0411  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0415  d1e3             shl bx, 1                                
  0417  8b870e44         mov ax, word ptr [bx + 0x440e]           
  041b  6bc016           imul ax, ax, 0x16                        
  041e  ba0000           mov dx, 0                                
  0421  81c28088         add dx, 0x8880                           
  0425  03c2             add ax, dx                               
  0427  681d1e           push 0x1e1d                              
  042a  50               push ax                                  
  042b  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  0430  83c404           add sp, 4                                
  0433  5a               pop dx                                   
  0434  03d0             add dx, ax                               
  0436  8bf2             mov si, dx                               
  0438  83fe09           cmp si, 9                                
  043b  7e03             jle 0x440                                
  043d  be0900           mov si, 9                                
  0440  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0444  d1e3             shl bx, 1                                
  0446  8b870e44         mov ax, word ptr [bx + 0x440e]           
  044a  6bc016           imul ax, ax, 0x16                        
  044d  ba0000           mov dx, 0                                
  0450  81c28088         add dx, 0x8880                           
  0454  03c2             add ax, dx                               
  0456  681d1e           push 0x1e1d                              
  0459  50               push ax                                  
  045a  9a2a003030       lcall 0x3030, 0x2a                       -> ovl38:0d71
  045f  83c404           add sp, 4                                
  0462  8bde             mov bx, si                               
  0464  d1e3             shl bx, 1                                
  0466  8b97e40c         mov dx, word ptr [bx + 0xce4]            
  046a  03d0             add dx, ax                               
  046c  8956f8           mov word ptr [bp - 8], dx                
  046f  8b46fc           mov ax, word ptr [bp - 4]                
  0472  6bc041           imul ax, ax, 0x41                        
  0475  058115           add ax, 0x1581                           
  0478  68042c           push 0x2c04                              
  047b  50               push ax                                  
  047c  666888019100     push 0x910188                            
  0482  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0487  83c408           add sp, 8                                
  048a  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  048e  d1e3             shl bx, 1                                
  0490  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0494  6bc016           imul ax, ax, 0x16                        
  0497  ba0000           mov dx, 0                                
  049a  81c28088         add dx, 0x8880                           
  049e  03c2             add ax, dx                               
  04a0  681d1e           push 0x1e1d                              
  04a3  50               push ax                                  
  04a4  9a25003030       lcall 0x3030, 0x25                       -> ovl38:0d1a
  04a9  83c404           add sp, 4                                
  04ac  50               push ax                                  
  04ad  1e               push ds                                  
  04ae  686e0d           push 0xd6e                               
  04b1  16               push ss                                  
  04b2  8d46a0           lea ax, [bp - 0x60]                      
  04b5  50               push ax                                  
  04b6  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  04bb  83c40a           add sp, 0xa                              
  04be  16               push ss                                  
  04bf  8d46a0           lea ax, [bp - 0x60]                      
  04c2  50               push ax                                  
  04c3  66688801a500     push 0xa50188                            
  04c9  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04ce  83c408           add sp, 8                                
  04d1  ff76f8           push word ptr [bp - 8]                   
  04d4  1e               push ds                                  
  04d5  68720d           push 0xd72                               
  04d8  16               push ss                                  
  04d9  8d46a0           lea ax, [bp - 0x60]                      
  04dc  50               push ax                                  
  04dd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  04e2  83c40a           add sp, 0xa                              
  04e5  16               push ss                                  
  04e6  8d46a0           lea ax, [bp - 0x60]                      
  04e9  50               push ax                                  
  04ea  66688801b900     push 0xb90188                            
  04f0  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04f5  83c408           add sp, 8                                
  04f8  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  04fc  d1e3             shl bx, 1                                
  04fe  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0502  6bdb16           imul bx, bx, 0x16                        
  0505  b81d1e           mov ax, 0x1e1d                           
  0508  8ec0             mov es, ax                               
  050a  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  050f  98               cwde                                     
  0510  ba042c           mov dx, 0x2c04                           
  0513  8bd8             mov bx, ax                               
  0515  8ec2             mov es, dx                               
  0517  268a87e305       mov al, byte ptr es:[bx + 0x5e3]         
  051c  250300           and ax, 3                                
  051f  40               inc ax                                   
  0520  50               push ax                                  
  0521  1e               push ds                                  
  0522  68760d           push 0xd76                               
  0525  16               push ss                                  
  0526  8d46a0           lea ax, [bp - 0x60]                      
  0529  50               push ax                                  
  052a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  052f  83c40a           add sp, 0xa                              
  0532  16               push ss                                  
  0533  8d46a0           lea ax, [bp - 0x60]                      
  0536  50               push ax                                  
  0537  66681802a500     push 0xa50218                            
  053d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0542  83c408           add sp, 8                                
  0545  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0549  d1e3             shl bx, 1                                
  054b  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  054f  6bdb16           imul bx, bx, 0x16                        
  0552  b81d1e           mov ax, 0x1e1d                           
  0555  8ec0             mov es, ax                               
  0557  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  055c  98               cwde                                     
  055d  ba042c           mov dx, 0x2c04                           
  0560  8bd8             mov bx, ax                               
  0562  8ec2             mov es, dx                               
  0564  268a87e305       mov al, byte ptr es:[bx + 0x5e3]         
  0569  c1e802           shr ax, 2                                
  056c  253f00           and ax, 0x3f                             
  056f  50               push ax                                  
  0570  1e               push ds                                  
  0571  68790d           push 0xd79                               
  0574  16               push ss                                  
  0575  8d46a0           lea ax, [bp - 0x60]                      
  0578  50               push ax                                  
  0579  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  057e  83c40a           add sp, 0xa                              
  0581  16               push ss                                  
  0582  8d46a0           lea ax, [bp - 0x60]                      
  0585  50               push ax                                  
  0586  66681802b900     push 0xb90218                            
  058c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0591  83c408           add sp, 8                                
  0594  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0598  d1e3             shl bx, 1                                
  059a  8b870e44         mov ax, word ptr [bx + 0x440e]           
  059e  6bc016           imul ax, ax, 0x16                        
  05a1  ba0000           mov dx, 0                                
  05a4  03d0             add dx, ax                               
  05a6  81c28088         add dx, 0x8880                           
  05aa  681d1e           push 0x1e1d                              
  05ad  52               push dx                                  
  05ae  666a00           push 0                                   
  05b1  6a06             push 6                                   
  05b3  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  05b8  83c40a           add sp, 0xa                              
  05bb  833e2e4800       cmp word ptr [0x482e], 0                 
  05c0  741d             je 0x5df                                 
  05c2  8b1efc4b         mov bx, word ptr [0x4bfc]                
  05c6  6bdb1d           imul bx, bx, 0x1d                        
  05c9  b8042c           mov ax, 0x2c04                           
  05cc  8ec0             mov es, ax                               
  05ce  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  05d4  7505             jne 0x5db                                
  05d6  b80100           mov ax, 1                                
  05d9  eb02             jmp 0x5dd                                
  05db  33c0             xor ax, ax                               
  05dd  eb02             jmp 0x5e1                                
  05df  33c0             xor ax, ax                               
  05e1  a36c0d           mov word ptr [0xd6c], ax                 
  05e4  c7060844ffff     mov word ptr [0x4408], 0xffff            
  05ea  833e2e4800       cmp word ptr [0x482e], 0                 
  05ef  7e04             jle 0x5f5                                
  05f1  33c0             xor ax, ax                               
  05f3  eb03             jmp 0x5f8                                
  05f5  b8ffff           mov ax, 0xffff                           
  05f8  a30a44           mov word ptr [0x440a], ax                
  05fb  833e2e4801       cmp word ptr [0x482e], 1                 
  0600  7e05             jle 0x607                                
  0602  b80100           mov ax, 1                                
  0605  eb03             jmp 0x60a                                
  0607  b8ffff           mov ax, 0xffff                           
  060a  a30c44           mov word ptr [0x440c], ax                
  060d  90               nop                                      
  060e  0e               push cs                                  
  060f  e81201           call 0x724                               
  0612  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0617  9a4503a908       lcall 0x8a9, 0x345                       -> 08a9:0345
  061c  5f               pop di                                   
  061d  5e               pop si                                   
  061e  c9               leave                                    
  061f  cb               retf                                     

ovl40_0620:  ; ENTRY
  0620  55               push bp                                  
  0621  8bec             mov bp, sp                               
  0623  6668f2000100     push 0x100f2                             
  0629  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  062e  83c404           add sp, 4                                
  0631  833e680d01       cmp word ptr [0xd68], 1                  
  0636  7e12             jle 0x64a                                
  0638  6668f3000100     push 0x100f3                             
  063e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0643  83c404           add sp, 4                                
  0646  6a01             push 1                                   
  0648  eb10             jmp 0x65a                                
  064a  6668f3000200     push 0x200f3                             
  0650  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0655  83c404           add sp, 4                                
  0658  6a02             push 2                                   
  065a  68f400           push 0xf4                                
  065d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0662  83c404           add sp, 4                                
  0665  833e084400       cmp word ptr [0x4408], 0                 
  066a  7c04             jl 0x670                                 
  066c  6a01             push 1                                   
  066e  eb02             jmp 0x672                                
  0670  6a02             push 2                                   
  0672  68f500           push 0xf5                                
  0675  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  067a  83c404           add sp, 4                                
  067d  833e0c4400       cmp word ptr [0x440c], 0                 
  0682  7c04             jl 0x688                                 
  0684  6a01             push 1                                   
  0686  eb02             jmp 0x68a                                
  0688  6a02             push 2                                   
  068a  68f600           push 0xf6                                
  068d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0692  83c404           add sp, 4                                
  0695  833e6c0d00       cmp word ptr [0xd6c], 0                  
  069a  7439             je 0x6d5                                 
  069c  6668f9000000     push 0xf9                                
  06a2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06a7  83c404           add sp, 4                                
  06aa  6668fa000100     push 0x100fa                             
  06b0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06b5  83c404           add sp, 4                                
  06b8  833e0a4400       cmp word ptr [0x440a], 0                 
  06bd  7c04             jl 0x6c3                                 
  06bf  6a01             push 1                                   
  06c1  eb02             jmp 0x6c5                                
  06c3  6a02             push 2                                   
  06c5  68f800           push 0xf8                                
  06c8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06cd  83c404           add sp, 4                                
  06d0  68f700           push 0xf7                                
  06d3  eb37             jmp 0x70c                                
  06d5  6668f9000100     push 0x100f9                             
  06db  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06e0  83c404           add sp, 4                                
  06e3  6668fa000000     push 0xfa                                
  06e9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06ee  83c404           add sp, 4                                
  06f1  833e0a4400       cmp word ptr [0x440a], 0                 
  06f6  7c04             jl 0x6fc                                 
  06f8  6a01             push 1                                   
  06fa  eb02             jmp 0x6fe                                
  06fc  6a02             push 2                                   
  06fe  68f700           push 0xf7                                
  0701  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0706  83c404           add sp, 4                                
  0709  68f800           push 0xf8                                
  070c  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0711  59               pop cx                                   
  0712  6a08             push 8                                   
  0714  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  0719  59               pop cx                                   
  071a  6a0c             push 0xc                                 
  071c  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  0721  59               pop cx                                   
  0722  5d               pop bp                                   
  0723  cb               retf                                     

ovl40_0724:  ; ENTRY
  0724  55               push bp                                  
  0725  8bec             mov bp, sp                               
  0727  83ec20           sub sp, 0x20                             
  072a  56               push si                                  
  072b  8b1e0a44         mov bx, word ptr [0x440a]                
  072f  d1e3             shl bx, 1                                
  0731  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0735  6bdb1d           imul bx, bx, 0x1d                        
  0738  b8042c           mov ax, 0x2c04                           
  073b  8ec0             mov es, ax                               
  073d  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  0743  7405             je 0x74a                                 
  0745  b80100           mov ax, 1                                
  0748  eb02             jmp 0x74c                                
  074a  33c0             xor ax, ax                               
  074c  a36c0d           mov word ptr [0xd6c], ax                 
  074f  6a03             push 3                                   
  0751  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0756  59               pop cx                                   
  0757  6668b8004200     push 0x4200b8                            
  075d  66686f01ec00     push 0xec016f                            
  0763  16               push ss                                  
  0764  8d46f8           lea ax, [bp - 8]                         
  0767  50               push ax                                  
  0768  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  076d  83c40c           add sp, 0xc                              
  0770  52               push dx                                  
  0771  50               push ax                                  
  0772  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0777  83c404           add sp, 4                                
  077a  666804000200     push 0x20004                             
  0780  16               push ss                                  
  0781  8d46f8           lea ax, [bp - 8]                         
  0784  50               push ax                                  
  0785  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  078a  83c408           add sp, 8                                
  078d  666802000400     push 0x40002                             
  0793  6668b4001500     push 0x1500b4                             ; "Quest"
  0799  666871010201     push 0x1020171                           
  079f  16               push ss                                  
  07a0  8d46f8           lea ax, [bp - 8]                         
  07a3  50               push ax                                  
  07a4  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  07a9  83c40c           add sp, 0xc                              
  07ac  52               push dx                                  
  07ad  50               push ax                                  
  07ae  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  07b3  83c408           add sp, 8                                
  07b6  6668c8001400     push 0x1400c8                             ; "Quest"
  07bc  666818009700     push 0x970018                            
  07c2  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  07c7  83c408           add sp, 8                                
  07ca  666800000300     push 0x30000                             
  07d0  666802000f00     push 0xf0002                             
  07d6  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  07db  83c408           add sp, 8                                
  07de  833e6c0d00       cmp word ptr [0xd6c], 0                  
  07e3  7404             je 0x7e9                                 
  07e5  6a07             push 7                                   
  07e7  eb02             jmp 0x7eb                                
  07e9  6a08             push 8                                   
  07eb  688300           push 0x83                                
  07ee  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  07f3  83c404           add sp, 4                                
  07f6  52               push dx                                  
  07f7  50               push ax                                  
  07f8  6668b001d300     push 0xd301b0                            
  07fe  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0803  83c408           add sp, 8                                
  0806  33f6             xor si, si                               
  0808  e99500           jmp 0x8a0                                
  080b  8bde             mov bx, si                               
  080d  d1e3             shl bx, 1                                
  080f  83bf084400       cmp word ptr [bx + 0x4408], 0            
  0814  7d03             jge 0x819                                
  0816  e98600           jmp 0x89f                                
  0819  8bde             mov bx, si                               
  081b  d1e3             shl bx, 1                                
  081d  8b9f0844         mov bx, word ptr [bx + 0x4408]           
  0821  d1e3             shl bx, 1                                
  0823  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0827  6bdb1d           imul bx, bx, 0x1d                        
  082a  b8042c           mov ax, 0x2c04                           
  082d  8ec0             mov es, ax                               
  082f  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  0835  750a             jne 0x841                                
  0837  666800000300     push 0x30000                             
  083d  6a0a             push 0xa                                 
  083f  eb30             jmp 0x871                                
  0841  8bde             mov bx, si                               
  0843  d1e3             shl bx, 1                                
  0845  8b9f0844         mov bx, word ptr [bx + 0x4408]           
  0849  d1e3             shl bx, 1                                
  084b  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  084f  6bdb1d           imul bx, bx, 0x1d                        
  0852  b8042c           mov ax, 0x2c04                           
  0855  8ec0             mov es, ax                               
  0857  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  085d  750a             jne 0x869                                
  085f  666800000300     push 0x30000                             
  0865  6a05             push 5                                   
  0867  eb08             jmp 0x871                                
  0869  666800000300     push 0x30000                             
  086f  6a07             push 7                                   
  0871  6a02             push 2                                   
  0873  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0878  83c408           add sp, 8                                
  087b  8bde             mov bx, si                               
  087d  d1e3             shl bx, 1                                
  087f  8b870844         mov ax, word ptr [bx + 0x4408]           
  0883  c1e005           shl ax, 5                                
  0886  053c48           add ax, 0x483c                           
  0889  1e               push ds                                  
  088a  50               push ax                                  
  088b  8bc6             mov ax, si                               
  088d  6bc016           imul ax, ax, 0x16                        
  0890  05ee00           add ax, 0xee                             
  0893  50               push ax                                  
  0894  687801           push 0x178                               
  0897  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  089c  83c408           add sp, 8                                
  089f  46               inc si                                   
  08a0  83fe03           cmp si, 3                                
  08a3  7d03             jge 0x8a8                                
  08a5  e963ff           jmp 0x80b                                
  08a8  6a03             push 3                                   
  08aa  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  08af  59               pop cx                                   
  08b0  666837001400     push 0x140037                            
  08b6  666838010401     push 0x1040138                           
  08bc  16               push ss                                  
  08bd  8d46f8           lea ax, [bp - 8]                         
  08c0  50               push ax                                  
  08c1  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  08c6  83c40c           add sp, 0xc                              
  08c9  52               push dx                                  
  08ca  50               push ax                                  
  08cb  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  08d0  83c404           add sp, 4                                
  08d3  833e0a4400       cmp word ptr [0x440a], 0                 
  08d8  7d03             jge 0x8dd                                
  08da  e99401           jmp 0xa71                                
  08dd  8b1e0a44         mov bx, word ptr [0x440a]                
  08e1  d1e3             shl bx, 1                                
  08e3  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  08e7  6bdb1d           imul bx, bx, 0x1d                        
  08ea  b8042c           mov ax, 0x2c04                           
  08ed  8ec0             mov es, ax                               
  08ef  2680bffd0c08     cmp byte ptr es:[bx + 0xcfd], 8          
  08f5  7514             jne 0x90b                                
  08f7  1e               push ds                                  
  08f8  687c0d           push 0xd7c                                ; "com +1"
  08fb  16               push ss                                  
  08fc  8d46e0           lea ax, [bp - 0x20]                      
  08ff  50               push ax                                  
  0900  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0905  83c408           add sp, 8                                
  0908  e9f900           jmp 0xa04                                
  090b  8b1e0a44         mov bx, word ptr [0x440a]                
  090f  d1e3             shl bx, 1                                
  0911  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0915  6bdb1d           imul bx, bx, 0x1d                        
  0918  b8042c           mov ax, 0x2c04                           
  091b  8ec0             mov es, ax                               
  091d  2680bffd0c02     cmp byte ptr es:[bx + 0xcfd], 2          
  0923  7520             jne 0x945                                
  0925  8b1e0a44         mov bx, word ptr [0x440a]                
  0929  d1e3             shl bx, 1                                
  092b  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  092f  6bdb1d           imul bx, bx, 0x1d                        
  0932  b8042c           mov ax, 0x2c04                           
  0935  8ec0             mov es, ax                               
  0937  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  093c  98               cwde                                     
  093d  50               push ax                                  
  093e  1e               push ds                                  
  093f  68830d           push 0xd83                                ; "com +%d"
  0942  e9b200           jmp 0x9f7                                
  0945  8b1e0a44         mov bx, word ptr [0x440a]                
  0949  d1e3             shl bx, 1                                
  094b  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  094f  6bdb1d           imul bx, bx, 0x1d                        
  0952  b8042c           mov ax, 0x2c04                           
  0955  8ec0             mov es, ax                               
  0957  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  095d  751f             jne 0x97e                                
  095f  8b1e0a44         mov bx, word ptr [0x440a]                
  0963  d1e3             shl bx, 1                                
  0965  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0969  6bdb1d           imul bx, bx, 0x1d                        
  096c  b8042c           mov ax, 0x2c04                           
  096f  8ec0             mov es, ax                               
  0971  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0976  98               cwde                                     
  0977  50               push ax                                  
  0978  1e               push ds                                  
  0979  688b0d           push 0xd8b                                ; "bat +%d"
  097c  eb79             jmp 0x9f7                                
  097e  8b1e0a44         mov bx, word ptr [0x440a]                
  0982  d1e3             shl bx, 1                                
  0984  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0988  6bdb1d           imul bx, bx, 0x1d                        
  098b  b8042c           mov ax, 0x2c04                           
  098e  8ec0             mov es, ax                               
  0990  2680bffd0c05     cmp byte ptr es:[bx + 0xcfd], 5          
  0996  7507             jne 0x99f                                
  0998  1e               push ds                                  
  0999  68930d           push 0xd93                               
  099c  e95cff           jmp 0x8fb                                
  099f  8b1e0a44         mov bx, word ptr [0x440a]                
  09a3  d1e3             shl bx, 1                                
  09a5  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  09a9  6bdb1d           imul bx, bx, 0x1d                        
  09ac  b8042c           mov ax, 0x2c04                           
  09af  8ec0             mov es, ax                               
  09b1  2680bffd0c06     cmp byte ptr es:[bx + 0xcfd], 6          
  09b7  7507             jne 0x9c0                                
  09b9  1e               push ds                                  
  09ba  68970d           push 0xd97                                ; "move"
  09bd  e93bff           jmp 0x8fb                                
  09c0  8b1e0a44         mov bx, word ptr [0x440a]                
  09c4  d1e3             shl bx, 1                                
  09c6  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  09ca  6bdb1d           imul bx, bx, 0x1d                        
  09cd  b8042c           mov ax, 0x2c04                           
  09d0  8ec0             mov es, ax                               
  09d2  2680bffd0c07     cmp byte ptr es:[bx + 0xcfd], 7          
  09d8  752a             jne 0xa04                                
  09da  8b1e0a44         mov bx, word ptr [0x440a]                
  09de  d1e3             shl bx, 1                                
  09e0  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  09e4  6bdb1d           imul bx, bx, 0x1d                        
  09e7  b8042c           mov ax, 0x2c04                           
  09ea  8ec0             mov es, ax                               
  09ec  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  09f1  98               cwde                                     
  09f2  50               push ax                                  
  09f3  1e               push ds                                  
  09f4  689c0d           push 0xd9c                                ; "gld +%d"
  09f7  16               push ss                                  
  09f8  8d46e0           lea ax, [bp - 0x20]                      
  09fb  50               push ax                                  
  09fc  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a01  83c40a           add sp, 0xa                              
  0a04  8b1e0a44         mov bx, word ptr [0x440a]                
  0a08  d1e3             shl bx, 1                                
  0a0a  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0a0e  6bdb1d           imul bx, bx, 0x1d                        
  0a11  b8042c           mov ax, 0x2c04                           
  0a14  8ec0             mov es, ax                               
  0a16  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  0a1c  750a             jne 0xa28                                
  0a1e  666800000300     push 0x30000                             
  0a24  6a0a             push 0xa                                 
  0a26  eb2c             jmp 0xa54                                
  0a28  8b1e0a44         mov bx, word ptr [0x440a]                
  0a2c  d1e3             shl bx, 1                                
  0a2e  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0a32  6bdb1d           imul bx, bx, 0x1d                        
  0a35  b8042c           mov ax, 0x2c04                           
  0a38  8ec0             mov es, ax                               
  0a3a  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  0a40  750a             jne 0xa4c                                
  0a42  666800000300     push 0x30000                             
  0a48  6a05             push 5                                   
  0a4a  eb08             jmp 0xa54                                
  0a4c  666800000300     push 0x30000                             
  0a52  6a07             push 7                                   
  0a54  6a02             push 2                                   
  0a56  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0a5b  83c408           add sp, 8                                
  0a5e  16               push ss                                  
  0a5f  8d46e0           lea ax, [bp - 0x20]                      
  0a62  50               push ax                                  
  0a63  666854010401     push 0x1040154                           
  0a69  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0a6e  83c408           add sp, 8                                
  0a71  666838013701     push 0x1370138                           
  0a77  16               push ss                                  
  0a78  8d46f4           lea ax, [bp - 0xc]                       
  0a7b  50               push ax                                  
  0a7c  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0a81  83c408           add sp, 8                                
  0a84  66ff76f4         push dword ptr [bp - 0xc]                
  0a88  a16c0d           mov ax, word ptr [0xd6c]                 
  0a8b  c1e003           shl ax, 3                                
  0a8e  8cda             mov dx, ds                               
  0a90  05d40a           add ax, 0xad4                            
  0a93  b90800           mov cx, 8                                
  0a96  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a9b  6a08             push 8                                   
  0a9d  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0aa2  83c40e           add sp, 0xe                              
  0aa5  666800000300     push 0x30000                             
  0aab  666802000700     push 0x70002                             
  0ab1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ab6  83c408           add sp, 8                                
  0ab9  1e               push ds                                  
  0aba  68a40d           push 0xda4                                ; "Carried"
  0abd  666850013901     push 0x1390150                           
  0ac3  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0ac8  83c408           add sp, 8                                
  0acb  666890013701     push 0x1370190                           
  0ad1  16               push ss                                  
  0ad2  8d46f4           lea ax, [bp - 0xc]                       
  0ad5  50               push ax                                  
  0ad6  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0adb  83c408           add sp, 8                                
  0ade  66ff76f4         push dword ptr [bp - 0xc]                
  0ae2  a16c0d           mov ax, word ptr [0xd6c]                 
  0ae5  f7d8             neg ax                                   
  0ae7  1bc0             sbb ax, ax                               
  0ae9  40               inc ax                                   
  0aea  c1e003           shl ax, 3                                
  0aed  8cda             mov dx, ds                               
  0aef  05d40a           add ax, 0xad4                            
  0af2  b90800           mov cx, 8                                
  0af5  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0afa  6a08             push 8                                   
  0afc  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0b01  83c40e           add sp, 0xe                              
  0b04  666800000300     push 0x30000                             
  0b0a  666802000a00     push 0xa0002                             
  0b10  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0b15  83c408           add sp, 8                                
  0b18  1e               push ds                                  
  0b19  68ac0d           push 0xdac                                ; "Ground"
  0b1c  6668a8013901     push 0x13901a8                           
  0b22  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0b27  83c408           add sp, 8                                
  0b2a  5e               pop si                                   
  0b2b  c9               leave                                    
  0b2c  cb               retf                                     

ovl40_0b2d:  ; ENTRY
  0b2d  55               push bp                                  
  0b2e  8bec             mov bp, sp                               
  0b30  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  0b35  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0b3a  666a00           push 0                                   
  0b3d  6a01             push 1                                   
  0b3f  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  0b44  83c406           add sp, 6                                
  0b47  666a00           push 0                                   
  0b4a  666a00           push 0                                   
  0b4d  6a03             push 3                                   
  0b4f  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  0b54  83c40a           add sp, 0xa                              
  0b57  0bc0             or ax, ax                                
  0b59  5d               pop bp                                   
  0b5a  cb               retf                                     

ovl40_0b5b:  ; ENTRY
  0b5b  55               push bp                                  
  0b5c  8bec             mov bp, sp                               
  0b5e  a16a0d           mov ax, word ptr [0xd6a]                 
  0b61  40               inc ax                                   
  0b62  99               cdq                                      
  0b63  f73e680d         idiv word ptr [0xd68]                    
  0b67  89166a0d         mov word ptr [0xd6a], dx                 
  0b6b  c7066c0d0000     mov word ptr [0xd6c], 0                  
  0b71  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b76  0e               push cs                                  
  0b77  e87ff5           call 0xf9                                
  0b7a  90               nop                                      
  0b7b  0e               push cs                                  
  0b7c  e82d05           call 0x10ac                              
  0b7f  0e               push cs                                  
  0b80  e89dfa           call 0x620                               
  0b83  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0b88  5d               pop bp                                   
  0b89  cb               retf                                     

ovl40_0b8a:  ; ENTRY
  0b8a  55               push bp                                  
  0b8b  8bec             mov bp, sp                               
  0b8d  a16a0d           mov ax, word ptr [0xd6a]                 
  0b90  0306680d         add ax, word ptr [0xd68]                 
  0b94  48               dec ax                                   
  0b95  99               cdq                                      
  0b96  f73e680d         idiv word ptr [0xd68]                    
  0b9a  89166a0d         mov word ptr [0xd6a], dx                 
  0b9e  c7066c0d0000     mov word ptr [0xd6c], 0                  
  0ba4  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0ba9  0e               push cs                                  
  0baa  e84cf5           call 0xf9                                
  0bad  90               nop                                      
  0bae  0e               push cs                                  
  0baf  e8fa04           call 0x10ac                              
  0bb2  0e               push cs                                  
  0bb3  e86afa           call 0x620                               
  0bb6  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0bbb  5d               pop bp                                   
  0bbc  cb               retf                                     

ovl40_0bbd:  ; ENTRY
  0bbd  55               push bp                                  
  0bbe  8bec             mov bp, sp                               
  0bc0  a10a44           mov ax, word ptr [0x440a]                
  0bc3  a30c44           mov word ptr [0x440c], ax                
  0bc6  a10844           mov ax, word ptr [0x4408]                
  0bc9  a30a44           mov word ptr [0x440a], ax                
  0bcc  ff0e0844         dec word ptr [0x4408]                    
  0bd0  833e084400       cmp word ptr [0x4408], 0                 
  0bd5  7d06             jge 0xbdd                                
  0bd7  c7060844ffff     mov word ptr [0x4408], 0xffff            
  0bdd  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0be2  0e               push cs                                  
  0be3  e83efb           call 0x724                               
  0be6  0e               push cs                                  
  0be7  e836fa           call 0x620                               
  0bea  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0bef  5d               pop bp                                   
  0bf0  cb               retf                                     

ovl40_0bf1:  ; ENTRY
  0bf1  55               push bp                                  
  0bf2  8bec             mov bp, sp                               
  0bf4  a10a44           mov ax, word ptr [0x440a]                
  0bf7  a30844           mov word ptr [0x4408], ax                
  0bfa  a10c44           mov ax, word ptr [0x440c]                
  0bfd  a30a44           mov word ptr [0x440a], ax                
  0c00  ff060c44         inc word ptr [0x440c]                    
  0c04  a10c44           mov ax, word ptr [0x440c]                
  0c07  3b062e48         cmp ax, word ptr [0x482e]                
  0c0b  7c06             jl 0xc13                                 
  0c0d  c7060c44ffff     mov word ptr [0x440c], 0xffff            
  0c13  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0c18  0e               push cs                                  
  0c19  e808fb           call 0x724                               
  0c1c  0e               push cs                                  
  0c1d  e800fa           call 0x620                               
  0c20  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0c25  5d               pop bp                                   
  0c26  cb               retf                                     

ovl40_0c27:  ; ENTRY
  0c27  55               push bp                                  
  0c28  8bec             mov bp, sp                               
  0c2a  83ec02           sub sp, 2                                
  0c2d  56               push si                                  
  0c2e  33f6             xor si, si                               
  0c30  66ff7606         push dword ptr [bp + 6]                  
  0c34  9a4400620b       lcall 0xb62, 0x44                        -> 0b62:0044
  0c39  83c404           add sp, 4                                
  0c3c  8946fe           mov word ptr [bp - 2], ax                
  0c3f  33d2             xor dx, dx                               
  0c41  eb60             jmp 0xca3                                
  0c43  8bda             mov bx, dx                               
  0c45  6bdb1d           imul bx, bx, 0x1d                        
  0c48  b8042c           mov ax, 0x2c04                           
  0c4b  8ec0             mov es, ax                               
  0c4d  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  0c53  754d             jne 0xca2                                
  0c55  8bda             mov bx, dx                               
  0c57  6bdb1d           imul bx, bx, 0x1d                        
  0c5a  b8042c           mov ax, 0x2c04                           
  0c5d  8ec0             mov es, ax                               
  0c5f  268b87000d       mov ax, word ptr es:[bx + 0xd00]         
  0c64  3b46fe           cmp ax, word ptr [bp - 2]                
  0c67  7539             jne 0xca2                                
  0c69  8bda             mov bx, dx                               
  0c6b  6bdb1d           imul bx, bx, 0x1d                        
  0c6e  b8042c           mov ax, 0x2c04                           
  0c71  8ec0             mov es, ax                               
  0c73  2680bffd0c08     cmp byte ptr es:[bx + 0xcfd], 8          
  0c79  7503             jne 0xc7e                                
  0c7b  46               inc si                                   
  0c7c  eb24             jmp 0xca2                                
  0c7e  8bda             mov bx, dx                               
  0c80  6bdb1d           imul bx, bx, 0x1d                        
  0c83  b8042c           mov ax, 0x2c04                           
  0c86  8ec0             mov es, ax                               
  0c88  2680bffd0c02     cmp byte ptr es:[bx + 0xcfd], 2          
  0c8e  7512             jne 0xca2                                
  0c90  8bda             mov bx, dx                               
  0c92  6bdb1d           imul bx, bx, 0x1d                        
  0c95  b8042c           mov ax, 0x2c04                           
  0c98  8ec0             mov es, ax                               
  0c9a  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0c9f  98               cwde                                     
  0ca0  03f0             add si, ax                               
  0ca2  42               inc dx                                   
  0ca3  83fa16           cmp dx, 0x16                             
  0ca6  7c9b             jl 0xc43                                 
  0ca8  8bc6             mov ax, si                               
  0caa  5e               pop si                                   
  0cab  c9               leave                                    
  0cac  cb               retf                                     

ovl40_0cad:  ; ENTRY
  0cad  55               push bp                                  
  0cae  8bec             mov bp, sp                               
  0cb0  83ec02           sub sp, 2                                
  0cb3  56               push si                                  
  0cb4  33f6             xor si, si                               
  0cb6  66ff7606         push dword ptr [bp + 6]                  
  0cba  9a4400620b       lcall 0xb62, 0x44                        -> 0b62:0044
  0cbf  83c404           add sp, 4                                
  0cc2  8946fe           mov word ptr [bp - 2], ax                
  0cc5  33d2             xor dx, dx                               
  0cc7  eb4b             jmp 0xd14                                
  0cc9  8bda             mov bx, dx                               
  0ccb  6bdb1d           imul bx, bx, 0x1d                        
  0cce  b8042c           mov ax, 0x2c04                           
  0cd1  8ec0             mov es, ax                               
  0cd3  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  0cd9  7538             jne 0xd13                                
  0cdb  8bda             mov bx, dx                               
  0cdd  6bdb1d           imul bx, bx, 0x1d                        
  0ce0  b8042c           mov ax, 0x2c04                           
  0ce3  8ec0             mov es, ax                               
  0ce5  268b87000d       mov ax, word ptr es:[bx + 0xd00]         
  0cea  3b46fe           cmp ax, word ptr [bp - 2]                
  0ced  7524             jne 0xd13                                
  0cef  8bda             mov bx, dx                               
  0cf1  6bdb1d           imul bx, bx, 0x1d                        
  0cf4  b8042c           mov ax, 0x2c04                           
  0cf7  8ec0             mov es, ax                               
  0cf9  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  0cff  7512             jne 0xd13                                
  0d01  8bda             mov bx, dx                               
  0d03  6bdb1d           imul bx, bx, 0x1d                        
  0d06  b8042c           mov ax, 0x2c04                           
  0d09  8ec0             mov es, ax                               
  0d0b  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0d10  98               cwde                                     
  0d11  03f0             add si, ax                               
  0d13  42               inc dx                                   
  0d14  83fa16           cmp dx, 0x16                             
  0d17  7cb0             jl 0xcc9                                 
  0d19  8bc6             mov ax, si                               
  0d1b  5e               pop si                                   
  0d1c  c9               leave                                    
  0d1d  cb               retf                                     

ovl40_0d1e:  ; ENTRY
  0d1e  55               push bp                                  
  0d1f  8bec             mov bp, sp                               
  0d21  83ec16           sub sp, 0x16                             
  0d24  56               push si                                  
  0d25  8b1e0a44         mov bx, word ptr [0x440a]                
  0d29  d1e3             shl bx, 1                                
  0d2b  ffb7fc4b         push word ptr [bx + 0x4bfc]              
  0d2f  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0d33  d1e3             shl bx, 1                                
  0d35  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0d39  6bc016           imul ax, ax, 0x16                        
  0d3c  ba0000           mov dx, 0                                
  0d3f  03d0             add dx, ax                               
  0d41  81c28088         add dx, 0x8880                           
  0d45  681d1e           push 0x1e1d                              
  0d48  52               push dx                                  
  0d49  9a39007330       lcall 0x3073, 0x39                       -> ovl47:0943
  0d4e  83c406           add sp, 6                                
  0d51  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0d56  0e               push cs                                  
  0d57  e8caf9           call 0x724                               
  0d5a  666800000300     push 0x30000                             
  0d60  666802000f00     push 0xf0002                             
  0d66  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0d6b  83c408           add sp, 8                                
  0d6e  666840002800     push 0x280040                            
  0d74  666858006900     push 0x690058                            
  0d7a  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0d7f  83c408           add sp, 8                                
  0d82  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0d86  d1e3             shl bx, 1                                
  0d88  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0d8c  6bdb16           imul bx, bx, 0x16                        
  0d8f  b81d1e           mov ax, 0x1e1d                           
  0d92  8ec0             mov es, ax                               
  0d94  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0d99  98               cwde                                     
  0d9a  50               push ax                                  
  0d9b  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0d9f  d1e3             shl bx, 1                                
  0da1  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0da5  6bc016           imul ax, ax, 0x16                        
  0da8  ba0000           mov dx, 0                                
  0dab  81c28088         add dx, 0x8880                           
  0daf  03c2             add ax, dx                               
  0db1  681d1e           push 0x1e1d                              
  0db4  50               push ax                                  
  0db5  0e               push cs                                  
  0db6  e8f4fe           call 0xcad                               
  0db9  83c404           add sp, 4                                
  0dbc  5a               pop dx                                   
  0dbd  03d0             add dx, ax                               
  0dbf  8bf2             mov si, dx                               
  0dc1  83fe09           cmp si, 9                                
  0dc4  7e03             jle 0xdc9                                
  0dc6  be0900           mov si, 9                                
  0dc9  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0dcd  d1e3             shl bx, 1                                
  0dcf  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0dd3  6bc016           imul ax, ax, 0x16                        
  0dd6  ba0000           mov dx, 0                                
  0dd9  81c28088         add dx, 0x8880                           
  0ddd  03c2             add ax, dx                               
  0ddf  681d1e           push 0x1e1d                              
  0de2  50               push ax                                  
  0de3  0e               push cs                                  
  0de4  e840fe           call 0xc27                               
  0de7  83c404           add sp, 4                                
  0dea  8bde             mov bx, si                               
  0dec  d1e3             shl bx, 1                                
  0dee  8b97e40c         mov dx, word ptr [bx + 0xce4]            
  0df2  03d0             add dx, ax                               
  0df4  8956fe           mov word ptr [bp - 2], dx                
  0df7  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0dfb  d1e3             shl bx, 1                                
  0dfd  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0e01  6bc016           imul ax, ax, 0x16                        
  0e04  ba0000           mov dx, 0                                
  0e07  81c28088         add dx, 0x8880                           
  0e0b  03c2             add ax, dx                               
  0e0d  681d1e           push 0x1e1d                              
  0e10  50               push ax                                  
  0e11  0e               push cs                                  
  0e12  e898fe           call 0xcad                               
  0e15  83c404           add sp, 4                                
  0e18  50               push ax                                  
  0e19  1e               push ds                                  
  0e1a  68b30d           push 0xdb3                               
  0e1d  16               push ss                                  
  0e1e  8d46ea           lea ax, [bp - 0x16]                      
  0e21  50               push ax                                  
  0e22  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e27  83c40a           add sp, 0xa                              
  0e2a  16               push ss                                  
  0e2b  8d46ea           lea ax, [bp - 0x16]                      
  0e2e  50               push ax                                  
  0e2f  66688801a500     push 0xa50188                            
  0e35  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0e3a  83c408           add sp, 8                                
  0e3d  ff76fe           push word ptr [bp - 2]                   
  0e40  1e               push ds                                  
  0e41  68b70d           push 0xdb7                               
  0e44  16               push ss                                  
  0e45  8d46ea           lea ax, [bp - 0x16]                      
  0e48  50               push ax                                  
  0e49  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e4e  83c40a           add sp, 0xa                              
  0e51  16               push ss                                  
  0e52  8d46ea           lea ax, [bp - 0x16]                      
  0e55  50               push ax                                  
  0e56  66688801b900     push 0xb90188                            
  0e5c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0e61  83c408           add sp, 8                                
  0e64  0e               push cs                                  
  0e65  e8b8f7           call 0x620                               
  0e68  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0e6d  5e               pop si                                   
  0e6e  c9               leave                                    
  0e6f  cb               retf                                     

ovl40_0e70:  ; ENTRY
  0e70  55               push bp                                  
  0e71  8bec             mov bp, sp                               
  0e73  83ec16           sub sp, 0x16                             
  0e76  56               push si                                  
  0e77  8b1e0a44         mov bx, word ptr [0x440a]                
  0e7b  d1e3             shl bx, 1                                
  0e7d  ffb7fc4b         push word ptr [bx + 0x4bfc]              
  0e81  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0e85  d1e3             shl bx, 1                                
  0e87  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0e8b  6bc016           imul ax, ax, 0x16                        
  0e8e  ba0000           mov dx, 0                                
  0e91  03d0             add dx, ax                               
  0e93  81c28088         add dx, 0x8880                           
  0e97  681d1e           push 0x1e1d                              
  0e9a  52               push dx                                  
  0e9b  9a34007330       lcall 0x3073, 0x34                       -> ovl47:08c7
  0ea0  83c406           add sp, 6                                
  0ea3  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0ea8  0e               push cs                                  
  0ea9  e878f8           call 0x724                               
  0eac  666800000300     push 0x30000                             
  0eb2  666802000f00     push 0xf0002                             
  0eb8  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ebd  83c408           add sp, 8                                
  0ec0  666840002800     push 0x280040                            
  0ec6  666858006900     push 0x690058                            
  0ecc  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0ed1  83c408           add sp, 8                                
  0ed4  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0ed8  d1e3             shl bx, 1                                
  0eda  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  0ede  6bdb16           imul bx, bx, 0x16                        
  0ee1  b81d1e           mov ax, 0x1e1d                           
  0ee4  8ec0             mov es, ax                               
  0ee6  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0eeb  98               cwde                                     
  0eec  50               push ax                                  
  0eed  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0ef1  d1e3             shl bx, 1                                
  0ef3  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0ef7  6bc016           imul ax, ax, 0x16                        
  0efa  ba0000           mov dx, 0                                
  0efd  81c28088         add dx, 0x8880                           
  0f01  03c2             add ax, dx                               
  0f03  681d1e           push 0x1e1d                              
  0f06  50               push ax                                  
  0f07  0e               push cs                                  
  0f08  e8a2fd           call 0xcad                               
  0f0b  83c404           add sp, 4                                
  0f0e  5a               pop dx                                   
  0f0f  03d0             add dx, ax                               
  0f11  8bf2             mov si, dx                               
  0f13  83fe09           cmp si, 9                                
  0f16  7e03             jle 0xf1b                                
  0f18  be0900           mov si, 9                                
  0f1b  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0f1f  d1e3             shl bx, 1                                
  0f21  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0f25  6bc016           imul ax, ax, 0x16                        
  0f28  ba0000           mov dx, 0                                
  0f2b  81c28088         add dx, 0x8880                           
  0f2f  03c2             add ax, dx                               
  0f31  681d1e           push 0x1e1d                              
  0f34  50               push ax                                  
  0f35  0e               push cs                                  
  0f36  e8eefc           call 0xc27                               
  0f39  83c404           add sp, 4                                
  0f3c  8bde             mov bx, si                               
  0f3e  d1e3             shl bx, 1                                
  0f40  8b97e40c         mov dx, word ptr [bx + 0xce4]            
  0f44  03d0             add dx, ax                               
  0f46  8956fe           mov word ptr [bp - 2], dx                
  0f49  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  0f4d  d1e3             shl bx, 1                                
  0f4f  8b870e44         mov ax, word ptr [bx + 0x440e]           
  0f53  6bc016           imul ax, ax, 0x16                        
  0f56  ba0000           mov dx, 0                                
  0f59  81c28088         add dx, 0x8880                           
  0f5d  03c2             add ax, dx                               
  0f5f  681d1e           push 0x1e1d                              
  0f62  50               push ax                                  
  0f63  0e               push cs                                  
  0f64  e846fd           call 0xcad                               
  0f67  83c404           add sp, 4                                
  0f6a  50               push ax                                  
  0f6b  1e               push ds                                  
  0f6c  68bb0d           push 0xdbb                               
  0f6f  16               push ss                                  
  0f70  8d46ea           lea ax, [bp - 0x16]                      
  0f73  50               push ax                                  
  0f74  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f79  83c40a           add sp, 0xa                              
  0f7c  16               push ss                                  
  0f7d  8d46ea           lea ax, [bp - 0x16]                      
  0f80  50               push ax                                  
  0f81  66688801a500     push 0xa50188                            
  0f87  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0f8c  83c408           add sp, 8                                
  0f8f  ff76fe           push word ptr [bp - 2]                   
  0f92  1e               push ds                                  
  0f93  68bf0d           push 0xdbf                               
  0f96  16               push ss                                  
  0f97  8d46ea           lea ax, [bp - 0x16]                      
  0f9a  50               push ax                                  
  0f9b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0fa0  83c40a           add sp, 0xa                              
  0fa3  16               push ss                                  
  0fa4  8d46ea           lea ax, [bp - 0x16]                      
  0fa7  50               push ax                                  
  0fa8  66688801b900     push 0xb90188                            
  0fae  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0fb3  83c408           add sp, 8                                
  0fb6  0e               push cs                                  
  0fb7  e866f6           call 0x620                               
  0fba  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0fbf  5e               pop si                                   
  0fc0  c9               leave                                    
  0fc1  cb               retf                                     

ovl40_0fc2:  ; ENTRY
  0fc2  55               push bp                                  
  0fc3  8bec             mov bp, sp                               
  0fc5  56               push si                                  
  0fc6  57               push di                                  
  0fc7  33ff             xor di, di                               
  0fc9  33f6             xor si, si                               
  0fcb  eb1e             jmp 0xfeb                                
  0fcd  8bde             mov bx, si                               
  0fcf  d1e3             shl bx, 1                                
  0fd1  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0fd5  6bdb1d           imul bx, bx, 0x1d                        
  0fd8  b8042c           mov ax, 0x2c04                           
  0fdb  8ec0             mov es, ax                               
  0fdd  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  0fe3  7505             jne 0xfea                                
  0fe5  bf0100           mov di, 1                                
  0fe8  eb07             jmp 0xff1                                
  0fea  46               inc si                                   
  0feb  3b362e48         cmp si, word ptr [0x482e]                
  0fef  7cdc             jl 0xfcd                                 
  0ff1  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0ff6  0bff             or di, di                                
  0ff8  7430             je 0x102a                                
  0ffa  c7066c0d0100     mov word ptr [0xd6c], 1                  
  1000  0bf6             or si, si                                
  1002  7e05             jle 0x1009                               
  1004  8bc6             mov ax, si                               
  1006  48               dec ax                                   
  1007  eb03             jmp 0x100c                               
  1009  b8ffff           mov ax, 0xffff                           
  100c  a30844           mov word ptr [0x4408], ax                
  100f  89360a44         mov word ptr [0x440a], si                
  1013  a12e48           mov ax, word ptr [0x482e]                
  1016  48               dec ax                                   
  1017  3bc6             cmp ax, si                               
  1019  7e05             jle 0x1020                               
  101b  8bc6             mov ax, si                               
  101d  40               inc ax                                   
  101e  eb03             jmp 0x1023                               
  1020  b8ffff           mov ax, 0xffff                           
  1023  a30c44           mov word ptr [0x440c], ax                
  1026  0e               push cs                                  
  1027  e8faf6           call 0x724                               
  102a  0e               push cs                                  
  102b  e8f2f5           call 0x620                               
  102e  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1033  5f               pop di                                   
  1034  5e               pop si                                   
  1035  5d               pop bp                                   
  1036  cb               retf                                     

ovl40_1037:  ; ENTRY
  1037  55               push bp                                  
  1038  8bec             mov bp, sp                               
  103a  56               push si                                  
  103b  57               push di                                  
  103c  33ff             xor di, di                               
  103e  33f6             xor si, si                               
  1040  eb1e             jmp 0x1060                               
  1042  8bde             mov bx, si                               
  1044  d1e3             shl bx, 1                                
  1046  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  104a  6bdb1d           imul bx, bx, 0x1d                        
  104d  b8042c           mov ax, 0x2c04                           
  1050  8ec0             mov es, ax                               
  1052  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  1058  7505             jne 0x105f                               
  105a  bf0100           mov di, 1                                
  105d  eb07             jmp 0x1066                               
  105f  46               inc si                                   
  1060  3b362e48         cmp si, word ptr [0x482e]                
  1064  7cdc             jl 0x1042                                
  1066  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  106b  0bff             or di, di                                
  106d  7430             je 0x109f                                
  106f  c7066c0d0000     mov word ptr [0xd6c], 0                  
  1075  0bf6             or si, si                                
  1077  7e05             jle 0x107e                               
  1079  8bc6             mov ax, si                               
  107b  48               dec ax                                   
  107c  eb03             jmp 0x1081                               
  107e  b8ffff           mov ax, 0xffff                           
  1081  a30844           mov word ptr [0x4408], ax                
  1084  89360a44         mov word ptr [0x440a], si                
  1088  a12e48           mov ax, word ptr [0x482e]                
  108b  48               dec ax                                   
  108c  3bc6             cmp ax, si                               
  108e  7e05             jle 0x1095                               
  1090  8bc6             mov ax, si                               
  1092  40               inc ax                                   
  1093  eb03             jmp 0x1098                               
  1095  b8ffff           mov ax, 0xffff                           
  1098  a30c44           mov word ptr [0x440c], ax                
  109b  0e               push cs                                  
  109c  e885f6           call 0x724                               
  109f  0e               push cs                                  
  10a0  e87df5           call 0x620                               
  10a3  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  10a8  5f               pop di                                   
  10a9  5e               pop si                                   
  10aa  5d               pop bp                                   
  10ab  cb               retf                                     

ovl40_10ac:  ; ENTRY
  10ac  55               push bp                                  
  10ad  8bec             mov bp, sp                               
  10af  56               push si                                  
  10b0  666a00           push 0                                   
  10b3  666800000100     push 0x10000                             
  10b9  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  10be  83c408           add sp, 8                                
  10c1  33f6             xor si, si                               
  10c3  eb44             jmp 0x1109                               
  10c5  8bde             mov bx, si                               
  10c7  d1e3             shl bx, 1                                
  10c9  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  10cd  6bdb16           imul bx, bx, 0x16                        
  10d0  b81d1e           mov ax, 0x1e1d                           
  10d3  ba0000           mov dx, 0                                
  10d6  81c28088         add dx, 0x8880                           
  10da  03da             add bx, dx                               
  10dc  8ec0             mov es, ax                               
  10de  268b17           mov dx, word ptr es:[bx]                 
  10e1  8bde             mov bx, si                               
  10e3  d1e3             shl bx, 1                                
  10e5  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  10e9  6bdb16           imul bx, bx, 0x16                        
  10ec  b81d1e           mov ax, 0x1e1d                           
  10ef  8ec0             mov es, ax                               
  10f1  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  10f6  3b366a0d         cmp si, word ptr [0xd6a]                 
  10fa  740c             je 0x1108                                
  10fc  6a00             push 0                                   
  10fe  53               push bx                                  
  10ff  52               push dx                                  
  1100  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  1105  83c406           add sp, 6                                
  1108  46               inc si                                   
  1109  3b36680d         cmp si, word ptr [0xd68]                 
  110d  7cb6             jl 0x10c5                                
  110f  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  1113  d1e3             shl bx, 1                                
  1115  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  1119  6bdb16           imul bx, bx, 0x16                        
  111c  b81d1e           mov ax, 0x1e1d                           
  111f  ba0000           mov dx, 0                                
  1122  81c28088         add dx, 0x8880                           
  1126  03da             add bx, dx                               
  1128  8ec0             mov es, ax                               
  112a  268b17           mov dx, word ptr es:[bx]                 
  112d  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  1131  d1e3             shl bx, 1                                
  1133  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  1137  6bdb16           imul bx, bx, 0x16                        
  113a  b81d1e           mov ax, 0x1e1d                           
  113d  8ec0             mov es, ax                               
  113f  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  1144  6a01             push 1                                   
  1146  53               push bx                                  
  1147  52               push dx                                  
  1148  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  114d  83c406           add sp, 6                                
  1150  666a00           push 0                                   
  1153  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  1158  83c404           add sp, 4                                
  115b  5e               pop si                                   
  115c  5d               pop bp                                   
  115d  cb               retf                                     

ovl40_115e:  ; ENTRY
  115e  55               push bp                                  
  115f  8bec             mov bp, sp                               
  1161  56               push si                                  
  1162  57               push di                                  
  1163  bfe803           mov di, 0x3e8                            
  1166  33f6             xor si, si                               
  1168  eb4c             jmp 0x11b6                               
  116a  8bde             mov bx, si                               
  116c  d1e3             shl bx, 1                                
  116e  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  1172  6bdb16           imul bx, bx, 0x16                        
  1175  b81d1e           mov ax, 0x1e1d                           
  1178  8ec0             mov es, ax                               
  117a  26ffb78288       push word ptr es:[bx - 0x777e]           
  117f  8bde             mov bx, si                               
  1181  d1e3             shl bx, 1                                
  1183  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  1187  6bdb16           imul bx, bx, 0x16                        
  118a  b81d1e           mov ax, 0x1e1d                           
  118d  ba0000           mov dx, 0                                
  1190  81c28088         add dx, 0x8880                           
  1194  03da             add bx, dx                               
  1196  8ec0             mov es, ax                               
  1198  26ff37           push word ptr es:[bx]                    
  119b  ff7608           push word ptr [bp + 8]                   
  119e  ff7606           push word ptr [bp + 6]                   
  11a1  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  11a6  83c408           add sp, 8                                
  11a9  8bd0             mov dx, ax                               
  11ab  3bd7             cmp dx, di                               
  11ad  7d06             jge 0x11b5                               
  11af  8bfa             mov di, dx                               
  11b1  89366a0d         mov word ptr [0xd6a], si                 
  11b5  46               inc si                                   
  11b6  3b36680d         cmp si, word ptr [0xd68]                 
  11ba  7cae             jl 0x116a                                
  11bc  c7066c0d0000     mov word ptr [0xd6c], 0                  
  11c2  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  11c7  0e               push cs                                  
  11c8  e82eef           call 0xf9                                
  11cb  0e               push cs                                  
  11cc  e8ddfe           call 0x10ac                              
  11cf  0e               push cs                                  
  11d0  e84df4           call 0x620                               
  11d3  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  11d8  5f               pop di                                   
  11d9  5e               pop si                                   
  11da  5d               pop bp                                   
  11db  cb               retf                                     

ovl40_11dc:  ; ENTRY
  11dc  55               push bp                                  
  11dd  8bec             mov bp, sp                               
  11df  83ec18           sub sp, 0x18                             
  11e2  56               push si                                  
  11e3  57               push di                                  
  11e4  8b7e06           mov di, word ptr [bp + 6]                
  11e7  833e741100       cmp word ptr [0x1174], 0                 
  11ec  7403             je 0x11f1                                
  11ee  e95501           jmp 0x1346                               
  11f1  8bc7             mov ax, di                               
  11f3  05d0fe           add ax, 0xfed0                           
  11f6  bb2000           mov bx, 0x20                             
  11f9  99               cdq                                      
  11fa  f7fb             idiv bx                                  
  11fc  8bf0             mov si, ax                               
  11fe  0bf6             or si, si                                
  1200  7d02             jge 0x1204                               
  1202  33f6             xor si, si                               
  1204  83fe07           cmp si, 7                                
  1207  7e03             jle 0x120c                               
  1209  be0700           mov si, 7                                
  120c  16               push ss                                  
  120d  8d46fe           lea ax, [bp - 2]                         
  1210  50               push ax                                  
  1211  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  1215  d1e3             shl bx, 1                                
  1217  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  121b  6bdb16           imul bx, bx, 0x16                        
  121e  b81d1e           mov ax, 0x1e1d                           
  1221  8ec0             mov es, ax                               
  1223  26ffb78288       push word ptr es:[bx - 0x777e]           
  1228  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  122c  d1e3             shl bx, 1                                
  122e  8b9f0e44         mov bx, word ptr [bx + 0x440e]           
  1232  6bdb16           imul bx, bx, 0x16                        
  1235  b81d1e           mov ax, 0x1e1d                           
  1238  8ec0             mov es, ax                               
  123a  26ffb78088       push word ptr es:[bx - 0x7780]           
  123f  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  1244  83c408           add sp, 8                                
  1247  3b76fe           cmp si, word ptr [bp - 2]                
  124a  7c39             jl 0x1285                                
  124c  6a00             push 0                                   
  124e  ff7608           push word ptr [bp + 8]                   
  1251  57               push di                                  
  1252  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1257  83c406           add sp, 6                                
  125a  666884000100     push 0x10084                             
  1260  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1265  83c404           add sp, 4                                
  1268  52               push dx                                  
  1269  50               push ax                                  
  126a  666884000000     push 0x84                                
  1270  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1275  83c404           add sp, 4                                
  1278  52               push dx                                  
  1279  50               push ax                                  
  127a  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  127f  83c408           add sp, 8                                
  1282  e9bb00           jmp 0x1340                               
  1285  33c9             xor cx, cx                               
  1287  c746fc0100       mov word ptr [bp - 4], 1                 
  128c  eb4d             jmp 0x12db                               
  128e  8b1e6a0d         mov bx, word ptr [0xd6a]                 
  1292  d1e3             shl bx, 1                                
  1294  8b870e44         mov ax, word ptr [bx + 0x440e]           
  1298  6bc016           imul ax, ax, 0x16                        
  129b  ba1d1e           mov dx, 0x1e1d                           
  129e  bb0000           mov bx, 0                                
  12a1  81c38088         add bx, 0x8880                           
  12a5  03c3             add ax, bx                               
  12a7  8bd9             mov bx, cx                               
  12a9  c1e302           shl bx, 2                                
  12ac  3b97205e         cmp dx, word ptr [bx + 0x5e20]           
  12b0  7516             jne 0x12c8                               
  12b2  3b871e5e         cmp ax, word ptr [bx + 0x5e1e]           
  12b6  7510             jne 0x12c8                               
  12b8  8bd9             mov bx, cx                               
  12ba  d1e3             shl bx, 1                                
  12bc  8d46e8           lea ax, [bp - 0x18]                      
  12bf  03d8             add bx, ax                               
  12c1  36c7070000       mov word ptr ss:[bx], 0                  
  12c6  eb12             jmp 0x12da                               
  12c8  8bd9             mov bx, cx                               
  12ca  d1e3             shl bx, 1                                
  12cc  8d46e8           lea ax, [bp - 0x18]                      
  12cf  03d8             add bx, ax                               
  12d1  8b46fc           mov ax, word ptr [bp - 4]                
  12d4  368907           mov word ptr ss:[bx], ax                 
  12d7  ff46fc           inc word ptr [bp - 4]                    
  12da  41               inc cx                                   
  12db  3b4efe           cmp cx, word ptr [bp - 2]                
  12de  7cae             jl 0x128e                                
  12e0  33c9             xor cx, cx                               
  12e2  eb24             jmp 0x1308                               
  12e4  8bd9             mov bx, cx                               
  12e6  d1e3             shl bx, 1                                
  12e8  8d46e8           lea ax, [bp - 0x18]                      
  12eb  03d8             add bx, ax                               
  12ed  363937           cmp word ptr ss:[bx], si                 
  12f0  7515             jne 0x1307                               
  12f2  8bd9             mov bx, cx                               
  12f4  c1e302           shl bx, 2                                
  12f7  8b87205e         mov ax, word ptr [bx + 0x5e20]           
  12fb  8b971e5e         mov dx, word ptr [bx + 0x5e1e]           
  12ff  8946fa           mov word ptr [bp - 6], ax                
  1302  8956f8           mov word ptr [bp - 8], dx                
  1305  eb06             jmp 0x130d                               
  1307  41               inc cx                                   
  1308  3b4efe           cmp cx, word ptr [bp - 2]                
  130b  7cd7             jl 0x12e4                                
  130d  ff7608           push word ptr [bp + 8]                   
  1310  57               push di                                  
  1311  c45ef8           les bx, ptr [bp - 8]                     
  1314  268a470a         mov al, byte ptr es:[bx + 0xa]           
  1318  98               cwde                                     
  1319  50               push ax                                  
  131a  268a4707         mov al, byte ptr es:[bx + 7]             
  131e  98               cwde                                     
  131f  50               push ax                                  
  1320  268a470b         mov al, byte ptr es:[bx + 0xb]           
  1324  98               cwde                                     
  1325  50               push ax                                  
  1326  268a4708         mov al, byte ptr es:[bx + 8]             
  132a  98               cwde                                     
  132b  50               push ax                                  
  132c  268a4706         mov al, byte ptr es:[bx + 6]             
  1330  98               cwde                                     
  1331  50               push ax                                  
  1332  268a4704         mov al, byte ptr es:[bx + 4]             
  1336  98               cwde                                     
  1337  50               push ax                                  
  1338  9a43006c30       lcall 0x306c, 0x43                       -> ovl46:0626
  133d  83c410           add sp, 0x10                             
  1340  c70674110100     mov word ptr [0x1174], 1                 
  1346  5f               pop di                                   
  1347  5e               pop si                                   
  1348  c9               leave                                    
  1349  cb               retf                                     
