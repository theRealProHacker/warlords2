; ovl60 stub 30cc file_off 0x75700 size 0xec6

ovl60_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec56           sub sp, 0x56                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7e06           mov di, word ptr [bp + 6]                
  000b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0010  9a2f002031       lcall 0x3120, 0x2f                       -> ovl68:092f
  0015  1e               push ds                                  
  0016  68672a           push 0x2a67                               ; "random"
  0019  1e               push ds                                  
  001a  68a05d           push 0x5da0                              
  001d  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  0022  83c408           add sp, 8                                
  0025  0bc0             or ax, ax                                
  0027  7506             jne 0x2f                                 
  0029  c706c8280100     mov word ptr [0x28c8], 1                 
  002f  c706c6280100     mov word ptr [0x28c6], 1                 
  0035  6a01             push 1                                   
  0037  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  003c  59               pop cx                                   
  003d  0bff             or di, di                                
  003f  7503             jne 0x44                                 
  0041  e9a500           jmp 0xe9                                 
  0044  6a00             push 0                                   
  0046  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  004b  59               pop cx                                   
  004c  6a01             push 1                                   
  004e  9aca00d730       lcall 0x30d7, 0xca                       -> ovl61:092a
  0053  59               pop cx                                   
  0054  833ec82800       cmp word ptr [0x28c8], 0                 
  0059  7403             je 0x5e                                  
  005b  e98b00           jmp 0xe9                                 
  005e  833e0c2a00       cmp word ptr [0x2a0c], 0                 
  0063  7403             je 0x68                                  
  0065  e98100           jmp 0xe9                                 
  0068  c7060c2a0100     mov word ptr [0x2a0c], 1                 
  006e  33f6             xor si, si                               
  0070  c746fe0000       mov word ptr [bp - 2], 0                 
  0075  eb6c             jmp 0xe3                                 
  0077  16               push ss                                  
  0078  8d46aa           lea ax, [bp - 0x56]                      
  007b  50               push ax                                  
  007c  56               push si                                  
  007d  90               nop                                      
  007e  0e               push cs                                  
  007f  e84606           call 0x6c8                               
  0082  83c406           add sp, 6                                
  0085  0bc0             or ax, ax                                
  0087  742f             je 0xb8                                  
  0089  1e               push ds                                  
  008a  686e2a           push 0x2a6e                               ; "Erythea"
  008d  16               push ss                                  
  008e  8d46be           lea ax, [bp - 0x42]                      
  0091  50               push ax                                  
  0092  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  0097  83c408           add sp, 8                                
  009a  0bc0             or ax, ax                                
  009c  7517             jne 0xb5                                 
  009e  8936ce28         mov word ptr [0x28ce], si                
  00a2  1e               push ds                                  
  00a3  68645d           push 0x5d64                              
  00a6  8d46aa           lea ax, [bp - 0x56]                      
  00a9  16               push ss                                  
  00aa  50               push ax                                  
  00ab  b95400           mov cx, 0x54                             
  00ae  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  00b3  eb34             jmp 0xe9                                 
  00b5  46               inc si                                   
  00b6  eb2b             jmp 0xe3                                 
  00b8  c746fe0100       mov word ptr [bp - 2], 1                 
  00bd  c706ce280000     mov word ptr [0x28ce], 0                 
  00c3  16               push ss                                  
  00c4  8d46aa           lea ax, [bp - 0x56]                      
  00c7  50               push ax                                  
  00c8  6a00             push 0                                   
  00ca  90               nop                                      
  00cb  0e               push cs                                  
  00cc  e8f905           call 0x6c8                               
  00cf  83c406           add sp, 6                                
  00d2  1e               push ds                                  
  00d3  68645d           push 0x5d64                              
  00d6  8d46aa           lea ax, [bp - 0x56]                      
  00d9  16               push ss                                  
  00da  50               push ax                                  
  00db  b95400           mov cx, 0x54                             
  00de  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  00e3  837efe00         cmp word ptr [bp - 2], 0                 
  00e7  748e             je 0x77                                  
  00e9  6aff             push -1                                  
  00eb  90               nop                                      
  00ec  0e               push cs                                  
  00ed  e84202           call 0x332                               
  00f0  59               pop cx                                   
  00f1  90               nop                                      
  00f2  0e               push cs                                  
  00f3  e8c901           call 0x2bf                               
  00f6  90               nop                                      
  00f7  0e               push cs                                  
  00f8  e82300           call 0x11e                               
  00fb  6a00             push 0                                   
  00fd  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0102  59               pop cx                                   
  0103  0bff             or di, di                                
  0105  7408             je 0x10f                                 
  0107  6a02             push 2                                   
  0109  9a6100ba30       lcall 0x30ba, 0x61                       -> ovl58:026f
  010e  59               pop cx                                   
  010f  c7066a160000     mov word ptr [0x166a], 0                 
  0115  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  011a  5f               pop di                                   
  011b  5e               pop si                                   
  011c  c9               leave                                    
  011d  cb               retf                                     

ovl60_011e:  ; ENTRY
  011e  55               push bp                                  
  011f  8bec             mov bp, sp                               
  0121  56               push si                                  
  0122  666864000100     push 0x10064                             
  0128  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  012d  83c404           add sp, 4                                
  0130  666867000100     push 0x10067                             
  0136  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  013b  83c404           add sp, 4                                
  013e  9a4d007f30       lcall 0x307f, 0x4d                       -> ovl49:0e25
  0143  0bc0             or ax, ax                                
  0145  7404             je 0x14b                                 
  0147  6a01             push 1                                   
  0149  eb02             jmp 0x14d                                
  014b  6a02             push 2                                   
  014d  6a65             push 0x65                                
  014f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0154  83c404           add sp, 4                                
  0157  833ec82800       cmp word ptr [0x28c8], 0                 
  015c  7404             je 0x162                                 
  015e  6a02             push 2                                   
  0160  eb02             jmp 0x164                                
  0162  6a01             push 1                                   
  0164  6a66             push 0x66                                
  0166  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  016b  83c404           add sp, 4                                
  016e  833ec82800       cmp word ptr [0x28c8], 0                 
  0173  7459             je 0x1ce                                 
  0175  666868000100     push 0x10068                             
  017b  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0180  83c404           add sp, 4                                
  0183  666869000100     push 0x10069                             
  0189  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  018e  83c404           add sp, 4                                
  0191  33f6             xor si, si                               
  0193  eb32             jmp 0x1c7                                
  0195  8bde             mov bx, si                               
  0197  d1e3             shl bx, 1                                
  0199  83bfd82800       cmp word ptr [bx + 0x28d8], 0            
  019e  7405             je 0x1a5                                 
  01a0  b80100           mov ax, 1                                
  01a3  eb02             jmp 0x1a7                                
  01a5  33c0             xor ax, ax                               
  01a7  50               push ax                                  
  01a8  8bc6             mov ax, si                               
  01aa  056e00           add ax, 0x6e                             
  01ad  50               push ax                                  
  01ae  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  01b3  83c404           add sp, 4                                
  01b6  6a01             push 1                                   
  01b8  8bc6             mov ax, si                               
  01ba  056a00           add ax, 0x6a                             
  01bd  50               push ax                                  
  01be  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  01c3  83c404           add sp, 4                                
  01c6  46               inc si                                   
  01c7  83fe04           cmp si, 4                                
  01ca  7cc9             jl 0x195                                 
  01cc  eb32             jmp 0x200                                
  01ce  6a68             push 0x68                                
  01d0  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  01d5  59               pop cx                                   
  01d6  6a69             push 0x69                                
  01d8  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  01dd  59               pop cx                                   
  01de  33f6             xor si, si                               
  01e0  eb19             jmp 0x1fb                                
  01e2  8bc6             mov ax, si                               
  01e4  056e00           add ax, 0x6e                             
  01e7  50               push ax                                  
  01e8  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  01ed  59               pop cx                                   
  01ee  8bc6             mov ax, si                               
  01f0  056a00           add ax, 0x6a                             
  01f3  50               push ax                                  
  01f4  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  01f9  59               pop cx                                   
  01fa  46               inc si                                   
  01fb  83fe04           cmp si, 4                                
  01fe  7ce2             jl 0x1e2                                 
  0200  666a00           push 0                                   
  0203  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0208  83c404           add sp, 4                                
  020b  6668f2010000     push 0x1f2                               
  0211  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0216  83c404           add sp, 4                                
  0219  6668f4010000     push 0x1f4                               
  021f  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0224  83c404           add sp, 4                                
  0227  6668f5010000     push 0x1f5                               
  022d  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0232  83c404           add sp, 4                                
  0235  6668f7010000     push 0x1f7                               
  023b  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0240  83c404           add sp, 4                                
  0243  9a4d007f30       lcall 0x307f, 0x4d                       -> ovl49:0e25
  0248  0bc0             or ax, ax                                
  024a  7404             je 0x250                                 
  024c  6a01             push 1                                   
  024e  eb02             jmp 0x252                                
  0250  6a00             push 0                                   
  0252  68f601           push 0x1f6                               
  0255  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  025a  83c404           add sp, 4                                
  025d  9a52007f30       lcall 0x307f, 0x52                       -> ovl49:0e42
  0262  0bc0             or ax, ax                                
  0264  7404             je 0x26a                                 
  0266  6a01             push 1                                   
  0268  eb02             jmp 0x26c                                
  026a  6a00             push 0                                   
  026c  68f801           push 0x1f8                               
  026f  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0274  83c404           add sp, 4                                
  0277  6668f9010100     push 0x101f9                             
  027d  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0282  83c404           add sp, 4                                
  0285  666a02           push 2                                   
  0288  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  028d  83c404           add sp, 4                                
  0290  666a03           push 3                                   
  0293  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0298  83c404           add sp, 4                                
  029b  666a04           push 4                                   
  029e  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  02a3  83c404           add sp, 4                                
  02a6  666a05           push 5                                   
  02a9  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  02ae  83c404           add sp, 4                                
  02b1  666a07           push 7                                   
  02b4  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  02b9  83c404           add sp, 4                                
  02bc  5e               pop si                                   
  02bd  5d               pop bp                                   
  02be  cb               retf                                     

