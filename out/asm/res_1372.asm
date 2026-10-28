; res_1372 file_off 0x15720

res_1372_0002:  ; ENTRY
  0002  55               push bp                                  
  0003  8bec             mov bp, sp                               
  0005  c45e06           les bx, ptr [bp + 6]                     
  0008  268c5f0e         mov word ptr es:[bx + 0xe], ds           
  000c  26c7470c2c6f     mov word ptr es:[bx + 0xc], 0x6f2c       
  0012  c7066b6fff00     mov word ptr [0x6f6b], 0xff              
  0018  c7066d6fff00     mov word ptr [0x6f6d], 0xff              
  001e  c706716f0000     mov word ptr [0x6f71], 0                 
  0024  c706736f0100     mov word ptr [0x6f73], 1                 
  002a  c45e06           les bx, ptr [bp + 6]                     
  002d  26c41f           les bx, ptr es:[bx]                      
  0030  268b4708         mov ax, word ptr es:[bx + 8]             
  0034  a3756f           mov word ptr [0x6f75], ax                
  0037  c706776f0100     mov word ptr [0x6f77], 1                 
  003d  668b4606         mov eax, dword ptr [bp + 6]              
  0041  66a3286f         mov dword ptr [0x6f28], eax              
  0045  5d               pop bp                                   
  0046  cb               retf                                     

res_1372_0047:  ; ENTRY
  0047  c8040000         enter 4, 0                               
  004b  56               push si                                  
  004c  b9ff00           mov cx, 0xff                             
  004f  c45e06           les bx, ptr [bp + 6]                     
  0052  26813f3b01       cmp word ptr es:[bx], 0x13b              
  0057  740a             je 0x63                                  
  0059  c45e06           les bx, ptr [bp + 6]                     
  005c  26813f5201       cmp word ptr es:[bx], 0x152              
  0061  7510             jne 0x73                                 
  0063  6a02             push 2                                   
  0065  90               nop                                      
  0066  0e               push cs                                  
  0067  e88600           call 0xf0                                
  006a  59               pop cx                                   
  006b  c45e06           les bx, ptr [bp + 6]                     
  006e  268907           mov word ptr es:[bx], ax                 
  0071  eb7a             jmp 0xed                                 
  0073  c41e286f         les bx, ptr [0x6f28]                     
  0077  268b7708         mov si, word ptr es:[bx + 8]             
  007b  eb31             jmp 0xae                                 
  007d  c41e286f         les bx, ptr [0x6f28]                     
  0081  268b4702         mov ax, word ptr es:[bx + 2]             
  0085  268b17           mov dx, word ptr es:[bx]                 
  0088  8bde             mov bx, si                               
  008a  6bdb2e           imul bx, bx, 0x2e                        
  008d  03d3             add dx, bx                               
  008f  8946fe           mov word ptr [bp - 2], ax                
  0092  8ec0             mov es, ax                               
  0094  8956fc           mov word ptr [bp - 4], dx                
  0097  8bda             mov bx, dx                               
  0099  268b470a         mov ax, word ptr es:[bx + 0xa]           
  009d  c45e06           les bx, ptr [bp + 6]                     
  00a0  263b07           cmp ax, word ptr es:[bx]                 
  00a3  7509             jne 0xae                                 
  00a5  c45efc           les bx, ptr [bp - 4]                     
  00a8  268b4f08         mov cx, word ptr es:[bx + 8]             
  00ac  eb07             jmp 0xb5                                 
  00ae  8bc6             mov ax, si                               
  00b0  4e               dec si                                   
  00b1  0bc0             or ax, ax                                
  00b3  75c8             jne 0x7d                                 
  00b5  81f9ff00         cmp cx, 0xff                             
  00b9  7510             jne 0xcb                                 
  00bb  ff7608           push word ptr [bp + 8]                   
  00be  ff7606           push word ptr [bp + 6]                   
  00c1  90               nop                                      
  00c2  0e               push cs                                  
  00c3  e85510           call 0x111b                              
  00c6  83c404           add sp, 4                                
  00c9  eb22             jmp 0xed                                 
  00cb  390e756f         cmp word ptr [0x6f75], cx                
  00cf  750b             jne 0xdc                                 
  00d1  a1756f           mov ax, word ptr [0x6f75]                
  00d4  a3716f           mov word ptr [0x6f71], ax                
  00d7  a1776f           mov ax, word ptr [0x6f77]                
  00da  eb0b             jmp 0xe7                                 
  00dc  890e716f         mov word ptr [0x6f71], cx                
  00e0  51               push cx                                  
  00e1  90               nop                                      
  00e2  0e               push cs                                  
  00e3  e86a0b           call 0xc50                               
  00e6  59               pop cx                                   
  00e7  a3736f           mov word ptr [0x6f73], ax                
  00ea  e976ff           jmp 0x63                                 
  00ed  5e               pop si                                   
  00ee  c9               leave                                    
  00ef  cb               retf                                     

res_1372_00f0:  ; ENTRY
  00f0  c8100000         enter 0x10, 0                            
  00f4  8b4606           mov ax, word ptr [bp + 6]                
  00f7  a36f6f           mov word ptr [0x6f6f], ax                
  00fa  b8ff00           mov ax, 0xff                             
  00fd  a37b6f           mov word ptr [0x6f7b], ax                
  0100  a3796f           mov word ptr [0x6f79], ax                
  0103  90               nop                                      
  0104  0e               push cs                                  
  0105  e8c30a           call 0xbcb                               
  0108  a3716f           mov word ptr [0x6f71], ax                
  010b  3dff00           cmp ax, 0xff                             
  010e  7505             jne 0x115                                
  0110  33c0             xor ax, ax                               
  0112  e95e01           jmp 0x273                                
  0115  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  011a  ff36716f         push word ptr [0x6f71]                   
  011e  90               nop                                      
  011f  0e               push cs                                  
  0120  e80a0f           call 0x102d                              
  0123  59               pop cx                                   
  0124  ff36716f         push word ptr [0x6f71]                   
  0128  90               nop                                      
  0129  0e               push cs                                  
  012a  e86e03           call 0x49b                               
  012d  59               pop cx                                   
  012e  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0133  c70600370100     mov word ptr [0x3700], 1                 
  0139  eb5a             jmp 0x195                                
  013b  ff36716f         push word ptr [0x6f71]                   
  013f  90               nop                                      
  0140  0e               push cs                                  
  0141  e8540b           call 0xc98                               
  0144  59               pop cx                                   
  0145  a3736f           mov word ptr [0x6f73], ax                
  0148  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  014d  16               push ss                                  
  014e  8d46f0           lea ax, [bp - 0x10]                      
  0151  50               push ax                                  
  0152  666aff           push -1                                  
  0155  9a0300b511       lcall 0x11b5, 3                          -> 11b5:0003
  015a  83c408           add sp, 8                                
  015d  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0160  83fb07           cmp bx, 7                                
  0163  7720             ja 0x185                                 
  0165  d1e3             shl bx, 1                                
  0167  2effa78502       jmp word ptr cs:[bx + 0x285]             
res_1372_016c:  ; case
  016c  eb17             jmp 0x185                                
res_1372_016e:  ; case
  016e  c7066f6f0100     mov word ptr [0x6f6f], 1                 
  0174  eb0f             jmp 0x185                                
res_1372_0176:  ; case
  0176  8b46f2           mov ax, word ptr [bp - 0xe]              
  0179  25ffff           and ax, 0xffff                           
  017c  50               push ax                                  
  017d  90               nop                                      
  017e  0e               push cs                                  
  017f  e81301           call 0x295                               
  0182  59               pop cx                                   
  0183  eb00             jmp 0x185                                
res_1372_0185:  ; case
  0185  ff36736f         push word ptr [0x6f73]                   
  0189  ff36716f         push word ptr [0x6f71]                   
  018d  90               nop                                      
  018e  0e               push cs                                  
  018f  e84609           call 0xad8                               
  0192  83c404           add sp, 4                                
  0195  833e6f6f02       cmp word ptr [0x6f6f], 2                 
  019a  749f             je 0x13b                                 
  019c  eb35             jmp 0x1d3                                
  019e  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  01a3  16               push ss                                  
  01a4  8d46f0           lea ax, [bp - 0x10]                      
  01a7  50               push ax                                  
  01a8  666aff           push -1                                  
  01ab  9a0300b511       lcall 0x11b5, 3                          -> 11b5:0003
  01b0  83c408           add sp, 8                                
  01b3  8b5ef0           mov bx, word ptr [bp - 0x10]             
  01b6  83fb07           cmp bx, 7                                
  01b9  7713             ja 0x1ce                                 
  01bb  d1e3             shl bx, 1                                
  01bd  2effa77502       jmp word ptr cs:[bx + 0x275]             
res_1372_01c2:  ; case
  01c2  eb0a             jmp 0x1ce                                
res_1372_01c4:  ; case
  01c4  eb08             jmp 0x1ce                                
res_1372_01c6:  ; case
  01c6  c7066f6f0300     mov word ptr [0x6f6f], 3                 
  01cc  eb00             jmp 0x1ce                                
res_1372_01ce:  ; case
  01ce  90               nop                                      
  01cf  0e               push cs                                  
  01d0  e85502           call 0x428                               
  01d3  833e6f6f01       cmp word ptr [0x6f6f], 1                 
  01d8  74c4             je 0x19e                                 
  01da  c70600370000     mov word ptr [0x3700], 0                 
  01e0  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01e5  68ff00           push 0xff                                
  01e8  90               nop                                      
  01e9  0e               push cs                                  
  01ea  e8400e           call 0x102d                              
  01ed  59               pop cx                                   
  01ee  ff36716f         push word ptr [0x6f71]                   
  01f2  90               nop                                      
  01f3  0e               push cs                                  
  01f4  e80208           call 0x9f9                               
  01f7  59               pop cx                                   
  01f8  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  01fd  833e6f6f04       cmp word ptr [0x6f6f], 4                 
  0202  7503             jne 0x207                                
  0204  e909ff           jmp 0x110                                
  0207  813e716fff00     cmp word ptr [0x6f71], 0xff              
  020d  7461             je 0x270                                 
  020f  813e736fff00     cmp word ptr [0x6f73], 0xff              
  0215  7459             je 0x270                                 
  0217  c41e286f         les bx, ptr [0x6f28]                     
  021b  268b570a         mov dx, word ptr es:[bx + 0xa]           
  021f  eb48             jmp 0x269                                
  0221  c41e286f         les bx, ptr [0x6f28]                     
  0225  26c45f04         les bx, ptr es:[bx + 4]                  
  0229  8bc2             mov ax, dx                               
  022b  c1e003           shl ax, 3                                
  022e  03d8             add bx, ax                               
  0230  268b4702         mov ax, word ptr es:[bx + 2]             
  0234  3b06716f         cmp ax, word ptr [0x6f71]                
  0238  752f             jne 0x269                                
  023a  c41e286f         les bx, ptr [0x6f28]                     
  023e  26c45f04         les bx, ptr es:[bx + 4]                  
  0242  8bc2             mov ax, dx                               
  0244  c1e003           shl ax, 3                                
  0247  03d8             add bx, ax                               
  0249  268b4704         mov ax, word ptr es:[bx + 4]             
  024d  3b06736f         cmp ax, word ptr [0x6f73]                
  0251  7516             jne 0x269                                
  0253  c41e286f         les bx, ptr [0x6f28]                     
  0257  26c45f04         les bx, ptr es:[bx + 4]                  
  025b  8bc2             mov ax, dx                               
  025d  c1e003           shl ax, 3                                
  0260  03d8             add bx, ax                               
  0262  268b4706         mov ax, word ptr es:[bx + 6]             
  0266  e9a9fe           jmp 0x112                                
  0269  8bc2             mov ax, dx                               
  026b  4a               dec dx                                   
  026c  0bc0             or ax, ax                                
  026e  75b1             jne 0x221                                
  0270  e99dfe           jmp 0x110                                
  0273  c9               leave                                    
  0274  cb               retf                                     
  0275  c201c401c601c401 dw 01c2,01c4,01c6,01c4,01c6,01ce,01ce,01c2,016c,016e,016e,016e,016e,0185,0185,0176,02c8 jump table
  0297  0000             add byte ptr [bx + si], al               
  0299  56               push si                                  
  029a  8b4606           mov ax, word ptr [bp + 6]                
  029d  8946fe           mov word ptr [bp - 2], ax                
  02a0  b90600           mov cx, 6                                
  02a3  bb1004           mov bx, 0x410                             ; "this signpost!"
  02a6  2e8b07           mov ax, word ptr cs:[bx]                 
  02a9  3b46fe           cmp ax, word ptr [bp - 2]                
  02ac  7408             je 0x2b6                                 
  02ae  83c302           add bx, 2                                
  02b1  e2f3             loop 0x2a6                               
  02b3  e95701           jmp 0x40d                                
  02b6  2eff670c         jmp word ptr cs:[bx + 0xc]               
  02ba  c7066f6f0400     mov word ptr [0x6f6f], 4                 
  02c0  e94a01           jmp 0x40d                                
  02c3  c7066f6f03       db c7066f6f03                            resync
