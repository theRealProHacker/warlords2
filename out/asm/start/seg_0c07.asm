; seg 0c07  img 0xc070..0xc870  file off 0xcc70
  0c07:0000  e88bea           call 0xffffea8e                          -> 0c07:ea8e
  0c07:0003  cb               retf                                     

proc_0c07_0004:
  0c07:0004  55               push bp                                  
  0c07:0005  8bec             mov bp, sp                               
  0c07:0007  81ecc200         sub sp, 0xc2                             
  0c07:000b  56               push si                                  
  0c07:000c  57               push di                                  
  0c07:000d  33c0             xor ax, ax                               
  0c07:000f  be7a1a           mov si, 0x1a7a                           
  0c07:0012  c60400           mov byte ptr [si], 0                     
  0c07:0015  83c60b           add si, 0xb                              
  0c07:0018  40               inc ax                                   
  0c07:0019  81fee81a         cmp si, 0x1ae8                           
  0c07:001d  75f3             jne 0x12                                 
  0c07:001f  6a02             push 2                                   
  0c07:0021  1e               push ds                                  
  0c07:0022  68c20a           push 0xac2                                ; "sound.dat"
  0c07:0025  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0c07:002a  83c406           add sp, 6                                
  0c07:002d  8bf0             mov si, ax                               
  0c07:002f  0bf6             or si, si                                
  0c07:0031  7d06             jge 0x39                                 
  0c07:0033  b000             mov al, 0                                
  0c07:0035  5f               pop di                                   
  0c07:0036  5e               pop si                                   
  0c07:0037  c9               leave                                    
  0c07:0038  cb               retf                                     
  0c07:0039  6a50             push 0x50                                
  0c07:003b  16               push ss                                  
  0c07:003c  8d46a2           lea ax, [bp - 0x5e]                      
  0c07:003f  50               push ax                                  
  0c07:0040  56               push si                                  
  0c07:0041  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0c07:0046  83c408           add sp, 8                                
  0c07:0049  1e               push ds                                  
  0c07:004a  68b80a           push 0xab8                               
  0c07:004d  16               push ss                                  
  0c07:004e  8d8670ff         lea ax, [bp - 0x90]                      
  0c07:0052  50               push ax                                  
  0c07:0053  16               push ss                                  
  0c07:0054  8d863eff         lea ax, [bp - 0xc2]                      
  0c07:0058  50               push ax                                  
  0c07:0059  1e               push ds                                  
  0c07:005a  68cc0a           push 0xacc                                ; "%s %s %d"
  0c07:005d  16               push ss                                  
  0c07:005e  8d46a2           lea ax, [bp - 0x5e]                      
  0c07:0061  50               push ax                                  
  0c07:0062  9a16460000       lcall 0, 0x4616                          -> 0000:4616 [reloc]
  0c07:0067  83c414           add sp, 0x14                             
  0c07:006a  56               push si                                  
  0c07:006b  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0c07:0070  83c402           add sp, 2                                
  0c07:0073  8cd0             mov ax, ss                               
  0c07:0075  8db63eff         lea si, [bp - 0xc2]                      
  0c07:0079  1e               push ds                                  
  0c07:007a  07               pop es                                   
  0c07:007b  bfd50a           mov di, 0xad5                             ; "NO_SOUND"
  0c07:007e  50               push ax                                  
  0c07:007f  33c0             xor ax, ax                               
  0c07:0081  b9ffff           mov cx, 0xffff                           
  0c07:0084  f2ae             repne scasb al, byte ptr es:[di]         
  0c07:0086  f7d1             not cx                                   
  0c07:0088  2bf9             sub di, cx                               
  0c07:008a  8cd8             mov ax, ds                               
  0c07:008c  1f               pop ds                                   
  0c07:008d  50               push ax                                  
  0c07:008e  33c0             xor ax, ax                               
  0c07:0090  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c07:0092  1f               pop ds                                   
  0c07:0093  7405             je 0x9a                                  
  0c07:0095  1bc0             sbb ax, ax                               
  0c07:0097  1dffff           sbb ax, 0xffff                           
  0c07:009a  0bc0             or ax, ax                                
  0c07:009c  750b             jne 0xa9                                 
  0c07:009e  c606b60a00       mov byte ptr [0xab6], 0                  
  0c07:00a3  c706b80a0000     mov word ptr [0xab8], 0                  
  0c07:00a9  8cd0             mov ax, ss                               
  0c07:00ab  8db670ff         lea si, [bp - 0x90]                      
  0c07:00af  1e               push ds                                  
  0c07:00b0  07               pop es                                   
  0c07:00b1  bfde0a           mov di, 0xade                             ; "NO_SOUND"
  0c07:00b4  50               push ax                                  
  0c07:00b5  33c0             xor ax, ax                               
  0c07:00b7  b9ffff           mov cx, 0xffff                           
  0c07:00ba  f2ae             repne scasb al, byte ptr es:[di]         
  0c07:00bc  f7d1             not cx                                   
  0c07:00be  2bf9             sub di, cx                               
  0c07:00c0  8cd8             mov ax, ds                               
  0c07:00c2  1f               pop ds                                   
  0c07:00c3  50               push ax                                  
  0c07:00c4  33c0             xor ax, ax                               
  0c07:00c6  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c07:00c8  1f               pop ds                                   
  0c07:00c9  7405             je 0xd0                                  
  0c07:00cb  1bc0             sbb ax, ax                               
  0c07:00cd  1dffff           sbb ax, 0xffff                           
  0c07:00d0  0bc0             or ax, ax                                
  0c07:00d2  7505             jne 0xd9                                 
  0c07:00d4  c606b70a00       mov byte ptr [0xab7], 0                  
  0c07:00d9  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:00dc  98               cwde                                     
  0c07:00dd  0bc0             or ax, ax                                
  0c07:00df  7513             jne 0xf4                                 
  0c07:00e1  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:00e4  98               cwde                                     
  0c07:00e5  0bc0             or ax, ax                                
  0c07:00e7  750b             jne 0xf4                                 
  0c07:00e9  c606ba0a01       mov byte ptr [0xaba], 1                  
  0c07:00ee  b001             mov al, 1                                
  0c07:00f0  5f               pop di                                   
  0c07:00f1  5e               pop si                                   
  0c07:00f2  c9               leave                                    
  0c07:00f3  cb               retf                                     
  0c07:00f4  803eb60a00       cmp byte ptr [0xab6], 0                  
  0c07:00f9  7450             je 0x14b                                 
  0c07:00fb  8cd0             mov ax, ss                               
  0c07:00fd  8db63eff         lea si, [bp - 0xc2]                      
  0c07:0101  1e               push ds                                  
  0c07:0102  07               pop es                                   
  0c07:0103  bfe70a           mov di, 0xae7                             ; "IBMBAK.COM"
  0c07:0106  50               push ax                                  
  0c07:0107  33c0             xor ax, ax                               
  0c07:0109  b9ffff           mov cx, 0xffff                           
  0c07:010c  f2ae             repne scasb al, byte ptr es:[di]         
  0c07:010e  f7d1             not cx                                   
  0c07:0110  2bf9             sub di, cx                               
  0c07:0112  8cd8             mov ax, ds                               
  0c07:0114  1f               pop ds                                   
  0c07:0115  50               push ax                                  
  0c07:0116  33c0             xor ax, ax                               
  0c07:0118  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c07:011a  1f               pop ds                                   
  0c07:011b  7405             je 0x122                                 
  0c07:011d  1bc0             sbb ax, ax                               
  0c07:011f  1dffff           sbb ax, 0xffff                           
  0c07:0122  0bc0             or ax, ax                                
  0c07:0124  7505             jne 0x12b                                
  0c07:0126  c606bf0a01       mov byte ptr [0xabf], 1                  
  0c07:012b  a0bf0a           mov al, byte ptr [0xabf]                 
  0c07:012e  98               cwde                                     
  0c07:012f  0bc0             or ax, ax                                
  0c07:0131  7518             jne 0x14b                                
  0c07:0133  16               push ss                                  
  0c07:0134  8d863eff         lea ax, [bp - 0xc2]                      
  0c07:0138  50               push ax                                  
  0c07:0139  9af5030000       lcall 0, 0x3f5                           -> 0000:03f5 [reloc]
  0c07:013e  83c404           add sp, 4                                
  0c07:0141  0bc0             or ax, ax                                
  0c07:0143  7506             jne 0x14b                                
  0c07:0145  b000             mov al, 0                                
  0c07:0147  5f               pop di                                   
  0c07:0148  5e               pop si                                   
  0c07:0149  c9               leave                                    
  0c07:014a  cb               retf                                     
  0c07:014b  803eb70a00       cmp byte ptr [0xab7], 0                  
  0c07:0150  7503             jne 0x155                                
  0c07:0152  e94401           jmp 0x299                                
  0c07:0155  6a00             push 0                                   
  0c07:0157  6a00             push 0                                   
  0c07:0159  16               push ss                                  
  0c07:015a  8d8670ff         lea ax, [bp - 0x90]                      
  0c07:015e  50               push ax                                  
  0c07:015f  9a60060000       lcall 0, 0x660                           -> 0000:0660 [reloc]
  0c07:0164  83c408           add sp, 8                                
  0c07:0167  8956fe           mov word ptr [bp - 2], dx                
  0c07:016a  8946fc           mov word ptr [bp - 4], ax                
  0c07:016d  0b46fe           or ax, word ptr [bp - 2]                 
  0c07:0170  7512             jne 0x184                                
  0c07:0172  1e               push ds                                  
  0c07:0173  68f20a           push 0xaf2                                ; "Unable to find ADV file"
  0c07:0176  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0c07:017b  83c404           add sp, 4                                
  0c07:017e  b000             mov al, 0                                
  0c07:0180  5f               pop di                                   
  0c07:0181  5e               pop si                                   
  0c07:0182  c9               leave                                    
  0c07:0183  cb               retf                                     
  0c07:0184  8b46fe           mov ax, word ptr [bp - 2]                
  0c07:0187  8b56fc           mov dx, word ptr [bp - 4]                
  0c07:018a  8946f4           mov word ptr [bp - 0xc], ax              
  0c07:018d  8956f2           mov word ptr [bp - 0xe], dx              
  0c07:0190  6a00             push 0                                   
  0c07:0192  6a00             push 0                                   
  0c07:0194  1e               push ds                                  
  0c07:0195  680b0b           push 0xb0b                                ; "MIDPAK.AD"
  0c07:0198  9a60060000       lcall 0, 0x660                           -> 0000:0660 [reloc]
  0c07:019d  83c408           add sp, 8                                
  0c07:01a0  8956fa           mov word ptr [bp - 6], dx                
  0c07:01a3  8946f8           mov word ptr [bp - 8], ax                
  0c07:01a6  0b46fa           or ax, word ptr [bp - 6]                 
  0c07:01a9  7512             jne 0x1bd                                
  0c07:01ab  1e               push ds                                  
  0c07:01ac  68150b           push 0xb15                                ; "Unable to find AD file"
  0c07:01af  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0c07:01b4  83c404           add sp, 4                                
  0c07:01b7  b000             mov al, 0                                
  0c07:01b9  5f               pop di                                   
  0c07:01ba  5e               pop si                                   
  0c07:01bb  c9               leave                                    
  0c07:01bc  cb               retf                                     
  0c07:01bd  1e               push ds                                  
  0c07:01be  682d0b           push 0xb2d                                ; "MIDPAK.COM"
  0c07:01c1  9a3b0d0000       lcall 0, 0xd3b                           -> 0000:0d3b [reloc]
  0c07:01c6  83c404           add sp, 4                                
  0c07:01c9  0bc0             or ax, ax                                
  0c07:01cb  7512             jne 0x1df                                
  0c07:01cd  1e               push ds                                  
  0c07:01ce  68380b           push 0xb38                                ; "Unable to load MIDPAK.COM"
  0c07:01d1  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0c07:01d6  83c404           add sp, 4                                
  0c07:01d9  b000             mov al, 0                                
  0c07:01db  5f               pop di                                   
  0c07:01dc  5e               pop si                                   
  0c07:01dd  c9               leave                                    
  0c07:01de  cb               retf                                     
  0c07:01df  ff76fa           push word ptr [bp - 6]                   
  0c07:01e2  ff76f8           push word ptr [bp - 8]                   
  0c07:01e5  ff76f4           push word ptr [bp - 0xc]                 
  0c07:01e8  ff76f2           push word ptr [bp - 0xe]                 
  0c07:01eb  9a150e0000       lcall 0, 0xe15                           -> 0000:0e15 [reloc]
  0c07:01f0  83c408           add sp, 8                                
  0c07:01f3  8946f6           mov word ptr [bp - 0xa], ax              
  0c07:01f6  837ef600         cmp word ptr [bp - 0xa], 0               
  0c07:01fa  7412             je 0x20e                                 
  0c07:01fc  1e               push ds                                  
  0c07:01fd  68530b           push 0xb53                                ; "Error initilizing driver."
  0c07:0200  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0c07:0205  83c404           add sp, 4                                
  0c07:0208  b000             mov al, 0                                
  0c07:020a  5f               pop di                                   
  0c07:020b  5e               pop si                                   
  0c07:020c  c9               leave                                    
  0c07:020d  cb               retf                                     
  0c07:020e  8cd0             mov ax, ss                               
  0c07:0210  8db670ff         lea si, [bp - 0x90]                      
  0c07:0214  1e               push ds                                  
  0c07:0215  07               pop es                                   
  0c07:0216  bf6e0b           mov di, 0xb6e                             ; "MT32MPU.ADV"
  0c07:0219  50               push ax                                  
  0c07:021a  33c0             xor ax, ax                               
  0c07:021c  b9ffff           mov cx, 0xffff                           
  0c07:021f  f2ae             repne scasb al, byte ptr es:[di]         
  0c07:0221  f7d1             not cx                                   
  0c07:0223  2bf9             sub di, cx                               
  0c07:0225  8cd8             mov ax, ds                               
  0c07:0227  1f               pop ds                                   
  0c07:0228  50               push ax                                  
  0c07:0229  33c0             xor ax, ax                               
  0c07:022b  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c07:022d  1f               pop ds                                   
  0c07:022e  7405             je 0x235                                 
  0c07:0230  1bc0             sbb ax, ax                               
  0c07:0232  1dffff           sbb ax, 0xffff                           
  0c07:0235  0bc0             or ax, ax                                
  0c07:0237  7505             jne 0x23e                                
  0c07:0239  c606c00a01       mov byte ptr [0xac0], 1                  
  0c07:023e  8cd0             mov ax, ss                               
  0c07:0240  8db670ff         lea si, [bp - 0x90]                      
  0c07:0244  1e               push ds                                  
  0c07:0245  07               pop es                                   
  0c07:0246  bf7a0b           mov di, 0xb7a                             ; "SC32MPU.ADV"
  0c07:0249  50               push ax                                  
  0c07:024a  33c0             xor ax, ax                               
  0c07:024c  b9ffff           mov cx, 0xffff                           
  0c07:024f  f2ae             repne scasb al, byte ptr es:[di]         
  0c07:0251  f7d1             not cx                                   
  0c07:0253  2bf9             sub di, cx                               
  0c07:0255  8cd8             mov ax, ds                               
  0c07:0257  1f               pop ds                                   
  0c07:0258  50               push ax                                  
  0c07:0259  33c0             xor ax, ax                               
  0c07:025b  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c07:025d  1f               pop ds                                   
  0c07:025e  7405             je 0x265                                 
  0c07:0260  1bc0             sbb ax, ax                               
  0c07:0262  1dffff           sbb ax, 0xffff                           
  0c07:0265  0bc0             or ax, ax                                
  0c07:0267  7505             jne 0x26e                                
  0c07:0269  c606c10a01       mov byte ptr [0xac1], 1                  
  0c07:026e  6a00             push 0                                   
  0c07:0270  6a03             push 3                                   
  0c07:0272  6a00             push 0                                   
  0c07:0274  6a00             push 0                                   
  0c07:0276  681027           push 0x2710                              
  0c07:0279  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  0c07:027e  83c40a           add sp, 0xa                              
  0c07:0281  8916681a         mov word ptr [0x1a68], dx                
  0c07:0285  a3661a           mov word ptr [0x1a66], ax                
  0c07:0288  52               push dx                                  
  0c07:0289  50               push ax                                  
  0c07:028a  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0c07:028f  83c404           add sp, 4                                
  0c07:0292  8916641a         mov word ptr [0x1a64], dx                
  0c07:0296  a3621a           mov word ptr [0x1a62], ax                
  0c07:0299  b001             mov al, 1                                
  0c07:029b  5f               pop di                                   
  0c07:029c  5e               pop si                                   
  0c07:029d  c9               leave                                    
  0c07:029e  cb               retf                                     
  0c07:029f  9aeb0d0000       lcall 0, 0xdeb                           -> 0000:0deb [reloc]
  0c07:02a4  9aa5040000       lcall 0, 0x4a5                           -> 0000:04a5 [reloc]
  0c07:02a9  cb               retf                                     
  0c07:02aa  833eb20aff       cmp word ptr [0xab2], -1                 
  0c07:02af  7438             je 0x2e9                                 
  0c07:02b1  90               nop                                      
  0c07:02b2  0e               push cs                                  
  0c07:02b3  e8f101           call 0x4a7                               -> 0c07:04a7
  0c07:02b6  98               cwde                                     
  0c07:02b7  0bc0             or ax, ax                                
  0c07:02b9  752e             jne 0x2e9                                
  0c07:02bb  f706bd0a0100     test word ptr [0xabd], 1                 
  0c07:02c1  7412             je 0x2d5                                 
  0c07:02c3  ff36bd0a         push word ptr [0xabd]                    
  0c07:02c7  ff36b20a         push word ptr [0xab2]                    
  0c07:02cb  90               nop                                      
  0c07:02cc  0e               push cs                                  
  0c07:02cd  e84101           call 0x411                               -> 0c07:0411
  0c07:02d0  83c404           add sp, 4                                
  0c07:02d3  eb14             jmp 0x2e9                                
  0c07:02d5  f706bd0a0200     test word ptr [0xabd], 2                 
  0c07:02db  7407             je 0x2e4                                 
  0c07:02dd  90               nop                                      
  0c07:02de  0e               push cs                                  
  0c07:02df  e88301           call 0x465                               -> 0c07:0465
  0c07:02e2  eb05             jmp 0x2e9                                
  0c07:02e4  90               nop                                      
  0c07:02e5  0e               push cs                                  
  0c07:02e6  e87c01           call 0x465                               -> 0c07:0465
  0c07:02e9  833eb40aff       cmp word ptr [0xab4], -1                 
  0c07:02ee  743d             je 0x32d                                 
  0c07:02f0  90               nop                                      
  0c07:02f1  0e               push cs                                  
  0c07:02f2  e86404           call 0x759                               -> 0c07:0759
  0c07:02f5  98               cwde                                     
  0c07:02f6  0bc0             or ax, ax                                
  0c07:02f8  7533             jne 0x32d                                
  0c07:02fa  f706bb0a0100     test word ptr [0xabb], 1                 
  0c07:0300  7411             je 0x313                                 
  0c07:0302  ff36bb0a         push word ptr [0xabb]                    
  0c07:0306  ff36b40a         push word ptr [0xab4]                    
  0c07:030a  90               nop                                      
  0c07:030b  0e               push cs                                  
  0c07:030c  e84e03           call 0x65d                               -> 0c07:065d
  0c07:030f  83c404           add sp, 4                                
  0c07:0312  cb               retf                                     
  0c07:0313  f706bb0a0200     test word ptr [0xabb], 2                 
  0c07:0319  740c             je 0x327                                 
  0c07:031b  90               nop                                      
  0c07:031c  0e               push cs                                  
  0c07:031d  e8d603           call 0x6f6                               -> 0c07:06f6
  0c07:0320  c706b40affff     mov word ptr [0xab4], 0xffff             
  0c07:0326  cb               retf                                     
  0c07:0327  c706b40affff     mov word ptr [0xab4], 0xffff             
  0c07:032d  cb               retf                                     

