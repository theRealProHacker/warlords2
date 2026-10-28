; res_08a9 file_off 0xaa90

res_08a9_000e:  ; ENTRY
  000e  55               push bp                                  
  000f  8bec             mov bp, sp                               
  0011  83ec16           sub sp, 0x16                             
  0014  66c746fa00000000 mov dword ptr [bp - 6], 0                
  001c  68a908           push 0x8a9                               
  001f  68f401           push 0x1f4                               
  0022  90               nop                                      
  0023  0e               push cs                                  
  0024  e8c001           call 0x1e7                               
  0027  83c404           add sp, 4                                
  002a  90               nop                                      
  002b  0e               push cs                                  
  002c  e83002           call 0x25f                               
  002f  90               nop                                      
  0030  0e               push cs                                  
  0031  e8c501           call 0x1f9                               
res_08a9_0034:  ; case
  0034  668b46fa         mov eax, dword ptr [bp - 6]              
  0038  66ff46fa         inc dword ptr [bp - 6]                   
  003c  663d30750000     cmp eax, 0x7530                          
  0042  7e0d             jle 0x51                                 
  0044  66c746fa00000000 mov dword ptr [bp - 6], 0                
  004c  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0051  833e6c1600       cmp word ptr [0x166c], 0                 
  0056  7405             je 0x5d                                  
  0058  90               nop                                      
  0059  0e               push cs                                  
  005a  e89402           call 0x2f1                               
  005d  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  0062  16               push ss                                  
  0063  8d46ea           lea ax, [bp - 0x16]                      
  0066  50               push ax                                  
  0067  666aff           push -1                                  
  006a  9a0300b511       lcall 0x11b5, 3                          -> 11b5:0003
  006f  83c408           add sp, 8                                
  0072  8b5eea           mov bx, word ptr [bp - 0x16]             
  0075  83fb07           cmp bx, 7                                
  0078  77ba             ja 0x34                                  
  007a  d1e3             shl bx, 1                                
  007c  2effa71c01       jmp word ptr cs:[bx + 0x11c]             
res_08a9_0081:  ; case
  0081  9aab025e15       lcall 0x155e, 0x2ab                      -> 155e:02ab
  0086  833e6a1600       cmp word ptr [0x166a], 0                 
  008b  7523             jne 0xb0                                 
  008d  833e761100       cmp word ptr [0x1176], 0                 
  0092  751c             jne 0xb0                                 
  0094  833e721100       cmp word ptr [0x1172], 0                 
  0099  7515             jne 0xb0                                 
  009b  833e741100       cmp word ptr [0x1174], 0                 
  00a0  750e             jne 0xb0                                 
  00a2  9a1f017b07       lcall 0x77b, 0x11f                       -> 077b:011f
  00a7  9afd117213       lcall 0x1372, 0x11fd                     -> 1372:11fd
  00ac  ff1e384c         lcall [0x4c38]                           
  00b0  90               nop                                      
  00b1  0e               push cs                                  
  00b2  e8a106           call 0x756                               
  00b5  8946fe           mov word ptr [bp - 2], ax                
  00b8  0bc0             or ax, ax                                
  00ba  7403             je 0xbf                                  
  00bc  a33e4c           mov word ptr [0x4c3e], ax                
  00bf  6a00             push 0                                   
  00c1  9a09002607       lcall 0x726, 9                           -> 0726:0009
  00c6  59               pop cx                                   
  00c7  8bd0             mov dx, ax                               
  00c9  0bd2             or dx, dx                                
  00cb  7503             jne 0xd0                                 
  00cd  e964ff           jmp 0x34                                 
  00d0  6a00             push 0                                   
  00d2  50               push ax                                  
  00d3  9a6400be07       lcall 0x7be, 0x64                        -> 07be:0064
  00d8  83c404           add sp, 4                                
  00db  0bc0             or ax, ax                                
  00dd  7503             jne 0xe2                                 
  00df  e952ff           jmp 0x34                                 
  00e2  eb36             jmp 0x11a                                
res_08a9_00e4:  ; case
  00e4  16               push ss                                  
  00e5  8d46ea           lea ax, [bp - 0x16]                      
  00e8  50               push ax                                  
  00e9  90               nop                                      
  00ea  0e               push cs                                  
  00eb  e83e00           call 0x12c                               
  00ee  eb10             jmp 0x100                                
res_08a9_00f0:  ; case
  00f0  c70670160100     mov word ptr [0x1670], 1                 
  00f6  16               push ss                                  
  00f7  8d46ea           lea ax, [bp - 0x16]                      
  00fa  50               push ax                                  
  00fb  90               nop                                      
  00fc  0e               push cs                                  
  00fd  e88900           call 0x189                               
  0100  83c404           add sp, 4                                
  0103  e92eff           jmp 0x34                                 
res_08a9_0106:  ; case
  0106  6a01             push 1                                   
  0108  ff76ec           push word ptr [bp - 0x14]                
  010b  9a6400be07       lcall 0x7be, 0x64                        -> 07be:0064
  0110  83c404           add sp, 4                                
  0113  0bc0             or ax, ax                                
  0115  7503             jne 0x11a                                
  0117  e91aff           jmp 0x34                                 
  011a  c9               leave                                    
  011b  cb               retf                                     
  011c  8100e400f000e400 dw 0081,00e4,00f0,00e4,00f0,0034,0034,0106 jump table

res_08a9_012c:  ; ENTRY
  012c  55               push bp                                  
  012d  8bec             mov bp, sp                               
  012f  90               nop                                      
  0130  0e               push cs                                  
  0131  e82206           call 0x756                               
  0134  8bd0             mov dx, ax                               
  0136  0bc0             or ax, ax                                
  0138  744d             je 0x187                                 
  013a  c45e06           les bx, ptr [bp + 6]                     
  013d  26833f03         cmp word ptr es:[bx], 3                  
  0141  751e             jne 0x161                                
  0143  833e6c1600       cmp word ptr [0x166c], 0                 
  0148  753d             jne 0x187                                
  014a  c41e404c         les bx, ptr [0x4c40]                     
  014e  26c41f           les bx, ptr es:[bx]                      
  0151  6bc021           imul ax, ax, 0x21                        
  0154  03d8             add bx, ax                               
  0156  26ff37           push word ptr es:[bx]                    
  0159  9a2000a62f       lcall 0x2fa6, 0x20                       -> ovl15:0000
  015e  59               pop cx                                   
  015f  eb26             jmp 0x187                                
  0161  833e741100       cmp word ptr [0x1174], 0                 
  0166  751f             jne 0x187                                
  0168  833e761100       cmp word ptr [0x1176], 0                 
  016d  7518             jne 0x187                                
  016f  833e721100       cmp word ptr [0x1172], 0                 
  0174  7511             jne 0x187                                
  0176  89163e4c         mov word ptr [0x4c3e], dx                
  017a  c45e06           les bx, ptr [bp + 6]                     
  017d  26ff37           push word ptr es:[bx]                    
  0180  9a260ebe07       lcall 0x7be, 0xe26                       -> 07be:0e26
  0185  ebd7             jmp 0x15e                                
  0187  5d               pop bp                                   
  0188  cb               retf                                     

res_08a9_0189:  ; ENTRY
  0189  55               push bp                                  
  018a  8bec             mov bp, sp                               
  018c  c45e06           les bx, ptr [bp + 6]                     
  018f  26833f04         cmp word ptr es:[bx], 4                  
  0193  7436             je 0x1cb                                 
  0195  833e6c1600       cmp word ptr [0x166c], 0                 
  019a  7429             je 0x1c5                                 
  019c  90               nop                                      
  019d  0e               push cs                                  
  019e  e85001           call 0x2f1                               
  01a1  0bc0             or ax, ax                                
  01a3  7420             je 0x1c5                                 
  01a5  c45e06           les bx, ptr [bp + 6]                     
  01a8  26ff37           push word ptr es:[bx]                    
  01ab  c41e404c         les bx, ptr [0x4c40]                     
  01af  26c41f           les bx, ptr es:[bx]                      
  01b2  a13c4c           mov ax, word ptr [0x4c3c]                
  01b5  6bc021           imul ax, ax, 0x21                        
  01b8  03d8             add bx, ax                               
  01ba  26ff37           push word ptr es:[bx]                    
  01bd  9ad804be07       lcall 0x7be, 0x4d8                       -> 07be:04d8
  01c2  83c404           add sp, 4                                
  01c5  c7066c160000     mov word ptr [0x166c], 0                 
  01cb  5d               pop bp                                   
  01cc  cb               retf                                     