res_1372_02c8:  ; case
  02c8  00a1716f         add byte ptr [bx + di + 0x6f71], ah      
  02cc  a3756f           mov word ptr [0x6f75], ax                
  02cf  a1736f           mov ax, word ptr [0x6f73]                
  02d2  a3776f           mov word ptr [0x6f77], ax                
  02d5  e93501           jmp 0x40d                                
  02d8  c41e286f         les bx, ptr [0x6f28]                     
  02dc  268b7708         mov si, word ptr es:[bx + 8]             
  02e0  eb1a             jmp 0x2fc                                
  02e2  c41e286f         les bx, ptr [0x6f28]                     
  02e6  26c41f           les bx, ptr es:[bx]                      
  02e9  8bc6             mov ax, si                               
  02eb  6bc02e           imul ax, ax, 0x2e                        
  02ee  03d8             add bx, ax                               
  02f0  268b4708         mov ax, word ptr es:[bx + 8]             
  02f4  3b06716f         cmp ax, word ptr [0x6f71]                
  02f8  7502             jne 0x2fc                                
  02fa  eb07             jmp 0x303                                
  02fc  8bc6             mov ax, si                               
  02fe  4e               dec si                                   
  02ff  0bc0             or ax, ax                                
  0301  75df             jne 0x2e2                                
  0303  c41e286f         les bx, ptr [0x6f28]                     
  0307  8bc6             mov ax, si                               
  0309  40               inc ax                                   
  030a  26394708         cmp word ptr es:[bx + 8], ax             
  030e  7e28             jle 0x338                                
  0310  8bc6             mov ax, si                               
  0312  40               inc ax                                   
  0313  50               push ax                                  
  0314  90               nop                                      
  0315  0e               push cs                                  
  0316  e83709           call 0xc50                               
  0319  59               pop cx                                   
  031a  a3736f           mov word ptr [0x6f73], ax                
  031d  c41e286f         les bx, ptr [0x6f28]                     
  0321  26c41f           les bx, ptr es:[bx]                      
  0324  8bc6             mov ax, si                               
  0326  40               inc ax                                   
  0327  6bc02e           imul ax, ax, 0x2e                        
  032a  03d8             add bx, ax                               
  032c  26ff7708         push word ptr es:[bx + 8]                
  0330  90               nop                                      
  0331  0e               push cs                                  
  0332  e82a01           call 0x45f                               
  0335  59               pop cx                                   
  0336  eb05             jmp 0x33d                                
  0338  90               nop                                      
  0339  0e               push cs                                  
  033a  e8ac10           call 0x13e9                              
  033d  e9cd00           jmp 0x40d                                
  0340  c41e286f         les bx, ptr [0x6f28]                     
  0344  268b7708         mov si, word ptr es:[bx + 8]             
  0348  eb1a             jmp 0x364                                
  034a  c41e286f         les bx, ptr [0x6f28]                     
  034e  26c41f           les bx, ptr es:[bx]                      
  0351  8bc6             mov ax, si                               
  0353  6bc02e           imul ax, ax, 0x2e                        
  0356  03d8             add bx, ax                               
  0358  268b4708         mov ax, word ptr es:[bx + 8]             
  035c  3b06716f         cmp ax, word ptr [0x6f71]                
  0360  7502             jne 0x364                                
  0362  eb07             jmp 0x36b                                
  0364  8bc6             mov ax, si                               
  0366  4e               dec si                                   
  0367  0bc0             or ax, ax                                
  0369  75df             jne 0x34a                                
  036b  0bf6             or si, si                                
  036d  7428             je 0x397                                 
  036f  8bc6             mov ax, si                               
  0371  48               dec ax                                   
  0372  50               push ax                                  
  0373  90               nop                                      
  0374  0e               push cs                                  
  0375  e8d808           call 0xc50                               
  0378  59               pop cx                                   
  0379  a3736f           mov word ptr [0x6f73], ax                
  037c  c41e286f         les bx, ptr [0x6f28]                     
  0380  26c41f           les bx, ptr es:[bx]                      
  0383  8bc6             mov ax, si                               
  0385  48               dec ax                                   
  0386  6bc02e           imul ax, ax, 0x2e                        
  0389  03d8             add bx, ax                               
  038b  26ff7708         push word ptr es:[bx + 8]                
  038f  90               nop                                      
  0390  0e               push cs                                  
  0391  e8cb00           call 0x45f                               
  0394  59               pop cx                                   
  0395  eb05             jmp 0x39c                                
  0397  90               nop                                      
  0398  0e               push cs                                  
  0399  e84d10           call 0x13e9                              
  039c  eb6f             jmp 0x40d                                
  039e  33d2             xor dx, dx                               
  03a0  813e736fff00     cmp word ptr [0x6f73], 0xff              
  03a6  7423             je 0x3cb                                 
  03a8  a1736f           mov ax, word ptr [0x6f73]                
  03ab  40               inc ax                                   
  03ac  8bf0             mov si, ax                               
  03ae  eb16             jmp 0x3c6                                
  03b0  8bde             mov bx, si                               
  03b2  d1e3             shl bx, 1                                
  03b4  81bf7d6f1027     cmp word ptr [bx + 0x6f7d], 0x2710       
  03ba  7409             je 0x3c5                                 
  03bc  8936736f         mov word ptr [0x6f73], si                
  03c0  ba0100           mov dx, 1                                
  03c3  eb06             jmp 0x3cb                                
  03c5  46               inc si                                   
  03c6  83fe1f           cmp si, 0x1f                             
  03c9  7ce5             jl 0x3b0                                 
  03cb  0bd2             or dx, dx                                
  03cd  7505             jne 0x3d4                                
  03cf  90               nop                                      
  03d0  0e               push cs                                  
  03d1  e81510           call 0x13e9                              
  03d4  eb37             jmp 0x40d                                
  03d6  33d2             xor dx, dx                               
  03d8  813e736fff00     cmp word ptr [0x6f73], 0xff              
  03de  7422             je 0x402                                 
  03e0  8b36736f         mov si, word ptr [0x6f73]                
  03e4  eb15             jmp 0x3fb                                
  03e6  8bde             mov bx, si                               
  03e8  d1e3             shl bx, 1                                
  03ea  81bf7d6f1027     cmp word ptr [bx + 0x6f7d], 0x2710       
  03f0  7409             je 0x3fb                                 
  03f2  8936736f         mov word ptr [0x6f73], si                
  03f6  ba0100           mov dx, 1                                
  03f9  eb07             jmp 0x402                                
  03fb  8bc6             mov ax, si                               
  03fd  4e               dec si                                   
  03fe  0bc0             or ax, ax                                
  0400  75e4             jne 0x3e6                                
  0402  0bd2             or dx, dx                                
  0404  7505             jne 0x40b                                
  0406  90               nop                                      
  0407  0e               push cs                                  
  0408  e8de0f           call 0x13e9                              
  040b  eb00             jmp 0x40d                                
  040d  5e               pop si                                   
  040e  c9               leave                                    
  040f  cb               retf                                     
  0410  0d001b           or ax, 0x1b00                            
  0413  004801           add byte ptr [bx + si + 1], cl           
  0416  4b               dec bx                                   
  0417  014d01           add word ptr [di + 1], cx                
  041a  50               push ax                                  
  041b  01c3             add bx, ax                               
  041d  02ba02d6         add bh, byte ptr [bp + si - 0x29fe]      
  0421  034003           add ax, word ptr [bx + si + 3]           
  0424  d802             fadd dword ptr [bp + si]                 
  0426  9e               sahf                                     
  0427  03               db 03                                    resync

res_1372_0428:  ; ENTRY
  0428  90               nop                                      
  0429  0e               push cs                                  
  042a  e89e07           call 0xbcb                               
  042d  8bd0             mov dx, ax                               
  042f  3dff00           cmp ax, 0xff                             
  0432  740d             je 0x441                                 
  0434  3b16716f         cmp dx, word ptr [0x6f71]                
  0438  7407             je 0x441                                 
  043a  52               push dx                                  
  043b  90               nop                                      
  043c  0e               push cs                                  
  043d  e81f00           call 0x45f                               
  0440  59               pop cx                                   
  0441  ff36716f         push word ptr [0x6f71]                   
  0445  90               nop                                      
  0446  0e               push cs                                  
  0447  e81306           call 0xa5d                               
  044a  59               pop cx                                   
  044b  a3736f           mov word ptr [0x6f73], ax                
  044e  ff36736f         push word ptr [0x6f73]                   
  0452  ff36716f         push word ptr [0x6f71]                   
  0456  90               nop                                      
  0457  0e               push cs                                  
  0458  e87d06           call 0xad8                               
  045b  83c404           add sp, 4                                
  045e  cb               retf                                     

res_1372_045f:  ; ENTRY
  045f  55               push bp                                  
  0460  8bec             mov bp, sp                               
  0462  b8ff00           mov ax, 0xff                             
  0465  a37b6f           mov word ptr [0x6f7b], ax                
  0468  a3796f           mov word ptr [0x6f79], ax                
  046b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0470  ff36716f         push word ptr [0x6f71]                   
  0474  90               nop                                      
  0475  0e               push cs                                  
  0476  e88005           call 0x9f9                               
  0479  59               pop cx                                   
  047a  8b4606           mov ax, word ptr [bp + 6]                
  047d  a3716f           mov word ptr [0x6f71], ax                
  0480  ff36716f         push word ptr [0x6f71]                   
  0484  90               nop                                      
  0485  0e               push cs                                  
  0486  e8a40b           call 0x102d                              
  0489  59               pop cx                                   
  048a  ff36716f         push word ptr [0x6f71]                   
  048e  90               nop                                      
  048f  0e               push cs                                  
  0490  e80800           call 0x49b                               
  0493  59               pop cx                                   
  0494  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0499  5d               pop bp                                   
  049a  cb               retf                                     

