; ovl02 stub 2f62 file_off 0x3e4f0 size 0x5af

ovl02_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7e06           mov di, word ptr [bp + 6]                
  000b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0010  90               nop                                      
  0011  0e               push cs                                  
  0012  e8a001           call 0x1b5                               
  0015  66689b020000     push 0x29b                               
  001b  6a20             push 0x20                                
  001d  666860a50000     push 0xa560                              
  0023  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0028  83c40a           add sp, 0xa                              
  002b  8956fe           mov word ptr [bp - 2], dx                
  002e  8946fc           mov word ptr [bp - 4], ax                
  0031  52               push dx                                  
  0032  50               push ax                                  
  0033  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0038  83c404           add sp, 4                                
  003b  89168c3f         mov word ptr [0x3f8c], dx                
  003f  a38a3f           mov word ptr [0x3f8a], ax                
  0042  6a02             push 2                                   
  0044  1e               push ds                                  
  0045  686202           push 0x262                                ; "RANDOM\RANDOM.DAT"
  0048  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  004d  83c406           add sp, 6                                
  0050  8bf0             mov si, ax                               
  0052  0bf6             or si, si                                
  0054  7d14             jge 0x6a                                 
  0056  1e               push ds                                  
  0057  687402           push 0x274                                ; "Random data not found"
  005a  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  005f  83c404           add sp, 4                                
  0062  9ab5024c0a       lcall 0xa4c, 0x2b5                       -> 0a4c:02b5
  0067  e9ae00           jmp 0x118                                
  006a  6860a5           push 0xa560                              
  006d  66ff368a3f       push dword ptr [0x3f8a]                  
  0072  56               push si                                  
  0073  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0078  83c408           add sp, 8                                
  007b  56               push si                                  
  007c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0081  59               pop cx                                   
  0082  8b460a           mov ax, word ptr [bp + 0xa]              
  0085  d1e0             shl ax, 1                                
  0087  c41e8a3f         les bx, ptr [0x3f8a]                     
  008b  03d8             add bx, ax                               
  008d  268b476e         mov ax, word ptr es:[bx + 0x6e]          
  0091  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0095  2601472a         add word ptr es:[bx + 0x2a], ax          
  0099  8b460c           mov ax, word ptr [bp + 0xc]              
  009c  d1e0             shl ax, 1                                
  009e  03d8             add bx, ax                               
  00a0  268b4760         mov ax, word ptr es:[bx + 0x60]          
  00a4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00a8  2601473c         add word ptr es:[bx + 0x3c], ax          
  00ac  8b4608           mov ax, word ptr [bp + 8]                
  00af  d1e0             shl ax, 1                                
  00b1  03d8             add bx, ax                               
  00b3  268b4744         mov ax, word ptr es:[bx + 0x44]          
  00b7  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00bb  26014736         add word ptr es:[bx + 0x36], ax          
  00bf  8b4608           mov ax, word ptr [bp + 8]                
  00c2  d1e0             shl ax, 1                                
  00c4  03d8             add bx, ax                               
  00c6  268b4744         mov ax, word ptr es:[bx + 0x44]          
  00ca  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00ce  26014734         add word ptr es:[bx + 0x34], ax          
  00d2  8bc7             mov ax, di                               
  00d4  d1e0             shl ax, 1                                
  00d6  03d8             add bx, ax                               
  00d8  268b4752         mov ax, word ptr es:[bx + 0x52]          
  00dc  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00e0  26014738         add word ptr es:[bx + 0x38], ax          
  00e4  8bc7             mov ax, di                               
  00e6  d1e0             shl ax, 1                                
  00e8  03d8             add bx, ax                               
  00ea  268b4752         mov ax, word ptr es:[bx + 0x52]          
  00ee  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00f2  2601473a         add word ptr es:[bx + 0x3a], ax          
  00f6  90               nop                                      
  00f7  0e               push cs                                  
  00f8  e82100           call 0x11c                               
  00fb  66ff76fc         push dword ptr [bp - 4]                  
  00ff  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0104  83c404           add sp, 4                                
  0107  66ff76fc         push dword ptr [bp - 4]                  
  010b  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  0110  83c404           add sp, 4                                
  0113  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0118  5f               pop di                                   
  0119  5e               pop si                                   
  011a  c9               leave                                    
  011b  cb               retf                                     

