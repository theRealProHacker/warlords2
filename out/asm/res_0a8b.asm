; res_0a8b file_off 0xc8b0

res_0a8b_0001:  ; ENTRY
  0001  55               push bp                                  
  0002  8bec             mov bp, sp                               
  0004  83ec08           sub sp, 8                                
  0007  56               push si                                  
  0008  57               push di                                  
  0009  c746fe0100       mov word ptr [bp - 2], 1                 
  000e  33ff             xor di, di                               
  0010  c41e625e         les bx, ptr [0x5e62]                     
  0014  268a470f         mov al, byte ptr es:[bx + 0xf]           
  0018  d1e8             shr ax, 1                                
  001a  257f00           and ax, 0x7f                             
  001d  8946fc           mov word ptr [bp - 4], ax                
  0020  268a470e         mov al, byte ptr es:[bx + 0xe]           
  0024  250f00           and ax, 0xf                              
  0027  8946fa           mov word ptr [bp - 6], ax                
  002a  66833e625e00     cmp dword ptr [0x5e62], 0                
  0030  741c             je 0x4e                                  
  0032  837e0600         cmp word ptr [bp + 6], 0                 
  0036  7c16             jl 0x4e                                  
  0038  837e0800         cmp word ptr [bp + 8], 0                 
  003c  7c10             jl 0x4e                                  
  003e  837e0670         cmp word ptr [bp + 6], 0x70              
  0042  7d0a             jge 0x4e                                 
  0044  817e089c00       cmp word ptr [bp + 8], 0x9c              
  0049  7d03             jge 0x4e                                 
  004b  e9d301           jmp 0x221                                
  004e  33c0             xor ax, ax                               
  0050  5f               pop di                                   
  0051  5e               pop si                                   
  0052  c9               leave                                    
  0053  cb               retf                                     
  0054  c746fe0000       mov word ptr [bp - 2], 0                 
  0059  c41e625e         les bx, ptr [0x5e62]                     
  005d  26ff7702         push word ptr es:[bx + 2]                
  0061  26ff37           push word ptr es:[bx]                    
  0064  9a3400ef2f       lcall 0x2fef, 0x34                       -> ovl28:0427
  0069  83c404           add sp, 4                                
  006c  6a01             push 1                                   
  006e  ff7608           push word ptr [bp + 8]                   
  0071  ff7606           push word ptr [bp + 6]                   
  0074  90               nop                                      
  0075  0e               push cs                                  
  0076  e8d60b           call 0xc4f                               
  0079  83c406           add sp, 6                                
  007c  8946f8           mov word ptr [bp - 8], ax                
  007f  c41e625e         les bx, ptr [0x5e62]                     
  0083  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0087  263b07           cmp ax, word ptr es:[bx]                 
  008a  751a             jne 0xa6                                 
  008c  268b4702         mov ax, word ptr es:[bx + 2]             
  0090  263b4714         cmp ax, word ptr es:[bx + 0x14]          
  0094  7510             jne 0xa6                                 
  0096  c746f80400       mov word ptr [bp - 8], 4                 
  009b  b8ffff           mov ax, 0xffff                           
  009e  26894714         mov word ptr es:[bx + 0x14], ax          
  00a2  26894712         mov word ptr es:[bx + 0x12], ax          
  00a6  8b5ef8           mov bx, word ptr [bp - 8]                
  00a9  83eb02           sub bx, 2                                
  00ac  83fb03           cmp bx, 3                                
  00af  7603             jbe 0xb4                                 
  00b1  e96d01           jmp 0x221                                
  00b4  d1e3             shl bx, 1                                
  00b6  2effa74c02       jmp word ptr cs:[bx + 0x24c]             
res_0a8b_00bb:  ; case
  00bb  9a43001931       lcall 0x3119, 0x43                       -> ovl67:08fb
  00c0  e95e01           jmp 0x221                                
res_0a8b_00c3:  ; case
  00c3  8b4608           mov ax, word ptr [bp + 8]                
  00c6  bae000           mov dx, 0xe0                             
  00c9  f7ea             imul dx                                  
  00cb  8b5606           mov dx, word ptr [bp + 6]                
  00ce  d1e2             shl dx, 1                                
  00d0  03c2             add ax, dx                               
  00d2  ba1d1e           mov dx, 0x1e1d                           
  00d5  8bd8             mov bx, ax                               
  00d7  8ec2             mov es, dx                               
  00d9  268a9f0000       mov bl, byte ptr es:[bx]                 
  00de  81e3ff00         and bx, 0xff                             
  00e2  b8042c           mov ax, 0x2c04                           
  00e5  8ec0             mov es, ax                               
  00e7  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  00ed  7403             je 0xf2                                  
  00ef  e92f01           jmp 0x221                                
  00f2  8b46fc           mov ax, word ptr [bp - 4]                
  00f5  ba4100           mov dx, 0x41                             
  00f8  f7ea             imul dx                                  
  00fa  ba042c           mov dx, 0x2c04                           
  00fd  8bd8             mov bx, ax                               
  00ff  8ec2             mov es, dx                               
  0101  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0106  ba042c           mov dx, 0x2c04                           
  0109  8ec2             mov es, dx                               
  010b  263a061001       cmp al, byte ptr es:[0x110]              
  0110  741f             je 0x131                                 
  0112  16               push ss                                  
  0113  8d4608           lea ax, [bp + 8]                         
  0116  50               push ax                                  
  0117  16               push ss                                  
  0118  8d4606           lea ax, [bp + 6]                         
  011b  50               push ax                                  
  011c  ff36c65d         push word ptr [0x5dc6]                   
  0120  ff36c85d         push word ptr [0x5dc8]                   
  0124  ff76fc           push word ptr [bp - 4]                   
  0127  90               nop                                      
  0128  0e               push cs                                  
  0129  e82801           call 0x254                               
  012c  83c40e           add sp, 0xe                              
  012f  8bf8             mov di, ax                               
  0131  0bff             or di, di                                
  0133  7503             jne 0x138                                
  0135  e9e900           jmp 0x221                                
  0138  c746fe0100       mov word ptr [bp - 2], 1                 
  013d  c41e625e         les bx, ptr [0x5e62]                     
  0141  268a470f         mov al, byte ptr es:[bx + 0xf]           
  0145  d1e8             shr ax, 1                                
  0147  257f00           and ax, 0x7f                             
  014a  8946fc           mov word ptr [bp - 4], ax                
  014d  e9d100           jmp 0x221                                
res_0a8b_0150:  ; case
  0150  8b46fa           mov ax, word ptr [bp - 6]                
  0153  3d0300           cmp ax, 3                                
  0156  7403             je 0x15b                                 
  0158  e9c600           jmp 0x221                                
  015b  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0161  7503             jne 0x166                                
  0163  e9bb00           jmp 0x221                                
  0166  b8042c           mov ax, 0x2c04                           
  0169  8ec0             mov es, ax                               
  016b  268b368101       mov si, word ptr es:[0x181]              
  0170  8bc6             mov ax, si                               
  0172  ba1600           mov dx, 0x16                             
  0175  f7ea             imul dx                                  
  0177  058088           add ax, 0x8880                           
  017a  8bd8             mov bx, ax                               
  017c  eb54             jmp 0x1d2                                
  017e  b81d1e           mov ax, 0x1e1d                           
  0181  3b06605e         cmp ax, word ptr [0x5e60]                
  0185  754b             jne 0x1d2                                
  0187  3b1e5e5e         cmp bx, word ptr [0x5e5e]                
  018b  7545             jne 0x1d2                                
  018d  8bc6             mov ax, si                               
  018f  ba1600           mov dx, 0x16                             
  0192  f7ea             imul dx                                  
  0194  8bc8             mov cx, ax                               
  0196  ba1d1e           mov dx, 0x1e1d                           
  0199  8bd8             mov bx, ax                               
  019b  8ec2             mov es, dx                               
  019d  26ffb78288       push word ptr es:[bx - 0x777e]           
  01a2  8bd9             mov bx, cx                               
  01a4  b81d1e           mov ax, 0x1e1d                           
  01a7  ba0000           mov dx, 0                                
  01aa  81c28088         add dx, 0x8880                           
  01ae  03da             add bx, dx                               
  01b0  8ec0             mov es, ax                               
  01b2  26ff37           push word ptr es:[bx]                    
  01b5  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  01ba  83c404           add sp, 4                                
  01bd  8bd0             mov dx, ax                               
  01bf  83faff           cmp dx, -1                               
  01c2  7502             jne 0x1c6                                
  01c4  eb16             jmp 0x1dc                                
  01c6  52               push dx                                  
  01c7  56               push si                                  
  01c8  9a3900cb2f       lcall 0x2fcb, 0x39                       -> ovl22:15c3
  01cd  83c404           add sp, 4                                
  01d0  eb0a             jmp 0x1dc                                
  01d2  83eb16           sub bx, 0x16                             
  01d5  8bc6             mov ax, si                               
  01d7  4e               dec si                                   
  01d8  0bc0             or ax, ax                                
  01da  75a2             jne 0x17e                                
  01dc  33c9             xor cx, cx                               
  01de  ba3e5e           mov dx, 0x5e3e                           
  01e1  8bda             mov bx, dx                               
  01e3  8b07             mov ax, word ptr [bx]                    
  01e5  0b4702           or ax, word ptr [bx + 2]                 
  01e8  7410             je 0x1fa                                 
  01ea  c41f             les bx, ptr [bx]                         
  01ec  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  01f1  8bda             mov bx, dx                               
  01f3  8b1f             mov bx, word ptr [bx]                    
  01f5  2680670e8f       and byte ptr es:[bx + 0xe], 0x8f         
  01fa  83c204           add dx, 4                                
  01fd  41               inc cx                                   
  01fe  81fa5e5e         cmp dx, 0x5e5e                           
  0202  75dd             jne 0x1e1                                
  0204  eb1b             jmp 0x221                                