res_1372_049b:  ; ENTRY
  049b  c8140000         enter 0x14, 0                            
  049f  56               push si                                  
  04a0  57               push di                                  
  04a1  33f6             xor si, si                               
  04a3  c746fe0100       mov word ptr [bp - 2], 1                 
  04a8  c746f40200       mov word ptr [bp - 0xc], 2               
  04ad  c746f20000       mov word ptr [bp - 0xe], 0               
  04b2  c41e286f         les bx, ptr [0x6f28]                     
  04b6  268b4702         mov ax, word ptr es:[bx + 2]             
  04ba  268b17           mov dx, word ptr es:[bx]                 
  04bd  8b5e06           mov bx, word ptr [bp + 6]                
  04c0  6bdb2e           imul bx, bx, 0x2e                        
  04c3  03d3             add dx, bx                               
  04c5  8946f0           mov word ptr [bp - 0x10], ax             
  04c8  8956ee           mov word ptr [bp - 0x12], dx             
  04cb  c746ec0c00       mov word ptr [bp - 0x14], 0xc            
  04d0  ba1f00           mov dx, 0x1f                             
  04d3  eb0a             jmp 0x4df                                
  04d5  8bda             mov bx, dx                               
  04d7  d1e3             shl bx, 1                                
  04d9  c7877d6f1027     mov word ptr [bx + 0x6f7d], 0x2710       
  04df  8bc2             mov ax, dx                               
  04e1  4a               dec dx                                   
  04e2  0bc0             or ax, ax                                
  04e4  75ef             jne 0x4d5                                
  04e6  6a00             push 0                                   
  04e8  ff1e246f         lcall [0x6f24]                           
  04ec  59               pop cx                                   
  04ed  8b4606           mov ax, word ptr [bp + 6]                
  04f0  a3716f           mov word ptr [0x6f71], ax                
  04f3  c45eee           les bx, ptr [bp - 0x12]                  
  04f6  33c0             xor ax, ax                               
  04f8  26894728         mov word ptr es:[bx + 0x28], ax          
  04fc  c45eee           les bx, ptr [bp - 0x12]                  
  04ff  26894724         mov word ptr es:[bx + 0x24], ax          
  0503  c45eee           les bx, ptr [bp - 0x12]                  
  0506  26c747260200     mov word ptr es:[bx + 0x26], 2           
  050c  e95701           jmp 0x666                                
  050f  c45eee           les bx, ptr [bp - 0x12]                  
  0512  26c41f           les bx, ptr es:[bx]                      
  0515  8bc6             mov ax, si                               
  0517  c1e002           shl ax, 2                                
  051a  03d8             add bx, ax                               
  051c  26c41f           les bx, ptr es:[bx]                      
  051f  26803f25         cmp byte ptr es:[bx], 0x25               
  0523  7509             jne 0x52e                                
  0525  46               inc si                                   
  0526  c746fc0000       mov word ptr [bp - 4], 0                 
  052b  e92b01           jmp 0x659                                
  052e  c45eee           les bx, ptr [bp - 0x12]                  
  0531  66268b4720       mov eax, dword ptr es:[bx + 0x20]        
  0536  6683c003         add eax, 3                               
  053a  6683f800         cmp eax, 0                               
  053e  7405             je 0x545                                 
  0540  8b46ec           mov ax, word ptr [bp - 0x14]             
  0543  eb02             jmp 0x547                                
  0545  33c0             xor ax, ax                               
  0547  8bf8             mov di, ax                               
  0549  c45eee           les bx, ptr [bp - 0x12]                  
  054c  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0551  8a4efe           mov cl, byte ptr [bp - 2]                
  0554  66d3e8           shr eax, cl                              
  0557  66a901000000     test eax, 1                              
  055d  740a             je 0x569                                 
  055f  c45eee           les bx, ptr [bp - 0x12]                  
  0562  268b4726         mov ax, word ptr es:[bx + 0x26]          
  0566  48               dec ax                                   
  0567  eb03             jmp 0x56c                                
  0569  b81027           mov ax, 0x2710                           
  056c  8b5efe           mov bx, word ptr [bp - 2]                
  056f  d1e3             shl bx, 1                                
  0571  89877d6f         mov word ptr [bx + 0x6f7d], ax           
  0575  ff46fe           inc word ptr [bp - 2]                    
  0578  16               push ss                                  
  0579  8d46f8           lea ax, [bp - 8]                         
  057c  50               push ax                                  
  057d  16               push ss                                  
  057e  8d46fa           lea ax, [bp - 6]                         
  0581  50               push ax                                  
  0582  c45eee           les bx, ptr [bp - 0x12]                  
  0585  26c41f           les bx, ptr es:[bx]                      
  0588  8bc6             mov ax, si                               
  058a  46               inc si                                   
  058b  c1e002           shl ax, 2                                
  058e  03d8             add bx, ax                               
  0590  26ff7702         push word ptr es:[bx + 2]                
  0594  26ff37           push word ptr es:[bx]                    
  0597  9ab80ae211       lcall 0x11e2, 0xab8                      -> 11e2:0ab8
  059c  83c40c           add sp, 0xc                              
  059f  037efa           add di, word ptr [bp - 6]                
  05a2  8b46f8           mov ax, word ptr [bp - 8]                
  05a5  8946fc           mov word ptr [bp - 4], ax                
  05a8  8946f6           mov word ptr [bp - 0xa], ax              
  05ab  c45eee           les bx, ptr [bp - 0x12]                  
  05ae  26c41f           les bx, ptr es:[bx]                      
  05b1  8bc6             mov ax, si                               
  05b3  c1e002           shl ax, 2                                
  05b6  03d8             add bx, ax                               
  05b8  26c41f           les bx, ptr es:[bx]                      
  05bb  26803f26         cmp byte ptr es:[bx], 0x26               
  05bf  7403             je 0x5c4                                 
  05c1  e98200           jmp 0x646                                
  05c4  8bc7             mov ax, di                               
  05c6  050500           add ax, 5                                
  05c9  c45eee           les bx, ptr [bp - 0x12]                  
  05cc  263b4728         cmp ax, word ptr es:[bx + 0x28]          
  05d0  760c             jbe 0x5de                                
  05d2  8bc7             mov ax, di                               
  05d4  050500           add ax, 5                                
  05d7  c45eee           les bx, ptr [bp - 0x12]                  
  05da  26894728         mov word ptr es:[bx + 0x28], ax          
  05de  46               inc si                                   
  05df  83c705           add di, 5                                
  05e2  c45eee           les bx, ptr [bp - 0x12]                  
  05e5  26397f28         cmp word ptr es:[bx + 0x28], di          
  05e9  7309             jae 0x5f4                                
  05eb  c45eee           les bx, ptr [bp - 0x12]                  
  05ee  26897f28         mov word ptr es:[bx + 0x28], di          
  05f2  eb07             jmp 0x5fb                                
  05f4  c45eee           les bx, ptr [bp - 0x12]                  
  05f7  268b7f28         mov di, word ptr es:[bx + 0x28]          
  05fb  16               push ss                                  
  05fc  8d46f8           lea ax, [bp - 8]                         
  05ff  50               push ax                                  
  0600  16               push ss                                  
  0601  8d46fa           lea ax, [bp - 6]                         
  0604  50               push ax                                  
  0605  c45eee           les bx, ptr [bp - 0x12]                  
  0608  26c41f           les bx, ptr es:[bx]                      
  060b  8bc6             mov ax, si                               
  060d  46               inc si                                   
  060e  c1e002           shl ax, 2                                
  0611  03d8             add bx, ax                               
  0613  26ff7702         push word ptr es:[bx + 2]                
  0617  26ff37           push word ptr es:[bx]                    
  061a  9ab80ae211       lcall 0x11e2, 0xab8                      -> 11e2:0ab8
  061f  83c40c           add sp, 0xc                              
  0622  8b46f2           mov ax, word ptr [bp - 0xe]              
  0625  3b46fa           cmp ax, word ptr [bp - 6]                
  0628  7e05             jle 0x62f                                
  062a  8b46f2           mov ax, word ptr [bp - 0xe]              
  062d  eb03             jmp 0x632                                
  062f  8b46fa           mov ax, word ptr [bp - 6]                
  0632  8946f2           mov word ptr [bp - 0xe], ax              
  0635  037ef2           add di, word ptr [bp - 0xe]              
  0638  8b46f8           mov ax, word ptr [bp - 8]                
  063b  3b46fc           cmp ax, word ptr [bp - 4]                
  063e  7e06             jle 0x646                                
  0640  8b46f8           mov ax, word ptr [bp - 8]                
  0643  8946fc           mov word ptr [bp - 4], ax                
  0646  83c705           add di, 5                                
  0649  c45eee           les bx, ptr [bp - 0x12]                  
  064c  26397f24         cmp word ptr es:[bx + 0x24], di          
  0650  7307             jae 0x659                                
  0652  c45eee           les bx, ptr [bp - 0x12]                  
  0655  26897f24         mov word ptr es:[bx + 0x24], di          
  0659  8b46fc           mov ax, word ptr [bp - 4]                
  065c  0346f4           add ax, word ptr [bp - 0xc]              
  065f  c45eee           les bx, ptr [bp - 0x12]                  
  0662  26014726         add word ptr es:[bx + 0x26], ax          
  0666  c45eee           les bx, ptr [bp - 0x12]                  
  0669  26c41f           les bx, ptr es:[bx]                      
  066c  8bc6             mov ax, si                               
  066e  c1e002           shl ax, 2                                
  0671  03d8             add bx, ax                               
  0673  268b07           mov ax, word ptr es:[bx]                 
  0676  260b4702         or ax, word ptr es:[bx + 2]              
  067a  7403             je 0x67f                                 
  067c  e990fe           jmp 0x50f                                
  067f  c45eee           les bx, ptr [bp - 0x12]                  
  0682  26ff4726         inc word ptr es:[bx + 0x26]              
  0686  ff7606           push word ptr [bp + 6]                   
  0689  90               nop                                      
  068a  0e               push cs                                  
  068b  e87501           call 0x803                               
  068e  59               pop cx                                   
  068f  0bc0             or ax, ax                                
  0691  7503             jne 0x696                                
  0693  e96901           jmp 0x7ff                                
  0696  c746fc0200       mov word ptr [bp - 4], 2                 
  069b  33f6             xor si, si                               
  069d  c746fe0100       mov word ptr [bp - 2], 1                 
  06a2  e94101           jmp 0x7e6                                
  06a5  c45eee           les bx, ptr [bp - 0x12]                  
  06a8  26c41f           les bx, ptr es:[bx]                      
  06ab  8bc6             mov ax, si                               
  06ad  c1e002           shl ax, 2                                
  06b0  03d8             add bx, ax                               
  06b2  26c41f           les bx, ptr es:[bx]                      
  06b5  26803f25         cmp byte ptr es:[bx], 0x25               
  06b9  7536             jne 0x6f1                                
  06bb  46               inc si                                   
  06bc  6a00             push 0                                   
  06be  c45eee           les bx, ptr [bp - 0x12]                  
  06c1  268b4724         mov ax, word ptr es:[bx + 0x24]          
  06c5  2d0200           sub ax, 2                                
  06c8  50               push ax                                  
  06c9  c45eee           les bx, ptr [bp - 0x12]                  
  06cc  268b4718         mov ax, word ptr es:[bx + 0x18]          
  06d0  0346fc           add ax, word ptr [bp - 4]                
  06d3  48               dec ax                                   
  06d4  50               push ax                                  
  06d5  c45eee           les bx, ptr [bp - 0x12]                  
  06d8  268b4716         mov ax, word ptr es:[bx + 0x16]          
  06dc  40               inc ax                                   
  06dd  50               push ax                                  
  06de  1e               push ds                                  
  06df  682a34           push 0x342a                              
  06e2  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  06e7  83c40c           add sp, 0xc                              
  06ea  8346fc02         add word ptr [bp - 4], 2                 
  06ee  e9f500           jmp 0x7e6                                
  06f1  bf0300           mov di, 3                                
  06f4  c45eee           les bx, ptr [bp - 0x12]                  
  06f7  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  06fc  8a4efe           mov cl, byte ptr [bp - 2]                
  06ff  66d3e8           shr eax, cl                              
  0702  66a901000000     test eax, 1                              
  0708  7404             je 0x70e                                 
  070a  6a01             push 1                                   
  070c  eb02             jmp 0x710                                
  070e  6a02             push 2                                   
  0710  ff1e246f         lcall [0x6f24]                           
  0714  59               pop cx                                   
  0715  c45eee           les bx, ptr [bp - 0x12]                  
  0718  6626837f2000     cmp dword ptr es:[bx + 0x20], 0          
  071e  743a             je 0x75a                                 
  0720  c45eee           les bx, ptr [bp - 0x12]                  
  0723  66268b4720       mov eax, dword ptr es:[bx + 0x20]        
  0728  8a4efe           mov cl, byte ptr [bp - 2]                
  072b  66d3e8           shr eax, cl                              
  072e  66a901000000     test eax, 1                              
  0734  7421             je 0x757                                 
  0736  1e               push ds                                  
  0737  680237           push 0x3702                              
  073a  c45eee           les bx, ptr [bp - 0x12]                  
  073d  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0741  0346fc           add ax, word ptr [bp - 4]                
  0744  50               push ax                                  
  0745  c45eee           les bx, ptr [bp - 0x12]                  
  0748  268b4716         mov ax, word ptr es:[bx + 0x16]          
  074c  03c7             add ax, di                               
  074e  50               push ax                                  
  074f  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  0754  83c408           add sp, 8                                
  0757  037eec           add di, word ptr [bp - 0x14]             
  075a  ff46fe           inc word ptr [bp - 2]                    
  075d  c45eee           les bx, ptr [bp - 0x12]                  
  0760  26c41f           les bx, ptr es:[bx]                      
  0763  8bc6             mov ax, si                               
  0765  46               inc si                                   
  0766  c1e002           shl ax, 2                                
  0769  03d8             add bx, ax                               
  076b  26ff7702         push word ptr es:[bx + 2]                
  076f  26ff37           push word ptr es:[bx]                    
  0772  c45eee           les bx, ptr [bp - 0x12]                  
  0775  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0779  0346fc           add ax, word ptr [bp - 4]                
  077c  50               push ax                                  
  077d  c45eee           les bx, ptr [bp - 0x12]                  
  0780  268b4716         mov ax, word ptr es:[bx + 0x16]          
  0784  03c7             add ax, di                               
  0786  50               push ax                                  
  0787  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  078c  83c408           add sp, 8                                
  078f  c45eee           les bx, ptr [bp - 0x12]                  
  0792  26c41f           les bx, ptr es:[bx]                      
  0795  8bc6             mov ax, si                               
  0797  c1e002           shl ax, 2                                
  079a  03d8             add bx, ax                               
  079c  26c41f           les bx, ptr es:[bx]                      
  079f  26803f26         cmp byte ptr es:[bx], 0x26               
  07a3  7538             jne 0x7dd                                
  07a5  46               inc si                                   
  07a6  c45eee           les bx, ptr [bp - 0x12]                  
  07a9  26c41f           les bx, ptr es:[bx]                      
  07ac  8bc6             mov ax, si                               
  07ae  46               inc si                                   
  07af  c1e002           shl ax, 2                                
  07b2  03d8             add bx, ax                               
  07b4  26ff7702         push word ptr es:[bx + 2]                
  07b8  26ff37           push word ptr es:[bx]                    
  07bb  c45eee           les bx, ptr [bp - 0x12]                  
  07be  268b4718         mov ax, word ptr es:[bx + 0x18]          
  07c2  0346fc           add ax, word ptr [bp - 4]                
  07c5  50               push ax                                  
  07c6  c45eee           les bx, ptr [bp - 0x12]                  
  07c9  268b4716         mov ax, word ptr es:[bx + 0x16]          
  07cd  c45eee           les bx, ptr [bp - 0x12]                  
  07d0  26034728         add ax, word ptr es:[bx + 0x28]          
  07d4  50               push ax                                  
  07d5  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  07da  83c408           add sp, 8                                
  07dd  8b46f6           mov ax, word ptr [bp - 0xa]              
  07e0  050200           add ax, 2                                
  07e3  0146fc           add word ptr [bp - 4], ax                
  07e6  c45eee           les bx, ptr [bp - 0x12]                  
  07e9  26c41f           les bx, ptr es:[bx]                      
  07ec  8bc6             mov ax, si                               
  07ee  c1e002           shl ax, 2                                
  07f1  03d8             add bx, ax                               
  07f3  268b07           mov ax, word ptr es:[bx]                 
  07f6  260b4702         or ax, word ptr es:[bx + 2]              
  07fa  7403             je 0x7ff                                 
  07fc  e9a6fe           jmp 0x6a5                                
  07ff  5f               pop di                                   
  0800  5e               pop si                                   
  0801  c9               leave                                    
  0802  cb               retf                                     

