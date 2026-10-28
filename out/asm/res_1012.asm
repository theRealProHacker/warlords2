; res_1012 file_off 0x12120

res_1012_0005:  ; ENTRY
  0005  55               push bp                                  
  0006  8bec             mov bp, sp                               
  0008  83ec02           sub sp, 2                                
  000b  56               push si                                  
  000c  57               push di                                  
  000d  8b4606           mov ax, word ptr [bp + 6]                
  0010  d1e0             shl ax, 1                                
  0012  8946fe           mov word ptr [bp - 2], ax                
  0015  33c9             xor cx, cx                               
  0017  33ff             xor di, di                               
  0019  eb1f             jmp 0x3a                                 
  001b  8bf7             mov si, di                               
  001d  33d2             xor dx, dx                               
  001f  eb0e             jmp 0x2f                                 
  0021  8bd9             mov bx, cx                               
  0023  03da             add bx, dx                               
  0025  d1e3             shl bx, 1                                
  0027  89b7d869         mov word ptr [bx + 0x69d8], si           
  002b  03760c           add si, word ptr [bp + 0xc]              
  002e  42               inc dx                                   
  002f  3b560a           cmp dx, word ptr [bp + 0xa]              
  0032  7ced             jl 0x21                                  
  0034  037efe           add di, word ptr [bp - 2]                
  0037  034e0a           add cx, word ptr [bp + 0xa]              
  003a  3b4e08           cmp cx, word ptr [bp + 8]                
  003d  7cdc             jl 0x1b                                  
  003f  5f               pop di                                   
  0040  5e               pop si                                   
  0041  c9               leave                                    
  0042  cb               retf                                     

res_1012_0043:  ; ENTRY
  0043  55               push bp                                  
  0044  8bec             mov bp, sp                               
  0046  56               push si                                  
  0047  8b4606           mov ax, word ptr [bp + 6]                
  004a  6bc01a           imul ax, ax, 0x1a                        
  004d  056534           add ax, 0x3465                           
  0050  8c1ee934         mov word ptr [0x34e9], ds                
  0054  a3e734           mov word ptr [0x34e7], ax                
  0057  c41ee734         les bx, ptr [0x34e7]                     
  005b  26ff770a         push word ptr es:[bx + 0xa]              
  005f  26ff770c         push word ptr es:[bx + 0xc]              
  0063  26ff7706         push word ptr es:[bx + 6]                
  0067  26ff7702         push word ptr es:[bx + 2]                
  006b  0e               push cs                                  
  006c  e896ff           call 5                                   
  006f  83c408           add sp, 8                                
  0072  c41ee734         les bx, ptr [0x34e7]                     
  0076  26ff7712         push word ptr es:[bx + 0x12]             
  007a  90               nop                                      
  007b  0e               push cs                                  
  007c  e80801           call 0x187                               
  007f  59               pop cx                                   
  0080  c41ee734         les bx, ptr [0x34e7]                     
  0084  26ff7714         push word ptr es:[bx + 0x14]             
  0088  9a0d005315       lcall 0x1553, 0xd                        -> 1553:000d
  008d  59               pop cx                                   
  008e  c41ee734         les bx, ptr [0x34e7]                     
  0092  26ff7706         push word ptr es:[bx + 6]                
  0096  26ff7704         push word ptr es:[bx + 4]                
  009a  666a00           push 0                                   
  009d  1e               push ds                                  
  009e  682a34           push 0x342a                              
  00a1  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  00a6  83c40c           add sp, 0xc                              
  00a9  c41ee734         les bx, ptr [0x34e7]                     
  00ad  268b4702         mov ax, word ptr es:[bx + 2]             
  00b1  a33234           mov word ptr [0x3432], ax                
  00b4  c6065c3400       mov byte ptr [0x345c], 0                 
  00b9  c6065d3400       mov byte ptr [0x345d], 0                 
  00be  268a470e         mov al, byte ptr es:[bx + 0xe]           
  00c2  a25e34           mov byte ptr [0x345e], al                
  00c5  33f6             xor si, si                               
  00c7  eb19             jmp 0xe2                                 
  00c9  c41ee734         les bx, ptr [0x34e7]                     
  00cd  66260fb74708     movzx eax, word ptr es:[bx + 8]          
  00d3  66c1e010         shl eax, 0x10                            
  00d7  8bde             mov bx, si                               
  00d9  c1e302           shl bx, 2                                
  00dc  6689874434       mov dword ptr [bx + 0x3444], eax         
  00e1  46               inc si                                   
  00e2  a05e34           mov al, byte ptr [0x345e]                
  00e5  b400             mov ah, 0                                
  00e7  3bc6             cmp ax, si                               
  00e9  7fde             jg 0xc9                                  
  00eb  66c7065434000000 mov dword ptr [0x3454], 0                
  00f4  8c1e5a34         mov word ptr [0x345a], ds                
  00f8  c7065834d869     mov word ptr [0x3458], 0x69d8            
  00fe  830e5f3402       or word ptr [0x345f], 2                  
  0103  c41ee734         les bx, ptr [0x34e7]                     
  0107  268b1f           mov bx, word ptr es:[bx]                 
  010a  83fb04           cmp bx, 4                                
  010d  773b             ja 0x14a                                 
  010f  d1e3             shl bx, 1                                
  0111  2effa77d01       jmp word ptr cs:[bx + 0x17d]             
res_1012_0116:  ; case
  0116  c706d669000f     mov word ptr [0x69d6], 0xf00             
  011c  c706d469a103     mov word ptr [0x69d4], 0x3a1             
  0122  c706ca69000f     mov word ptr [0x69ca], 0xf00             
  0128  c706c8694d0c     mov word ptr [0x69c8], 0xc4d             
  012e  c706d269000f     mov word ptr [0x69d2], 0xf00             
  0134  c706d0690c00     mov word ptr [0x69d0], 0xc               
  013a  c706ce69000f     mov word ptr [0x69ce], 0xf00             
  0140  c706cc699c01     mov word ptr [0x69cc], 0x19c             
  0146  eb02             jmp 0x14a                                
res_1012_0148:  ; case
  0148  eb00             jmp 0x14a                                
  014a  c706c669680e     mov word ptr [0x69c6], 0xe68             
  0150  c706c4694a02     mov word ptr [0x69c4], 0x24a             
  0156  c706c269680e     mov word ptr [0x69c2], 0xe68             
  015c  c706c0691a02     mov word ptr [0x69c0], 0x21a             
  0162  c706be69680e     mov word ptr [0x69be], 0xe68             
  0168  c706bc69e801     mov word ptr [0x69bc], 0x1e8             
  016e  c706ba691210     mov word ptr [0x69ba], 0x1012            
  0174  c706b8699911     mov word ptr [0x69b8], 0x1199            
  017a  5e               pop si                                   
  017b  5d               pop bp                                   
  017c  cb               retf                                     
  017d  1601160116014801 dw 0116,0116,0116,0148,0116              jump table

res_1012_0187:  ; ENTRY
  0187  55               push bp                                  
  0188  8bec             mov bp, sp                               
  018a  8b4606           mov ax, word ptr [bp + 6]                
  018d  a3b669           mov word ptr [0x69b6], ax                
  0190  b80100           mov ax, 1                                
  0193  8a0eb669         mov cl, byte ptr [0x69b6]                
  0197  d3e0             shl ax, cl                               
  0199  a3b469           mov word ptr [0x69b4], ax                
  019c  c41ee734         les bx, ptr [0x34e7]                     
  01a0  26f76f0e         imul word ptr es:[bx + 0xe]              
  01a4  a3b269           mov word ptr [0x69b2], ax                
  01a7  b81000           mov ax, 0x10                             
  01aa  99               cdq                                      
  01ab  f73eb269         idiv word ptr [0x69b2]                   
  01af  a3a269           mov word ptr [0x69a2], ax                
  01b2  b80100           mov ax, 1                                
  01b5  8a0eb469         mov cl, byte ptr [0x69b4]                
  01b9  d3e0             shl ax, cl                               
  01bb  48               dec ax                                   
  01bc  a3ac69           mov word ptr [0x69ac], ax                
  01bf  b81000           mov ax, 0x10                             
  01c2  8a0eb669         mov cl, byte ptr [0x69b6]                
  01c6  d3f8             sar ax, cl                               
  01c8  a3aa69           mov word ptr [0x69aa], ax                
  01cb  d1f8             sar ax, 1                                
  01cd  a3a869           mov word ptr [0x69a8], ax                
  01d0  a1aa69           mov ax, word ptr [0x69aa]                
  01d3  48               dec ax                                   
  01d4  a3a669           mov word ptr [0x69a6], ax                
  01d7  a1a869           mov ax, word ptr [0x69a8]                
  01da  48               dec ax                                   
  01db  a3a469           mov word ptr [0x69a4], ax                
  01de  b80400           mov ax, 4                                
  01e1  2b06b669         sub ax, word ptr [0x69b6]                
  01e5  a3a069           mov word ptr [0x69a0], ax                
  01e8  48               dec ax                                   
  01e9  a39e69           mov word ptr [0x699e], ax                
  01ec  b80100           mov ax, 1                                
  01ef  8a0eb269         mov cl, byte ptr [0x69b2]                
  01f3  d3e0             shl ax, cl                               
  01f5  a3ae69           mov word ptr [0x69ae], ax                
  01f8  48               dec ax                                   
  01f9  a3b069           mov word ptr [0x69b0], ax                
  01fc  5d               pop bp                                   
  01fd  cb               retf                                     

res_1012_01fe:  ; ENTRY
  01fe  55               push bp                                  
  01ff  8bec             mov bp, sp                               
  0201  c41ee734         les bx, ptr [0x34e7]                     
  0205  26ff770e         push word ptr es:[bx + 0xe]              
  0209  ff760c           push word ptr [bp + 0xc]                 
  020c  8b460a           mov ax, word ptr [bp + 0xa]              
  020f  0306a669         add ax, word ptr [0x69a6]                
  0213  8b16a669         mov dx, word ptr [0x69a6]                
  0217  f7d2             not dx                                   
  0219  23c2             and ax, dx                               
  021b  8a0ea069         mov cl, byte ptr [0x69a0]                
  021f  d3f8             sar ax, cl                               
  0221  50               push ax                                  
  0222  66ff7606         push dword ptr [bp + 6]                  
  0226  90               nop                                      
  0227  0e               push cs                                  
  0228  e8d007           call 0x9fb                               
  022b  83c40a           add sp, 0xa                              
  022e  eb00             jmp 0x230                                
  0230  5d               pop bp                                   
  0231  cb               retf                                     