proc_0c07_032e:
  0c07:032e  55               push bp                                  
  0c07:032f  8bec             mov bp, sp                               
  0c07:0331  83ec56           sub sp, 0x56                             
  0c07:0334  56               push si                                  
  0c07:0335  57               push di                                  
  0c07:0336  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:0339  98               cwde                                     
  0c07:033a  0bc0             or ax, ax                                
  0c07:033c  7506             jne 0x344                                
  0c07:033e  b000             mov al, 0                                
  0c07:0340  5f               pop di                                   
  0c07:0341  5e               pop si                                   
  0c07:0342  c9               leave                                    
  0c07:0343  cb               retf                                     
  0c07:0344  16               push ss                                  
  0c07:0345  07               pop es                                   
  0c07:0346  8d7efa           lea di, [bp - 6]                         
  0c07:0349  be860b           mov si, 0xb86                            
  0c07:034c  b90100           mov cx, 1                                
  0c07:034f  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0c07:0351  803ec00a00       cmp byte ptr [0xac0], 0                  
  0c07:0356  740b             je 0x363                                 
  0c07:0358  8d7efa           lea di, [bp - 6]                         
  0c07:035b  be880b           mov si, 0xb88                            
  0c07:035e  b90100           mov cx, 1                                
  0c07:0361  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0c07:0363  803ec10a00       cmp byte ptr [0xac1], 0                  
  0c07:0368  740d             je 0x377                                 
  0c07:036a  16               push ss                                  
  0c07:036b  07               pop es                                   
  0c07:036c  8d7efa           lea di, [bp - 6]                         
  0c07:036f  be8a0b           mov si, 0xb8a                            
  0c07:0372  b90100           mov cx, 1                                
  0c07:0375  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0c07:0377  ff760c           push word ptr [bp + 0xc]                 
  0c07:037a  ff760a           push word ptr [bp + 0xa]                 
  0c07:037d  16               push ss                                  
  0c07:037e  8d46fa           lea ax, [bp - 6]                         
  0c07:0381  50               push ax                                  
  0c07:0382  ff7608           push word ptr [bp + 8]                   
  0c07:0385  ff7606           push word ptr [bp + 6]                   
  0c07:0388  1e               push ds                                  
  0c07:0389  688c0b           push 0xb8c                                ; "%s%s%s"
  0c07:038c  16               push ss                                  
  0c07:038d  8d46aa           lea ax, [bp - 0x56]                      
  0c07:0390  50               push ax                                  
  0c07:0391  9aa0450000       lcall 0, 0x45a0                          -> 0000:45a0 [reloc]
  0c07:0396  83c414           add sp, 0x14                             
  0c07:0399  6a02             push 2                                   
  0c07:039b  16               push ss                                  
  0c07:039c  8d46aa           lea ax, [bp - 0x56]                      
  0c07:039f  50               push ax                                  
  0c07:03a0  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0c07:03a5  83c406           add sp, 6                                
  0c07:03a8  8bf0             mov si, ax                               
  0c07:03aa  0bf6             or si, si                                
  0c07:03ac  7d06             jge 0x3b4                                
  0c07:03ae  b000             mov al, 0                                
  0c07:03b0  5f               pop di                                   
  0c07:03b1  5e               pop si                                   
  0c07:03b2  c9               leave                                    
  0c07:03b3  cb               retf                                     
  0c07:03b4  56               push si                                  
  0c07:03b5  9ab1004a06       lcall 0x64a, 0xb1                        -> 064a:00b1 [reloc]
  0c07:03ba  83c402           add sp, 2                                
  0c07:03bd  8956fe           mov word ptr [bp - 2], dx                
  0c07:03c0  8946fc           mov word ptr [bp - 4], ax                
  0c07:03c3  837efe00         cmp word ptr [bp - 2], 0                 
  0c07:03c7  7c13             jl 0x3dc                                 
  0c07:03c9  7f07             jg 0x3d2                                 
  0c07:03cb  817efc1027       cmp word ptr [bp - 4], 0x2710            
  0c07:03d0  760a             jbe 0x3dc                                
  0c07:03d2  c746fe0000       mov word ptr [bp - 2], 0                 
  0c07:03d7  c746fc0f27       mov word ptr [bp - 4], 0x270f            
  0c07:03dc  8b46fe           mov ax, word ptr [bp - 2]                
  0c07:03df  8b56fc           mov dx, word ptr [bp - 4]                
  0c07:03e2  a36c1a           mov word ptr [0x1a6c], ax                
  0c07:03e5  89166a1a         mov word ptr [0x1a6a], dx                
  0c07:03e9  52               push dx                                  
  0c07:03ea  ff36641a         push word ptr [0x1a64]                   
  0c07:03ee  ff36621a         push word ptr [0x1a62]                   
  0c07:03f2  56               push si                                  
  0c07:03f3  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0c07:03f8  83c408           add sp, 8                                
  0c07:03fb  56               push si                                  
  0c07:03fc  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0c07:0401  83c402           add sp, 2                                
  0c07:0404  b001             mov al, 1                                
  0c07:0406  5f               pop di                                   
  0c07:0407  5e               pop si                                   
  0c07:0408  c9               leave                                    
  0c07:0409  cb               retf                                     
  0c07:040a  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:040d  98               cwde                                     
  0c07:040e  0bc0             or ax, ax                                
  0c07:0410  cb               retf                                     