res_1372_0803:  ; ENTRY
  0803  c80c0000         enter 0xc, 0                             
  0807  56               push si                                  
  0808  c41e286f         les bx, ptr [0x6f28]                     
  080c  268b4702         mov ax, word ptr es:[bx + 2]             
  0810  268b17           mov dx, word ptr es:[bx]                 
  0813  8b5e06           mov bx, word ptr [bp + 6]                
  0816  6bdb2e           imul bx, bx, 0x2e                        
  0819  03d3             add dx, bx                               
  081b  8946f6           mov word ptr [bp - 0xa], ax              
  081e  8956f4           mov word ptr [bp - 0xc], dx              
  0821  c45ef4           les bx, ptr [bp - 0xc]                   
  0824  26ff7726         push word ptr es:[bx + 0x26]             
  0828  c45ef4           les bx, ptr [bp - 0xc]                   
  082b  26ff7724         push word ptr es:[bx + 0x24]             
  082f  1e               push ds                                  
  0830  682c6f           push 0x6f2c                              
  0833  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0838  83c408           add sp, 8                                
  083b  0bc0             or ax, ax                                
  083d  7505             jne 0x844                                
  083f  33c0             xor ax, ax                               
  0841  e9b201           jmp 0x9f6                                
  0844  66833e366f00     cmp dword ptr [0x6f36], 0                
  084a  7438             je 0x884                                 
  084c  f706616f0a00     test word ptr [0x6f61], 0xa              
  0852  7530             jne 0x884                                
  0854  33f6             xor si, si                               
  0856  eb23             jmp 0x87b                                
  0858  8bde             mov bx, si                               
  085a  c1e302           shl bx, 2                                
  085d  ffb7386f         push word ptr [bx + 0x6f38]              
  0861  ffb7366f         push word ptr [bx + 0x6f36]              
  0865  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  086a  83c404           add sp, 4                                
  086d  8bde             mov bx, si                               
  086f  c1e302           shl bx, 2                                
  0872  8997486f         mov word ptr [bx + 0x6f48], dx           
  0876  8987466f         mov word ptr [bx + 0x6f46], ax           
  087a  46               inc si                                   
  087b  a0606f           mov al, byte ptr [0x6f60]                
  087e  b400             mov ah, 0                                
  0880  3bc6             cmp ax, si                               
  0882  7fd4             jg 0x858                                 
  0884  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0889  6a00             push 0                                   
  088b  6a00             push 0                                   
  088d  1e               push ds                                  
  088e  682c6f           push 0x6f2c                              
  0891  c45ef4           les bx, ptr [bp - 0xc]                   
  0894  26ff7726         push word ptr es:[bx + 0x26]             
  0898  c45ef4           les bx, ptr [bp - 0xc]                   
  089b  26ff7724         push word ptr es:[bx + 0x24]             
  089f  c45ef4           les bx, ptr [bp - 0xc]                   
  08a2  26ff7718         push word ptr es:[bx + 0x18]             
  08a6  c45ef4           les bx, ptr [bp - 0xc]                   
  08a9  26ff7716         push word ptr es:[bx + 0x16]             
  08ad  1e               push ds                                  
  08ae  682a34           push 0x342a                              
  08b1  ff1ed469         lcall [0x69d4]                           
  08b5  83c414           add sp, 0x14                             
  08b8  c45ef4           les bx, ptr [bp - 0xc]                   
  08bb  268b4726         mov ax, word ptr es:[bx + 0x26]          
  08bf  2d0200           sub ax, 2                                
  08c2  50               push ax                                  
  08c3  c45ef4           les bx, ptr [bp - 0xc]                   
  08c6  268b4724         mov ax, word ptr es:[bx + 0x24]          
  08ca  2d0300           sub ax, 3                                
  08cd  50               push ax                                  
  08ce  c45ef4           les bx, ptr [bp - 0xc]                   
  08d1  26ff7718         push word ptr es:[bx + 0x18]             
  08d5  c45ef4           les bx, ptr [bp - 0xc]                   
  08d8  268b4716         mov ax, word ptr es:[bx + 0x16]          
  08dc  40               inc ax                                   
  08dd  50               push ax                                  
  08de  16               push ss                                  
  08df  8d46f8           lea ax, [bp - 8]                         
  08e2  50               push ax                                  
  08e3  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  08e8  83c40c           add sp, 0xc                              
  08eb  6a0f             push 0xf                                 
  08ed  16               push ss                                  
  08ee  8d46f8           lea ax, [bp - 8]                         
  08f1  50               push ax                                  
  08f2  1e               push ds                                  
  08f3  682a34           push 0x342a                              
  08f6  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  08fb  83c40a           add sp, 0xa                              
  08fe  6a00             push 0                                   
  0900  c45ef4           les bx, ptr [bp - 0xc]                   
  0903  268b4724         mov ax, word ptr es:[bx + 0x24]          
  0907  2d0200           sub ax, 2                                
  090a  50               push ax                                  
  090b  c45ef4           les bx, ptr [bp - 0xc]                   
  090e  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0912  c45ef4           les bx, ptr [bp - 0xc]                   
  0915  26034726         add ax, word ptr es:[bx + 0x26]          
  0919  2d0200           sub ax, 2                                
  091c  50               push ax                                  
  091d  c45ef4           les bx, ptr [bp - 0xc]                   
  0920  26ff7716         push word ptr es:[bx + 0x16]             
  0924  1e               push ds                                  
  0925  682a34           push 0x342a                              
  0928  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  092d  83c40c           add sp, 0xc                              
  0930  6a00             push 0                                   
  0932  c45ef4           les bx, ptr [bp - 0xc]                   
  0935  268b4724         mov ax, word ptr es:[bx + 0x24]          
  0939  2d0200           sub ax, 2                                
  093c  50               push ax                                  
  093d  c45ef4           les bx, ptr [bp - 0xc]                   
  0940  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0944  c45ef4           les bx, ptr [bp - 0xc]                   
  0947  26034726         add ax, word ptr es:[bx + 0x26]          
  094b  48               dec ax                                   
  094c  50               push ax                                  
  094d  c45ef4           les bx, ptr [bp - 0xc]                   
  0950  268b4716         mov ax, word ptr es:[bx + 0x16]          
  0954  050200           add ax, 2                                
  0957  50               push ax                                  
  0958  1e               push ds                                  
  0959  682a34           push 0x342a                              
  095c  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0961  83c40c           add sp, 0xc                              
  0964  6a00             push 0                                   
  0966  c45ef4           les bx, ptr [bp - 0xc]                   
  0969  268b4726         mov ax, word ptr es:[bx + 0x26]          
  096d  2d0200           sub ax, 2                                
  0970  50               push ax                                  
  0971  c45ef4           les bx, ptr [bp - 0xc]                   
  0974  26ff7718         push word ptr es:[bx + 0x18]             
  0978  c45ef4           les bx, ptr [bp - 0xc]                   
  097b  26ff7716         push word ptr es:[bx + 0x16]             
  097f  1e               push ds                                  
  0980  682a34           push 0x342a                              
  0983  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0988  83c40c           add sp, 0xc                              
  098b  6a00             push 0                                   
  098d  c45ef4           les bx, ptr [bp - 0xc]                   
  0990  268b4726         mov ax, word ptr es:[bx + 0x26]          
  0994  48               dec ax                                   
  0995  50               push ax                                  
  0996  c45ef4           les bx, ptr [bp - 0xc]                   
  0999  26ff7718         push word ptr es:[bx + 0x18]             
  099d  c45ef4           les bx, ptr [bp - 0xc]                   
  09a0  268b4716         mov ax, word ptr es:[bx + 0x16]          
  09a4  c45ef4           les bx, ptr [bp - 0xc]                   
  09a7  26034724         add ax, word ptr es:[bx + 0x24]          
  09ab  2d0200           sub ax, 2                                
  09ae  50               push ax                                  
  09af  1e               push ds                                  
  09b0  682a34           push 0x342a                              
  09b3  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  09b8  83c40c           add sp, 0xc                              
  09bb  6a00             push 0                                   
  09bd  c45ef4           les bx, ptr [bp - 0xc]                   
  09c0  268b4726         mov ax, word ptr es:[bx + 0x26]          
  09c4  48               dec ax                                   
  09c5  50               push ax                                  
  09c6  c45ef4           les bx, ptr [bp - 0xc]                   
  09c9  268b4718         mov ax, word ptr es:[bx + 0x18]          
  09cd  40               inc ax                                   
  09ce  50               push ax                                  
  09cf  c45ef4           les bx, ptr [bp - 0xc]                   
  09d2  268b4716         mov ax, word ptr es:[bx + 0x16]          
  09d6  c45ef4           les bx, ptr [bp - 0xc]                   
  09d9  26034724         add ax, word ptr es:[bx + 0x24]          
  09dd  48               dec ax                                   
  09de  50               push ax                                  
  09df  1e               push ds                                  
  09e0  682a34           push 0x342a                              
  09e3  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  09e8  83c40c           add sp, 0xc                              
  09eb  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  09f0  b80100           mov ax, 1                                
  09f3  e94bfe           jmp 0x841                                
  09f6  5e               pop si                                   
  09f7  c9               leave                                    
  09f8  cb               retf                                     