ovl60_02bf:  ; ENTRY
  02bf  55               push bp                                  
  02c0  8bec             mov bp, sp                               
  02c2  83ec1e           sub sp, 0x1e                             
  02c5  6a03             push 3                                   
  02c7  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  02cc  59               pop cx                                   
  02cd  1e               push ds                                  
  02ce  684029           push 0x2940                              
  02d1  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  02d6  83c404           add sp, 4                                
  02d9  833ec82800       cmp word ptr [0x28c8], 0                 
  02de  7419             je 0x2f9                                 
  02e0  666a00           push 0                                   
  02e3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02e8  83c404           add sp, 4                                
  02eb  52               push dx                                  
  02ec  50               push ax                                  
  02ed  16               push ss                                  
  02ee  8d46e2           lea ax, [bp - 0x1e]                      
  02f1  50               push ax                                  
  02f2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02f7  eb0e             jmp 0x307                                
  02f9  1e               push ds                                  
  02fa  68805d           push 0x5d80                              
  02fd  16               push ss                                  
  02fe  8d46e2           lea ax, [bp - 0x1e]                      
  0301  50               push ax                                  
  0302  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0307  83c408           add sp, 8                                
  030a  666800000300     push 0x30000                             
  0310  666802000f00     push 0xf0002                             
  0316  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  031b  83c408           add sp, 8                                
  031e  16               push ss                                  
  031f  8d46e2           lea ax, [bp - 0x1e]                      
  0322  50               push ax                                  
  0323  66ff363c29       push dword ptr [0x293c]                  
  0328  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  032d  83c408           add sp, 8                                
  0330  c9               leave                                    
  0331  cb               retf                                     

ovl60_0332:  ; ENTRY
  0332  55               push bp                                  
  0333  8bec             mov bp, sp                               
  0335  83ec48           sub sp, 0x48                             
  0338  56               push si                                  
  0339  57               push di                                  
  033a  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  033f  833ec82800       cmp word ptr [0x28c8], 0                 
  0344  751f             jne 0x365                                
  0346  66ff363829       push dword ptr [0x2938]                  
  034b  b82829           mov ax, 0x2928                           
  034e  8cda             mov dx, ds                               
  0350  b90800           mov cx, 8                                
  0353  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0358  6a02             push 2                                   
  035a  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  035f  83c40e           add sp, 0xe                              
  0362  e9a401           jmp 0x509                                
  0365  6a03             push 3                                   
  0367  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  036c  59               pop cx                                   
  036d  837e0600         cmp word ptr [bp + 6], 0                 
  0371  7d06             jge 0x379                                
  0373  1e               push ds                                  
  0374  683029           push 0x2930                              
  0377  eb0b             jmp 0x384                                
  0379  1e               push ds                                  
  037a  8b4606           mov ax, word ptr [bp + 6]                
  037d  c1e003           shl ax, 3                                
  0380  054829           add ax, 0x2948                           
  0383  50               push ax                                  
  0384  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0389  83c404           add sp, 4                                
  038c  666800000300     push 0x30000                             
  0392  666802000f00     push 0xf0002                             
  0398  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  039d  83c408           add sp, 8                                
  03a0  837e06ff         cmp word ptr [bp + 6], -1                
  03a4  7409             je 0x3af                                 
  03a6  837e0603         cmp word ptr [bp + 6], 3                 
  03aa  7e03             jle 0x3af                                
  03ac  e90001           jmp 0x4af                                
  03af  837e0600         cmp word ptr [bp + 6], 0                 
  03b3  7d04             jge 0x3b9                                
  03b5  33c0             xor ax, ax                               
  03b7  eb03             jmp 0x3bc                                
  03b9  8b4606           mov ax, word ptr [bp + 6]                
  03bc  8bf8             mov di, ax                               
  03be  e9d900           jmp 0x49a                                
  03c1  57               push di                                  
  03c2  6a02             push 2                                   
  03c4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03c9  83c404           add sp, 4                                
  03cc  52               push dx                                  
  03cd  50               push ax                                  
  03ce  8bdf             mov bx, di                               
  03d0  c1e302           shl bx, 2                                
  03d3  ffb77a29         push word ptr [bx + 0x297a]              
  03d7  8bdf             mov bx, di                               
  03d9  c1e302           shl bx, 2                                
  03dc  ffb77829         push word ptr [bx + 0x2978]              
  03e0  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  03e5  83c408           add sp, 8                                
  03e8  8bdf             mov bx, di                               
  03ea  d1e3             shl bx, 1                                
  03ec  83bfd82800       cmp word ptr [bx + 0x28d8], 0            
  03f1  741c             je 0x40f                                 
  03f3  8bdf             mov bx, di                               
  03f5  c1e302           shl bx, 2                                
  03f8  66ffb79c29       push dword ptr [bx + 0x299c]             
  03fd  8bdf             mov bx, di                               
  03ff  d1e3             shl bx, 1                                
  0401  8b87d028         mov ax, word ptr [bx + 0x28d0]           
  0405  c1e003           shl ax, 3                                
  0408  8cda             mov dx, ds                               
  040a  05cc29           add ax, 0x29cc                           
  040d  eb0f             jmp 0x41e                                
  040f  8bdf             mov bx, di                               
  0411  c1e302           shl bx, 2                                
  0414  66ffb79c29       push dword ptr [bx + 0x299c]             
  0419  b8042a           mov ax, 0x2a04                           
  041c  8cda             mov dx, ds                               
  041e  b90800           mov cx, 8                                
  0421  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0426  6a01             push 1                                   
  0428  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  042d  83c40e           add sp, 0xe                              
  0430  8bdf             mov bx, di                               
  0432  d1e3             shl bx, 1                                
  0434  83bfd82800       cmp word ptr [bx + 0x28d8], 0            
  0439  7513             jne 0x44e                                
  043b  1e               push ds                                  
  043c  68762a           push 0x2a76                              
  043f  16               push ss                                  
  0440  8d46ec           lea ax, [bp - 0x14]                      
  0443  50               push ax                                  
  0444  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0449  83c408           add sp, 8                                
  044c  eb2c             jmp 0x47a                                
  044e  8bdf             mov bx, di                               
  0450  6bdb0e           imul bx, bx, 0xe                         
  0453  8bf7             mov si, di                               
  0455  d1e6             shl si, 1                                
  0457  8b84d028         mov ax, word ptr [si + 0x28d0]           
  045b  d1e0             shl ax, 1                                
  045d  03d8             add bx, ax                               
  045f  ffb7e028         push word ptr [bx + 0x28e0]              
  0463  8bdf             mov bx, di                               
  0465  c1e302           shl bx, 2                                
  0468  66ffb71829       push dword ptr [bx + 0x2918]             
  046d  16               push ss                                  
  046e  8d46ec           lea ax, [bp - 0x14]                      
  0471  50               push ax                                  
  0472  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0477  83c40a           add sp, 0xa                              
  047a  16               push ss                                  
  047b  8d46ec           lea ax, [bp - 0x14]                      
  047e  50               push ax                                  
  047f  8bdf             mov bx, di                               
  0481  c1e302           shl bx, 2                                
  0484  ffb77a29         push word ptr [bx + 0x297a]              
  0488  8bdf             mov bx, di                               
  048a  c1e302           shl bx, 2                                
  048d  ffb78c29         push word ptr [bx + 0x298c]              
  0491  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0496  83c408           add sp, 8                                
  0499  47               inc di                                   
  049a  837e0600         cmp word ptr [bp + 6], 0                 
  049e  7d05             jge 0x4a5                                
  04a0  b80300           mov ax, 3                                
  04a3  eb03             jmp 0x4a8                                
  04a5  8b4606           mov ax, word ptr [bp + 6]                
  04a8  3bc7             cmp ax, di                               
  04aa  7c03             jl 0x4af                                 
  04ac  e912ff           jmp 0x3c1                                
  04af  837e06ff         cmp word ptr [bp + 6], -1                
  04b3  7406             je 0x4bb                                 
  04b5  837e0604         cmp word ptr [bp + 6], 4                 
  04b9  7524             jne 0x4df                                
  04bb  16               push ss                                  
  04bc  8d46b8           lea ax, [bp - 0x48]                      
  04bf  50               push ax                                  
  04c0  ff36ca28         push word ptr [0x28ca]                   
  04c4  90               nop                                      
  04c5  0e               push cs                                  
  04c6  e88409           call 0xe4d                               
  04c9  83c406           add sp, 6                                
  04cc  16               push ss                                  
  04cd  8d46ba           lea ax, [bp - 0x46]                      
  04d0  50               push ax                                  
  04d1  666850015401     push 0x1540150                           
  04d7  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04dc  83c408           add sp, 8                                
  04df  837e06ff         cmp word ptr [bp + 6], -1                
  04e3  7406             je 0x4eb                                 
  04e5  837e0605         cmp word ptr [bp + 6], 5                 
  04e9  751e             jne 0x509                                
  04eb  ff36cc28         push word ptr [0x28cc]                   
  04ef  6a03             push 3                                   
  04f1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  04f6  83c404           add sp, 4                                
  04f9  52               push dx                                  
  04fa  50               push ax                                  
  04fb  666850016d01     push 0x16d0150                           
  0501  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0506  83c408           add sp, 8                                
  0509  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  050e  5f               pop di                                   
  050f  5e               pop si                                   
  0510  c9               leave                                    
  0511  cb               retf                                     