res_0a8b_0206:  ; case
  0206  ff36c65d         push word ptr [0x5dc6]                   
  020a  ff36c85d         push word ptr [0x5dc8]                   
  020e  90               nop                                      
  020f  0e               push cs                                  
  0210  e86302           call 0x476                               
  0213  83c404           add sp, 4                                
  0216  8bf8             mov di, ax                               
  0218  0bff             or di, di                                
  021a  7405             je 0x221                                 
  021c  c746fe0100       mov word ptr [bp - 2], 1                 
  0221  837efe00         cmp word ptr [bp - 2], 0                 
  0225  7403             je 0x22a                                 
  0227  e92afe           jmp 0x54                                 
  022a  837e0a00         cmp word ptr [bp + 0xa], 0               
  022e  7515             jne 0x245                                
  0230  9a43001931       lcall 0x3119, 0x43                       -> ovl67:08fb
  0235  666801000100     push 0x10001                             
  023b  6a01             push 1                                   
  023d  9ab308620b       lcall 0xb62, 0x8b3                       -> 0b62:08b3
  0242  83c406           add sp, 6                                
  0245  8b46f8           mov ax, word ptr [bp - 8]                
  0248  5f               pop di                                   
  0249  5e               pop si                                   
  024a  c9               leave                                    
  024b  cb               retf                                     
  024c  bb0006025001c300 dw 00bb,0206,0150,00c3                   jump table

res_0a8b_0254:  ; ENTRY
  0254  55               push bp                                  
  0255  8bec             mov bp, sp                               
  0257  83ec06           sub sp, 6                                
  025a  56               push si                                  
  025b  57               push di                                  
  025c  8b7606           mov si, word ptr [bp + 6]                
  025f  c746fe0000       mov word ptr [bp - 2], 0                 
  0264  8bc6             mov ax, si                               
  0266  ba4100           mov dx, 0x41                             
  0269  f7ea             imul dx                                  
  026b  8bf8             mov di, ax                               
  026d  ba042c           mov dx, 0x2c04                           
  0270  8bd8             mov bx, ax                               
  0272  8ec2             mov es, dx                               
  0274  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0279  8846fb           mov byte ptr [bp - 5], al                
  027c  98               cwde                                     
  027d  8946fc           mov word ptr [bp - 4], ax                
  0280  b8042c           mov ax, 0x2c04                           
  0283  8ec0             mov es, ax                               
  0285  2680bd92150f     cmp byte ptr es:[di + 0x1592], 0xf       
  028b  7579             jne 0x306                                
  028d  b8042c           mov ax, 0x2c04                           
  0290  8ec0             mov es, ax                               
  0292  26833e590100     cmp word ptr es:[0x159], 0               
  0298  7405             je 0x29f                                 
  029a  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  029f  6a01             push 1                                   
  02a1  ff760a           push word ptr [bp + 0xa]                 
  02a4  ff7608           push word ptr [bp + 8]                   
  02a7  9a20002430       lcall 0x3024, 0x20                       -> ovl36:124a
  02ac  83c406           add sp, 6                                
  02af  b8042c           mov ax, 0x2c04                           
  02b2  8ec0             mov es, ax                               
  02b4  26833e590100     cmp word ptr es:[0x159], 0               
  02ba  7419             je 0x2d5                                 
  02bc  66833e625e00     cmp dword ptr [0x5e62], 0                
  02c2  7407             je 0x2cb                                 
  02c4  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  02c9  eb0a             jmp 0x2d5                                
  02cb  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  02d0  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  02d5  8bc6             mov ax, si                               
  02d7  ba4100           mov dx, 0x41                             
  02da  f7ea             imul dx                                  
  02dc  ba042c           mov dx, 0x2c04                           
  02df  8bd8             mov bx, ax                               
  02e1  8ec2             mov es, dx                               
  02e3  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  02e8  98               cwde                                     
  02e9  ba042c           mov dx, 0x2c04                           
  02ec  8ec2             mov es, dx                               
  02ee  263b061001       cmp ax, word ptr es:[0x110]              
  02f3  7403             je 0x2f8                                 
  02f5  e94c01           jmp 0x444                                
  02f8  c41eee40         les bx, ptr [0x40ee]                     
  02fc  03de             add bx, si                               
  02fe  26c6475601       mov byte ptr es:[bx + 0x56], 1           
  0303  e93e01           jmp 0x444                                
  0306  8a46fb           mov al, byte ptr [bp - 5]                
  0309  ba042c           mov dx, 0x2c04                           
  030c  8ec2             mov es, dx                               
  030e  263a061001       cmp al, byte ptr es:[0x110]              
  0313  7503             jne 0x318                                
  0315  e92c01           jmp 0x444                                
  0318  c41eee40         les bx, ptr [0x40ee]                     
  031c  26397746         cmp word ptr es:[bx + 0x46], si          
  0320  7508             jne 0x32a                                
  0322  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0328  7513             jne 0x33d                                
  032a  ff760a           push word ptr [bp + 0xa]                 
  032d  ff7608           push word ptr [bp + 8]                   
  0330  56               push si                                  
  0331  9a7a00f72f       lcall 0x2ff7, 0x7a                       -> ovl29:1771
  0336  83c406           add sp, 6                                
  0339  8bf8             mov di, ax                               
  033b  eb02             jmp 0x33f                                
  033d  8bfe             mov di, si                               
  033f  3bfe             cmp di, si                               
  0341  7503             jne 0x346                                
  0343  e98a00           jmp 0x3d0                                
  0346  b90800           mov cx, 8                                
  0349  ba5e5e           mov dx, 0x5e5e                           
  034c  8bc7             mov ax, di                               
  034e  257f00           and ax, 0x7f                             
  0351  d0e0             shl al, 1                                
  0353  8846fa           mov byte ptr [bp - 6], al                
  0356  eb25             jmp 0x37d                                
  0358  8bda             mov bx, dx                               
  035a  8b07             mov ax, word ptr [bx]                    
  035c  0b4702           or ax, word ptr [bx + 2]                 
  035f  741c             je 0x37d                                 
  0361  c41f             les bx, ptr [bx]                         
  0363  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  0368  26804f0e01       or byte ptr es:[bx + 0xe], 1             
  036d  8bda             mov bx, dx                               
  036f  8b1f             mov bx, word ptr [bx]                    
  0371  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0376  8a46fa           mov al, byte ptr [bp - 6]                
  0379  2608470f         or byte ptr es:[bx + 0xf], al            
  037d  83ea04           sub dx, 4                                
  0380  8bc1             mov ax, cx                               
  0382  49               dec cx                                   
  0383  0bc0             or ax, ax                                
  0385  75d1             jne 0x358                                
  0387  8bc7             mov ax, di                               
  0389  ba4100           mov dx, 0x41                             
  038c  f7ea             imul dx                                  
  038e  8bf0             mov si, ax                               
  0390  ba042c           mov dx, 0x2c04                           
  0393  8bd8             mov bx, ax                               
  0395  8ec2             mov es, dx                               
  0397  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  039c  c45e0c           les bx, ptr [bp + 0xc]                   
  039f  268907           mov word ptr es:[bx], ax                 
  03a2  b8042c           mov ax, 0x2c04                           
  03a5  8ec0             mov es, ax                               
  03a7  268b847f15       mov ax, word ptr es:[si + 0x157f]        
  03ac  c45e10           les bx, ptr [bp + 0x10]                  
  03af  268907           mov word ptr es:[bx], ax                 
  03b2  b8042c           mov ax, 0x2c04                           
  03b5  8ec0             mov es, ax                               
  03b7  268a849215       mov al, byte ptr es:[si + 0x1592]        
  03bc  98               cwde                                     
  03bd  ba042c           mov dx, 0x2c04                           
  03c0  8ec2             mov es, dx                               
  03c2  263b061001       cmp ax, word ptr es:[0x110]              
  03c7  7500             jne 0x3c9                                
  03c9  b80100           mov ax, 1                                
  03cc  5f               pop di                                   
  03cd  5e               pop si                                   
  03ce  c9               leave                                    
  03cf  cb               retf                                     
  03d0  b8042c           mov ax, 0x2c04                           
  03d3  8ec0             mov es, ax                               
  03d5  26833e590100     cmp word ptr es:[0x159], 0               
  03db  7405             je 0x3e2                                 
  03dd  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  03e2  6a01             push 1                                   
  03e4  ff760a           push word ptr [bp + 0xa]                 
  03e7  ff7608           push word ptr [bp + 8]                   
  03ea  9a20002430       lcall 0x3024, 0x20                       -> ovl36:124a
  03ef  83c406           add sp, 6                                
  03f2  8bc6             mov ax, si                               
  03f4  ba4100           mov dx, 0x41                             
  03f7  f7ea             imul dx                                  
  03f9  ba042c           mov dx, 0x2c04                           
  03fc  8bd8             mov bx, ax                               
  03fe  8ec2             mov es, dx                               
  0400  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0405  98               cwde                                     
  0406  ba042c           mov dx, 0x2c04                           
  0409  8ec2             mov es, dx                               
  040b  263b061001       cmp ax, word ptr es:[0x110]              
  0410  750c             jne 0x41e                                
  0412  ff76fc           push word ptr [bp - 4]                   
  0415  56               push si                                  
  0416  9a2000e42f       lcall 0x2fe4, 0x20                       -> ovl26:0000
  041b  83c404           add sp, 4                                
  041e  b8042c           mov ax, 0x2c04                           
  0421  8ec0             mov es, ax                               
  0423  26833e590100     cmp word ptr es:[0x159], 0               
  0429  7419             je 0x444                                 
  042b  66833e625e00     cmp dword ptr [0x5e62], 0                
  0431  7407             je 0x43a                                 
  0433  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  0438  eb0a             jmp 0x444                                
  043a  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  043f  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  0444  b90800           mov cx, 8                                
  0447  ba5e5e           mov dx, 0x5e5e                           
  044a  eb19             jmp 0x465                                
  044c  8bda             mov bx, dx                               
  044e  8b07             mov ax, word ptr [bx]                    
  0450  0b4702           or ax, word ptr [bx + 2]                 
  0453  7410             je 0x465                                 
  0455  c41f             les bx, ptr [bx]                         
  0457  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  045c  8bda             mov bx, dx                               
  045e  8b1f             mov bx, word ptr [bx]                    
  0460  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0465  83ea04           sub dx, 4                                
  0468  8bc1             mov ax, cx                               
  046a  49               dec cx                                   
  046b  0bc0             or ax, ax                                
  046d  75dd             jne 0x44c                                
  046f  8b46fe           mov ax, word ptr [bp - 2]                
  0472  5f               pop di                                   
  0473  5e               pop si                                   
  0474  c9               leave                                    
  0475  cb               retf                                     