res_1372_09f9:  ; ENTRY
  09f9  c8040000         enter 4, 0                               
  09fd  c41e286f         les bx, ptr [0x6f28]                     
  0a01  268b4702         mov ax, word ptr es:[bx + 2]             
  0a05  268b17           mov dx, word ptr es:[bx]                 
  0a08  8b5e06           mov bx, word ptr [bp + 6]                
  0a0b  6bdb2e           imul bx, bx, 0x2e                        
  0a0e  03d3             add dx, bx                               
  0a10  8946fe           mov word ptr [bp - 2], ax                
  0a13  8956fc           mov word ptr [bp - 4], dx                
  0a16  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0a1b  c45efc           les bx, ptr [bp - 4]                     
  0a1e  26ff7718         push word ptr es:[bx + 0x18]             
  0a22  c45efc           les bx, ptr [bp - 4]                     
  0a25  26ff7716         push word ptr es:[bx + 0x16]             
  0a29  1e               push ds                                  
  0a2a  682a34           push 0x342a                              
  0a2d  c45efc           les bx, ptr [bp - 4]                     
  0a30  26ff7726         push word ptr es:[bx + 0x26]             
  0a34  c45efc           les bx, ptr [bp - 4]                     
  0a37  26ff7724         push word ptr es:[bx + 0x24]             
  0a3b  6a00             push 0                                   
  0a3d  6a00             push 0                                   
  0a3f  1e               push ds                                  
  0a40  682c6f           push 0x6f2c                              
  0a43  ff1ed469         lcall [0x69d4]                           
  0a47  83c414           add sp, 0x14                             
  0a4a  1e               push ds                                  
  0a4b  682c6f           push 0x6f2c                              
  0a4e  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0a53  83c404           add sp, 4                                
  0a56  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a5b  c9               leave                                    
  0a5c  cb               retf                                     

res_1372_0a5d:  ; ENTRY
  0a5d  c80c0000         enter 0xc, 0                             
  0a61  56               push si                                  
  0a62  c41e286f         les bx, ptr [0x6f28]                     
  0a66  268b4702         mov ax, word ptr es:[bx + 2]             
  0a6a  268b17           mov dx, word ptr es:[bx]                 
  0a6d  8b5e06           mov bx, word ptr [bp + 6]                
  0a70  6bdb2e           imul bx, bx, 0x2e                        
  0a73  03d3             add dx, bx                               
  0a75  8946f6           mov word ptr [bp - 0xa], ax              
  0a78  8956f4           mov word ptr [bp - 0xc], dx              
  0a7b  be1f00           mov si, 0x1f                             
  0a7e  eb49             jmp 0xac9                                
  0a80  c45ef4           les bx, ptr [bp - 0xc]                   
  0a83  268b472c         mov ax, word ptr es:[bx + 0x2c]          
  0a87  40               inc ax                                   
  0a88  50               push ax                                  
  0a89  c45ef4           les bx, ptr [bp - 0xc]                   
  0a8c  26ff7724         push word ptr es:[bx + 0x24]             
  0a90  c45ef4           les bx, ptr [bp - 0xc]                   
  0a93  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0a97  8bde             mov bx, si                               
  0a99  d1e3             shl bx, 1                                
  0a9b  03877d6f         add ax, word ptr [bx + 0x6f7d]           
  0a9f  50               push ax                                  
  0aa0  c45ef4           les bx, ptr [bp - 0xc]                   
  0aa3  26ff7716         push word ptr es:[bx + 0x16]             
  0aa7  16               push ss                                  
  0aa8  8d46f8           lea ax, [bp - 8]                         
  0aab  50               push ax                                  
  0aac  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0ab1  83c40c           add sp, 0xc                              
  0ab4  16               push ss                                  
  0ab5  8d46f8           lea ax, [bp - 8]                         
  0ab8  50               push ax                                  
  0ab9  9ab108bf12       lcall 0x12bf, 0x8b1                      -> 12bf:08b1
  0abe  83c404           add sp, 4                                
  0ac1  0bc0             or ax, ax                                
  0ac3  7404             je 0xac9                                 
  0ac5  8bc6             mov ax, si                               
  0ac7  eb0c             jmp 0xad5                                
  0ac9  8bc6             mov ax, si                               
  0acb  4e               dec si                                   
  0acc  0bc0             or ax, ax                                
  0ace  75b0             jne 0xa80                                
  0ad0  b8ff00           mov ax, 0xff                             
  0ad3  ebf2             jmp 0xac7                                
  0ad5  5e               pop si                                   
  0ad6  c9               leave                                    
  0ad7  cb               retf                                     

res_1372_0ad8:  ; ENTRY
  0ad8  c80c0000         enter 0xc, 0                             
  0adc  56               push si                                  
  0add  8b7608           mov si, word ptr [bp + 8]                
  0ae0  c41e286f         les bx, ptr [0x6f28]                     
  0ae4  268b4702         mov ax, word ptr es:[bx + 2]             
  0ae8  268b17           mov dx, word ptr es:[bx]                 
  0aeb  8b5e06           mov bx, word ptr [bp + 6]                
  0aee  6bdb2e           imul bx, bx, 0x2e                        
  0af1  03d3             add dx, bx                               
  0af3  8946fe           mov word ptr [bp - 2], ax                
  0af6  8956fc           mov word ptr [bp - 4], dx                
  0af9  3b36796f         cmp si, word ptr [0x6f79]                
  0afd  740e             je 0xb0d                                 
  0aff  81feff00         cmp si, 0xff                             
  0b03  750b             jne 0xb10                                
  0b05  813e7b6fff00     cmp word ptr [0x6f7b], 0xff              
  0b0b  7503             jne 0xb10                                
  0b0d  e9b800           jmp 0xbc8                                
  0b10  8936796f         mov word ptr [0x6f79], si                
  0b14  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b19  813e7b6fff00     cmp word ptr [0x6f7b], 0xff              
  0b1f  744c             je 0xb6d                                 
  0b21  6a0f             push 0xf                                 
  0b23  c45efc           les bx, ptr [bp - 4]                     
  0b26  268b472c         mov ax, word ptr es:[bx + 0x2c]          
  0b2a  40               inc ax                                   
  0b2b  50               push ax                                  
  0b2c  c45efc           les bx, ptr [bp - 4]                     
  0b2f  268b4724         mov ax, word ptr es:[bx + 0x24]          
  0b33  2d0300           sub ax, 3                                
  0b36  50               push ax                                  
  0b37  c45efc           les bx, ptr [bp - 4]                     
  0b3a  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0b3e  8b1e7b6f         mov bx, word ptr [0x6f7b]                
  0b42  d1e3             shl bx, 1                                
  0b44  03877d6f         add ax, word ptr [bx + 0x6f7d]           
  0b48  50               push ax                                  
  0b49  c45efc           les bx, ptr [bp - 4]                     
  0b4c  268b4716         mov ax, word ptr es:[bx + 0x16]          
  0b50  40               inc ax                                   
  0b51  50               push ax                                  
  0b52  16               push ss                                  
  0b53  8d46f4           lea ax, [bp - 0xc]                       
  0b56  50               push ax                                  
  0b57  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0b5c  83c40c           add sp, 0xc                              
  0b5f  52               push dx                                  
  0b60  50               push ax                                  
  0b61  1e               push ds                                  
  0b62  682a34           push 0x342a                              
  0b65  9a4f041210       lcall 0x1012, 0x44f                      -> 1012:044f
  0b6a  83c40a           add sp, 0xa                              
  0b6d  813e796fff00     cmp word ptr [0x6f79], 0xff              
  0b73  744a             je 0xbbf                                 
  0b75  6a0f             push 0xf                                 
  0b77  c45efc           les bx, ptr [bp - 4]                     
  0b7a  268b472c         mov ax, word ptr es:[bx + 0x2c]          
  0b7e  40               inc ax                                   
  0b7f  50               push ax                                  
  0b80  c45efc           les bx, ptr [bp - 4]                     
  0b83  268b4724         mov ax, word ptr es:[bx + 0x24]          
  0b87  2d0300           sub ax, 3                                
  0b8a  50               push ax                                  
  0b8b  c45efc           les bx, ptr [bp - 4]                     
  0b8e  268b4718         mov ax, word ptr es:[bx + 0x18]          
  0b92  8bde             mov bx, si                               
  0b94  d1e3             shl bx, 1                                
  0b96  03877d6f         add ax, word ptr [bx + 0x6f7d]           
  0b9a  50               push ax                                  
  0b9b  c45efc           les bx, ptr [bp - 4]                     
  0b9e  268b4716         mov ax, word ptr es:[bx + 0x16]          
  0ba2  40               inc ax                                   
  0ba3  50               push ax                                  
  0ba4  16               push ss                                  
  0ba5  8d46f4           lea ax, [bp - 0xc]                       
  0ba8  50               push ax                                  
  0ba9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0bae  83c40c           add sp, 0xc                              
  0bb1  52               push dx                                  
  0bb2  50               push ax                                  
  0bb3  1e               push ds                                  
  0bb4  682a34           push 0x342a                              
  0bb7  9a4f041210       lcall 0x1012, 0x44f                      -> 1012:044f
  0bbc  83c40a           add sp, 0xa                              
  0bbf  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0bc4  89367b6f         mov word ptr [0x6f7b], si                
  0bc8  5e               pop si                                   
  0bc9  c9               leave                                    
  0bca  cb               retf                                     

res_1372_0bcb:  ; ENTRY
  0bcb  c80c0000         enter 0xc, 0                             
  0bcf  56               push si                                  
  0bd0  833e6f6f02       cmp word ptr [0x6f6f], 2                 
  0bd5  7505             jne 0xbdc                                
  0bd7  a1716f           mov ax, word ptr [0x6f71]                
  0bda  eb71             jmp 0xc4d                                
  0bdc  c41e286f         les bx, ptr [0x6f28]                     
  0be0  268b7708         mov si, word ptr es:[bx + 8]             
  0be4  eb5b             jmp 0xc41                                
  0be6  c41e286f         les bx, ptr [0x6f28]                     
  0bea  268b4702         mov ax, word ptr es:[bx + 2]             
  0bee  268b17           mov dx, word ptr es:[bx]                 
  0bf1  8bde             mov bx, si                               
  0bf3  6bdb2e           imul bx, bx, 0x2e                        
  0bf6  03d3             add dx, bx                               
  0bf8  8946f6           mov word ptr [bp - 0xa], ax              
  0bfb  8956f4           mov word ptr [bp - 0xc], dx              
  0bfe  c45ef4           les bx, ptr [bp - 0xc]                   
  0c01  26ff7714         push word ptr es:[bx + 0x14]             
  0c05  c45ef4           les bx, ptr [bp - 0xc]                   
  0c08  26ff7712         push word ptr es:[bx + 0x12]             
  0c0c  c45ef4           les bx, ptr [bp - 0xc]                   
  0c0f  26ff7710         push word ptr es:[bx + 0x10]             
  0c13  c45ef4           les bx, ptr [bp - 0xc]                   
  0c16  26ff770e         push word ptr es:[bx + 0xe]              
  0c1a  16               push ss                                  
  0c1b  8d46f8           lea ax, [bp - 8]                         
  0c1e  50               push ax                                  
  0c1f  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0c24  83c40c           add sp, 0xc                              
  0c27  16               push ss                                  
  0c28  8d46f8           lea ax, [bp - 8]                         
  0c2b  50               push ax                                  
  0c2c  9ab108bf12       lcall 0x12bf, 0x8b1                      -> 12bf:08b1
  0c31  83c404           add sp, 4                                
  0c34  0bc0             or ax, ax                                
  0c36  7409             je 0xc41                                 
  0c38  c45ef4           les bx, ptr [bp - 0xc]                   
  0c3b  268b4708         mov ax, word ptr es:[bx + 8]             
  0c3f  eb99             jmp 0xbda                                
  0c41  8bc6             mov ax, si                               
  0c43  4e               dec si                                   
  0c44  0bc0             or ax, ax                                
  0c46  759e             jne 0xbe6                                
  0c48  b8ff00           mov ax, 0xff                             
  0c4b  eb8d             jmp 0xbda                                
  0c4d  5e               pop si                                   
  0c4e  c9               leave                                    
  0c4f  cb               retf                                     

res_1372_0c50:  ; ENTRY
  0c50  c8040000         enter 4, 0                               
  0c54  c41e286f         les bx, ptr [0x6f28]                     
  0c58  268b4702         mov ax, word ptr es:[bx + 2]             
  0c5c  268b17           mov dx, word ptr es:[bx]                 
  0c5f  8b5e06           mov bx, word ptr [bp + 6]                
  0c62  6bdb2e           imul bx, bx, 0x2e                        
  0c65  03d3             add dx, bx                               
  0c67  8946fe           mov word ptr [bp - 2], ax                
  0c6a  8956fc           mov word ptr [bp - 4], dx                
  0c6d  ba0100           mov dx, 1                                
  0c70  eb1a             jmp 0xc8c                                
  0c72  c45efc           les bx, ptr [bp - 4]                     
  0c75  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0c7a  8aca             mov cl, dl                               
  0c7c  66d3e8           shr eax, cl                              
  0c7f  66a901000000     test eax, 1                              
  0c85  7404             je 0xc8b                                 
  0c87  8bc2             mov ax, dx                               
  0c89  eb0b             jmp 0xc96                                
  0c8b  42               inc dx                                   
  0c8c  83fa1f           cmp dx, 0x1f                             
  0c8f  7ce1             jl 0xc72                                 
  0c91  b8ff00           mov ax, 0xff                             
  0c94  ebf3             jmp 0xc89                                
  0c96  c9               leave                                    
  0c97  cb               retf                                     