ovl60_0512:  ; ENTRY
  0512  55               push bp                                  
  0513  8bec             mov bp, sp                               
  0515  83ec06           sub sp, 6                                
  0518  56               push si                                  
  0519  8b7606           mov si, word ptr [bp + 6]                
  051c  8bde             mov bx, si                               
  051e  d1e3             shl bx, 1                                
  0520  83bfd82800       cmp word ptr [bx + 0x28d8], 0            
  0525  7433             je 0x55a                                 
  0527  16               push ss                                  
  0528  8d46fc           lea ax, [bp - 4]                         
  052b  50               push ax                                  
  052c  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0531  83c404           add sp, 4                                
  0534  8bde             mov bx, si                               
  0536  c1e303           shl bx, 3                                
  0539  8b46fc           mov ax, word ptr [bp - 4]                
  053c  2b87ac29         sub ax, word ptr [bx + 0x29ac]           
  0540  6bc007           imul ax, ax, 7                           
  0543  8bde             mov bx, si                               
  0545  c1e303           shl bx, 3                                
  0548  99               cdq                                      
  0549  f7bfb029         idiv word ptr [bx + 0x29b0]              
  054d  8946fa           mov word ptr [bp - 6], ax                
  0550  8bde             mov bx, si                               
  0552  d1e3             shl bx, 1                                
  0554  8987d028         mov word ptr [bx + 0x28d0], ax           
  0558  eb0a             jmp 0x564                                
  055a  8bde             mov bx, si                               
  055c  d1e3             shl bx, 1                                
  055e  c787d8280100     mov word ptr [bx + 0x28d8], 1            
  0564  56               push si                                  
  0565  0e               push cs                                  
  0566  e8c9fd           call 0x332                               
  0569  59               pop cx                                   
  056a  0e               push cs                                  
  056b  e8b0fb           call 0x11e                               
  056e  5e               pop si                                   
  056f  c9               leave                                    
  0570  cb               retf                                     

ovl60_0571:  ; ENTRY
  0571  55               push bp                                  
  0572  8bec             mov bp, sp                               
  0574  8b4606           mov ax, word ptr [bp + 6]                
  0577  8bd8             mov bx, ax                               
  0579  d1e3             shl bx, 1                                
  057b  c787d8280000     mov word ptr [bx + 0x28d8], 0            
  0581  50               push ax                                  
  0582  0e               push cs                                  
  0583  e8acfd           call 0x332                               
  0586  59               pop cx                                   
  0587  0e               push cs                                  
  0588  e893fb           call 0x11e                               
  058b  5d               pop bp                                   
  058c  cb               retf                                     

ovl60_058d:  ; ENTRY
  058d  55               push bp                                  
  058e  8bec             mov bp, sp                               
  0590  83ec54           sub sp, 0x54                             
  0593  56               push si                                  
  0594  57               push di                                  
  0595  33f6             xor si, si                               
  0597  33ff             xor di, di                               
  0599  eb3b             jmp 0x5d6                                
  059b  16               push ss                                  
  059c  8d46ac           lea ax, [bp - 0x54]                      
  059f  50               push ax                                  
  05a0  56               push si                                  
  05a1  90               nop                                      
  05a2  0e               push cs                                  
  05a3  e82201           call 0x6c8                               
  05a6  83c406           add sp, 6                                
  05a9  0bc0             or ax, ax                                
  05ab  7422             je 0x5cf                                 
  05ad  8bde             mov bx, si                               
  05af  d1e3             shl bx, 1                                
  05b1  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  05b5  16               push ss                                  
  05b6  8d46c0           lea ax, [bp - 0x40]                      
  05b9  50               push ax                                  
  05ba  8bc6             mov ax, si                               
  05bc  c1e005           shl ax, 5                                
  05bf  053c48           add ax, 0x483c                           
  05c2  1e               push ds                                  
  05c3  50               push ax                                  
  05c4  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  05c9  83c408           add sp, 8                                
  05cc  46               inc si                                   
  05cd  eb07             jmp 0x5d6                                
  05cf  bf0100           mov di, 1                                
  05d2  89362e48         mov word ptr [0x482e], si                
  05d6  0bff             or di, di                                
  05d8  74c1             je 0x59b                                 
  05da  90               nop                                      
  05db  0e               push cs                                  
  05dc  e84601           call 0x725                               
  05df  5f               pop di                                   
  05e0  5e               pop si                                   
  05e1  c9               leave                                    
  05e2  cb               retf                                     

ovl60_05e3:  ; ENTRY
  05e3  55               push bp                                  
  05e4  8bec             mov bp, sp                               
  05e6  9a2a007f30       lcall 0x307f, 0x2a                       -> ovl49:026b
  05eb  6a01             push 1                                   
  05ed  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  05f2  59               pop cx                                   
  05f3  5d               pop bp                                   
  05f4  cb               retf                                     

ovl60_05f5:  ; ENTRY
  05f5  55               push bp                                  
  05f6  8bec             mov bp, sp                               
  05f8  c706c8280100     mov word ptr [0x28c8], 1                 
  05fe  6aff             push -1                                  
  0600  0e               push cs                                  
  0601  e82efd           call 0x332                               
  0604  59               pop cx                                   
  0605  0e               push cs                                  
  0606  e8b6fc           call 0x2bf                               
  0609  0e               push cs                                  
  060a  e811fb           call 0x11e                               
  060d  5d               pop bp                                   
  060e  cb               retf                                     