res_1012_0232:  ; ENTRY
  0232  55               push bp                                  
  0233  8bec             mov bp, sp                               
  0235  ff760e           push word ptr [bp + 0xe]                 
  0238  ff760c           push word ptr [bp + 0xc]                 
  023b  8b460a           mov ax, word ptr [bp + 0xa]              
  023e  0306a669         add ax, word ptr [0x69a6]                
  0242  8b16a669         mov dx, word ptr [0x69a6]                
  0246  f7d2             not dx                                   
  0248  23c2             and ax, dx                               
  024a  8a0ea069         mov cl, byte ptr [0x69a0]                
  024e  d3f8             sar ax, cl                               
  0250  50               push ax                                  
  0251  66ff7606         push dword ptr [bp + 6]                  
  0255  90               nop                                      
  0256  0e               push cs                                  
  0257  e8a107           call 0x9fb                               
  025a  83c40a           add sp, 0xa                              
  025d  eb00             jmp 0x25f                                
  025f  5d               pop bp                                   
  0260  cb               retf                                     
  0261  55               push bp                                  
  0262  8bec             mov bp, sp                               
  0264  83ec06           sub sp, 6                                
  0267  56               push si                                  
  0268  57               push di                                  
  0269  8b760c           mov si, word ptr [bp + 0xc]              
  026c  8b7e18           mov di, word ptr [bp + 0x18]             
  026f  eb47             jmp 0x2b8                                
  0271  8b460a           mov ax, word ptr [bp + 0xa]              
  0274  8946fe           mov word ptr [bp - 2], ax                
  0277  8b4616           mov ax, word ptr [bp + 0x16]             
  027a  8946fc           mov word ptr [bp - 4], ax                
  027d  8b460e           mov ax, word ptr [bp + 0xe]              
  0280  8946fa           mov word ptr [bp - 6], ax                
  0283  eb27             jmp 0x2ac                                
  0285  56               push si                                  
  0286  8b46fe           mov ax, word ptr [bp - 2]                
  0289  ff46fe           inc word ptr [bp - 2]                    
  028c  50               push ax                                  
  028d  66ff7606         push dword ptr [bp + 6]                  
  0291  ff1ecc69         lcall [0x69cc]                           
  0295  83c408           add sp, 8                                
  0298  50               push ax                                  
  0299  57               push di                                  
  029a  8b46fc           mov ax, word ptr [bp - 4]                
  029d  ff46fc           inc word ptr [bp - 4]                    
  02a0  50               push ax                                  
  02a1  66ff7612         push dword ptr [bp + 0x12]               
  02a5  ff1ed069         lcall [0x69d0]                           
  02a9  83c40a           add sp, 0xa                              
  02ac  8b46fa           mov ax, word ptr [bp - 6]                
  02af  ff4efa           dec word ptr [bp - 6]                    
  02b2  0bc0             or ax, ax                                
  02b4  75cf             jne 0x285                                
  02b6  46               inc si                                   
  02b7  47               inc di                                   
  02b8  8b4610           mov ax, word ptr [bp + 0x10]             
  02bb  ff4e10           dec word ptr [bp + 0x10]                 
  02be  0bc0             or ax, ax                                
  02c0  75af             jne 0x271                                
  02c2  5f               pop di                                   
  02c3  5e               pop si                                   
  02c4  c9               leave                                    
  02c5  cb               retf                                     

res_1012_02c6:  ; ENTRY
  02c6  55               push bp                                  
  02c7  8bec             mov bp, sp                               
  02c9  ff7606           push word ptr [bp + 6]                   
  02cc  90               nop                                      
  02cd  0e               push cs                                  
  02ce  e80700           call 0x2d8                               
  02d1  59               pop cx                                   
  02d2  24ff             and al, 0xff                             
  02d4  eb00             jmp 0x2d6                                
  02d6  5d               pop bp                                   
  02d7  cb               retf                                     

res_1012_02d8:  ; ENTRY
  02d8  55               push bp                                  
  02d9  8bec             mov bp, sp                               
  02db  56               push si                                  
  02dc  8b5606           mov dx, word ptr [bp + 6]                
  02df  2316b069         and dx, word ptr [0x69b0]                
  02e3  8bc2             mov ax, dx                               
  02e5  8bd8             mov bx, ax                               
  02e7  be0100           mov si, 1                                
  02ea  eb0d             jmp 0x2f9                                
  02ec  8bc3             mov ax, bx                               
  02ee  8a0eb269         mov cl, byte ptr [0x69b2]                
  02f2  d3e0             shl ax, cl                               
  02f4  0bc2             or ax, dx                                
  02f6  8bd8             mov bx, ax                               
  02f8  46               inc si                                   
  02f9  3b36a269         cmp si, word ptr [0x69a2]                
  02fd  72ed             jb 0x2ec                                 
  02ff  8bc3             mov ax, bx                               
  0301  eb00             jmp 0x303                                
  0303  5e               pop si                                   
  0304  5d               pop bp                                   
  0305  cb               retf                                     
  0306  55               push bp                                  
  0307  8bec             mov bp, sp                               
  0309  c45e06           les bx, ptr [bp + 6]                     
  030c  26834f3501       or word ptr es:[bx + 0x35], 1            
  0311  668b460a         mov eax, dword ptr [bp + 0xa]            
  0315  6626894737       mov dword ptr es:[bx + 0x37], eax        
  031a  5d               pop bp                                   
  031b  cb               retf                                     
  031c  55               push bp                                  
  031d  8bec             mov bp, sp                               
  031f  83ec02           sub sp, 2                                
  0322  56               push si                                  
  0323  57               push di                                  
  0324  8b7e0a           mov di, word ptr [bp + 0xa]              
  0327  8b760c           mov si, word ptr [bp + 0xc]              
  032a  c45e06           les bx, ptr [bp + 6]                     
  032d  26397706         cmp word ptr es:[bx + 6], si             
  0331  7f2e             jg 0x361                                 
  0333  ff7618           push word ptr [bp + 0x18]                
  0336  ff7616           push word ptr [bp + 0x16]                
  0339  66ff7612         push dword ptr [bp + 0x12]               
  033d  ff7610           push word ptr [bp + 0x10]                
  0340  ff760e           push word ptr [bp + 0xe]                 
  0343  8bc6             mov ax, si                               
  0345  262b4706         sub ax, word ptr es:[bx + 6]             
  0349  50               push ax                                  
  034a  57               push di                                  
  034b  c45e06           les bx, ptr [bp + 6]                     
  034e  6626ff7737       push dword ptr es:[bx + 0x37]            
  0353  ff1ed469         lcall [0x69d4]                           
  0357  83c414           add sp, 0x14                             
  035a  b80100           mov ax, 1                                
  035d  eb54             jmp 0x3b3                                
  035f  eb4e             jmp 0x3af                                
  0361  c45e06           les bx, ptr [bp + 6]                     
  0364  8bc6             mov ax, si                               
  0366  034610           add ax, word ptr [bp + 0x10]             
  0369  26394706         cmp word ptr es:[bx + 6], ax             
  036d  7d40             jge 0x3af                                
  036f  ff7618           push word ptr [bp + 0x18]                
  0372  ff7616           push word ptr [bp + 0x16]                
  0375  66ff7612         push dword ptr [bp + 0x12]               
  0379  268b4706         mov ax, word ptr es:[bx + 6]             
  037d  2bc6             sub ax, si                               
  037f  8946fe           mov word ptr [bp - 2], ax                
  0382  50               push ax                                  
  0383  ff760e           push word ptr [bp + 0xe]                 
  0386  56               push si                                  
  0387  57               push di                                  
  0388  ff7608           push word ptr [bp + 8]                   
  038b  53               push bx                                  
  038c  ff1ed469         lcall [0x69d4]                           
  0390  83c414           add sp, 0x14                             
  0393  8b4618           mov ax, word ptr [bp + 0x18]             
  0396  0346fe           add ax, word ptr [bp - 2]                
  0399  50               push ax                                  
  039a  ff7616           push word ptr [bp + 0x16]                
  039d  66ff7612         push dword ptr [bp + 0x12]               
  03a1  8b4610           mov ax, word ptr [bp + 0x10]             
  03a4  2b46fe           sub ax, word ptr [bp - 2]                
  03a7  50               push ax                                  
  03a8  ff760e           push word ptr [bp + 0xe]                 
  03ab  6a00             push 0                                   
  03ad  eb9b             jmp 0x34a                                
  03af  33c0             xor ax, ax                               
  03b1  ebaa             jmp 0x35d                                
  03b3  5f               pop di                                   
  03b4  5e               pop si                                   
  03b5  c9               leave                                    
  03b6  cb               retf                                     
  03b7  55               push bp                                  
  03b8  8bec             mov bp, sp                               
  03ba  83ec02           sub sp, 2                                
  03bd  56               push si                                  
  03be  57               push di                                  
  03bf  8b7e0a           mov di, word ptr [bp + 0xa]              
  03c2  8b7618           mov si, word ptr [bp + 0x18]             
  03c5  c45e12           les bx, ptr [bp + 0x12]                  
  03c8  26397706         cmp word ptr es:[bx + 6], si             
  03cc  7f2b             jg 0x3f9                                 
  03ce  8bc6             mov ax, si                               
  03d0  262b4706         sub ax, word ptr es:[bx + 6]             
  03d4  50               push ax                                  
  03d5  ff7616           push word ptr [bp + 0x16]                
  03d8  6626ff7737       push dword ptr es:[bx + 0x37]            
  03dd  ff7610           push word ptr [bp + 0x10]                
  03e0  ff760e           push word ptr [bp + 0xe]                 
  03e3  ff760c           push word ptr [bp + 0xc]                 
  03e6  57               push di                                  
  03e7  66ff7606         push dword ptr [bp + 6]                  
  03eb  ff1ed469         lcall [0x69d4]                           
  03ef  83c414           add sp, 0x14                             
  03f2  b80100           mov ax, 1                                
  03f5  eb54             jmp 0x44b                                
  03f7  eb4e             jmp 0x447                                
  03f9  c45e12           les bx, ptr [bp + 0x12]                  
  03fc  8bc6             mov ax, si                               
  03fe  034610           add ax, word ptr [bp + 0x10]             
  0401  26394706         cmp word ptr es:[bx + 6], ax             
  0405  7d40             jge 0x447                                
  0407  56               push si                                  
  0408  ff7616           push word ptr [bp + 0x16]                
  040b  ff7614           push word ptr [bp + 0x14]                
  040e  53               push bx                                  
  040f  268b4706         mov ax, word ptr es:[bx + 6]             
  0413  2bc6             sub ax, si                               
  0415  8946fe           mov word ptr [bp - 2], ax                
  0418  50               push ax                                  
  0419  ff760e           push word ptr [bp + 0xe]                 
  041c  ff760c           push word ptr [bp + 0xc]                 
  041f  57               push di                                  
  0420  66ff7606         push dword ptr [bp + 6]                  
  0424  ff1ed469         lcall [0x69d4]                           
  0428  83c414           add sp, 0x14                             
  042b  6a00             push 0                                   
  042d  ff7616           push word ptr [bp + 0x16]                
  0430  c45e12           les bx, ptr [bp + 0x12]                  
  0433  6626ff7737       push dword ptr es:[bx + 0x37]            
  0438  8b4610           mov ax, word ptr [bp + 0x10]             
  043b  2b46fe           sub ax, word ptr [bp - 2]                
  043e  50               push ax                                  
  043f  ff760e           push word ptr [bp + 0xe]                 
  0442  ff76fe           push word ptr [bp - 2]                   
  0445  eb9f             jmp 0x3e6                                
  0447  33c0             xor ax, ax                               
  0449  ebaa             jmp 0x3f5                                
  044b  5f               pop di                                   
  044c  5e               pop si                                   
  044d  c9               leave                                    
  044e  cb               retf                                     