res_0a8b_0476:  ; ENTRY
  0476  55               push bp                                  
  0477  8bec             mov bp, sp                               
  0479  56               push si                                  
  047a  33f6             xor si, si                               
  047c  b8042c           mov ax, 0x2c04                           
  047f  8ec0             mov es, ax                               
  0481  26833e590100     cmp word ptr es:[0x159], 0               
  0487  7405             je 0x48e                                 
  0489  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  048e  6a01             push 1                                   
  0490  ff7608           push word ptr [bp + 8]                   
  0493  ff7606           push word ptr [bp + 6]                   
  0496  9a20002430       lcall 0x3024, 0x20                       -> ovl36:124a
  049b  83c406           add sp, 6                                
  049e  b90800           mov cx, 8                                
  04a1  ba5e5e           mov dx, 0x5e5e                           
  04a4  eb0a             jmp 0x4b0                                
  04a6  8bda             mov bx, dx                               
  04a8  8b07             mov ax, word ptr [bx]                    
  04aa  0b4702           or ax, word ptr [bx + 2]                 
  04ad  7401             je 0x4b0                                 
  04af  46               inc si                                   
  04b0  83ea04           sub dx, 4                                
  04b3  8bc1             mov ax, cx                               
  04b5  49               dec cx                                   
  04b6  0bc0             or ax, ax                                
  04b8  75ec             jne 0x4a6                                
  04ba  0bf6             or si, si                                
  04bc  7405             je 0x4c3                                 
  04be  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  04c3  8bc6             mov ax, si                               
  04c5  5e               pop si                                   
  04c6  5d               pop bp                                   
  04c7  cb               retf                                     