res_1372_0c98:  ; ENTRY
  0c98  c8040000         enter 4, 0                               
  0c9c  56               push si                                  
  0c9d  8b7606           mov si, word ptr [bp + 6]                
  0ca0  c41e286f         les bx, ptr [0x6f28]                     
  0ca4  268b4702         mov ax, word ptr es:[bx + 2]             
  0ca8  268b17           mov dx, word ptr es:[bx]                 
  0cab  8bde             mov bx, si                               
  0cad  6bdb2e           imul bx, bx, 0x2e                        
  0cb0  03d3             add dx, bx                               
  0cb2  8946fe           mov word ptr [bp - 2], ax                
  0cb5  8956fc           mov word ptr [bp - 4], dx                
  0cb8  813e736fff00     cmp word ptr [0x6f73], 0xff              
  0cbe  7417             je 0xcd7                                 
  0cc0  c45efc           les bx, ptr [bp - 4]                     
  0cc3  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0cc8  8a0e736f         mov cl, byte ptr [0x6f73]                
  0ccc  66d3e8           shr eax, cl                              
  0ccf  66a901000000     test eax, 1                              
  0cd5  7405             je 0xcdc                                 
  0cd7  a1736f           mov ax, word ptr [0x6f73]                
  0cda  eb08             jmp 0xce4                                
  0cdc  56               push si                                  
  0cdd  0e               push cs                                  
  0cde  e86fff           call 0xc50                               
  0ce1  59               pop cx                                   
  0ce2  ebf6             jmp 0xcda                                
  0ce4  5e               pop si                                   
  0ce5  c9               leave                                    
  0ce6  cb               retf                                     
  0ce7  c8040000         enter 4, 0                               
  0ceb  56               push si                                  
  0cec  8b760a           mov si, word ptr [bp + 0xa]              
  0cef  c41e286f         les bx, ptr [0x6f28]                     
  0cf3  268b4f08         mov cx, word ptr es:[bx + 8]             
  0cf7  eb75             jmp 0xd6e                                
  0cf9  c41e286f         les bx, ptr [0x6f28]                     
  0cfd  268b4702         mov ax, word ptr es:[bx + 2]             
  0d01  268b17           mov dx, word ptr es:[bx]                 
  0d04  8bd9             mov bx, cx                               
  0d06  6bdb2e           imul bx, bx, 0x2e                        
  0d09  03d3             add dx, bx                               
  0d0b  8946fe           mov word ptr [bp - 2], ax                
  0d0e  8ec0             mov es, ax                               
  0d10  8956fc           mov word ptr [bp - 4], dx                
  0d13  8bda             mov bx, dx                               
  0d15  268b4708         mov ax, word ptr es:[bx + 8]             
  0d19  3b4606           cmp ax, word ptr [bp + 6]                
  0d1c  7550             jne 0xd6e                                
  0d1e  837e0800         cmp word ptr [bp + 8], 0                 
  0d22  7519             jne 0xd3d                                
  0d24  0bf6             or si, si                                
  0d26  7405             je 0xd2d                                 
  0d28  b8ffff           mov ax, 0xffff                           
  0d2b  eb02             jmp 0xd2f                                
  0d2d  33c0             xor ax, ax                               
  0d2f  660fb7c0         movzx eax, ax                            
  0d33  c45efc           les bx, ptr [bp - 4]                     
  0d36  6626894720       mov dword ptr es:[bx + 0x20], eax        
  0d3b  eb2f             jmp 0xd6c                                
  0d3d  b80100           mov ax, 1                                
  0d40  8a4e08           mov cl, byte ptr [bp + 8]                
  0d43  d3e0             shl ax, cl                               
  0d45  35ffff           xor ax, 0xffff                           
  0d48  660fb7c0         movzx eax, ax                            
  0d4c  c45efc           les bx, ptr [bp - 4]                     
  0d4f  6626214720       and dword ptr es:[bx + 0x20], eax        
  0d54  0bf6             or si, si                                
  0d56  7414             je 0xd6c                                 
  0d58  b80100           mov ax, 1                                
  0d5b  8a4e08           mov cl, byte ptr [bp + 8]                
  0d5e  d3e0             shl ax, cl                               
  0d60  660fbfc0         movsx eax, ax                            
  0d64  c45efc           les bx, ptr [bp - 4]                     
  0d67  6626094720       or dword ptr es:[bx + 0x20], eax         
  0d6c  eb07             jmp 0xd75                                
  0d6e  8bc1             mov ax, cx                               
  0d70  49               dec cx                                   
  0d71  0bc0             or ax, ax                                
  0d73  7584             jne 0xcf9                                
  0d75  5e               pop si                                   
  0d76  c9               leave                                    
  0d77  cb               retf                                     
  0d78  c8040000         enter 4, 0                               
  0d7c  56               push si                                  
  0d7d  c41e286f         les bx, ptr [0x6f28]                     
  0d81  268b770a         mov si, word ptr es:[bx + 0xa]           
  0d85  e98200           jmp 0xe0a                                
  0d88  c41e286f         les bx, ptr [0x6f28]                     
  0d8c  26c45f04         les bx, ptr es:[bx + 4]                  
  0d90  8bc6             mov ax, si                               
  0d92  c1e003           shl ax, 3                                
  0d95  03d8             add bx, ax                               
  0d97  268b07           mov ax, word ptr es:[bx]                 
  0d9a  3b4606           cmp ax, word ptr [bp + 6]                
  0d9d  756b             jne 0xe0a                                
  0d9f  c41e286f         les bx, ptr [0x6f28]                     
  0da3  26c45f04         les bx, ptr es:[bx + 4]                  
  0da7  8bc6             mov ax, si                               
  0da9  c1e003           shl ax, 3                                
  0dac  03d8             add bx, ax                               
  0dae  268b4702         mov ax, word ptr es:[bx + 2]             
  0db2  6bc02e           imul ax, ax, 0x2e                        
  0db5  c41e286f         les bx, ptr [0x6f28]                     
  0db9  268b5702         mov dx, word ptr es:[bx + 2]             
  0dbd  268b1f           mov bx, word ptr es:[bx]                 
  0dc0  03d8             add bx, ax                               
  0dc2  8956fe           mov word ptr [bp - 2], dx                
  0dc5  895efc           mov word ptr [bp - 4], bx                
  0dc8  c41e286f         les bx, ptr [0x6f28]                     
  0dcc  26c45f04         les bx, ptr es:[bx + 4]                  
  0dd0  8bc6             mov ax, si                               
  0dd2  c1e003           shl ax, 3                                
  0dd5  03d8             add bx, ax                               
  0dd7  268b5704         mov dx, word ptr es:[bx + 4]             
  0ddb  b80100           mov ax, 1                                
  0dde  8aca             mov cl, dl                               
  0de0  d3e0             shl ax, cl                               
  0de2  35ffff           xor ax, 0xffff                           
  0de5  660fb7c0         movzx eax, ax                            
  0de9  c45efc           les bx, ptr [bp - 4]                     
  0dec  6626214720       and dword ptr es:[bx + 0x20], eax        
  0df1  837e0800         cmp word ptr [bp + 8], 0                 
  0df5  7413             je 0xe0a                                 
  0df7  b80100           mov ax, 1                                
  0dfa  8aca             mov cl, dl                               
  0dfc  d3e0             shl ax, cl                               
  0dfe  660fbfc0         movsx eax, ax                            
  0e02  c45efc           les bx, ptr [bp - 4]                     
  0e05  6626094720       or dword ptr es:[bx + 0x20], eax         
  0e0a  8bc6             mov ax, si                               
  0e0c  4e               dec si                                   
  0e0d  0bc0             or ax, ax                                
  0e0f  7403             je 0xe14                                 
  0e11  e974ff           jmp 0xd88                                
  0e14  5e               pop si                                   
  0e15  c9               leave                                    
  0e16  cb               retf                                     

res_1372_0e17:  ; ENTRY
  0e17  c8080000         enter 8, 0                               
  0e1b  56               push si                                  
  0e1c  8b760a           mov si, word ptr [bp + 0xa]              
  0e1f  c41e286f         les bx, ptr [0x6f28]                     
  0e23  268b4f08         mov cx, word ptr es:[bx + 8]             
  0e27  eb78             jmp 0xea1                                
  0e29  c41e286f         les bx, ptr [0x6f28]                     
  0e2d  268b4702         mov ax, word ptr es:[bx + 2]             
  0e31  268b17           mov dx, word ptr es:[bx]                 
  0e34  8bd9             mov bx, cx                               
  0e36  6bdb2e           imul bx, bx, 0x2e                        
  0e39  03d3             add dx, bx                               
  0e3b  8946fe           mov word ptr [bp - 2], ax                
  0e3e  8ec0             mov es, ax                               
  0e40  8956fc           mov word ptr [bp - 4], dx                
  0e43  8bda             mov bx, dx                               
  0e45  268b4708         mov ax, word ptr es:[bx + 8]             
  0e49  3b4606           cmp ax, word ptr [bp + 6]                
  0e4c  7553             jne 0xea1                                
  0e4e  66b801000000     mov eax, 1                               
  0e54  8a4e08           mov cl, byte ptr [bp + 8]                
  0e57  66d3e0           shl eax, cl                              
  0e5a  668946f8         mov dword ptr [bp - 8], eax              
  0e5e  837e0800         cmp word ptr [bp + 8], 0                 
  0e62  7519             jne 0xe7d                                
  0e64  0bf6             or si, si                                
  0e66  7408             je 0xe70                                 
  0e68  66b8ffffff00     mov eax, 0xffffff                        
  0e6e  eb03             jmp 0xe73                                
  0e70  6633c0           xor eax, eax                             
  0e73  c45efc           les bx, ptr [bp - 4]                     
  0e76  662689471a       mov dword ptr es:[bx + 0x1a], eax        
  0e7b  eb22             jmp 0xe9f                                
  0e7d  668b46f8         mov eax, dword ptr [bp - 8]              
  0e81  6635ffffff00     xor eax, 0xffffff                        
  0e87  c45efc           les bx, ptr [bp - 4]                     
  0e8a  662621471a       and dword ptr es:[bx + 0x1a], eax        
  0e8f  0bf6             or si, si                                
  0e91  740c             je 0xe9f                                 
  0e93  c45efc           les bx, ptr [bp - 4]                     
  0e96  668b46f8         mov eax, dword ptr [bp - 8]              
  0e9a  662609471a       or dword ptr es:[bx + 0x1a], eax         
  0e9f  eb07             jmp 0xea8                                
  0ea1  8bc1             mov ax, cx                               
  0ea3  49               dec cx                                   
  0ea4  0bc0             or ax, ax                                
  0ea6  7581             jne 0xe29                                
  0ea8  5e               pop si                                   
  0ea9  c9               leave                                    
  0eaa  cb               retf                                     

res_1372_0eab:  ; ENTRY
  0eab  55               push bp                                  
  0eac  8bec             mov bp, sp                               
  0eae  56               push si                                  
  0eaf  57               push di                                  
  0eb0  8b4606           mov ax, word ptr [bp + 6]                
  0eb3  8b7e08           mov di, word ptr [bp + 8]                
  0eb6  0bc0             or ax, ax                                
  0eb8  752f             jne 0xee9                                
  0eba  c41e286f         les bx, ptr [0x6f28]                     
  0ebe  268b7708         mov si, word ptr es:[bx + 8]             
  0ec2  eb1c             jmp 0xee0                                
  0ec4  57               push di                                  
  0ec5  6a00             push 0                                   
  0ec7  c41e286f         les bx, ptr [0x6f28]                     
  0ecb  26c41f           les bx, ptr es:[bx]                      
  0ece  8bc6             mov ax, si                               
  0ed0  6bc02e           imul ax, ax, 0x2e                        
  0ed3  03d8             add bx, ax                               
  0ed5  26ff7708         push word ptr es:[bx + 8]                
  0ed9  0e               push cs                                  
  0eda  e83aff           call 0xe17                               
  0edd  83c406           add sp, 6                                
  0ee0  8bc6             mov ax, si                               
  0ee2  4e               dec si                                   
  0ee3  0bc0             or ax, ax                                
  0ee5  75dd             jne 0xec4                                
  0ee7  eb0b             jmp 0xef4                                
  0ee9  57               push di                                  
  0eea  6a00             push 0                                   
  0eec  50               push ax                                  
  0eed  0e               push cs                                  
  0eee  e826ff           call 0xe17                               
  0ef1  83c406           add sp, 6                                
  0ef4  5f               pop di                                   
  0ef5  5e               pop si                                   
  0ef6  5d               pop bp                                   
  0ef7  cb               retf                                     

