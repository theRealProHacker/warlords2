; ovl44 stub 3058 file_off 0x653d0 size 0x17b1

ovl44_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  33c9             xor cx, cx                               
  0005  33d2             xor dx, dx                               
  0007  eb1a             jmp 0x23                                 
  0009  8b5e06           mov bx, word ptr [bp + 6]                
  000c  6bdb41           imul bx, bx, 0x41                        
  000f  03d9             add bx, cx                               
  0011  b8042c           mov ax, 0x2c04                           
  0014  8ec0             mov es, ax                               
  0016  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  001b  98               cwde                                     
  001c  3b4608           cmp ax, word ptr [bp + 8]                
  001f  7407             je 0x28                                  
  0021  42               inc dx                                   
  0022  41               inc cx                                   
  0023  83f904           cmp cx, 4                                
  0026  7ce1             jl 9                                     
  0028  83fa04           cmp dx, 4                                
  002b  7c02             jl 0x2f                                  
  002d  33d2             xor dx, dx                               
  002f  8bc2             mov ax, dx                               
  0031  5d               pop bp                                   
  0032  cb               retf                                     

ovl44_0033:  ; ENTRY
  0033  55               push bp                                  
  0034  8bec             mov bp, sp                               
  0036  8b1e980e         mov bx, word ptr [0xe98]                 
  003a  6bdb41           imul bx, bx, 0x41                        
  003d  b8042c           mov ax, 0x2c04                           
  0040  8ec0             mov es, ax                               
  0042  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  0047  8b1e980e         mov bx, word ptr [0xe98]                 
  004b  6bdb41           imul bx, bx, 0x41                        
  004e  b8042c           mov ax, 0x2c04                           
  0051  8ec0             mov es, ax                               
  0053  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  0058  6a02             push 2                                   
  005a  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  005f  83c406           add sp, 6                                
  0062  5d               pop bp                                   
  0063  cb               retf                                     

ovl44_0064:  ; ENTRY
  0064  55               push bp                                  
  0065  8bec             mov bp, sp                               
  0067  83ec0a           sub sp, 0xa                              
  006a  56               push si                                  
  006b  8b7606           mov si, word ptr [bp + 6]                
  006e  16               push ss                                  
  006f  8d46f6           lea ax, [bp - 0xa]                       
  0072  50               push ax                                  
  0073  16               push ss                                  
  0074  8d46f8           lea ax, [bp - 8]                         
  0077  50               push ax                                  
  0078  ff36980e         push word ptr [0xe98]                    
  007c  90               nop                                      
  007d  0e               push cs                                  
  007e  e88f03           call 0x410                               
  0081  83c40a           add sp, 0xa                              
  0084  3b76f6           cmp si, word ptr [bp - 0xa]              
  0087  7d3c             jge 0xc5                                 
  0089  8bde             mov bx, si                               
  008b  d1e3             shl bx, 1                                
  008d  8d46f8           lea ax, [bp - 8]                         
  0090  03d8             add bx, ax                               
  0092  368b1f           mov bx, word ptr ss:[bx]                 
  0095  6bdb41           imul bx, bx, 0x41                        
  0098  b8042c           mov ax, 0x2c04                           
  009b  8ec0             mov es, ax                               
  009d  26ffb77f15       push word ptr es:[bx + 0x157f]           
  00a2  8bde             mov bx, si                               
  00a4  d1e3             shl bx, 1                                
  00a6  8d46f8           lea ax, [bp - 8]                         
  00a9  03d8             add bx, ax                               
  00ab  368b1f           mov bx, word ptr ss:[bx]                 
  00ae  6bdb41           imul bx, bx, 0x41                        
  00b1  b8042c           mov ax, 0x2c04                           
  00b4  8ec0             mov es, ax                               
  00b6  26ffb77d15       push word ptr es:[bx + 0x157d]           
  00bb  6a02             push 2                                   
  00bd  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  00c2  83c406           add sp, 6                                
  00c5  5e               pop si                                   
  00c6  c9               leave                                    
  00c7  cb               retf                                     

ovl44_00c8:  ; ENTRY
  00c8  55               push bp                                  
  00c9  8bec             mov bp, sp                               
  00cb  8b5606           mov dx, word ptr [bp + 6]                
  00ce  8b1e980e         mov bx, word ptr [0xe98]                 
  00d2  6bdb41           imul bx, bx, 0x41                        
  00d5  03da             add bx, dx                               
  00d7  b8042c           mov ax, 0x2c04                           
  00da  8ec0             mov es, ax                               
  00dc  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  00e2  7c14             jl 0xf8                                  
  00e4  8b1e980e         mov bx, word ptr [0xe98]                 
  00e8  6bdb41           imul bx, bx, 0x41                        
  00eb  03da             add bx, dx                               
  00ed  8ec0             mov es, ax                               
  00ef  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  00f4  98               cwde                                     
  00f5  a39e0e           mov word ptr [0xe9e], ax                 
  00f8  90               nop                                      
  00f9  0e               push cs                                  
  00fa  e80200           call 0xff                                
  00fd  5d               pop bp                                   
  00fe  cb               retf                                     

ovl44_00ff:  ; ENTRY
  00ff  55               push bp                                  
  0100  8bec             mov bp, sp                               
  0102  83ec02           sub sp, 2                                
  0105  56               push si                                  
  0106  ff369e0e         push word ptr [0xe9e]                    
  010a  ff36980e         push word ptr [0xe98]                    
  010e  0e               push cs                                  
  010f  e8eefe           call 0                                   
  0112  83c404           add sp, 4                                
  0115  8946fe           mov word ptr [bp - 2], ax                
  0118  8b1e980e         mov bx, word ptr [0xe98]                 
  011c  6bdb41           imul bx, bx, 0x41                        
  011f  b8042c           mov ax, 0x2c04                           
  0122  8a169e0e         mov dl, byte ptr [0xe9e]                 
  0126  8ec0             mov es, ax                               
  0128  268897a915       mov byte ptr es:[bx + 0x15a9], dl        
  012d  8b1e980e         mov bx, word ptr [0xe98]                 
  0131  6bdb41           imul bx, bx, 0x41                        
  0134  b8042c           mov ax, 0x2c04                           
  0137  8b36980e         mov si, word ptr [0xe98]                 
  013b  6bf641           imul si, si, 0x41                        
  013e  0376fe           add si, word ptr [bp - 2]                
  0141  ba042c           mov dx, 0x2c04                           
  0144  8ec2             mov es, dx                               
  0146  268a949715       mov dl, byte ptr es:[si + 0x1597]        
  014b  8ec0             mov es, ax                               
  014d  268897aa15       mov byte ptr es:[bx + 0x15aa], dl        
  0152  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0157  666800003200     push 0x320000                            
  015d  666800002800     push 0x280000                            
  0163  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0168  83c408           add sp, 8                                
  016b  6a00             push 0                                   
  016d  9a4d006430       lcall 0x3064, 0x4d                       -> ovl45:06de
  0172  59               pop cx                                   
  0173  9a52006430       lcall 0x3064, 0x52                       -> ovl45:1a9b
  0178  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  017d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0182  5e               pop si                                   
  0183  c9               leave                                    
  0184  cb               retf                                     

ovl44_0185:  ; ENTRY
  0185  55               push bp                                  
  0186  8bec             mov bp, sp                               
  0188  8b1e980e         mov bx, word ptr [0xe98]                 
  018c  6bdb41           imul bx, bx, 0x41                        
  018f  b8042c           mov ax, 0x2c04                           
  0192  8ec0             mov es, ax                               
  0194  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  019a  8b1e980e         mov bx, word ptr [0xe98]                 
  019e  6bdb41           imul bx, bx, 0x41                        
  01a1  b8042c           mov ax, 0x2c04                           
  01a4  8ec0             mov es, ax                               
  01a6  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  01ad  8b1e980e         mov bx, word ptr [0xe98]                 
  01b1  6bdb41           imul bx, bx, 0x41                        
  01b4  b8042c           mov ax, 0x2c04                           
  01b7  8ec0             mov es, ax                               
  01b9  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  01c0  8b1e980e         mov bx, word ptr [0xe98]                 
  01c4  6bdb41           imul bx, bx, 0x41                        
  01c7  b8042c           mov ax, 0x2c04                           
  01ca  8ec0             mov es, ax                               
  01cc  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  01d3  c7069e0effff     mov word ptr [0xe9e], 0xffff             
  01d9  8b1e980e         mov bx, word ptr [0xe98]                 
  01dd  6bdb41           imul bx, bx, 0x41                        
  01e0  b8042c           mov ax, 0x2c04                           
  01e3  8ec0             mov es, ax                               
  01e5  26c687a915ff     mov byte ptr es:[bx + 0x15a9], 0xff      
  01eb  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01f0  666800003200     push 0x320000                            
  01f6  666800002800     push 0x280000                            
  01fc  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0201  83c408           add sp, 8                                
  0204  6a00             push 0                                   
  0206  9a4d006430       lcall 0x3064, 0x4d                       -> ovl45:06de
  020b  59               pop cx                                   
  020c  9a52006430       lcall 0x3064, 0x52                       -> ovl45:1a9b
  0211  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  0216  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  021b  5d               pop bp                                   
  021c  cb               retf                                     

ovl44_021d:  ; ENTRY
  021d  55               push bp                                  
  021e  8bec             mov bp, sp                               
  0220  8b1e980e         mov bx, word ptr [0xe98]                 
  0224  6bdb41           imul bx, bx, 0x41                        
  0227  b8042c           mov ax, 0x2c04                           
  022a  8ec0             mov es, ax                               
  022c  26c787ae150100   mov word ptr es:[bx + 0x15ae], 1         
  0233  8b1e980e         mov bx, word ptr [0xe98]                 
  0237  6bdb41           imul bx, bx, 0x41                        
  023a  b8042c           mov ax, 0x2c04                           
  023d  8ec0             mov es, ax                               
  023f  26c787b015feff   mov word ptr es:[bx + 0x15b0], 0xfffe    
  0246  8b1e980e         mov bx, word ptr [0xe98]                 
  024a  6bdb41           imul bx, bx, 0x41                        
  024d  b8042c           mov ax, 0x2c04                           
  0250  8ec0             mov es, ax                               
  0252  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  0259  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  025e  666800003200     push 0x320000                            
  0264  666800002800     push 0x280000                            
  026a  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  026f  83c408           add sp, 8                                
  0272  6a00             push 0                                   
  0274  9a4d006430       lcall 0x3064, 0x4d                       -> ovl45:06de
  0279  59               pop cx                                   
  027a  9a52006430       lcall 0x3064, 0x52                       -> ovl45:1a9b
  027f  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  0284  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0289  5d               pop bp                                   
  028a  cb               retf                                     