ovl02_011c:  ; ENTRY
  011c  55               push bp                                  
  011d  8bec             mov bp, sp                               
  011f  6a00             push 0                                   
  0121  90               nop                                      
  0122  0e               push cs                                  
  0123  e8d900           call 0x1ff                               
  0126  59               pop cx                                   
  0127  9a2f00832f       lcall 0x2f83, 0x2f                       -> ovl09:1001
  012c  90               nop                                      
  012d  0e               push cs                                  
  012e  e83a02           call 0x36b                               
  0131  9a2000672f       lcall 0x2f67, 0x20                       -> ovl03:0000
  0136  6a0a             push 0xa                                 
  0138  90               nop                                      
  0139  0e               push cs                                  
  013a  e8c200           call 0x1ff                               
  013d  59               pop cx                                   
  013e  9a20006f2f       lcall 0x2f6f, 0x20                       -> ovl04:0000
  0143  6a14             push 0x14                                
  0145  90               nop                                      
  0146  0e               push cs                                  
  0147  e8b500           call 0x1ff                               
  014a  59               pop cx                                   
  014b  9a20007c2f       lcall 0x2f7c, 0x20                       -> ovl07:0000
  0150  6a1e             push 0x1e                                
  0152  90               nop                                      
  0153  0e               push cs                                  
  0154  e8a800           call 0x1ff                               
  0157  59               pop cx                                   
  0158  9a2000792f       lcall 0x2f79, 0x20                       -> ovl06:0000
  015d  6a28             push 0x28                                
  015f  90               nop                                      
  0160  0e               push cs                                  
  0161  e89b00           call 0x1ff                               
  0164  59               pop cx                                   
  0165  9a2000752f       lcall 0x2f75, 0x20                       -> ovl05:0000
  016a  6a32             push 0x32                                
  016c  90               nop                                      
  016d  0e               push cs                                  
  016e  e88e00           call 0x1ff                               
  0171  59               pop cx                                   
  0172  9a2a00802f       lcall 0x2f80, 0x2a                       -> ovl08:0000
  0177  6a3c             push 0x3c                                
  0179  90               nop                                      
  017a  0e               push cs                                  
  017b  e88100           call 0x1ff                               
  017e  59               pop cx                                   
  017f  9a20008d2f       lcall 0x2f8d, 0x20                       -> ovl11:0000
  0184  6a46             push 0x46                                
  0186  90               nop                                      
  0187  0e               push cs                                  
  0188  e87400           call 0x1ff                               
  018b  59               pop cx                                   
  018c  9a34008d2f       lcall 0x2f8d, 0x34                       -> ovl11:003a
  0191  6a50             push 0x50                                
  0193  90               nop                                      
  0194  0e               push cs                                  
  0195  e86700           call 0x1ff                               
  0198  59               pop cx                                   
  0199  9a2000942f       lcall 0x2f94, 0x20                       -> ovl12:0000
  019e  6a5a             push 0x5a                                
  01a0  90               nop                                      
  01a1  0e               push cs                                  
  01a2  e85a00           call 0x1ff                               
  01a5  59               pop cx                                   
  01a6  9a2500832f       lcall 0x2f83, 0x25                       -> ovl09:0014
  01ab  6a64             push 0x64                                
  01ad  90               nop                                      
  01ae  0e               push cs                                  
  01af  e84d00           call 0x1ff                               
  01b2  59               pop cx                                   
  01b3  5d               pop bp                                   
  01b4  cb               retf                                     

ovl02_01b5:  ; ENTRY
  01b5  55               push bp                                  
  01b6  8bec             mov bp, sp                               
  01b8  83ec08           sub sp, 8                                
  01bb  6a00             push 0                                   
  01bd  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  01c2  59               pop cx                                   
  01c3  9a4300ac2f       lcall 0x2fac, 0x43                       -> ovl17:093a
  01c8  3d1700           cmp ax, 0x17                             
  01cb  7525             jne 0x1f2                                
  01cd  6668c0001900     push 0x1900c0                            
  01d3  68ff00           push 0xff                                
  01d6  68e800           push 0xe8                                
  01d9  16               push ss                                  
  01da  8d46f8           lea ax, [bp - 8]                         
  01dd  50               push ax                                  
  01de  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  01e3  83c40c           add sp, 0xc                              
  01e6  52               push dx                                  
  01e7  50               push ax                                  
  01e8  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  01ed  83c404           add sp, 4                                
  01f0  eb0b             jmp 0x1fd                                
  01f2  6668c0001900     push 0x1900c0                            
  01f8  680f01           push 0x10f                               
  01fb  ebd9             jmp 0x1d6                                
  01fd  c9               leave                                    
  01fe  cb               retf                                     