res_1372_0ef8:  ; ENTRY
  0ef8  c80a0000         enter 0xa, 0                             
  0efc  56               push si                                  
  0efd  c41e286f         les bx, ptr [0x6f28]                     
  0f01  268b770a         mov si, word ptr es:[bx + 0xa]           
  0f05  e98a00           jmp 0xf92                                
  0f08  c41e286f         les bx, ptr [0x6f28]                     
  0f0c  26c45f04         les bx, ptr es:[bx + 4]                  
  0f10  8bc6             mov ax, si                               
  0f12  c1e003           shl ax, 3                                
  0f15  03d8             add bx, ax                               
  0f17  268b07           mov ax, word ptr es:[bx]                 
  0f1a  3b4606           cmp ax, word ptr [bp + 6]                
  0f1d  7573             jne 0xf92                                
  0f1f  c41e286f         les bx, ptr [0x6f28]                     
  0f23  26c45f04         les bx, ptr es:[bx + 4]                  
  0f27  8bc6             mov ax, si                               
  0f29  c1e003           shl ax, 3                                
  0f2c  03d8             add bx, ax                               
  0f2e  268b4702         mov ax, word ptr es:[bx + 2]             
  0f32  6bc02e           imul ax, ax, 0x2e                        
  0f35  c41e286f         les bx, ptr [0x6f28]                     
  0f39  268b5702         mov dx, word ptr es:[bx + 2]             
  0f3d  268b1f           mov bx, word ptr es:[bx]                 
  0f40  03d8             add bx, ax                               
  0f42  8956fe           mov word ptr [bp - 2], dx                
  0f45  895efc           mov word ptr [bp - 4], bx                
  0f48  c41e286f         les bx, ptr [0x6f28]                     
  0f4c  26c45f04         les bx, ptr es:[bx + 4]                  
  0f50  8bc6             mov ax, si                               
  0f52  c1e003           shl ax, 3                                
  0f55  03d8             add bx, ax                               
  0f57  268b4704         mov ax, word ptr es:[bx + 4]             
  0f5b  8946fa           mov word ptr [bp - 6], ax                
  0f5e  66b801000000     mov eax, 1                               
  0f64  8a4efa           mov cl, byte ptr [bp - 6]                
  0f67  66d3e0           shl eax, cl                              
  0f6a  668946f6         mov dword ptr [bp - 0xa], eax            
  0f6e  668b46f6         mov eax, dword ptr [bp - 0xa]            
  0f72  6635ffffff00     xor eax, 0xffffff                        
  0f78  c45efc           les bx, ptr [bp - 4]                     
  0f7b  662621471a       and dword ptr es:[bx + 0x1a], eax        
  0f80  837e0800         cmp word ptr [bp + 8], 0                 
  0f84  740c             je 0xf92                                 
  0f86  c45efc           les bx, ptr [bp - 4]                     
  0f89  668b46f6         mov eax, dword ptr [bp - 0xa]            
  0f8d  662609471a       or dword ptr es:[bx + 0x1a], eax         
  0f92  8bc6             mov ax, si                               
  0f94  4e               dec si                                   
  0f95  0bc0             or ax, ax                                
  0f97  7403             je 0xf9c                                 
  0f99  e96cff           jmp 0xf08                                
  0f9c  5e               pop si                                   
  0f9d  c9               leave                                    
  0f9e  cb               retf                                     

res_1372_0f9f:  ; ENTRY
  0f9f  c8060000         enter 6, 0                               
  0fa3  56               push si                                  
  0fa4  c41e286f         les bx, ptr [0x6f28]                     
  0fa8  268b770a         mov si, word ptr es:[bx + 0xa]           
  0fac  eb71             jmp 0x101f                               
  0fae  c41e286f         les bx, ptr [0x6f28]                     
  0fb2  26c45f04         les bx, ptr es:[bx + 4]                  
  0fb6  8bc6             mov ax, si                               
  0fb8  c1e003           shl ax, 3                                
  0fbb  03d8             add bx, ax                               
  0fbd  268b07           mov ax, word ptr es:[bx]                 
  0fc0  3b4606           cmp ax, word ptr [bp + 6]                
  0fc3  755a             jne 0x101f                               
  0fc5  c41e286f         les bx, ptr [0x6f28]                     
  0fc9  26c45f04         les bx, ptr es:[bx + 4]                  
  0fcd  8bc6             mov ax, si                               
  0fcf  c1e003           shl ax, 3                                
  0fd2  03d8             add bx, ax                               
  0fd4  268b4702         mov ax, word ptr es:[bx + 2]             
  0fd8  6bc02e           imul ax, ax, 0x2e                        
  0fdb  c41e286f         les bx, ptr [0x6f28]                     
  0fdf  268b5702         mov dx, word ptr es:[bx + 2]             
  0fe3  268b1f           mov bx, word ptr es:[bx]                 
  0fe6  03d8             add bx, ax                               
  0fe8  8956fe           mov word ptr [bp - 2], dx                
  0feb  895efc           mov word ptr [bp - 4], bx                
  0fee  c41e286f         les bx, ptr [0x6f28]                     
  0ff2  26c45f04         les bx, ptr es:[bx + 4]                  
  0ff6  8bc6             mov ax, si                               
  0ff8  c1e003           shl ax, 3                                
  0ffb  03d8             add bx, ax                               
  0ffd  268b4704         mov ax, word ptr es:[bx + 4]             
  1001  8946fa           mov word ptr [bp - 6], ax                
  1004  b80100           mov ax, 1                                
  1007  8a4efa           mov cl, byte ptr [bp - 6]                
  100a  d3e0             shl ax, cl                               
  100c  660fbfc0         movsx eax, ax                            
  1010  c45efc           les bx, ptr [bp - 4]                     
  1013  662685471a       test dword ptr es:[bx + 0x1a], eax       
  1018  7405             je 0x101f                                
  101a  b80100           mov ax, 1                                
  101d  eb0b             jmp 0x102a                               
  101f  8bc6             mov ax, si                               
  1021  4e               dec si                                   
  1022  0bc0             or ax, ax                                
  1024  7588             jne 0xfae                                
  1026  33c0             xor ax, ax                               
  1028  ebf3             jmp 0x101d                               
  102a  5e               pop si                                   
  102b  c9               leave                                    
  102c  cb               retf                                     

res_1372_102d:  ; ENTRY
  102d  c80c0000         enter 0xc, 0                             
  1031  56               push si                                  
  1032  8b7606           mov si, word ptr [bp + 6]                
  1035  3b366d6f         cmp si, word ptr [0x6f6d]                
  1039  740e             je 0x1049                                
  103b  81feff00         cmp si, 0xff                             
  103f  750b             jne 0x104c                               
  1041  813e6b6fff00     cmp word ptr [0x6f6b], 0xff              
  1047  7503             jne 0x104c                               
  1049  e9cc00           jmp 0x1118                               
  104c  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1051  89366d6f         mov word ptr [0x6f6d], si                
  1055  813e6b6fff00     cmp word ptr [0x6f6b], 0xff              
  105b  7455             je 0x10b2                                
  105d  c41e286f         les bx, ptr [0x6f28]                     
  1061  268b4702         mov ax, word ptr es:[bx + 2]             
  1065  268b17           mov dx, word ptr es:[bx]                 
  1068  8b1e6b6f         mov bx, word ptr [0x6f6b]                
  106c  6bdb2e           imul bx, bx, 0x2e                        
  106f  03d3             add dx, bx                               
  1071  8946fe           mov word ptr [bp - 2], ax                
  1074  8956fc           mov word ptr [bp - 4], dx                
  1077  6a07             push 7                                   
  1079  c45efc           les bx, ptr [bp - 4]                     
  107c  268b4714         mov ax, word ptr es:[bx + 0x14]          
  1080  48               dec ax                                   
  1081  50               push ax                                  
  1082  c45efc           les bx, ptr [bp - 4]                     
  1085  26ff770c         push word ptr es:[bx + 0xc]              
  1089  c45efc           les bx, ptr [bp - 4]                     
  108c  26ff7710         push word ptr es:[bx + 0x10]             
  1090  c45efc           les bx, ptr [bp - 4]                     
  1093  26ff770e         push word ptr es:[bx + 0xe]              
  1097  16               push ss                                  
  1098  8d46f4           lea ax, [bp - 0xc]                       
  109b  50               push ax                                  
  109c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  10a1  83c40c           add sp, 0xc                              
  10a4  52               push dx                                  
  10a5  50               push ax                                  
  10a6  1e               push ds                                  
  10a7  682a34           push 0x342a                              
  10aa  9a4f041210       lcall 0x1012, 0x44f                      -> 1012:044f
  10af  83c40a           add sp, 0xa                              
  10b2  813e6d6fff00     cmp word ptr [0x6f6d], 0xff              
  10b8  7455             je 0x110f                                
  10ba  c41e286f         les bx, ptr [0x6f28]                     
  10be  268b4702         mov ax, word ptr es:[bx + 2]             
  10c2  268b17           mov dx, word ptr es:[bx]                 
  10c5  8b1e6d6f         mov bx, word ptr [0x6f6d]                
  10c9  6bdb2e           imul bx, bx, 0x2e                        
  10cc  03d3             add dx, bx                               
  10ce  8946fe           mov word ptr [bp - 2], ax                
  10d1  8956fc           mov word ptr [bp - 4], dx                
  10d4  6a07             push 7                                   
  10d6  c45efc           les bx, ptr [bp - 4]                     
  10d9  268b4714         mov ax, word ptr es:[bx + 0x14]          
  10dd  48               dec ax                                   
  10de  50               push ax                                  
  10df  c45efc           les bx, ptr [bp - 4]                     
  10e2  26ff770c         push word ptr es:[bx + 0xc]              
  10e6  c45efc           les bx, ptr [bp - 4]                     
  10e9  26ff7710         push word ptr es:[bx + 0x10]             
  10ed  c45efc           les bx, ptr [bp - 4]                     
  10f0  26ff770e         push word ptr es:[bx + 0xe]              
  10f4  16               push ss                                  
  10f5  8d46f4           lea ax, [bp - 0xc]                       
  10f8  50               push ax                                  
  10f9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  10fe  83c40c           add sp, 0xc                              
  1101  52               push dx                                  
  1102  50               push ax                                  
  1103  1e               push ds                                  
  1104  682a34           push 0x342a                              
  1107  9a4f041210       lcall 0x1012, 0x44f                      -> 1012:044f
  110c  83c40a           add sp, 0xa                              
  110f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1114  89366b6f         mov word ptr [0x6f6b], si                
  1118  5e               pop si                                   
  1119  c9               leave                                    
  111a  cb               retf                                     