ovl44_028b:  ; ENTRY
  028b  55               push bp                                  
  028c  8bec             mov bp, sp                               
  028e  83ec0c           sub sp, 0xc                              
  0291  56               push si                                  
  0292  57               push di                                  
  0293  8b7606           mov si, word ptr [bp + 6]                
  0296  8b7e08           mov di, word ptr [bp + 8]                
  0299  837e0a01         cmp word ptr [bp + 0xa], 1               
  029d  7546             jne 0x2e5                                
  029f  33c0             xor ax, ax                               
  02a1  8ec0             mov es, ax                               
  02a3  26a01704         mov al, byte ptr es:[0x417]              
  02a7  98               cwde                                     
  02a8  a90300           test ax, 3                               
  02ab  7538             jne 0x2e5                                
  02ad  833e940e00       cmp word ptr [0xe94], 0                  
  02b2  7531             jne 0x2e5                                
  02b4  6a00             push 0                                   
  02b6  b8042c           mov ax, 0x2c04                           
  02b9  8ec0             mov es, ax                               
  02bb  26ff361001       push word ptr es:[0x110]                 
  02c0  57               push di                                  
  02c1  56               push si                                  
  02c2  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  02c7  83c408           add sp, 8                                
  02ca  8946fe           mov word ptr [bp - 2], ax                
  02cd  3b06980e         cmp ax, word ptr [0xe98]                 
  02d1  7503             jne 0x2d6                                
  02d3  e93101           jmp 0x407                                
  02d6  57               push di                                  
  02d7  56               push si                                  
  02d8  6a02             push 2                                   
  02da  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  02df  83c406           add sp, 6                                
  02e2  e92201           jmp 0x407                                
  02e5  8b1e980e         mov bx, word ptr [0xe98]                 
  02e9  6bdb41           imul bx, bx, 0x41                        
  02ec  b8042c           mov ax, 0x2c04                           
  02ef  8ec0             mov es, ax                               
  02f1  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  02f7  7f03             jg 0x2fc                                 
  02f9  e91001           jmp 0x40c                                
  02fc  57               push di                                  
  02fd  56               push si                                  
  02fe  9a4800e830       lcall 0x30e8, 0x48                       -> ovl62:0651
  0303  83c404           add sp, 4                                
  0306  8bf0             mov si, ax                               
  0308  16               push ss                                  
  0309  8d46fc           lea ax, [bp - 4]                         
  030c  50               push ax                                  
  030d  16               push ss                                  
  030e  8d46f4           lea ax, [bp - 0xc]                       
  0311  50               push ax                                  
  0312  56               push si                                  
  0313  90               nop                                      
  0314  0e               push cs                                  
  0315  e8f800           call 0x410                               
  0318  83c40a           add sp, 0xa                              
  031b  3b36980e         cmp si, word ptr [0xe98]                 
  031f  753c             jne 0x35d                                
  0321  8b1e980e         mov bx, word ptr [0xe98]                 
  0325  6bdb41           imul bx, bx, 0x41                        
  0328  b8042c           mov ax, 0x2c04                           
  032b  8ec0             mov es, ax                               
  032d  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0334  8b1e980e         mov bx, word ptr [0xe98]                 
  0338  6bdb41           imul bx, bx, 0x41                        
  033b  b8042c           mov ax, 0x2c04                           
  033e  8ec0             mov es, ax                               
  0340  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  0347  8b1e980e         mov bx, word ptr [0xe98]                 
  034b  6bdb41           imul bx, bx, 0x41                        
  034e  b8042c           mov ax, 0x2c04                           
  0351  8ec0             mov es, ax                               
  0353  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  035a  e98900           jmp 0x3e6                                
  035d  837efc04         cmp word ptr [bp - 4], 4                 
  0361  7c03             jl 0x366                                 
  0363  e9a100           jmp 0x407                                
  0366  8b1e980e         mov bx, word ptr [0xe98]                 
  036a  6bdb41           imul bx, bx, 0x41                        
  036d  b8042c           mov ax, 0x2c04                           
  0370  8ec0             mov es, ax                               
  0372  26c787ae150100   mov word ptr es:[bx + 0x15ae], 1         
  0379  83fe64           cmp si, 0x64                             
  037c  7c28             jl 0x3a6                                 
  037e  8b1e980e         mov bx, word ptr [0xe98]                 
  0382  6bdb41           imul bx, bx, 0x41                        
  0385  b8042c           mov ax, 0x2c04                           
  0388  8ec0             mov es, ax                               
  038a  26c787b015feff   mov word ptr es:[bx + 0x15b0], 0xfffe    
  0391  8b1e980e         mov bx, word ptr [0xe98]                 
  0395  6bdb41           imul bx, bx, 0x41                        
  0398  b8042c           mov ax, 0x2c04                           
  039b  8ec0             mov es, ax                               
  039d  26c787b215feff   mov word ptr es:[bx + 0x15b2], 0xfffe    
  03a4  eb40             jmp 0x3e6                                
  03a6  8bde             mov bx, si                               
  03a8  6bdb41           imul bx, bx, 0x41                        
  03ab  b8042c           mov ax, 0x2c04                           
  03ae  8ec0             mov es, ax                               
  03b0  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  03b5  8b1e980e         mov bx, word ptr [0xe98]                 
  03b9  6bdb41           imul bx, bx, 0x41                        
  03bc  ba042c           mov dx, 0x2c04                           
  03bf  8ec2             mov es, dx                               
  03c1  268987b015       mov word ptr es:[bx + 0x15b0], ax        
  03c6  8bde             mov bx, si                               
  03c8  6bdb41           imul bx, bx, 0x41                        
  03cb  b8042c           mov ax, 0x2c04                           
  03ce  8ec0             mov es, ax                               
  03d0  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  03d5  8b1e980e         mov bx, word ptr [0xe98]                 
  03d9  6bdb41           imul bx, bx, 0x41                        
  03dc  ba042c           mov dx, 0x2c04                           
  03df  8ec2             mov es, dx                               
  03e1  268987b215       mov word ptr es:[bx + 0x15b2], ax        
  03e6  666800003200     push 0x320000                            
  03ec  666800002800     push 0x280000                            
  03f2  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  03f7  83c408           add sp, 8                                
  03fa  6a00             push 0                                   
  03fc  9a4d006430       lcall 0x3064, 0x4d                       -> ovl45:06de
  0401  59               pop cx                                   
  0402  9a52006430       lcall 0x3064, 0x52                       -> ovl45:1a9b
  0407  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  040c  5f               pop di                                   
  040d  5e               pop si                                   
  040e  c9               leave                                    
  040f  cb               retf                                     

ovl44_0410:  ; ENTRY
  0410  55               push bp                                  
  0411  8bec             mov bp, sp                               
  0413  56               push si                                  
  0414  8b7606           mov si, word ptr [bp + 6]                
  0417  c45e0c           les bx, ptr [bp + 0xc]                   
  041a  26c7070000       mov word ptr es:[bx], 0                  
  041f  83fefe           cmp si, -2                               
  0422  7405             je 0x429                                 
  0424  83fe64           cmp si, 0x64                             
  0427  7c69             jl 0x492                                 
  0429  33c9             xor cx, cx                               
  042b  eb57             jmp 0x484                                
  042d  8bd9             mov bx, cx                               
  042f  6bdb41           imul bx, bx, 0x41                        
  0432  b8042c           mov ax, 0x2c04                           
  0435  8ec0             mov es, ax                               
  0437  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  043d  7444             je 0x483                                 
  043f  8bd9             mov bx, cx                               
  0441  6bdb41           imul bx, bx, 0x41                        
  0444  b8042c           mov ax, 0x2c04                           
  0447  8ec0             mov es, ax                               
  0449  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  044e  98               cwde                                     
  044f  ba042c           mov dx, 0x2c04                           
  0452  8ec2             mov es, dx                               
  0454  263b061001       cmp ax, word ptr es:[0x110]              
  0459  7528             jne 0x483                                
  045b  8bd9             mov bx, cx                               
  045d  6bdb41           imul bx, bx, 0x41                        
  0460  b8042c           mov ax, 0x2c04                           
  0463  8ec0             mov es, ax                               
  0465  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  046b  7516             jne 0x483                                
  046d  c45e0c           les bx, ptr [bp + 0xc]                   
  0470  268b07           mov ax, word ptr es:[bx]                 
  0473  d1e0             shl ax, 1                                
  0475  c45e08           les bx, ptr [bp + 8]                     
  0478  03d8             add bx, ax                               
  047a  26890f           mov word ptr es:[bx], cx                 
  047d  c45e0c           les bx, ptr [bp + 0xc]                   
  0480  26ff07           inc word ptr es:[bx]                     
  0483  41               inc cx                                   
  0484  b8042c           mov ax, 0x2c04                           
  0487  8ec0             mov es, ax                               
  0489  26390e7b15       cmp word ptr es:[0x157b], cx             
  048e  7f9d             jg 0x42d                                 
  0490  eb79             jmp 0x50b                                
  0492  33c9             xor cx, cx                               
  0494  eb69             jmp 0x4ff                                
  0496  8bd9             mov bx, cx                               
  0498  6bdb41           imul bx, bx, 0x41                        
  049b  b8042c           mov ax, 0x2c04                           
  049e  8ec0             mov es, ax                               
  04a0  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  04a6  7456             je 0x4fe                                 
  04a8  8bd9             mov bx, cx                               
  04aa  6bdb41           imul bx, bx, 0x41                        
  04ad  b8042c           mov ax, 0x2c04                           
  04b0  8ec0             mov es, ax                               
  04b2  268b87b015       mov ax, word ptr es:[bx + 0x15b0]        
  04b7  8bde             mov bx, si                               
  04b9  6bdb41           imul bx, bx, 0x41                        
  04bc  ba042c           mov dx, 0x2c04                           
  04bf  8ec2             mov es, dx                               
  04c1  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  04c6  7536             jne 0x4fe                                
  04c8  8bd9             mov bx, cx                               
  04ca  6bdb41           imul bx, bx, 0x41                        
  04cd  b8042c           mov ax, 0x2c04                           
  04d0  8ec0             mov es, ax                               
  04d2  268b87b215       mov ax, word ptr es:[bx + 0x15b2]        
  04d7  8bde             mov bx, si                               
  04d9  6bdb41           imul bx, bx, 0x41                        
  04dc  ba042c           mov dx, 0x2c04                           
  04df  8ec2             mov es, dx                               
  04e1  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  04e6  7516             jne 0x4fe                                
  04e8  c45e0c           les bx, ptr [bp + 0xc]                   
  04eb  268b07           mov ax, word ptr es:[bx]                 
  04ee  d1e0             shl ax, 1                                
  04f0  c45e08           les bx, ptr [bp + 8]                     
  04f3  03d8             add bx, ax                               
  04f5  26890f           mov word ptr es:[bx], cx                 
  04f8  c45e0c           les bx, ptr [bp + 0xc]                   
  04fb  26ff07           inc word ptr es:[bx]                     
  04fe  41               inc cx                                   
  04ff  b8042c           mov ax, 0x2c04                           
  0502  8ec0             mov es, ax                               
  0504  26390e7b15       cmp word ptr es:[0x157b], cx             
  0509  7f8b             jg 0x496                                 
  050b  5e               pop si                                   
  050c  5d               pop bp                                   
  050d  cb               retf                                     

ovl44_050e:  ; ENTRY
  050e  55               push bp                                  
  050f  8bec             mov bp, sp                               
  0511  83ec0a           sub sp, 0xa                              
  0514  8b4606           mov ax, word ptr [bp + 6]                
  0517  3d0200           cmp ax, 2                                
  051a  7513             jne 0x52f                                
  051c  a1960e           mov ax, word ptr [0xe96]                 
  051f  f7d8             neg ax                                   
  0521  1bc0             sbb ax, ax                               
  0523  40               inc ax                                   
  0524  a3960e           mov word ptr [0xe96], ax                 
  0527  90               nop                                      
  0528  0e               push cs                                  
  0529  e8b803           call 0x8e4                               
  052c  e90201           jmp 0x631                                
  052f  0bc0             or ax, ax                                
  0531  7575             jne 0x5a8                                
  0533  a1940e           mov ax, word ptr [0xe94]                 
  0536  0bc0             or ax, ax                                
  0538  740d             je 0x547                                 
  053a  3d0100           cmp ax, 1                                
  053d  742f             je 0x56e                                 
  053f  3d0200           cmp ax, 2                                
  0542  7437             je 0x57b                                 
  0544  e9ea00           jmp 0x631                                
  0547  c706940e0100     mov word ptr [0xe94], 1                  
  054d  6aff             push -1                                  
  054f  ff36980e         push word ptr [0xe98]                    
  0553  666a00           push 0                                   
  0556  9a3e00f230       lcall 0x30f2, 0x3e                       -> ovl63:08df
  055b  83c408           add sp, 8                                
  055e  666a00           push 0                                   
  0561  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  0566  83c404           add sp, 4                                
  0569  6a00             push 0                                   
  056b  e9bd00           jmp 0x62b                                
  056e  c706940e0000     mov word ptr [0xe94], 0                  
  0574  90               nop                                      
  0575  0e               push cs                                  
  0576  e86b03           call 0x8e4                               
  0579  ebee             jmp 0x569                                
  057b  c706940e0100     mov word ptr [0xe94], 1                  
  0581  6aff             push -1                                  
  0583  ff36980e         push word ptr [0xe98]                    
  0587  666a00           push 0                                   
  058a  9a3e00f230       lcall 0x30f2, 0x3e                       -> ovl63:08df
  058f  83c408           add sp, 8                                
  0592  666a00           push 0                                   
  0595  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  059a  83c404           add sp, 4                                
  059d  6a00             push 0                                   
  059f  90               nop                                      
  05a0  0e               push cs                                  
  05a1  e89400           call 0x638                               
  05a4  59               pop cx                                   
  05a5  e98100           jmp 0x629                                
  05a8  3d0100           cmp ax, 1                                
  05ab  7403             je 0x5b0                                 
  05ad  e98100           jmp 0x631                                
  05b0  a1940e           mov ax, word ptr [0xe94]                 
  05b3  0bc0             or ax, ax                                
  05b5  740c             je 0x5c3                                 
  05b7  3d0100           cmp ax, 1                                
  05ba  7441             je 0x5fd                                 
  05bc  3d0200           cmp ax, 2                                
  05bf  745d             je 0x61e                                 
  05c1  eb6e             jmp 0x631                                
  05c3  c706940e0200     mov word ptr [0xe94], 2                  
  05c9  16               push ss                                  
  05ca  8d46f6           lea ax, [bp - 0xa]                       
  05cd  50               push ax                                  
  05ce  16               push ss                                  
  05cf  8d46f8           lea ax, [bp - 8]                         
  05d2  50               push ax                                  
  05d3  ff36980e         push word ptr [0xe98]                    
  05d7  0e               push cs                                  
  05d8  e835fe           call 0x410                               
  05db  83c40a           add sp, 0xa                              
  05de  ff76f6           push word ptr [bp - 0xa]                 
  05e1  ff36980e         push word ptr [0xe98]                    
  05e5  666a00           push 0                                   
  05e8  9a3e00f230       lcall 0x30f2, 0x3e                       -> ovl63:08df
  05ed  83c408           add sp, 8                                
  05f0  666a00           push 0                                   
  05f3  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  05f8  83c404           add sp, 4                                
  05fb  eb2c             jmp 0x629                                
  05fd  c706940e0200     mov word ptr [0xe94], 2                  
  0603  16               push ss                                  
  0604  8d46f6           lea ax, [bp - 0xa]                       
  0607  50               push ax                                  
  0608  16               push ss                                  
  0609  8d46f8           lea ax, [bp - 8]                         
  060c  50               push ax                                  
  060d  ff36980e         push word ptr [0xe98]                    
  0611  0e               push cs                                  
  0612  e8fbfd           call 0x410                               
  0615  83c40a           add sp, 0xa                              
  0618  ff76f6           push word ptr [bp - 0xa]                 
  061b  e965ff           jmp 0x583                                
  061e  c706940e0000     mov word ptr [0xe94], 0                  
  0624  90               nop                                      
  0625  0e               push cs                                  
  0626  e8bb02           call 0x8e4                               
  0629  6a01             push 1                                   
  062b  90               nop                                      
  062c  0e               push cs                                  
  062d  e80800           call 0x638                               
  0630  59               pop cx                                   
  0631  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  0636  c9               leave                                    
  0637  cb               retf                                     