proc_0c07_0411:
  0c07:0411  55               push bp                                  
  0c07:0412  8bec             mov bp, sp                               
  0c07:0414  56               push si                                  
  0c07:0415  8b7606           mov si, word ptr [bp + 6]                
  0c07:0418  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:041b  98               cwde                                     
  0c07:041c  0bc0             or ax, ax                                
  0c07:041e  7442             je 0x462                                 
  0c07:0420  90               nop                                      
  0c07:0421  0e               push cs                                  
  0c07:0422  e88200           call 0x4a7                               -> 0c07:04a7
  0c07:0425  0ac0             or al, al                                
  0c07:0427  7405             je 0x42e                                 
  0c07:0429  90               nop                                      
  0c07:042a  0e               push cs                                  
  0c07:042b  e83700           call 0x465                               -> 0c07:0465
  0c07:042e  8936b20a         mov word ptr [0xab2], si                 
  0c07:0432  ff366c1a         push word ptr [0x1a6c]                   
  0c07:0436  ff366a1a         push word ptr [0x1a6a]                   
  0c07:043a  ff36641a         push word ptr [0x1a64]                   
  0c07:043e  ff36621a         push word ptr [0x1a62]                   
  0c07:0442  9a6f0c0000       lcall 0, 0xc6f                           -> 0000:0c6f [reloc]
  0c07:0447  83c408           add sp, 8                                
  0c07:044a  8bd0             mov dx, ax                               
  0c07:044c  0bd2             or dx, dx                                
  0c07:044e  7412             je 0x462                                 
  0c07:0450  83fa01           cmp dx, 1                                
  0c07:0453  56               push si                                  
  0c07:0454  9a4e0c0000       lcall 0, 0xc4e                           -> 0000:0c4e [reloc]
  0c07:0459  83c402           add sp, 2                                
  0c07:045c  8b4608           mov ax, word ptr [bp + 8]                
  0c07:045f  a3bd0a           mov word ptr [0xabd], ax                 
  0c07:0462  5e               pop si                                   
  0c07:0463  5d               pop bp                                   
  0c07:0464  cb               retf                                     
  0c07:0465  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:0468  98               cwde                                     
  0c07:0469  0bc0             or ax, ax                                
  0c07:046b  741d             je 0x48a                                 
  0c07:046d  9a8b0c0000       lcall 0, 0xc8b                           -> 0000:0c8b [reloc]
  0c07:0472  f706bd0a0200     test word ptr [0xabd], 2                 
  0c07:0478  7404             je 0x47e                                 
  0c07:047a  0e               push cs                                  
  0c07:047b  e88cff           call 0x40a                               -> 0c07:040a
  0c07:047e  c706b20affff     mov word ptr [0xab2], 0xffff             
  0c07:0484  c706bd0a0000     mov word ptr [0xabd], 0                  
  0c07:048a  cb               retf                                     
  0c07:048b  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:048e  98               cwde                                     
  0c07:048f  0bc0             or ax, ax                                
  0c07:0491  7405             je 0x498                                 
  0c07:0493  9a8b0c0000       lcall 0, 0xc8b                           -> 0000:0c8b [reloc]
  0c07:0498  cb               retf                                     
  0c07:0499  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:049c  98               cwde                                     
  0c07:049d  0bc0             or ax, ax                                
  0c07:049f  7405             je 0x4a6                                 
  0c07:04a1  9af70c0000       lcall 0, 0xcf7                           -> 0000:0cf7 [reloc]
  0c07:04a6  cb               retf                                     
  0c07:04a7  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:04aa  98               cwde                                     
  0c07:04ab  0bc0             or ax, ax                                
  0c07:04ad  7503             jne 0x4b2                                
  0c07:04af  b000             mov al, 0                                
  0c07:04b1  cb               retf                                     
  0c07:04b2  9afd0c0000       lcall 0, 0xcfd                           -> 0000:0cfd [reloc]
  0c07:04b7  3d0100           cmp ax, 1                                
  0c07:04ba  7503             jne 0x4bf                                
  0c07:04bc  b001             mov al, 1                                
  0c07:04be  cb               retf                                     
  0c07:04bf  b000             mov al, 0                                
  0c07:04c1  cb               retf                                     
  0c07:04c2  56               push si                                  
  0c07:04c3  a0b70a           mov al, byte ptr [0xab7]                 
  0c07:04c6  98               cwde                                     
  0c07:04c7  0bc0             or ax, ax                                
  0c07:04c9  741b             je 0x4e6                                 
  0c07:04cb  be6400           mov si, 0x64                             
  0c07:04ce  eb0b             jmp 0x4db                                
  0c07:04d0  6a00             push 0                                   
  0c07:04d2  56               push si                                  
  0c07:04d3  9a090d0000       lcall 0, 0xd09                           -> 0000:0d09 [reloc]
  0c07:04d8  83c404           add sp, 4                                
  0c07:04db  8bc6             mov ax, si                               
  0c07:04dd  4e               dec si                                   
  0c07:04de  0bc0             or ax, ax                                
  0c07:04e0  75ee             jne 0x4d0                                
  0c07:04e2  0e               push cs                                  
  0c07:04e3  e87fff           call 0x465                               -> 0c07:0465
  0c07:04e6  5e               pop si                                   
  0c07:04e7  cb               retf                                     

