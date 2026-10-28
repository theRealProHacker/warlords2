; res_07be file_off 0x9be0

res_07be_0001:  ; ENTRY
  0001  55               push bp                                  
  0002  8bec             mov bp, sp                               
  0004  33d2             xor dx, dx                               
  0006  33c9             xor cx, cx                               
  0008  eb1c             jmp 0x26                                 
  000a  8bda             mov bx, dx                               
  000c  d1e3             shl bx, 1                                
  000e  8b875c15         mov ax, word ptr [bx + 0x155c]           
  0012  3b4606           cmp ax, word ptr [bp + 6]                
  0015  750e             jne 0x25                                 
  0017  b90100           mov cx, 1                                
  001a  8bda             mov bx, dx                               
  001c  d1e3             shl bx, 1                                
  001e  8b4608           mov ax, word ptr [bp + 8]                
  0021  89875c15         mov word ptr [bx + 0x155c], ax           
  0025  42               inc dx                                   
  0026  8bda             mov bx, dx                               
  0028  d1e3             shl bx, 1                                
  002a  83bf5c1500       cmp word ptr [bx + 0x155c], 0            
  002f  7404             je 0x35                                  
  0031  0bc9             or cx, cx                                
  0033  74d5             je 0xa                                   
  0035  5d               pop bp                                   
  0036  cb               retf                                     

res_07be_0037:  ; ENTRY
  0037  55               push bp                                  
  0038  8bec             mov bp, sp                               
  003a  33d2             xor dx, dx                               
  003c  33c9             xor cx, cx                               
  003e  eb11             jmp 0x51                                 
  0040  8bda             mov bx, dx                               
  0042  d1e3             shl bx, 1                                
  0044  8b875c15         mov ax, word ptr [bx + 0x155c]           
  0048  3b4606           cmp ax, word ptr [bp + 6]                
  004b  7503             jne 0x50                                 
  004d  b90100           mov cx, 1                                
  0050  42               inc dx                                   
  0051  8bda             mov bx, dx                               
  0053  d1e3             shl bx, 1                                
  0055  83bf5c1500       cmp word ptr [bx + 0x155c], 0            
  005a  7404             je 0x60                                  
  005c  0bc9             or cx, cx                                
  005e  74e0             je 0x40                                  
  0060  8bc1             mov ax, cx                               
  0062  5d               pop bp                                   
  0063  cb               retf                                     