ovl44_0638:  ; ENTRY
  0638  55               push bp                                  
  0639  8bec             mov bp, sp                               
  063b  837e0600         cmp word ptr [bp + 6], 0                 
  063f  757b             jne 0x6bc                                
  0641  6668bc002800     push 0x2800bc                            
  0647  66684000a100     push 0xa10040                            
  064d  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0652  83c408           add sp, 8                                
  0655  833e940e01       cmp word ptr [0xe94], 1                  
  065a  753e             jne 0x69a                                
  065c  66689b000200     push 0x2009b                             
  0662  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0667  83c404           add sp, 4                                
  066a  52               push dx                                  
  066b  50               push ax                                  
  066c  66687001dd00     push 0xdd0170                            
  0672  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0677  83c408           add sp, 8                                
  067a  6a03             push 3                                   
  067c  689b00           push 0x9b                                
  067f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0684  83c404           add sp, 4                                
  0687  52               push dx                                  
  0688  50               push ax                                  
  0689  68f100           push 0xf1                                
  068c  687001           push 0x170                               
  068f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0694  83c408           add sp, 8                                
  0697  e99200           jmp 0x72c                                
  069a  66689b000000     push 0x9b                                
  06a0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  06a5  83c404           add sp, 4                                
  06a8  52               push dx                                  
  06a9  50               push ax                                  
  06aa  66687001dd00     push 0xdd0170                            
  06b0  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  06b5  83c408           add sp, 8                                
  06b8  6a01             push 1                                   
  06ba  ebc0             jmp 0x67c                                
  06bc  6668bc002800     push 0x2800bc                            
  06c2  66684000d400     push 0xd40040                            
  06c8  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  06cd  83c408           add sp, 8                                
  06d0  833e940e02       cmp word ptr [0xe94], 2                  
  06d5  7522             jne 0x6f9                                
  06d7  66689c000200     push 0x2009c                             
  06dd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  06e2  83c404           add sp, 4                                
  06e5  52               push dx                                  
  06e6  50               push ax                                  
  06e7  666870011001     push 0x1100170                           
  06ed  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  06f2  83c408           add sp, 8                                
  06f5  6a03             push 3                                   
  06f7  eb20             jmp 0x719                                
  06f9  66689c000000     push 0x9c                                
  06ff  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0704  83c404           add sp, 4                                
  0707  52               push dx                                  
  0708  50               push ax                                  
  0709  666870011001     push 0x1100170                           
  070f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0714  83c408           add sp, 8                                
  0717  6a01             push 1                                   
  0719  689c00           push 0x9c                                
  071c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0721  83c404           add sp, 4                                
  0724  52               push dx                                  
  0725  50               push ax                                  
  0726  682401           push 0x124                               
  0729  e960ff           jmp 0x68c                                
  072c  5d               pop bp                                   
  072d  cb               retf                                     

ovl44_072e:  ; ENTRY
  072e  55               push bp                                  
  072f  8bec             mov bp, sp                               
  0731  83ec14           sub sp, 0x14                             
  0734  56               push si                                  
  0735  57               push di                                  
  0736  8b7e06           mov di, word ptr [bp + 6]                
  0739  837e0a01         cmp word ptr [bp + 0xa], 1               
  073d  7523             jne 0x762                                
  073f  33c0             xor ax, ax                               
  0741  8ec0             mov es, ax                               
  0743  26f606170403     test byte ptr es:[0x417], 3              
  0749  7417             je 0x762                                 
  074b  ff760a           push word ptr [bp + 0xa]                 
  074e  ff7608           push word ptr [bp + 8]                   
  0751  57               push di                                  
  0752  0e               push cs                                  
  0753  e835fb           call 0x28b                               
  0756  83c406           add sp, 6                                
  0759  c706940e0000     mov word ptr [0xe94], 0                  
  075f  e97e01           jmp 0x8e0                                
  0762  ff7608           push word ptr [bp + 8]                   
  0765  57               push di                                  
  0766  9a4800e830       lcall 0x30e8, 0x48                       -> ovl62:0651
  076b  83c404           add sp, 4                                
  076e  8bf0             mov si, ax                               
  0770  16               push ss                                  
  0771  8d46fe           lea ax, [bp - 2]                         
  0774  50               push ax                                  
  0775  16               push ss                                  
  0776  8d46f6           lea ax, [bp - 0xa]                       
  0779  50               push ax                                  
  077a  56               push si                                  
  077b  0e               push cs                                  
  077c  e891fc           call 0x410                               
  077f  83c40a           add sp, 0xa                              
  0782  16               push ss                                  
  0783  8d46f4           lea ax, [bp - 0xc]                       
  0786  50               push ax                                  
  0787  16               push ss                                  
  0788  8d46ec           lea ax, [bp - 0x14]                      
  078b  50               push ax                                  
  078c  ff36980e         push word ptr [0xe98]                    
  0790  0e               push cs                                  
  0791  e87cfc           call 0x410                               
  0794  83c40a           add sp, 0xa                              
  0797  833e940e02       cmp word ptr [0xe94], 2                  
  079c  7403             je 0x7a1                                 
  079e  e9d200           jmp 0x873                                
  07a1  837ef400         cmp word ptr [bp - 0xc], 0               
  07a5  7f03             jg 0x7aa                                 
  07a7  e9c900           jmp 0x873                                
  07aa  8b46f4           mov ax, word ptr [bp - 0xc]              
  07ad  0346fe           add ax, word ptr [bp - 2]                
  07b0  3d0400           cmp ax, 4                                
  07b3  7e03             jle 0x7b8                                
  07b5  e9bb00           jmp 0x873                                
  07b8  3976ec           cmp word ptr [bp - 0x14], si             
  07bb  7503             jne 0x7c0                                
  07bd  e9b300           jmp 0x873                                
  07c0  3976ee           cmp word ptr [bp - 0x12], si             
  07c3  7503             jne 0x7c8                                
  07c5  e9ab00           jmp 0x873                                
  07c8  3976f0           cmp word ptr [bp - 0x10], si             
  07cb  7503             jne 0x7d0                                
  07cd  e9a300           jmp 0x873                                
  07d0  3976f2           cmp word ptr [bp - 0xe], si              
  07d3  7503             jne 0x7d8                                
  07d5  e99b00           jmp 0x873                                
  07d8  33c9             xor cx, cx                               
  07da  e98e00           jmp 0x86b                                
  07dd  83fe64           cmp si, 0x64                             
  07e0  7d52             jge 0x834                                
  07e2  8bde             mov bx, si                               
  07e4  6bdb41           imul bx, bx, 0x41                        
  07e7  b8042c           mov ax, 0x2c04                           
  07ea  8ec0             mov es, ax                               
  07ec  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  07f1  8bd9             mov bx, cx                               
  07f3  d1e3             shl bx, 1                                
  07f5  8d56ec           lea dx, [bp - 0x14]                      
  07f8  03da             add bx, dx                               
  07fa  368b1f           mov bx, word ptr ss:[bx]                 
  07fd  6bdb41           imul bx, bx, 0x41                        
  0800  ba042c           mov dx, 0x2c04                           
  0803  8ec2             mov es, dx                               
  0805  268987b015       mov word ptr es:[bx + 0x15b0], ax        
  080a  8bde             mov bx, si                               
  080c  6bdb41           imul bx, bx, 0x41                        
  080f  b8042c           mov ax, 0x2c04                           
  0812  8ec0             mov es, ax                               
  0814  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0819  8bd9             mov bx, cx                               
  081b  d1e3             shl bx, 1                                
  081d  8d56ec           lea dx, [bp - 0x14]                      
  0820  03da             add bx, dx                               
  0822  368b1f           mov bx, word ptr ss:[bx]                 
  0825  6bdb41           imul bx, bx, 0x41                        
  0828  ba042c           mov dx, 0x2c04                           
  082b  8ec2             mov es, dx                               
  082d  268987b215       mov word ptr es:[bx + 0x15b2], ax        
  0832  eb36             jmp 0x86a                                
  0834  8bd9             mov bx, cx                               
  0836  d1e3             shl bx, 1                                
  0838  8d46ec           lea ax, [bp - 0x14]                      
  083b  03d8             add bx, ax                               
  083d  368b1f           mov bx, word ptr ss:[bx]                 
  0840  6bdb41           imul bx, bx, 0x41                        
  0843  b8042c           mov ax, 0x2c04                           
  0846  8ec0             mov es, ax                               
  0848  26c787b015feff   mov word ptr es:[bx + 0x15b0], 0xfffe    
  084f  8bd9             mov bx, cx                               
  0851  d1e3             shl bx, 1                                
  0853  8d46ec           lea ax, [bp - 0x14]                      
  0856  03d8             add bx, ax                               
  0858  368b1f           mov bx, word ptr ss:[bx]                 
  085b  6bdb41           imul bx, bx, 0x41                        
  085e  b8042c           mov ax, 0x2c04                           
  0861  8ec0             mov es, ax                               
  0863  26c787b215feff   mov word ptr es:[bx + 0x15b2], 0xfffe    
  086a  41               inc cx                                   
  086b  3b4ef4           cmp cx, word ptr [bp - 0xc]              
  086e  7d03             jge 0x873                                
  0870  e96aff           jmp 0x7dd                                
  0873  833e940e01       cmp word ptr [0xe94], 1                  
  0878  750e             jne 0x888                                
  087a  ff760a           push word ptr [bp + 0xa]                 
  087d  ff7608           push word ptr [bp + 8]                   
  0880  57               push di                                  
  0881  0e               push cs                                  
  0882  e806fa           call 0x28b                               
  0885  83c406           add sp, 6                                
  0888  8b16980e         mov dx, word ptr [0xe98]                 
  088c  833e940e01       cmp word ptr [0xe94], 1                  
  0891  7407             je 0x89a                                 
  0893  83fe64           cmp si, 0x64                             
  0896  7d02             jge 0x89a                                
  0898  8bd6             mov dx, si                               
  089a  c706940e0000     mov word ptr [0xe94], 0                  
  08a0  8bda             mov bx, dx                               
  08a2  6bdb41           imul bx, bx, 0x41                        
  08a5  b8042c           mov ax, 0x2c04                           
  08a8  8ec0             mov es, ax                               
  08aa  26ffb77f15       push word ptr es:[bx + 0x157f]           
  08af  8bda             mov bx, dx                               
  08b1  6bdb41           imul bx, bx, 0x41                        
  08b4  b8042c           mov ax, 0x2c04                           
  08b7  8ec0             mov es, ax                               
  08b9  26ffb77d15       push word ptr es:[bx + 0x157d]           
  08be  6a03             push 3                                   
  08c0  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  08c5  83c406           add sp, 6                                
  08c8  90               nop                                      
  08c9  0e               push cs                                  
  08ca  e81700           call 0x8e4                               
  08cd  6a00             push 0                                   
  08cf  0e               push cs                                  
  08d0  e865fd           call 0x638                               
  08d3  59               pop cx                                   
  08d4  6a01             push 1                                   
  08d6  0e               push cs                                  
  08d7  e85efd           call 0x638                               
  08da  59               pop cx                                   
  08db  9a48006430       lcall 0x3064, 0x48                       -> ovl45:03a9
  08e0  5f               pop di                                   
  08e1  5e               pop si                                   
  08e2  c9               leave                                    
  08e3  cb               retf                                     

ovl44_08e4:  ; ENTRY
  08e4  55               push bp                                  
  08e5  8bec             mov bp, sp                               
  08e7  a1920e           mov ax, word ptr [0xe92]                 
  08ea  3d0200           cmp ax, 2                                
  08ed  7407             je 0x8f6                                 
  08ef  3d0300           cmp ax, 3                                
  08f2  7420             je 0x914                                 
  08f4  eb38             jmp 0x92e                                
  08f6  6afe             push -2                                  
  08f8  ff36980e         push word ptr [0xe98]                    
  08fc  666a00           push 0                                   
  08ff  9a3e00f230       lcall 0x30f2, 0x3e                       -> ovl63:08df
  0904  83c408           add sp, 8                                
  0907  666a00           push 0                                   
  090a  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  090f  83c404           add sp, 4                                
  0912  eb1a             jmp 0x92e                                
  0914  833e960e00       cmp word ptr [0xe96], 0                  
  0919  74db             je 0x8f6                                 
  091b  ff36980e         push word ptr [0xe98]                    
  091f  666a00           push 0                                   
  0922  9a4800f230       lcall 0x30f2, 0x48                       -> ovl63:1817
  0927  83c406           add sp, 6                                
  092a  ebdb             jmp 0x907                                
  092c  ebc8             jmp 0x8f6                                
  092e  5d               pop bp                                   
  092f  cb               retf                                     

ovl44_0930:  ; ENTRY
  0930  55               push bp                                  
  0931  8bec             mov bp, sp                               
  0933  ff7606           push word ptr [bp + 6]                   
  0936  90               nop                                      
  0937  0e               push cs                                  
  0938  e81400           call 0x94f                               
  093b  59               pop cx                                   
  093c  8bd0             mov dx, ax                               
  093e  83fa02           cmp dx, 2                                
  0941  7f05             jg 0x948                                 
  0943  ba0100           mov dx, 1                                
  0946  eb03             jmp 0x94b                                
  0948  ba0200           mov dx, 2                                
  094b  8bc2             mov ax, dx                               
  094d  5d               pop bp                                   
  094e  cb               retf                                     