res_08a9_01cd:  ; ENTRY
  01cd  55               push bp                                  
  01ce  8bec             mov bp, sp                               
  01d0  668b460a         mov eax, dword ptr [bp + 0xa]            
  01d4  662b4606         sub eax, dword ptr [bp + 6]              
  01d8  6683f828         cmp eax, 0x28                            
  01dc  7d05             jge 0x1e3                                
  01de  b80100           mov ax, 1                                
  01e1  eb02             jmp 0x1e5                                
  01e3  33c0             xor ax, ax                               
  01e5  5d               pop bp                                   
  01e6  cb               retf                                     

res_08a9_01e7:  ; ENTRY
  01e7  55               push bp                                  
  01e8  8bec             mov bp, sp                               
  01ea  668b4606         mov eax, dword ptr [bp + 6]              
  01ee  66a3384c         mov dword ptr [0x4c38], eax              
  01f2  5d               pop bp                                   
  01f3  cb               retf                                     
  01f4  55               push bp                                  
  01f5  8bec             mov bp, sp                               
  01f7  5d               pop bp                                   
  01f8  cb               retf                                     

res_08a9_01f9:  ; ENTRY
  01f9  55               push bp                                  
  01fa  8bec             mov bp, sp                               
  01fc  83ec08           sub sp, 8                                
  01ff  33d2             xor dx, dx                               
  0201  eb11             jmp 0x214                                
  0203  8bda             mov bx, dx                               
  0205  d1e3             shl bx, 1                                
  0207  b8042c           mov ax, 0x2c04                           
  020a  8ec0             mov es, ax                               
  020c  26c78737010000   mov word ptr es:[bx + 0x137], 0          
  0213  42               inc dx                                   
  0214  83fa08           cmp dx, 8                                
  0217  7cea             jl 0x203                                 
  0219  9a39009f2f       lcall 0x2f9f, 0x39                       -> ovl14:02fb
  021e  6a01             push 1                                   
  0220  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0225  59               pop cx                                   
  0226  16               push ss                                  
  0227  8d46f8           lea ax, [bp - 8]                         
  022a  50               push ax                                  
  022b  9a2f009d30       lcall 0x309d, 0x2f                       -> ovl54:0341
  0230  83c404           add sp, 4                                
  0233  16               push ss                                  
  0234  8d46f8           lea ax, [bp - 8]                         
  0237  50               push ax                                  
  0238  6a03             push 3                                   
  023a  90               nop                                      
  023b  0e               push cs                                  
  023c  e83400           call 0x273                               
  023f  83c406           add sp, 6                                
  0242  6a03             push 3                                   
  0244  90               nop                                      
  0245  0e               push cs                                  
  0246  e8a405           call 0x7ed                               
  0249  59               pop cx                                   
  024a  6a01             push 1                                   
  024c  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  0251  59               pop cx                                   
  0252  9a6100c130       lcall 0x30c1, 0x61                       -> ovl59:01f1
  0257  c7066e160100     mov word ptr [0x166e], 1                 
  025d  c9               leave                                    
  025e  cb               retf                                     

res_08a9_025f:  ; ENTRY
  025f  55               push bp                                  
  0260  8bec             mov bp, sp                               
  0262  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0267  9a2a009d30       lcall 0x309d, 0x2a                       -> ovl54:02d8
  026c  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0271  5d               pop bp                                   
  0272  cb               retf                                     

res_08a9_0273:  ; ENTRY
  0273  55               push bp                                  
  0274  8bec             mov bp, sp                               
  0276  83ec04           sub sp, 4                                
  0279  56               push si                                  
  027a  c41e404c         les bx, ptr [0x4c40]                     
  027e  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0282  268b0f           mov cx, word ptr es:[bx]                 
  0285  eb60             jmp 0x2e7                                
  0287  c41e404c         les bx, ptr [0x4c40]                     
  028b  268b4706         mov ax, word ptr es:[bx + 6]             
  028f  268b5704         mov dx, word ptr es:[bx + 4]             
  0293  8bd9             mov bx, cx                               
  0295  6bdb0e           imul bx, bx, 0xe                         
  0298  03d3             add dx, bx                               
  029a  8946fe           mov word ptr [bp - 2], ax                
  029d  8ec0             mov es, ax                               
  029f  8956fc           mov word ptr [bp - 4], dx                
  02a2  8bda             mov bx, dx                               
  02a4  268b07           mov ax, word ptr es:[bx]                 
  02a7  3b4606           cmp ax, word ptr [bp + 6]                
  02aa  753b             jne 0x2e7                                
  02ac  c45efc           les bx, ptr [bp - 4]                     
  02af  06               push es                                  
  02b0  c47608           les si, ptr [bp + 8]                     
  02b3  268b04           mov ax, word ptr es:[si]                 
  02b6  07               pop es                                   
  02b7  26894704         mov word ptr es:[bx + 4], ax             
  02bb  c45e08           les bx, ptr [bp + 8]                     
  02be  268b4702         mov ax, word ptr es:[bx + 2]             
  02c2  c45efc           les bx, ptr [bp - 4]                     
  02c5  26894706         mov word ptr es:[bx + 6], ax             
  02c9  c45e08           les bx, ptr [bp + 8]                     
  02cc  268b4704         mov ax, word ptr es:[bx + 4]             
  02d0  c45efc           les bx, ptr [bp - 4]                     
  02d3  26894708         mov word ptr es:[bx + 8], ax             
  02d7  c45e08           les bx, ptr [bp + 8]                     
  02da  268b4706         mov ax, word ptr es:[bx + 6]             
  02de  c45efc           les bx, ptr [bp - 4]                     
  02e1  2689470a         mov word ptr es:[bx + 0xa], ax           
  02e5  eb07             jmp 0x2ee                                
  02e7  8bc1             mov ax, cx                               
  02e9  49               dec cx                                   
  02ea  0bc0             or ax, ax                                
  02ec  7599             jne 0x287                                
  02ee  5e               pop si                                   
  02ef  c9               leave                                    
  02f0  cb               retf                                     

res_08a9_02f1:  ; ENTRY
  02f1  55               push bp                                  
  02f2  8bec             mov bp, sp                               
  02f4  83ec04           sub sp, 4                                
  02f7  c41e404c         les bx, ptr [0x4c40]                     
  02fb  268b4702         mov ax, word ptr es:[bx + 2]             
  02ff  268b17           mov dx, word ptr es:[bx]                 
  0302  8b1e3c4c         mov bx, word ptr [0x4c3c]                
  0306  6bdb21           imul bx, bx, 0x21                        
  0309  03d3             add dx, bx                               
  030b  8946fe           mov word ptr [bp - 2], ax                
  030e  8956fc           mov word ptr [bp - 4], dx                
  0311  90               nop                                      
  0312  0e               push cs                                  
  0313  e84004           call 0x756                               
  0316  3b063c4c         cmp ax, word ptr [0x4c3c]                
  031a  7515             jne 0x331                                
  031c  6a00             push 0                                   
  031e  c45efc           les bx, ptr [bp - 4]                     
  0321  26ff37           push word ptr es:[bx]                    
  0324  90               nop                                      
  0325  0e               push cs                                  
  0326  e84503           call 0x66e                               
  0329  83c404           add sp, 4                                
  032c  b80100           mov ax, 1                                
  032f  eb12             jmp 0x343                                
  0331  6a01             push 1                                   
  0333  c45efc           les bx, ptr [bp - 4]                     
  0336  26ff37           push word ptr es:[bx]                    
  0339  90               nop                                      
  033a  0e               push cs                                  
  033b  e83003           call 0x66e                               
  033e  83c404           add sp, 4                                
  0341  33c0             xor ax, ax                               
  0343  c9               leave                                    
  0344  cb               retf                                     