res_1012_044f:  ; ENTRY
  044f  55               push bp                                  
  0450  8bec             mov bp, sp                               
  0452  83ec20           sub sp, 0x20                             
  0455  56               push si                                  
  0456  57               push di                                  
  0457  668b4606         mov eax, dword ptr [bp + 6]              
  045b  668946e0         mov dword ptr [bp - 0x20], eax           
  045f  6a08             push 8                                   
  0461  66ff760a         push dword ptr [bp + 0xa]                
  0465  16               push ss                                  
  0466  8d46f8           lea ax, [bp - 8]                         
  0469  50               push ax                                  
  046a  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  046f  83c40a           add sp, 0xa                              
  0472  c746ecff00       mov word ptr [bp - 0x14], 0xff           
  0477  8b46f8           mov ax, word ptr [bp - 8]                
  047a  2306a469         and ax, word ptr [0x69a4]                
  047e  8946f2           mov word ptr [bp - 0xe], ax              
  0481  837ef200         cmp word ptr [bp - 0xe], 0               
  0485  7430             je 0x4b7                                 
  0487  a1a469           mov ax, word ptr [0x69a4]                
  048a  f7d0             not ax                                   
  048c  2146f8           and word ptr [bp - 8], ax                
  048f  8b46f2           mov ax, word ptr [bp - 0xe]              
  0492  0146fc           add word ptr [bp - 4], ax                
  0495  833e843300       cmp word ptr [0x3384], 0                 
  049a  7407             je 0x4a3                                 
  049c  8cda             mov dx, ds                               
  049e  b8eb34           mov ax, 0x34eb                           
  04a1  eb05             jmp 0x4a8                                
  04a3  8cda             mov dx, ds                               
  04a5  b8fb34           mov ax, 0x34fb                           
  04a8  0346f2           add ax, word ptr [bp - 0xe]              
  04ab  8bd8             mov bx, ax                               
  04ad  8ec2             mov es, dx                               
  04af  268a07           mov al, byte ptr es:[bx]                 
  04b2  b400             mov ah, 0                                
  04b4  8946ec           mov word ptr [bp - 0x14], ax             
  04b7  8b46fc           mov ax, word ptr [bp - 4]                
  04ba  8a0e9e69         mov cl, byte ptr [0x699e]                
  04be  d3f8             sar ax, cl                               
  04c0  48               dec ax                                   
  04c1  8946ee           mov word ptr [bp - 0x12], ax             
  04c4  833e843300       cmp word ptr [0x3384], 0                 
  04c9  7407             je 0x4d2                                 
  04cb  8cda             mov dx, ds                               
  04cd  b8f334           mov ax, 0x34f3                           
  04d0  eb05             jmp 0x4d7                                
  04d2  8cda             mov dx, ds                               
  04d4  b8ff34           mov ax, 0x34ff                           
  04d7  8b5efc           mov bx, word ptr [bp - 4]                
  04da  035ef8           add bx, word ptr [bp - 8]                
  04dd  231ea469         and bx, word ptr [0x69a4]                
  04e1  03c3             add ax, bx                               
  04e3  8bd8             mov bx, ax                               
  04e5  8ec2             mov es, dx                               
  04e7  268a07           mov al, byte ptr es:[bx]                 
  04ea  b400             mov ah, 0                                
  04ec  8946ea           mov word ptr [bp - 0x16], ax             
  04ef  833e843300       cmp word ptr [0x3384], 0                 
  04f4  7503             jne 0x4f9                                
  04f6  e99001           jmp 0x689                                
  04f9  c746e40100       mov word ptr [bp - 0x1c], 1              
  04fe  c746f20000       mov word ptr [bp - 0xe], 0               
  0503  e96f01           jmp 0x675                                
  0506  8b46f2           mov ax, word ptr [bp - 0xe]              
  0509  c1e002           shl ax, 2                                
  050c  c45ee0           les bx, ptr [bp - 0x20]                  
  050f  03d8             add bx, ax                               
  0511  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0515  260b470c         or ax, word ptr es:[bx + 0xc]            
  0519  7433             je 0x54e                                 
  051b  8b5ee0           mov bx, word ptr [bp - 0x20]             
  051e  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0524  7528             jne 0x54e                                
  0526  8b46f2           mov ax, word ptr [bp - 0xe]              
  0529  c1e002           shl ax, 2                                
  052c  03d8             add bx, ax                               
  052e  6626ff770a       push dword ptr es:[bx + 0xa]             
  0533  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0538  83c404           add sp, 4                                
  053b  8b5ef2           mov bx, word ptr [bp - 0xe]              
  053e  c1e302           shl bx, 2                                
  0541  c476e0           les si, ptr [bp - 0x20]                  
  0544  03f3             add si, bx                               
  0546  2689541c         mov word ptr es:[si + 0x1c], dx          
  054a  2689441a         mov word ptr es:[si + 0x1a], ax          
  054e  ff76f2           push word ptr [bp - 0xe]                 
  0551  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0556  59               pop cx                                   
  0557  8b46e4           mov ax, word ptr [bp - 0x1c]             
  055a  85460e           test word ptr [bp + 0xe], ax             
  055d  7405             je 0x564                                 
  055f  b8ff00           mov ax, 0xff                             
  0562  eb02             jmp 0x566                                
  0564  33c0             xor ax, ax                               
  0566  8946e8           mov word ptr [bp - 0x18], ax             
  0569  8b7efa           mov di, word ptr [bp - 6]                
  056c  e9be00           jmp 0x62d                                
  056f  c45e06           les bx, ptr [bp + 6]                     
  0572  26f747350100     test word ptr es:[bx + 0x35], 1          
  0578  7442             je 0x5bc                                 
  057a  26397f06         cmp word ptr es:[bx + 6], di             
  057e  7f3c             jg 0x5bc                                 
  0580  26c45f37         les bx, ptr es:[bx + 0x37]               
  0584  8b46f2           mov ax, word ptr [bp - 0xe]              
  0587  c1e002           shl ax, 2                                
  058a  03d8             add bx, ax                               
  058c  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0590  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0594  c45e06           les bx, ptr [bp + 6]                     
  0597  52               push dx                                  
  0598  50               push ax                                  
  0599  8bc7             mov ax, di                               
  059b  262b4706         sub ax, word ptr es:[bx + 6]             
  059f  26c45f37         les bx, ptr es:[bx + 0x37]               
  05a3  26f76f08         imul word ptr es:[bx + 8]                
  05a7  d1e0             shl ax, 1                                
  05a9  8bd0             mov dx, ax                               
  05ab  58               pop ax                                   
  05ac  03c2             add ax, dx                               
  05ae  8b56f8           mov dx, word ptr [bp - 8]                
  05b1  8a0e9e69         mov cl, byte ptr [0x699e]                
  05b5  d3fa             sar dx, cl                               
  05b7  03c2             add ax, dx                               
  05b9  5a               pop dx                                   
  05ba  eb31             jmp 0x5ed                                
  05bc  8b46f2           mov ax, word ptr [bp - 0xe]              
  05bf  c1e002           shl ax, 2                                
  05c2  c45e06           les bx, ptr [bp + 6]                     
  05c5  03d8             add bx, ax                               
  05c7  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  05cb  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  05cf  8b5e06           mov bx, word ptr [bp + 6]                
  05d2  52               push dx                                  
  05d3  50               push ax                                  
  05d4  8bc7             mov ax, di                               
  05d6  26f76f08         imul word ptr es:[bx + 8]                
  05da  d1e0             shl ax, 1                                
  05dc  8bd0             mov dx, ax                               
  05de  58               pop ax                                   
  05df  03c2             add ax, dx                               
  05e1  8b56f8           mov dx, word ptr [bp - 8]                
  05e4  8a0e9e69         mov cl, byte ptr [0x699e]                
  05e8  d3fa             sar dx, cl                               
  05ea  03c2             add ax, dx                               
  05ec  5a               pop dx                                   
  05ed  8956f6           mov word ptr [bp - 0xa], dx              
  05f0  8946f4           mov word ptr [bp - 0xc], ax              
  05f3  8a46e8           mov al, byte ptr [bp - 0x18]             
  05f6  2246ec           and al, byte ptr [bp - 0x14]             
  05f9  c45ef4           les bx, ptr [bp - 0xc]                   
  05fc  263007           xor byte ptr es:[bx], al                 
  05ff  ff46f4           inc word ptr [bp - 0xc]                  
  0602  8b46ee           mov ax, word ptr [bp - 0x12]             
  0605  8946f0           mov word ptr [bp - 0x10], ax             
  0608  eb0c             jmp 0x616                                
  060a  c45ef4           les bx, ptr [bp - 0xc]                   
  060d  8a46e8           mov al, byte ptr [bp - 0x18]             
  0610  263007           xor byte ptr es:[bx], al                 
  0613  ff46f4           inc word ptr [bp - 0xc]                  
  0616  8b46f0           mov ax, word ptr [bp - 0x10]             
  0619  ff4ef0           dec word ptr [bp - 0x10]                 
  061c  0bc0             or ax, ax                                
  061e  75ea             jne 0x60a                                
  0620  8a46e8           mov al, byte ptr [bp - 0x18]             
  0623  2246ea           and al, byte ptr [bp - 0x16]             
  0626  c45ef4           les bx, ptr [bp - 0xc]                   
  0629  263007           xor byte ptr es:[bx], al                 
  062c  47               inc di                                   
  062d  8b46fa           mov ax, word ptr [bp - 6]                
  0630  0346fe           add ax, word ptr [bp - 2]                
  0633  3bc7             cmp ax, di                               
  0635  7e03             jle 0x63a                                
  0637  e935ff           jmp 0x56f                                
  063a  8b46f2           mov ax, word ptr [bp - 0xe]              
  063d  c1e002           shl ax, 2                                
  0640  c45ee0           les bx, ptr [bp - 0x20]                  
  0643  03d8             add bx, ax                               
  0645  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0649  260b470c         or ax, word ptr es:[bx + 0xc]            
  064d  7420             je 0x66f                                 
  064f  8b5ee0           mov bx, word ptr [bp - 0x20]             
  0652  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0658  7515             jne 0x66f                                
  065a  8b46f2           mov ax, word ptr [bp - 0xe]              
  065d  c1e002           shl ax, 2                                
  0660  03d8             add bx, ax                               
  0662  6626ff770a       push dword ptr es:[bx + 0xa]             
  0667  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  066c  83c404           add sp, 4                                
  066f  ff46f2           inc word ptr [bp - 0xe]                  
  0672  d166e4           shl word ptr [bp - 0x1c], 1              
  0675  c45e06           les bx, ptr [bp + 6]                     
  0678  268a4734         mov al, byte ptr es:[bx + 0x34]          
  067c  b400             mov ah, 0                                
  067e  3b46f2           cmp ax, word ptr [bp - 0xe]              
  0681  7e03             jle 0x686                                
  0683  e980fe           jmp 0x506                                
  0686  e93f01           jmp 0x7c8                                
  0689  ff760e           push word ptr [bp + 0xe]                 
  068c  0e               push cs                                  
  068d  e836fc           call 0x2c6                               
  0690  59               pop cx                                   
  0691  b400             mov ah, 0                                
  0693  8946e6           mov word ptr [bp - 0x1a], ax             
  0696  8cd8             mov ax, ds                               
  0698  394608           cmp word ptr [bp + 8], ax                
  069b  7578             jne 0x715                                
  069d  817e062a34       cmp word ptr [bp + 6], 0x342a            
  06a2  7571             jne 0x715                                
  06a4  8b7efa           mov di, word ptr [bp - 6]                
  06a7  eb5f             jmp 0x708                                
  06a9  c41ee734         les bx, ptr [0x34e7]                     
  06ad  268b4718         mov ax, word ptr es:[bx + 0x18]          
  06b1  268b5716         mov dx, word ptr es:[bx + 0x16]          
  06b5  8bdf             mov bx, di                               
  06b7  d1e3             shl bx, 1                                
  06b9  0397d869         add dx, word ptr [bx + 0x69d8]           
  06bd  8b5ef8           mov bx, word ptr [bp - 8]                
  06c0  8a0e9e69         mov cl, byte ptr [0x699e]                
  06c4  d3fb             sar bx, cl                               
  06c6  03d3             add dx, bx                               
  06c8  8946f6           mov word ptr [bp - 0xa], ax              
  06cb  8956f4           mov word ptr [bp - 0xc], dx              
  06ce  8a46e6           mov al, byte ptr [bp - 0x1a]             
  06d1  2246ec           and al, byte ptr [bp - 0x14]             
  06d4  c45ef4           les bx, ptr [bp - 0xc]                   
  06d7  263007           xor byte ptr es:[bx], al                 
  06da  ff46f4           inc word ptr [bp - 0xc]                  
  06dd  8b46ee           mov ax, word ptr [bp - 0x12]             
  06e0  8946f0           mov word ptr [bp - 0x10], ax             
  06e3  eb0c             jmp 0x6f1                                
  06e5  c45ef4           les bx, ptr [bp - 0xc]                   
  06e8  8a46e6           mov al, byte ptr [bp - 0x1a]             
  06eb  263007           xor byte ptr es:[bx], al                 
  06ee  ff46f4           inc word ptr [bp - 0xc]                  
  06f1  8b46f0           mov ax, word ptr [bp - 0x10]             
  06f4  ff4ef0           dec word ptr [bp - 0x10]                 
  06f7  0bc0             or ax, ax                                
  06f9  75ea             jne 0x6e5                                
  06fb  8a46e6           mov al, byte ptr [bp - 0x1a]             
  06fe  2246ea           and al, byte ptr [bp - 0x16]             
  0701  c45ef4           les bx, ptr [bp - 0xc]                   
  0704  263007           xor byte ptr es:[bx], al                 
  0707  47               inc di                                   
  0708  8b46fa           mov ax, word ptr [bp - 6]                
  070b  0346fe           add ax, word ptr [bp - 2]                
  070e  3bc7             cmp ax, di                               
  0710  7f97             jg 0x6a9                                 
  0712  e9b300           jmp 0x7c8                                
  0715  8b7efa           mov di, word ptr [bp - 6]                
  0718  e9a000           jmp 0x7bb                                
  071b  c45e06           les bx, ptr [bp + 6]                     
  071e  26f747350100     test word ptr es:[bx + 0x35], 1          
  0724  742f             je 0x755                                 
  0726  26397f06         cmp word ptr es:[bx + 6], di             
  072a  7f29             jg 0x755                                 
  072c  8bc7             mov ax, di                               
  072e  262b4706         sub ax, word ptr es:[bx + 6]             
  0732  26c45f37         les bx, ptr es:[bx + 0x37]               
  0736  26f76f08         imul word ptr es:[bx + 8]                
  073a  d1e0             shl ax, 1                                
  073c  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0740  50               push ax                                  
  0741  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0745  5b               pop bx                                   
  0746  03c3             add ax, bx                               
  0748  8b5ef8           mov bx, word ptr [bp - 8]                
  074b  8a0e9e69         mov cl, byte ptr [0x699e]                
  074f  d3fb             sar bx, cl                               
  0751  03c3             add ax, bx                               
  0753  eb26             jmp 0x77b                                
  0755  c45e06           les bx, ptr [bp + 6]                     
  0758  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  075c  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0760  52               push dx                                  
  0761  50               push ax                                  
  0762  8bc7             mov ax, di                               
  0764  26f76f08         imul word ptr es:[bx + 8]                
  0768  d1e0             shl ax, 1                                
  076a  8bd0             mov dx, ax                               
  076c  58               pop ax                                   
  076d  03c2             add ax, dx                               
  076f  8b56f8           mov dx, word ptr [bp - 8]                
  0772  8a0e9e69         mov cl, byte ptr [0x699e]                
  0776  d3fa             sar dx, cl                               
  0778  03c2             add ax, dx                               
  077a  5a               pop dx                                   
  077b  8956f6           mov word ptr [bp - 0xa], dx              
  077e  8946f4           mov word ptr [bp - 0xc], ax              
  0781  8a46e6           mov al, byte ptr [bp - 0x1a]             
  0784  2246ec           and al, byte ptr [bp - 0x14]             
  0787  c45ef4           les bx, ptr [bp - 0xc]                   
  078a  263007           xor byte ptr es:[bx], al                 
  078d  ff46f4           inc word ptr [bp - 0xc]                  
  0790  8b46ee           mov ax, word ptr [bp - 0x12]             
  0793  8946f0           mov word ptr [bp - 0x10], ax             
  0796  eb0c             jmp 0x7a4                                
  0798  c45ef4           les bx, ptr [bp - 0xc]                   
  079b  8a46e6           mov al, byte ptr [bp - 0x1a]             
  079e  263007           xor byte ptr es:[bx], al                 
  07a1  ff46f4           inc word ptr [bp - 0xc]                  
  07a4  8b46f0           mov ax, word ptr [bp - 0x10]             
  07a7  ff4ef0           dec word ptr [bp - 0x10]                 
  07aa  0bc0             or ax, ax                                
  07ac  75ea             jne 0x798                                
  07ae  8a46e6           mov al, byte ptr [bp - 0x1a]             
  07b1  2246ea           and al, byte ptr [bp - 0x16]             
  07b4  c45ef4           les bx, ptr [bp - 0xc]                   
  07b7  263007           xor byte ptr es:[bx], al                 
  07ba  47               inc di                                   
  07bb  8b46fa           mov ax, word ptr [bp - 6]                
  07be  0346fe           add ax, word ptr [bp - 2]                
  07c1  3bc7             cmp ax, di                               
  07c3  7e03             jle 0x7c8                                
  07c5  e953ff           jmp 0x71b                                
  07c8  5f               pop di                                   
  07c9  5e               pop si                                   
  07ca  c9               leave                                    
  07cb  cb               retf                                     