res_0a8b_04c8:  ; ENTRY
  04c8  55               push bp                                  
  04c9  8bec             mov bp, sp                               
  04cb  83ec12           sub sp, 0x12                             
  04ce  56               push si                                  
  04cf  57               push di                                  
  04d0  c45e06           les bx, ptr [bp + 6]                     
  04d3  268b07           mov ax, word ptr es:[bx]                 
  04d6  8946fe           mov word ptr [bp - 2], ax                
  04d9  268b4702         mov ax, word ptr es:[bx + 2]             
  04dd  8946fc           mov word ptr [bp - 4], ax                
  04e0  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  04e5  33f6             xor si, si                               
  04e7  3b760a           cmp si, word ptr [bp + 0xa]              
  04ea  7c03             jl 0x4ef                                 
  04ec  e97001           jmp 0x65f                                
  04ef  8b7efe           mov di, word ptr [bp - 2]                
  04f2  8b46fc           mov ax, word ptr [bp - 4]                
  04f5  8946ee           mov word ptr [bp - 0x12], ax             
  04f8  9a8e00c130       lcall 0x30c1, 0x8e                       -> ovl59:0a7c
  04fd  0bc0             or ax, ax                                
  04ff  740a             je 0x50b                                 
  0501  66c746f800000000 mov dword ptr [bp - 8], 0                
  0509  eb0f             jmp 0x51a                                
  050b  16               push ss                                  
  050c  8d46f8           lea ax, [bp - 8]                         
  050f  50               push ax                                  
  0510  6a00             push 0                                   
  0512  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  0517  83c406           add sp, 6                                
  051a  66c746f000000000 mov dword ptr [bp - 0x10], 0             
  0522  c45e06           les bx, ptr [bp + 6]                     
  0525  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0529  03de             add bx, si                               
  052b  268a07           mov al, byte ptr es:[bx]                 
  052e  b400             mov ah, 0                                
  0530  50               push ax                                  
  0531  16               push ss                                  
  0532  8d46fc           lea ax, [bp - 4]                         
  0535  50               push ax                                  
  0536  16               push ss                                  
  0537  8d46fe           lea ax, [bp - 2]                         
  053a  50               push ax                                  
  053b  90               nop                                      
  053c  0e               push cs                                  
  053d  e80d06           call 0xb4d                               
  0540  83c40a           add sp, 0xa                              
  0543  833eda2b00       cmp word ptr [0x2bda], 0                 
  0548  742e             je 0x578                                 
  054a  b90800           mov cx, 8                                
  054d  ba5e5e           mov dx, 0x5e5e                           
  0550  eb1c             jmp 0x56e                                
  0552  8bda             mov bx, dx                               
  0554  8b07             mov ax, word ptr [bx]                    
  0556  0b4702           or ax, word ptr [bx + 2]                 
  0559  7413             je 0x56e                                 
  055b  c41f             les bx, ptr [bx]                         
  055d  8b46fe           mov ax, word ptr [bp - 2]                
  0560  268907           mov word ptr es:[bx], ax                 
  0563  8bda             mov bx, dx                               
  0565  8b1f             mov bx, word ptr [bx]                    
  0567  8b46fc           mov ax, word ptr [bp - 4]                
  056a  26894702         mov word ptr es:[bx + 2], ax             
  056e  83ea04           sub dx, 4                                
  0571  8bc1             mov ax, cx                               
  0573  49               dec cx                                   
  0574  0bc0             or ax, ax                                
  0576  75da             jne 0x552                                
  0578  c41e625e         les bx, ptr [0x5e62]                     
  057c  8b46fe           mov ax, word ptr [bp - 2]                
  057f  268907           mov word ptr es:[bx], ax                 
  0582  8b46fc           mov ax, word ptr [bp - 4]                
  0585  26894702         mov word ptr es:[bx + 2], ax             
  0589  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  058e  0bc0             or ax, ax                                
  0590  740e             je 0x5a0                                 
  0592  ff76fc           push word ptr [bp - 4]                   
  0595  ff76fe           push word ptr [bp - 2]                   
  0598  9a3400ef2f       lcall 0x2fef, 0x34                       -> ovl28:0427
  059d  83c404           add sp, 4                                
  05a0  ff76ee           push word ptr [bp - 0x12]                
  05a3  57               push di                                  
  05a4  9aa701620b       lcall 0xb62, 0x1a7                       -> 0b62:01a7
  05a9  83c404           add sp, 4                                
  05ac  ff06a82e         inc word ptr [0x2ea8]                    
  05b0  ff76ee           push word ptr [bp - 0x12]                
  05b3  57               push di                                  
  05b4  9a9b0e620b       lcall 0xb62, 0xe9b                       -> 0b62:0e9b
  05b9  83c404           add sp, 4                                
  05bc  c41e625e         les bx, ptr [0x5e62]                     
  05c0  26ff7702         push word ptr es:[bx + 2]                
  05c4  26ff37           push word ptr es:[bx]                    
  05c7  b8042c           mov ax, 0x2c04                           
  05ca  8ec0             mov es, ax                               
  05cc  26ff361001       push word ptr es:[0x110]                 
  05d1  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  05d6  83c406           add sp, 6                                
  05d9  0bc0             or ax, ax                                
  05db  7415             je 0x5f2                                 
  05dd  6a01             push 1                                   
  05df  c41e625e         les bx, ptr [0x5e62]                     
  05e3  26ff7702         push word ptr es:[bx + 2]                
  05e7  26ff37           push word ptr es:[bx]                    
  05ea  9a4d00f230       lcall 0x30f2, 0x4d                       -> ovl63:1fed
  05ef  83c406           add sp, 6                                
  05f2  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  05f7  9af01b0000       lcall 0, 0x1bf0                          -> 0000:1bf0
  05fc  66c1e010         shl eax, 0x10                            
  0600  660facd010       shrd eax, edx, 0x10                      
  0605  6683f8ff         cmp eax, -1                              
  0609  744b             je 0x656                                 
  060b  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  0610  9a8e00c130       lcall 0x30c1, 0x8e                       -> ovl59:0a7c
  0615  0bc0             or ax, ax                                
  0617  740a             je 0x623                                 
  0619  66c746f4e8030000 mov dword ptr [bp - 0xc], 0x3e8          
  0621  eb0f             jmp 0x632                                
  0623  16               push ss                                  
  0624  8d46f4           lea ax, [bp - 0xc]                       
  0627  50               push ax                                  
  0628  6a00             push 0                                   
  062a  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  062f  83c406           add sp, 6                                
  0632  668b46f4         mov eax, dword ptr [bp - 0xc]            
  0636  663b46f8         cmp eax, dword ptr [bp - 8]              
  063a  7c1a             jl 0x656                                 
  063c  662b46f8         sub eax, dword ptr [bp - 8]              
  0640  6683f803         cmp eax, 3                               
  0644  7d10             jge 0x656                                
  0646  66817ef010270000 cmp dword ptr [bp - 0x10], 0x2710        
  064e  7f06             jg 0x656                                 
  0650  66ff46f0         inc dword ptr [bp - 0x10]                
  0654  ebb5             jmp 0x60b                                
  0656  46               inc si                                   
  0657  3b760a           cmp si, word ptr [bp + 0xa]              
  065a  7d03             jge 0x65f                                
  065c  e990fe           jmp 0x4ef                                
  065f  c45e06           les bx, ptr [bp + 6]                     
  0662  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  0667  7403             je 0x66c                                 
  0669  e92f01           jmp 0x79b                                
  066c  c41e625e         les bx, ptr [0x5e62]                     
  0670  268b07           mov ax, word ptr es:[bx]                 
  0673  8946fa           mov word ptr [bp - 6], ax                
  0676  268b4702         mov ax, word ptr es:[bx + 2]             
  067a  8946f8           mov word ptr [bp - 8], ax                
  067d  bae000           mov dx, 0xe0                             
  0680  f7ea             imul dx                                  
  0682  8b56fa           mov dx, word ptr [bp - 6]                
  0685  d1e2             shl dx, 1                                
  0687  03c2             add ax, dx                               
  0689  ba1d1e           mov dx, 0x1e1d                           
  068c  8bd8             mov bx, ax                               
  068e  8ec2             mov es, dx                               
  0690  268a9f0000       mov bl, byte ptr es:[bx]                 
  0695  81e3ff00         and bx, 0xff                             
  0699  b8042c           mov ax, 0x2c04                           
  069c  8ec0             mov es, ax                               
  069e  268a871007       mov al, byte ptr es:[bx + 0x710]         
  06a3  98               cwde                                     
  06a4  8bd0             mov dx, ax                               
  06a6  c45e06           les bx, ptr [bp + 6]                     
  06a9  26f747080800     test word ptr es:[bx + 8], 8             
  06af  7444             je 0x6f5                                 
  06b1  83fa02           cmp dx, 2                                
  06b4  7503             jne 0x6b9                                
  06b6  e9e200           jmp 0x79b                                
  06b9  83fa03           cmp dx, 3                                
  06bc  7503             jne 0x6c1                                
  06be  e9da00           jmp 0x79b                                
  06c1  83fa01           cmp dx, 1                                
  06c4  7503             jne 0x6c9                                
  06c6  e9d200           jmp 0x79b                                
  06c9  b90800           mov cx, 8                                
  06cc  ba5e5e           mov dx, 0x5e5e                           
  06cf  eb17             jmp 0x6e8                                
  06d1  8bda             mov bx, dx                               
  06d3  8b07             mov ax, word ptr [bx]                    
  06d5  0b4702           or ax, word ptr [bx + 2]                 
  06d8  740e             je 0x6e8                                 
  06da  c41f             les bx, ptr [bx]                         
  06dc  2681670cffef     and word ptr es:[bx + 0xc], 0xefff       
  06e2  c706c45d0200     mov word ptr [0x5dc4], 2                 
  06e8  83ea04           sub dx, 4                                
  06eb  8bc1             mov ax, cx                               
  06ed  49               dec cx                                   
  06ee  0bc0             or ax, ax                                
  06f0  75df             jne 0x6d1                                
  06f2  e9a600           jmp 0x79b                                
  06f5  33ff             xor di, di                               
  06f7  c746f60000       mov word ptr [bp - 0xa], 0               
  06fc  83fa02           cmp dx, 2                                
  06ff  7408             je 0x709                                 
  0701  83fa03           cmp dx, 3                                
  0704  7403             je 0x709                                 
  0706  e99200           jmp 0x79b                                
  0709  b90800           mov cx, 8                                
  070c  be5e5e           mov si, 0x5e5e                           
  070f  eb2f             jmp 0x740                                
  0711  8b04             mov ax, word ptr [si]                    
  0713  0b4402           or ax, word ptr [si + 2]                 
  0716  7428             je 0x740                                 
  0718  c41c             les bx, ptr [si]                         
  071a  268a4704         mov al, byte ptr es:[bx + 4]             
  071e  98               cwde                                     
  071f  ba0600           mov dx, 6                                
  0722  f7ea             imul dx                                  
  0724  8bd8             mov bx, ax                               
  0726  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  072b  7405             je 0x732                                 
  072d  bf0100           mov di, 1                                
  0730  eb0e             jmp 0x740                                
  0732  c41c             les bx, ptr [si]                         
  0734  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0739  7405             je 0x740                                 
  073b  c746f60100       mov word ptr [bp - 0xa], 1               
  0740  83ee04           sub si, 4                                
  0743  8bc1             mov ax, cx                               
  0745  49               dec cx                                   
  0746  0bc0             or ax, ax                                
  0748  75c7             jne 0x711                                
  074a  837ef600         cmp word ptr [bp - 0xa], 0               
  074e  7402             je 0x752                                 
  0750  33ff             xor di, di                               
  0752  b90800           mov cx, 8                                
  0755  be5e5e           mov si, 0x5e5e                           
  0758  eb37             jmp 0x791                                
  075a  8b04             mov ax, word ptr [si]                    
  075c  0b4402           or ax, word ptr [si + 2]                 
  075f  7430             je 0x791                                 
  0761  c41c             les bx, ptr [si]                         
  0763  268a4704         mov al, byte ptr es:[bx + 4]             
  0767  98               cwde                                     
  0768  ba0600           mov dx, 6                                
  076b  f7ea             imul dx                                  
  076d  8bd8             mov bx, ax                               
  076f  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0774  751b             jne 0x791                                
  0776  8b1c             mov bx, word ptr [si]                    
  0778  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  077d  7504             jne 0x783                                
  077f  0bff             or di, di                                
  0781  750e             jne 0x791                                
  0783  c41c             les bx, ptr [si]                         
  0785  26814f0c0010     or word ptr es:[bx + 0xc], 0x1000        
  078b  c706c45d0100     mov word ptr [0x5dc4], 1                 
  0791  83ee04           sub si, 4                                
  0794  8bc1             mov ax, cx                               
  0796  49               dec cx                                   
  0797  0bc0             or ax, ax                                
  0799  75bf             jne 0x75a                                
  079b  c41e625e         les bx, ptr [0x5e62]                     
  079f  268b4702         mov ax, word ptr es:[bx + 2]             
  07a3  bae000           mov dx, 0xe0                             
  07a6  f7ea             imul dx                                  
  07a8  268b17           mov dx, word ptr es:[bx]                 
  07ab  d1e2             shl dx, 1                                
  07ad  03c2             add ax, dx                               
  07af  ba1d1e           mov dx, 0x1e1d                           
  07b2  8bd8             mov bx, ax                               
  07b4  8ec2             mov es, dx                               
  07b6  26808f010010     or byte ptr es:[bx + 1], 0x10            
  07bc  b8042c           mov ax, 0x2c04                           
  07bf  8ec0             mov es, ax                               
  07c1  26a11001         mov ax, word ptr es:[0x110]              
  07c5  250f00           and ax, 0xf                              
  07c8  c41e625e         les bx, ptr [0x5e62]                     
  07cc  50               push ax                                  
  07cd  268b4702         mov ax, word ptr es:[bx + 2]             
  07d1  bae000           mov dx, 0xe0                             
  07d4  f7ea             imul dx                                  
  07d6  268b17           mov dx, word ptr es:[bx]                 
  07d9  d1e2             shl dx, 1                                
  07db  03c2             add ax, dx                               
  07dd  ba1d1e           mov dx, 0x1e1d                           
  07e0  8bd8             mov bx, ax                               
  07e2  8ec2             mov es, dx                               
  07e4  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  07ea  58               pop ax                                   
  07eb  2608870100       or byte ptr es:[bx + 1], al              
  07f0  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  07f5  5f               pop di                                   
  07f6  5e               pop si                                   
  07f7  c9               leave                                    
  07f8  cb               retf                                     