ovl60_060f:  ; ENTRY
  060f  55               push bp                                  
  0610  8bec             mov bp, sp                               
  0612  c706c6280000     mov word ptr [0x28c6], 0                 
  0618  833ec82800       cmp word ptr [0x28c8], 0                 
  061d  7408             je 0x627                                 
  061f  6a00             push 0                                   
  0621  9a6100ba30       lcall 0x30ba, 0x61                       -> ovl58:026f
  0626  59               pop cx                                   
  0627  666a01           push 1                                   
  062a  666801000100     push 0x10001                             
  0630  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  0635  83c408           add sp, 8                                
  0638  5d               pop bp                                   
  0639  cb               retf                                     

ovl60_063a:  ; ENTRY
  063a  55               push bp                                  
  063b  8bec             mov bp, sp                               
  063d  83ec02           sub sp, 2                                
  0640  90               nop                                      
  0641  0e               push cs                                  
  0642  e8ba07           call 0xdff                               
  0645  8946fe           mov word ptr [bp - 2], ax                
  0648  a1ca28           mov ax, word ptr [0x28ca]                
  064b  40               inc ax                                   
  064c  99               cdq                                      
  064d  f77efe           idiv word ptr [bp - 2]                   
  0650  8916ca28         mov word ptr [0x28ca], dx                
  0654  6a04             push 4                                   
  0656  0e               push cs                                  
  0657  e8d8fc           call 0x332                               
  065a  59               pop cx                                   
  065b  0e               push cs                                  
  065c  e8bffa           call 0x11e                               
  065f  c9               leave                                    
  0660  cb               retf                                     

ovl60_0661:  ; ENTRY
  0661  55               push bp                                  
  0662  8bec             mov bp, sp                               
  0664  a1cc28           mov ax, word ptr [0x28cc]                
  0667  f7d8             neg ax                                   
  0669  1bc0             sbb ax, ax                               
  066b  40               inc ax                                   
  066c  a3cc28           mov word ptr [0x28cc], ax                
  066f  6a05             push 5                                   
  0671  0e               push cs                                  
  0672  e8bdfc           call 0x332                               
  0675  59               pop cx                                   
  0676  0e               push cs                                  
  0677  e8a4fa           call 0x11e                               
  067a  5d               pop bp                                   
  067b  cb               retf                                     

ovl60_067c:  ; ENTRY
  067c  55               push bp                                  
  067d  8bec             mov bp, sp                               
  067f  56               push si                                  
  0680  8b7606           mov si, word ptr [bp + 6]                
  0683  0bf6             or si, si                                
  0685  7c37             jl 0x6be                                 
  0687  1e               push ds                                  
  0688  68645d           push 0x5d64                              
  068b  56               push si                                  
  068c  90               nop                                      
  068d  0e               push cs                                  
  068e  e83700           call 0x6c8                               
  0691  83c406           add sp, 6                                
  0694  1e               push ds                                  
  0695  68a05d           push 0x5da0                              
  0698  1e               push ds                                  
  0699  687216           push 0x1672                               ; "Illuria\"
  069c  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  06a1  83c408           add sp, 8                                
  06a4  1e               push ds                                  
  06a5  687a2a           push 0x2a7a                              
  06a8  1e               push ds                                  
  06a9  687216           push 0x1672                               ; "Illuria\"
  06ac  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  06b1  83c408           add sp, 8                                
  06b4  8936ce28         mov word ptr [0x28ce], si                
  06b8  c706c8280000     mov word ptr [0x28c8], 0                 
  06be  6a00             push 0                                   
  06c0  0e               push cs                                  
  06c1  e83cf9           call 0                                   
  06c4  59               pop cx                                   
  06c5  5e               pop si                                   
  06c6  5d               pop bp                                   
  06c7  cb               retf                                     

ovl60_06c8:  ; ENTRY
  06c8  55               push bp                                  
  06c9  8bec             mov bp, sp                               
  06cb  56               push si                                  
  06cc  57               push di                                  
  06cd  666800000200     push 0x20000                             
  06d3  6a00             push 0                                   
  06d5  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  06da  83c404           add sp, 4                                
  06dd  52               push dx                                  
  06de  50               push ax                                  
  06df  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  06e4  83c406           add sp, 6                                
  06e7  8bf0             mov si, ax                               
  06e9  0bf6             or si, si                                
  06eb  7d04             jge 0x6f1                                
  06ed  33c0             xor ax, ax                               
  06ef  eb30             jmp 0x721                                
  06f1  33ff             xor di, di                               
  06f3  eb1d             jmp 0x712                                
  06f5  6a54             push 0x54                                
  06f7  66ff7608         push dword ptr [bp + 8]                  
  06fb  56               push si                                  
  06fc  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0701  83c408           add sp, 8                                
  0704  0bc0             or ax, ax                                
  0706  7509             jne 0x711                                
  0708  56               push si                                  
  0709  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  070e  59               pop cx                                   
  070f  ebdc             jmp 0x6ed                                
  0711  47               inc di                                   
  0712  3b7e06           cmp di, word ptr [bp + 6]                
  0715  7ede             jle 0x6f5                                
  0717  56               push si                                  
  0718  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  071d  59               pop cx                                   
  071e  b80100           mov ax, 1                                
  0721  5f               pop di                                   
  0722  5e               pop si                                   
  0723  5d               pop bp                                   
  0724  cb               retf                                     