res_07be_0064:  ; ENTRY
  0064  55               push bp                                  
  0065  8bec             mov bp, sp                               
  0067  83ec02           sub sp, 2                                
  006a  56               push si                                  
  006b  57               push di                                  
  006c  8b4608           mov ax, word ptr [bp + 8]                
  006f  833e6c1600       cmp word ptr [0x166c], 0                 
  0074  7407             je 0x7d                                  
  0076  0bc0             or ax, ax                                
  0078  7403             je 0x7d                                  
  007a  e9b402           jmp 0x331                                
  007d  833e741100       cmp word ptr [0x1174], 0                 
  0082  7403             je 0x87                                  
  0084  e9aa02           jmp 0x331                                
  0087  833e761100       cmp word ptr [0x1176], 0                 
  008c  7403             je 0x91                                  
  008e  e9a002           jmp 0x331                                
  0091  833e721100       cmp word ptr [0x1172], 0                 
  0096  7403             je 0x9b                                  
  0098  e99602           jmp 0x331                                
  009b  833e003700       cmp word ptr [0x3700], 0                 
  00a0  7403             je 0xa5                                  
  00a2  e98c02           jmp 0x331                                
  00a5  0bc0             or ax, ax                                
  00a7  7414             je 0xbd                                  
  00a9  833e6a1600       cmp word ptr [0x166a], 0                 
  00ae  750d             jne 0xbd                                 
  00b0  16               push ss                                  
  00b1  8d4606           lea ax, [bp + 6]                         
  00b4  50               push ax                                  
  00b5  9a47007213       lcall 0x1372, 0x47                       -> 1372:0047
  00ba  83c404           add sp, 4                                
  00bd  837e0641         cmp word ptr [bp + 6], 0x41              
  00c1  7c09             jl 0xcc                                  
  00c3  837e065a         cmp word ptr [bp + 6], 0x5a              
  00c7  7f03             jg 0xcc                                  
  00c9  e96502           jmp 0x331                                
  00cc  837e061b         cmp word ptr [bp + 6], 0x1b              
  00d0  7532             jne 0x104                                
  00d2  33f6             xor si, si                               
  00d4  eb23             jmp 0xf9                                 
  00d6  8bde             mov bx, si                               
  00d8  d1e3             shl bx, 1                                
  00da  8bbf1415         mov di, word ptr [bx + 0x1514]           
  00de  57               push di                                  
  00df  9aab05a908       lcall 0x8a9, 0x5ab                       -> 08a9:05ab
  00e4  59               pop cx                                   
  00e5  3d0100           cmp ax, 1                                
  00e8  750e             jne 0xf8                                 
  00ea  6a00             push 0                                   
  00ec  57               push di                                  
  00ed  90               nop                                      
  00ee  0e               push cs                                  
  00ef  e8e603           call 0x4d8                               
  00f2  83c404           add sp, 4                                
  00f5  e93902           jmp 0x331                                
  00f8  46               inc si                                   
  00f9  8bde             mov bx, si                               
  00fb  d1e3             shl bx, 1                                
  00fd  83bf141500       cmp word ptr [bx + 0x1514], 0            
  0102  75d2             jne 0xd6                                 
  0104  837e060d         cmp word ptr [bp + 6], 0xd               
  0108  7526             jne 0x130                                
  010a  33f6             xor si, si                               
  010c  eb17             jmp 0x125                                
  010e  8bde             mov bx, si                               
  0110  d1e3             shl bx, 1                                
  0112  8bbf5c15         mov di, word ptr [bx + 0x155c]           
  0116  57               push di                                  
  0117  9aab05a908       lcall 0x8a9, 0x5ab                       -> 08a9:05ab
  011c  59               pop cx                                   
  011d  3d0100           cmp ax, 1                                
  0120  7502             jne 0x124                                
  0122  ebc6             jmp 0xea                                 
  0124  46               inc si                                   
  0125  8bde             mov bx, si                               
  0127  d1e3             shl bx, 1                                
  0129  83bf5c1500       cmp word ptr [bx + 0x155c], 0            
  012e  75de             jne 0x10e                                
  0130  ff7606           push word ptr [bp + 6]                   
  0133  90               nop                                      
  0134  0e               push cs                                  
  0135  e80c03           call 0x444                               
  0138  59               pop cx                                   
  0139  0bc0             or ax, ax                                
  013b  7403             je 0x140                                 
  013d  e9f101           jmp 0x331                                
  0140  ff7606           push word ptr [bp + 6]                   
  0143  90               nop                                      
  0144  0e               push cs                                  
  0145  e8a702           call 0x3ef                               
  0148  59               pop cx                                   
  0149  0bc0             or ax, ax                                
  014b  7403             je 0x150                                 
  014d  e9e101           jmp 0x331                                
  0150  ff7606           push word ptr [bp + 6]                   
  0153  90               nop                                      
  0154  0e               push cs                                  
  0155  e8d802           call 0x430                               
  0158  59               pop cx                                   
  0159  0bc0             or ax, ax                                
  015b  7403             je 0x160                                 
  015d  e9d101           jmp 0x331                                
  0160  8b4606           mov ax, word ptr [bp + 6]                
  0163  8946fe           mov word ptr [bp - 2], ax                
  0166  b92e00           mov cx, 0x2e                             
  0169  bb3703           mov bx, 0x337                            
  016c  2e8b07           mov ax, word ptr cs:[bx]                 
  016f  3b46fe           cmp ax, word ptr [bp - 2]                
  0172  7408             je 0x17c                                 
  0174  83c302           add bx, 2                                
  0177  e2f3             loop 0x16c                               
  0179  e9b001           jmp 0x32c                                
  017c  2eff675c         jmp word ptr cs:[bx + 0x5c]              
  0180  9a25000c31       lcall 0x310c, 0x25                       -> ovl66:0a55
  0185  e9a901           jmp 0x331                                
  0188  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  018d  e9a101           jmp 0x331                                
  0190  6a00             push 0                                   
  0192  9a20004c30       lcall 0x304c, 0x20                       -> ovl42:0000
  0197  e94601           jmp 0x2e0                                
  019a  b8042c           mov ax, 0x2c04                           
  019d  8ec0             mov es, ax                               
  019f  26ff367f01       push word ptr es:[0x17f]                 
  01a4  8ec0             mov es, ax                               
  01a6  26ff367d01       push word ptr es:[0x17d]                 
  01ab  6a01             push 1                                   
  01ad  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  01b2  e94901           jmp 0x2fe                                
  01b5  b8042c           mov ax, 0x2c04                           
  01b8  8ec0             mov es, ax                               
  01ba  26ff367f01       push word ptr es:[0x17f]                 
  01bf  8ec0             mov es, ax                               
  01c1  26ff367d01       push word ptr es:[0x17d]                 
  01c6  6a00             push 0                                   
  01c8  ebe3             jmp 0x1ad                                
  01ca  9a2000542f       lcall 0x2f54, 0x20                       -> ovl00:0000
  01cf  e95f01           jmp 0x331                                
  01d2  6a01             push 1                                   
  01d4  e99b00           jmp 0x272                                
  01d7  9a4d007330       lcall 0x3073, 0x4d                       -> ovl47:09f7
  01dc  e95201           jmp 0x331                                
  01df  6a02             push 2                                   
  01e1  ebaf             jmp 0x192                                
  01e3  6a00             push 0                                   
  01e5  e98a00           jmp 0x272                                
  01e8  9a2f003030       lcall 0x3030, 0x2f                       -> ovl38:0de1
  01ed  e94101           jmp 0x331                                
  01f0  6a02             push 2                                   
  01f2  eb7e             jmp 0x272                                
  01f4  6a01             push 1                                   
  01f6  eb9a             jmp 0x192                                
  01f8  6a04             push 4                                   
  01fa  eb76             jmp 0x272                                
  01fc  9ac4048c0c       lcall 0xc8c, 0x4c4                       -> 0c8c:04c4
  0201  e92d01           jmp 0x331                                
  0204  6a03             push 3                                   
  0206  eb8a             jmp 0x192                                
  0208  9a7f000c31       lcall 0x310c, 0x7f                       -> ovl66:1e3b
  020d  e92101           jmp 0x331                                
  0210  b8042c           mov ax, 0x2c04                           
  0213  8ec0             mov es, ax                               
  0215  26ff367f01       push word ptr es:[0x17f]                 
  021a  8ec0             mov es, ax                               
  021c  26ff367d01       push word ptr es:[0x17d]                 
  0221  6a02             push 2                                   
  0223  eb88             jmp 0x1ad                                
  0225  9abf06620b       lcall 0xb62, 0x6bf                       -> 0b62:06bf
  022a  e90401           jmp 0x331                                
  022d  9a6b007f30       lcall 0x307f, 0x6b                       -> ovl49:150d
  0232  e9fc00           jmp 0x331                                
  0235  9a52000c31       lcall 0x310c, 0x52                       -> ovl66:0c9c
  023a  e9f400           jmp 0x331                                
  023d  9a43001d30       lcall 0x301d, 0x43                       -> ovl35:0c21
  0242  e9ec00           jmp 0x331                                
  0245  9a6b007330       lcall 0x3073, 0x6b                       -> ovl47:1652
  024a  e9e400           jmp 0x331                                
  024d  b8042c           mov ax, 0x2c04                           
  0250  8ec0             mov es, ax                               
  0252  26ff367f01       push word ptr es:[0x17f]                 
  0257  8ec0             mov es, ax                               
  0259  26ff367d01       push word ptr es:[0x17d]                 
  025e  6a03             push 3                                   
  0260  e94aff           jmp 0x1ad                                
  0263  6a04             push 4                                   
  0265  e92aff           jmp 0x192                                
  0268  9a2a009a2f       lcall 0x2f9a, 0x2a                       -> ovl13:01a4
  026d  e9c100           jmp 0x331                                
  0270  6a03             push 3                                   
  0272  9a20004230       lcall 0x3042, 0x20                       -> ovl41:0000
  0277  eb67             jmp 0x2e0                                
  0279  9a20001430       lcall 0x3014, 0x20                       -> ovl34:0000
  027e  e9b000           jmp 0x331                                
  0281  b8042c           mov ax, 0x2c04                           
  0284  8ec0             mov es, ax                               
  0286  26ff367f01       push word ptr es:[0x17f]                 
  028b  8ec0             mov es, ax                               
  028d  26ff367d01       push word ptr es:[0x17d]                 
  0292  6a04             push 4                                   
  0294  e916ff           jmp 0x1ad                                
  0297  9a20003b30       lcall 0x303b, 0x20                       -> ovl40:0000
  029c  e99200           jmp 0x331                                
  029f  9a20007f30       lcall 0x307f, 0x20                       -> ovl49:0084
  02a4  e98a00           jmp 0x331                                
  02a7  9a34005b2f       lcall 0x2f5b, 0x34                       -> ovl01:0167
  02ac  e98200           jmp 0x331                                
  02af  9a7f00d730       lcall 0x30d7, 0x7f                       -> ovl61:2074
  02b4  eb7b             jmp 0x331                                
  02b6  9a2a007f30       lcall 0x307f, 0x2a                       -> ovl49:026b
  02bb  eb74             jmp 0x331                                
  02bd  9a57007f30       lcall 0x307f, 0x57                       -> ovl49:1214
  02c2  eb6d             jmp 0x331                                
  02c4  9a2f007f30       lcall 0x307f, 0x2f                       -> ovl49:019d
  02c9  eb66             jmp 0x331                                
  02cb  9a25007f30       lcall 0x307f, 0x25                       -> ovl49:093b
  02d0  eb5f             jmp 0x331                                
  02d2  9a20009f2f       lcall 0x2f9f, 0x20                       -> ovl14:0000
  02d7  eb58             jmp 0x331                                
  02d9  6a01             push 1                                   
  02db  9a20000f30       lcall 0x300f, 0x20                       -> ovl33:0000
  02e0  59               pop cx                                   
  02e1  eb4e             jmp 0x331                                
  02e3  9a5c007f30       lcall 0x307f, 0x5c                       -> ovl49:128a
  02e8  eb47             jmp 0x331                                
  02ea  9a34007f30       lcall 0x307f, 0x34                       -> ovl49:0000
  02ef  eb40             jmp 0x331                                
  02f1  666801000100     push 0x10001                             
  02f7  6a01             push 1                                   
  02f9  9ab308620b       lcall 0xb62, 0x8b3                       -> 0b62:08b3
  02fe  83c406           add sp, 6                                
  0301  eb2e             jmp 0x331                                
  0303  9a4d00d730       lcall 0x30d7, 0x4d                       -> ovl61:0f3f
  0308  eb27             jmp 0x331                                
  030a  9a5200d730       lcall 0x30d7, 0x52                       -> ovl61:0fe9
  030f  eb20             jmp 0x331                                
  0311  9a4300d730       lcall 0x30d7, 0x43                       -> ovl61:0f02
  0316  eb19             jmp 0x331                                
  0318  c41e625e         les bx, ptr [0x5e62]                     
  031c  26ff7714         push word ptr es:[bx + 0x14]             
  0320  26ff7712         push word ptr es:[bx + 0x12]             
  0324  9afd018c0c       lcall 0xc8c, 0x1fd                       -> 0c8c:01fd
  0329  e9c6fd           jmp 0xf2                                 
  032c  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0331  33c0             xor ax, ax                               
  0333  5f               pop di                                   
  0334  5e               pop si                                   
  0335  c9               leave                                    
  0336  cb               retf                                     
  0337  0800             or byte ptr [bx + si], al                
  0339  0900             or word ptr [bx + si], ax                
  033b  1100             adc word ptr [bx + si], ax               
  033d  2000             and byte ptr [bx + si], al               
  033f  2c00             sub al, 0                                
  0341  2e0035           add byte ptr cs:[di], dh                 
  0344  003d             add byte ptr [di], bh                    
  0346  003f             add byte ptr [bx], bh                    
  0348  006100           add byte ptr [bx + di], ah               
  034b  6200             bound ax, dword ptr [bx + si]            
  034d  6300             arpl word ptr [bx + si], ax              
  034f  64006500         add byte ptr fs:[di], ah                 
  0353  66006700         add byte ptr [bx], ah                    
  0357  680069           push 0x6900                              
  035a  006a00           add byte ptr [bp + si], ch               
  035d  6b006c           imul ax, word ptr [bx + si], 0x6c        
  0360  006d00           add byte ptr [di], ch                    
  0363  6e               outsb dx, byte ptr [si]                  
  0364  006f00           add byte ptr [bx], ch                    
  0367  7000             jo 0x369                                 
  0369  7100             jno 0x36b                                
  036b  7200             jb 0x36d                                 
  036d  7300             jae 0x36f                                
  036f  7400             je 0x371                                 
  0371  7500             jne 0x373                                
  0373  7600             jbe 0x375                                
  0375  7700             ja 0x377                                 
  0377  7800             js 0x379                                 
  0379  7900             jns 0x37b                                
  037b  7a00             jp 0x37d                                 
  037d  1201             adc al, byte ptr [bx + di]               
  037f  16               push ss                                  
  0380  011f             add word ptr [bx], bx                    
  0382  0126012c         add word ptr [0x2c01], sp                
  0386  012d             add word ptr [di], bp                    
  0388  0131             add word ptr [bx + di], si               
  038a  0132             add word ptr [bp + si], si               
  038c  014701           add word ptr [bx + 1], ax                
  038f  4f               dec di                                   
  0390  015301           add word ptr [bp + di + 1], dx           
  0393  0a03             or al, byte ptr [bp + di]                
  0395  0303             add ax, word ptr [bp + di]               
  0397  ea02800197       ljmp 0x9701:0x8002                       
  039c  02810288         add al, byte ptr [bx + di - 0x77fe]      
  03a0  01a7029f         add word ptr [bx - 0x60fe], sp           
  03a4  0290019a         add dl, byte ptr [bx + si - 0x65ff]      
  03a8  01b501ca         add word ptr [di - 0x35ff], si           
  03ac  01d2             add dx, dx                               
  03ae  01d7             add di, dx                               
  03b0  01df             add di, bx                               
  03b2  01e3             add bx, sp                               
  03b4  01e8             add ax, bp                               
  03b6  01f0             add ax, si                               
  03b8  01f4             add sp, si                               
  03ba  01f8             add ax, di                               
  03bc  01fc             add sp, di                               
  03be  0104             add word ptr [si], ax                    
  03c0  0208             add cl, byte ptr [bx + si]               
  03c2  0210             add dl, byte ptr [bx + si]               
  03c4  0225             add ah, byte ptr [di]                    
  03c6  022d             add ch, byte ptr [di]                    
  03c8  0235             add dh, byte ptr [di]                    
  03ca  023d             add bh, byte ptr [di]                    
  03cc  024502           add al, byte ptr [di + 2]                
  03cf  4d               dec bp                                   
  03d0  026302           add ah, byte ptr [bp + di + 2]           
  03d3  680270           push 0x7002                              
  03d6  027902           add bh, byte ptr [bx + di + 2]           
  03d9  af               scasw ax, word ptr es:[di]               
  03da  02d2             add dl, dl                               
  03dc  02cb             add cl, bl                               
  03de  02b602e3         add dh, byte ptr [bp - 0x1cfe]           
  03e2  02d9             add bl, cl                               
  03e4  02c4             add al, ah                               
  03e6  02bd0211         add bh, byte ptr [di + 0x1102]           
  03ea  0318             add bx, word ptr [bx + si]               
  03ec  03f1             add si, cx                               
  03ee  02               db 02                                    resync