res_08a9_0345:  ; ENTRY
  0345  55               push bp                                  
  0346  8bec             mov bp, sp                               
  0348  83ec04           sub sp, 4                                
  034b  c41e404c         les bx, ptr [0x4c40]                     
  034f  26c45f08         les bx, ptr es:[bx + 8]                  
  0353  268b0f           mov cx, word ptr es:[bx]                 
  0356  eb29             jmp 0x381                                
  0358  c41e404c         les bx, ptr [0x4c40]                     
  035c  268b4702         mov ax, word ptr es:[bx + 2]             
  0360  268b17           mov dx, word ptr es:[bx]                 
  0363  8bd9             mov bx, cx                               
  0365  6bdb21           imul bx, bx, 0x21                        
  0368  03d3             add dx, bx                               
  036a  8946fe           mov word ptr [bp - 2], ax                
  036d  8ec0             mov es, ax                               
  036f  8956fc           mov word ptr [bp - 4], dx                
  0372  8bda             mov bx, dx                               
  0374  26c6470500       mov byte ptr es:[bx + 5], 0              
  0379  c45efc           les bx, ptr [bp - 4]                     
  037c  26c6470400       mov byte ptr es:[bx + 4], 0              
  0381  8bc1             mov ax, cx                               
  0383  49               dec cx                                   
  0384  0bc0             or ax, ax                                
  0386  75d0             jne 0x358                                
  0388  c41e404c         les bx, ptr [0x4c40]                     
  038c  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0390  268b0f           mov cx, word ptr es:[bx]                 
  0393  eb15             jmp 0x3aa                                
  0395  c41e404c         les bx, ptr [0x4c40]                     
  0399  26c45f04         les bx, ptr es:[bx + 4]                  
  039d  8bc1             mov ax, cx                               
  039f  6bc00e           imul ax, ax, 0xe                         
  03a2  03d8             add bx, ax                               
  03a4  26c747020000     mov word ptr es:[bx + 2], 0              
  03aa  8bc1             mov ax, cx                               
  03ac  49               dec cx                                   
  03ad  0bc0             or ax, ax                                
  03af  75e4             jne 0x395                                
  03b1  c9               leave                                    
  03b2  cb               retf                                     

res_08a9_03b3:  ; ENTRY
  03b3  55               push bp                                  
  03b4  8bec             mov bp, sp                               
  03b6  33d2             xor dx, dx                               
  03b8  eb2c             jmp 0x3e6                                
  03ba  c41e404c         les bx, ptr [0x4c40]                     
  03be  26c41f           les bx, ptr es:[bx]                      
  03c1  8bc2             mov ax, dx                               
  03c3  6bc021           imul ax, ax, 0x21                        
  03c6  03d8             add bx, ax                               
  03c8  268b07           mov ax, word ptr es:[bx]                 
  03cb  3b4606           cmp ax, word ptr [bp + 6]                
  03ce  7515             jne 0x3e5                                
  03d0  c41e404c         les bx, ptr [0x4c40]                     
  03d4  26c41f           les bx, ptr es:[bx]                      
  03d7  8bc2             mov ax, dx                               
  03d9  6bc021           imul ax, ax, 0x21                        
  03dc  03d8             add bx, ax                               
  03de  26c6470500       mov byte ptr es:[bx + 5], 0              
  03e3  eb0e             jmp 0x3f3                                
  03e5  42               inc dx                                   
  03e6  c41e404c         les bx, ptr [0x4c40]                     
  03ea  26c45f08         les bx, ptr es:[bx + 8]                  
  03ee  263917           cmp word ptr es:[bx], dx                 
  03f1  7fc7             jg 0x3ba                                 
  03f3  5d               pop bp                                   
  03f4  cb               retf                                     

res_08a9_03f5:  ; ENTRY
  03f5  55               push bp                                  
  03f6  8bec             mov bp, sp                               
  03f8  33d2             xor dx, dx                               
  03fa  eb1b             jmp 0x417                                
  03fc  c41e404c         les bx, ptr [0x4c40]                     
  0400  26c41f           les bx, ptr es:[bx]                      
  0403  8bc2             mov ax, dx                               
  0405  6bc021           imul ax, ax, 0x21                        
  0408  03d8             add bx, ax                               
  040a  268b07           mov ax, word ptr es:[bx]                 
  040d  3b4606           cmp ax, word ptr [bp + 6]                
  0410  7504             jne 0x416                                
  0412  8bc2             mov ax, dx                               
  0414  eb10             jmp 0x426                                
  0416  42               inc dx                                   
  0417  c41e404c         les bx, ptr [0x4c40]                     
  041b  26c45f08         les bx, ptr es:[bx + 8]                  
  041f  263917           cmp word ptr es:[bx], dx                 
  0422  7fd8             jg 0x3fc                                 
  0424  33c0             xor ax, ax                               
  0426  5d               pop bp                                   
  0427  cb               retf                                     
  0428  55               push bp                                  
  0429  8bec             mov bp, sp                               
  042b  8b4e08           mov cx, word ptr [bp + 8]                
  042e  33d2             xor dx, dx                               
  0430  eb52             jmp 0x484                                
  0432  c41e404c         les bx, ptr [0x4c40]                     
  0436  26c41f           les bx, ptr es:[bx]                      
  0439  8bc2             mov ax, dx                               
  043b  6bc021           imul ax, ax, 0x21                        
  043e  03d8             add bx, ax                               
  0440  268b07           mov ax, word ptr es:[bx]                 
  0443  3b4606           cmp ax, word ptr [bp + 6]                
  0446  753b             jne 0x483                                
  0448  c41e404c         les bx, ptr [0x4c40]                     
  044c  26c41f           les bx, ptr es:[bx]                      
  044f  8bc2             mov ax, dx                               
  0451  6bc021           imul ax, ax, 0x21                        
  0454  03d8             add bx, ax                               
  0456  26394f02         cmp word ptr es:[bx + 2], cx             
  045a  7435             je 0x491                                 
  045c  c41e404c         les bx, ptr [0x4c40]                     
  0460  26c41f           les bx, ptr es:[bx]                      
  0463  8bc2             mov ax, dx                               
  0465  6bc021           imul ax, ax, 0x21                        
  0468  03d8             add bx, ax                               
  046a  26894f02         mov word ptr es:[bx + 2], cx             
  046e  c41e404c         les bx, ptr [0x4c40]                     
  0472  26c41f           les bx, ptr es:[bx]                      
  0475  8bc2             mov ax, dx                               
  0477  6bc021           imul ax, ax, 0x21                        
  047a  03d8             add bx, ax                               
  047c  26c6470500       mov byte ptr es:[bx + 5], 0              
  0481  eb0e             jmp 0x491                                
  0483  42               inc dx                                   
  0484  c41e404c         les bx, ptr [0x4c40]                     
  0488  26c45f08         les bx, ptr es:[bx + 8]                  
  048c  263917           cmp word ptr es:[bx], dx                 
  048f  7fa1             jg 0x432                                 
  0491  5d               pop bp                                   
  0492  cb               retf                                     
  0493  55               push bp                                  
  0494  8bec             mov bp, sp                               
  0496  33c9             xor cx, cx                               
  0498  eb68             jmp 0x502                                
  049a  c41e404c         les bx, ptr [0x4c40]                     
  049e  26c41f           les bx, ptr es:[bx]                      
  04a1  8bc1             mov ax, cx                               
  04a3  6bc021           imul ax, ax, 0x21                        
  04a6  03d8             add bx, ax                               
  04a8  268b07           mov ax, word ptr es:[bx]                 
  04ab  3b4606           cmp ax, word ptr [bp + 6]                
  04ae  7551             jne 0x501                                
  04b0  c41e404c         les bx, ptr [0x4c40]                     
  04b4  26c41f           les bx, ptr es:[bx]                      
  04b7  8bc1             mov ax, cx                               
  04b9  6bc021           imul ax, ax, 0x21                        
  04bc  03d8             add bx, ax                               
  04be  268b470e         mov ax, word ptr es:[bx + 0xe]           
  04c2  268b570c         mov dx, word ptr es:[bx + 0xc]           
  04c6  3b460a           cmp ax, word ptr [bp + 0xa]              
  04c9  7505             jne 0x4d0                                
  04cb  3b5608           cmp dx, word ptr [bp + 8]                
  04ce  743f             je 0x50f                                 
  04d0  c41e404c         les bx, ptr [0x4c40]                     
  04d4  26c41f           les bx, ptr es:[bx]                      
  04d7  8bc1             mov ax, cx                               
  04d9  6bc021           imul ax, ax, 0x21                        
  04dc  03d8             add bx, ax                               
  04de  8b460a           mov ax, word ptr [bp + 0xa]              
  04e1  8b5608           mov dx, word ptr [bp + 8]                
  04e4  2689470e         mov word ptr es:[bx + 0xe], ax           
  04e8  2689570c         mov word ptr es:[bx + 0xc], dx           
  04ec  c41e404c         les bx, ptr [0x4c40]                     
  04f0  26c41f           les bx, ptr es:[bx]                      
  04f3  8bc1             mov ax, cx                               
  04f5  6bc021           imul ax, ax, 0x21                        
  04f8  03d8             add bx, ax                               
  04fa  26c6470500       mov byte ptr es:[bx + 5], 0              
  04ff  eb0e             jmp 0x50f                                
  0501  41               inc cx                                   
  0502  c41e404c         les bx, ptr [0x4c40]                     
  0506  26c45f08         les bx, ptr es:[bx + 8]                  
  050a  26390f           cmp word ptr es:[bx], cx                 
  050d  7f8b             jg 0x49a                                 
  050f  5d               pop bp                                   
  0510  cb               retf                                     
  0511  55               push bp                                  
  0512  8bec             mov bp, sp                               
  0514  33d2             xor dx, dx                               
  0516  eb2b             jmp 0x543                                
  0518  c41e404c         les bx, ptr [0x4c40]                     
  051c  26c41f           les bx, ptr es:[bx]                      
  051f  8bc2             mov ax, dx                               
  0521  6bc021           imul ax, ax, 0x21                        
  0524  03d8             add bx, ax                               
  0526  268b07           mov ax, word ptr es:[bx]                 
  0529  3b4606           cmp ax, word ptr [bp + 6]                
  052c  7514             jne 0x542                                
  052e  c41e404c         les bx, ptr [0x4c40]                     
  0532  26c41f           les bx, ptr es:[bx]                      
  0535  8bc2             mov ax, dx                               
  0537  6bc021           imul ax, ax, 0x21                        
  053a  03d8             add bx, ax                               
  053c  268b4702         mov ax, word ptr es:[bx + 2]             
  0540  eb10             jmp 0x552                                
  0542  42               inc dx                                   
  0543  c41e404c         les bx, ptr [0x4c40]                     
  0547  26c45f08         les bx, ptr es:[bx + 8]                  
  054b  263917           cmp word ptr es:[bx], dx                 
  054e  7fc8             jg 0x518                                 
  0550  33c0             xor ax, ax                               
  0552  5d               pop bp                                   
  0553  cb               retf                                     
  0554  55               push bp                                  
  0555  8bec             mov bp, sp                               
  0557  33d2             xor dx, dx                               
  0559  eb41             jmp 0x59c                                
  055b  c41e404c         les bx, ptr [0x4c40]                     
  055f  26c41f           les bx, ptr es:[bx]                      
  0562  8bc2             mov ax, dx                               
  0564  6bc021           imul ax, ax, 0x21                        
  0567  03d8             add bx, ax                               
  0569  268b07           mov ax, word ptr es:[bx]                 
  056c  3b4606           cmp ax, word ptr [bp + 6]                
  056f  752a             jne 0x59b                                
  0571  c41e404c         les bx, ptr [0x4c40]                     
  0575  26c41f           les bx, ptr es:[bx]                      
  0578  8bc2             mov ax, dx                               
  057a  6bc021           imul ax, ax, 0x21                        
  057d  03d8             add bx, ax                               
  057f  8a4608           mov al, byte ptr [bp + 8]                
  0582  26884704         mov byte ptr es:[bx + 4], al             
  0586  c41e404c         les bx, ptr [0x4c40]                     
  058a  26c41f           les bx, ptr es:[bx]                      
  058d  8bc2             mov ax, dx                               
  058f  6bc021           imul ax, ax, 0x21                        
  0592  03d8             add bx, ax                               
  0594  26c6470501       mov byte ptr es:[bx + 5], 1              
  0599  eb0e             jmp 0x5a9                                
  059b  42               inc dx                                   
  059c  c41e404c         les bx, ptr [0x4c40]                     
  05a0  26c45f08         les bx, ptr es:[bx + 8]                  
  05a4  263917           cmp word ptr es:[bx], dx                 
  05a7  7fb2             jg 0x55b                                 
  05a9  5d               pop bp                                   
  05aa  cb               retf                                     