ovl44_094f:  ; ENTRY
  094f  55               push bp                                  
  0950  8bec             mov bp, sp                               
  0952  33c9             xor cx, cx                               
  0954  33d2             xor dx, dx                               
  0956  eb17             jmp 0x96f                                
  0958  8b5e06           mov bx, word ptr [bp + 6]                
  095b  6bdb41           imul bx, bx, 0x41                        
  095e  03da             add bx, dx                               
  0960  b8042c           mov ax, 0x2c04                           
  0963  8ec0             mov es, ax                               
  0965  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  096b  7c01             jl 0x96e                                 
  096d  41               inc cx                                   
  096e  42               inc dx                                   
  096f  83fa04           cmp dx, 4                                
  0972  7ce4             jl 0x958                                 
  0974  8bc1             mov ax, cx                               
  0976  5d               pop bp                                   
  0977  cb               retf                                     

ovl44_0978:  ; ENTRY
  0978  55               push bp                                  
  0979  8bec             mov bp, sp                               
  097b  ba0400           mov dx, 4                                
  097e  eb30             jmp 0x9b0                                
  0980  0bd2             or dx, dx                                
  0982  7433             je 0x9b7                                 
  0984  8b1e980e         mov bx, word ptr [0xe98]                 
  0988  6bdb41           imul bx, bx, 0x41                        
  098b  03da             add bx, dx                               
  098d  b8042c           mov ax, 0x2c04                           
  0990  8ec0             mov es, ax                               
  0992  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  0998  7d16             jge 0x9b0                                
  099a  8b1e980e         mov bx, word ptr [0xe98]                 
  099e  6bdb41           imul bx, bx, 0x41                        
  09a1  03da             add bx, dx                               
  09a3  b8042c           mov ax, 0x2c04                           
  09a6  8ec0             mov es, ax                               
  09a8  2680bf921500     cmp byte ptr es:[bx + 0x1592], 0         
  09ae  7d07             jge 0x9b7                                
  09b0  8bc2             mov ax, dx                               
  09b2  4a               dec dx                                   
  09b3  0bc0             or ax, ax                                
  09b5  75c9             jne 0x980                                
  09b7  8916860e         mov word ptr [0xe86], dx                 
  09bb  6a0b             push 0xb                                 
  09bd  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  09c2  59               pop cx                                   
  09c3  6a00             push 0                                   
  09c5  90               nop                                      
  09c6  0e               push cs                                  
  09c7  e81000           call 0x9da                               
  09ca  59               pop cx                                   
  09cb  6a17             push 0x17                                
  09cd  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  09d2  59               pop cx                                   
  09d3  90               nop                                      
  09d4  0e               push cs                                  
  09d5  e8d603           call 0xdae                               
  09d8  5d               pop bp                                   
  09d9  cb               retf                                     

ovl44_09da:  ; ENTRY
  09da  55               push bp                                  
  09db  8bec             mov bp, sp                               
  09dd  83ec5a           sub sp, 0x5a                             
  09e0  56               push si                                  
  09e1  57               push di                                  
  09e2  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  09e7  837e0600         cmp word ptr [bp + 6], 0                 
  09eb  7403             je 0x9f0                                 
  09ed  e95c01           jmp 0xb4c                                
  09f0  666800000300     push 0x30000                             
  09f6  666801000f00     push 0xf0001                             
  09fc  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0a01  83c408           add sp, 8                                
  0a04  666a70           push 0x70                                
  0a07  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a0c  83c404           add sp, 4                                
  0a0f  52               push dx                                  
  0a10  50               push ax                                  
  0a11  666840014000     push 0x400140                            
  0a17  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0a1c  83c408           add sp, 8                                
  0a1f  666858004000     push 0x400058                            
  0a25  1e               push ds                                  
  0a26  682a34           push 0x342a                              
  0a29  6a00             push 0                                   
  0a2b  b8042c           mov ax, 0x2c04                           
  0a2e  8ec0             mov es, ax                               
  0a30  26ff361001       push word ptr es:[0x110]                 
  0a35  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0a3a  83c40c           add sp, 0xc                              
  0a3d  666800024000     push 0x400200                            
  0a43  1e               push ds                                  
  0a44  682a34           push 0x342a                              
  0a47  6a00             push 0                                   
  0a49  b8042c           mov ax, 0x2c04                           
  0a4c  8ec0             mov es, ax                               
  0a4e  26ff361001       push word ptr es:[0x110]                 
  0a53  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0a58  83c40c           add sp, 0xc                              
  0a5b  666800000300     push 0x30000                             
  0a61  666802000f00     push 0xf0002                             
  0a67  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0a6c  83c408           add sp, 8                                
  0a6f  a1980e           mov ax, word ptr [0xe98]                 
  0a72  6bc041           imul ax, ax, 0x41                        
  0a75  058115           add ax, 0x1581                           
  0a78  68042c           push 0x2c04                              
  0a7b  50               push ax                                  
  0a7c  b8042c           mov ax, 0x2c04                           
  0a7f  8ec0             mov es, ax                               
  0a81  26a11001         mov ax, word ptr es:[0x110]              
  0a85  6bc014           imul ax, ax, 0x14                        
  0a88  050000           add ax, 0                                
  0a8b  68042c           push 0x2c04                              
  0a8e  50               push ax                                  
  0a8f  666870000100     push 0x10070                             
  0a95  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a9a  83c404           add sp, 4                                
  0a9d  52               push dx                                  
  0a9e  50               push ax                                  
  0a9f  16               push ss                                  
  0aa0  8d46a6           lea ax, [bp - 0x5a]                      
  0aa3  50               push ax                                  
  0aa4  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0aa9  83c410           add sp, 0x10                             
  0aac  16               push ss                                  
  0aad  8d46a6           lea ax, [bp - 0x5a]                      
  0ab0  50               push ax                                  
  0ab1  666840016800     push 0x680140                            
  0ab7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0abc  83c408           add sp, 8                                
  0abf  666898001400     push 0x140098                            
  0ac5  6668c4003101     push 0x13100c4                           
  0acb  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0ad0  83c408           add sp, 8                                
  0ad3  666800000300     push 0x30000                             
  0ad9  666802000f00     push 0xf0002                             
  0adf  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ae4  83c408           add sp, 8                                
  0ae7  b8042c           mov ax, 0x2c04                           
  0aea  8ec0             mov es, ax                               
  0aec  268b1e1001       mov bx, word ptr es:[0x110]              
  0af1  6bdb14           imul bx, bx, 0x14                        
  0af4  b8042c           mov ax, 0x2c04                           
  0af7  8ec0             mov es, ax                               
  0af9  26ffb78501       push word ptr es:[bx + 0x185]            
  0afe  666870000200     push 0x20070                             
  0b04  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b09  83c404           add sp, 4                                
  0b0c  52               push dx                                  
  0b0d  50               push ax                                  
  0b0e  16               push ss                                  
  0b0f  8d46a6           lea ax, [bp - 0x5a]                      
  0b12  50               push ax                                  
  0b13  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0b18  83c40a           add sp, 0xa                              
  0b1b  16               push ss                                  
  0b1c  8d46a6           lea ax, [bp - 0x5a]                      
  0b1f  50               push ax                                  
  0b20  666860016d01     push 0x16d0160                           
  0b26  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b2b  83c408           add sp, 8                                
  0b2e  666870000300     push 0x30070                             
  0b34  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b39  83c404           add sp, 4                                
  0b3c  52               push dx                                  
  0b3d  50               push ax                                  
  0b3e  6668b0005c01     push 0x15c00b0                           
  0b44  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b49  83c408           add sp, 8                                
  0b4c  33f6             xor si, si                               
  0b4e  e90301           jmp 0xc54                                
  0b51  8b1e980e         mov bx, word ptr [0xe98]                 
  0b55  6bdb41           imul bx, bx, 0x41                        
  0b58  03de             add bx, si                               
  0b5a  b8042c           mov ax, 0x2c04                           
  0b5d  8ec0             mov es, ax                               
  0b5f  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  0b65  7c47             jl 0xbae                                 
  0b67  666a00           push 0                                   
  0b6a  b8042c           mov ax, 0x2c04                           
  0b6d  8ec0             mov es, ax                               
  0b6f  26a11001         mov ax, word ptr es:[0x110]              
  0b73  050200           add ax, 2                                
  0b76  50               push ax                                  
  0b77  666a00           push 0                                   
  0b7a  666a00           push 0                                   
  0b7d  687201           push 0x172                               
  0b80  8bc6             mov ax, si                               
  0b82  6bc028           imul ax, ax, 0x28                        
  0b85  056800           add ax, 0x68                             
  0b88  50               push ax                                  
  0b89  1e               push ds                                  
  0b8a  682a34           push 0x342a                              
  0b8d  b8042c           mov ax, 0x2c04                           
  0b90  8ec0             mov es, ax                               
  0b92  26ff361001       push word ptr es:[0x110]                 
  0b97  8b1e980e         mov bx, word ptr [0xe98]                 
  0b9b  6bdb41           imul bx, bx, 0x41                        
  0b9e  03de             add bx, si                               
  0ba0  b8042c           mov ax, 0x2c04                           
  0ba3  8ec0             mov es, ax                               
  0ba5  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0baa  98               cwde                                     
  0bab  50               push ax                                  
  0bac  eb2b             jmp 0xbd9                                
  0bae  666a00           push 0                                   
  0bb1  666800000100     push 0x10000                             
  0bb7  666a00           push 0                                   
  0bba  666872010000     push 0x172                               
  0bc0  8bc6             mov ax, si                               
  0bc2  6bc028           imul ax, ax, 0x28                        
  0bc5  056800           add ax, 0x68                             
  0bc8  50               push ax                                  
  0bc9  1e               push ds                                  
  0bca  682a34           push 0x342a                              
  0bcd  b8042c           mov ax, 0x2c04                           
  0bd0  8ec0             mov es, ax                               
  0bd2  26ff361001       push word ptr es:[0x110]                 
  0bd7  6aff             push -1                                  
  0bd9  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0bde  83c41a           add sp, 0x1a                             
  0be1  666825002300     push 0x230025                            
  0be7  687001           push 0x170                               
  0bea  8bc6             mov ax, si                               
  0bec  6bc028           imul ax, ax, 0x28                        
  0bef  056600           add ax, 0x66                             
  0bf2  50               push ax                                  
  0bf3  16               push ss                                  
  0bf4  8d46f8           lea ax, [bp - 8]                         
  0bf7  50               push ax                                  
  0bf8  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0bfd  83c40c           add sp, 0xc                              
  0c00  3936860e         cmp word ptr [0xe86], si                 
  0c04  7525             jne 0xc2b                                
  0c06  6a00             push 0                                   
  0c08  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0c0d  59               pop cx                                   
  0c0e  16               push ss                                  
  0c0f  8d46f8           lea ax, [bp - 8]                         
  0c12  50               push ax                                  
  0c13  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0c18  83c404           add sp, 4                                
  0c1b  ff4ef8           dec word ptr [bp - 8]                    
  0c1e  ff4efa           dec word ptr [bp - 6]                    
  0c21  6a09             push 9                                   
  0c23  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0c28  59               pop cx                                   
  0c29  eb1b             jmp 0xc46                                
  0c2b  6a03             push 3                                   
  0c2d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0c32  59               pop cx                                   
  0c33  16               push ss                                  
  0c34  8d46f8           lea ax, [bp - 8]                         
  0c37  50               push ax                                  
  0c38  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0c3d  83c404           add sp, 4                                
  0c40  ff4ef8           dec word ptr [bp - 8]                    
  0c43  ff4efa           dec word ptr [bp - 6]                    
  0c46  16               push ss                                  
  0c47  8d46f8           lea ax, [bp - 8]                         
  0c4a  50               push ax                                  
  0c4b  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0c50  83c404           add sp, 4                                
  0c53  46               inc si                                   
  0c54  83fe04           cmp si, 4                                
  0c57  7d03             jge 0xc5c                                
  0c59  e9f5fe           jmp 0xb51                                
  0c5c  90               nop                                      
  0c5d  0e               push cs                                  
  0c5e  e8c704           call 0x1128                              
  0c61  666800000300     push 0x30000                             
  0c67  666802000f00     push 0xf0002                             
  0c6d  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0c72  83c408           add sp, 8                                
  0c75  33f6             xor si, si                               
  0c77  33ff             xor di, di                               
  0c79  e91c01           jmp 0xd98                                
  0c7c  8bc6             mov ax, si                               
  0c7e  6bc03e           imul ax, ax, 0x3e                        
  0c81  c41e7c44         les bx, ptr [0x447c]                     
  0c85  03d8             add bx, ax                               
  0c87  26837f1e00       cmp word ptr es:[bx + 0x1e], 0           
  0c8c  7d03             jge 0xc91                                
  0c8e  e90601           jmp 0xd97                                
  0c91  c746f60000       mov word ptr [bp - 0xa], 0               
  0c96  33c9             xor cx, cx                               
  0c98  eb2c             jmp 0xcc6                                
  0c9a  8b1e980e         mov bx, word ptr [0xe98]                 
  0c9e  6bdb41           imul bx, bx, 0x41                        
  0ca1  03d9             add bx, cx                               
  0ca3  b8042c           mov ax, 0x2c04                           
  0ca6  8ec0             mov es, ax                               
  0ca8  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0cad  98               cwde                                     
  0cae  8bd6             mov dx, si                               
  0cb0  6bd23e           imul dx, dx, 0x3e                        
  0cb3  c41e7c44         les bx, ptr [0x447c]                     
  0cb7  03da             add bx, dx                               
  0cb9  263b07           cmp ax, word ptr es:[bx]                 
  0cbc  7507             jne 0xcc5                                
  0cbe  c746f60100       mov word ptr [bp - 0xa], 1               
  0cc3  eb06             jmp 0xccb                                
  0cc5  41               inc cx                                   
  0cc6  83f904           cmp cx, 4                                
  0cc9  7ccf             jl 0xc9a                                 
  0ccb  b8042c           mov ax, 0x2c04                           
  0cce  8ec0             mov es, ax                               
  0cd0  268b1e1001       mov bx, word ptr es:[0x110]              
  0cd5  6bdb14           imul bx, bx, 0x14                        
  0cd8  b8042c           mov ax, 0x2c04                           
  0cdb  8ec0             mov es, ax                               
  0cdd  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0ce2  8bd6             mov dx, si                               
  0ce4  6bd23e           imul dx, dx, 0x3e                        
  0ce7  c41e7c44         les bx, ptr [0x447c]                     
  0ceb  03da             add bx, dx                               
  0ced  263b471e         cmp ax, word ptr es:[bx + 0x1e]          
  0cf1  7c06             jl 0xcf9                                 
  0cf3  837ef600         cmp word ptr [bp - 0xa], 0               
  0cf7  7404             je 0xcfd                                 
  0cf9  6a01             push 1                                   
  0cfb  eb02             jmp 0xcff                                
  0cfd  6a00             push 0                                   
  0cff  666a01           push 1                                   
  0d02  666a00           push 0                                   
  0d05  666a00           push 0                                   
  0d08  8bc7             mov ax, di                               
  0d0a  bb0400           mov bx, 4                                
  0d0d  99               cdq                                      
  0d0e  f7fb             idiv bx                                  
  0d10  6bc01f           imul ax, ax, 0x1f                        
  0d13  058800           add ax, 0x88                             
  0d16  50               push ax                                  
  0d17  8bc7             mov ax, di                               
  0d19  99               cdq                                      
  0d1a  f7fb             idiv bx                                  
  0d1c  6bd278           imul dx, dx, 0x78                        
  0d1f  83c258           add dx, 0x58                             
  0d22  52               push dx                                  
  0d23  1e               push ds                                  
  0d24  682a34           push 0x342a                              
  0d27  b8042c           mov ax, 0x2c04                           
  0d2a  8ec0             mov es, ax                               
  0d2c  26ff361001       push word ptr es:[0x110]                 
  0d31  8bc6             mov ax, si                               
  0d33  6bc03e           imul ax, ax, 0x3e                        
  0d36  c41e7c44         les bx, ptr [0x447c]                     
  0d3a  03d8             add bx, ax                               
  0d3c  26ff37           push word ptr es:[bx]                    
  0d3f  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0d44  83c41a           add sp, 0x1a                             
  0d47  837e0600         cmp word ptr [bp + 6], 0                 
  0d4b  7549             jne 0xd96                                
  0d4d  8bc6             mov ax, si                               
  0d4f  6bc03e           imul ax, ax, 0x3e                        
  0d52  c41e7c44         les bx, ptr [0x447c]                     
  0d56  03d8             add bx, ax                               
  0d58  26ff771e         push word ptr es:[bx + 0x1e]             
  0d5c  1e               push ds                                  
  0d5d  688c0e           push 0xe8c                                ; "%d gp"
  0d60  16               push ss                                  
  0d61  8d46a6           lea ax, [bp - 0x5a]                      
  0d64  50               push ax                                  
  0d65  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0d6a  83c40a           add sp, 0xa                              
  0d6d  16               push ss                                  
  0d6e  8d46a6           lea ax, [bp - 0x5a]                      
  0d71  50               push ax                                  
  0d72  8bc7             mov ax, di                               
  0d74  bb0400           mov bx, 4                                
  0d77  99               cdq                                      
  0d78  f7fb             idiv bx                                  
  0d7a  6bc01f           imul ax, ax, 0x1f                        
  0d7d  058e00           add ax, 0x8e                             
  0d80  50               push ax                                  
  0d81  8bc7             mov ax, di                               
  0d83  99               cdq                                      
  0d84  f7fb             idiv bx                                  
  0d86  6bd278           imul dx, dx, 0x78                        
  0d89  81c28000         add dx, 0x80                             
  0d8d  52               push dx                                  
  0d8e  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0d93  83c408           add sp, 8                                
  0d96  47               inc di                                   
  0d97  46               inc si                                   
  0d98  83fe1c           cmp si, 0x1c                             
  0d9b  7d03             jge 0xda0                                
  0d9d  e9dcfe           jmp 0xc7c                                
  0da0  90               nop                                      
  0da1  0e               push cs                                  
  0da2  e83d04           call 0x11e2                              
  0da5  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0daa  5f               pop di                                   
  0dab  5e               pop si                                   
  0dac  c9               leave                                    
  0dad  cb               retf                                     