ovl02_01ff:  ; ENTRY
  01ff  55               push bp                                  
  0200  8bec             mov bp, sp                               
  0202  83ec1e           sub sp, 0x1e                             
  0205  56               push si                                  
  0206  8b7606           mov si, word ptr [bp + 6]                
  0209  83c60a           add si, 0xa                              
  020c  c746fc1500       mov word ptr [bp - 4], 0x15              
  0211  8bc6             mov ax, si                               
  0213  bb0a00           mov bx, 0xa                              
  0216  99               cdq                                      
  0217  f7fb             idiv bx                                  
  0219  c1e004           shl ax, 4                                
  021c  051000           add ax, 0x10                             
  021f  8946fe           mov word ptr [bp - 2], ax                
  0222  ff76fc           push word ptr [bp - 4]                   
  0225  50               push ax                                  
  0226  666a00           push 0                                   
  0229  16               push ss                                  
  022a  8d46f0           lea ax, [bp - 0x10]                      
  022d  50               push ax                                  
  022e  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0233  83c40c           add sp, 0xc                              
  0236  9a4300ac2f       lcall 0x2fac, 0x43                       -> ovl17:093a
  023b  3d1700           cmp ax, 0x17                             
  023e  7505             jne 0x245                                
  0240  680101           push 0x101                               
  0243  eb03             jmp 0x248                                
  0245  681101           push 0x111                               
  0248  68e800           push 0xe8                                
  024b  16               push ss                                  
  024c  8d46ec           lea ax, [bp - 0x14]                      
  024f  50               push ax                                  
  0250  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0255  83c408           add sp, 8                                
  0258  66ff76ec         push dword ptr [bp - 0x14]               
  025c  8d46f0           lea ax, [bp - 0x10]                      
  025f  8cd2             mov dx, ss                               
  0261  b90800           mov cx, 8                                
  0264  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0269  6a36             push 0x36                                
  026b  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0270  83c40e           add sp, 0xe                              
  0273  6a0f             push 0xf                                 
  0275  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  027a  59               pop cx                                   
  027b  16               push ss                                  
  027c  8d46f8           lea ax, [bp - 8]                         
  027f  50               push ax                                  
  0280  16               push ss                                  
  0281  8d46fa           lea ax, [bp - 6]                         
  0284  50               push ax                                  
  0285  9a3e00ac2f       lcall 0x2fac, 0x3e                       -> ovl17:08f6
  028a  83c408           add sp, 8                                
  028d  9a4300ac2f       lcall 0x2fac, 0x43                       -> ovl17:093a
  0292  3d1700           cmp ax, 0x17                             
  0295  756e             jne 0x305                                
  0297  666840001100     push 0x110040                            
  029d  b8ed00           mov ax, 0xed                             
  02a0  2b46f8           sub ax, word ptr [bp - 8]                
  02a3  50               push ax                                  
  02a4  b82801           mov ax, 0x128                            
  02a7  2b46fa           sub ax, word ptr [bp - 6]                
  02aa  50               push ax                                  
  02ab  16               push ss                                  
  02ac  8d46f0           lea ax, [bp - 0x10]                      
  02af  50               push ax                                  
  02b0  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  02b5  83c40c           add sp, 0xc                              
  02b8  66ff76f4         push dword ptr [bp - 0xc]                
  02bc  66ff76f0         push dword ptr [bp - 0x10]               
  02c0  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  02c5  83c408           add sp, 8                                
  02c8  666807000100     push 0x10007                             
  02ce  666a02           push 2                                   
  02d1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  02d6  83c408           add sp, 8                                
  02d9  8bc6             mov ax, si                               
  02db  05f6ff           add ax, 0xfff6                           
  02de  50               push ax                                  
  02df  1e               push ds                                  
  02e0  688a02           push 0x28a                               
  02e3  16               push ss                                  
  02e4  8d46e2           lea ax, [bp - 0x1e]                      
  02e7  50               push ax                                  
  02e8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02ed  83c40a           add sp, 0xa                              
  02f0  16               push ss                                  
  02f1  8d46e2           lea ax, [bp - 0x1e]                      
  02f4  50               push ax                                  
  02f5  68ed00           push 0xed                                
  02f8  684801           push 0x148                               
  02fb  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0300  83c408           add sp, 8                                
  0303  eb63             jmp 0x368                                
  0305  666840001100     push 0x110040                            
  030b  b8fd00           mov ax, 0xfd                             
  030e  2b46f8           sub ax, word ptr [bp - 8]                
  0311  50               push ax                                  
  0312  b82801           mov ax, 0x128                            
  0315  2b46fa           sub ax, word ptr [bp - 6]                
  0318  50               push ax                                  
  0319  16               push ss                                  
  031a  8d46f0           lea ax, [bp - 0x10]                      
  031d  50               push ax                                  
  031e  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0323  83c40c           add sp, 0xc                              
  0326  66ff76f4         push dword ptr [bp - 0xc]                
  032a  66ff76f0         push dword ptr [bp - 0x10]               
  032e  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0333  83c408           add sp, 8                                
  0336  666807000100     push 0x10007                             
  033c  666a02           push 2                                   
  033f  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0344  83c408           add sp, 8                                
  0347  8bc6             mov ax, si                               
  0349  05f6ff           add ax, 0xfff6                           
  034c  50               push ax                                  
  034d  1e               push ds                                  
  034e  688e02           push 0x28e                               
  0351  16               push ss                                  
  0352  8d46e2           lea ax, [bp - 0x1e]                      
  0355  50               push ax                                  
  0356  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  035b  83c40a           add sp, 0xa                              
  035e  16               push ss                                  
  035f  8d46e2           lea ax, [bp - 0x1e]                      
  0362  50               push ax                                  
  0363  68fd00           push 0xfd                                
  0366  eb90             jmp 0x2f8                                
  0368  5e               pop si                                   
  0369  c9               leave                                    
  036a  cb               retf                                     