res_0a8b_07f9:  ; ENTRY
  07f9  55               push bp                                  
  07fa  8bec             mov bp, sp                               
  07fc  83ec7a           sub sp, 0x7a                             
  07ff  56               push si                                  
  0800  57               push di                                  
  0801  c45e06           les bx, ptr [bp + 6]                     
  0804  268b07           mov ax, word ptr es:[bx]                 
  0807  8946fe           mov word ptr [bp - 2], ax                
  080a  268b4702         mov ax, word ptr es:[bx + 2]             
  080e  8946fc           mov word ptr [bp - 4], ax                
  0811  c746fa0000       mov word ptr [bp - 6], 0                 
  0816  c746f80000       mov word ptr [bp - 8], 0                 
  081b  c746f60000       mov word ptr [bp - 0xa], 0               
  0820  833eda2b00       cmp word ptr [0x2bda], 0                 
  0825  7405             je 0x82c                                 
  0827  a1fe5d           mov ax, word ptr [0x5dfe]                
  082a  eb03             jmp 0x82f                                
  082c  b80100           mov ax, 1                                
  082f  8946f4           mov word ptr [bp - 0xc], ax              
  0832  833eda2b00       cmp word ptr [0x2bda], 0                 
  0837  7405             je 0x83e                                 
  0839  a1005e           mov ax, word ptr [0x5e00]                
  083c  eb09             jmp 0x847                                
  083e  c41e625e         les bx, ptr [0x5e62]                     
  0842  268a4707         mov al, byte ptr es:[bx + 7]             
  0846  98               cwde                                     
  0847  8946f2           mov word ptr [bp - 0xe], ax              
  084a  c706c45d0000     mov word ptr [0x5dc4], 0                 
  0850  16               push ss                                  
  0851  8d4686           lea ax, [bp - 0x7a]                      
  0854  50               push ax                                  
  0855  ff76f2           push word ptr [bp - 0xe]                 
  0858  66ff7606         push dword ptr [bp + 6]                  
  085c  9abe185505       lcall 0x555, 0x18be                      -> 0555:18be
  0861  83c40a           add sp, 0xa                              
  0864  8946f0           mov word ptr [bp - 0x10], ax             
  0867  a3aa2e           mov word ptr [0x2eaa], ax                
  086a  33f6             xor si, si                               
  086c  e95a01           jmp 0x9c9                                
  086f  c45e06           les bx, ptr [bp + 6]                     
  0872  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0876  03de             add bx, si                               
  0878  26803fff         cmp byte ptr es:[bx], 0xff               
  087c  7425             je 0x8a3                                 
  087e  c45e06           les bx, ptr [bp + 6]                     
  0881  26c45f0c         les bx, ptr es:[bx + 0xc]                
  0885  03de             add bx, si                               
  0887  268a07           mov al, byte ptr es:[bx]                 
  088a  b400             mov ah, 0                                
  088c  50               push ax                                  
  088d  16               push ss                                  
  088e  8d46fc           lea ax, [bp - 4]                         
  0891  50               push ax                                  
  0892  16               push ss                                  
  0893  8d46fe           lea ax, [bp - 2]                         
  0896  50               push ax                                  
  0897  90               nop                                      
  0898  0e               push cs                                  
  0899  e8b102           call 0xb4d                               
  089c  83c40a           add sp, 0xa                              
  089f  0bc0             or ax, ax                                
  08a1  7508             jne 0x8ab                                
  08a3  c746f60400       mov word ptr [bp - 0xa], 4               
  08a8  e92601           jmp 0x9d1                                
  08ab  8b46fc           mov ax, word ptr [bp - 4]                
  08ae  bae000           mov dx, 0xe0                             
  08b1  f7ea             imul dx                                  
  08b3  8bc8             mov cx, ax                               
  08b5  8b56fe           mov dx, word ptr [bp - 2]                
  08b8  d1e2             shl dx, 1                                
  08ba  03c2             add ax, dx                               
  08bc  ba1d1e           mov dx, 0x1e1d                           
  08bf  8bd8             mov bx, ax                               
  08c1  8ec2             mov es, dx                               
  08c3  268a870100       mov al, byte ptr es:[bx + 1]             
  08c8  250f00           and ax, 0xf                              
  08cb  8bf8             mov di, ax                               
  08cd  8bd9             mov bx, cx                               
  08cf  8b46fe           mov ax, word ptr [bp - 2]                
  08d2  d1e0             shl ax, 1                                
  08d4  03d8             add bx, ax                               
  08d6  b81d1e           mov ax, 0x1e1d                           
  08d9  8ec0             mov es, ax                               
  08db  268a9f0000       mov bl, byte ptr es:[bx]                 
  08e0  81e3ff00         and bx, 0xff                             
  08e4  b8042c           mov ax, 0x2c04                           
  08e7  8ec0             mov es, ax                               
  08e9  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  08ef  7520             jne 0x911                                
  08f1  b8042c           mov ax, 0x2c04                           
  08f4  8ec0             mov es, ax                               
  08f6  26393e1001       cmp word ptr es:[0x110], di              
  08fb  7414             je 0x911                                 
  08fd  c746f60500       mov word ptr [bp - 0xa], 5               
  0902  8b46fe           mov ax, word ptr [bp - 2]                
  0905  a3c85d           mov word ptr [0x5dc8], ax                
  0908  8b46fc           mov ax, word ptr [bp - 4]                
  090b  a3c65d           mov word ptr [0x5dc6], ax                
  090e  e9c000           jmp 0x9d1                                
  0911  8bd9             mov bx, cx                               
  0913  8b46fe           mov ax, word ptr [bp - 2]                
  0916  d1e0             shl ax, 1                                
  0918  03d8             add bx, ax                               
  091a  b81d1e           mov ax, 0x1e1d                           
  091d  8ec0             mov es, ax                               
  091f  268a870100       mov al, byte ptr es:[bx + 1]             
  0924  c1e804           shr ax, 4                                
  0927  250100           and ax, 1                                
  092a  0bc0             or ax, ax                                
  092c  743a             je 0x968                                 
  092e  b8042c           mov ax, 0x2c04                           
  0931  8ec0             mov es, ax                               
  0933  26a11001         mov ax, word ptr es:[0x110]              
  0937  8bd0             mov dx, ax                               
  0939  3bc7             cmp ax, di                               
  093b  742b             je 0x968                                 
  093d  8bda             mov bx, dx                               
  093f  c1e303           shl bx, 3                                
  0942  03df             add bx, di                               
  0944  b8042c           mov ax, 0x2c04                           
  0947  8ec0             mov es, ax                               
  0949  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  094e  250300           and ax, 3                                
  0951  0bc0             or ax, ax                                
  0953  7413             je 0x968                                 
  0955  c746f60300       mov word ptr [bp - 0xa], 3               
  095a  8b46fe           mov ax, word ptr [bp - 2]                
  095d  a3c85d           mov word ptr [0x5dc8], ax                
  0960  8b46fc           mov ax, word ptr [bp - 4]                
  0963  a3c65d           mov word ptr [0x5dc6], ax                
  0966  eb69             jmp 0x9d1                                
  0968  16               push ss                                  
  0969  8d46ea           lea ax, [bp - 0x16]                      
  096c  50               push ax                                  
  096d  ff76fc           push word ptr [bp - 4]                   
  0970  ff76fe           push word ptr [bp - 2]                   
  0973  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0978  83c408           add sp, 8                                
  097b  8b46f4           mov ax, word ptr [bp - 0xc]              
  097e  0346ea           add ax, word ptr [bp - 0x16]             
  0981  3d0800           cmp ax, 8                                
  0984  7f31             jg 0x9b7                                 
  0986  8b46fc           mov ax, word ptr [bp - 4]                
  0989  bae000           mov dx, 0xe0                             
  098c  f7ea             imul dx                                  
  098e  8b56fe           mov dx, word ptr [bp - 2]                
  0991  d1e2             shl dx, 1                                
  0993  03c2             add ax, dx                               
  0995  ba1d1e           mov dx, 0x1e1d                           
  0998  8bd8             mov bx, ax                               
  099a  8ec2             mov es, dx                               
  099c  268a870100       mov al, byte ptr es:[bx + 1]             
  09a1  c1e804           shr ax, 4                                
  09a4  250100           and ax, 1                                
  09a7  0bc0             or ax, ax                                
  09a9  7411             je 0x9bc                                 
  09ab  b8042c           mov ax, 0x2c04                           
  09ae  8ec0             mov es, ax                               
  09b0  26393e1001       cmp word ptr es:[0x110], di              
  09b5  7405             je 0x9bc                                 
  09b7  ff46f8           inc word ptr [bp - 8]                    
  09ba  eb0c             jmp 0x9c8                                
  09bc  8b46f8           mov ax, word ptr [bp - 8]                
  09bf  40               inc ax                                   
  09c0  0146fa           add word ptr [bp - 6], ax                
  09c3  c746f80000       mov word ptr [bp - 8], 0                 
  09c8  46               inc si                                   
  09c9  3b76f0           cmp si, word ptr [bp - 0x10]             
  09cc  7d03             jge 0x9d1                                
  09ce  e99efe           jmp 0x86f                                
  09d1  837efa00         cmp word ptr [bp - 6], 0                 
  09d5  7503             jne 0x9da                                
  09d7  e99f00           jmp 0xa79                                
  09da  8d4685           lea ax, [bp - 0x7b]                      
  09dd  8b5efa           mov bx, word ptr [bp - 6]                
  09e0  03d8             add bx, ax                               
  09e2  368a07           mov al, byte ptr ss:[bx]                 
  09e5  b400             mov ah, 0                                
  09e7  8946ea           mov word ptr [bp - 0x16], ax             
  09ea  ff76fa           push word ptr [bp - 6]                   
  09ed  66ff7606         push dword ptr [bp + 6]                  
  09f1  0e               push cs                                  
  09f2  e8d3fa           call 0x4c8                               
  09f5  83c406           add sp, 6                                
  09f8  833eda2b00       cmp word ptr [0x2bda], 0                 
  09fd  7457             je 0xa56                                 
  09ff  a1005e           mov ax, word ptr [0x5e00]                
  0a02  2b46ea           sub ax, word ptr [bp - 0x16]             
  0a05  8946ec           mov word ptr [bp - 0x14], ax             
  0a08  7d04             jge 0xa0e                                
  0a0a  33c0             xor ax, ax                               
  0a0c  eb03             jmp 0xa11                                
  0a0e  8b46ec           mov ax, word ptr [bp - 0x14]             
  0a11  a3005e           mov word ptr [0x5e00], ax                
  0a14  b90800           mov cx, 8                                
  0a17  ba5e5e           mov dx, 0x5e5e                           
  0a1a  eb2e             jmp 0xa4a                                
  0a1c  8bda             mov bx, dx                               
  0a1e  8b07             mov ax, word ptr [bx]                    
  0a20  0b4702           or ax, word ptr [bx + 2]                 
  0a23  7425             je 0xa4a                                 
  0a25  8bda             mov bx, dx                               
  0a27  c41f             les bx, ptr [bx]                         
  0a29  268a4707         mov al, byte ptr es:[bx + 7]             
  0a2d  98               cwde                                     
  0a2e  2b46ea           sub ax, word ptr [bp - 0x16]             
  0a31  7d04             jge 0xa37                                
  0a33  b000             mov al, 0                                
  0a35  eb0b             jmp 0xa42                                
  0a37  8bda             mov bx, dx                               
  0a39  c41f             les bx, ptr [bx]                         
  0a3b  268a4707         mov al, byte ptr es:[bx + 7]             
  0a3f  2a46ea           sub al, byte ptr [bp - 0x16]             
  0a42  8bda             mov bx, dx                               
  0a44  c41f             les bx, ptr [bx]                         
  0a46  26884707         mov byte ptr es:[bx + 7], al             
  0a4a  83ea04           sub dx, 4                                
  0a4d  8bc1             mov ax, cx                               
  0a4f  49               dec cx                                   
  0a50  0bc0             or ax, ax                                
  0a52  75c8             jne 0xa1c                                
  0a54  eb23             jmp 0xa79                                
  0a56  c41e625e         les bx, ptr [0x5e62]                     
  0a5a  268a4707         mov al, byte ptr es:[bx + 7]             
  0a5e  8846ef           mov byte ptr [bp - 0x11], al             
  0a61  98               cwde                                     
  0a62  2b46ea           sub ax, word ptr [bp - 0x16]             
  0a65  7d04             jge 0xa6b                                
  0a67  b000             mov al, 0                                
  0a69  eb06             jmp 0xa71                                
  0a6b  8a46ef           mov al, byte ptr [bp - 0x11]             
  0a6e  2a46ea           sub al, byte ptr [bp - 0x16]             
  0a71  c41e625e         les bx, ptr [0x5e62]                     
  0a75  26884707         mov byte ptr es:[bx + 7], al             
  0a79  833eda2b00       cmp word ptr [0x2bda], 0                 
  0a7e  7405             je 0xa85                                 
  0a80  a1005e           mov ax, word ptr [0x5e00]                
  0a83  eb09             jmp 0xa8e                                
  0a85  c41e625e         les bx, ptr [0x5e62]                     
  0a89  268a4707         mov al, byte ptr es:[bx + 7]             
  0a8d  98               cwde                                     
  0a8e  8bd0             mov dx, ax                               
  0a90  83fa02           cmp dx, 2                                
  0a93  7c2b             jl 0xac0                                 
  0a95  837efa00         cmp word ptr [bp - 6], 0                 
  0a99  742a             je 0xac5                                 
  0a9b  837ef605         cmp word ptr [bp - 0xa], 5               
  0a9f  7424             je 0xac5                                 
  0aa1  837ef603         cmp word ptr [bp - 0xa], 3               
  0aa5  741e             je 0xac5                                 
  0aa7  8d4686           lea ax, [bp - 0x7a]                      
  0aaa  8b5efa           mov bx, word ptr [bp - 6]                
  0aad  03d8             add bx, ax                               
  0aaf  8bf3             mov si, bx                               
  0ab1  36803fff         cmp byte ptr ss:[bx], 0xff               
  0ab5  740e             je 0xac5                                 
  0ab7  368a04           mov al, byte ptr ss:[si]                 
  0aba  b400             mov ah, 0                                
  0abc  3bc2             cmp ax, dx                               
  0abe  7e05             jle 0xac5                                
  0ac0  c746f60200       mov word ptr [bp - 0xa], 2               
  0ac5  8b46f6           mov ax, word ptr [bp - 0xa]              
  0ac8  5f               pop di                                   
  0ac9  5e               pop si                                   
  0aca  c9               leave                                    
  0acb  cb               retf                                     