proc_0c07_04e8:
  0c07:04e8  55               push bp                                  
  0c07:04e9  8bec             mov bp, sp                               
  0c07:04eb  83ec06           sub sp, 6                                
  0c07:04ee  56               push si                                  
  0c07:04ef  57               push di                                  
  0c07:04f0  bfffff           mov di, 0xffff                           
  0c07:04f3  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:04f6  98               cwde                                     
  0c07:04f7  0bc0             or ax, ax                                
  0c07:04f9  7507             jne 0x502                                
  0c07:04fb  b8ffff           mov ax, 0xffff                           
  0c07:04fe  5f               pop di                                   
  0c07:04ff  5e               pop si                                   
  0c07:0500  c9               leave                                    
  0c07:0501  cb               retf                                     
  0c07:0502  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:0507  7406             je 0x50f                                 
  0c07:0509  33c0             xor ax, ax                               
  0c07:050b  5f               pop di                                   
  0c07:050c  5e               pop si                                   
  0c07:050d  c9               leave                                    
  0c07:050e  cb               retf                                     
  0c07:050f  33d2             xor dx, dx                               
  0c07:0511  be7a1a           mov si, 0x1a7a                           
  0c07:0514  8a04             mov al, byte ptr [si]                    
  0c07:0516  98               cwde                                     
  0c07:0517  0bc0             or ax, ax                                
  0c07:0519  7504             jne 0x51f                                
  0c07:051b  8bfa             mov di, dx                               
  0c07:051d  eb0a             jmp 0x529                                
  0c07:051f  83c60b           add si, 0xb                              
  0c07:0522  42               inc dx                                   
  0c07:0523  81fee81a         cmp si, 0x1ae8                           
  0c07:0527  75eb             jne 0x514                                
  0c07:0529  0bff             or di, di                                
  0c07:052b  7d03             jge 0x530                                
  0c07:052d  e9e700           jmp 0x617                                
  0c07:0530  6a02             push 2                                   
  0c07:0532  ff7608           push word ptr [bp + 8]                   
  0c07:0535  ff7606           push word ptr [bp + 6]                   
  0c07:0538  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0c07:053d  83c406           add sp, 6                                
  0c07:0540  8946fe           mov word ptr [bp - 2], ax                
  0c07:0543  837efe00         cmp word ptr [bp - 2], 0                 
  0c07:0547  7d07             jge 0x550                                
  0c07:0549  b8ffff           mov ax, 0xffff                           
  0c07:054c  5f               pop di                                   
  0c07:054d  5e               pop si                                   
  0c07:054e  c9               leave                                    
  0c07:054f  cb               retf                                     
  0c07:0550  ff76fe           push word ptr [bp - 2]                   
  0c07:0553  9ab1004a06       lcall 0x64a, 0xb1                        -> 064a:00b1 [reloc]
  0c07:0558  83c402           add sp, 2                                
  0c07:055b  8956fc           mov word ptr [bp - 4], dx                
  0c07:055e  8946fa           mov word ptr [bp - 6], ax                
  0c07:0561  6a00             push 0                                   
  0c07:0563  6a0d             push 0xd                                 
  0c07:0565  6a00             push 0                                   
  0c07:0567  52               push dx                                  
  0c07:0568  50               push ax                                  
  0c07:0569  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  0c07:056e  83c40a           add sp, 0xa                              
  0c07:0571  50               push ax                                  
  0c07:0572  8bc7             mov ax, di                               
  0c07:0574  bb0b00           mov bx, 0xb                              
  0c07:0577  52               push dx                                  
  0c07:0578  f7eb             imul bx                                  
  0c07:057a  8bf0             mov si, ax                               
  0c07:057c  8bd8             mov bx, ax                               
  0c07:057e  58               pop ax                                   
  0c07:057f  8987831a         mov word ptr [bx + 0x1a83], ax           
  0c07:0583  58               pop ax                                   
  0c07:0584  8987811a         mov word ptr [bx + 0x1a81], ax           
  0c07:0588  ffb4831a         push word ptr [si + 0x1a83]              
  0c07:058c  ffb4811a         push word ptr [si + 0x1a81]              
  0c07:0590  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0c07:0595  83c404           add sp, 4                                
  0c07:0598  50               push ax                                  
  0c07:0599  8bc7             mov ax, di                               
  0c07:059b  bb0b00           mov bx, 0xb                              
  0c07:059e  52               push dx                                  
  0c07:059f  f7eb             imul bx                                  
  0c07:05a1  8bf0             mov si, ax                               
  0c07:05a3  8bd8             mov bx, ax                               
  0c07:05a5  58               pop ax                                   
  0c07:05a6  89877f1a         mov word ptr [bx + 0x1a7f], ax           
  0c07:05aa  58               pop ax                                   
  0c07:05ab  89877d1a         mov word ptr [bx + 0x1a7d], ax           
  0c07:05af  c6847a1a01       mov byte ptr [si + 0x1a7a], 1            
  0c07:05b4  8b46fa           mov ax, word ptr [bp - 6]                
  0c07:05b7  89847b1a         mov word ptr [si + 0x1a7b], ax           
  0c07:05bb  50               push ax                                  
  0c07:05bc  ffb47f1a         push word ptr [si + 0x1a7f]              
  0c07:05c0  ffb47d1a         push word ptr [si + 0x1a7d]              
  0c07:05c4  ff76fe           push word ptr [bp - 2]                   
  0c07:05c7  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0c07:05cc  83c408           add sp, 8                                
  0c07:05cf  c706781af82a     mov word ptr [0x1a78], 0x2af8            
  0c07:05d5  8c1e761a         mov word ptr [0x1a76], ds                
  0c07:05d9  c706741a601a     mov word ptr [0x1a74], 0x1a60            
  0c07:05df  8bc7             mov ax, di                               
  0c07:05e1  ba0b00           mov dx, 0xb                              
  0c07:05e4  f7ea             imul dx                                  
  0c07:05e6  8bf0             mov si, ax                               
  0c07:05e8  8bd8             mov bx, ax                               
  0c07:05ea  8b877b1a         mov ax, word ptr [bx + 0x1a7b]           
  0c07:05ee  a3721a           mov word ptr [0x1a72], ax                
  0c07:05f1  8b847f1a         mov ax, word ptr [si + 0x1a7f]           
  0c07:05f5  8b947d1a         mov dx, word ptr [si + 0x1a7d]           
  0c07:05f9  a3701a           mov word ptr [0x1a70], ax                
  0c07:05fc  89166e1a         mov word ptr [0x1a6e], dx                
  0c07:0600  1e               push ds                                  
  0c07:0601  686e1a           push 0x1a6e                              
  0c07:0604  9abb020000       lcall 0, 0x2bb                           -> 0000:02bb [reloc]
  0c07:0609  83c404           add sp, 4                                
  0c07:060c  ff76fe           push word ptr [bp - 2]                   
  0c07:060f  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0c07:0614  83c402           add sp, 2                                
  0c07:0617  8bc7             mov ax, di                               
  0c07:0619  5f               pop di                                   
  0c07:061a  5e               pop si                                   
  0c07:061b  c9               leave                                    
  0c07:061c  cb               retf                                     