res_08a9_05ab:  ; ENTRY
  05ab  55               push bp                                  
  05ac  8bec             mov bp, sp                               
  05ae  33d2             xor dx, dx                               
  05b0  eb2d             jmp 0x5df                                
  05b2  c41e404c         les bx, ptr [0x4c40]                     
  05b6  26c41f           les bx, ptr es:[bx]                      
  05b9  8bc2             mov ax, dx                               
  05bb  6bc021           imul ax, ax, 0x21                        
  05be  03d8             add bx, ax                               
  05c0  268b07           mov ax, word ptr es:[bx]                 
  05c3  3b4606           cmp ax, word ptr [bp + 6]                
  05c6  7516             jne 0x5de                                
  05c8  c41e404c         les bx, ptr [0x4c40]                     
  05cc  26c41f           les bx, ptr es:[bx]                      
  05cf  8bc2             mov ax, dx                               
  05d1  6bc021           imul ax, ax, 0x21                        
  05d4  03d8             add bx, ax                               
  05d6  268a4704         mov al, byte ptr es:[bx + 4]             
  05da  b400             mov ah, 0                                
  05dc  eb10             jmp 0x5ee                                
  05de  42               inc dx                                   
  05df  c41e404c         les bx, ptr [0x4c40]                     
  05e3  26c45f08         les bx, ptr es:[bx + 8]                  
  05e7  263917           cmp word ptr es:[bx], dx                 
  05ea  7fc6             jg 0x5b2                                 
  05ec  33c0             xor ax, ax                               
  05ee  5d               pop bp                                   
  05ef  cb               retf                                     

res_08a9_05f0:  ; ENTRY
  05f0  55               push bp                                  
  05f1  8bec             mov bp, sp                               
  05f3  83ec04           sub sp, 4                                
  05f6  33c9             xor cx, cx                               
  05f8  eb65             jmp 0x65f                                
  05fa  c41e404c         les bx, ptr [0x4c40]                     
  05fe  26c41f           les bx, ptr es:[bx]                      
  0601  8bc1             mov ax, cx                               
  0603  6bc021           imul ax, ax, 0x21                        
  0606  03d8             add bx, ax                               
  0608  268b07           mov ax, word ptr es:[bx]                 
  060b  3b4606           cmp ax, word ptr [bp + 6]                
  060e  754e             jne 0x65e                                
  0610  c41e404c         les bx, ptr [0x4c40]                     
  0614  268b4702         mov ax, word ptr es:[bx + 2]             
  0618  268b17           mov dx, word ptr es:[bx]                 
  061b  8bd9             mov bx, cx                               
  061d  6bdb21           imul bx, bx, 0x21                        
  0620  03d3             add dx, bx                               
  0622  8946fe           mov word ptr [bp - 2], ax                
  0625  8956fc           mov word ptr [bp - 4], dx                
  0628  8b1e404c         mov bx, word ptr [0x4c40]                
  062c  26c41f           les bx, ptr es:[bx]                      
  062f  8bc1             mov ax, cx                               
  0631  6bc021           imul ax, ax, 0x21                        
  0634  03d8             add bx, ax                               
  0636  8a4608           mov al, byte ptr [bp + 8]                
  0639  26884704         mov byte ptr es:[bx + 4], al             
  063d  c41e404c         les bx, ptr [0x4c40]                     
  0641  26c41f           les bx, ptr es:[bx]                      
  0644  8bc1             mov ax, cx                               
  0646  6bc021           imul ax, ax, 0x21                        
  0649  03d8             add bx, ax                               
  064b  26c6470501       mov byte ptr es:[bx + 5], 1              
  0650  ff76fe           push word ptr [bp - 2]                   
  0653  52               push dx                                  
  0654  9a05000a0a       lcall 0xa0a, 5                           -> 0a0a:0005
  0659  83c404           add sp, 4                                
  065c  eb0e             jmp 0x66c                                
  065e  41               inc cx                                   
  065f  c41e404c         les bx, ptr [0x4c40]                     
  0663  26c45f08         les bx, ptr es:[bx + 8]                  
  0667  26390f           cmp word ptr es:[bx], cx                 
  066a  7f8e             jg 0x5fa                                 
  066c  c9               leave                                    
  066d  cb               retf                                     