res_1372_111b:  ; ENTRY
  111b  c8040000         enter 4, 0                               
  111f  56               push si                                  
  1120  c41e286f         les bx, ptr [0x6f28]                     
  1124  268b770a         mov si, word ptr es:[bx + 0xa]           
  1128  e99400           jmp 0x11bf                               
  112b  c41e286f         les bx, ptr [0x6f28]                     
  112f  26c45f04         les bx, ptr es:[bx + 4]                  
  1133  8bc6             mov ax, si                               
  1135  c1e003           shl ax, 3                                
  1138  03d8             add bx, ax                               
  113a  268b4706         mov ax, word ptr es:[bx + 6]             
  113e  c45e06           les bx, ptr [bp + 6]                     
  1141  263b07           cmp ax, word ptr es:[bx]                 
  1144  7579             jne 0x11bf                               
  1146  c41e286f         les bx, ptr [0x6f28]                     
  114a  26c45f04         les bx, ptr es:[bx + 4]                  
  114e  8bc6             mov ax, si                               
  1150  c1e003           shl ax, 3                                
  1153  03d8             add bx, ax                               
  1155  268b4702         mov ax, word ptr es:[bx + 2]             
  1159  8946fe           mov word ptr [bp - 2], ax                
  115c  50               push ax                                  
  115d  0e               push cs                                  
  115e  e8ccfe           call 0x102d                              
  1161  59               pop cx                                   
  1162  c41e286f         les bx, ptr [0x6f28]                     
  1166  26c45f04         les bx, ptr es:[bx + 4]                  
  116a  8bc6             mov ax, si                               
  116c  c1e003           shl ax, 3                                
  116f  03d8             add bx, ax                               
  1171  268b4704         mov ax, word ptr es:[bx + 4]             
  1175  8946fc           mov word ptr [bp - 4], ax                
  1178  1e               push ds                                  
  1179  681c6f           push 0x6f1c                              
  117c  6a00             push 0                                   
  117e  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  1183  83c406           add sp, 6                                
  1186  66a11c6f         mov eax, dword ptr [0x6f1c]              
  118a  66a3206f         mov dword ptr [0x6f20], eax              
  118e  c41e286f         les bx, ptr [0x6f28]                     
  1192  26c41f           les bx, ptr es:[bx]                      
  1195  8b46fe           mov ax, word ptr [bp - 2]                
  1198  6bc02e           imul ax, ax, 0x2e                        
  119b  03d8             add bx, ax                               
  119d  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  11a2  8a4efc           mov cl, byte ptr [bp - 4]                
  11a5  66d3e8           shr eax, cl                              
  11a8  66a901000000     test eax, 1                              
  11ae  750d             jne 0x11bd                               
  11b0  90               nop                                      
  11b1  0e               push cs                                  
  11b2  e83402           call 0x13e9                              
  11b5  c45e06           les bx, ptr [bp + 6]                     
  11b8  26c7070000       mov word ptr es:[bx], 0                  
  11bd  eb3b             jmp 0x11fa                               
  11bf  8bc6             mov ax, si                               
  11c1  4e               dec si                                   
  11c2  0bc0             or ax, ax                                
  11c4  7403             je 0x11c9                                
  11c6  e962ff           jmp 0x112b                               
  11c9  1e               push ds                                  
  11ca  68206f           push 0x6f20                              
  11cd  6a00             push 0                                   
  11cf  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  11d4  83c406           add sp, 6                                
  11d7  a1206f           mov ax, word ptr [0x6f20]                
  11da  2b061c6f         sub ax, word ptr [0x6f1c]                
  11de  99               cdq                                      
  11df  33c2             xor ax, dx                               
  11e1  2bc2             sub ax, dx                               
  11e3  3d0300           cmp ax, 3                                
  11e6  7d02             jge 0x11ea                               
  11e8  eb10             jmp 0x11fa                               
  11ea  68ff00           push 0xff                                
  11ed  0e               push cs                                  
  11ee  e83cfe           call 0x102d                              
  11f1  59               pop cx                                   
  11f2  66a1206f         mov eax, dword ptr [0x6f20]              
  11f6  66a31c6f         mov dword ptr [0x6f1c], eax              
  11fa  5e               pop si                                   
  11fb  c9               leave                                    
  11fc  cb               retf                                     

res_1372_11fd:  ; ENTRY
  11fd  1e               push ds                                  
  11fe  68206f           push 0x6f20                              
  1201  6a00             push 0                                   
  1203  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  1208  83c406           add sp, 6                                
  120b  a1206f           mov ax, word ptr [0x6f20]                
  120e  2b061c6f         sub ax, word ptr [0x6f1c]                
  1212  99               cdq                                      
  1213  33c2             xor ax, dx                               
  1215  2bc2             sub ax, dx                               
  1217  3d0300           cmp ax, 3                                
  121a  7d02             jge 0x121e                               
  121c  eb10             jmp 0x122e                               
  121e  68ff00           push 0xff                                
  1221  0e               push cs                                  
  1222  e808fe           call 0x102d                              
  1225  59               pop cx                                   
  1226  66a1206f         mov eax, dword ptr [0x6f20]              
  122a  66a31c6f         mov dword ptr [0x6f1c], eax              
  122e  cb               retf                                     

res_1372_122f:  ; ENTRY
  122f  55               push bp                                  
  1230  8bec             mov bp, sp                               
  1232  668b460a         mov eax, dword ptr [bp + 0xa]            
  1236  66a3246f         mov dword ptr [0x6f24], eax              
  123a  ff7608           push word ptr [bp + 8]                   
  123d  ff7606           push word ptr [bp + 6]                   
  1240  0e               push cs                                  
  1241  e8beed           call 2                                   
  1244  83c404           add sp, 4                                
  1247  b8ff00           mov ax, 0xff                             
  124a  a36d6f           mov word ptr [0x6f6d], ax                
  124d  a36b6f           mov word ptr [0x6f6b], ax                
  1250  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1255  c41e286f         les bx, ptr [0x6f28]                     
  1259  268b5708         mov dx, word ptr es:[bx + 8]             
  125d  eb14             jmp 0x1273                               
  125f  c41e286f         les bx, ptr [0x6f28]                     
  1263  26c41f           les bx, ptr es:[bx]                      
  1266  8bc2             mov ax, dx                               
  1268  6bc02e           imul ax, ax, 0x2e                        
  126b  03d8             add bx, ax                               
  126d  26c7471e0100     mov word ptr es:[bx + 0x1e], 1           
  1273  8bc2             mov ax, dx                               
  1275  4a               dec dx                                   
  1276  0bc0             or ax, ax                                
  1278  75e5             jne 0x125f                               
  127a  90               nop                                      
  127b  0e               push cs                                  
  127c  e80700           call 0x1286                              
  127f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1284  5d               pop bp                                   
  1285  cb               retf                                     

res_1372_1286:  ; ENTRY
  1286  c8080000         enter 8, 0                               
  128a  56               push si                                  
  128b  c41e286f         les bx, ptr [0x6f28]                     
  128f  268b4f08         mov cx, word ptr es:[bx + 8]             
  1293  e98c00           jmp 0x1322                               
  1296  c41e286f         les bx, ptr [0x6f28]                     
  129a  268b4702         mov ax, word ptr es:[bx + 2]             
  129e  268b17           mov dx, word ptr es:[bx]                 
  12a1  8bd9             mov bx, cx                               
  12a3  6bdb2e           imul bx, bx, 0x2e                        
  12a6  03d3             add dx, bx                               
  12a8  8946fa           mov word ptr [bp - 6], ax                
  12ab  8956f8           mov word ptr [bp - 8], dx                
  12ae  33d2             xor dx, dx                               
  12b0  66c746fc01000000 mov dword ptr [bp - 4], 1                
  12b8  be0200           mov si, 2                                
  12bb  eb3d             jmp 0x12fa                               
  12bd  c45ef8           les bx, ptr [bp - 8]                     
  12c0  26c41f           les bx, ptr es:[bx]                      
  12c3  8bc2             mov ax, dx                               
  12c5  c1e002           shl ax, 2                                
  12c8  03d8             add bx, ax                               
  12ca  26c41f           les bx, ptr es:[bx]                      
  12cd  26803f25         cmp byte ptr es:[bx], 0x25               
  12d1  7503             jne 0x12d6                               
  12d3  42               inc dx                                   
  12d4  eb24             jmp 0x12fa                               
  12d6  660fbfc6         movsx eax, si                            
  12da  660946fc         or dword ptr [bp - 4], eax               
  12de  d1e6             shl si, 1                                
  12e0  42               inc dx                                   
  12e1  c45ef8           les bx, ptr [bp - 8]                     
  12e4  26c41f           les bx, ptr es:[bx]                      
  12e7  8bc2             mov ax, dx                               
  12e9  c1e002           shl ax, 2                                
  12ec  03d8             add bx, ax                               
  12ee  26c41f           les bx, ptr es:[bx]                      
  12f1  26803f26         cmp byte ptr es:[bx], 0x26               
  12f5  7503             jne 0x12fa                               
  12f7  83c202           add dx, 2                                
  12fa  c45ef8           les bx, ptr [bp - 8]                     
  12fd  26c41f           les bx, ptr es:[bx]                      
  1300  8bc2             mov ax, dx                               
  1302  c1e002           shl ax, 2                                
  1305  03d8             add bx, ax                               
  1307  268b07           mov ax, word ptr es:[bx]                 
  130a  260b4702         or ax, word ptr es:[bx + 2]              
  130e  75ad             jne 0x12bd                               
  1310  668b46fc         mov eax, dword ptr [bp - 4]              
  1314  6625feffff00     and eax, 0xfffffe                        
  131a  c45ef8           les bx, ptr [bp - 8]                     
  131d  662689471a       mov dword ptr es:[bx + 0x1a], eax        
  1322  8bc1             mov ax, cx                               
  1324  49               dec cx                                   
  1325  0bc0             or ax, ax                                
  1327  7403             je 0x132c                                
  1329  e96aff           jmp 0x1296                               
  132c  5e               pop si                                   
  132d  c9               leave                                    
  132e  cb               retf                                     

res_1372_132f:  ; ENTRY
  132f  c80c0000         enter 0xc, 0                             
  1333  56               push si                                  
  1334  c45efc           les bx, ptr [bp - 4]                     
  1337  26ff772c         push word ptr es:[bx + 0x2c]             
  133b  688002           push 0x280                               
  133e  6a00             push 0                                   
  1340  6a00             push 0                                   
  1342  16               push ss                                  
  1343  8d46f4           lea ax, [bp - 0xc]                       
  1346  50               push ax                                  
  1347  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  134c  83c40c           add sp, 0xc                              
  134f  52               push dx                                  
  1350  50               push ax                                  
  1351  9ae807bf12       lcall 0x12bf, 0x7e8                      -> 12bf:07e8
  1356  83c404           add sp, 4                                
  1359  68ff00           push 0xff                                
  135c  0e               push cs                                  
  135d  e8cdfc           call 0x102d                              
  1360  59               pop cx                                   
  1361  c41e286f         les bx, ptr [0x6f28]                     
  1365  268b7708         mov si, word ptr es:[bx + 8]             
  1369  eb6f             jmp 0x13da                               
  136b  c41e286f         les bx, ptr [0x6f28]                     
  136f  268b4702         mov ax, word ptr es:[bx + 2]             
  1373  268b17           mov dx, word ptr es:[bx]                 
  1376  8bde             mov bx, si                               
  1378  6bdb2e           imul bx, bx, 0x2e                        
  137b  03d3             add dx, bx                               
  137d  8946fe           mov word ptr [bp - 2], ax                
  1380  8956fc           mov word ptr [bp - 4], dx                
  1383  c45efc           les bx, ptr [bp - 4]                     
  1386  6626837f1a00     cmp dword ptr es:[bx + 0x1a], 0          
  138c  740b             je 0x1399                                
  138e  837e0600         cmp word ptr [bp + 6], 0                 
  1392  7505             jne 0x1399                               
  1394  b80100           mov ax, 1                                
  1397  eb02             jmp 0x139b                               
  1399  33c0             xor ax, ax                               
  139b  c45efc           les bx, ptr [bp - 4]                     
  139e  2689471e         mov word ptr es:[bx + 0x1e], ax          
  13a2  c45efc           les bx, ptr [bp - 4]                     
  13a5  26837f1e00       cmp word ptr es:[bx + 0x1e], 0           
  13aa  7405             je 0x13b1                                
  13ac  b80100           mov ax, 1                                
  13af  eb03             jmp 0x13b4                               
  13b1  b80200           mov ax, 2                                
  13b4  50               push ax                                  
  13b5  ff1e246f         lcall [0x6f24]                           
  13b9  59               pop cx                                   
  13ba  c45efc           les bx, ptr [bp - 4]                     
  13bd  26ff7706         push word ptr es:[bx + 6]                
  13c1  26ff7704         push word ptr es:[bx + 4]                
  13c5  6a01             push 1                                   
  13c7  c45efc           les bx, ptr [bp - 4]                     
  13ca  268b470e         mov ax, word ptr es:[bx + 0xe]           
  13ce  050200           add ax, 2                                
  13d1  50               push ax                                  
  13d2  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  13d7  83c408           add sp, 8                                
  13da  8bc6             mov ax, si                               
  13dc  4e               dec si                                   
  13dd  0bc0             or ax, ax                                
  13df  758a             jne 0x136b                               
  13e1  9a6a08bf12       lcall 0x12bf, 0x86a                      -> 12bf:086a
  13e6  5e               pop si                                   
  13e7  c9               leave                                    
  13e8  cb               retf                                     

res_1372_13e9:  ; ENTRY
  13e9  cb               retf                                     
  13ea  8c               db 8c                                    