proc_0c07_061d:
  0c07:061d  55               push bp                                  
  0c07:061e  8bec             mov bp, sp                               
  0c07:0620  56               push si                                  
  0c07:0621  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:0624  98               cwde                                     
  0c07:0625  0bc0             or ax, ax                                
  0c07:0627  7431             je 0x65a                                 
  0c07:0629  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:062e  752a             jne 0x65a                                
  0c07:0630  8b4606           mov ax, word ptr [bp + 6]                
  0c07:0633  ba0b00           mov dx, 0xb                              
  0c07:0636  f7ea             imul dx                                  
  0c07:0638  8bf0             mov si, ax                               
  0c07:063a  8bd8             mov bx, ax                               
  0c07:063c  8a877a1a         mov al, byte ptr [bx + 0x1a7a]           
  0c07:0640  98               cwde                                     
  0c07:0641  0bc0             or ax, ax                                
  0c07:0643  7415             je 0x65a                                 
  0c07:0645  c6847a1a00       mov byte ptr [si + 0x1a7a], 0            
  0c07:064a  ffb4831a         push word ptr [si + 0x1a83]              
  0c07:064e  ffb4811a         push word ptr [si + 0x1a81]              
  0c07:0652  9a8804870c       lcall 0xc87, 0x488                       -> 0c87:0488 [reloc]
  0c07:0657  83c404           add sp, 4                                
  0c07:065a  5e               pop si                                   
  0c07:065b  5d               pop bp                                   
  0c07:065c  cb               retf                                     