ovl02_036b:  ; ENTRY
  036b  55               push bp                                  
  036c  8bec             mov bp, sp                               
  036e  33d2             xor dx, dx                               
  0370  eb31             jmp 0x3a3                                
  0372  33c9             xor cx, cx                               
  0374  eb26             jmp 0x39c                                
  0376  8bc1             mov ax, cx                               
  0378  6bc070           imul ax, ax, 0x70                        
  037b  c41e8a3f         les bx, ptr [0x3f8a]                     
  037f  03d8             add bx, ax                               
  0381  03da             add bx, dx                               
  0383  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0389  8bd9             mov bx, cx                               
  038b  6bdb70           imul bx, bx, 0x70                        
  038e  03da             add bx, dx                               
  0390  b8d919           mov ax, 0x19d9                           
  0393  8ec0             mov es, ax                               
  0395  2680a70000e0     and byte ptr es:[bx], 0xe0               
  039b  41               inc cx                                   
  039c  81f99c00         cmp cx, 0x9c                             
  03a0  7cd4             jl 0x376                                 
  03a2  42               inc dx                                   
  03a3  83fa70           cmp dx, 0x70                             
  03a6  7cca             jl 0x372                                 
  03a8  5d               pop bp                                   
  03a9  cb               retf                                     

ovl02_03aa:  ; ENTRY
  03aa  55               push bp                                  
  03ab  8bec             mov bp, sp                               
  03ad  56               push si                                  
  03ae  57               push di                                  
  03af  8b5606           mov dx, word ptr [bp + 6]                
  03b2  8b4e08           mov cx, word ptr [bp + 8]                
  03b5  833ec22600       cmp word ptr [0x26c2], 0                 
  03ba  7503             jne 0x3bf                                
  03bc  e98600           jmp 0x445                                
  03bf  8bd9             mov bx, cx                               
  03c1  6bdb70           imul bx, bx, 0x70                        
  03c4  03da             add bx, dx                               
  03c6  b8d919           mov ax, 0x19d9                           
  03c9  8ec0             mov es, ax                               
  03cb  268a870000       mov al, byte ptr es:[bx]                 
  03d0  251f00           and ax, 0x1f                             
  03d3  0bc0             or ax, ax                                
  03d5  7406             je 0x3dd                                 
  03d7  c41e8a3f         les bx, ptr [0x3f8a]                     
  03db  eb1b             jmp 0x3f8                                
  03dd  8bc1             mov ax, cx                               
  03df  6bc070           imul ax, ax, 0x70                        
  03e2  c41e8a3f         les bx, ptr [0x3f8a]                     
  03e6  03d8             add bx, ax                               
  03e8  03da             add bx, dx                               
  03ea  268a872061       mov al, byte ptr es:[bx + 0x6120]        
  03ef  98               cwde                                     
  03f0  d1e0             shl ax, 1                                
  03f2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  03f6  03d8             add bx, ax                               
  03f8  268b1f           mov bx, word ptr es:[bx]                 
  03fb  8bf2             mov si, dx                               
  03fd  d1e6             shl si, 1                                
  03ff  81c69001         add si, 0x190                            
  0403  8bf9             mov di, cx                               
  0405  d1e7             shl di, 1                                
  0407  83c71e           add di, 0x1e                             
  040a  53               push bx                                  
  040b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0410  59               pop cx                                   
  0411  57               push di                                  
  0412  56               push si                                  
  0413  9a6500d014       lcall 0x14d0, 0x65                       -> 14d0:0065
  0418  83c404           add sp, 4                                
  041b  57               push di                                  
  041c  8bc6             mov ax, si                               
  041e  40               inc ax                                   
  041f  50               push ax                                  
  0420  9a6500d014       lcall 0x14d0, 0x65                       -> 14d0:0065
  0425  83c404           add sp, 4                                
  0428  8bc7             mov ax, di                               
  042a  40               inc ax                                   
  042b  50               push ax                                  
  042c  56               push si                                  
  042d  9a6500d014       lcall 0x14d0, 0x65                       -> 14d0:0065
  0432  83c404           add sp, 4                                
  0435  8bc7             mov ax, di                               
  0437  40               inc ax                                   
  0438  50               push ax                                  
  0439  8bc6             mov ax, si                               
  043b  40               inc ax                                   
  043c  50               push ax                                  
  043d  9a6500d014       lcall 0x14d0, 0x65                       -> 14d0:0065
  0442  83c404           add sp, 4                                
  0445  5f               pop di                                   
  0446  5e               pop si                                   
  0447  5d               pop bp                                   
  0448  cb               retf                                     