ovl60_0725:  ; ENTRY
  0725  55               push bp                                  
  0726  8bec             mov bp, sp                               
  0728  83ec54           sub sp, 0x54                             
  072b  56               push si                                  
  072c  57               push di                                  
  072d  6a13             push 0x13                                
  072f  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0734  59               pop cx                                   
  0735  66680001d400     push 0xd40100                            
  073b  1e               push ds                                  
  073c  680e2a           push 0x2a0e                              
  073f  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0744  83c408           add sp, 8                                
  0747  6a3c             push 0x3c                                
  0749  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  074e  59               pop cx                                   
  074f  8916625d         mov word ptr [0x5d62], dx                
  0753  a3605d           mov word ptr [0x5d60], ax                
  0756  685802           push 0x258                               
  0759  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  075e  59               pop cx                                   
  075f  8916ea5c         mov word ptr [0x5cea], dx                
  0763  a3e85c           mov word ptr [0x5ce8], ax                
  0766  b90100           mov cx, 1                                
  0769  eb1e             jmp 0x789                                
  076b  8bc1             mov ax, cx                               
  076d  6bc014           imul ax, ax, 0x14                        
  0770  668b16ea5c       mov edx, dword ptr [0x5cea]              
  0775  8b1ee85c         mov bx, word ptr [0x5ce8]                
  0779  03d8             add bx, ax                               
  077b  8bf1             mov si, cx                               
  077d  c1e602           shl si, 2                                
  0780  8994ea5c         mov word ptr [si + 0x5cea], dx           
  0784  899ce85c         mov word ptr [si + 0x5ce8], bx           
  0788  41               inc cx                                   
  0789  83f91e           cmp cx, 0x1e                             
  078c  7cdd             jl 0x76b                                 
  078e  6a0e             push 0xe                                 
  0790  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0795  59               pop cx                                   
  0796  8916e45c         mov word ptr [0x5ce4], dx                
  079a  a3e25c           mov word ptr [0x5ce2], ax                
  079d  33f6             xor si, si                               
  079f  33ff             xor di, di                               
  07a1  eb3f             jmp 0x7e2                                
  07a3  16               push ss                                  
  07a4  8d46ac           lea ax, [bp - 0x54]                      
  07a7  50               push ax                                  
  07a8  56               push si                                  
  07a9  0e               push cs                                  
  07aa  e81bff           call 0x6c8                               
  07ad  83c406           add sp, 6                                
  07b0  0bc0             or ax, ax                                
  07b2  7427             je 0x7db                                 
  07b4  8bc6             mov ax, si                               
  07b6  d1e0             shl ax, 1                                
  07b8  c41e605d         les bx, ptr [0x5d60]                     
  07bc  03d8             add bx, ax                               
  07be  268937           mov word ptr es:[bx], si                 
  07c1  16               push ss                                  
  07c2  8d46ac           lea ax, [bp - 0x54]                      
  07c5  50               push ax                                  
  07c6  8bde             mov bx, si                               
  07c8  c1e302           shl bx, 2                                
  07cb  66ffb7e85c       push dword ptr [bx + 0x5ce8]             
  07d0  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  07d5  83c408           add sp, 8                                
  07d8  46               inc si                                   
  07d9  eb07             jmp 0x7e2                                
  07db  bf0100           mov di, 1                                
  07de  8936e05c         mov word ptr [0x5ce0], si                
  07e2  0bff             or di, di                                
  07e4  74bd             je 0x7a3                                 
  07e6  a1ce28           mov ax, word ptr [0x28ce]                
  07e9  a3e65c           mov word ptr [0x5ce6], ax                
  07ec  c41ee25c         les bx, ptr [0x5ce2]                     
  07f0  26c7070000       mov word ptr es:[bx], 0                  
  07f5  833ee05c01       cmp word ptr [0x5ce0], 1                 
  07fa  7e05             jle 0x801                                
  07fc  b80100           mov ax, 1                                
  07ff  eb03             jmp 0x804                                
  0801  b8ffff           mov ax, 0xffff                           
  0804  c41ee25c         les bx, ptr [0x5ce2]                     
  0808  26894702         mov word ptr es:[bx + 2], ax             
  080c  833ee05c02       cmp word ptr [0x5ce0], 2                 
  0811  7e05             jle 0x818                                
  0813  b80200           mov ax, 2                                
  0816  eb03             jmp 0x81b                                
  0818  b8ffff           mov ax, 0xffff                           
  081b  c41ee25c         les bx, ptr [0x5ce2]                     
  081f  26894704         mov word ptr es:[bx + 4], ax             
  0823  833ee05c03       cmp word ptr [0x5ce0], 3                 
  0828  7e05             jle 0x82f                                
  082a  b80300           mov ax, 3                                
  082d  eb03             jmp 0x832                                
  082f  b8ffff           mov ax, 0xffff                           
  0832  c41ee25c         les bx, ptr [0x5ce2]                     
  0836  26894706         mov word ptr es:[bx + 6], ax             
  083a  833ee05c04       cmp word ptr [0x5ce0], 4                 
  083f  7e05             jle 0x846                                
  0841  b80400           mov ax, 4                                
  0844  eb03             jmp 0x849                                
  0846  b8ffff           mov ax, 0xffff                           
  0849  c41ee25c         les bx, ptr [0x5ce2]                     
  084d  26894708         mov word ptr es:[bx + 8], ax             
  0851  833ee05c05       cmp word ptr [0x5ce0], 5                 
  0856  7e05             jle 0x85d                                
  0858  b80500           mov ax, 5                                
  085b  eb03             jmp 0x860                                
  085d  b8ffff           mov ax, 0xffff                           
  0860  c41ee25c         les bx, ptr [0x5ce2]                     
  0864  2689470a         mov word ptr es:[bx + 0xa], ax           
  0868  833ee05c06       cmp word ptr [0x5ce0], 6                 
  086d  7e05             jle 0x874                                
  086f  b80600           mov ax, 6                                
  0872  eb03             jmp 0x877                                
  0874  b8ffff           mov ax, 0xffff                           
  0877  c41ee25c         les bx, ptr [0x5ce2]                     
  087b  2689470c         mov word ptr es:[bx + 0xc], ax           
  087f  eb1b             jmp 0x89c                                
  0881  ff0ee65c         dec word ptr [0x5ce6]                    
  0885  33c9             xor cx, cx                               
  0887  eb0e             jmp 0x897                                
  0889  8bc1             mov ax, cx                               
  088b  d1e0             shl ax, 1                                
  088d  c41ee25c         les bx, ptr [0x5ce2]                     
  0891  03d8             add bx, ax                               
  0893  26ff07           inc word ptr es:[bx]                     
  0896  41               inc cx                                   
  0897  83f907           cmp cx, 7                                
  089a  7ced             jl 0x889                                 
  089c  833ee65c07       cmp word ptr [0x5ce6], 7                 
  08a1  7dde             jge 0x881                                
  08a3  a1ce28           mov ax, word ptr [0x28ce]                
  08a6  a3492a           mov word ptr [0x2a49], ax                
  08a9  6a1d             push 0x1d                                
  08ab  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  08b0  59               pop cx                                   
  08b1  c7066a160100     mov word ptr [0x166a], 1                 
  08b7  66833e182a00     cmp dword ptr [0x2a18], 0                
  08bd  7435             je 0x8f4                                 
  08bf  f706432a0a00     test word ptr [0x2a43], 0xa              
  08c5  752d             jne 0x8f4                                
  08c7  33f6             xor si, si                               
  08c9  eb20             jmp 0x8eb                                
  08cb  8bde             mov bx, si                               
  08cd  c1e302           shl bx, 2                                
  08d0  66ffb7182a       push dword ptr [bx + 0x2a18]             
  08d5  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  08da  83c404           add sp, 4                                
  08dd  8bde             mov bx, si                               
  08df  c1e302           shl bx, 2                                
  08e2  89972a2a         mov word ptr [bx + 0x2a2a], dx           
  08e6  8987282a         mov word ptr [bx + 0x2a28], ax           
  08ea  46               inc si                                   
  08eb  a0422a           mov al, byte ptr [0x2a42]                
  08ee  b400             mov ah, 0                                
  08f0  3bc6             cmp ax, si                               
  08f2  7fd7             jg 0x8cb                                 
  08f4  666a00           push 0                                   
  08f7  1e               push ds                                  
  08f8  680e2a           push 0x2a0e                              
  08fb  66680001d400     push 0xd40100                            
  0901  666820016400     push 0x640120                            
  0907  1e               push ds                                  
  0908  682a34           push 0x342a                              
  090b  ff1ed469         lcall [0x69d4]                           
  090f  83c414           add sp, 0x14                             
  0912  66833e182a00     cmp dword ptr [0x2a18], 0                
  0918  7428             je 0x942                                 
  091a  f706432a0a00     test word ptr [0x2a43], 0xa              
  0920  7520             jne 0x942                                
  0922  33f6             xor si, si                               
  0924  eb13             jmp 0x939                                
  0926  8bde             mov bx, si                               
  0928  c1e302           shl bx, 2                                
  092b  66ffb7182a       push dword ptr [bx + 0x2a18]             
  0930  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0935  83c404           add sp, 4                                
  0938  46               inc si                                   
  0939  a0422a           mov al, byte ptr [0x2a42]                
  093c  b400             mov ah, 0                                
  093e  3bc6             cmp ax, si                               
  0940  7fe4             jg 0x926                                 
  0942  6a00             push 0                                   
  0944  90               nop                                      
  0945  0e               push cs                                  
  0946  e84d00           call 0x996                               
  0949  59               pop cx                                   
  094a  90               nop                                      
  094b  0e               push cs                                  
  094c  e83701           call 0xa86                               
  094f  5f               pop di                                   
  0950  5e               pop si                                   
  0951  c9               leave                                    
  0952  cb               retf                                     

ovl60_0953:  ; ENTRY
  0953  55               push bp                                  
  0954  8bec             mov bp, sp                               
  0956  66ff36605d       push dword ptr [0x5d60]                  
  095b  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0960  83c404           add sp, 4                                
  0963  66ff36e85c       push dword ptr [0x5ce8]                  
  0968  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  096d  83c404           add sp, 4                                
  0970  66ff36e25c       push dword ptr [0x5ce2]                  
  0975  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  097a  83c404           add sp, 4                                
  097d  1e               push ds                                  
  097e  680e2a           push 0x2a0e                              
  0981  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0986  83c404           add sp, 4                                
  0989  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  098e  c7066a160000     mov word ptr [0x166a], 0                 
  0994  5d               pop bp                                   
  0995  cb               retf                                     