res_07be_03ef:  ; ENTRY
  03ef  55               push bp                                  
  03f0  8bec             mov bp, sp                               
  03f2  833e6a1600       cmp word ptr [0x166a], 0                 
  03f7  7504             jne 0x3fd                                
  03f9  33c0             xor ax, ax                               
  03fb  eb31             jmp 0x42e                                
  03fd  8b4606           mov ax, word ptr [bp + 6]                
  0400  3d1b00           cmp ax, 0x1b                             
  0403  740c             je 0x411                                 
  0405  3d5301           cmp ax, 0x153                            
  0408  7407             je 0x411                                 
  040a  3d8101           cmp ax, 0x181                            
  040d  741c             je 0x42b                                 
  040f  eb15             jmp 0x426                                
  0411  6a01             push 1                                   
  0413  9af503a908       lcall 0x8a9, 0x3f5                       -> 08a9:03f5
  0418  59               pop cx                                   
  0419  a33e4c           mov word ptr [0x4c3e], ax                
  041c  6a00             push 0                                   
  041e  90               nop                                      
  041f  0e               push cs                                  
  0420  e8030a           call 0xe26                               
  0423  59               pop cx                                   
  0424  eb05             jmp 0x42b                                
  0426  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  042b  b80100           mov ax, 1                                
  042e  5d               pop bp                                   
  042f  cb               retf                                     

res_07be_0430:  ; ENTRY
  0430  55               push bp                                  
  0431  8bec             mov bp, sp                               
  0433  ba0100           mov dx, 1                                
  0436  8b4606           mov ax, word ptr [bp + 6]                
  0439  3d1700           cmp ax, 0x17                             
  043c  7402             je 0x440                                 
  043e  33d2             xor dx, dx                               
  0440  8bc2             mov ax, dx                               
  0442  5d               pop bp                                   
  0443  cb               retf                                     

res_07be_0444:  ; ENTRY
  0444  55               push bp                                  
  0445  8bec             mov bp, sp                               
  0447  83ec02           sub sp, 2                                
  044a  56               push si                                  
  044b  8b5606           mov dx, word ptr [bp + 6]                
  044e  be0100           mov si, 1                                
  0451  833e862a00       cmp word ptr [0x2a86], 0                 
  0456  7407             je 0x45f                                 
  0458  833e6a1600       cmp word ptr [0x166a], 0                 
  045d  7404             je 0x463                                 
  045f  33c0             xor ax, ax                               
  0461  eb3e             jmp 0x4a1                                
  0463  8956fe           mov word ptr [bp - 2], dx                
  0466  b90d00           mov cx, 0xd                              
  0469  bba404           mov bx, 0x4a4                            
  046c  2e8b07           mov ax, word ptr cs:[bx]                 
  046f  3b46fe           cmp ax, word ptr [bp - 2]                
  0472  7407             je 0x47b                                 
  0474  83c302           add bx, 2                                
  0477  e2f3             loop 0x46c                               
  0479  eb22             jmp 0x49d                                
  047b  2eff671a         jmp word ptr cs:[bx + 0x1a]              
  047f  52               push dx                                  
  0480  9a97018c0c       lcall 0xc8c, 0x197                       -> 0c8c:0197
  0485  59               pop cx                                   
  0486  eb17             jmp 0x49f                                
  0488  6a00             push 0                                   
  048a  eb0a             jmp 0x496                                
  048c  6a02             push 2                                   
  048e  eb06             jmp 0x496                                
  0490  6a04             push 4                                   
  0492  eb02             jmp 0x496                                
  0494  6a06             push 6                                   
  0496  9a5200f930       lcall 0x30f9, 0x52                       -> ovl64:0723
  049b  ebe8             jmp 0x485                                
  049d  33f6             xor si, si                               
  049f  8bc6             mov ax, si                               
  04a1  5e               pop si                                   
  04a2  c9               leave                                    
  04a3  cb               retf                                     
  04a4  3100             xor word ptr [bx + si], ax               
  04a6  3200             xor al, byte ptr [bx + si]               
  04a8  3300             xor ax, word ptr [bx + si]               
  04aa  3400             xor al, 0                                
  04ac  350036           xor ax, 0x3600                           
  04af  0037             add byte ptr [bx], dh                    
  04b1  0038             add byte ptr [bx + si], bh               
  04b3  0039             add byte ptr [bx + di], bh               
  04b5  004801           add byte ptr [bx + si + 1], cl           
  04b8  4b               dec bx                                   
  04b9  014d01           add word ptr [di + 1], cx                
  04bc  50               push ax                                  
  04bd  017f04           add word ptr [bx + 4], di                
  04c0  7f04             jg 0x4c6                                 
  04c2  7f04             jg 0x4c8                                 
  04c4  7f04             jg 0x4ca                                 
  04c6  7f04             jg 0x4cc                                 
  04c8  7f04             jg 0x4ce                                 
  04ca  7f04             jg 0x4d0                                 
  04cc  7f04             jg 0x4d2                                 
  04ce  7f04             jg 0x4d4                                 
  04d0  8804             mov byte ptr [si], al                    
  04d2  94               xchg sp, ax                              
  04d3  048c             add al, 0x8c                             
  04d5  0490             add al, 0x90                             
  04d7  04               db 04                                    resync