ovl44_0dae:  ; ENTRY
  0dae  55               push bp                                  
  0daf  8bec             mov bp, sp                               
  0db1  83ec02           sub sp, 2                                
  0db4  56               push si                                  
  0db5  57               push di                                  
  0db6  90               nop                                      
  0db7  0e               push cs                                  
  0db8  e86d03           call 0x1128                              
  0dbb  66688c010100     push 0x1018c                             
  0dc1  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0dc6  83c404           add sp, 4                                
  0dc9  8b1e980e         mov bx, word ptr [0xe98]                 
  0dcd  6bdb41           imul bx, bx, 0x41                        
  0dd0  b8042c           mov ax, 0x2c04                           
  0dd3  8ec0             mov es, ax                               
  0dd5  2680bf961500     cmp byte ptr es:[bx + 0x1596], 0         
  0ddb  7c1c             jl 0xdf9                                 
  0ddd  33f6             xor si, si                               
  0ddf  eb11             jmp 0xdf2                                
  0de1  6a01             push 1                                   
  0de3  8bc6             mov ax, si                               
  0de5  058d01           add ax, 0x18d                            
  0de8  50               push ax                                  
  0de9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0dee  83c404           add sp, 4                                
  0df1  46               inc si                                   
  0df2  83fe04           cmp si, 4                                
  0df5  7cea             jl 0xde1                                 
  0df7  eb1a             jmp 0xe13                                
  0df9  33f6             xor si, si                               
  0dfb  eb11             jmp 0xe0e                                
  0dfd  6a02             push 2                                   
  0dff  8bc6             mov ax, si                               
  0e01  058d01           add ax, 0x18d                            
  0e04  50               push ax                                  
  0e05  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0e0a  83c404           add sp, 4                                
  0e0d  46               inc si                                   
  0e0e  83fe04           cmp si, 4                                
  0e11  7cea             jl 0xdfd                                 
  0e13  33f6             xor si, si                               
  0e15  c746fe0000       mov word ptr [bp - 2], 0                 
  0e1a  e99c00           jmp 0xeb9                                
  0e1d  8bc6             mov ax, si                               
  0e1f  6bc03e           imul ax, ax, 0x3e                        
  0e22  c41e7c44         les bx, ptr [0x447c]                     
  0e26  03d8             add bx, ax                               
  0e28  26837f1e00       cmp word ptr es:[bx + 0x1e], 0           
  0e2d  7d03             jge 0xe32                                
  0e2f  e98600           jmp 0xeb8                                
  0e32  33ff             xor di, di                               
  0e34  eb38             jmp 0xe6e                                
  0e36  8b1e980e         mov bx, word ptr [0xe98]                 
  0e3a  6bdb41           imul bx, bx, 0x41                        
  0e3d  03df             add bx, di                               
  0e3f  b8042c           mov ax, 0x2c04                           
  0e42  8ec0             mov es, ax                               
  0e44  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0e49  98               cwde                                     
  0e4a  8bd6             mov dx, si                               
  0e4c  6bd23e           imul dx, dx, 0x3e                        
  0e4f  c41e7c44         les bx, ptr [0x447c]                     
  0e53  03da             add bx, dx                               
  0e55  263b07           cmp ax, word ptr es:[bx]                 
  0e58  7513             jne 0xe6d                                
  0e5a  6a02             push 2                                   
  0e5c  8b46fe           mov ax, word ptr [bp - 2]                
  0e5f  059101           add ax, 0x191                            
  0e62  50               push ax                                  
  0e63  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0e68  83c404           add sp, 4                                
  0e6b  eb06             jmp 0xe73                                
  0e6d  47               inc di                                   
  0e6e  83ff04           cmp di, 4                                
  0e71  7cc3             jl 0xe36                                 
  0e73  83ff04           cmp di, 4                                
  0e76  7c3d             jl 0xeb5                                 
  0e78  b8042c           mov ax, 0x2c04                           
  0e7b  8ec0             mov es, ax                               
  0e7d  268b1e1001       mov bx, word ptr es:[0x110]              
  0e82  6bdb14           imul bx, bx, 0x14                        
  0e85  b8042c           mov ax, 0x2c04                           
  0e88  8ec0             mov es, ax                               
  0e8a  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0e8f  8bd6             mov dx, si                               
  0e91  6bd23e           imul dx, dx, 0x3e                        
  0e94  c41e7c44         les bx, ptr [0x447c]                     
  0e98  03da             add bx, dx                               
  0e9a  263b471e         cmp ax, word ptr es:[bx + 0x1e]          
  0e9e  7d04             jge 0xea4                                
  0ea0  6a02             push 2                                   
  0ea2  eb02             jmp 0xea6                                
  0ea4  6a01             push 1                                   
  0ea6  8b46fe           mov ax, word ptr [bp - 2]                
  0ea9  059101           add ax, 0x191                            
  0eac  50               push ax                                  
  0ead  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0eb2  83c404           add sp, 4                                
  0eb5  ff46fe           inc word ptr [bp - 2]                    
  0eb8  46               inc si                                   
  0eb9  83fe1c           cmp si, 0x1c                             
  0ebc  7d03             jge 0xec1                                
  0ebe  e95cff           jmp 0xe1d                                
  0ec1  90               nop                                      
  0ec2  0e               push cs                                  
  0ec3  e81c03           call 0x11e2                              
  0ec6  5f               pop di                                   
  0ec7  5e               pop si                                   
  0ec8  c9               leave                                    
  0ec9  cb               retf                                     

ovl44_0eca:  ; ENTRY
  0eca  55               push bp                                  
  0ecb  8bec             mov bp, sp                               
  0ecd  ff36980e         push word ptr [0xe98]                    
  0ed1  90               nop                                      
  0ed2  0e               push cs                                  
  0ed3  e86e06           call 0x1544                              
  0ed6  59               pop cx                                   
  0ed7  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0edc  9a3e006430       lcall 0x3064, 0x3e                       -> ovl45:0393
  0ee1  5d               pop bp                                   
  0ee2  cb               retf                                     