ovl60_0996:  ; ENTRY
  0996  55               push bp                                  
  0997  8bec             mov bp, sp                               
  0999  83ec5e           sub sp, 0x5e                             
  099c  837e0600         cmp word ptr [bp + 6], 0                 
  09a0  7505             jne 0x9a7                                
  09a2  90               nop                                      
  09a3  0e               push cs                                  
  09a4  e89e03           call 0xd45                               
  09a7  666820016400     push 0x640120                            
  09ad  1e               push ds                                  
  09ae  682a34           push 0x342a                              
  09b1  66680001d400     push 0xd40100                            
  09b7  666a00           push 0                                   
  09ba  1e               push ds                                  
  09bb  680e2a           push 0x2a0e                              
  09be  ff1ed469         lcall [0x69d4]                           
  09c2  83c414           add sp, 0x14                             
  09c5  16               push ss                                  
  09c6  8d46a2           lea ax, [bp - 0x5e]                      
  09c9  50               push ax                                  
  09ca  ff36492a         push word ptr [0x2a49]                   
  09ce  0e               push cs                                  
  09cf  e8f6fc           call 0x6c8                               
  09d2  83c406           add sp, 6                                
  09d5  666800000300     push 0x30000                             
  09db  666802000500     push 0x50002                             
  09e1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  09e6  83c408           add sp, 8                                
  09e9  16               push ss                                  
  09ea  8d46a2           lea ax, [bp - 0x5e]                      
  09ed  50               push ax                                  
  09ee  6668a0016500     push 0x6501a0                            
  09f4  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  09f9  83c408           add sp, 8                                
  09fc  16               push ss                                  
  09fd  8d46be           lea ax, [bp - 0x42]                      
  0a00  50               push ax                                  
  0a01  6668a001ae00     push 0xae01a0                            
  0a07  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0a0c  83c408           add sp, 8                                
  0a0f  ff76ee           push word ptr [bp - 0x12]                
  0a12  1e               push ds                                  
  0a13  687c2a           push 0x2a7c                              
  0a16  16               push ss                                  
  0a17  8d46f6           lea ax, [bp - 0xa]                       
  0a1a  50               push ax                                  
  0a1b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a20  83c40a           add sp, 0xa                              
  0a23  16               push ss                                  
  0a24  8d46f6           lea ax, [bp - 0xa]                       
  0a27  50               push ax                                  
  0a28  66687001ea00     push 0xea0170                            
  0a2e  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0a33  83c408           add sp, 8                                
  0a36  ff76f0           push word ptr [bp - 0x10]                
  0a39  1e               push ds                                  
  0a3a  687f2a           push 0x2a7f                              
  0a3d  16               push ss                                  
  0a3e  8d46f6           lea ax, [bp - 0xa]                       
  0a41  50               push ax                                  
  0a42  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a47  83c40a           add sp, 0xa                              
  0a4a  16               push ss                                  
  0a4b  8d46f6           lea ax, [bp - 0xa]                       
  0a4e  50               push ax                                  
  0a4f  6668d801ea00     push 0xea01d8                            
  0a55  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0a5a  83c408           add sp, 8                                
  0a5d  ff76f2           push word ptr [bp - 0xe]                 
  0a60  1e               push ds                                  
  0a61  68822a           push 0x2a82                              
  0a64  16               push ss                                  
  0a65  8d46f6           lea ax, [bp - 0xa]                       
  0a68  50               push ax                                  
  0a69  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a6e  83c40a           add sp, 0xa                              
  0a71  16               push ss                                  
  0a72  8d46f6           lea ax, [bp - 0xa]                       
  0a75  50               push ax                                  
  0a76  6668a001fe00     push 0xfe01a0                            
  0a7c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0a81  83c408           add sp, 8                                
  0a84  c9               leave                                    
  0a85  cb               retf                                     

ovl60_0a86:  ; ENTRY
  0a86  55               push bp                                  
  0a87  8bec             mov bp, sp                               
  0a89  83ec06           sub sp, 6                                
  0a8c  56               push si                                  
  0a8d  57               push di                                  
  0a8e  bf0100           mov di, 1                                
  0a91  c746fe0100       mov word ptr [bp - 2], 1                 
  0a96  c746fc0100       mov word ptr [bp - 4], 1                 
  0a9b  c746fa0100       mov word ptr [bp - 6], 1                 
  0aa0  33f6             xor si, si                               
  0aa2  eb11             jmp 0xab5                                
  0aa4  6a01             push 1                                   
  0aa6  8bc6             mov ax, si                               
  0aa8  05dc01           add ax, 0x1dc                            
  0aab  50               push ax                                  
  0aac  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0ab1  83c404           add sp, 4                                
  0ab4  46               inc si                                   
  0ab5  83fe07           cmp si, 7                                
  0ab8  7cea             jl 0xaa4                                 
  0aba  c41ee25c         les bx, ptr [0x5ce2]                     
  0abe  a1e05c           mov ax, word ptr [0x5ce0]                
  0ac1  48               dec ax                                   
  0ac2  2639470c         cmp word ptr es:[bx + 0xc], ax           
  0ac6  7d07             jge 0xacf                                
  0ac8  26837f0c00       cmp word ptr es:[bx + 0xc], 0            
  0acd  7d09             jge 0xad8                                
  0acf  b80200           mov ax, 2                                
  0ad2  8946fc           mov word ptr [bp - 4], ax                
  0ad5  8946fa           mov word ptr [bp - 6], ax                
  0ad8  c41ee25c         les bx, ptr [0x5ce2]                     
  0adc  26833f00         cmp word ptr es:[bx], 0                  
  0ae0  7f08             jg 0xaea                                 
  0ae2  bf0200           mov di, 2                                
  0ae5  8bc7             mov ax, di                               
  0ae7  8946fe           mov word ptr [bp - 2], ax                
  0aea  57               push di                                  
  0aeb  68d801           push 0x1d8                               
  0aee  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0af3  83c404           add sp, 4                                
  0af6  ff76fe           push word ptr [bp - 2]                   
  0af9  68d601           push 0x1d6                               
  0afc  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0b01  83c404           add sp, 4                                
  0b04  ff76fa           push word ptr [bp - 6]                   
  0b07  68d701           push 0x1d7                               
  0b0a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0b0f  83c404           add sp, 4                                
  0b12  ff76fc           push word ptr [bp - 4]                   
  0b15  68d901           push 0x1d9                               
  0b18  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0b1d  83c404           add sp, 4                                
  0b20  6668da010100     push 0x101da                             
  0b26  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0b2b  83c404           add sp, 4                                
  0b2e  6668db010100     push 0x101db                             
  0b34  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0b39  83c404           add sp, 4                                
  0b3c  5f               pop di                                   
  0b3d  5e               pop si                                   
  0b3e  c9               leave                                    
  0b3f  cb               retf                                     

ovl60_0b40:  ; ENTRY
  0b40  55               push bp                                  
  0b41  8bec             mov bp, sp                               
  0b43  56               push si                                  
  0b44  8b7606           mov si, word ptr [bp + 6]                
  0b47  8bc6             mov ax, si                               
  0b49  d1e0             shl ax, 1                                
  0b4b  c41ee25c         les bx, ptr [0x5ce2]                     
  0b4f  03d8             add bx, ax                               
  0b51  26833f00         cmp word ptr es:[bx], 0                  
  0b55  7c20             jl 0xb77                                 
  0b57  8936e65c         mov word ptr [0x5ce6], si                
  0b5b  90               nop                                      
  0b5c  0e               push cs                                  
  0b5d  e8e501           call 0xd45                               
  0b60  8bc6             mov ax, si                               
  0b62  d1e0             shl ax, 1                                
  0b64  c41ee25c         les bx, ptr [0x5ce2]                     
  0b68  03d8             add bx, ax                               
  0b6a  268b07           mov ax, word ptr es:[bx]                 
  0b6d  a3492a           mov word ptr [0x2a49], ax                
  0b70  6a01             push 1                                   
  0b72  0e               push cs                                  
  0b73  e820fe           call 0x996                               
  0b76  59               pop cx                                   
  0b77  0e               push cs                                  
  0b78  e80bff           call 0xa86                               
  0b7b  5e               pop si                                   
  0b7c  5d               pop bp                                   
  0b7d  cb               retf                                     

ovl60_0b7e:  ; ENTRY
  0b7e  55               push bp                                  
  0b7f  8bec             mov bp, sp                               
  0b81  0e               push cs                                  
  0b82  e8cefd           call 0x953                               
  0b85  ff36492a         push word ptr [0x2a49]                   
  0b89  0e               push cs                                  
  0b8a  e8effa           call 0x67c                               
  0b8d  59               pop cx                                   
  0b8e  5d               pop bp                                   
  0b8f  cb               retf                                     