res_07be_04d8:  ; ENTRY
  04d8  55               push bp                                  
  04d9  8bec             mov bp, sp                               
  04db  8b5606           mov dx, word ptr [bp + 6]                
  04de  8bda             mov bx, dx                               
  04e0  83eb64           sub bx, 0x64                             
  04e3  81fb8c01         cmp bx, 0x18c                            
  04e7  7603             jbe 0x4ec                                
  04e9  e91e06           jmp 0xb0a                                
  04ec  d1e3             shl bx, 1                                
  04ee  2effa70c0b       jmp word ptr cs:[bx + 0xb0c]             
res_07be_04f3:  ; case
  04f3  c41e625e         les bx, ptr [0x5e62]                     
  04f7  26ff7714         push word ptr es:[bx + 0x14]             
  04fb  26ff7712         push word ptr es:[bx + 0x12]             
  04ff  9afd018c0c       lcall 0xc8c, 0x1fd                       -> 0c8c:01fd
  0504  83c404           add sp, 4                                
  0507  e90006           jmp 0xb0a                                
res_07be_050a:  ; case
  050a  9a3400d730       lcall 0x30d7, 0x34                       -> ovl61:0ec9
  050f  e9f805           jmp 0xb0a                                
res_07be_0512:  ; case
  0512  9a3900d730       lcall 0x30d7, 0x39                       -> ovl61:0ed7
  0517  e9f005           jmp 0xb0a                                
res_07be_051a:  ; case
  051a  9a3e00d730       lcall 0x30d7, 0x3e                       -> ovl61:0ef4
  051f  e9e805           jmp 0xb0a                                
res_07be_0522:  ; case
  0522  9a4300d730       lcall 0x30d7, 0x43                       -> ovl61:0f02
  0527  e9e005           jmp 0xb0a                                
res_07be_052a:  ; case
  052a  9a4800d730       lcall 0x30d7, 0x48                       -> ovl61:0f26
  052f  e9d805           jmp 0xb0a                                
res_07be_0532:  ; case
  0532  9a4d00d730       lcall 0x30d7, 0x4d                       -> ovl61:0f3f
  0537  e9d005           jmp 0xb0a                                
res_07be_053a:  ; case
  053a  9a5200d730       lcall 0x30d7, 0x52                       -> ovl61:0fe9
  053f  e9c805           jmp 0xb0a                                
res_07be_0542:  ; case
  0542  9a5700d730       lcall 0x30d7, 0x57                       -> ovl61:104e
  0547  e9c005           jmp 0xb0a                                
res_07be_054a:  ; case
  054a  9a2f00542f       lcall 0x2f54, 0x2f                       -> ovl00:0346
  054f  e9b805           jmp 0xb0a                                
res_07be_0552:  ; case
  0552  8bc2             mov ax, dx                               
  0554  2d4001           sub ax, 0x140                            
  0557  50               push ax                                  
  0558  9a5200f930       lcall 0x30f9, 0x52                       -> ovl64:0723
  055d  e97105           jmp 0xad1                                
res_07be_0560:  ; case
  0560  9a25000c31       lcall 0x310c, 0x25                       -> ovl66:0a55
  0565  e9a205           jmp 0xb0a                                
res_07be_0568:  ; case
  0568  9a20000c31       lcall 0x310c, 0x20                       -> ovl66:0a99
  056d  e99a05           jmp 0xb0a                                
res_07be_0570:  ; case
  0570  8bc2             mov ax, dx                               
  0572  2de000           sub ax, 0xe0                             
  0575  50               push ax                                  
  0576  9a3e000c31       lcall 0x310c, 0x3e                       -> ovl66:0963
  057b  e95305           jmp 0xad1                                
res_07be_057e:  ; case
  057e  8bc2             mov ax, dx                               
  0580  2de800           sub ax, 0xe8                             
  0583  50               push ax                                  
  0584  9a43000c31       lcall 0x310c, 0x43                       -> ovl66:0910
  0589  e94505           jmp 0xad1                                
res_07be_058c:  ; case
  058c  8bc2             mov ax, dx                               
  058e  2db300           sub ax, 0xb3                             
  0591  50               push ax                                  
  0592  9a2f009f2f       lcall 0x2f9f, 0x2f                       -> ovl14:0072
  0597  e93705           jmp 0xad1                                
res_07be_059a:  ; case
  059a  9a3400cc30       lcall 0x30cc, 0x34                       -> ovl60:058d
  059f  e96805           jmp 0xb0a                                
res_07be_05a2:  ; case
  05a2  9a3900cc30       lcall 0x30cc, 0x39                       -> ovl60:05e3
  05a7  e96005           jmp 0xb0a                                
res_07be_05aa:  ; case
  05aa  9a3e00cc30       lcall 0x30cc, 0x3e                       -> ovl60:05f5
  05af  e95805           jmp 0xb0a                                
res_07be_05b2:  ; case
  05b2  9a4300cc30       lcall 0x30cc, 0x43                       -> ovl60:060f
  05b7  e95005           jmp 0xb0a                                
res_07be_05ba:  ; case
  05ba  9a5200cc30       lcall 0x30cc, 0x52                       -> ovl60:0661
  05bf  e94805           jmp 0xb0a                                
res_07be_05c2:  ; case
  05c2  9a4d00cc30       lcall 0x30cc, 0x4d                       -> ovl60:063a
  05c7  e94005           jmp 0xb0a                                
res_07be_05ca:  ; case
  05ca  8bc2             mov ax, dx                               
  05cc  2d6e00           sub ax, 0x6e                             
  05cf  50               push ax                                  
  05d0  9a5c00cc30       lcall 0x30cc, 0x5c                       -> ovl60:0571
  05d5  e9f904           jmp 0xad1                                
res_07be_05d8:  ; case
  05d8  8bc2             mov ax, dx                               
  05da  2d6a00           sub ax, 0x6a                             
  05dd  50               push ax                                  
  05de  9a5700cc30       lcall 0x30cc, 0x57                       -> ovl60:0512
  05e3  e9eb04           jmp 0xad1                                
res_07be_05e6:  ; case
  05e6  8bc2             mov ax, dx                               
  05e8  2d7200           sub ax, 0x72                             
  05eb  50               push ax                                  
  05ec  9a43009030       lcall 0x3090, 0x43                       -> ovl51:018b
  05f1  e9dd04           jmp 0xad1                                
res_07be_05f4:  ; case
  05f4  9a39009030       lcall 0x3090, 0x39                       -> ovl51:0286
  05f9  e90e05           jmp 0xb0a                                
res_07be_05fc:  ; case
  05fc  9a3e009030       lcall 0x3090, 0x3e                       -> ovl51:02be
  0601  e90605           jmp 0xb0a                                
res_07be_0604:  ; case
  0604  9a2f009030       lcall 0x3090, 0x2f                       -> ovl51:01f5
  0609  e9fe04           jmp 0xb0a                                
res_07be_060c:  ; case
  060c  9a34009030       lcall 0x3090, 0x34                       -> ovl51:023e
  0611  e9f604           jmp 0xb0a                                
res_07be_0614:  ; case
  0614  9a25009030       lcall 0x3090, 0x25                       -> ovl51:01ab
  0619  e9ee04           jmp 0xb0a                                
res_07be_061c:  ; case
  061c  9a2a009030       lcall 0x3090, 0x2a                       -> ovl51:01d4
  0621  e9e604           jmp 0xb0a                                
res_07be_0624:  ; case
  0624  8bc2             mov ax, dx                               
  0626  2d7d00           sub ax, 0x7d                             
  0629  50               push ax                                  
  062a  9a3400ab30       lcall 0x30ab, 0x34                       -> ovl57:0a4e
  062f  e99f04           jmp 0xad1                                
res_07be_0632:  ; case
  0632  8bc2             mov ax, dx                               
  0634  2d8500           sub ax, 0x85                             
  0637  50               push ax                                  
  0638  9a7000ab30       lcall 0x30ab, 0x70                       -> ovl57:16ea
  063d  e99104           jmp 0xad1                                
res_07be_0640:  ; case
  0640  8bc2             mov ax, dx                               
  0642  2d9500           sub ax, 0x95                             
  0645  50               push ax                                  
  0646  9a7000ab30       lcall 0x30ab, 0x70                       -> ovl57:16ea
  064b  e98304           jmp 0xad1                                
res_07be_064e:  ; case
  064e  6a00             push 0                                   
  0650  9a4800ab30       lcall 0x30ab, 0x48                       -> ovl57:0ee8
  0655  e97904           jmp 0xad1                                
res_07be_0658:  ; case
  0658  6a01             push 1                                   
  065a  9a4800ab30       lcall 0x30ab, 0x48                       -> ovl57:0ee8
  065f  e96f04           jmp 0xad1                                