ovl44_0ee3:  ; ENTRY
  0ee3  55               push bp                                  
  0ee4  8bec             mov bp, sp                               
  0ee6  83ec02           sub sp, 2                                
  0ee9  56               push si                                  
  0eea  8b7606           mov si, word ptr [bp + 6]                
  0eed  90               nop                                      
  0eee  0e               push cs                                  
  0eef  e83602           call 0x1128                              
  0ef2  33d2             xor dx, dx                               
  0ef4  33c9             xor cx, cx                               
  0ef6  eb1c             jmp 0xf14                                
  0ef8  8bc2             mov ax, dx                               
  0efa  6bc03e           imul ax, ax, 0x3e                        
  0efd  c41e7c44         les bx, ptr [0x447c]                     
  0f01  03d8             add bx, ax                               
  0f03  26837f1e00       cmp word ptr es:[bx + 0x1e], 0           
  0f08  7c09             jl 0xf13                                 
  0f0a  3bce             cmp cx, si                               
  0f0c  7504             jne 0xf12                                
  0f0e  8bf2             mov si, dx                               
  0f10  eb07             jmp 0xf19                                
  0f12  41               inc cx                                   
  0f13  42               inc dx                                   
  0f14  83fa1c           cmp dx, 0x1c                             
  0f17  7cdf             jl 0xef8                                 
  0f19  8b1e980e         mov bx, word ptr [0xe98]                 
  0f1d  6bdb41           imul bx, bx, 0x41                        
  0f20  b8042c           mov ax, 0x2c04                           
  0f23  8ec0             mov es, ax                               
  0f25  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  0f2a  98               cwde                                     
  0f2b  8946fe           mov word ptr [bp - 2], ax                
  0f2e  8bc6             mov ax, si                               
  0f30  6bc03e           imul ax, ax, 0x3e                        
  0f33  c41e7c44         les bx, ptr [0x447c]                     
  0f37  03d8             add bx, ax                               
  0f39  268a07           mov al, byte ptr es:[bx]                 
  0f3c  8b1e980e         mov bx, word ptr [0xe98]                 
  0f40  6bdb41           imul bx, bx, 0x41                        
  0f43  031e860e         add bx, word ptr [0xe86]                 
  0f47  ba042c           mov dx, 0x2c04                           
  0f4a  8ec2             mov es, dx                               
  0f4c  2688879315       mov byte ptr es:[bx + 0x1593], al        
  0f51  8bc6             mov ax, si                               
  0f53  6bc03e           imul ax, ax, 0x3e                        
  0f56  c41e7c44         les bx, ptr [0x447c]                     
  0f5a  03d8             add bx, ax                               
  0f5c  268a4718         mov al, byte ptr es:[bx + 0x18]          
  0f60  8b1e980e         mov bx, word ptr [0xe98]                 
  0f64  6bdb41           imul bx, bx, 0x41                        
  0f67  031e860e         add bx, word ptr [0xe86]                 
  0f6b  ba042c           mov dx, 0x2c04                           
  0f6e  8ec2             mov es, dx                               
  0f70  2688879715       mov byte ptr es:[bx + 0x1597], al        
  0f75  8bc6             mov ax, si                               
  0f77  6bc03e           imul ax, ax, 0x3e                        
  0f7a  c41e7c44         les bx, ptr [0x447c]                     
  0f7e  03d8             add bx, ax                               
  0f80  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  0f84  8b1e980e         mov bx, word ptr [0xe98]                 
  0f88  6bdb41           imul bx, bx, 0x41                        
  0f8b  031e860e         add bx, word ptr [0xe86]                 
  0f8f  ba042c           mov dx, 0x2c04                           
  0f92  8ec2             mov es, dx                               
  0f94  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  0f99  8bc6             mov ax, si                               
  0f9b  6bc03e           imul ax, ax, 0x3e                        
  0f9e  c41e7c44         les bx, ptr [0x447c]                     
  0fa2  03d8             add bx, ax                               
  0fa4  268a4716         mov al, byte ptr es:[bx + 0x16]          
  0fa8  8b1e980e         mov bx, word ptr [0xe98]                 
  0fac  6bdb41           imul bx, bx, 0x41                        
  0faf  031e860e         add bx, word ptr [0xe86]                 
  0fb3  ba042c           mov dx, 0x2c04                           
  0fb6  8ec2             mov es, dx                               
  0fb8  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  0fbd  8bc6             mov ax, si                               
  0fbf  6bc03e           imul ax, ax, 0x3e                        
  0fc2  c41e7c44         les bx, ptr [0x447c]                     
  0fc6  03d8             add bx, ax                               
  0fc8  268a471c         mov al, byte ptr es:[bx + 0x1c]          
  0fcc  8b1e980e         mov bx, word ptr [0xe98]                 
  0fd0  6bdb41           imul bx, bx, 0x41                        
  0fd3  031e860e         add bx, word ptr [0xe86]                 
  0fd7  ba042c           mov dx, 0x2c04                           
  0fda  8ec2             mov es, dx                               
  0fdc  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  0fe1  ff36980e         push word ptr [0xe98]                    
  0fe5  0e               push cs                                  
  0fe6  e847f9           call 0x930                               
  0fe9  59               pop cx                                   
  0fea  8b1e980e         mov bx, word ptr [0xe98]                 
  0fee  6bdb41           imul bx, bx, 0x41                        
  0ff1  ba042c           mov dx, 0x2c04                           
  0ff4  8ec2             mov es, dx                               
  0ff6  2688879115       mov byte ptr es:[bx + 0x1591], al        
  0ffb  b8042c           mov ax, 0x2c04                           
  0ffe  8ec0             mov es, ax                               
  1000  268b1e1001       mov bx, word ptr es:[0x110]              
  1005  6bdb14           imul bx, bx, 0x14                        
  1008  b8042c           mov ax, 0x2c04                           
  100b  8bd6             mov dx, si                               
  100d  6bd23e           imul dx, dx, 0x3e                        
  1010  c4367c44         les si, ptr [0x447c]                     
  1014  03f2             add si, dx                               
  1016  268b541e         mov dx, word ptr es:[si + 0x1e]          
  101a  8ec0             mov es, ax                               
  101c  2629978501       sub word ptr es:[bx + 0x185], dx         
  1021  90               nop                                      
  1022  0e               push cs                                  
  1023  e8bc01           call 0x11e2                              
  1026  8b1e980e         mov bx, word ptr [0xe98]                 
  102a  6bdb41           imul bx, bx, 0x41                        
  102d  b8042c           mov ax, 0x2c04                           
  1030  8ec0             mov es, ax                               
  1032  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  1038  7f03             jg 0x103d                                
  103a  e98b00           jmp 0x10c8                               
  103d  33c9             xor cx, cx                               
  103f  33d2             xor dx, dx                               
  1041  eb1f             jmp 0x1062                               
  1043  8b1e980e         mov bx, word ptr [0xe98]                 
  1047  6bdb41           imul bx, bx, 0x41                        
  104a  03da             add bx, dx                               
  104c  b8042c           mov ax, 0x2c04                           
  104f  8ec0             mov es, ax                               
  1051  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1056  98               cwde                                     
  1057  3b46fe           cmp ax, word ptr [bp - 2]                
  105a  7505             jne 0x1061                               
  105c  b90100           mov cx, 1                                
  105f  eb06             jmp 0x1067                               
  1061  42               inc dx                                   
  1062  83fa04           cmp dx, 4                                
  1065  7cdc             jl 0x1043                                
  1067  0bc9             or cx, cx                                
  1069  755d             jne 0x10c8                               
  106b  8b1e980e         mov bx, word ptr [0xe98]                 
  106f  6bdb41           imul bx, bx, 0x41                        
  1072  b8042c           mov ax, 0x2c04                           
  1075  8ec0             mov es, ax                               
  1077  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  107d  8b1e980e         mov bx, word ptr [0xe98]                 
  1081  6bdb41           imul bx, bx, 0x41                        
  1084  b8042c           mov ax, 0x2c04                           
  1087  8ec0             mov es, ax                               
  1089  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  1090  8b1e980e         mov bx, word ptr [0xe98]                 
  1094  6bdb41           imul bx, bx, 0x41                        
  1097  b8042c           mov ax, 0x2c04                           
  109a  8ec0             mov es, ax                               
  109c  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  10a3  8b1e980e         mov bx, word ptr [0xe98]                 
  10a7  6bdb41           imul bx, bx, 0x41                        
  10aa  b8042c           mov ax, 0x2c04                           
  10ad  8ec0             mov es, ax                               
  10af  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  10b6  8b1e980e         mov bx, word ptr [0xe98]                 
  10ba  6bdb41           imul bx, bx, 0x41                        
  10bd  b8042c           mov ax, 0x2c04                           
  10c0  8ec0             mov es, ax                               
  10c2  26c687a915ff     mov byte ptr es:[bx + 0x15a9], 0xff      
  10c8  833e860e03       cmp word ptr [0xe86], 3                  
  10cd  7d1c             jge 0x10eb                               
  10cf  8b1e980e         mov bx, word ptr [0xe98]                 
  10d3  6bdb41           imul bx, bx, 0x41                        
  10d6  031e860e         add bx, word ptr [0xe86]                 
  10da  b8042c           mov ax, 0x2c04                           
  10dd  8ec0             mov es, ax                               
  10df  2680bf941500     cmp byte ptr es:[bx + 0x1594], 0         
  10e5  7d04             jge 0x10eb                               
  10e7  ff06860e         inc word ptr [0xe86]                     
  10eb  b8042c           mov ax, 0x2c04                           
  10ee  8ec0             mov es, ax                               
  10f0  268b1e1001       mov bx, word ptr es:[0x110]              
  10f5  d1e3             shl bx, 1                                
  10f7  b8042c           mov ax, 0x2c04                           
  10fa  8ec0             mov es, ax                               
  10fc  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1102  750b             jne 0x110f                               
  1104  6a00             push 0                                   
  1106  0e               push cs                                  
  1107  e8d0f8           call 0x9da                               
  110a  59               pop cx                                   
  110b  0e               push cs                                  
  110c  e89ffc           call 0xdae                               
  110f  5e               pop si                                   
  1110  c9               leave                                    
  1111  cb               retf                                     

ovl44_1112:  ; ENTRY
  1112  55               push bp                                  
  1113  8bec             mov bp, sp                               
  1115  8b4606           mov ax, word ptr [bp + 6]                
  1118  a3860e           mov word ptr [0xe86], ax                 
  111b  6a01             push 1                                   
  111d  0e               push cs                                  
  111e  e8b9f8           call 0x9da                               
  1121  59               pop cx                                   
  1122  0e               push cs                                  
  1123  e888fc           call 0xdae                               
  1126  5d               pop bp                                   
  1127  cb               retf                                     

ovl44_1128:  ; ENTRY
  1128  55               push bp                                  
  1129  8bec             mov bp, sp                               
  112b  83ec02           sub sp, 2                                
  112e  56               push si                                  
  112f  66833e880e00     cmp dword ptr [0xe88], 0                 
  1135  7403             je 0x113a                                
  1137  e99100           jmp 0x11cb                               
  113a  b8042c           mov ax, 0x2c04                           
  113d  8ec0             mov es, ax                               
  113f  26ff366101       push word ptr es:[0x161]                 
  1144  ff36c426         push word ptr [0x26c4]                   
  1148  6a15             push 0x15                                
  114a  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  114f  83c404           add sp, 4                                
  1152  52               push dx                                  
  1153  50               push ax                                  
  1154  1e               push ds                                  
  1155  68385c           push 0x5c38                              
  1158  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  115d  83c40a           add sp, 0xa                              
  1160  6a02             push 2                                   
  1162  1e               push ds                                  
  1163  68385c           push 0x5c38                              
  1166  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  116b  83c406           add sp, 6                                
  116e  8bf0             mov si, ax                               
  1170  50               push ax                                  
  1171  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  1176  59               pop cx                                   
  1177  8946fe           mov word ptr [bp - 2], ax                
  117a  6668de000000     push 0xde                                
  1180  6a00             push 0                                   
  1182  660fbf46fe       movsx eax, word ptr [bp - 2]             
  1187  6650             push eax                                 
  1189  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  118e  83c40a           add sp, 0xa                              
  1191  89168a0e         mov word ptr [0xe8a], dx                 
  1195  a3880e           mov word ptr [0xe88], ax                 
  1198  52               push dx                                  
  1199  50               push ax                                  
  119a  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  119f  83c404           add sp, 4                                
  11a2  89167e44         mov word ptr [0x447e], dx                
  11a6  a37c44           mov word ptr [0x447c], ax                
  11a9  680607           push 0x706                               
  11ac  52               push dx                                  
  11ad  50               push ax                                  
  11ae  56               push si                                  
  11af  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  11b4  83c408           add sp, 8                                
  11b7  56               push si                                  
  11b8  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  11bd  59               pop cx                                   
  11be  66ff36880e       push dword ptr [0xe88]                   
  11c3  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  11c8  83c404           add sp, 4                                
  11cb  66ff36880e       push dword ptr [0xe88]                   
  11d0  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  11d5  83c404           add sp, 4                                
  11d8  89167e44         mov word ptr [0x447e], dx                
  11dc  a37c44           mov word ptr [0x447c], ax                
  11df  5e               pop si                                   
  11e0  c9               leave                                    
  11e1  cb               retf                                     

ovl44_11e2:  ; ENTRY
  11e2  55               push bp                                  
  11e3  8bec             mov bp, sp                               
  11e5  66ff36880e       push dword ptr [0xe88]                   
  11ea  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  11ef  83c404           add sp, 4                                
  11f2  5d               pop bp                                   
  11f3  cb               retf                                     

ovl44_11f4:  ; ENTRY
  11f4  55               push bp                                  
  11f5  8bec             mov bp, sp                               
  11f7  83ec04           sub sp, 4                                
  11fa  56               push si                                  
  11fb  8b7608           mov si, word ptr [bp + 8]                
  11fe  0e               push cs                                  
  11ff  e826ff           call 0x1128                              
  1202  33d2             xor dx, dx                               
  1204  33c9             xor cx, cx                               
  1206  eb1c             jmp 0x1224                               
  1208  8bc2             mov ax, dx                               
  120a  6bc03e           imul ax, ax, 0x3e                        
  120d  c41e7c44         les bx, ptr [0x447c]                     
  1211  03d8             add bx, ax                               
  1213  26837f1e00       cmp word ptr es:[bx + 0x1e], 0           
  1218  7c09             jl 0x1223                                
  121a  3bce             cmp cx, si                               
  121c  7504             jne 0x1222                               
  121e  8bf2             mov si, dx                               
  1220  eb07             jmp 0x1229                               
  1222  41               inc cx                                   
  1223  42               inc dx                                   
  1224  83fa1c           cmp dx, 0x1c                             
  1227  7cdf             jl 0x1208                                
  1229  837e0600         cmp word ptr [bp + 6], 0                 
  122d  7463             je 0x1292                                
  122f  16               push ss                                  
  1230  8d46fc           lea ax, [bp - 4]                         
  1233  50               push ax                                  
  1234  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  1239  83c404           add sp, 4                                
  123c  66ff76fc         push dword ptr [bp - 4]                  
  1240  8bc6             mov ax, si                               
  1242  6bc03e           imul ax, ax, 0x3e                        
  1245  c41e7c44         les bx, ptr [0x447c]                     
  1249  03d8             add bx, ax                               
  124b  26ff771c         push word ptr es:[bx + 0x1c]             
  124f  8bc6             mov ax, si                               
  1251  6bc03e           imul ax, ax, 0x3e                        
  1254  8b1e7c44         mov bx, word ptr [0x447c]                
  1258  03d8             add bx, ax                               
  125a  26ff771a         push word ptr es:[bx + 0x1a]             
  125e  8bc6             mov ax, si                               
  1260  6bc03e           imul ax, ax, 0x3e                        
  1263  8b1e7c44         mov bx, word ptr [0x447c]                
  1267  03d8             add bx, ax                               
  1269  26ff7716         push word ptr es:[bx + 0x16]             
  126d  8bc6             mov ax, si                               
  126f  6bc03e           imul ax, ax, 0x3e                        
  1272  8b1e7c44         mov bx, word ptr [0x447c]                
  1276  03d8             add bx, ax                               
  1278  26ff7718         push word ptr es:[bx + 0x18]             
  127c  8bc6             mov ax, si                               
  127e  6bc03e           imul ax, ax, 0x3e                        
  1281  8b1e7c44         mov bx, word ptr [0x447c]                
  1285  03d8             add bx, ax                               
  1287  26ff37           push word ptr es:[bx]                    
  128a  9a3e006c30       lcall 0x306c, 0x3e                       -> ovl46:032a
  128f  83c40e           add sp, 0xe                              
  1292  0e               push cs                                  
  1293  e84cff           call 0x11e2                              
  1296  5e               pop si                                   
  1297  c9               leave                                    
  1298  cb               retf                                     