proc_0c07_065d:
  0c07:065d  55               push bp                                  
  0c07:065e  8bec             mov bp, sp                               
  0c07:0660  83ec02           sub sp, 2                                
  0c07:0663  56               push si                                  
  0c07:0664  8b7606           mov si, word ptr [bp + 6]                
  0c07:0667  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:066a  98               cwde                                     
  0c07:066b  0bc0             or ax, ax                                
  0c07:066d  7503             jne 0x672                                
  0c07:066f  e98100           jmp 0x6f3                                
  0c07:0672  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:0677  7411             je 0x68a                                 
  0c07:0679  6a07             push 7                                   
  0c07:067b  1e               push ds                                  
  0c07:067c  68930b           push 0xb93                               
  0c07:067f  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0c07:0684  83c406           add sp, 6                                
  0c07:0687  5e               pop si                                   
  0c07:0688  c9               leave                                    
  0c07:0689  cb               retf                                     
  0c07:068a  8bc6             mov ax, si                               
  0c07:068c  ba0b00           mov dx, 0xb                              
  0c07:068f  f7ea             imul dx                                  
  0c07:0691  8bd8             mov bx, ax                               
  0c07:0693  8a877a1a         mov al, byte ptr [bx + 0x1a7a]           
  0c07:0697  98               cwde                                     
  0c07:0698  0bc0             or ax, ax                                
  0c07:069a  7457             je 0x6f3                                 
  0c07:069c  833eb40aff       cmp word ptr [0xab4], -1                 
  0c07:06a1  7405             je 0x6a8                                 
  0c07:06a3  90               nop                                      
  0c07:06a4  0e               push cs                                  
  0c07:06a5  e88d00           call 0x735                               -> 0c07:0735
  0c07:06a8  c706781af82a     mov word ptr [0x1a78], 0x2af8            
  0c07:06ae  8c1e761a         mov word ptr [0x1a76], ds                
  0c07:06b2  c706741a601a     mov word ptr [0x1a74], 0x1a60            
  0c07:06b8  8bc6             mov ax, si                               
  0c07:06ba  ba0b00           mov dx, 0xb                              
  0c07:06bd  f7ea             imul dx                                  
  0c07:06bf  8946fe           mov word ptr [bp - 2], ax                
  0c07:06c2  8bd8             mov bx, ax                               
  0c07:06c4  8b877b1a         mov ax, word ptr [bx + 0x1a7b]           
  0c07:06c8  a3721a           mov word ptr [0x1a72], ax                
  0c07:06cb  8b5efe           mov bx, word ptr [bp - 2]                
  0c07:06ce  8b877f1a         mov ax, word ptr [bx + 0x1a7f]           
  0c07:06d2  8b977d1a         mov dx, word ptr [bx + 0x1a7d]           
  0c07:06d6  a3701a           mov word ptr [0x1a70], ax                
  0c07:06d9  89166e1a         mov word ptr [0x1a6e], dx                
  0c07:06dd  8936b40a         mov word ptr [0xab4], si                 
  0c07:06e1  8b4608           mov ax, word ptr [bp + 8]                
  0c07:06e4  a3bb0a           mov word ptr [0xabb], ax                 
  0c07:06e7  1e               push ds                                  
  0c07:06e8  686e1a           push 0x1a6e                              
  0c07:06eb  9ace020000       lcall 0, 0x2ce                           -> 0000:02ce [reloc]
  0c07:06f0  83c404           add sp, 4                                
  0c07:06f3  5e               pop si                                   
  0c07:06f4  c9               leave                                    
  0c07:06f5  cb               retf                                     
  0c07:06f6  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:06f9  98               cwde                                     
  0c07:06fa  0bc0             or ax, ax                                
  0c07:06fc  7436             je 0x734                                 
  0c07:06fe  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:0703  752f             jne 0x734                                
  0c07:0705  833eb40aff       cmp word ptr [0xab4], -1                 
  0c07:070a  7428             je 0x734                                 
  0c07:070c  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5 [reloc]
  0c07:0711  0bc0             or ax, ax                                
  0c07:0713  75f7             jne 0x70c                                
  0c07:0715  f706bb0a0200     test word ptr [0xabb], 2                 
  0c07:071b  740b             je 0x728                                 
  0c07:071d  ff36b40a         push word ptr [0xab4]                    
  0c07:0721  0e               push cs                                  
  0c07:0722  e8f8fe           call 0x61d                               -> 0c07:061d
  0c07:0725  83c402           add sp, 2                                
  0c07:0728  c706b40affff     mov word ptr [0xab4], 0xffff             
  0c07:072e  c706bb0a0000     mov word ptr [0xabb], 0                  
  0c07:0734  cb               retf                                     
  0c07:0735  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:0738  98               cwde                                     
  0c07:0739  0bc0             or ax, ax                                
  0c07:073b  741b             je 0x758                                 
  0c07:073d  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:0742  7514             jne 0x758                                
  0c07:0744  833eb40aff       cmp word ptr [0xab4], -1                 
  0c07:0749  740d             je 0x758                                 
  0c07:074b  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5 [reloc]
  0c07:0750  0bc0             or ax, ax                                
  0c07:0752  75f7             jne 0x74b                                
  0c07:0754  0e               push cs                                  
  0c07:0755  e89eff           call 0x6f6                               -> 0c07:06f6
  0c07:0758  cb               retf                                     
  0c07:0759  a0b60a           mov al, byte ptr [0xab6]                 
  0c07:075c  98               cwde                                     
  0c07:075d  0bc0             or ax, ax                                
  0c07:075f  7503             jne 0x764                                
  0c07:0761  b000             mov al, 0                                
  0c07:0763  cb               retf                                     
  0c07:0764  803ebf0a00       cmp byte ptr [0xabf], 0                  
  0c07:0769  7403             je 0x76e                                 
  0c07:076b  b000             mov al, 0                                
  0c07:076d  cb               retf                                     
  0c07:076e  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5 [reloc]
  0c07:0773  cb               retf                                     
  0c07:0774  803eba0a00       cmp byte ptr [0xaba], 0                  
  0c07:0779  7505             jne 0x780                                
  0c07:077b  c606b70a01       mov byte ptr [0xab7], 1                  
  0c07:0780  cb               retf                                     
  0c07:0781  803eba0a00       cmp byte ptr [0xaba], 0                  
  0c07:0786  7511             jne 0x799                                
  0c07:0788  0e               push cs                                  
  0c07:0789  e81bfd           call 0x4a7                               -> 0c07:04a7
  0c07:078c  0ac0             or al, al                                
  0c07:078e  7404             je 0x794                                 
  0c07:0790  0e               push cs                                  
  0c07:0791  e8d1fc           call 0x465                               -> 0c07:0465
  0c07:0794  c606b70a00       mov byte ptr [0xab7], 0                  
  0c07:0799  cb               retf                                     
  0c07:079a  803eba0a00       cmp byte ptr [0xaba], 0                  
  0c07:079f  7505             jne 0x7a6                                
  0c07:07a1  c606b60a01       mov byte ptr [0xab6], 1                  
  0c07:07a6  cb               retf                                     
  0c07:07a7  803eba0a00       cmp byte ptr [0xaba], 0                  
  0c07:07ac  7511             jne 0x7bf                                
  0c07:07ae  0e               push cs                                  
  0c07:07af  e8a7ff           call 0x759                               -> 0c07:0759
  0c07:07b2  0ac0             or al, al                                
  0c07:07b4  7404             je 0x7ba                                 
  0c07:07b6  0e               push cs                                  
  0c07:07b7  e83cff           call 0x6f6                               -> 0c07:06f6
  0c07:07ba  c606b60a00       mov byte ptr [0xab6], 0                  
  0c07:07bf  cb               retf                                     