res_07be_0662:  ; case
  0662  9a3e00ab30       lcall 0x30ab, 0x3e                       -> ovl57:0cfe
  0667  e9a004           jmp 0xb0a                                
res_07be_066a:  ; case
  066a  9a4300ab30       lcall 0x30ab, 0x43                       -> ovl57:0edb
  066f  e99804           jmp 0xb0a                                
res_07be_0672:  ; case
  0672  6a00             push 0                                   
  0674  9a5200ab30       lcall 0x30ab, 0x52                       -> ovl57:1273
  0679  e95504           jmp 0xad1                                
res_07be_067c:  ; case
  067c  6a01             push 1                                   
  067e  9a5200ab30       lcall 0x30ab, 0x52                       -> ovl57:1273
  0683  e94b04           jmp 0xad1                                
res_07be_0686:  ; case
  0686  6a02             push 2                                   
  0688  9a5200ab30       lcall 0x30ab, 0x52                       -> ovl57:1273
  068d  e94104           jmp 0xad1                                
res_07be_0690:  ; case
  0690  9a3900ab30       lcall 0x30ab, 0x39                       -> ovl57:0cf4
  0695  e97204           jmp 0xb0a                                
res_07be_0698:  ; case
  0698  8bc2             mov ax, dx                               
  069a  2d9f00           sub ax, 0x9f                             
  069d  50               push ax                                  
  069e  9a6100ab30       lcall 0x30ab, 0x61                       -> ovl57:1650
  06a3  e92b04           jmp 0xad1                                
res_07be_06a6:  ; case
  06a6  6a00             push 0                                   
  06a8  9a6600ab30       lcall 0x30ab, 0x66                       -> ovl57:1694
  06ad  e92104           jmp 0xad1                                
res_07be_06b0:  ; case
  06b0  6a01             push 1                                   
  06b2  9a6600ab30       lcall 0x30ab, 0x66                       -> ovl57:1694
  06b7  e91704           jmp 0xad1                                
res_07be_06ba:  ; case
  06ba  6a02             push 2                                   
  06bc  9a6600ab30       lcall 0x30ab, 0x66                       -> ovl57:1694
  06c1  e90d04           jmp 0xad1                                
res_07be_06c4:  ; case
  06c4  9a6b00ab30       lcall 0x30ab, 0x6b                       -> ovl57:16c6
  06c9  e93e04           jmp 0xb0a                                
res_07be_06cc:  ; case
  06cc  9a5700ab30       lcall 0x30ab, 0x57                       -> ovl57:2229
  06d1  e93604           jmp 0xb0a                                
res_07be_06d4:  ; case
  06d4  9a5c00ab30       lcall 0x30ab, 0x5c                       -> ovl57:2051
  06d9  e92e04           jmp 0xb0a                                
res_07be_06dc:  ; case
  06dc  9a8e00ab30       lcall 0x30ab, 0x8e                       -> ovl57:2024
  06e1  e92604           jmp 0xb0a                                
res_07be_06e4:  ; case
  06e4  9a8900ab30       lcall 0x30ab, 0x89                       -> ovl57:1fd7
  06e9  e91e04           jmp 0xb0a                                
res_07be_06ec:  ; case
  06ec  9a8400ab30       lcall 0x30ab, 0x84                       -> ovl57:1f8a
  06f1  e91604           jmp 0xb0a                                
res_07be_06f4:  ; case
  06f4  6aff             push -1                                  
  06f6  9a7a00ab30       lcall 0x30ab, 0x7a                       -> ovl57:1ed1
  06fb  e9d303           jmp 0xad1                                
res_07be_06fe:  ; case
  06fe  6a01             push 1                                   
  0700  9a7a00ab30       lcall 0x30ab, 0x7a                       -> ovl57:1ed1
  0705  e9c903           jmp 0xad1                                
res_07be_0708:  ; case
  0708  6aff             push -1                                  
  070a  9a7f00ab30       lcall 0x30ab, 0x7f                       -> ovl57:1f23
  070f  e9bf03           jmp 0xad1                                
res_07be_0712:  ; case
  0712  6a01             push 1                                   
  0714  9a7f00ab30       lcall 0x30ab, 0x7f                       -> ovl57:1f23
  0719  e9b503           jmp 0xad1                                
res_07be_071c:  ; case
  071c  8bc2             mov ax, dx                               
  071e  2dd001           sub ax, 0x1d0                            
  0721  50               push ax                                  
  0722  9a7500ab30       lcall 0x30ab, 0x75                       -> ovl57:1e8a
  0727  e9a703           jmp 0xad1                                
res_07be_072a:  ; case
  072a  6a01             push 1                                   
  072c  9a3e00a530       lcall 0x30a5, 0x3e                       -> ovl56:0312
  0731  e99d03           jmp 0xad1                                
res_07be_0734:  ; case
  0734  6a00             push 0                                   
  0736  9a3e00a530       lcall 0x30a5, 0x3e                       -> ovl56:0312
  073b  e99303           jmp 0xad1                                
res_07be_073e:  ; case
  073e  9a4300a530       lcall 0x30a5, 0x43                       -> ovl56:037c
  0743  e9c403           jmp 0xb0a                                
res_07be_0746:  ; case
  0746  9a25006430       lcall 0x3064, 0x25                       -> ovl45:02e1
  074b  e9bc03           jmp 0xb0a                                
res_07be_074e:  ; case
  074e  9a2a006430       lcall 0x3064, 0x2a                       -> ovl45:033b
  0753  e9b403           jmp 0xb0a                                
res_07be_0756:  ; case
  0756  9a3e006430       lcall 0x3064, 0x3e                       -> ovl45:0393
  075b  e9ac03           jmp 0xb0a                                
res_07be_075e:  ; case
  075e  9a34006430       lcall 0x3064, 0x34                       -> ovl45:0367
  0763  e9a403           jmp 0xb0a                                
res_07be_0766:  ; case
  0766  9a39006430       lcall 0x3064, 0x39                       -> ovl45:037d
  076b  e99c03           jmp 0xb0a                                
res_07be_076e:  ; case
  076e  9a34005830       lcall 0x3058, 0x34                       -> ovl44:0185
  0773  e99403           jmp 0xb0a                                
res_07be_0776:  ; case
  0776  8bc2             mov ax, dx                               
  0778  2dc500           sub ax, 0xc5                             
  077b  50               push ax                                  
  077c  9a2a005830       lcall 0x3058, 0x2a                       -> ovl44:00c8
  0781  e94d03           jmp 0xad1                                
res_07be_0784:  ; case
  0784  9a57006430       lcall 0x3064, 0x57                       -> ovl45:2013
  0789  e97e03           jmp 0xb0a                                
res_07be_078c:  ; case
  078c  9a20000b30       lcall 0x300b, 0x20                       -> ovl32:0000
  0791  e97603           jmp 0xb0a                                
res_07be_0794:  ; case
  0794  9a5c005830       lcall 0x3058, 0x5c                       -> ovl44:0978
  0799  e96e03           jmp 0xb0a                                
res_07be_079c:  ; case
  079c  8bc2             mov ax, dx                               
  079e  2dd200           sub ax, 0xd2                             
  07a1  50               push ax                                  
  07a2  9a4d005830       lcall 0x3058, 0x4d                       -> ovl44:050e
  07a7  e92703           jmp 0xad1                                
res_07be_07aa:  ; case
  07aa  8bc2             mov ax, dx                               
  07ac  2dd600           sub ax, 0xd6                             
  07af  50               push ax                                  
  07b0  9a4d005830       lcall 0x3058, 0x4d                       -> ovl44:050e
  07b5  e91903           jmp 0xad1                                
res_07be_07b8:  ; case
  07b8  9a39005130       lcall 0x3051, 0x39                       -> ovl43:0abd
  07bd  e94a03           jmp 0xb0a                                
res_07be_07c0:  ; case
  07c0  9a3e005130       lcall 0x3051, 0x3e                       -> ovl43:0af5
  07c5  e94203           jmp 0xb0a                                
res_07be_07c8:  ; case
  07c8  9a43005130       lcall 0x3051, 0x43                       -> ovl43:0b29
  07cd  e93a03           jmp 0xb0a                                
res_07be_07d0:  ; case
  07d0  9a48005130       lcall 0x3051, 0x48                       -> ovl43:0b91
  07d5  e93203           jmp 0xb0a                                