ovl02_0449:  ; ENTRY
  0449  55               push bp                                  
  044a  8bec             mov bp, sp                               
  044c  56               push si                                  
  044d  57               push di                                  
  044e  33f6             xor si, si                               
  0450  eb15             jmp 0x467                                
  0452  33ff             xor di, di                               
  0454  eb0a             jmp 0x460                                
  0456  57               push di                                  
  0457  56               push si                                  
  0458  0e               push cs                                  
  0459  e84eff           call 0x3aa                               
  045c  83c404           add sp, 4                                
  045f  47               inc di                                   
  0460  81ff9c00         cmp di, 0x9c                             
  0464  7cf0             jl 0x456                                 
  0466  46               inc si                                   
  0467  83fe70           cmp si, 0x70                             
  046a  7ce6             jl 0x452                                 
  046c  5f               pop di                                   
  046d  5e               pop si                                   
  046e  5d               pop bp                                   
  046f  cb               retf                                     

ovl02_0470:  ; ENTRY
  0470  55               push bp                                  
  0471  8bec             mov bp, sp                               
  0473  c45e06           les bx, ptr [bp + 6]                     
  0476  26833f00         cmp word ptr es:[bx], 0                  
  047a  7f05             jg 0x481                                 
  047c  26c7070000       mov word ptr es:[bx], 0                  
  0481  c45e0a           les bx, ptr [bp + 0xa]                   
  0484  26833f00         cmp word ptr es:[bx], 0                  
  0488  7f05             jg 0x48f                                 
  048a  26c7070000       mov word ptr es:[bx], 0                  
  048f  c45e06           les bx, ptr [bp + 6]                     
  0492  26833f70         cmp word ptr es:[bx], 0x70               
  0496  7c05             jl 0x49d                                 
  0498  26c7076f00       mov word ptr es:[bx], 0x6f               
  049d  c45e0a           les bx, ptr [bp + 0xa]                   
  04a0  26813f9c00       cmp word ptr es:[bx], 0x9c               
  04a5  7c05             jl 0x4ac                                 
  04a7  26c7079b00       mov word ptr es:[bx], 0x9b               
  04ac  5d               pop bp                                   
  04ad  cb               retf                                     