res_08a9_066e:  ; ENTRY
  066e  55               push bp                                  
  066f  8bec             mov bp, sp                               
  0671  83ec04           sub sp, 4                                
  0674  33c9             xor cx, cx                               
  0676  eb78             jmp 0x6f0                                
  0678  c41e404c         les bx, ptr [0x4c40]                     
  067c  26c41f           les bx, ptr es:[bx]                      
  067f  8bc1             mov ax, cx                               
  0681  6bc021           imul ax, ax, 0x21                        
  0684  03d8             add bx, ax                               
  0686  268b07           mov ax, word ptr es:[bx]                 
  0689  3b4606           cmp ax, word ptr [bp + 6]                
  068c  7561             jne 0x6ef                                
  068e  c41e404c         les bx, ptr [0x4c40]                     
  0692  268b4702         mov ax, word ptr es:[bx + 2]             
  0696  268b17           mov dx, word ptr es:[bx]                 
  0699  8bd9             mov bx, cx                               
  069b  6bdb21           imul bx, bx, 0x21                        
  069e  03d3             add dx, bx                               
  06a0  8946fe           mov word ptr [bp - 2], ax                
  06a3  8956fc           mov word ptr [bp - 4], dx                
  06a6  c45efc           les bx, ptr [bp - 4]                     
  06a9  268a4704         mov al, byte ptr es:[bx + 4]             
  06ad  3a4608           cmp al, byte ptr [bp + 8]                
  06b0  7507             jne 0x6b9                                
  06b2  26807f0501       cmp byte ptr es:[bx + 5], 1              
  06b7  7447             je 0x700                                 
  06b9  c41e404c         les bx, ptr [0x4c40]                     
  06bd  26c41f           les bx, ptr es:[bx]                      
  06c0  8bc1             mov ax, cx                               
  06c2  6bc021           imul ax, ax, 0x21                        
  06c5  03d8             add bx, ax                               
  06c7  8a4608           mov al, byte ptr [bp + 8]                
  06ca  26884704         mov byte ptr es:[bx + 4], al             
  06ce  c41e404c         les bx, ptr [0x4c40]                     
  06d2  26c41f           les bx, ptr es:[bx]                      
  06d5  8bc1             mov ax, cx                               
  06d7  6bc021           imul ax, ax, 0x21                        
  06da  03d8             add bx, ax                               
  06dc  26c6470501       mov byte ptr es:[bx + 5], 1              
  06e1  66ff76fc         push dword ptr [bp - 4]                  
  06e5  9a05000a0a       lcall 0xa0a, 5                           -> 0a0a:0005
  06ea  83c404           add sp, 4                                
  06ed  eb11             jmp 0x700                                
  06ef  41               inc cx                                   
  06f0  c41e404c         les bx, ptr [0x4c40]                     
  06f4  26c45f08         les bx, ptr es:[bx + 8]                  
  06f8  26390f           cmp word ptr es:[bx], cx                 
  06fb  7e03             jle 0x700                                
  06fd  e978ff           jmp 0x678                                
  0700  c9               leave                                    
  0701  cb               retf                                     
  0702  55               push bp                                  
  0703  8bec             mov bp, sp                               
  0705  83ec04           sub sp, 4                                
  0708  33c9             xor cx, cx                               
  070a  eb3b             jmp 0x747                                
  070c  c41e404c         les bx, ptr [0x4c40]                     
  0710  26c41f           les bx, ptr es:[bx]                      
  0713  8bc1             mov ax, cx                               
  0715  6bc021           imul ax, ax, 0x21                        
  0718  03d8             add bx, ax                               
  071a  268b07           mov ax, word ptr es:[bx]                 
  071d  3b4606           cmp ax, word ptr [bp + 6]                
  0720  7524             jne 0x746                                
  0722  c41e404c         les bx, ptr [0x4c40]                     
  0726  268b4702         mov ax, word ptr es:[bx + 2]             
  072a  268b17           mov dx, word ptr es:[bx]                 
  072d  8bd9             mov bx, cx                               
  072f  6bdb21           imul bx, bx, 0x21                        
  0732  03d3             add dx, bx                               
  0734  8946fe           mov word ptr [bp - 2], ax                
  0737  8956fc           mov word ptr [bp - 4], dx                
  073a  50               push ax                                  
  073b  52               push dx                                  
  073c  9a05000a0a       lcall 0xa0a, 5                           -> 0a0a:0005
  0741  83c404           add sp, 4                                
  0744  eb0e             jmp 0x754                                
  0746  41               inc cx                                   
  0747  c41e404c         les bx, ptr [0x4c40]                     
  074b  26c45f08         les bx, ptr es:[bx + 8]                  
  074f  26390f           cmp word ptr es:[bx], cx                 
  0752  7fb8             jg 0x70c                                 
  0754  c9               leave                                    
  0755  cb               retf                                     

res_08a9_0756:  ; ENTRY
  0756  55               push bp                                  
  0757  8bec             mov bp, sp                               
  0759  83ec0c           sub sp, 0xc                              
  075c  56               push si                                  
  075d  9a0400bf12       lcall 0x12bf, 4                          -> 12bf:0004
  0762  0bc0             or ax, ax                                
  0764  7503             jne 0x769                                
  0766  e97f00           jmp 0x7e8                                
  0769  c41e404c         les bx, ptr [0x4c40]                     
  076d  26c45f08         les bx, ptr es:[bx + 8]                  
  0771  268b37           mov si, word ptr es:[bx]                 
  0774  eb6b             jmp 0x7e1                                
  0776  c41e404c         les bx, ptr [0x4c40]                     
  077a  268b4702         mov ax, word ptr es:[bx + 2]             
  077e  268b17           mov dx, word ptr es:[bx]                 
  0781  8bde             mov bx, si                               
  0783  6bdb21           imul bx, bx, 0x21                        
  0786  03d3             add dx, bx                               
  0788  8946fe           mov word ptr [bp - 2], ax                
  078b  8ec0             mov es, ax                               
  078d  8956fc           mov word ptr [bp - 4], dx                
  0790  8bda             mov bx, dx                               
  0792  26807f0500       cmp byte ptr es:[bx + 5], 0              
  0797  7448             je 0x7e1                                 
  0799  c45efc           les bx, ptr [bp - 4]                     
  079c  268a470b         mov al, byte ptr es:[bx + 0xb]           
  07a0  b400             mov ah, 0                                
  07a2  50               push ax                                  
  07a3  268a470a         mov al, byte ptr es:[bx + 0xa]           
  07a7  b400             mov ah, 0                                
  07a9  50               push ax                                  
  07aa  26ff7708         push word ptr es:[bx + 8]                
  07ae  26ff7706         push word ptr es:[bx + 6]                
  07b2  16               push ss                                  
  07b3  8d46f4           lea ax, [bp - 0xc]                       
  07b6  50               push ax                                  
  07b7  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  07bc  83c40c           add sp, 0xc                              
  07bf  16               push ss                                  
  07c0  8d46f4           lea ax, [bp - 0xc]                       
  07c3  50               push ax                                  
  07c4  9a3701b014       lcall 0x14b0, 0x137                      -> 14b0:0137
  07c9  83c404           add sp, 4                                
  07cc  16               push ss                                  
  07cd  8d46f4           lea ax, [bp - 0xc]                       
  07d0  50               push ax                                  
  07d1  9ab108bf12       lcall 0x12bf, 0x8b1                      -> 12bf:08b1
  07d6  83c404           add sp, 4                                
  07d9  0bc0             or ax, ax                                
  07db  7404             je 0x7e1                                 
  07dd  8bc6             mov ax, si                               
  07df  eb09             jmp 0x7ea                                
  07e1  8bc6             mov ax, si                               
  07e3  4e               dec si                                   
  07e4  0bc0             or ax, ax                                
  07e6  758e             jne 0x776                                
  07e8  33c0             xor ax, ax                               
  07ea  5e               pop si                                   
  07eb  c9               leave                                    
  07ec  cb               retf                                     