res_07be_07d8:  ; case
  07d8  8bc2             mov ax, dx                               
  07da  2dda00           sub ax, 0xda                             
  07dd  50               push ax                                  
  07de  9a25004c30       lcall 0x304c, 0x25                       -> ovl42:02d7
  07e3  e9eb02           jmp 0xad1                                
res_07be_07e6:  ; case
  07e6  9a2a004c30       lcall 0x304c, 0x2a                       -> ovl42:02e4
  07eb  e91c03           jmp 0xb0a                                
res_07be_07ee:  ; case
  07ee  9a25003b30       lcall 0x303b, 0x25                       -> ovl40:0b2d
  07f3  e91403           jmp 0xb0a                                
res_07be_07f6:  ; case
  07f6  9a2a003b30       lcall 0x303b, 0x2a                       -> ovl40:0b5b
  07fb  e90c03           jmp 0xb0a                                
res_07be_07fe:  ; case
  07fe  9a2f003b30       lcall 0x303b, 0x2f                       -> ovl40:0b8a
  0803  e90403           jmp 0xb0a                                
res_07be_0806:  ; case
  0806  9a34003b30       lcall 0x303b, 0x34                       -> ovl40:0bbd
  080b  e9fc02           jmp 0xb0a                                
res_07be_080e:  ; case
  080e  9a39003b30       lcall 0x303b, 0x39                       -> ovl40:0bf1
  0813  e9f402           jmp 0xb0a                                
res_07be_0816:  ; case
  0816  9a43003b30       lcall 0x303b, 0x43                       -> ovl40:0fc2
  081b  e9ec02           jmp 0xb0a                                
res_07be_081e:  ; case
  081e  9a48003b30       lcall 0x303b, 0x48                       -> ovl40:1037
  0823  e9e402           jmp 0xb0a                                
res_07be_0826:  ; case
  0826  9a4d003b30       lcall 0x303b, 0x4d                       -> ovl40:0d1e
  082b  e9dc02           jmp 0xb0a                                
res_07be_082e:  ; case
  082e  9a52003b30       lcall 0x303b, 0x52                       -> ovl40:0e70
  0833  e9d402           jmp 0xb0a                                
res_07be_0836:  ; case
  0836  9a25000f30       lcall 0x300f, 0x25                       -> ovl33:0034
  083b  e9cc02           jmp 0xb0a                                
res_07be_083e:  ; case
  083e  6a00             push 0                                   
  0840  9a39000f30       lcall 0x300f, 0x39                       -> ovl33:0576
  0845  e98902           jmp 0xad1                                
res_07be_0848:  ; case
  0848  6a01             push 1                                   
  084a  9a39000f30       lcall 0x300f, 0x39                       -> ovl33:0576
  084f  e97f02           jmp 0xad1                                
res_07be_0852:  ; case
  0852  6a02             push 2                                   
  0854  9a39000f30       lcall 0x300f, 0x39                       -> ovl33:0576
  0859  e97502           jmp 0xad1                                
res_07be_085c:  ; case
  085c  8bc2             mov ax, dx                               
  085e  2dfc00           sub ax, 0xfc                             
  0861  50               push ax                                  
  0862  9a2f000f30       lcall 0x300f, 0x2f                       -> ovl33:04cc
  0867  e96702           jmp 0xad1                                
res_07be_086a:  ; case
  086a  8bc2             mov ax, dx                               
  086c  2d0401           sub ax, 0x104                            
  086f  50               push ax                                  
  0870  9a2a000f30       lcall 0x300f, 0x2a                       -> ovl33:0508
  0875  e95902           jmp 0xad1                                
res_07be_0878:  ; case
  0878  8bc2             mov ax, dx                               
  087a  2d0c01           sub ax, 0x10c                            
  087d  50               push ax                                  
  087e  9a34000f30       lcall 0x300f, 0x34                       -> ovl33:053f
  0883  e94b02           jmp 0xad1                                
res_07be_0886:  ; case
  0886  9a3e001430       lcall 0x3014, 0x3e                       -> ovl34:0bf5
  088b  e97c02           jmp 0xb0a                                
res_07be_088e:  ; case
  088e  9a39001430       lcall 0x3014, 0x39                       -> ovl34:0b1a
  0893  e97402           jmp 0xb0a                                
res_07be_0896:  ; case
  0896  9a43001430       lcall 0x3014, 0x43                       -> ovl34:0c50
  089b  e96c02           jmp 0xb0a                                
res_07be_089e:  ; case
  089e  9a4d001430       lcall 0x3014, 0x4d                       -> ovl34:0bcf
  08a3  e96402           jmp 0xb0a                                
res_07be_08a6:  ; case
  08a6  9a2f000530       lcall 0x3005, 0x2f                       -> ovl31:03fe
  08ab  e95c02           jmp 0xb0a                                
res_07be_08ae:  ; case
  08ae  9a2a000530       lcall 0x3005, 0x2a                       -> ovl31:035e
  08b3  e95402           jmp 0xb0a                                
res_07be_08b6:  ; case
  08b6  9a34000530       lcall 0x3005, 0x34                       -> ovl31:046b
  08bb  e94c02           jmp 0xb0a                                
res_07be_08be:  ; case
  08be  9a25000530       lcall 0x3005, 0x25                       -> ovl31:029f
  08c3  e94402           jmp 0xb0a                                
res_07be_08c6:  ; case
  08c6  9a3e007330       lcall 0x3073, 0x3e                       -> ovl47:127e
  08cb  e93c02           jmp 0xb0a                                
res_07be_08ce:  ; case
  08ce  9a43007330       lcall 0x3073, 0x43                       -> ovl47:12af
  08d3  e93402           jmp 0xb0a                                
res_07be_08d6:  ; case
  08d6  9a48007330       lcall 0x3073, 0x48                       -> ovl47:12ce
  08db  e92c02           jmp 0xb0a                                
res_07be_08de:  ; case
  08de  6a00             push 0                                   
  08e0  eb02             jmp 0x8e4                                
res_07be_08e2:  ; case
  08e2  6a01             push 1                                   
  08e4  9a52007330       lcall 0x3073, 0x52                       -> ovl47:12f9
  08e9  e9e501           jmp 0xad1                                
res_07be_08ec:  ; case
  08ec  9a7a001430       lcall 0x3014, 0x7a                       -> ovl34:1964
  08f1  e91602           jmp 0xb0a                                
res_07be_08f4:  ; case
  08f4  9a75001430       lcall 0x3014, 0x75                       -> ovl34:186e
  08f9  e90e02           jmp 0xb0a                                
res_07be_08fc:  ; case
  08fc  9a25009f2f       lcall 0x2f9f, 0x25                       -> ovl14:0032
  0901  e90602           jmp 0xb0a                                
res_07be_0904:  ; case
  0904  8bc2             mov ax, dx                               
  0906  2d2701           sub ax, 0x127                            
  0909  50               push ax                                  
  090a  9a2a009f2f       lcall 0x2f9f, 0x2a                       -> ovl14:0053
  090f  e9bf01           jmp 0xad1                                
res_07be_0912:  ; case
  0912  8bc2             mov ax, dx                               
  0914  2d3c01           sub ax, 0x13c                            
  0917  50               push ax                                  
  0918  9a34009f2f       lcall 0x2f9f, 0x34                       -> ovl14:00e9
  091d  e9b101           jmp 0xad1                                
res_07be_0920:  ; case
  0920  9a2a005b2f       lcall 0x2f5b, 0x2a                       -> ovl01:0132
  0925  e9e201           jmp 0xb0a                                
res_07be_0928:  ; case
  0928  9a25005b2f       lcall 0x2f5b, 0x25                       -> ovl01:011b
  092d  e9da01           jmp 0xb0a                                
res_07be_0930:  ; case
  0930  9a39005b2f       lcall 0x2f5b, 0x39                       -> ovl01:0d65
  0935  e9d201           jmp 0xb0a                                
res_07be_0938:  ; case
  0938  9a52005b2f       lcall 0x2f5b, 0x52                       -> ovl01:18a1
  093d  e9ca01           jmp 0xb0a                                
res_07be_0940:  ; case
  0940  9a5c000c31       lcall 0x310c, 0x5c                       -> ovl66:14d3
  0945  e9c201           jmp 0xb0a                                
res_07be_0948:  ; case
  0948  9a61000c31       lcall 0x310c, 0x61                       -> ovl66:14fd
  094d  e9ba01           jmp 0xb0a                                
res_07be_0950:  ; case
  0950  9a70000c31       lcall 0x310c, 0x70                       -> ovl66:16c5
  0955  e9b201           jmp 0xb0a                                