ovl60_0b90:  ; ENTRY
  0b90  55               push bp                                  
  0b91  8bec             mov bp, sp                               
  0b93  0e               push cs                                  
  0b94  e8bcfd           call 0x953                               
  0b97  6aff             push -1                                  
  0b99  0e               push cs                                  
  0b9a  e8dffa           call 0x67c                               
  0b9d  59               pop cx                                   
  0b9e  5d               pop bp                                   
  0b9f  cb               retf                                     

ovl60_0ba0:  ; ENTRY
  0ba0  55               push bp                                  
  0ba1  8bec             mov bp, sp                               
  0ba3  b90700           mov cx, 7                                
  0ba6  eb2e             jmp 0xbd6                                
  0ba8  0bc9             or cx, cx                                
  0baa  7e1d             jle 0xbc9                                
  0bac  8bc1             mov ax, cx                               
  0bae  48               dec ax                                   
  0baf  d1e0             shl ax, 1                                
  0bb1  c41ee25c         les bx, ptr [0x5ce2]                     
  0bb5  03d8             add bx, ax                               
  0bb7  268b07           mov ax, word ptr es:[bx]                 
  0bba  8bd1             mov dx, cx                               
  0bbc  d1e2             shl dx, 1                                
  0bbe  8b1ee25c         mov bx, word ptr [0x5ce2]                
  0bc2  03da             add bx, dx                               
  0bc4  268907           mov word ptr es:[bx], ax                 
  0bc7  eb0d             jmp 0xbd6                                
  0bc9  8bc1             mov ax, cx                               
  0bcb  d1e0             shl ax, 1                                
  0bcd  c41ee25c         les bx, ptr [0x5ce2]                     
  0bd1  03d8             add bx, ax                               
  0bd3  26ff0f           dec word ptr es:[bx]                     
  0bd6  8bc1             mov ax, cx                               
  0bd8  49               dec cx                                   
  0bd9  0bc0             or ax, ax                                
  0bdb  75cb             jne 0xba8                                
  0bdd  ff06e65c         inc word ptr [0x5ce6]                    
  0be1  833ee65c07       cmp word ptr [0x5ce6], 7                 
  0be6  7c1e             jl 0xc06                                 
  0be8  c706e65c0600     mov word ptr [0x5ce6], 6                 
  0bee  a1e65c           mov ax, word ptr [0x5ce6]                
  0bf1  d1e0             shl ax, 1                                
  0bf3  c41ee25c         les bx, ptr [0x5ce2]                     
  0bf7  03d8             add bx, ax                               
  0bf9  268b07           mov ax, word ptr es:[bx]                 
  0bfc  a3492a           mov word ptr [0x2a49], ax                
  0bff  6a01             push 1                                   
  0c01  0e               push cs                                  
  0c02  e891fd           call 0x996                               
  0c05  59               pop cx                                   
  0c06  90               nop                                      
  0c07  0e               push cs                                  
  0c08  e83a01           call 0xd45                               
  0c0b  0e               push cs                                  
  0c0c  e877fe           call 0xa86                               
  0c0f  5d               pop bp                                   
  0c10  cb               retf                                     

ovl60_0c11:  ; ENTRY
  0c11  55               push bp                                  
  0c12  8bec             mov bp, sp                               
  0c14  33c9             xor cx, cx                               
  0c16  eb30             jmp 0xc48                                
  0c18  83f906           cmp cx, 6                                
  0c1b  7d1d             jge 0xc3a                                
  0c1d  8bc1             mov ax, cx                               
  0c1f  40               inc ax                                   
  0c20  d1e0             shl ax, 1                                
  0c22  c41ee25c         les bx, ptr [0x5ce2]                     
  0c26  03d8             add bx, ax                               
  0c28  268b07           mov ax, word ptr es:[bx]                 
  0c2b  8bd1             mov dx, cx                               
  0c2d  d1e2             shl dx, 1                                
  0c2f  8b1ee25c         mov bx, word ptr [0x5ce2]                
  0c33  03da             add bx, dx                               
  0c35  268907           mov word ptr es:[bx], ax                 
  0c38  eb0d             jmp 0xc47                                
  0c3a  8bc1             mov ax, cx                               
  0c3c  d1e0             shl ax, 1                                
  0c3e  c41ee25c         les bx, ptr [0x5ce2]                     
  0c42  03d8             add bx, ax                               
  0c44  26ff07           inc word ptr es:[bx]                     
  0c47  41               inc cx                                   
  0c48  83f907           cmp cx, 7                                
  0c4b  7ccb             jl 0xc18                                 
  0c4d  ff0ee65c         dec word ptr [0x5ce6]                    
  0c51  833ee65c00       cmp word ptr [0x5ce6], 0                 
  0c56  7d1e             jge 0xc76                                
  0c58  c706e65c0000     mov word ptr [0x5ce6], 0                 
  0c5e  a1e65c           mov ax, word ptr [0x5ce6]                
  0c61  d1e0             shl ax, 1                                
  0c63  c41ee25c         les bx, ptr [0x5ce2]                     
  0c67  03d8             add bx, ax                               
  0c69  268b07           mov ax, word ptr es:[bx]                 
  0c6c  a3492a           mov word ptr [0x2a49], ax                
  0c6f  6a01             push 1                                   
  0c71  0e               push cs                                  
  0c72  e821fd           call 0x996                               
  0c75  59               pop cx                                   
  0c76  90               nop                                      
  0c77  0e               push cs                                  
  0c78  e8ca00           call 0xd45                               
  0c7b  0e               push cs                                  
  0c7c  e807fe           call 0xa86                               
  0c7f  5d               pop bp                                   
  0c80  cb               retf                                     

ovl60_0c81:  ; ENTRY
  0c81  55               push bp                                  
  0c82  8bec             mov bp, sp                               
  0c84  83ec02           sub sp, 2                                
  0c87  c41ee25c         les bx, ptr [0x5ce2]                     
  0c8b  26833f07         cmp word ptr es:[bx], 7                  
  0c8f  7e05             jle 0xc96                                
  0c91  b80700           mov ax, 7                                
  0c94  eb07             jmp 0xc9d                                
  0c96  c41ee25c         les bx, ptr [0x5ce2]                     
  0c9a  268b07           mov ax, word ptr es:[bx]                 
  0c9d  8946fe           mov word ptr [bp - 2], ax                
  0ca0  33d2             xor dx, dx                               
  0ca2  eb11             jmp 0xcb5                                
  0ca4  8bc2             mov ax, dx                               
  0ca6  d1e0             shl ax, 1                                
  0ca8  c41ee25c         les bx, ptr [0x5ce2]                     
  0cac  03d8             add bx, ax                               
  0cae  8b46fe           mov ax, word ptr [bp - 2]                
  0cb1  262907           sub word ptr es:[bx], ax                 
  0cb4  42               inc dx                                   
  0cb5  83fa07           cmp dx, 7                                
  0cb8  7cea             jl 0xca4                                 
  0cba  a1e65c           mov ax, word ptr [0x5ce6]                
  0cbd  d1e0             shl ax, 1                                
  0cbf  c41ee25c         les bx, ptr [0x5ce2]                     
  0cc3  03d8             add bx, ax                               
  0cc5  268b07           mov ax, word ptr es:[bx]                 
  0cc8  a3492a           mov word ptr [0x2a49], ax                
  0ccb  6a01             push 1                                   
  0ccd  0e               push cs                                  
  0cce  e8c5fc           call 0x996                               
  0cd1  59               pop cx                                   
  0cd2  90               nop                                      
  0cd3  0e               push cs                                  
  0cd4  e86e00           call 0xd45                               
  0cd7  0e               push cs                                  
  0cd8  e8abfd           call 0xa86                               
  0cdb  c9               leave                                    
  0cdc  cb               retf                                     