res_1012_07cc:  ; ENTRY
  07cc  55               push bp                                  
  07cd  8bec             mov bp, sp                               
  07cf  83ec10           sub sp, 0x10                             
  07d2  56               push si                                  
  07d3  57               push di                                  
  07d4  ff760a           push word ptr [bp + 0xa]                 
  07d7  0e               push cs                                  
  07d8  e8fdfa           call 0x2d8                               
  07db  59               pop cx                                   
  07dc  8946f8           mov word ptr [bp - 8], ax                
  07df  668b4606         mov eax, dword ptr [bp + 6]              
  07e3  668946f0         mov dword ptr [bp - 0x10], eax           
  07e7  c41ee734         les bx, ptr [0x34e7]                     
  07eb  26833f04         cmp word ptr es:[bx], 4                  
  07ef  7415             je 0x806                                 
  07f1  26833f00         cmp word ptr es:[bx], 0                  
  07f5  740f             je 0x806                                 
  07f7  26833f01         cmp word ptr es:[bx], 1                  
  07fb  7409             je 0x806                                 
  07fd  26833f02         cmp word ptr es:[bx], 2                  
  0801  7403             je 0x806                                 
  0803  e9f000           jmp 0x8f6                                
  0806  c746fc0100       mov word ptr [bp - 4], 1                 
  080b  33ff             xor di, di                               
  080d  e9d400           jmp 0x8e4                                
  0810  8bc7             mov ax, di                               
  0812  c1e002           shl ax, 2                                
  0815  c45ef0           les bx, ptr [bp - 0x10]                  
  0818  03d8             add bx, ax                               
  081a  268b470a         mov ax, word ptr es:[bx + 0xa]           
  081e  260b470c         or ax, word ptr es:[bx + 0xc]            
  0822  7431             je 0x855                                 
  0824  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0827  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  082d  7526             jne 0x855                                
  082f  8bc7             mov ax, di                               
  0831  c1e002           shl ax, 2                                
  0834  03d8             add bx, ax                               
  0836  6626ff770a       push dword ptr es:[bx + 0xa]             
  083b  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0840  83c404           add sp, 4                                
  0843  8bdf             mov bx, di                               
  0845  c1e302           shl bx, 2                                
  0848  c476f0           les si, ptr [bp - 0x10]                  
  084b  03f3             add si, bx                               
  084d  2689541c         mov word ptr es:[si + 0x1c], dx          
  0851  2689441a         mov word ptr es:[si + 0x1a], ax          
  0855  8bc7             mov ax, di                               
  0857  c1e002           shl ax, 2                                
  085a  c45e06           les bx, ptr [bp + 6]                     
  085d  03d8             add bx, ax                               
  085f  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  0863  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  0867  8946f6           mov word ptr [bp - 0xa], ax              
  086a  8956f4           mov word ptr [bp - 0xc], dx              
  086d  57               push di                                  
  086e  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0873  59               pop cx                                   
  0874  8b46fc           mov ax, word ptr [bp - 4]                
  0877  85460a           test word ptr [bp + 0xa], ax             
  087a  7405             je 0x881                                 
  087c  b8ffff           mov ax, 0xffff                           
  087f  eb02             jmp 0x883                                
  0881  33c0             xor ax, ax                               
  0883  8946fa           mov word ptr [bp - 6], ax                
  0886  c45e06           les bx, ptr [bp + 6]                     
  0889  268b4708         mov ax, word ptr es:[bx + 8]             
  088d  26f76f06         imul word ptr es:[bx + 6]                
  0891  8946fe           mov word ptr [bp - 2], ax                
  0894  eb0d             jmp 0x8a3                                
  0896  c45ef4           les bx, ptr [bp - 0xc]                   
  0899  8b46fa           mov ax, word ptr [bp - 6]                
  089c  268907           mov word ptr es:[bx], ax                 
  089f  8346f402         add word ptr [bp - 0xc], 2               
  08a3  8b46fe           mov ax, word ptr [bp - 2]                
  08a6  ff4efe           dec word ptr [bp - 2]                    
  08a9  0bc0             or ax, ax                                
  08ab  75e9             jne 0x896                                
  08ad  d166fc           shl word ptr [bp - 4], 1                 
  08b0  8bc7             mov ax, di                               
  08b2  c1e002           shl ax, 2                                
  08b5  c45ef0           les bx, ptr [bp - 0x10]                  
  08b8  03d8             add bx, ax                               
  08ba  268b470a         mov ax, word ptr es:[bx + 0xa]           
  08be  260b470c         or ax, word ptr es:[bx + 0xc]            
  08c2  741f             je 0x8e3                                 
  08c4  8b5ef0           mov bx, word ptr [bp - 0x10]             
  08c7  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  08cd  7514             jne 0x8e3                                
  08cf  8bc7             mov ax, di                               
  08d1  c1e002           shl ax, 2                                
  08d4  03d8             add bx, ax                               
  08d6  6626ff770a       push dword ptr es:[bx + 0xa]             
  08db  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  08e0  83c404           add sp, 4                                
  08e3  47               inc di                                   
  08e4  c45e06           les bx, ptr [bp + 6]                     
  08e7  268a4734         mov al, byte ptr es:[bx + 0x34]          
  08eb  b400             mov ah, 0                                
  08ed  3bc7             cmp ax, di                               
  08ef  7603             jbe 0x8f4                                
  08f1  e91cff           jmp 0x810                                
  08f4  eb7b             jmp 0x971                                
  08f6  c45ef0           les bx, ptr [bp - 0x10]                  
  08f9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  08ff  7420             je 0x921                                 
  0901  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0907  7518             jne 0x921                                
  0909  6626ff770a       push dword ptr es:[bx + 0xa]             
  090e  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0913  83c404           add sp, 4                                
  0916  c45ef0           les bx, ptr [bp - 0x10]                  
  0919  2689571c         mov word ptr es:[bx + 0x1c], dx          
  091d  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0921  c45e06           les bx, ptr [bp + 6]                     
  0924  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0929  668946f4         mov dword ptr [bp - 0xc], eax            
  092d  268b4708         mov ax, word ptr es:[bx + 8]             
  0931  26f76f06         imul word ptr es:[bx + 6]                
  0935  8946fe           mov word ptr [bp - 2], ax                
  0938  eb0d             jmp 0x947                                
  093a  c45ef4           les bx, ptr [bp - 0xc]                   
  093d  8b46f8           mov ax, word ptr [bp - 8]                
  0940  268907           mov word ptr es:[bx], ax                 
  0943  8346f402         add word ptr [bp - 0xc], 2               
  0947  8b46fe           mov ax, word ptr [bp - 2]                
  094a  ff4efe           dec word ptr [bp - 2]                    
  094d  0bc0             or ax, ax                                
  094f  75e9             jne 0x93a                                
  0951  c45ef0           les bx, ptr [bp - 0x10]                  
  0954  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  095a  7415             je 0x971                                 
  095c  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0962  750d             jne 0x971                                
  0964  6626ff770a       push dword ptr es:[bx + 0xa]             
  0969  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  096e  83c404           add sp, 4                                
  0971  5f               pop di                                   
  0972  5e               pop si                                   
  0973  c9               leave                                    
  0974  cb               retf                                     