ovl44_1299:  ; ENTRY
  1299  55               push bp                                  
  129a  8bec             mov bp, sp                               
  129c  56               push si                                  
  129d  57               push di                                  
  129e  8b7606           mov si, word ptr [bp + 6]                
  12a1  8b7e0a           mov di, word ptr [bp + 0xa]              
  12a4  0e               push cs                                  
  12a5  e880fe           call 0x1128                              
  12a8  8bc7             mov ax, di                               
  12aa  6bc03e           imul ax, ax, 0x3e                        
  12ad  c41e7c44         les bx, ptr [0x447c]                     
  12b1  03d8             add bx, ax                               
  12b3  268a07           mov al, byte ptr es:[bx]                 
  12b6  8bde             mov bx, si                               
  12b8  6bdb41           imul bx, bx, 0x41                        
  12bb  035e08           add bx, word ptr [bp + 8]                
  12be  ba042c           mov dx, 0x2c04                           
  12c1  8ec2             mov es, dx                               
  12c3  2688879315       mov byte ptr es:[bx + 0x1593], al        
  12c8  8bc7             mov ax, di                               
  12ca  6bc03e           imul ax, ax, 0x3e                        
  12cd  c41e7c44         les bx, ptr [0x447c]                     
  12d1  03d8             add bx, ax                               
  12d3  268a4718         mov al, byte ptr es:[bx + 0x18]          
  12d7  8bde             mov bx, si                               
  12d9  6bdb41           imul bx, bx, 0x41                        
  12dc  035e08           add bx, word ptr [bp + 8]                
  12df  ba042c           mov dx, 0x2c04                           
  12e2  8ec2             mov es, dx                               
  12e4  2688879715       mov byte ptr es:[bx + 0x1597], al        
  12e9  8bc7             mov ax, di                               
  12eb  6bc03e           imul ax, ax, 0x3e                        
  12ee  c41e7c44         les bx, ptr [0x447c]                     
  12f2  03d8             add bx, ax                               
  12f4  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  12f8  8bde             mov bx, si                               
  12fa  6bdb41           imul bx, bx, 0x41                        
  12fd  035e08           add bx, word ptr [bp + 8]                
  1300  ba042c           mov dx, 0x2c04                           
  1303  8ec2             mov es, dx                               
  1305  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  130a  8bc7             mov ax, di                               
  130c  6bc03e           imul ax, ax, 0x3e                        
  130f  c41e7c44         les bx, ptr [0x447c]                     
  1313  03d8             add bx, ax                               
  1315  268a4716         mov al, byte ptr es:[bx + 0x16]          
  1319  8bde             mov bx, si                               
  131b  6bdb41           imul bx, bx, 0x41                        
  131e  035e08           add bx, word ptr [bp + 8]                
  1321  ba042c           mov dx, 0x2c04                           
  1324  8ec2             mov es, dx                               
  1326  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  132b  8bc7             mov ax, di                               
  132d  6bc03e           imul ax, ax, 0x3e                        
  1330  c41e7c44         les bx, ptr [0x447c]                     
  1334  03d8             add bx, ax                               
  1336  268a471c         mov al, byte ptr es:[bx + 0x1c]          
  133a  8bde             mov bx, si                               
  133c  6bdb41           imul bx, bx, 0x41                        
  133f  035e08           add bx, word ptr [bp + 8]                
  1342  ba042c           mov dx, 0x2c04                           
  1345  8ec2             mov es, dx                               
  1347  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  134c  56               push si                                  
  134d  0e               push cs                                  
  134e  e8dff5           call 0x930                               
  1351  59               pop cx                                   
  1352  8bde             mov bx, si                               
  1354  6bdb41           imul bx, bx, 0x41                        
  1357  ba042c           mov dx, 0x2c04                           
  135a  8ec2             mov es, dx                               
  135c  2688879115       mov byte ptr es:[bx + 0x1591], al        
  1361  b8042c           mov ax, 0x2c04                           
  1364  8ec0             mov es, ax                               
  1366  268b1e1001       mov bx, word ptr es:[0x110]              
  136b  6bdb14           imul bx, bx, 0x14                        
  136e  b8042c           mov ax, 0x2c04                           
  1371  8bd7             mov dx, di                               
  1373  6bd23e           imul dx, dx, 0x3e                        
  1376  c4367c44         les si, ptr [0x447c]                     
  137a  03f2             add si, dx                               
  137c  268b541e         mov dx, word ptr es:[si + 0x1e]          
  1380  8ec0             mov es, ax                               
  1382  2629978501       sub word ptr es:[bx + 0x185], dx         
  1387  0e               push cs                                  
  1388  e857fe           call 0x11e2                              
  138b  5f               pop di                                   
  138c  5e               pop si                                   
  138d  5d               pop bp                                   
  138e  cb               retf                                     

ovl44_138f:  ; ENTRY
  138f  55               push bp                                  
  1390  8bec             mov bp, sp                               
  1392  56               push si                                  
  1393  0e               push cs                                  
  1394  e891fd           call 0x1128                              
  1397  33f6             xor si, si                               
  1399  e97f00           jmp 0x141b                               
  139c  8bc6             mov ax, si                               
  139e  6bc03e           imul ax, ax, 0x3e                        
  13a1  c41e7c44         les bx, ptr [0x447c]                     
  13a5  03d8             add bx, ax                               
  13a7  268b07           mov ax, word ptr es:[bx]                 
  13aa  3b4606           cmp ax, word ptr [bp + 6]                
  13ad  756b             jne 0x141a                               
  13af  8bc6             mov ax, si                               
  13b1  6bc03e           imul ax, ax, 0x3e                        
  13b4  8b1e7c44         mov bx, word ptr [0x447c]                
  13b8  03d8             add bx, ax                               
  13ba  268b471e         mov ax, word ptr es:[bx + 0x1e]          
  13be  c45e14           les bx, ptr [bp + 0x14]                  
  13c1  268907           mov word ptr es:[bx], ax                 
  13c4  8bc6             mov ax, si                               
  13c6  6bc03e           imul ax, ax, 0x3e                        
  13c9  c41e7c44         les bx, ptr [0x447c]                     
  13cd  03d8             add bx, ax                               
  13cf  268b4718         mov ax, word ptr es:[bx + 0x18]          
  13d3  c45e08           les bx, ptr [bp + 8]                     
  13d6  268907           mov word ptr es:[bx], ax                 
  13d9  8bc6             mov ax, si                               
  13db  6bc03e           imul ax, ax, 0x3e                        
  13de  c41e7c44         les bx, ptr [0x447c]                     
  13e2  03d8             add bx, ax                               
  13e4  268b4716         mov ax, word ptr es:[bx + 0x16]          
  13e8  c45e0c           les bx, ptr [bp + 0xc]                   
  13eb  268907           mov word ptr es:[bx], ax                 
  13ee  8bc6             mov ax, si                               
  13f0  6bc03e           imul ax, ax, 0x3e                        
  13f3  c41e7c44         les bx, ptr [0x447c]                     
  13f7  03d8             add bx, ax                               
  13f9  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  13fd  c45e10           les bx, ptr [bp + 0x10]                  
  1400  268907           mov word ptr es:[bx], ax                 
  1403  8bc6             mov ax, si                               
  1405  6bc03e           imul ax, ax, 0x3e                        
  1408  c41e7c44         les bx, ptr [0x447c]                     
  140c  03d8             add bx, ax                               
  140e  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  1412  c45e18           les bx, ptr [bp + 0x18]                  
  1415  268907           mov word ptr es:[bx], ax                 
  1418  eb09             jmp 0x1423                               
  141a  46               inc si                                   
  141b  83fe1d           cmp si, 0x1d                             
  141e  7d03             jge 0x1423                               
  1420  e979ff           jmp 0x139c                               
  1423  0e               push cs                                  
  1424  e8bbfd           call 0x11e2                              
  1427  8bc6             mov ax, si                               
  1429  5e               pop si                                   
  142a  5d               pop bp                                   
  142b  cb               retf                                     

ovl44_142c:  ; ENTRY
  142c  55               push bp                                  
  142d  8bec             mov bp, sp                               
  142f  0e               push cs                                  
  1430  e8f5fc           call 0x1128                              
  1433  33d2             xor dx, dx                               
  1435  eb6a             jmp 0x14a1                               
  1437  8bc2             mov ax, dx                               
  1439  6bc03e           imul ax, ax, 0x3e                        
  143c  c41e7c44         les bx, ptr [0x447c]                     
  1440  03d8             add bx, ax                               
  1442  268b07           mov ax, word ptr es:[bx]                 
  1445  3b4606           cmp ax, word ptr [bp + 6]                
  1448  7556             jne 0x14a0                               
  144a  8bc2             mov ax, dx                               
  144c  6bc03e           imul ax, ax, 0x3e                        
  144f  8b1e7c44         mov bx, word ptr [0x447c]                
  1453  03d8             add bx, ax                               
  1455  268b4718         mov ax, word ptr es:[bx + 0x18]          
  1459  c45e08           les bx, ptr [bp + 8]                     
  145c  268907           mov word ptr es:[bx], ax                 
  145f  8bc2             mov ax, dx                               
  1461  6bc03e           imul ax, ax, 0x3e                        
  1464  c41e7c44         les bx, ptr [0x447c]                     
  1468  03d8             add bx, ax                               
  146a  268b4716         mov ax, word ptr es:[bx + 0x16]          
  146e  c45e0c           les bx, ptr [bp + 0xc]                   
  1471  268907           mov word ptr es:[bx], ax                 
  1474  8bc2             mov ax, dx                               
  1476  6bc03e           imul ax, ax, 0x3e                        
  1479  c41e7c44         les bx, ptr [0x447c]                     
  147d  03d8             add bx, ax                               
  147f  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  1483  c45e10           les bx, ptr [bp + 0x10]                  
  1486  268907           mov word ptr es:[bx], ax                 
  1489  8bc2             mov ax, dx                               
  148b  6bc03e           imul ax, ax, 0x3e                        
  148e  c41e7c44         les bx, ptr [0x447c]                     
  1492  03d8             add bx, ax                               
  1494  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  1498  c45e14           les bx, ptr [bp + 0x14]                  
  149b  268907           mov word ptr es:[bx], ax                 
  149e  eb06             jmp 0x14a6                               
  14a0  42               inc dx                                   
  14a1  83fa1d           cmp dx, 0x1d                             
  14a4  7c91             jl 0x1437                                
  14a6  0e               push cs                                  
  14a7  e838fd           call 0x11e2                              
  14aa  5d               pop bp                                   
  14ab  cb               retf                                     

ovl44_14ac:  ; ENTRY
  14ac  55               push bp                                  
  14ad  8bec             mov bp, sp                               
  14af  0e               push cs                                  
  14b0  e875fc           call 0x1128                              
  14b3  33d2             xor dx, dx                               
  14b5  eb32             jmp 0x14e9                               
  14b7  8bc2             mov ax, dx                               
  14b9  6bc03e           imul ax, ax, 0x3e                        
  14bc  c41e7c44         les bx, ptr [0x447c]                     
  14c0  03d8             add bx, ax                               
  14c2  268b07           mov ax, word ptr es:[bx]                 
  14c5  3b4606           cmp ax, word ptr [bp + 6]                
  14c8  751e             jne 0x14e8                               
  14ca  66ff7608         push dword ptr [bp + 8]                  
  14ce  8bc2             mov ax, dx                               
  14d0  6bc03e           imul ax, ax, 0x3e                        
  14d3  8b167c44         mov dx, word ptr [0x447c]                
  14d7  03d0             add dx, ax                               
  14d9  ff367e44         push word ptr [0x447e]                   
  14dd  52               push dx                                  
  14de  b93e00           mov cx, 0x3e                             
  14e1  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  14e6  eb06             jmp 0x14ee                               
  14e8  42               inc dx                                   
  14e9  83fa1d           cmp dx, 0x1d                             
  14ec  7cc9             jl 0x14b7                                
  14ee  0e               push cs                                  
  14ef  e8f0fc           call 0x11e2                              
  14f2  5d               pop bp                                   
  14f3  cb               retf                                     