res_0a8b_0acc:  ; ENTRY
  0acc  55               push bp                                  
  0acd  8bec             mov bp, sp                               
  0acf  ff760c           push word ptr [bp + 0xc]                 
  0ad2  ff760a           push word ptr [bp + 0xa]                 
  0ad5  ff7608           push word ptr [bp + 8]                   
  0ad8  ff7606           push word ptr [bp + 6]                   
  0adb  ff1eb869         lcall [0x69b8]                           
  0adf  83c408           add sp, 8                                
  0ae2  5d               pop bp                                   
  0ae3  cb               retf                                     

res_0a8b_0ae4:  ; ENTRY
  0ae4  55               push bp                                  
  0ae5  8bec             mov bp, sp                               
  0ae7  56               push si                                  
  0ae8  8b4e06           mov cx, word ptr [bp + 6]                
  0aeb  8b5608           mov dx, word ptr [bp + 8]                
  0aee  8b760a           mov si, word ptr [bp + 0xa]              
  0af1  8b5e0c           mov bx, word ptr [bp + 0xc]              
  0af4  3bce             cmp cx, si                               
  0af6  750a             jne 0xb02                                
  0af8  3bd3             cmp dx, bx                               
  0afa  7506             jne 0xb02                                
  0afc  b8ff00           mov ax, 0xff                             
  0aff  5e               pop si                                   
  0b00  5d               pop bp                                   
  0b01  cb               retf                                     
  0b02  3bce             cmp cx, si                               
  0b04  750f             jne 0xb15                                
  0b06  3bd3             cmp dx, bx                               
  0b08  7e05             jle 0xb0f                                
  0b0a  33c0             xor ax, ax                               
  0b0c  5e               pop si                                   
  0b0d  5d               pop bp                                   
  0b0e  cb               retf                                     
  0b0f  b80400           mov ax, 4                                
  0b12  5e               pop si                                   
  0b13  5d               pop bp                                   
  0b14  cb               retf                                     
  0b15  3bd3             cmp dx, bx                               
  0b17  7510             jne 0xb29                                
  0b19  3bce             cmp cx, si                               
  0b1b  7e06             jle 0xb23                                
  0b1d  b80600           mov ax, 6                                
  0b20  5e               pop si                                   
  0b21  5d               pop bp                                   
  0b22  cb               retf                                     
  0b23  b80200           mov ax, 2                                
  0b26  5e               pop si                                   
  0b27  5d               pop bp                                   
  0b28  cb               retf                                     
  0b29  3bce             cmp cx, si                               
  0b2b  7e10             jle 0xb3d                                
  0b2d  3bd3             cmp dx, bx                               
  0b2f  7e06             jle 0xb37                                
  0b31  b80700           mov ax, 7                                
  0b34  5e               pop si                                   
  0b35  5d               pop bp                                   
  0b36  cb               retf                                     
  0b37  b80500           mov ax, 5                                
  0b3a  5e               pop si                                   
  0b3b  5d               pop bp                                   
  0b3c  cb               retf                                     
  0b3d  3bd3             cmp dx, bx                               
  0b3f  7e06             jle 0xb47                                
  0b41  b80100           mov ax, 1                                
  0b44  5e               pop si                                   
  0b45  5d               pop bp                                   
  0b46  cb               retf                                     
  0b47  b80300           mov ax, 3                                
  0b4a  5e               pop si                                   
  0b4b  5d               pop bp                                   
  0b4c  cb               retf                                     