res_1012_0975:  ; ENTRY
  0975  55               push bp                                  
  0976  8bec             mov bp, sp                               
  0978  56               push si                                  
  0979  c45e06           les bx, ptr [bp + 6]                     
  097c  26f747350200     test word ptr es:[bx + 0x35], 2          
  0982  7412             je 0x996                                 
  0984  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0989  66c1e804         shr eax, 4                               
  098d  50               push ax                                  
  098e  9a6601cc0e       lcall 0xecc, 0x166                       -> 0ecc:0166
  0993  59               pop cx                                   
  0994  eb29             jmp 0x9bf                                
  0996  33f6             xor si, si                               
  0998  eb18             jmp 0x9b2                                
  099a  8bc6             mov ax, si                               
  099c  c1e002           shl ax, 2                                
  099f  c45e06           les bx, ptr [bp + 6]                     
  09a2  03d8             add bx, ax                               
  09a4  6626ff770a       push dword ptr es:[bx + 0xa]             
  09a9  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  09ae  83c404           add sp, 4                                
  09b1  46               inc si                                   
  09b2  c45e06           les bx, ptr [bp + 6]                     
  09b5  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09b9  b400             mov ah, 0                                
  09bb  3bc6             cmp ax, si                               
  09bd  7fdb             jg 0x99a                                 
  09bf  c45e06           les bx, ptr [bp + 6]                     
  09c2  26c6473400       mov byte ptr es:[bx + 0x34], 0           
  09c7  b80100           mov ax, 1                                
  09ca  eb00             jmp 0x9cc                                
  09cc  5e               pop si                                   
  09cd  5d               pop bp                                   
  09ce  cb               retf                                     

res_1012_09cf:  ; ENTRY
  09cf  55               push bp                                  
  09d0  8bec             mov bp, sp                               
  09d2  833e843300       cmp word ptr [0x3384], 0                 
  09d7  7408             je 0x9e1                                 
  09d9  c45e06           les bx, ptr [bp + 6]                     
  09dc  26834f3504       or word ptr es:[bx + 0x35], 4            
  09e1  5d               pop bp                                   
  09e2  cb               retf                                     

res_1012_09e3:  ; ENTRY
  09e3  55               push bp                                  
  09e4  8bec             mov bp, sp                               
  09e6  c45e06           les bx, ptr [bp + 6]                     
  09e9  26836735f7       and word ptr es:[bx + 0x35], 0xfff7      
  09ee  837e0a00         cmp word ptr [bp + 0xa], 0               
  09f2  7405             je 0x9f9                                 
  09f4  26834f3508       or word ptr es:[bx + 0x35], 8            
  09f9  5d               pop bp                                   
  09fa  cb               retf                                     

res_1012_09fb:  ; ENTRY
  09fb  55               push bp                                  
  09fc  8bec             mov bp, sp                               
  09fe  83ec08           sub sp, 8                                
  0a01  56               push si                                  
  0a02  57               push di                                  
  0a03  c45e06           les bx, ptr [bp + 6]                     
  0a06  268b4708         mov ax, word ptr es:[bx + 8]             
  0a0a  3b460a           cmp ax, word ptr [bp + 0xa]              
  0a0d  751d             jne 0xa2c                                
  0a0f  268b4706         mov ax, word ptr es:[bx + 6]             
  0a13  3b460c           cmp ax, word ptr [bp + 0xc]              
  0a16  7514             jne 0xa2c                                
  0a18  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0a1c  b400             mov ah, 0                                
  0a1e  3b460e           cmp ax, word ptr [bp + 0xe]              
  0a21  7509             jne 0xa2c                                
  0a23  b80100           mov ax, 1                                
  0a26  e98a01           jmp 0xbb3                                
  0a29  e91601           jmp 0xb42                                
  0a2c  66c746f800000000 mov dword ptr [bp - 8], 0                
  0a34  c45e06           les bx, ptr [bp + 6]                     
  0a37  26836735fd       and word ptr es:[bx + 0x35], 0xfffd      
  0a3c  ff7608           push word ptr [bp + 8]                   
  0a3f  53               push bx                                  
  0a40  0e               push cs                                  
  0a41  e831ff           call 0x975                               
  0a44  83c404           add sp, 4                                
  0a47  0bc0             or ax, ax                                
  0a49  7506             jne 0xa51                                
  0a4b  e9e900           jmp 0xb37                                
  0a4e  e9f100           jmp 0xb42                                
  0a51  833e843300       cmp word ptr [0x3384], 0                 
  0a56  7450             je 0xaa8                                 
  0a58  c45e06           les bx, ptr [bp + 6]                     
  0a5b  26f747350400     test word ptr es:[bx + 0x35], 4          
  0a61  7445             je 0xaa8                                 
  0a63  8b460a           mov ax, word ptr [bp + 0xa]              
  0a66  f76e0c           imul word ptr [bp + 0xc]                 
  0a69  50               push ax                                  
  0a6a  9a5c00cc0e       lcall 0xecc, 0x5c                        -> 0ecc:005c
  0a6f  59               pop cx                                   
  0a70  660fb7c0         movzx eax, ax                            
  0a74  668946f8         mov dword ptr [bp - 8], eax              
  0a78  66837ef800       cmp dword ptr [bp - 8], 0                
  0a7d  7429             je 0xaa8                                 
  0a7f  c45e06           les bx, ptr [bp + 6]                     
  0a82  26834f3502       or word ptr es:[bx + 0x35], 2            
  0a87  33ff             xor di, di                               
  0a89  eb18             jmp 0xaa3                                
  0a8b  668b46f8         mov eax, dword ptr [bp - 8]              
  0a8f  66c1e010         shl eax, 0x10                            
  0a93  8bd7             mov dx, di                               
  0a95  c1e202           shl dx, 2                                
  0a98  c45e06           les bx, ptr [bp + 6]                     
  0a9b  03da             add bx, dx                               
  0a9d  662689471a       mov dword ptr es:[bx + 0x1a], eax        
  0aa2  47               inc di                                   
  0aa3  3b7e0e           cmp di, word ptr [bp + 0xe]              
  0aa6  7ce3             jl 0xa8b                                 
  0aa8  66837ef800       cmp dword ptr [bp - 8], 0                
  0aad  7403             je 0xab2                                 
  0aaf  e99000           jmp 0xb42                                
  0ab2  33ff             xor di, di                               
  0ab4  eb52             jmp 0xb08                                
  0ab6  660fbf460a       movsx eax, word ptr [bp + 0xa]           
  0abb  660fbf560c       movsx edx, word ptr [bp + 0xc]           
  0ac0  660fafc2         imul eax, edx                            
  0ac4  66d1e0           shl eax, 1                               
  0ac7  668946fc         mov dword ptr [bp - 4], eax              
  0acb  8bc7             mov ax, di                               
  0acd  056400           add ax, 0x64                             
  0ad0  660fbfc0         movsx eax, ax                            
  0ad4  6650             push eax                                 
  0ad6  6a00             push 0                                   
  0ad8  66ff76fc         push dword ptr [bp - 4]                  
  0adc  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0ae1  83c40a           add sp, 0xa                              
  0ae4  8bdf             mov bx, di                               
  0ae6  c1e302           shl bx, 2                                
  0ae9  c47606           les si, ptr [bp + 6]                     
  0aec  03f3             add si, bx                               
  0aee  2689540c         mov word ptr es:[si + 0xc], dx           
  0af2  2689440a         mov word ptr es:[si + 0xa], ax           
  0af6  0bc2             or ax, dx                                
  0af8  750d             jne 0xb07                                
  0afa  66ff7606         push dword ptr [bp + 6]                  
  0afe  0e               push cs                                  
  0aff  e873fe           call 0x975                               
  0b02  83c404           add sp, 4                                
  0b05  eb30             jmp 0xb37                                
  0b07  47               inc di                                   
  0b08  3b7e0e           cmp di, word ptr [bp + 0xe]              
  0b0b  7ca9             jl 0xab6                                 
  0b0d  33ff             xor di, di                               
  0b0f  eb2c             jmp 0xb3d                                
  0b11  8bc7             mov ax, di                               
  0b13  c1e002           shl ax, 2                                
  0b16  c45e06           les bx, ptr [bp + 6]                     
  0b19  03d8             add bx, ax                               
  0b1b  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0b1f  260b470c         or ax, word ptr es:[bx + 0xc]            
  0b23  7517             jne 0xb3c                                
  0b25  57               push di                                  
  0b26  1e               push ds                                  
  0b27  680f35           push 0x350f                               ; "Plane handle %d not allocated"
  0b2a  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0b2f  83c406           add sp, 6                                
  0b32  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  0b37  33c0             xor ax, ax                               
  0b39  e9eafe           jmp 0xa26                                
  0b3c  47               inc di                                   
  0b3d  3b7e0e           cmp di, word ptr [bp + 0xe]              
  0b40  7ccf             jl 0xb11                                 
  0b42  c45e06           les bx, ptr [bp + 6]                     
  0b45  8a460e           mov al, byte ptr [bp + 0xe]              
  0b48  26884734         mov byte ptr es:[bx + 0x34], al          
  0b4c  6626c7472a000000 mov dword ptr es:[bx + 0x2a], 0          
  0b55  c41ee734         les bx, ptr [0x34e7]                     
  0b59  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0b5d  3b460e           cmp ax, word ptr [bp + 0xe]              
  0b60  7406             je 0xb68                                 
  0b62  837e0e01         cmp word ptr [bp + 0xe], 1               
  0b66  751c             jne 0xb84                                
  0b68  ff760c           push word ptr [bp + 0xc]                 
  0b6b  8b460a           mov ax, word ptr [bp + 0xa]              
  0b6e  8a0ea069         mov cl, byte ptr [0x69a0]                
  0b72  d3e0             shl ax, cl                               
  0b74  50               push ax                                  
  0b75  666a00           push 0                                   
  0b78  66ff7606         push dword ptr [bp + 6]                  
  0b7c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0b81  83c40c           add sp, 0xc                              
  0b84  c45e06           les bx, ptr [bp + 6]                     
  0b87  8b460a           mov ax, word ptr [bp + 0xa]              
  0b8a  26894708         mov word ptr es:[bx + 8], ax             
  0b8e  6626c7472e000000 mov dword ptr es:[bx + 0x2e], 0          
  0b97  26c6473200       mov byte ptr es:[bx + 0x32], 0           
  0b9c  26c6473300       mov byte ptr es:[bx + 0x33], 0           
  0ba1  26c747350000     mov word ptr es:[bx + 0x35], 0           
  0ba7  6626c74737000000 mov dword ptr es:[bx + 0x37], 0          
  0bb0  e970fe           jmp 0xa23                                
  0bb3  5f               pop di                                   
  0bb4  5e               pop si                                   
  0bb5  c9               leave                                    
  0bb6  cb               retf                                     