ovl44_14f4:  ; ENTRY
  14f4  55               push bp                                  
  14f5  8bec             mov bp, sp                               
  14f7  0e               push cs                                  
  14f8  e82dfc           call 0x1128                              
  14fb  33d2             xor dx, dx                               
  14fd  eb35             jmp 0x1534                               
  14ff  8bc2             mov ax, dx                               
  1501  6bc03e           imul ax, ax, 0x3e                        
  1504  c41e7c44         les bx, ptr [0x447c]                     
  1508  03d8             add bx, ax                               
  150a  268b07           mov ax, word ptr es:[bx]                 
  150d  3b4606           cmp ax, word ptr [bp + 6]                
  1510  7521             jne 0x1533                               
  1512  8bc2             mov ax, dx                               
  1514  6bc03e           imul ax, ax, 0x3e                        
  1517  8b167c44         mov dx, word ptr [0x447c]                
  151b  03d0             add dx, ax                               
  151d  83c202           add dx, 2                                
  1520  ff367e44         push word ptr [0x447e]                   
  1524  52               push dx                                  
  1525  1e               push ds                                  
  1526  686844           push 0x4468                              
  1529  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  152e  83c408           add sp, 8                                
  1531  eb06             jmp 0x1539                               
  1533  42               inc dx                                   
  1534  83fa1d           cmp dx, 0x1d                             
  1537  7cc6             jl 0x14ff                                
  1539  0e               push cs                                  
  153a  e8a5fc           call 0x11e2                              
  153d  8cda             mov dx, ds                               
  153f  b86844           mov ax, 0x4468                           
  1542  5d               pop bp                                   
  1543  cb               retf                                     

ovl44_1544:  ; ENTRY
  1544  55               push bp                                  
  1545  8bec             mov bp, sp                               
  1547  83ec52           sub sp, 0x52                             
  154a  56               push si                                  
  154b  57               push di                                  
  154c  8b7606           mov si, word ptr [bp + 6]                
  154f  8bde             mov bx, si                               
  1551  6bdb41           imul bx, bx, 0x41                        
  1554  b8042c           mov ax, 0x2c04                           
  1557  8ec0             mov es, ax                               
  1559  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  155f  7d03             jge 0x1564                               
  1561  e94902           jmp 0x17ad                               
  1564  33ff             xor di, di                               
  1566  eb5a             jmp 0x15c2                               
  1568  8bde             mov bx, si                               
  156a  6bdb41           imul bx, bx, 0x41                        
  156d  03df             add bx, di                               
  156f  b8042c           mov ax, 0x2c04                           
  1572  8ec0             mov es, ax                               
  1574  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1579  98               cwde                                     
  157a  8bdf             mov bx, di                               
  157c  d1e3             shl bx, 1                                
  157e  8d56ee           lea dx, [bp - 0x12]                      
  1581  03da             add bx, dx                               
  1583  368907           mov word ptr ss:[bx], ax                 
  1586  8bdf             mov bx, di                               
  1588  d1e3             shl bx, 1                                
  158a  8d46ee           lea ax, [bp - 0x12]                      
  158d  03d8             add bx, ax                               
  158f  36833f00         cmp word ptr ss:[bx], 0                  
  1593  7c32             jl 0x15c7                                
  1595  16               push ss                                  
  1596  8d46ae           lea ax, [bp - 0x52]                      
  1599  50               push ax                                  
  159a  8bdf             mov bx, di                               
  159c  d1e3             shl bx, 1                                
  159e  8d46ee           lea ax, [bp - 0x12]                      
  15a1  03d8             add bx, ax                               
  15a3  36ff37           push word ptr ss:[bx]                    
  15a6  0e               push cs                                  
  15a7  e802ff           call 0x14ac                              
  15aa  83c406           add sp, 6                                
  15ad  8b46cc           mov ax, word ptr [bp - 0x34]             
  15b0  99               cdq                                      
  15b1  33c2             xor ax, dx                               
  15b3  2bc2             sub ax, dx                               
  15b5  8bdf             mov bx, di                               
  15b7  d1e3             shl bx, 1                                
  15b9  8d56f6           lea dx, [bp - 0xa]                       
  15bc  03da             add bx, dx                               
  15be  368907           mov word ptr ss:[bx], ax                 
  15c1  47               inc di                                   
  15c2  83ff04           cmp di, 4                                
  15c5  7ca1             jl 0x1568                                
  15c7  897eec           mov word ptr [bp - 0x14], di             
  15ca  bf0100           mov di, 1                                
  15cd  e9d501           jmp 0x17a5                               
  15d0  8bcf             mov cx, di                               
  15d2  e9ae01           jmp 0x1783                               
  15d5  8bd9             mov bx, cx                               
  15d7  d1e3             shl bx, 1                                
  15d9  8d46f6           lea ax, [bp - 0xa]                       
  15dc  03d8             add bx, ax                               
  15de  368b07           mov ax, word ptr ss:[bx]                 
  15e1  8946fe           mov word ptr [bp - 2], ax                
  15e4  8bd9             mov bx, cx                               
  15e6  d1e3             shl bx, 1                                
  15e8  8d46f4           lea ax, [bp - 0xc]                       
  15eb  03d8             add bx, ax                               
  15ed  368b07           mov ax, word ptr ss:[bx]                 
  15f0  8bd9             mov bx, cx                               
  15f2  d1e3             shl bx, 1                                
  15f4  8d56f6           lea dx, [bp - 0xa]                       
  15f7  03da             add bx, dx                               
  15f9  368907           mov word ptr ss:[bx], ax                 
  15fc  8bd9             mov bx, cx                               
  15fe  d1e3             shl bx, 1                                
  1600  8d46f4           lea ax, [bp - 0xc]                       
  1603  03d8             add bx, ax                               
  1605  8b46fe           mov ax, word ptr [bp - 2]                
  1608  368907           mov word ptr ss:[bx], ax                 
  160b  8bde             mov bx, si                               
  160d  6bdb41           imul bx, bx, 0x41                        
  1610  03d9             add bx, cx                               
  1612  b8042c           mov ax, 0x2c04                           
  1615  8ec0             mov es, ax                               
  1617  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  161c  98               cwde                                     
  161d  8946fe           mov word ptr [bp - 2], ax                
  1620  8bde             mov bx, si                               
  1622  6bdb41           imul bx, bx, 0x41                        
  1625  03d9             add bx, cx                               
  1627  b8042c           mov ax, 0x2c04                           
  162a  8ec0             mov es, ax                               
  162c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1631  8bde             mov bx, si                               
  1633  6bdb41           imul bx, bx, 0x41                        
  1636  03d9             add bx, cx                               
  1638  ba042c           mov dx, 0x2c04                           
  163b  8ec2             mov es, dx                               
  163d  2688879315       mov byte ptr es:[bx + 0x1593], al        
  1642  8bde             mov bx, si                               
  1644  6bdb41           imul bx, bx, 0x41                        
  1647  03d9             add bx, cx                               
  1649  b8042c           mov ax, 0x2c04                           
  164c  8a56fe           mov dl, byte ptr [bp - 2]                
  164f  8ec0             mov es, ax                               
  1651  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  1656  8bde             mov bx, si                               
  1658  6bdb41           imul bx, bx, 0x41                        
  165b  03d9             add bx, cx                               
  165d  b8042c           mov ax, 0x2c04                           
  1660  8ec0             mov es, ax                               
  1662  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  1667  98               cwde                                     
  1668  8946fe           mov word ptr [bp - 2], ax                
  166b  8bde             mov bx, si                               
  166d  6bdb41           imul bx, bx, 0x41                        
  1670  03d9             add bx, cx                               
  1672  b8042c           mov ax, 0x2c04                           
  1675  8ec0             mov es, ax                               
  1677  268a879a15       mov al, byte ptr es:[bx + 0x159a]        
  167c  8bde             mov bx, si                               
  167e  6bdb41           imul bx, bx, 0x41                        
  1681  03d9             add bx, cx                               
  1683  ba042c           mov dx, 0x2c04                           
  1686  8ec2             mov es, dx                               
  1688  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  168d  8bde             mov bx, si                               
  168f  6bdb41           imul bx, bx, 0x41                        
  1692  03d9             add bx, cx                               
  1694  b8042c           mov ax, 0x2c04                           
  1697  8a56fe           mov dl, byte ptr [bp - 2]                
  169a  8ec0             mov es, ax                               
  169c  2688979a15       mov byte ptr es:[bx + 0x159a], dl        
  16a1  8bde             mov bx, si                               
  16a3  6bdb41           imul bx, bx, 0x41                        
  16a6  03d9             add bx, cx                               
  16a8  b8042c           mov ax, 0x2c04                           
  16ab  8ec0             mov es, ax                               
  16ad  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  16b2  98               cwde                                     
  16b3  8946fe           mov word ptr [bp - 2], ax                
  16b6  8bde             mov bx, si                               
  16b8  6bdb41           imul bx, bx, 0x41                        
  16bb  03d9             add bx, cx                               
  16bd  b8042c           mov ax, 0x2c04                           
  16c0  8ec0             mov es, ax                               
  16c2  268a87a215       mov al, byte ptr es:[bx + 0x15a2]        
  16c7  8bde             mov bx, si                               
  16c9  6bdb41           imul bx, bx, 0x41                        
  16cc  03d9             add bx, cx                               
  16ce  ba042c           mov dx, 0x2c04                           
  16d1  8ec2             mov es, dx                               
  16d3  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  16d8  8bde             mov bx, si                               
  16da  6bdb41           imul bx, bx, 0x41                        
  16dd  03d9             add bx, cx                               
  16df  b8042c           mov ax, 0x2c04                           
  16e2  8a56fe           mov dl, byte ptr [bp - 2]                
  16e5  8ec0             mov es, ax                               
  16e7  268897a215       mov byte ptr es:[bx + 0x15a2], dl        
  16ec  8bde             mov bx, si                               
  16ee  6bdb41           imul bx, bx, 0x41                        
  16f1  03d9             add bx, cx                               
  16f3  b8042c           mov ax, 0x2c04                           
  16f6  8ec0             mov es, ax                               
  16f8  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  16fd  98               cwde                                     
  16fe  8946fe           mov word ptr [bp - 2], ax                
  1701  8bde             mov bx, si                               
  1703  6bdb41           imul bx, bx, 0x41                        
  1706  03d9             add bx, cx                               
  1708  b8042c           mov ax, 0x2c04                           
  170b  8ec0             mov es, ax                               
  170d  268a879e15       mov al, byte ptr es:[bx + 0x159e]        
  1712  8bde             mov bx, si                               
  1714  6bdb41           imul bx, bx, 0x41                        
  1717  03d9             add bx, cx                               
  1719  ba042c           mov dx, 0x2c04                           
  171c  8ec2             mov es, dx                               
  171e  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  1723  8bde             mov bx, si                               
  1725  6bdb41           imul bx, bx, 0x41                        
  1728  03d9             add bx, cx                               
  172a  b8042c           mov ax, 0x2c04                           
  172d  8a56fe           mov dl, byte ptr [bp - 2]                
  1730  8ec0             mov es, ax                               
  1732  2688979e15       mov byte ptr es:[bx + 0x159e], dl        
  1737  8bde             mov bx, si                               
  1739  6bdb41           imul bx, bx, 0x41                        
  173c  03d9             add bx, cx                               
  173e  b8042c           mov ax, 0x2c04                           
  1741  8ec0             mov es, ax                               
  1743  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  1748  98               cwde                                     
  1749  8946fe           mov word ptr [bp - 2], ax                
  174c  8bde             mov bx, si                               
  174e  6bdb41           imul bx, bx, 0x41                        
  1751  03d9             add bx, cx                               
  1753  b8042c           mov ax, 0x2c04                           
  1756  8ec0             mov es, ax                               
  1758  268a879615       mov al, byte ptr es:[bx + 0x1596]        
  175d  8bde             mov bx, si                               
  175f  6bdb41           imul bx, bx, 0x41                        
  1762  03d9             add bx, cx                               
  1764  ba042c           mov dx, 0x2c04                           
  1767  8ec2             mov es, dx                               
  1769  2688879715       mov byte ptr es:[bx + 0x1597], al        
  176e  8bde             mov bx, si                               
  1770  6bdb41           imul bx, bx, 0x41                        
  1773  03d9             add bx, cx                               
  1775  b8042c           mov ax, 0x2c04                           
  1778  8a56fe           mov dl, byte ptr [bp - 2]                
  177b  8ec0             mov es, ax                               
  177d  2688979615       mov byte ptr es:[bx + 0x1596], dl        
  1782  49               dec cx                                   
  1783  0bc9             or cx, cx                                
  1785  7e1d             jle 0x17a4                               
  1787  8bd9             mov bx, cx                               
  1789  d1e3             shl bx, 1                                
  178b  8d46f6           lea ax, [bp - 0xa]                       
  178e  03d8             add bx, ax                               
  1790  368b07           mov ax, word ptr ss:[bx]                 
  1793  8bd9             mov bx, cx                               
  1795  d1e3             shl bx, 1                                
  1797  8d56f4           lea dx, [bp - 0xc]                       
  179a  03da             add bx, dx                               
  179c  363b07           cmp ax, word ptr ss:[bx]                 
  179f  7d03             jge 0x17a4                               
  17a1  e931fe           jmp 0x15d5                               
  17a4  47               inc di                                   
  17a5  3b7eec           cmp di, word ptr [bp - 0x14]             
  17a8  7d03             jge 0x17ad                               
  17aa  e923fe           jmp 0x15d0                               
  17ad  5f               pop di                                   
  17ae  5e               pop si                                   
  17af  c9               leave                                    
  17b0  cb               retf                                     