res_0a8b_0b4d:  ; ENTRY
  0b4d  55               push bp                                  
  0b4e  8bec             mov bp, sp                               
  0b50  56               push si                                  
  0b51  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0b54  8bd9             mov bx, cx                               
  0b56  d1e3             shl bx, 1                                
  0b58  c47606           les si, ptr [bp + 6]                     
  0b5b  268b14           mov dx, word ptr es:[si]                 
  0b5e  0397162b         add dx, word ptr [bx + 0x2b16]           
  0b62  8bd9             mov bx, cx                               
  0b64  d1e3             shl bx, 1                                
  0b66  c4760a           les si, ptr [bp + 0xa]                   
  0b69  268b0c           mov cx, word ptr es:[si]                 
  0b6c  038f042b         add cx, word ptr [bx + 0x2b04]           
  0b70  0bd2             or dx, dx                                
  0b72  7c0f             jl 0xb83                                 
  0b74  0bc9             or cx, cx                                
  0b76  7c0b             jl 0xb83                                 
  0b78  83fa70           cmp dx, 0x70                             
  0b7b  7406             je 0xb83                                 
  0b7d  81f99c00         cmp cx, 0x9c                             
  0b81  7505             jne 0xb88                                
  0b83  33c0             xor ax, ax                               
  0b85  5e               pop si                                   
  0b86  5d               pop bp                                   
  0b87  cb               retf                                     
  0b88  c45e06           les bx, ptr [bp + 6]                     
  0b8b  268917           mov word ptr es:[bx], dx                 
  0b8e  c45e0a           les bx, ptr [bp + 0xa]                   
  0b91  26890f           mov word ptr es:[bx], cx                 
  0b94  b80100           mov ax, 1                                
  0b97  5e               pop si                                   
  0b98  5d               pop bp                                   
  0b99  cb               retf                                     
  0b9a  55               push bp                                  
  0b9b  8bec             mov bp, sp                               
  0b9d  83ec04           sub sp, 4                                
  0ba0  56               push si                                  
  0ba1  57               push di                                  
  0ba2  c746fe0900       mov word ptr [bp - 2], 9                 
  0ba7  bf1200           mov di, 0x12                             
  0baa  8b760a           mov si, word ptr [bp + 0xa]              
  0bad  83c612           add si, 0x12                             
  0bb0  e98200           jmp 0xc35                                
  0bb3  8e460c           mov es, word ptr [bp + 0xc]              
  0bb6  26c704ff00       mov word ptr es:[si], 0xff               
  0bbb  8b4e06           mov cx, word ptr [bp + 6]                
  0bbe  038d3a2b         add cx, word ptr [di + 0x2b3a]           
  0bc2  8b4608           mov ax, word ptr [bp + 8]                
  0bc5  0385282b         add ax, word ptr [di + 0x2b28]           
  0bc9  8946fc           mov word ptr [bp - 4], ax                
  0bcc  0bc9             or cx, cx                                
  0bce  7c65             jl 0xc35                                 
  0bd0  83f970           cmp cx, 0x70                             
  0bd3  7d60             jge 0xc35                                
  0bd5  837efc00         cmp word ptr [bp - 4], 0                 
  0bd9  7c5a             jl 0xc35                                 
  0bdb  817efc9c00       cmp word ptr [bp - 4], 0x9c              
  0be0  7d53             jge 0xc35                                
  0be2  ba7000           mov dx, 0x70                             
  0be5  f7ea             imul dx                                  
  0be7  03c1             add ax, cx                               
  0be9  bad919           mov dx, 0x19d9                           
  0bec  8bd8             mov bx, ax                               
  0bee  8ec2             mov es, dx                               
  0bf0  268a870000       mov al, byte ptr es:[bx]                 
  0bf5  251f00           and ax, 0x1f                             
  0bf8  0bc0             or ax, ax                                
  0bfa  740a             je 0xc06                                 
  0bfc  8e460c           mov es, word ptr [bp + 0xc]              
  0bff  26c7040000       mov word ptr es:[si], 0                  
  0c04  eb2f             jmp 0xc35                                
  0c06  8b46fc           mov ax, word ptr [bp - 4]                
  0c09  bae000           mov dx, 0xe0                             
  0c0c  f7ea             imul dx                                  
  0c0e  8bd1             mov dx, cx                               
  0c10  d1e2             shl dx, 1                                
  0c12  03c2             add ax, dx                               
  0c14  ba1d1e           mov dx, 0x1e1d                           
  0c17  8bd8             mov bx, ax                               
  0c19  8ec2             mov es, dx                               
  0c1b  268a9f0000       mov bl, byte ptr es:[bx]                 
  0c20  81e3ff00         and bx, 0xff                             
  0c24  b8042c           mov ax, 0x2c04                           
  0c27  8ec0             mov es, ax                               
  0c29  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0c2e  98               cwde                                     
  0c2f  8e460c           mov es, word ptr [bp + 0xc]              
  0c32  268904           mov word ptr es:[si], ax                 
  0c35  83ef02           sub di, 2                                
  0c38  83ee02           sub si, 2                                
  0c3b  8b46fe           mov ax, word ptr [bp - 2]                
  0c3e  ff4efe           dec word ptr [bp - 2]                    
  0c41  0bc0             or ax, ax                                
  0c43  7403             je 0xc48                                 
  0c45  e96bff           jmp 0xbb3                                
  0c48  b80100           mov ax, 1                                
  0c4b  5f               pop di                                   
  0c4c  5e               pop si                                   
  0c4d  c9               leave                                    
  0c4e  cb               retf                                     