res_1012_0bb7:  ; ENTRY
  0bb7  55               push bp                                  
  0bb8  8bec             mov bp, sp                               
  0bba  83ec18           sub sp, 0x18                             
  0bbd  56               push si                                  
  0bbe  57               push di                                  
  0bbf  c746f60000       mov word ptr [bp - 0xa], 0               
  0bc4  668b4606         mov eax, dword ptr [bp + 6]              
  0bc8  668946e8         mov dword ptr [bp - 0x18], eax           
  0bcc  c746f40000       mov word ptr [bp - 0xc], 0               
  0bd1  8b460a           mov ax, word ptr [bp + 0xa]              
  0bd4  2306a469         and ax, word ptr [0x69a4]                
  0bd8  8bf8             mov di, ax                               
  0bda  0bff             or di, di                                
  0bdc  740e             je 0xbec                                 
  0bde  a1a469           mov ax, word ptr [0x69a4]                
  0be1  f7d0             not ax                                   
  0be3  21460a           and word ptr [bp + 0xa], ax              
  0be6  017e0e           add word ptr [bp + 0xe], di              
  0be9  897ef4           mov word ptr [bp - 0xc], di              
  0bec  8b460e           mov ax, word ptr [bp + 0xe]              
  0bef  8a0e9e69         mov cl, byte ptr [0x699e]                
  0bf3  d3f8             sar ax, cl                               
  0bf5  48               dec ax                                   
  0bf6  7d04             jge 0xbfc                                
  0bf8  33c0             xor ax, ax                               
  0bfa  eb0a             jmp 0xc06                                
  0bfc  8b460e           mov ax, word ptr [bp + 0xe]              
  0bff  8a0e9e69         mov cl, byte ptr [0x699e]                
  0c03  d3f8             sar ax, cl                               
  0c05  48               dec ax                                   
  0c06  8946f8           mov word ptr [bp - 8], ax                
  0c09  8b460e           mov ax, word ptr [bp + 0xe]              
  0c0c  03460a           add ax, word ptr [bp + 0xa]              
  0c0f  2306a469         and ax, word ptr [0x69a4]                
  0c13  8946f2           mov word ptr [bp - 0xe], ax              
  0c16  c45e06           les bx, ptr [bp + 6]                     
  0c19  26807f3401       cmp byte ptr es:[bx + 0x34], 1           
  0c1e  7703             ja 0xc23                                 
  0c20  e9cf01           jmp 0xdf2                                
  0c23  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0c26  8a87eb34         mov al, byte ptr [bx + 0x34eb]           
  0c2a  b400             mov ah, 0                                
  0c2c  8946f4           mov word ptr [bp - 0xc], ax              
  0c2f  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0c32  8a87f334         mov al, byte ptr [bx + 0x34f3]           
  0c36  b400             mov ah, 0                                
  0c38  8946f2           mov word ptr [bp - 0xe], ax              
  0c3b  8b460a           mov ax, word ptr [bp + 0xa]              
  0c3e  c1f803           sar ax, 3                                
  0c41  8b560a           mov dx, word ptr [bp + 0xa]              
  0c44  03560e           add dx, word ptr [bp + 0xe]              
  0c47  c1fa03           sar dx, 3                                
  0c4a  3bc2             cmp ax, dx                               
  0c4c  7511             jne 0xc5f                                
  0c4e  837ef800         cmp word ptr [bp - 8], 0                 
  0c52  750b             jne 0xc5f                                
  0c54  8b46f2           mov ax, word ptr [bp - 0xe]              
  0c57  2146f4           and word ptr [bp - 0xc], ax              
  0c5a  c746f60100       mov word ptr [bp - 0xa], 1               
  0c5f  c746ee0100       mov word ptr [bp - 0x12], 1              
  0c64  33ff             xor di, di                               
  0c66  e97601           jmp 0xddf                                
  0c69  8bc7             mov ax, di                               
  0c6b  c1e002           shl ax, 2                                
  0c6e  c45ee8           les bx, ptr [bp - 0x18]                  
  0c71  03d8             add bx, ax                               
  0c73  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0c77  260b470c         or ax, word ptr es:[bx + 0xc]            
  0c7b  7431             je 0xcae                                 
  0c7d  8b5ee8           mov bx, word ptr [bp - 0x18]             
  0c80  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0c86  7526             jne 0xcae                                
  0c88  8bc7             mov ax, di                               
  0c8a  c1e002           shl ax, 2                                
  0c8d  03d8             add bx, ax                               
  0c8f  6626ff770a       push dword ptr es:[bx + 0xa]             
  0c94  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0c99  83c404           add sp, 4                                
  0c9c  8bdf             mov bx, di                               
  0c9e  c1e302           shl bx, 2                                
  0ca1  c476e8           les si, ptr [bp - 0x18]                  
  0ca4  03f3             add si, bx                               
  0ca6  2689541c         mov word ptr es:[si + 0x1c], dx          
  0caa  2689441a         mov word ptr es:[si + 0x1a], ax          
  0cae  57               push di                                  
  0caf  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0cb4  59               pop cx                                   
  0cb5  8b46ee           mov ax, word ptr [bp - 0x12]             
  0cb8  854610           test word ptr [bp + 0x10], ax            
  0cbb  7405             je 0xcc2                                 
  0cbd  b8ff00           mov ax, 0xff                             
  0cc0  eb02             jmp 0xcc4                                
  0cc2  33c0             xor ax, ax                               
  0cc4  8946f0           mov word ptr [bp - 0x10], ax             
  0cc7  c45e06           les bx, ptr [bp + 6]                     
  0cca  26f747350100     test word ptr es:[bx + 0x35], 1          
  0cd0  7445             je 0xd17                                 
  0cd2  268b4706         mov ax, word ptr es:[bx + 6]             
  0cd6  3b460c           cmp ax, word ptr [bp + 0xc]              
  0cd9  7f3c             jg 0xd17                                 
  0cdb  26c45f37         les bx, ptr es:[bx + 0x37]               
  0cdf  8bc7             mov ax, di                               
  0ce1  c1e002           shl ax, 2                                
  0ce4  03d8             add bx, ax                               
  0ce6  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0cea  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0cee  c45e06           les bx, ptr [bp + 6]                     
  0cf1  52               push dx                                  
  0cf2  50               push ax                                  
  0cf3  8b460c           mov ax, word ptr [bp + 0xc]              
  0cf6  262b4706         sub ax, word ptr es:[bx + 6]             
  0cfa  26c45f37         les bx, ptr es:[bx + 0x37]               
  0cfe  26f76f08         imul word ptr es:[bx + 8]                
  0d02  d1e0             shl ax, 1                                
  0d04  8bd0             mov dx, ax                               
  0d06  58               pop ax                                   
  0d07  03c2             add ax, dx                               
  0d09  8b560a           mov dx, word ptr [bp + 0xa]              
  0d0c  8a0e9e69         mov cl, byte ptr [0x699e]                
  0d10  d3fa             sar dx, cl                               
  0d12  03c2             add ax, dx                               
  0d14  5a               pop dx                                   
  0d15  eb31             jmp 0xd48                                
  0d17  8bc7             mov ax, di                               
  0d19  c1e002           shl ax, 2                                
  0d1c  c45e06           les bx, ptr [bp + 6]                     
  0d1f  03d8             add bx, ax                               
  0d21  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0d25  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0d29  8b5e06           mov bx, word ptr [bp + 6]                
  0d2c  52               push dx                                  
  0d2d  50               push ax                                  
  0d2e  8b460c           mov ax, word ptr [bp + 0xc]              
  0d31  26f76f08         imul word ptr es:[bx + 8]                
  0d35  d1e0             shl ax, 1                                
  0d37  8bd0             mov dx, ax                               
  0d39  58               pop ax                                   
  0d3a  03c2             add ax, dx                               
  0d3c  8b560a           mov dx, word ptr [bp + 0xa]              
  0d3f  8a0e9e69         mov cl, byte ptr [0x699e]                
  0d43  d3fa             sar dx, cl                               
  0d45  03c2             add ax, dx                               
  0d47  5a               pop dx                                   
  0d48  8956fe           mov word ptr [bp - 2], dx                
  0d4b  8946fc           mov word ptr [bp - 4], ax                
  0d4e  c45efc           les bx, ptr [bp - 4]                     
  0d51  268a07           mov al, byte ptr es:[bx]                 
  0d54  8a56f4           mov dl, byte ptr [bp - 0xc]              
  0d57  f6d2             not dl                                   
  0d59  22c2             and al, dl                               
  0d5b  8a56f0           mov dl, byte ptr [bp - 0x10]             
  0d5e  2256f4           and dl, byte ptr [bp - 0xc]              
  0d61  0ac2             or al, dl                                
  0d63  268807           mov byte ptr es:[bx], al                 
  0d66  ff46fc           inc word ptr [bp - 4]                    
  0d69  8b46f8           mov ax, word ptr [bp - 8]                
  0d6c  8946fa           mov word ptr [bp - 6], ax                
  0d6f  eb0c             jmp 0xd7d                                
  0d71  c45efc           les bx, ptr [bp - 4]                     
  0d74  8a46f0           mov al, byte ptr [bp - 0x10]             
  0d77  268807           mov byte ptr es:[bx], al                 
  0d7a  ff46fc           inc word ptr [bp - 4]                    
  0d7d  8b46fa           mov ax, word ptr [bp - 6]                
  0d80  ff4efa           dec word ptr [bp - 6]                    
  0d83  0bc0             or ax, ax                                
  0d85  75ea             jne 0xd71                                
  0d87  837ef600         cmp word ptr [bp - 0xa], 0               
  0d8b  751b             jne 0xda8                                
  0d8d  c45efc           les bx, ptr [bp - 4]                     
  0d90  268a07           mov al, byte ptr es:[bx]                 
  0d93  8a56f2           mov dl, byte ptr [bp - 0xe]              
  0d96  f6d2             not dl                                   
  0d98  22c2             and al, dl                               
  0d9a  8a56f0           mov dl, byte ptr [bp - 0x10]             
  0d9d  2256f2           and dl, byte ptr [bp - 0xe]              
  0da0  0ac2             or al, dl                                
  0da2  268807           mov byte ptr es:[bx], al                 
  0da5  ff46fc           inc word ptr [bp - 4]                    
  0da8  8bc7             mov ax, di                               
  0daa  c1e002           shl ax, 2                                
  0dad  c45ee8           les bx, ptr [bp - 0x18]                  
  0db0  03d8             add bx, ax                               
  0db2  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0db6  260b470c         or ax, word ptr es:[bx + 0xc]            
  0dba  741f             je 0xddb                                 
  0dbc  8b5ee8           mov bx, word ptr [bp - 0x18]             
  0dbf  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0dc5  7514             jne 0xddb                                
  0dc7  8bc7             mov ax, di                               
  0dc9  c1e002           shl ax, 2                                
  0dcc  03d8             add bx, ax                               
  0dce  6626ff770a       push dword ptr es:[bx + 0xa]             
  0dd3  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0dd8  83c404           add sp, 4                                
  0ddb  47               inc di                                   
  0ddc  d166ee           shl word ptr [bp - 0x12], 1              
  0ddf  c45e06           les bx, ptr [bp + 6]                     
  0de2  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0de6  b400             mov ah, 0                                
  0de8  3bc7             cmp ax, di                               
  0dea  7e03             jle 0xdef                                
  0dec  e97afe           jmp 0xc69                                
  0def  e91201           jmp 0xf04                                
  0df2  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0df5  8a87fb34         mov al, byte ptr [bx + 0x34fb]           
  0df9  b400             mov ah, 0                                
  0dfb  8946f4           mov word ptr [bp - 0xc], ax              
  0dfe  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0e01  8a87ff34         mov al, byte ptr [bx + 0x34ff]           
  0e05  b400             mov ah, 0                                
  0e07  8946f2           mov word ptr [bp - 0xe], ax              
  0e0a  ff7610           push word ptr [bp + 0x10]                
  0e0d  0e               push cs                                  
  0e0e  e8b5f4           call 0x2c6                               
  0e11  59               pop cx                                   
  0e12  8846ed           mov byte ptr [bp - 0x13], al             
  0e15  8cd8             mov ax, ds                               
  0e17  394608           cmp word ptr [bp + 8], ax                
  0e1a  7529             jne 0xe45                                
  0e1c  817e062a34       cmp word ptr [bp + 6], 0x342a            
  0e21  7522             jne 0xe45                                
  0e23  c41ee734         les bx, ptr [0x34e7]                     
  0e27  268b5718         mov dx, word ptr es:[bx + 0x18]          
  0e2b  268b4716         mov ax, word ptr es:[bx + 0x16]          
  0e2f  8b5e0c           mov bx, word ptr [bp + 0xc]              
  0e32  d1e3             shl bx, 1                                
  0e34  0387d869         add ax, word ptr [bx + 0x69d8]           
  0e38  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0e3b  8a0e9e69         mov cl, byte ptr [0x699e]                
  0e3f  d3fb             sar bx, cl                               
  0e41  03c3             add ax, bx                               
  0e43  eb65             jmp 0xeaa                                
  0e45  c45e06           les bx, ptr [bp + 6]                     
  0e48  26f747350100     test word ptr es:[bx + 0x35], 1          
  0e4e  7433             je 0xe83                                 
  0e50  268b4706         mov ax, word ptr es:[bx + 6]             
  0e54  3b460c           cmp ax, word ptr [bp + 0xc]              
  0e57  7f2a             jg 0xe83                                 
  0e59  8b460c           mov ax, word ptr [bp + 0xc]              
  0e5c  262b4706         sub ax, word ptr es:[bx + 6]             
  0e60  26c45f37         les bx, ptr es:[bx + 0x37]               
  0e64  26f76f08         imul word ptr es:[bx + 8]                
  0e68  d1e0             shl ax, 1                                
  0e6a  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0e6e  50               push ax                                  
  0e6f  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0e73  5b               pop bx                                   
  0e74  03c3             add ax, bx                               
  0e76  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0e79  8a0e9e69         mov cl, byte ptr [0x699e]                
  0e7d  d3fb             sar bx, cl                               
  0e7f  03c3             add ax, bx                               
  0e81  eb27             jmp 0xeaa                                
  0e83  c45e06           les bx, ptr [bp + 6]                     
  0e86  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0e8a  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0e8e  52               push dx                                  
  0e8f  50               push ax                                  
  0e90  8b460c           mov ax, word ptr [bp + 0xc]              
  0e93  26f76f08         imul word ptr es:[bx + 8]                
  0e97  d1e0             shl ax, 1                                
  0e99  8bd0             mov dx, ax                               
  0e9b  58               pop ax                                   
  0e9c  03c2             add ax, dx                               
  0e9e  8b560a           mov dx, word ptr [bp + 0xa]              
  0ea1  8a0e9e69         mov cl, byte ptr [0x699e]                
  0ea5  d3fa             sar dx, cl                               
  0ea7  03c2             add ax, dx                               
  0ea9  5a               pop dx                                   
  0eaa  8956fe           mov word ptr [bp - 2], dx                
  0ead  8946fc           mov word ptr [bp - 4], ax                
  0eb0  c45efc           les bx, ptr [bp - 4]                     
  0eb3  268a07           mov al, byte ptr es:[bx]                 
  0eb6  8a56f4           mov dl, byte ptr [bp - 0xc]              
  0eb9  f6d2             not dl                                   
  0ebb  22c2             and al, dl                               
  0ebd  8a56ed           mov dl, byte ptr [bp - 0x13]             
  0ec0  2256f4           and dl, byte ptr [bp - 0xc]              
  0ec3  0ac2             or al, dl                                
  0ec5  268807           mov byte ptr es:[bx], al                 
  0ec8  ff46fc           inc word ptr [bp - 4]                    
  0ecb  8b46f8           mov ax, word ptr [bp - 8]                
  0ece  8946fa           mov word ptr [bp - 6], ax                
  0ed1  eb0c             jmp 0xedf                                
  0ed3  c45efc           les bx, ptr [bp - 4]                     
  0ed6  8a46ed           mov al, byte ptr [bp - 0x13]             
  0ed9  268807           mov byte ptr es:[bx], al                 
  0edc  ff46fc           inc word ptr [bp - 4]                    
  0edf  8b46fa           mov ax, word ptr [bp - 6]                
  0ee2  ff4efa           dec word ptr [bp - 6]                    
  0ee5  0bc0             or ax, ax                                
  0ee7  75ea             jne 0xed3                                
  0ee9  c45efc           les bx, ptr [bp - 4]                     
  0eec  268a07           mov al, byte ptr es:[bx]                 
  0eef  8a56f2           mov dl, byte ptr [bp - 0xe]              
  0ef2  f6d2             not dl                                   
  0ef4  22c2             and al, dl                               
  0ef6  8a56ed           mov dl, byte ptr [bp - 0x13]             
  0ef9  2256f2           and dl, byte ptr [bp - 0xe]              
  0efc  0ac2             or al, dl                                
  0efe  268807           mov byte ptr es:[bx], al                 
  0f01  ff46fc           inc word ptr [bp - 4]                    
  0f04  5f               pop di                                   
  0f05  5e               pop si                                   
  0f06  c9               leave                                    
  0f07  cb               retf                                     