res_08a9_07ed:  ; ENTRY
  07ed  55               push bp                                  
  07ee  8bec             mov bp, sp                               
  07f0  83ec04           sub sp, 4                                
  07f3  c41e404c         les bx, ptr [0x4c40]                     
  07f7  26c45f0c         les bx, ptr es:[bx + 0xc]                
  07fb  268b0f           mov cx, word ptr es:[bx]                 
  07fe  eb30             jmp 0x830                                
  0800  c41e404c         les bx, ptr [0x4c40]                     
  0804  268b4706         mov ax, word ptr es:[bx + 6]             
  0808  268b5704         mov dx, word ptr es:[bx + 4]             
  080c  8bd9             mov bx, cx                               
  080e  6bdb0e           imul bx, bx, 0xe                         
  0811  03d3             add dx, bx                               
  0813  8946fe           mov word ptr [bp - 2], ax                
  0816  8ec0             mov es, ax                               
  0818  8956fc           mov word ptr [bp - 4], dx                
  081b  8bda             mov bx, dx                               
  081d  268b07           mov ax, word ptr es:[bx]                 
  0820  3b4606           cmp ax, word ptr [bp + 6]                
  0823  750b             jne 0x830                                
  0825  c45efc           les bx, ptr [bp - 4]                     
  0828  26c747020100     mov word ptr es:[bx + 2], 1              
  082e  eb07             jmp 0x837                                
  0830  8bc1             mov ax, cx                               
  0832  49               dec cx                                   
  0833  0bc0             or ax, ax                                
  0835  75c9             jne 0x800                                
  0837  c9               leave                                    
  0838  cb               retf                                     

res_08a9_0839:  ; ENTRY
  0839  55               push bp                                  
  083a  8bec             mov bp, sp                               
  083c  83ec04           sub sp, 4                                
  083f  c41e404c         les bx, ptr [0x4c40]                     
  0843  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0847  268b0f           mov cx, word ptr es:[bx]                 
  084a  eb30             jmp 0x87c                                
  084c  c41e404c         les bx, ptr [0x4c40]                     
  0850  268b4706         mov ax, word ptr es:[bx + 6]             
  0854  268b5704         mov dx, word ptr es:[bx + 4]             
  0858  8bd9             mov bx, cx                               
  085a  6bdb0e           imul bx, bx, 0xe                         
  085d  03d3             add dx, bx                               
  085f  8946fe           mov word ptr [bp - 2], ax                
  0862  8ec0             mov es, ax                               
  0864  8956fc           mov word ptr [bp - 4], dx                
  0867  8bda             mov bx, dx                               
  0869  268b07           mov ax, word ptr es:[bx]                 
  086c  3b4606           cmp ax, word ptr [bp + 6]                
  086f  750b             jne 0x87c                                
  0871  c45efc           les bx, ptr [bp - 4]                     
  0874  26c747020000     mov word ptr es:[bx + 2], 0              
  087a  eb07             jmp 0x883                                
  087c  8bc1             mov ax, cx                               
  087e  49               dec cx                                   
  087f  0bc0             or ax, ax                                
  0881  75c9             jne 0x84c                                
  0883  c9               leave                                    
  0884  cb               retf                                     

res_08a9_0885:  ; ENTRY
  0885  55               push bp                                  
  0886  8bec             mov bp, sp                               
  0888  90               nop                                      
  0889  0e               push cs                                  
  088a  e80900           call 0x896                               
  088d  50               push ax                                  
  088e  9a6f03bf12       lcall 0x12bf, 0x36f                      -> 12bf:036f
  0893  59               pop cx                                   
  0894  5d               pop bp                                   
  0895  cb               retf                                     