res_0a8b_0c4f:  ; ENTRY
  0c4f  55               push bp                                  
  0c50  8bec             mov bp, sp                               
  0c52  81ecd800         sub sp, 0xd8                             
  0c56  56               push si                                  
  0c57  57               push di                                  
  0c58  8b760a           mov si, word ptr [bp + 0xa]              
  0c5b  c41e625e         les bx, ptr [0x5e62]                     
  0c5f  8b4606           mov ax, word ptr [bp + 6]                
  0c62  26894712         mov word ptr es:[bx + 0x12], ax          
  0c66  8b4608           mov ax, word ptr [bp + 8]                
  0c69  26894714         mov word ptr es:[bx + 0x14], ax          
  0c6d  16               push ss                                  
  0c6e  8d8638ff         lea ax, [bp - 0xc8]                      
  0c72  50               push ax                                  
  0c73  16               push ss                                  
  0c74  8d8628ff         lea ax, [bp - 0xd8]                      
  0c78  50               push ax                                  
  0c79  9a68185505       lcall 0x555, 0x1868                      -> 0555:1868
  0c7e  83c408           add sp, 8                                
  0c81  16               push ss                                  
  0c82  8d8628ff         lea ax, [bp - 0xd8]                      
  0c86  50               push ax                                  
  0c87  9a0a005505       lcall 0x555, 0xa                         -> 0555:000a
  0c8c  83c404           add sp, 4                                
  0c8f  0bc0             or ax, ax                                
  0c91  7525             jne 0xcb8                                
  0c93  b8042c           mov ax, 0x2c04                           
  0c96  8ec0             mov es, ax                               
  0c98  268b1e1001       mov bx, word ptr es:[0x110]              
  0c9d  d1e3             shl bx, 1                                
  0c9f  b8042c           mov ax, 0x2c04                           
  0ca2  8ec0             mov es, ax                               
  0ca4  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0caa  7505             jne 0xcb1                                
  0cac  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0cb1  b80100           mov ax, 1                                
  0cb4  5f               pop di                                   
  0cb5  5e               pop si                                   
  0cb6  c9               leave                                    
  0cb7  cb               retf                                     
  0cb8  0bf6             or si, si                                
  0cba  751b             jne 0xcd7                                
  0cbc  16               push ss                                  
  0cbd  8d8638ff         lea ax, [bp - 0xc8]                      
  0cc1  50               push ax                                  
  0cc2  c41e625e         les bx, ptr [0x5e62]                     
  0cc6  26ff7702         push word ptr es:[bx + 2]                
  0cca  26ff37           push word ptr es:[bx]                    
  0ccd  9a63098c0c       lcall 0xc8c, 0x963                       -> 0c8c:0963
  0cd2  83c408           add sp, 8                                
  0cd5  eb0b             jmp 0xce2                                
  0cd7  33c0             xor ax, ax                               
  0cd9  a3aa2e           mov word ptr [0x2eaa], ax                
  0cdc  a3a62e           mov word ptr [0x2ea6], ax                
  0cdf  a3a82e           mov word ptr [0x2ea8], ax                
  0ce2  56               push si                                  
  0ce3  16               push ss                                  
  0ce4  8d8628ff         lea ax, [bp - 0xd8]                      
  0ce8  50               push ax                                  
  0ce9  0e               push cs                                  
  0cea  e80cfb           call 0x7f9                               
  0ced  83c406           add sp, 6                                
  0cf0  8bf8             mov di, ax                               
  0cf2  833ec45d00       cmp word ptr [0x5dc4], 0                 
  0cf7  7408             je 0xd01                                 
  0cf9  90               nop                                      
  0cfa  0e               push cs                                  
  0cfb  e81c00           call 0xd1a                               
  0cfe  bf0200           mov di, 2                                
  0d01  0bf6             or si, si                                
  0d03  750f             jne 0xd14                                
  0d05  9a39000c31       lcall 0x310c, 0x39                       -> ovl66:070d
  0d0a  9a2a000c31       lcall 0x310c, 0x2a                       -> ovl66:0000
  0d0f  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  0d14  8bc7             mov ax, di                               
  0d16  5f               pop di                                   
  0d17  5e               pop si                                   
  0d18  c9               leave                                    
  0d19  cb               retf                                     

res_0a8b_0d1a:  ; ENTRY
  0d1a  55               push bp                                  
  0d1b  8bec             mov bp, sp                               
  0d1d  b90800           mov cx, 8                                
  0d20  ba5e5e           mov dx, 0x5e5e                           
  0d23  eb44             jmp 0xd69                                
  0d25  8bda             mov bx, dx                               
  0d27  8b07             mov ax, word ptr [bx]                    
  0d29  0b4702           or ax, word ptr [bx + 2]                 
  0d2c  743b             je 0xd69                                 
  0d2e  a1c45d           mov ax, word ptr [0x5dc4]                
  0d31  3d0100           cmp ax, 1                                
  0d34  7407             je 0xd3d                                 
  0d36  3d0200           cmp ax, 2                                
  0d39  7419             je 0xd54                                 
  0d3b  eb2c             jmp 0xd69                                
  0d3d  8bda             mov bx, dx                               
  0d3f  c41f             les bx, ptr [bx]                         
  0d41  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0d47  7420             je 0xd69                                 
  0d49  8bda             mov bx, dx                               
  0d4b  8b1f             mov bx, word ptr [bx]                    
  0d4d  26c6470700       mov byte ptr es:[bx + 7], 0              
  0d52  eb15             jmp 0xd69                                
  0d54  8bda             mov bx, dx                               
  0d56  c41f             les bx, ptr [bx]                         
  0d58  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0d5e  7509             jne 0xd69                                
  0d60  8bda             mov bx, dx                               
  0d62  8b1f             mov bx, word ptr [bx]                    
  0d64  26c6470700       mov byte ptr es:[bx + 7], 0              
  0d69  83ea04           sub dx, 4                                
  0d6c  8bc1             mov ax, cx                               
  0d6e  49               dec cx                                   
  0d6f  0bc0             or ax, ax                                
  0d71  75b2             jne 0xd25                                
  0d73  5d               pop bp                                   
  0d74  cb               retf                                     
  0d75  55               push bp                                  