res_07be_0958:  ; case
  0958  9a75000c31       lcall 0x310c, 0x75                       -> ovl66:1704
  095d  e9aa01           jmp 0xb0a                                
res_07be_0960:  ; case
  0960  8bc2             mov ax, dx                               
  0962  2d5001           sub ax, 0x150                            
  0965  50               push ax                                  
  0966  9a66000c31       lcall 0x310c, 0x66                       -> ovl66:157d
  096b  e96301           jmp 0xad1                                
res_07be_096e:  ; case
  096e  8bc2             mov ax, dx                               
  0970  2d5801           sub ax, 0x158                            
  0973  50               push ax                                  
  0974  9a6b000c31       lcall 0x310c, 0x6b                       -> ovl66:166f
  0979  e95501           jmp 0xad1                                
res_07be_097c:  ; case
  097c  8bc2             mov ax, dx                               
  097e  2d6801           sub ax, 0x168                            
  0981  50               push ax                                  
  0982  9a3e004230       lcall 0x3042, 0x3e                       -> ovl41:0d33
  0987  e94701           jmp 0xad1                                
res_07be_098a:  ; case
  098a  9a43004230       lcall 0x3042, 0x43                       -> ovl41:0d49
  098f  e97801           jmp 0xb0a                                
res_07be_0992:  ; case
  0992  6a01             push 1                                   
  0994  eb02             jmp 0x998                                
res_07be_0996:  ; case
  0996  6aff             push -1                                  
  0998  9a4d004230       lcall 0x3042, 0x4d                       -> ovl41:0908
  099d  e93101           jmp 0xad1                                
res_07be_09a0:  ; case
  09a0  9a2f004230       lcall 0x3042, 0x2f                       -> ovl41:09cf
  09a5  e96201           jmp 0xb0a                                
res_07be_09a8:  ; case
  09a8  8bc2             mov ax, dx                               
  09aa  2d6001           sub ax, 0x160                            
  09ad  50               push ax                                  
  09ae  9a2a004230       lcall 0x3042, 0x2a                       -> ovl41:08e2
  09b3  e91b01           jmp 0xad1                                
res_07be_09b6:  ; case
  09b6  9a2500542f       lcall 0x2f54, 0x25                       -> ovl00:030d
  09bb  e94c01           jmp 0xb0a                                
res_07be_09be:  ; case
  09be  9a2a00542f       lcall 0x2f54, 0x2a                       -> ovl00:0324
  09c3  e94401           jmp 0xb0a                                
res_07be_09c6:  ; case
  09c6  9a3400542f       lcall 0x2f54, 0x34                       -> ovl00:0a31
  09cb  e93c01           jmp 0xb0a                                
res_07be_09ce:  ; case
  09ce  9a3900542f       lcall 0x2f54, 0x39                       -> ovl00:0a48
  09d3  e93401           jmp 0xb0a                                
res_07be_09d6:  ; case
  09d6  8bc2             mov ax, dx                               
  09d8  2d7401           sub ax, 0x174                            
  09db  50               push ax                                  
  09dc  6a00             push 0                                   
  09de  eb12             jmp 0x9f2                                
res_07be_09e0:  ; case
  09e0  8bc2             mov ax, dx                               
  09e2  2d7c01           sub ax, 0x17c                            
  09e5  50               push ax                                  
  09e6  6a01             push 1                                   
  09e8  eb08             jmp 0x9f2                                
res_07be_09ea:  ; case
  09ea  8bc2             mov ax, dx                               
  09ec  2d8401           sub ax, 0x184                            
  09ef  50               push ax                                  
  09f0  6a02             push 2                                   
  09f2  9a3e00542f       lcall 0x2f54, 0x3e                       -> ovl00:0a69
  09f7  e90afb           jmp 0x504                                
res_07be_09fa:  ; case
  09fa  9a61005830       lcall 0x3058, 0x61                       -> ovl44:0eca
  09ff  e90801           jmp 0xb0a                                
res_07be_0a02:  ; case
  0a02  8bc2             mov ax, dx                               
  0a04  2d8d01           sub ax, 0x18d                            
  0a07  50               push ax                                  
  0a08  9a6b005830       lcall 0x3058, 0x6b                       -> ovl44:1112
  0a0d  e9c100           jmp 0xad1                                
res_07be_0a10:  ; case
  0a10  8bc2             mov ax, dx                               
  0a12  2d9101           sub ax, 0x191                            
  0a15  50               push ax                                  
  0a16  9a66005830       lcall 0x3058, 0x66                       -> ovl44:0ee3
  0a1b  e9b300           jmp 0xad1                                
res_07be_0a1e:  ; case
  0a1e  9a39009a2f       lcall 0x2f9a, 0x39                       -> ovl13:0486
  0a23  e9e400           jmp 0xb0a                                
res_07be_0a26:  ; case
  0a26  9a2f009a2f       lcall 0x2f9a, 0x2f                       -> ovl13:03dd
  0a2b  e9dc00           jmp 0xb0a                                
res_07be_0a2e:  ; case
  0a2e  9a34009a2f       lcall 0x2f9a, 0x34                       -> ovl13:0432
  0a33  e9d400           jmp 0xb0a                                
res_07be_0a36:  ; case
  0a36  9a4d002430       lcall 0x3024, 0x4d                       -> ovl36:2050
  0a3b  e9cc00           jmp 0xb0a                                
res_07be_0a3e:  ; case
  0a3e  9a34003030       lcall 0x3030, 0x34                       -> ovl38:10fa
  0a43  e9c400           jmp 0xb0a                                
res_07be_0a46:  ; case
  0a46  9a43003030       lcall 0x3030, 0x43                       -> ovl38:111c
  0a4b  e9bc00           jmp 0xb0a                                
res_07be_0a4e:  ; case
  0a4e  9a48003030       lcall 0x3030, 0x48                       -> ovl38:116a
  0a53  e9b400           jmp 0xb0a                                
res_07be_0a56:  ; case
  0a56  9a39003030       lcall 0x3030, 0x39                       -> ovl38:11af
  0a5b  e9ac00           jmp 0xb0a                                
res_07be_0a5e:  ; case
  0a5e  9a3e003030       lcall 0x3030, 0x3e                       -> ovl38:1294
  0a63  e9a400           jmp 0xb0a                                
res_07be_0a66:  ; case
  0a66  8bc2             mov ax, dx                               
  0a68  2dae01           sub ax, 0x1ae                            
  0a6b  50               push ax                                  
  0a6c  9a4d003030       lcall 0x3030, 0x4d                       -> ovl38:1379
  0a71  eb5e             jmp 0xad1                                
res_07be_0a73:  ; case
  0a73  9a70007330       lcall 0x3073, 0x70                       -> ovl47:1a7a
  0a78  e98f00           jmp 0xb0a                                
res_07be_0a7b:  ; case
  0a7b  9a6b00cc30       lcall 0x30cc, 0x6b                       -> ovl60:0b7e
  0a80  e98700           jmp 0xb0a                                
res_07be_0a83:  ; case
  0a83  9a7000cc30       lcall 0x30cc, 0x70                       -> ovl60:0b90
  0a88  e97f00           jmp 0xb0a                                
res_07be_0a8b:  ; case
  0a8b  eb02             jmp 0xa8f                                
res_07be_0a8d:  ; case
  0a8d  eb07             jmp 0xa96                                
res_07be_0a8f:  ; case
  0a8f  9a7500cc30       lcall 0x30cc, 0x75                       -> ovl60:0ba0
  0a94  eb74             jmp 0xb0a                                
res_07be_0a96:  ; case
  0a96  9a7a00cc30       lcall 0x30cc, 0x7a                       -> ovl60:0c11
  0a9b  eb6d             jmp 0xb0a                                
res_07be_0a9d:  ; case
  0a9d  8bc2             mov ax, dx                               
  0a9f  2ddc01           sub ax, 0x1dc                            
  0aa2  50               push ax                                  
  0aa3  9a6600cc30       lcall 0x30cc, 0x66                       -> ovl60:0b40
  0aa8  eb27             jmp 0xad1                                
res_07be_0aaa:  ; case
  0aaa  9a9800d730       lcall 0x30d7, 0x98                       -> ovl61:1e4e
  0aaf  eb59             jmp 0xb0a                                
res_07be_0ab1:  ; case
  0ab1  9a9d00d730       lcall 0x30d7, 0x9d                       -> ovl61:1ecd
  0ab6  eb52             jmp 0xb0a                                