res_08a9_0896:  ; ENTRY
  0896  55               push bp                                  
  0897  8bec             mov bp, sp                               
  0899  83ec10           sub sp, 0x10                             
  089c  56               push si                                  
  089d  57               push di                                  
  089e  16               push ss                                  
  089f  8d46fc           lea ax, [bp - 4]                         
  08a2  50               push ax                                  
  08a3  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  08a8  83c404           add sp, 4                                
  08ab  833e003700       cmp word ptr [0x3700], 0                 
  08b0  7403             je 0x8b5                                 
  08b2  e96a04           jmp 0xd1f                                
  08b5  833e761100       cmp word ptr [0x1176], 0                 
  08ba  7406             je 0x8c2                                 
  08bc  b80400           mov ax, 4                                
  08bf  e95f04           jmp 0xd21                                
  08c2  833e721100       cmp word ptr [0x1172], 0                 
  08c7  7403             je 0x8cc                                 
  08c9  e99503           jmp 0xc61                                
  08cc  833e6a1600       cmp word ptr [0x166a], 0                 
  08d1  7403             je 0x8d6                                 
  08d3  e94904           jmp 0xd1f                                
  08d6  833e862a00       cmp word ptr [0x2a86], 0                 
  08db  7503             jne 0x8e0                                
  08dd  e93f04           jmp 0xd1f                                
  08e0  b8042c           mov ax, 0x2c04                           
  08e3  8ec0             mov es, ax                               
  08e5  268b1e1001       mov bx, word ptr es:[0x110]              
  08ea  d1e3             shl bx, 1                                
  08ec  b8042c           mov ax, 0x2c04                           
  08ef  8ec0             mov es, ax                               
  08f1  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  08f7  7403             je 0x8fc                                 
  08f9  e92304           jmp 0xd1f                                
  08fc  16               push ss                                  
  08fd  8d46fc           lea ax, [bp - 4]                         
  0900  50               push ax                                  
  0901  1e               push ds                                  
  0902  68a82a           push 0x2aa8                              
  0905  9ab8006d11       lcall 0x116d, 0xb8                       -> 116d:00b8
  090a  83c408           add sp, 8                                
  090d  0bc0             or ax, ax                                
  090f  7415             je 0x926                                 
  0911  33c0             xor ax, ax                               
  0913  8ec0             mov es, ax                               
  0915  26f606170408     test byte ptr es:[0x417], 8              
  091b  7403             je 0x920                                 
  091d  e94103           jmp 0xc61                                
  0920  b80100           mov ax, 1                                
  0923  e9fb03           jmp 0xd21                                
  0926  16               push ss                                  
  0927  8d46fc           lea ax, [bp - 4]                         
  092a  50               push ax                                  
  092b  1e               push ds                                  
  092c  68b02a           push 0x2ab0                              
  092f  9ab8006d11       lcall 0x116d, 0xb8                       -> 116d:00b8
  0934  83c408           add sp, 8                                
  0937  0bc0             or ax, ax                                
  0939  7503             jne 0x93e                                
  093b  e9c903           jmp 0xd07                                
  093e  8b46fc           mov ax, word ptr [bp - 4]                
  0941  05f0ff           add ax, 0xfff0                           
  0944  bb2800           mov bx, 0x28                             
  0947  99               cdq                                      
  0948  f7fb             idiv bx                                  
  094a  ba042c           mov dx, 0x2c04                           
  094d  8ec2             mov es, dx                               
  094f  268b167701       mov dx, word ptr es:[0x177]              
  0954  03d0             add dx, ax                               
  0956  8956fa           mov word ptr [bp - 6], dx                
  0959  8b46fe           mov ax, word ptr [bp - 2]                
  095c  05e2ff           add ax, 0xffe2                           
  095f  99               cdq                                      
  0960  f7fb             idiv bx                                  
  0962  ba042c           mov dx, 0x2c04                           
  0965  8ec2             mov es, dx                               
  0967  268b167501       mov dx, word ptr es:[0x175]              
  096c  03d0             add dx, ax                               
  096e  8956f8           mov word ptr [bp - 8], dx                
  0971  8b5ef8           mov bx, word ptr [bp - 8]                
  0974  69dbe000         imul bx, bx, 0xe0                        
  0978  8b46fa           mov ax, word ptr [bp - 6]                
  097b  d1e0             shl ax, 1                                
  097d  03d8             add bx, ax                               
  097f  b81d1e           mov ax, 0x1e1d                           
  0982  8ec0             mov es, ax                               
  0984  268a870100       mov al, byte ptr es:[bx + 1]             
  0989  250f00           and ax, 0xf                              
  098c  8946f6           mov word ptr [bp - 0xa], ax              
  098f  8b5ef8           mov bx, word ptr [bp - 8]                
  0992  69dbe000         imul bx, bx, 0xe0                        
  0996  8b46fa           mov ax, word ptr [bp - 6]                
  0999  d1e0             shl ax, 1                                
  099b  03d8             add bx, ax                               
  099d  b81d1e           mov ax, 0x1e1d                           
  09a0  8ec0             mov es, ax                               
  09a2  268a9f0000       mov bl, byte ptr es:[bx]                 
  09a7  81e3ff00         and bx, 0xff                             
  09ab  b8042c           mov ax, 0x2c04                           
  09ae  8ec0             mov es, ax                               
  09b0  268a871007       mov al, byte ptr es:[bx + 0x710]         
  09b5  98               cwde                                     
  09b6  8bf8             mov di, ax                               
  09b8  66833e625e00     cmp dword ptr [0x5e62], 0                
  09be  7419             je 0x9d9                                 
  09c0  c41e625e         les bx, ptr [0x5e62]                     
  09c4  26ff7702         push word ptr es:[bx + 2]                
  09c8  26ff37           push word ptr es:[bx]                    
  09cb  52               push dx                                  
  09cc  ff76fa           push word ptr [bp - 6]                   
  09cf  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  09d4  83c408           add sp, 8                                
  09d7  eb02             jmp 0x9db                                
  09d9  33c0             xor ax, ax                               
  09db  8946f4           mov word ptr [bp - 0xc], ax              
  09de  66833e625e00     cmp dword ptr [0x5e62], 0                
  09e4  7432             je 0xa18                                 
  09e6  c41e625e         les bx, ptr [0x5e62]                     
  09ea  268b5f02         mov bx, word ptr es:[bx + 2]             
  09ee  69dbe000         imul bx, bx, 0xe0                        
  09f2  8b36625e         mov si, word ptr [0x5e62]                
  09f6  268b04           mov ax, word ptr es:[si]                 
  09f9  d1e0             shl ax, 1                                
  09fb  03d8             add bx, ax                               
  09fd  b81d1e           mov ax, 0x1e1d                           
  0a00  8ec0             mov es, ax                               
  0a02  268a9f0000       mov bl, byte ptr es:[bx]                 
  0a07  81e3ff00         and bx, 0xff                             
  0a0b  b8042c           mov ax, 0x2c04                           
  0a0e  8ec0             mov es, ax                               
  0a10  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0a15  98               cwde                                     
  0a16  eb03             jmp 0xa1b                                
  0a18  b80700           mov ax, 7                                
  0a1b  8bf0             mov si, ax                               
  0a1d  8b5ef8           mov bx, word ptr [bp - 8]                
  0a20  69dbe000         imul bx, bx, 0xe0                        
  0a24  8b46fa           mov ax, word ptr [bp - 6]                
  0a27  d1e0             shl ax, 1                                
  0a29  03d8             add bx, ax                               
  0a2b  b81d1e           mov ax, 0x1e1d                           
  0a2e  8ec0             mov es, ax                               
  0a30  268a870100       mov al, byte ptr es:[bx + 1]             
  0a35  c1e804           shr ax, 4                                
  0a38  250100           and ax, 1                                
  0a3b  8946f2           mov word ptr [bp - 0xe], ax              
  0a3e  ff76f8           push word ptr [bp - 8]                   
  0a41  ff76fa           push word ptr [bp - 6]                   
  0a44  6a01             push 1                                   
  0a46  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  0a4b  83c406           add sp, 6                                
  0a4e  8946f0           mov word ptr [bp - 0x10], ax             
  0a51  66833e625e00     cmp dword ptr [0x5e62], 0                
  0a57  7411             je 0xa6a                                 
  0a59  833efc5d02       cmp word ptr [0x5dfc], 2                 
  0a5e  740a             je 0xa6a                                 
  0a60  8bdf             mov bx, di                               
  0a62  d1e3             shl bx, 1                                
  0a64  8b877412         mov ax, word ptr [bx + 0x1274]           
  0a68  eb03             jmp 0xa6d                                
  0a6a  b80100           mov ax, 1                                
  0a6d  8bd0             mov dx, ax                               
  0a6f  8b5ef8           mov bx, word ptr [bp - 8]                
  0a72  6bdb70           imul bx, bx, 0x70                        
  0a75  035efa           add bx, word ptr [bp - 6]                
  0a78  b8d919           mov ax, 0x19d9                           
  0a7b  8ec0             mov es, ax                               
  0a7d  268a870000       mov al, byte ptr es:[bx]                 
  0a82  251f00           and ax, 0x1f                             
  0a85  0bc0             or ax, ax                                
  0a87  7403             je 0xa8c                                 
  0a89  ba0100           mov dx, 1                                
  0a8c  837ef000         cmp word ptr [bp - 0x10], 0              
  0a90  7503             jne 0xa95                                
  0a92  e927fe           jmp 0x8bc                                
  0a95  0bd2             or dx, dx                                
  0a97  7f03             jg 0xa9c                                 
  0a99  e920fe           jmp 0x8bc                                
  0a9c  33c0             xor ax, ax                               
  0a9e  8ec0             mov es, ax                               
  0aa0  26a01704         mov al, byte ptr es:[0x417]              
  0aa4  98               cwde                                     
  0aa5  a90300           test ax, 3                               
  0aa8  7403             je 0xaad                                 
  0aaa  e90702           jmp 0xcb4                                
  0aad  837ef200         cmp word ptr [bp - 0xe], 0               
  0ab1  7462             je 0xb15                                 
  0ab3  b8042c           mov ax, 0x2c04                           
  0ab6  8ec0             mov es, ax                               
  0ab8  26a11001         mov ax, word ptr es:[0x110]              
  0abc  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0abf  7554             jne 0xb15                                
  0ac1  33c0             xor ax, ax                               
  0ac3  8ec0             mov es, ax                               
  0ac5  26a01704         mov al, byte ptr es:[0x417]              
  0ac9  98               cwde                                     
  0aca  a90400           test ax, 4                               
  0acd  7546             jne 0xb15                                
  0acf  33c0             xor ax, ax                               
  0ad1  8ec0             mov es, ax                               
  0ad3  26f606170408     test byte ptr es:[0x417], 8              
  0ad9  7403             je 0xade                                 
  0adb  e98301           jmp 0xc61                                
  0ade  66833e625e00     cmp dword ptr [0x5e62], 0                
  0ae4  7503             jne 0xae9                                
  0ae6  e99601           jmp 0xc7f                                
  0ae9  837ef401         cmp word ptr [bp - 0xc], 1               
  0aed  7d03             jge 0xaf2                                
  0aef  e98d01           jmp 0xc7f                                
  0af2  833efc5d02       cmp word ptr [0x5dfc], 2                 
  0af7  7503             jne 0xafc                                
  0af9  e9a001           jmp 0xc9c                                
  0afc  83ff02           cmp di, 2                                
  0aff  7503             jne 0xb04                                
  0b01  e99201           jmp 0xc96                                
  0b04  83ff03           cmp di, 3                                
  0b07  7403             je 0xb0c                                 
  0b09  e99001           jmp 0xc9c                                
  0b0c  e98701           jmp 0xc96                                
  0b0f  e98a01           jmp 0xc9c                                
  0b12  e96a01           jmp 0xc7f                                
  0b15  66833e625e00     cmp dword ptr [0x5e62], 0                
  0b1b  7503             jne 0xb20                                
  0b1d  e91401           jmp 0xc34                                
  0b20  837ef401         cmp word ptr [bp - 0xc], 1               
  0b24  7e03             jle 0xb29                                
  0b26  e90b01           jmp 0xc34                                
  0b29  b8042c           mov ax, 0x2c04                           
  0b2c  8ec0             mov es, ax                               
  0b2e  26a11001         mov ax, word ptr es:[0x110]              
  0b32  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0b35  7503             jne 0xb3a                                
  0b37  e9fa00           jmp 0xc34                                
  0b3a  83ff0a           cmp di, 0xa                              
  0b3d  7409             je 0xb48                                 
  0b3f  837ef200         cmp word ptr [bp - 0xe], 0               
  0b43  7503             jne 0xb48                                
  0b45  e9ec00           jmp 0xc34                                
  0b48  c41e625e         les bx, ptr [0x5e62]                     
  0b4c  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0b52  7423             je 0xb77                                 
  0b54  833efc5d01       cmp word ptr [0x5dfc], 1                 
  0b59  751c             jne 0xb77                                
  0b5b  83fe03           cmp si, 3                                
  0b5e  7517             jne 0xb77                                
  0b60  83ff03           cmp di, 3                                
  0b63  7412             je 0xb77                                 
  0b65  83ff02           cmp di, 2                                
  0b68  740d             je 0xb77                                 
  0b6a  83ff0a           cmp di, 0xa                              
  0b6d  7408             je 0xb77                                 
  0b6f  83ff01           cmp di, 1                                
  0b72  7403             je 0xb77                                 
  0b74  e9bd00           jmp 0xc34                                
  0b77  c41e625e         les bx, ptr [0x5e62]                     
  0b7b  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0b81  7523             jne 0xba6                                
  0b83  833efc5d01       cmp word ptr [0x5dfc], 1                 
  0b88  751c             jne 0xba6                                
  0b8a  83ff03           cmp di, 3                                
  0b8d  7517             jne 0xba6                                
  0b8f  83fe03           cmp si, 3                                
  0b92  7412             je 0xba6                                 
  0b94  83fe02           cmp si, 2                                
  0b97  740d             je 0xba6                                 
  0b99  83fe0a           cmp si, 0xa                              
  0b9c  7408             je 0xba6                                 
  0b9e  83fe01           cmp si, 1                                
  0ba1  7403             je 0xba6                                 
  0ba3  e98e00           jmp 0xc34                                
  0ba6  b8042c           mov ax, 0x2c04                           
  0ba9  8ec0             mov es, ax                               
  0bab  26833e1c0100     cmp word ptr es:[0x11c], 0               
  0bb1  7475             je 0xc28                                 
  0bb3  837ef60f         cmp word ptr [bp - 0xa], 0xf             
  0bb7  746f             je 0xc28                                 
  0bb9  83ff0a           cmp di, 0xa                              
  0bbc  7522             jne 0xbe0                                
  0bbe  b8042c           mov ax, 0x2c04                           
  0bc1  8ec0             mov es, ax                               
  0bc3  268b1e1001       mov bx, word ptr es:[0x110]              
  0bc8  c1e303           shl bx, 3                                
  0bcb  035ef6           add bx, word ptr [bp - 0xa]              
  0bce  b8042c           mov ax, 0x2c04                           
  0bd1  8ec0             mov es, ax                               
  0bd3  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0bd8  250300           and ax, 3                                
  0bdb  3d0200           cmp ax, 2                                
  0bde  7448             je 0xc28                                 
  0be0  83ff0a           cmp di, 0xa                              
  0be3  7522             jne 0xc07                                
  0be5  b8042c           mov ax, 0x2c04                           
  0be8  8ec0             mov es, ax                               
  0bea  268b1e1001       mov bx, word ptr es:[0x110]              
  0bef  c1e303           shl bx, 3                                
  0bf2  035ef6           add bx, word ptr [bp - 0xa]              
  0bf5  b8042c           mov ax, 0x2c04                           
  0bf8  8ec0             mov es, ax                               
  0bfa  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0bff  250300           and ax, 3                                
  0c02  3d0200           cmp ax, 2                                
  0c05  7527             jne 0xc2e                                
  0c07  b8042c           mov ax, 0x2c04                           
  0c0a  8ec0             mov es, ax                               
  0c0c  268b1e1001       mov bx, word ptr es:[0x110]              
  0c11  c1e303           shl bx, 3                                
  0c14  035ef6           add bx, word ptr [bp - 0xa]              
  0c17  b8042c           mov ax, 0x2c04                           
  0c1a  8ec0             mov es, ax                               
  0c1c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0c21  250300           and ax, 3                                
  0c24  0bc0             or ax, ax                                
  0c26  7406             je 0xc2e                                 
  0c28  b80800           mov ax, 8                                
  0c2b  e9f300           jmp 0xd21                                
  0c2e  b80a00           mov ax, 0xa                              
  0c31  e9ed00           jmp 0xd21                                
  0c34  66833e625e00     cmp dword ptr [0x5e62], 0                
  0c3a  7466             je 0xca2                                 
  0c3c  b8042c           mov ax, 0x2c04                           
  0c3f  8ec0             mov es, ax                               
  0c41  26a11001         mov ax, word ptr es:[0x110]              
  0c45  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0c48  740b             je 0xc55                                 
  0c4a  837ef60f         cmp word ptr [bp - 0xa], 0xf             
  0c4e  7552             jne 0xca2                                
  0c50  83ff0a           cmp di, 0xa                              
  0c53  744d             je 0xca2                                 
  0c55  33c0             xor ax, ax                               
  0c57  8ec0             mov es, ax                               
  0c59  26f606170408     test byte ptr es:[0x417], 8              
  0c5f  7406             je 0xc67                                 
  0c61  b80b00           mov ax, 0xb                              
  0c64  e9ba00           jmp 0xd21                                
  0c67  837ef401         cmp word ptr [bp - 0xc], 1               
  0c6b  7c18             jl 0xc85                                 
  0c6d  33c0             xor ax, ax                               
  0c6f  8ec0             mov es, ax                               
  0c71  26f606170404     test byte ptr es:[0x417], 4              
  0c77  740c             je 0xc85                                 
  0c79  837ef200         cmp word ptr [bp - 0xe], 0               
  0c7d  7406             je 0xc85                                 
  0c7f  b80500           mov ax, 5                                
  0c82  e99c00           jmp 0xd21                                
  0c85  833efc5d02       cmp word ptr [0x5dfc], 2                 
  0c8a  7410             je 0xc9c                                 
  0c8c  83ff02           cmp di, 2                                
  0c8f  7405             je 0xc96                                 
  0c91  83ff03           cmp di, 3                                
  0c94  7506             jne 0xc9c                                
  0c96  b80200           mov ax, 2                                
  0c99  e98500           jmp 0xd21                                
  0c9c  b80600           mov ax, 6                                
  0c9f  e97f00           jmp 0xd21                                
  0ca2  83ff0a           cmp di, 0xa                              
  0ca5  744b             je 0xcf2                                 
  0ca7  83ff0b           cmp di, 0xb                              
  0caa  7403             je 0xcaf                                 
  0cac  e90dfc           jmp 0x8bc                                
  0caf  eb4e             jmp 0xcff                                
  0cb1  e908fc           jmp 0x8bc                                
  0cb4  66833e625e00     cmp dword ptr [0x5e62], 0                
  0cba  7431             je 0xced                                 
  0cbc  837ef401         cmp word ptr [bp - 0xc], 1               
  0cc0  7f2b             jg 0xced                                 
  0cc2  b8042c           mov ax, 0x2c04                           
  0cc5  8ec0             mov es, ax                               
  0cc7  26a11001         mov ax, word ptr es:[0x110]              
  0ccb  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0cce  741d             je 0xced                                 
  0cd0  83ff0a           cmp di, 0xa                              
  0cd3  7406             je 0xcdb                                 
  0cd5  837ef200         cmp word ptr [bp - 0xe], 0               
  0cd9  7412             je 0xced                                 
  0cdb  b8042c           mov ax, 0x2c04                           
  0cde  8ec0             mov es, ax                               
  0ce0  26833e2c0100     cmp word ptr es:[0x12c], 0               
  0ce6  7405             je 0xced                                 
  0ce8  b80900           mov ax, 9                                
  0ceb  eb34             jmp 0xd21                                
  0ced  83ff0a           cmp di, 0xa                              
  0cf0  7505             jne 0xcf7                                
  0cf2  b80300           mov ax, 3                                
  0cf5  eb2a             jmp 0xd21                                
  0cf7  83ff0b           cmp di, 0xb                              
  0cfa  7403             je 0xcff                                 
  0cfc  e9bdfb           jmp 0x8bc                                
  0cff  b80700           mov ax, 7                                
  0d02  eb1d             jmp 0xd21                                
  0d04  e9b5fb           jmp 0x8bc                                
  0d07  16               push ss                                  
  0d08  8d46fc           lea ax, [bp - 4]                         
  0d0b  50               push ax                                  
  0d0c  1e               push ds                                  
  0d0d  68b82a           push 0x2ab8                              
  0d10  9ab8006d11       lcall 0x116d, 0xb8                       -> 116d:00b8
  0d15  83c408           add sp, 8                                
  0d18  0bc0             or ax, ax                                
  0d1a  7403             je 0xd1f                                 
  0d1c  e99dfb           jmp 0x8bc                                
  0d1f  33c0             xor ax, ax                               
  0d21  5f               pop di                                   
  0d22  5e               pop si                                   
  0d23  c9               leave                                    
  0d24  cb               retf                                     
  0d25  55               push bp                                  