ovl02_04ae:  ; ENTRY
  04ae  55               push bp                                  
  04af  8bec             mov bp, sp                               
  04b1  56               push si                                  
  04b2  57               push di                                  
  04b3  8b760e           mov si, word ptr [bp + 0xe]              
  04b6  66680300feff     push 0xfffe0003                          
  04bc  6a01             push 1                                   
  04be  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04c3  83c406           add sp, 6                                
  04c6  50               push ax                                  
  04c7  6a00             push 0                                   
  04c9  56               push si                                  
  04ca  6a01             push 1                                   
  04cc  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04d1  83c406           add sp, 6                                
  04d4  8bd0             mov dx, ax                               
  04d6  58               pop ax                                   
  04d7  f7ea             imul dx                                  
  04d9  c45e06           les bx, ptr [bp + 6]                     
  04dc  268b17           mov dx, word ptr es:[bx]                 
  04df  03d0             add dx, ax                               
  04e1  268917           mov word ptr es:[bx], dx                 
  04e4  66680300feff     push 0xfffe0003                          
  04ea  6a01             push 1                                   
  04ec  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04f1  83c406           add sp, 6                                
  04f4  50               push ax                                  
  04f5  6a00             push 0                                   
  04f7  56               push si                                  
  04f8  6a01             push 1                                   
  04fa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04ff  83c406           add sp, 6                                
  0502  8bd0             mov dx, ax                               
  0504  58               pop ax                                   
  0505  f7ea             imul dx                                  
  0507  c45e0a           les bx, ptr [bp + 0xa]                   
  050a  268b17           mov dx, word ptr es:[bx]                 
  050d  03d0             add dx, ax                               
  050f  268917           mov word ptr es:[bx], dx                 
  0512  666a64           push 0x64                                
  0515  6a01             push 1                                   
  0517  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  051c  83c406           add sp, 6                                
  051f  3d1e00           cmp ax, 0x1e                             
  0522  7d78             jge 0x59c                                
  0524  837e1000         cmp word ptr [bp + 0x10], 0              
  0528  7472             je 0x59c                                 
  052a  c45e06           les bx, ptr [bp + 6]                     
  052d  268b17           mov dx, word ptr es:[bx]                 
  0530  c45e0a           les bx, ptr [bp + 0xa]                   
  0533  268b0f           mov cx, word ptr es:[bx]                 
  0536  c45e06           les bx, ptr [bp + 6]                     
  0539  b86f00           mov ax, 0x6f                             
  053c  262b07           sub ax, word ptr es:[bx]                 
  053f  8bf0             mov si, ax                               
  0541  c45e0a           les bx, ptr [bp + 0xa]                   
  0544  b89b00           mov ax, 0x9b                             
  0547  262b07           sub ax, word ptr es:[bx]                 
  054a  8bf8             mov di, ax                               
  054c  3bd1             cmp dx, cx                               
  054e  7f10             jg 0x560                                 
  0550  3bd6             cmp dx, si                               
  0552  7f0c             jg 0x560                                 
  0554  3bd7             cmp dx, di                               
  0556  7f08             jg 0x560                                 
  0558  c45e06           les bx, ptr [bp + 6]                     
  055b  26c7070000       mov word ptr es:[bx], 0                  
  0560  3bca             cmp cx, dx                               
  0562  7f10             jg 0x574                                 
  0564  3bce             cmp cx, si                               
  0566  7f0c             jg 0x574                                 
  0568  3bcf             cmp cx, di                               
  056a  7f08             jg 0x574                                 
  056c  c45e0a           les bx, ptr [bp + 0xa]                   
  056f  26c7070000       mov word ptr es:[bx], 0                  
  0574  3bf1             cmp si, cx                               
  0576  7f10             jg 0x588                                 
  0578  3bf2             cmp si, dx                               
  057a  7f0c             jg 0x588                                 
  057c  3bf7             cmp si, di                               
  057e  7f08             jg 0x588                                 
  0580  c45e06           les bx, ptr [bp + 6]                     
  0583  26c7076f00       mov word ptr es:[bx], 0x6f               
  0588  3bf9             cmp di, cx                               
  058a  7f10             jg 0x59c                                 
  058c  3bfa             cmp di, dx                               
  058e  7f0c             jg 0x59c                                 
  0590  3bfe             cmp di, si                               
  0592  7f08             jg 0x59c                                 
  0594  c45e0a           les bx, ptr [bp + 0xa]                   
  0597  26c7079b00       mov word ptr es:[bx], 0x9b               
  059c  66ff760a         push dword ptr [bp + 0xa]                
  05a0  66ff7606         push dword ptr [bp + 6]                  
  05a4  0e               push cs                                  
  05a5  e8c8fe           call 0x470                               
  05a8  83c408           add sp, 8                                
  05ab  5f               pop di                                   
  05ac  5e               pop si                                   
  05ad  5d               pop bp                                   
  05ae  cb               retf                                     