ovl60_0cdd:  ; ENTRY
  0cdd  55               push bp                                  
  0cde  8bec             mov bp, sp                               
  0ce0  83ec02           sub sp, 2                                
  0ce3  c41ee25c         les bx, ptr [0x5ce2]                     
  0ce7  a1e05c           mov ax, word ptr [0x5ce0]                
  0cea  262b470c         sub ax, word ptr es:[bx + 0xc]           
  0cee  48               dec ax                                   
  0cef  3d0700           cmp ax, 7                                
  0cf2  7e05             jle 0xcf9                                
  0cf4  b80700           mov ax, 7                                
  0cf7  eb0c             jmp 0xd05                                
  0cf9  c41ee25c         les bx, ptr [0x5ce2]                     
  0cfd  a1e05c           mov ax, word ptr [0x5ce0]                
  0d00  262b470c         sub ax, word ptr es:[bx + 0xc]           
  0d04  48               dec ax                                   
  0d05  8946fe           mov word ptr [bp - 2], ax                
  0d08  33d2             xor dx, dx                               
  0d0a  eb11             jmp 0xd1d                                
  0d0c  8bc2             mov ax, dx                               
  0d0e  d1e0             shl ax, 1                                
  0d10  c41ee25c         les bx, ptr [0x5ce2]                     
  0d14  03d8             add bx, ax                               
  0d16  8b46fe           mov ax, word ptr [bp - 2]                
  0d19  260107           add word ptr es:[bx], ax                 
  0d1c  42               inc dx                                   
  0d1d  83fa07           cmp dx, 7                                
  0d20  7cea             jl 0xd0c                                 
  0d22  a1e65c           mov ax, word ptr [0x5ce6]                
  0d25  d1e0             shl ax, 1                                
  0d27  c41ee25c         les bx, ptr [0x5ce2]                     
  0d2b  03d8             add bx, ax                               
  0d2d  268b07           mov ax, word ptr es:[bx]                 
  0d30  a3492a           mov word ptr [0x2a49], ax                
  0d33  6a01             push 1                                   
  0d35  0e               push cs                                  
  0d36  e85dfc           call 0x996                               
  0d39  59               pop cx                                   
  0d3a  90               nop                                      
  0d3b  0e               push cs                                  
  0d3c  e80600           call 0xd45                               
  0d3f  0e               push cs                                  
  0d40  e843fd           call 0xa86                               
  0d43  c9               leave                                    
  0d44  cb               retf                                     

ovl60_0d45:  ; ENTRY
  0d45  55               push bp                                  
  0d46  8bec             mov bp, sp                               
  0d48  83ec08           sub sp, 8                                
  0d4b  56               push si                                  
  0d4c  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0d51  c41ee25c         les bx, ptr [0x5ce2]                     
  0d55  268b07           mov ax, word ptr es:[bx]                 
  0d58  3b064b2a         cmp ax, word ptr [0x2a4b]                
  0d5c  742b             je 0xd89                                 
  0d5e  6a00             push 0                                   
  0d60  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0d65  59               pop cx                                   
  0d66  666888008c00     push 0x8c0088                            
  0d6c  666870009900     push 0x990070                            
  0d72  16               push ss                                  
  0d73  8d46f8           lea ax, [bp - 8]                         
  0d76  50               push ax                                  
  0d77  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0d7c  83c40c           add sp, 0xc                              
  0d7f  52               push dx                                  
  0d80  50               push ax                                  
  0d81  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0d86  83c404           add sp, 4                                
  0d89  c41ee25c         les bx, ptr [0x5ce2]                     
  0d8d  268b07           mov ax, word ptr es:[bx]                 
  0d90  a34b2a           mov word ptr [0x2a4b], ax                
  0d93  33f6             xor si, si                               
  0d95  eb5b             jmp 0xdf2                                
  0d97  8bc6             mov ax, si                               
  0d99  d1e0             shl ax, 1                                
  0d9b  c41ee25c         les bx, ptr [0x5ce2]                     
  0d9f  03d8             add bx, ax                               
  0da1  26833f00         cmp word ptr es:[bx], 0                  
  0da5  7c4a             jl 0xdf1                                 
  0da7  3b36e65c         cmp si, word ptr [0x5ce6]                
  0dab  750a             jne 0xdb7                                
  0dad  666800000300     push 0x30000                             
  0db3  6a0f             push 0xf                                 
  0db5  eb08             jmp 0xdbf                                
  0db7  666800000300     push 0x30000                             
  0dbd  6a05             push 5                                   
  0dbf  6a02             push 2                                   
  0dc1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0dc6  83c408           add sp, 8                                
  0dc9  8bc6             mov ax, si                               
  0dcb  d1e0             shl ax, 1                                
  0dcd  c41ee25c         les bx, ptr [0x5ce2]                     
  0dd1  03d8             add bx, ax                               
  0dd3  268b1f           mov bx, word ptr es:[bx]                 
  0dd6  c1e302           shl bx, 2                                
  0dd9  66ffb7e85c       push dword ptr [bx + 0x5ce8]             
  0dde  8bc6             mov ax, si                               
  0de0  6bc014           imul ax, ax, 0x14                        
  0de3  059900           add ax, 0x99                             
  0de6  50               push ax                                  
  0de7  6a70             push 0x70                                
  0de9  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0dee  83c408           add sp, 8                                
  0df1  46               inc si                                   
  0df2  83fe07           cmp si, 7                                
  0df5  7ca0             jl 0xd97                                 
  0df7  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0dfc  5e               pop si                                   
  0dfd  c9               leave                                    
  0dfe  cb               retf                                     

ovl60_0dff:  ; ENTRY
  0dff  55               push bp                                  
  0e00  8bec             mov bp, sp                               
  0e02  83ec02           sub sp, 2                                
  0e05  56               push si                                  
  0e06  c746fe0100       mov word ptr [bp - 2], 1                 
  0e0b  666800000200     push 0x20000                             
  0e11  6a24             push 0x24                                
  0e13  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0e18  83c404           add sp, 4                                
  0e1b  52               push dx                                  
  0e1c  50               push ax                                  
  0e1d  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0e22  83c406           add sp, 6                                
  0e25  8bf0             mov si, ax                               
  0e27  0bf6             or si, si                                
  0e29  7505             jne 0xe30                                
  0e2b  b80100           mov ax, 1                                
  0e2e  eb1a             jmp 0xe4a                                
  0e30  6a02             push 2                                   
  0e32  16               push ss                                  
  0e33  8d46fe           lea ax, [bp - 2]                         
  0e36  50               push ax                                  
  0e37  56               push si                                  
  0e38  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e3d  83c408           add sp, 8                                
  0e40  56               push si                                  
  0e41  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0e46  59               pop cx                                   
  0e47  8b46fe           mov ax, word ptr [bp - 2]                
  0e4a  5e               pop si                                   
  0e4b  c9               leave                                    
  0e4c  cb               retf                                     

ovl60_0e4d:  ; ENTRY
  0e4d  55               push bp                                  
  0e4e  8bec             mov bp, sp                               
  0e50  83ec02           sub sp, 2                                
  0e53  56               push si                                  
  0e54  57               push di                                  
  0e55  c746fe0100       mov word ptr [bp - 2], 1                 
  0e5a  666800000200     push 0x20000                             
  0e60  6a24             push 0x24                                
  0e62  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0e67  83c404           add sp, 4                                
  0e6a  52               push dx                                  
  0e6b  50               push ax                                  
  0e6c  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0e71  83c406           add sp, 6                                
  0e74  8bf0             mov si, ax                               
  0e76  0bf6             or si, si                                
  0e78  7504             jne 0xe7e                                
  0e7a  33c0             xor ax, ax                               
  0e7c  eb44             jmp 0xec2                                
  0e7e  6a02             push 2                                   
  0e80  16               push ss                                  
  0e81  8d46fe           lea ax, [bp - 2]                         
  0e84  50               push ax                                  
  0e85  56               push si                                  
  0e86  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e8b  83c408           add sp, 8                                
  0e8e  8b4606           mov ax, word ptr [bp + 6]                
  0e91  3b46fe           cmp ax, word ptr [bp - 2]                
  0e94  7c09             jl 0xe9f                                 
  0e96  56               push si                                  
  0e97  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0e9c  59               pop cx                                   
  0e9d  ebdb             jmp 0xe7a                                
  0e9f  33ff             xor di, di                               
  0ea1  eb10             jmp 0xeb3                                
  0ea3  6a34             push 0x34                                
  0ea5  66ff7608         push dword ptr [bp + 8]                  
  0ea9  56               push si                                  
  0eaa  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0eaf  83c408           add sp, 8                                
  0eb2  47               inc di                                   
  0eb3  3b7e06           cmp di, word ptr [bp + 6]                
  0eb6  7eeb             jle 0xea3                                
  0eb8  56               push si                                  
  0eb9  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0ebe  59               pop cx                                   
  0ebf  b80100           mov ax, 1                                
  0ec2  5f               pop di                                   
  0ec3  5e               pop si                                   
  0ec4  c9               leave                                    
  0ec5  cb               retf                                     