res_1012_0f08:  ; ENTRY
  0f08  55               push bp                                  
  0f09  8bec             mov bp, sp                               
  0f0b  83ec10           sub sp, 0x10                             
  0f0e  56               push si                                  
  0f0f  57               push di                                  
  0f10  668b4606         mov eax, dword ptr [bp + 6]              
  0f14  668946f4         mov dword ptr [bp - 0xc], eax            
  0f18  833e843300       cmp word ptr [0x3384], 0                 
  0f1d  7503             jne 0xf22                                
  0f1f  e97701           jmp 0x1099                               
  0f22  c646ff01         mov byte ptr [bp - 1], 1                 
  0f26  8b460a           mov ax, word ptr [bp + 0xa]              
  0f29  250700           and ax, 7                                
  0f2c  ba0700           mov dx, 7                                
  0f2f  2bd0             sub dx, ax                               
  0f31  8956f2           mov word ptr [bp - 0xe], dx              
  0f34  c746f00000       mov word ptr [bp - 0x10], 0              
  0f39  e94901           jmp 0x1085                               
  0f3c  8b46f0           mov ax, word ptr [bp - 0x10]             
  0f3f  c1e002           shl ax, 2                                
  0f42  c45ef4           les bx, ptr [bp - 0xc]                   
  0f45  03d8             add bx, ax                               
  0f47  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0f4b  260b470c         or ax, word ptr es:[bx + 0xc]            
  0f4f  7433             je 0xf84                                 
  0f51  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0f54  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0f5a  7528             jne 0xf84                                
  0f5c  8b46f0           mov ax, word ptr [bp - 0x10]             
  0f5f  c1e002           shl ax, 2                                
  0f62  03d8             add bx, ax                               
  0f64  6626ff770a       push dword ptr es:[bx + 0xa]             
  0f69  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0f6e  83c404           add sp, 4                                
  0f71  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0f74  c1e302           shl bx, 2                                
  0f77  c476f4           les si, ptr [bp - 0xc]                   
  0f7a  03f3             add si, bx                               
  0f7c  2689541c         mov word ptr es:[si + 0x1c], dx          
  0f80  2689441a         mov word ptr es:[si + 0x1a], ax          
  0f84  ff76f0           push word ptr [bp - 0x10]                
  0f87  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0f8c  59               pop cx                                   
  0f8d  8a46ff           mov al, byte ptr [bp - 1]                
  0f90  b400             mov ah, 0                                
  0f92  854610           test word ptr [bp + 0x10], ax            
  0f95  7404             je 0xf9b                                 
  0f97  b001             mov al, 1                                
  0f99  eb02             jmp 0xf9d                                
  0f9b  b000             mov al, 0                                
  0f9d  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  0fa0  d2e0             shl al, cl                               
  0fa2  8846fe           mov byte ptr [bp - 2], al                
  0fa5  8b46f0           mov ax, word ptr [bp - 0x10]             
  0fa8  c1e002           shl ax, 2                                
  0fab  c45e06           les bx, ptr [bp + 6]                     
  0fae  03d8             add bx, ax                               
  0fb0  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0fb4  8b5e06           mov bx, word ptr [bp + 6]                
  0fb7  268b5708         mov dx, word ptr es:[bx + 8]             
  0fbb  d1e2             shl dx, 1                                
  0fbd  03c2             add ax, dx                               
  0fbf  8b560a           mov dx, word ptr [bp + 0xa]              
  0fc2  8a0e9e69         mov cl, byte ptr [0x699e]                
  0fc6  d3fa             sar dx, cl                               
  0fc8  03c2             add ax, dx                               
  0fca  8b56f0           mov dx, word ptr [bp - 0x10]             
  0fcd  c1e202           shl dx, 2                                
  0fd0  03da             add bx, dx                               
  0fd2  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  0fd6  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0fd9  d3fb             sar bx, cl                               
  0fdb  03d3             add dx, bx                               
  0fdd  33db             xor bx, bx                               
  0fdf  2bc2             sub ax, dx                               
  0fe1  83db00           sbb bx, 0                                
  0fe4  53               push bx                                  
  0fe5  50               push ax                                  
  0fe6  6658             pop eax                                  
  0fe8  8946f8           mov word ptr [bp - 8], ax                
  0feb  8b46f0           mov ax, word ptr [bp - 0x10]             
  0fee  c1e002           shl ax, 2                                
  0ff1  8b5e06           mov bx, word ptr [bp + 6]                
  0ff4  03d8             add bx, ax                               
  0ff6  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  0ffa  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  0ffe  8b5e06           mov bx, word ptr [bp + 6]                
  1001  50               push ax                                  
  1002  8b460c           mov ax, word ptr [bp + 0xc]              
  1005  52               push dx                                  
  1006  26f76f08         imul word ptr es:[bx + 8]                
  100a  d1e0             shl ax, 1                                
  100c  5a               pop dx                                   
  100d  03d0             add dx, ax                               
  100f  8b460a           mov ax, word ptr [bp + 0xa]              
  1012  d3f8             sar ax, cl                               
  1014  03d0             add dx, ax                               
  1016  58               pop ax                                   
  1017  8946fc           mov word ptr [bp - 4], ax                
  101a  8956fa           mov word ptr [bp - 6], dx                
  101d  8b7e0c           mov di, word ptr [bp + 0xc]              
  1020  eb1e             jmp 0x1040                               
  1022  c45efa           les bx, ptr [bp - 6]                     
  1025  268a07           mov al, byte ptr es:[bx]                 
  1028  b201             mov dl, 1                                
  102a  8a4ef2           mov cl, byte ptr [bp - 0xe]              
  102d  d2e2             shl dl, cl                               
  102f  f6d2             not dl                                   
  1031  22c2             and al, dl                               
  1033  0a46fe           or al, byte ptr [bp - 2]                 
  1036  268807           mov byte ptr es:[bx], al                 
  1039  8b46f8           mov ax, word ptr [bp - 8]                
  103c  0146fa           add word ptr [bp - 6], ax                
  103f  47               inc di                                   
  1040  8b460c           mov ax, word ptr [bp + 0xc]              
  1043  03460e           add ax, word ptr [bp + 0xe]              
  1046  3bc7             cmp ax, di                               
  1048  7fd8             jg 0x1022                                
  104a  d066ff           shl byte ptr [bp - 1], 1                 
  104d  8b46f0           mov ax, word ptr [bp - 0x10]             
  1050  c1e002           shl ax, 2                                
  1053  c45ef4           les bx, ptr [bp - 0xc]                   
  1056  03d8             add bx, ax                               
  1058  268b470a         mov ax, word ptr es:[bx + 0xa]           
  105c  260b470c         or ax, word ptr es:[bx + 0xc]            
  1060  7420             je 0x1082                                
  1062  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1065  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  106b  7515             jne 0x1082                               
  106d  8b46f0           mov ax, word ptr [bp - 0x10]             
  1070  c1e002           shl ax, 2                                
  1073  03d8             add bx, ax                               
  1075  6626ff770a       push dword ptr es:[bx + 0xa]             
  107a  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  107f  83c404           add sp, 4                                
  1082  ff46f0           inc word ptr [bp - 0x10]                 
  1085  c45e06           les bx, ptr [bp + 6]                     
  1088  268a4734         mov al, byte ptr es:[bx + 0x34]          
  108c  b400             mov ah, 0                                
  108e  3b46f0           cmp ax, word ptr [bp - 0x10]             
  1091  7e03             jle 0x1096                               
  1093  e9a6fe           jmp 0xf3c                                
  1096  e9fc00           jmp 0x1195                               
  1099  8b5e0a           mov bx, word ptr [bp + 0xa]              
  109c  231ea469         and bx, word ptr [0x69a4]                
  10a0  8a870335         mov al, byte ptr [bx + 0x3503]           
  10a4  f6d0             not al                                   
  10a6  8846ff           mov byte ptr [bp - 1], al                
  10a9  ff7610           push word ptr [bp + 0x10]                
  10ac  0e               push cs                                  
  10ad  e816f2           call 0x2c6                               
  10b0  59               pop cx                                   
  10b1  8a56ff           mov dl, byte ptr [bp - 1]                
  10b4  f6d2             not dl                                   
  10b6  22c2             and al, dl                               
  10b8  8846fe           mov byte ptr [bp - 2], al                
  10bb  8cd8             mov ax, ds                               
  10bd  394608           cmp word ptr [bp + 8], ax                
  10c0  754e             jne 0x1110                               
  10c2  817e062a34       cmp word ptr [bp + 6], 0x342a            
  10c7  7547             jne 0x1110                               
  10c9  8b7e0c           mov di, word ptr [bp + 0xc]              
  10cc  eb35             jmp 0x1103                               
  10ce  c41ee734         les bx, ptr [0x34e7]                     
  10d2  268b4718         mov ax, word ptr es:[bx + 0x18]          
  10d6  268b5716         mov dx, word ptr es:[bx + 0x16]          
  10da  8bdf             mov bx, di                               
  10dc  d1e3             shl bx, 1                                
  10de  0397d869         add dx, word ptr [bx + 0x69d8]           
  10e2  8b5e0a           mov bx, word ptr [bp + 0xa]              
  10e5  8a0e9e69         mov cl, byte ptr [0x699e]                
  10e9  d3fb             sar bx, cl                               
  10eb  03d3             add dx, bx                               
  10ed  8946fc           mov word ptr [bp - 4], ax                
  10f0  8956fa           mov word ptr [bp - 6], dx                
  10f3  c45efa           les bx, ptr [bp - 6]                     
  10f6  268a07           mov al, byte ptr es:[bx]                 
  10f9  2246ff           and al, byte ptr [bp - 1]                
  10fc  0a46fe           or al, byte ptr [bp - 2]                 
  10ff  268807           mov byte ptr es:[bx], al                 
  1102  47               inc di                                   
  1103  8b460c           mov ax, word ptr [bp + 0xc]              
  1106  03460e           add ax, word ptr [bp + 0xe]              
  1109  3bc7             cmp ax, di                               
  110b  7fc1             jg 0x10ce                                
  110d  e98500           jmp 0x1195                               
  1110  8b7e0c           mov di, word ptr [bp + 0xc]              
  1113  eb76             jmp 0x118b                               
  1115  c45e06           les bx, ptr [bp + 6]                     
  1118  26f747350100     test word ptr es:[bx + 0x35], 1          
  111e  742f             je 0x114f                                
  1120  26397f06         cmp word ptr es:[bx + 6], di             
  1124  7f29             jg 0x114f                                
  1126  8bc7             mov ax, di                               
  1128  262b4706         sub ax, word ptr es:[bx + 6]             
  112c  26c45f37         les bx, ptr es:[bx + 0x37]               
  1130  26f76f08         imul word ptr es:[bx + 8]                
  1134  d1e0             shl ax, 1                                
  1136  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  113a  50               push ax                                  
  113b  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  113f  5b               pop bx                                   
  1140  03c3             add ax, bx                               
  1142  8b5e0a           mov bx, word ptr [bp + 0xa]              
  1145  8a0e9e69         mov cl, byte ptr [0x699e]                
  1149  d3fb             sar bx, cl                               
  114b  03c3             add ax, bx                               
  114d  eb26             jmp 0x1175                               
  114f  c45e06           les bx, ptr [bp + 6]                     
  1152  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  1156  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  115a  52               push dx                                  
  115b  50               push ax                                  
  115c  8bc7             mov ax, di                               
  115e  26f76f08         imul word ptr es:[bx + 8]                
  1162  d1e0             shl ax, 1                                
  1164  8bd0             mov dx, ax                               
  1166  58               pop ax                                   
  1167  03c2             add ax, dx                               
  1169  8b560a           mov dx, word ptr [bp + 0xa]              
  116c  8a0e9e69         mov cl, byte ptr [0x699e]                
  1170  d3fa             sar dx, cl                               
  1172  03c2             add ax, dx                               
  1174  5a               pop dx                                   
  1175  8956fc           mov word ptr [bp - 4], dx                
  1178  8946fa           mov word ptr [bp - 6], ax                
  117b  c45efa           les bx, ptr [bp - 6]                     
  117e  268a07           mov al, byte ptr es:[bx]                 
  1181  2246ff           and al, byte ptr [bp - 1]                
  1184  0a46fe           or al, byte ptr [bp - 2]                 
  1187  268807           mov byte ptr es:[bx], al                 
  118a  47               inc di                                   
  118b  8b460c           mov ax, word ptr [bp + 0xc]              
  118e  03460e           add ax, word ptr [bp + 0xe]              
  1191  3bc7             cmp ax, di                               
  1193  7f80             jg 0x1115                                
  1195  5f               pop di                                   
  1196  5e               pop si                                   
  1197  c9               leave                                    
  1198  cb               retf                                     
  1199  55               push bp                                  
  119a  8bec             mov bp, sp                               
  119c  83ec1a           sub sp, 0x1a                             
  119f  8b4606           mov ax, word ptr [bp + 6]                
  11a2  2b460a           sub ax, word ptr [bp + 0xa]              
  11a5  99               cdq                                      
  11a6  33c2             xor ax, dx                               
  11a8  2bc2             sub ax, dx                               
  11aa  8946e6           mov word ptr [bp - 0x1a], ax             
  11ad  cd3b             int 0x3b                                 
  11af  46               inc si                                   
  11b0  e6cd             out 0xcd, al                             
  11b2  395ef8           cmp word ptr [bp - 8], bx                
  11b5  cd3d             int 0x3d                                 
  11b7  8b4608           mov ax, word ptr [bp + 8]                
  11ba  2b460c           sub ax, word ptr [bp + 0xc]              
  11bd  99               cdq                                      
  11be  33c2             xor ax, dx                               
  11c0  2bc2             sub ax, dx                               
  11c2  8946e6           mov word ptr [bp - 0x1a], ax             
  11c5  cd3b             int 0x3b                                 
  11c7  46               inc si                                   
  11c8  e6cd             out 0xcd, al                             
  11ca  395ef0           cmp word ptr [bp - 0x10], bx             
  11cd  cd39             int 0x39                                 
  11cf  46               inc si                                   
  11d0  f8               clc                                      
  11d1  cd38             int 0x38                                 
  11d3  4e               dec si                                   
  11d4  f8               clc                                      
  11d5  cd39             int 0x39                                 
  11d7  46               inc si                                   
  11d8  f0               db f0                                    
  11d9  cd38             int 0x38                                 
  11db  4e               dec si                                   
  11dc  f0               db f0                                    
  11dd  cd3a             int 0x3a                                 
  11df  c1cd39           ror bp, 0x39                             
  11e2  5e               pop si                                   
  11e3  e8cd39           call 0x4bb3                              
  11e6  46               inc si                                   
  11e7  e8cd35           call 0x47b7                              
  11ea  ee               out dx, al                               
  11eb  cd3a             int 0x3a                                 
  11ed  d9cd             fxch st(5)                               
  11ef  397ee6           cmp word ptr [bp - 0x1a], di             
  11f2  cd3d             int 0x3d                                 
  11f4  8b46e6           mov ax, word ptr [bp - 0x1a]             
  11f7  9e               sahf                                     
  11f8  7605             jbe 0x11ff                               
  11fa  b81027           mov ax, 0x2710                           
  11fd  eb1c             jmp 0x121b                               
  11ff  cd39             int 0x39                                 
  1201  46               inc si                                   
  1202  e883ec           call 0xfffffe88                          
  1205  08cd             or ch, cl                                
  1207  395ede           cmp word ptr [bp - 0x22], bx             
  120a  cd3d             int 0x3d                                 
  120c  9a6a1a0000       lcall 0, 0x1a6a                          -> 0000:1a6a
  1211  83c408           add sp, 8                                
  1214  9a571b0000       lcall 0, 0x1b57                          -> 0000:1b57
  1219  ebe2             jmp 0x11fd                               
  121b  c9               leave                                    
  121c  cb               retf                                     
  121d  55               push bp                                  