res_07be_0ab8:  ; case
  0ab8  9ad900d730       lcall 0x30d7, 0xd9                       -> ovl61:2046
  0abd  eb4b             jmp 0xb0a                                
res_07be_0abf:  ; case
  0abf  9ad400d730       lcall 0x30d7, 0xd4                       -> ovl61:2004
  0ac4  eb44             jmp 0xb0a                                
res_07be_0ac6:  ; case
  0ac6  6a00             push 0                                   
  0ac8  eb02             jmp 0xacc                                
res_07be_0aca:  ; case
  0aca  6a01             push 1                                   
  0acc  9a70007f30       lcall 0x307f, 0x70                       -> ovl49:1608
  0ad1  59               pop cx                                   
  0ad2  eb36             jmp 0xb0a                                
res_07be_0ad4:  ; case
  0ad4  9a75007f30       lcall 0x307f, 0x75                       -> ovl49:1832
  0ad9  eb2f             jmp 0xb0a                                
res_07be_0adb:  ; case
  0adb  9a84000c31       lcall 0x310c, 0x84                       -> ovl66:1eaf
  0ae0  eb28             jmp 0xb0a                                
res_07be_0ae2:  ; case
  0ae2  9a89000c31       lcall 0x310c, 0x89                       -> ovl66:1ed3
  0ae7  eb21             jmp 0xb0a                                
res_07be_0ae9:  ; case
  0ae9  9a8e000c31       lcall 0x310c, 0x8e                       -> ovl66:1ee9
  0aee  eb1a             jmp 0xb0a                                
res_07be_0af0:  ; case
  0af0  9a93000c31       lcall 0x310c, 0x93                       -> ovl66:1eff
  0af5  eb13             jmp 0xb0a                                
res_07be_0af7:  ; case
  0af7  9a98000c31       lcall 0x310c, 0x98                       -> ovl66:1f26
  0afc  eb0c             jmp 0xb0a                                
res_07be_0afe:  ; case
  0afe  9a48001d30       lcall 0x301d, 0x48                       -> ovl35:0f2d
  0b03  eb05             jmp 0xb0a                                
res_07be_0b05:  ; case
  0b05  9a4d001d30       lcall 0x301d, 0x4d                       -> ovl35:0f4e
res_07be_0b0a:  ; case
  0b0a  5d               pop bp                                   
  0b0b  cb               retf                                     
  0b0c  9a05a205aa05b205 dw 059a,05a2,05aa,05b2,05c2,05ba,05d8,05d8,05d8,05d8,05ca,05ca,05ca,05ca,05e6,05e6,05e6,05e6,05e6,05f4,05fc,0604,060c,0614,061c,0624,0624,0624,0624,0624,0624,0624,0624,0632,0632,0632,0632,0632,0632,0632,0632,0662,066a,0658,064e,0672,067c,0686,0690,0640,0640,0640,0640,0640,0640,0640,0640,06cc,06d4,0698,0698,0698,0698,0698,0698,0698,0698,0698,0698,06a6,06b0,06ba,06c4,04f3,050a,0512,051a,0522,052a,058c,058c,058c,058c,054a,054a,054a,0532,053a,0542,072a,0734,073e,0746,074e,0756,075e,0766,0776,0776,0776,0776,0746,076e,0784,0794,078c,07b8,07c0,07c8,07d0,079c,079c,079c,0b0a,07aa,07aa,07aa,0b0a,07d8,07d8,07d8,07d8,07d8,07e6,0570,0570,0570,0570,0570,0570,0570,0570,057e,057e,057e,057e,057e,057e,057e,057e,0560,0568,07ee,07f6,07fe,0806,080e,0826,082e,0816,081e,0836,085c,085c,085c,085c,085c,085c,085c,085c,086a,086a,086a,086a,086a,086a,086a,086a,0878,0878,0878,0878,0878,0878,0878,0878,083e,0848,0852,0886,088e,0896,089e,08b6,08be,08a6,08ae,08c6,08ce,08d6,08de,08e2,08ec,08f4,08fc,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0904,0912,0912,0912,0912,0552,0552,0552,0552,0552,0552,0552,0552,0920,0928,0930,0938,0940,0948,0950,0958,0960,0960,0960,0960,0960,0960,0960,0960,096e,096e,096e,096e,096e,096e,096e,096e,09a8,09a8,09a8,09a8,09a0,0996,0992,098a,097c,097c,097c,097c,097c,097c,097c,097c,09b6,09be,09c6,09ce,09d6,09d6,09d6,09d6,09d6,09d6,09d6,09d6,09e0,09e0,09e0,09e0,09e0,09e0,09e0,09e0,09ea,09ea,09ea,09ea,09ea,09ea,09ea,09ea,09fa,0a02,0a02,0a02,0a02,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0a10,0b0a,0a1e,0a26,0a2e,0a36,0a3e,0a46,0a4e,0a56,0a5e,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,0a66,06dc,06e4,06ec,06f4,06fe,0708,0712,071c,071c,071c,071c,071c,0a73,0a8b,0a8d,0a8f,0a96,0a7b,0a83,0a9d,0a9d,0a9d,0a9d,0a9d,0a9d,0a9d,0abf,0ab8,0aaa,0ab1,0ac6,0aca,0ad4,0adb,0ae2,0ae9,0af0,0af7,0afe,0b05 jump table

res_07be_0e26:  ; ENTRY
  0e26  55               push bp                                  
  0e27  8bec             mov bp, sp                               
  0e29  83ec04           sub sp, 4                                
  0e2c  56               push si                                  
  0e2d  8b7606           mov si, word ptr [bp + 6]                
  0e30  c41e404c         les bx, ptr [0x4c40]                     
  0e34  268b4702         mov ax, word ptr es:[bx + 2]             
  0e38  268b17           mov dx, word ptr es:[bx]                 
  0e3b  8b1e3e4c         mov bx, word ptr [0x4c3e]                
  0e3f  6bdb21           imul bx, bx, 0x21                        
  0e42  03d3             add dx, bx                               
  0e44  8946fe           mov word ptr [bp - 2], ax                
  0e47  8956fc           mov word ptr [bp - 4], dx                
  0e4a  c45efc           les bx, ptr [bp - 4]                     
  0e4d  26ff37           push word ptr es:[bx]                    
  0e50  9aab05a908       lcall 0x8a9, 0x5ab                       -> 08a9:05ab
  0e55  59               pop cx                                   
  0e56  3d0200           cmp ax, 2                                
  0e59  7420             je 0xe7b                                 
  0e5b  c45efc           les bx, ptr [bp - 4]                     
  0e5e  26ff37           push word ptr es:[bx]                    
  0e61  9aab05a908       lcall 0x8a9, 0x5ab                       -> 08a9:05ab
  0e66  59               pop cx                                   
  0e67  0bc0             or ax, ax                                
  0e69  7410             je 0xe7b                                 
  0e6b  c45efc           les bx, ptr [bp - 4]                     
  0e6e  26ff37           push word ptr es:[bx]                    
  0e71  9aab05a908       lcall 0x8a9, 0x5ab                       -> 08a9:05ab
  0e76  59               pop cx                                   
  0e77  0bc0             or ax, ax                                
  0e79  7507             jne 0xe82                                
  0e7b  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0e80  eb39             jmp 0xebb                                
  0e82  6a00             push 0                                   
  0e84  c45efc           les bx, ptr [bp - 4]                     
  0e87  26ff37           push word ptr es:[bx]                    
  0e8a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0e8f  83c404           add sp, 4                                
  0e92  0bf6             or si, si                                
  0e94  740e             je 0xea4                                 
  0e96  a13e4c           mov ax, word ptr [0x4c3e]                
  0e99  a33c4c           mov word ptr [0x4c3c], ax                
  0e9c  c7066c160100     mov word ptr [0x166c], 1                 
  0ea2  eb17             jmp 0xebb                                
  0ea4  c45efc           les bx, ptr [bp - 4]                     
  0ea7  26833f00         cmp word ptr es:[bx], 0                  
  0eab  740e             je 0xebb                                 
  0ead  56               push si                                  
  0eae  c45efc           les bx, ptr [bp - 4]                     
  0eb1  26ff37           push word ptr es:[bx]                    
  0eb4  0e               push cs                                  
  0eb5  e820f6           call 0x4d8                               
  0eb8  83c404           add sp, 4                                
  0ebb  5e               pop si                                   
  0ebc  c9               leave                                    
  0ebd  cb               retf                                     
  0ebe  55               push bp                                  