proc_0c07_07c0:
  0c07:07c0  55               push bp                                  
  0c07:07c1  8bec             mov bp, sp                               
  0c07:07c3  83ec04           sub sp, 4                                
  0c07:07c6  ff7606           push word ptr [bp + 6]                   
  0c07:07c9  9acf01870c       lcall 0xc87, 0x1cf                       -> 0c87:01cf [reloc]
  0c07:07ce  83c402           add sp, 2                                
  0c07:07d1  8956fe           mov word ptr [bp - 2], dx                
  0c07:07d4  8946fc           mov word ptr [bp - 4], ax                
  0c07:07d7  0b46fe           or ax, word ptr [bp - 2]                 
  0c07:07da  7505             jne 0x7e1                                
  0c07:07dc  b8ffff           mov ax, 0xffff                           
  0c07:07df  c9               leave                                    
  0c07:07e0  cb               retf                                     
  0c07:07e1  8b46fc           mov ax, word ptr [bp - 4]                
  0c07:07e4  c1f804           sar ax, 4                                
  0c07:07e7  c9               leave                                    
  0c07:07e8  cb               retf                                     

proc_0c07_07e9:
  0c07:07e9  55               push bp                                  
  0c07:07ea  8bec             mov bp, sp                               
  0c07:07ec  83ec04           sub sp, 4                                
  0c07:07ef  8b4606           mov ax, word ptr [bp + 6]                
  0c07:07f2  c1e004           shl ax, 4                                
  0c07:07f5  99               cdq                                      
  0c07:07f6  8956fe           mov word ptr [bp - 2], dx                
  0c07:07f9  8946fc           mov word ptr [bp - 4], ax                
  0c07:07fc  52               push dx                                  
  0c07:07fd  50               push ax                                  
  0c07:07fe  9a               db 9a
  0c07:07ff  07               pop es                                   
